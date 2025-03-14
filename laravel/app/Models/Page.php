<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Page extends Model
{
    /** @use HasFactory<\Database\Factories\PageFactory> */
    use HasFactory;
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
}
