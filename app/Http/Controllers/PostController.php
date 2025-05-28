<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\Post;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests\StorePostRequest;
use App\Http\Requests\UpdatePostRequest;

class PostController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth')->except('index', 'show');
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $posts = Post::published()->orderByDesc('published_at')->paginate(10);
        return view('posts.index', compact('posts'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $this->authorize('create', Post::class);

        return view('posts.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StorePostRequest $request)
    {
        $this->authorize('create', Post::class);

        $data = $request->validated();
        $data['slug'] = Str::slug($data['title']);
        $data['user_id'] = Auth::id();
        $data['is_draft'] = $request->has('is_draft');

        if ($data['is_draft']) {
            $data['published_at'] = null;
            $data['is_published'] = false;
        } else {
            $data['published_at'] = $request->filled('published_at')
                ? Carbon::parse($request->input('published_at'))
                : now();

            $data['is_published'] = $data['published_at']->lte(now());
        }

        Post::create($data);

        return redirect()->route('home')->with('success', 'Post created successfully.');
    }

    /**
     * Display the specified resource.
     */
    public function show(Post $post)
    {
        $now = Carbon::now();

        if (!Auth::check() && $post->is_draft) {
            abort(403, 'Unauthorized access for guests.');
        }

        if (!Auth::check() && $post->published_at && $post->published_at->isFuture()) {
            abort(403, 'This post is not yet published.');
        }

        if (Auth::check() && $post->user_id !== Auth::id()) {
            if ($post->is_draft) {
                abort(403, 'You are not authorized to view this draft post.');
            }

            if ($post->published_at && $post->published_at->isFuture()) {
                abort(403, 'This post is not yet published.');
            }
        }

        return view('posts.show', compact('post'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Post $post)
    {
        $this->authorize('update', $post);

        return view('posts.edit', compact('post'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdatePostRequest $request, Post $post)
    {
        $this->authorize('update', $post);

        $data = $request->validated();
        $data['slug'] = Str::slug($data['title']);
        $data['is_draft'] = $request->has('is_draft');

        if ($data['is_draft']) {
            $data['published_at'] = null;
            $data['is_published'] = false;
        } else {
            $data['published_at'] = $request->filled('published_at')
                ? Carbon::parse($request->input('published_at'))
                : now();

            $data['is_published'] = $data['published_at']->lte(now());
        }

        $post->update($data);

        return redirect()->route('home')->with('success', 'Post updated successfully.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Post $post)
    {
        $this->authorize('destroy', $post);

        $post->delete();
        return redirect()->route('home')->with('success', 'Post deleted successfully.');
    }
}
