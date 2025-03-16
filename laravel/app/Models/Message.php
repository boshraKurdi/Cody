<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Message extends Model
{
    /** @use HasFactory<\Database\Factories\MessageFactory> */
    use HasFactory;
    protected $fillable = [
        'text',
        'chat_id',
        'sender',
    ];


    public function chat()
    {
        return $this->belongsTo(Chat::class);
    }
}
