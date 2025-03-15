<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreChatRequest extends FormRequest
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
            'title' => "required|string|max:256",
            "feature_id " => "required|exists:features,id",
        ];
    }
    public function validated($key = null, $default = null)
    {
        return [
            'title' => $this->title,
            'feature_id' => $this->feature_id,
        ];
    }
}
