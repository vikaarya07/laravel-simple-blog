<?php

namespace Tests\Feature;

use Tests\TestCase;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Foundation\Testing\RefreshDatabase;

class ProfileTest extends TestCase
{
    use RefreshDatabase;

    public function profile_page_is_displayed()
    {
        $user = User::factory()->create();

        $response = $this->actingAs($user)->get('/admin/profile');

        $response->assertOk();
    }

    public function profile_information_can_be_updated()
    {
        $user = User::factory()->create();

        $response = $this->actingAs($user)->patch('/admin/profile', [
            'name' => 'Updated Name',
            'email' => 'new@example.com',
        ]);

        $response->assertSessionHasNoErrors();
        $response->assertRedirect('/admin/profile');

        $user->refresh();

        $this->assertEquals('Updated Name', $user->name);
        $this->assertEquals('new@example.com', $user->email);
        $this->assertNull($user->email_verified_at);
    }

    public function email_verification_status_is_unchanged_when_email_address_is_unchanged()
    {
        $user = User::factory()->create([
            'email_verified_at' => now(),
        ]);

        $response = $this->actingAs($user)->patch('/admin/profile', [
            'name' => 'Updated Name',
            'email' => $user->email, // sama
        ]);

        $response->assertSessionHasNoErrors();
        $response->assertRedirect('/admin/profile');

        $this->assertNotNull($user->fresh()->email_verified_at);
    }

    public function user_can_delete_their_account()
    {
        $user = User::factory()->create([
            'password' => Hash::make('password'),
        ]);

        $response = $this->actingAs($user)->delete('/admin/profile', [
            'password' => 'password',
        ]);

        $response->assertRedirect('/');

        $this->assertGuest();
        $this->assertDatabaseMissing('users', [
            'id' => $user->id,
        ]);
    }

    public function correct_password_must_be_provided_to_delete_account()
    {
        $user = User::factory()->create([
            'password' => Hash::make('password'),
        ]);

        $response = $this->actingAs($user)->from('/admin/profile')->delete('/admin/profile', [
            'password' => 'wrong-password',
        ]);

        $response->assertRedirect('/admin/profile');
        $response->assertSessionHasErrors('password');

        $this->assertNotNull($user->fresh());
    }
}
