<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Create New Post') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8 space-y-6">
            <div class="p-4 sm:p-8 bg-white shadow sm:rounded-lg">
                <div class="max-w-xl">
                    <section>
                        <form method="POST" action="{{ route('posts.store') }}" enctype="multipart/form-data"
                            class="space-y-6">
                            @csrf

                            <div>
                                <x-input-label for="title" :value="__('Title')" />
                                <x-text-input id="title" name="title" type="text" class="mt-1 block w-full"
                                    :value="old('title')" />
                                <x-input-error :messages="$errors->get('title')" class="mt-2" />
                            </div>

                            <div>
                                <x-input-label for="content" :value="__('Content')" />
                                <textarea id="content" name="content"
                                    class="mt-1 block w-full border-gray-300 focus:border-indigo-500 focus:ring-indigo-500 rounded-md shadow-sm"
                                    rows="6">{{ old('content') }}</textarea>
                                <x-input-error :messages="$errors->get('content')" class="mt-2" />
                            </div>

                            <div>
                                <x-input-label for="published_at" :value="__('Publish Date')" />
                                <x-text-input id="published_at" name="published_at" type="date"
                                    class="mt-1 block w-full" :value="old('published_at')" />
                                <x-input-error :messages="$errors->get('published_at')" class="mt-2" />
                            </div>

                            <div>
                                <x-input-label for="image" :value="__('Featured Image')" />
                                <input id="image" name="image" type="file"
                                    class="mt-1 block w-full text-sm text-gray-500 file:mr-4 file:py-2 file:px-4 file:rounded-md file:border-0 file:text-sm file:font-semibold file:bg-indigo-50 file:text-indigo-700 hover:file:bg-indigo-100" />
                                <x-input-error :messages="$errors->get('image')" class="mt-2" />
                            </div>

                            <div>
                                <label for="is_draft" class="inline-flex items-center">
                                    <input id="is_draft" type="checkbox" value="1"
                                        class="rounded border-gray-300 text-indigo-600 shadow-sm focus:ring-indigo-500"
                                        name="is_draft" {{ old('is_draft') ? 'checked' : '' }}>
                                    <span class="ms-2 text-sm text-gray-600">{{ __('Save as Draft') }}</span>
                                </label>
                            </div>

                            <div class="flex items-center gap-4">
                                <x-primary-button>{{ __('Post') }}</x-primary-button>
                            </div>
                        </form>

                    </section>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
