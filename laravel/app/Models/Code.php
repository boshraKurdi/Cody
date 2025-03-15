<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;

class Code extends Model implements HasMedia
{
    /** @use HasFactory<\Database\Factories\CodeFactory> */
    use HasFactory;
    use InteractsWithMedia;
    protected $fillable = [
        'title',
        'code',
        'description',
        'page_id',
    ];

    public function page()
    {
        return $this->belongsTo(Page::class);
    }

    public function registerMediaCollections(): void
    {
        $this->addMediaCollection('codes');
    }
}
