<?php

namespace Tests\Feature;

use Tests\TestCase;
use App\Models\Post;
use App\Models\User;
use PHPUnit\Framework\Attributes\Test;
use Illuminate\Foundation\Testing\RefreshDatabase;

class HomeAndPostsRoutesTest extends TestCase
{
    use RefreshDatabase;

    #[Test]
    protected function authenticate()
    {
        $user = User::factory()->create();
        $this->actingAs($user);
        return $user;
    }

    #[Test]
    public function home_index_route_returns_successful_response()
    {
        $response = $this->get('/');
        $response->assertStatus(200);
    }

    #[Test]
    public function posts_index_route_returns_successful_response()
    {
        $response = $this->get('/posts');
        $response->assertStatus(200);
    }

    #[Test]
    public function posts_create_route_requires_authentication()
    {
        $response = $this->get('/admin/posts/create');
        $response->assertRedirect(route('login'));
    }

    #[Test]
    public function posts_create_route_returns_successful_response_when_authenticated()
    {
        $user = User::factory()->create();

        $this->actingAs($user);

        $response = $this->get('/admin/posts/create');
        $response->assertStatus(200);
    }

    #[Test]
    public function posts_store_route_stores_data_and_redirects()
    {
        $user = User::factory()->create();

        $this->actingAs($user);

        $data = [
            'title' => 'Test Title',
            'content' => 'Test content',
        ];

        $response = $this->post('/admin/posts', $data);

        $response->assertRedirect(route('home'));
        $this->assertDatabaseHas('posts', $data);
    }

    #[Test]
    public function posts_show_route_returns_successful_response()
    {
        $user = User::factory()->create();
        $this->actingAs($user);

        $post = Post::factory()->create([
            'user_id' => $user->id,
            'is_draft' => true,
            'published_at' => now()->addDay(),
        ]);

        $response = $this->get("/posts/{$post->slug}");
        $response->assertStatus(200);
    }

    #[Test]
    public function posts_edit_route_requires_authentication()
    {
        $post = Post::factory()->create();

        $response = $this->get("/admin/posts/{$post->slug}/edit");
        $response->assertRedirect(route('login'));
    }

    #[Test]
    public function posts_edit_route_returns_successful_response_when_authenticated()
    {
        $user = User::factory()->create();

        $this->actingAs($user);

        $post = Post::factory()->create();

        $response = $this->get("/admin/posts/{$post->slug}/edit");
        $response->assertStatus(200);
    }


    #[Test]
    public function posts_update_route_updates_data()
    {
        $user = User::factory()->create();

        $this->actingAs($user);

        $post = Post::factory()->create();

        $newData = [
            'title' => 'Updated Title',
            'content' => 'Updated content',
        ];

        $response = $this->put("/admin/posts/{$post->slug}", $newData);
        $response->assertRedirect(route('home'));
        $this->assertDatabaseHas('posts', $newData);
    }


    #[Test]
    public function posts_destroy_route_deletes_post()
    {
        $user = User::factory()->create();

        $this->actingAs($user);

        $post = Post::factory()->create([
            'user_id' => $user->id,
        ]);

        $response = $this->delete("/admin/posts/{$post->slug}");

        $response->assertRedirect(route('home'));
        $this->assertDatabaseMissing('posts', ['id' => $post->id]);
    }
}
