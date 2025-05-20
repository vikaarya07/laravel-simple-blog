<?php

namespace Tests\Feature;

use Tests\TestCase;
use App\Models\Post;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;

class HomeAndPostsRoutesTest extends TestCase
{
    use RefreshDatabase;

    /** @test */
    public function home_route_returns_successful_response()
    {
        $response = $this->get('/');
        $response->assertStatus(200);
        $response->assertSee('Home');
    }

    /** @test */
    public function posts_route_shows_posts_list()
    {
        $response = $this->get('/posts');
        $response->assertStatus(200);
        $response->assertSee('All Posts');
    }

    /** @test */
    public function single_post_route_displays_post_detail()
    {
        // Arrange: Create user and post
        $user = User::factory()->create();
        $post = Post::factory()->create([
            'user_id' => $user->id,
        ]);

        // Authenticate as user
        $this->actingAs($user);

        // Act
        $response = $this->get("/posts/{$post->slug}");

        // Assert
        $response->assertStatus(200);
        $response->assertSee($post->title);
        $response->assertSee($post->content);
    }
}
