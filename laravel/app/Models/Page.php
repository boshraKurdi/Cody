<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;


class Page extends Model implements HasMedia
{
    /** @use HasFactory<\Database\Factories\PageFactory> */
    use HasFactory;
    use InteractsWithMedia;
    protected $fillable = [
        'title',
        'description',
        'feature_id',
    ];

    public function feature()
    {
        return $this->belongsTo(Feature::class);
    }

    public function codes()
    {
        return $this->hasMany(Code::class);
    }

    public function registerMediaCollections(): void
    {
        $this->addMediaCollection('pages');
    }
}
