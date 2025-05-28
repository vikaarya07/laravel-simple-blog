<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Post extends Model
{
    /** @use HasFactory<\Database\Factories\PostFactory> */
    use HasFactory;

    protected $fillable = ['user_id', 'title', 'slug', 'content', 'is_draft', 'published_at', 'is_published'];

    protected $with = ['user'];

    protected $casts = ['is_draft' => 'boolean', 'published_at' => 'datetime', 'is_published' => 'boolean'];

    public function getRouteKeyName()
    {
        return 'slug';
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function scopePublished($query)
    {
        return $query->where('is_draft', false)
            ->whereNotNull('published_at')
            ->where('published_at', '<=', now());
    }
}
