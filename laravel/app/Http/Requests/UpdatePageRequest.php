<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdatePageRequest extends FormRequest
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
            "description" => "required|string",
            "feature_id" => "required|exists:features,id",
        ];
    }

    public function validated($key = null, $default = null)
    {
        return [
            'title' => $this->title,
            'description' => $this->description,
            'feature_id' => $this->feature_id,
        ];
    }
}
