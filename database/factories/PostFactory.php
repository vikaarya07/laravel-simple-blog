<?php

namespace Database\Factories;

use App\Models\User;
use Illuminate\Support\Str;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Post>
 */
class PostFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $title = fake()->sentence();
        $isDraft = fake()->boolean();
        $isPublished = !$isDraft;

        return [
            'title' => $title,
            'slug' => Str::slug($title),
            'content' => fake()->paragraphs(3, true),
            'user_id' => User::inRandomOrder()->first()?->id ?? User::factory(),
            'is_draft' => $isDraft,
            'is_published' => $isPublished,
            'published_at' => $isPublished ? now() : null,
            'created_at' => now(),
            'updated_at' => now(),
        ];
    }
}
