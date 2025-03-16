<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;

class Project extends Model implements HasMedia
{
    /** @use HasFactory<\Database\Factories\ProjectFactory> */
    use HasFactory;
    use InteractsWithMedia;
    protected $fillable = [
        'title',
        'description',
        'language',
        'user_id',
        "is_favorite"
    ];

    public function features()
    {
        return $this->hasMany(Feature::class);
    }

    public function registerMediaCollections(): void
    {
        $this->addMediaCollection('projects');
    }
}
