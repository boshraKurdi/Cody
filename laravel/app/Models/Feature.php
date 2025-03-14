<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Feature extends Model
{
    /** @use HasFactory<\Database\Factories\FeaturesFactory> */
    use HasFactory;
    protected $fillable = [
        'title',
        'description',
        'project_id'
    ];

    public function project()
    {
        return $this->belongsTo(Project::class);
    }

    public function pages()
    {
        return $this->hasMany(Page::class);
    }
}
