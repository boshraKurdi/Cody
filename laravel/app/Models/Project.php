<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Project extends Model
{
    /** @use HasFactory<\Database\Factories\ProjectFactory> */
    use HasFactory;
    protected $fillable = [
        'title',
        'description',
        'language',
        'user_id'
    ];

    public function features()
    {
        return $this->hasMany(Feature::class);
    }
}
