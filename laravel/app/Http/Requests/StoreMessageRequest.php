<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreMessageRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'text' => "required|string",
            "chat_id" => "required|exists:chats,id",
        ];
    }

    public function validated($key = null, $default = null)
    {
        return [
            'text' => $this->text,
            'sender' => 0,
            'chat_id' => $this->chat_id,
        ];
    }
}
