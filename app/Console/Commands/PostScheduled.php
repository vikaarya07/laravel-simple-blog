<?php

namespace App\Console\Commands;

use App\Models\Post;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Log;

class PostScheduled extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'posts:publish';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Publish scheduled posts';

    /**
     * Execute the console command.
     */
    public function handle()
    {

        $posts = Post::where('is_published', false)
            ->whereNotNull('published_at')
            ->where('published_at', '<=', now())
            ->get();

        Log::info("Total posts published: " . $posts->count());

        foreach ($posts as $post) {
            $post->update(['is_published' => true]);
            $this->info("Post published: {$post->title}");
        }

        return Command::SUCCESS;
    }
}
