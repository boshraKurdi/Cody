<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Code extends Model
{
    /** @use HasFactory<\Database\Factories\CodeFactory> */
    use HasFactory;
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
}
