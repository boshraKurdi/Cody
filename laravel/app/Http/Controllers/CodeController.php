<?php

namespace App\Http\Controllers;

use App\Models\Code;
use App\Http\Requests\StoreCodeRequest;
use App\Http\Requests\UpdateCodeRequest;

class CodeController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index($id)
    {
        $index = Code::where('page_id', $id)->get();
        return response()->json(['data' => $index]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreCodeRequest $request)
    {
        $store = Code::create($request->validated());
        return response()->json(['data' => $store, 'message' => 'Your Code has been successfully created, Keep creating.!']);
    }

    /**
     * Display the specified resource.
     */
    public function show(Code $code)
    {
        return response()->json(['data' => $code->load('page')]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateCodeRequest $request, Code $code)
    {
        $code->update($request->validated());

        return response()->json([
            'message' => 'code has been updated successfully',
            'data' => $code
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Code $code)
    {
        $code->delete();
        return response()->json(['data' => 'Code been deleted successfully']);
    }
}
