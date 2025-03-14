<?php

namespace App\Http\Controllers;

use App\Models\Upload;
use App\Http\Requests\StoreUploadRequest;
use App\Http\Requests\UpdateUploadRequest;

class UploadController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreUploadRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Upload $upload)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateUploadRequest $request, Upload $upload)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Upload $upload)
    {
        //
    }
}
