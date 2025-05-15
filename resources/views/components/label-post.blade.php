@php
    $statusClasses = [
        'active' => 'bg-green-100 text-green-800',
        'draft' => 'bg-gray-100 text-gray-800',
        'scheduled' => 'bg-yellow-100 text-yellow-800',
    ];

    if ($post->is_draft) {
        $status = 'draft';
    } elseif ($post->published_at > now()) {
        $status = 'scheduled';
    } else {
        $status = 'active';
    }

@endphp

<span class="flex-none rounded px-2 py-1 {{ $statusClasses[$status] }}">
    {{ ucfirst($status) }}
</span>
