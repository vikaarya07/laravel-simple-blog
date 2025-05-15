<x-app-layout>
    <x-slot name="header">
        <h2 class="text-xl font-semibold leading-tight text-gray-800">
            {{ __('Home') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="mx-auto max-w-7xl space-y-10 sm:px-6 lg:px-8">

            @guest
                <div class="overflow-hidden bg-white shadow-sm sm:rounded-lg">
                    <div class="p-6 text-gray-900">
                        <p>
                            Please
                            <a href="{{ route('login') }}" class="text-blue-500 hover:underline">login</a> or
                            <a href="{{ route('register') }}" class="text-blue-500 hover:underline">register</a>.
                        </p>
                    </div>
                </div>
            @endguest

            @auth
                <div class="overflow-hidden bg-white shadow-sm sm:rounded-lg">
                    <div class="space-y-6 p-6">
                        <h2 class="text-lg font-semibold">Your Posts</h2>

                        @forelse ($posts as $post)
                            <div class="rounded-md border p-5 shadow mb-4">
                                <div class="flex items-center gap-2">
                                    <x-label-post :post="$post" />
                                    <h3>
                                        <a href="{{ route('posts.show', $post) }}" class="text-blue-500 hover:underline">
                                            {{ $post->title }}
                                        </a>
                                    </h3>
                                </div>

                                <div class="mt-4 flex items-end justify-between">
                                    <div>
                                        <div>Published:
                                            {{ $post->published_at ? $post->published_at->format('d M Y') : '-' }}
                                        </div>
                                        <div>Updated:
                                            {{ $post->updated_at ? $post->updated_at->format('d M Y') : '-' }}
                                        </div>
                                    </div>
                                    <div class="space-x-2">
                                        <a href="{{ route('posts.show', $post->slug) }}"
                                            class="text-blue-500 hover:underline">Detail</a> /
                                        <a href="{{ route('posts.edit', $post->slug) }}"
                                            class="text-blue-500 hover:underline">Edit</a> /
                                        <form action="{{ route('posts.destroy', $post->slug) }}" method="POST"
                                            class="inline">
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit" class="text-red-500 hover:underline btn-delete">
                                                Delete
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        @empty
                            <p class="text-gray-500 italic">You haven't created any posts yet.</p>
                        @endforelse

                        {{ $posts->links() }}
                    </div>
                </div>
            @endauth

        </div>
    </div>
</x-app-layout>
