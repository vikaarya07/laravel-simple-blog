<?php

namespace Database\Seeders;

use App\Models\Post;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\User;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        User::factory()->create([
            'name' => 'Test User',
            'email' => 'test@example.com',
        ]);

        User::factory()->create([
            'name' => 'Vika Arya',
            'email' => 'vikaarya@example.com',
        ]);

        User::factory()->create([
            'name' => 'Janggar',
            'email' => 'janggar@example.com',
        ]);

        Post::factory(9)->create();
    }
}
