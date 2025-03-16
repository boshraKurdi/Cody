<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class AddCodeToNewProjectRequest extends FormRequest
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
            'project_title'     => 'required|string|max:255',
            'project_description' => 'nullable|string',
            'language'          => 'nullable|string|max:255',
            'feature_title'     => 'required|string|max:255',
            'page_title'        => 'required|string|max:255',
            'code_title'        => 'required|string|max:255',
            'code_description'  => 'nullable|string',
            'code_content'      => 'required|string',
        ];
    }
}
