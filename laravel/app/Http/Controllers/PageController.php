<?php

namespace App\Http\Controllers;

use App\Models\Page;
use App\Http\Requests\StorePageRequest;
use App\Http\Requests\UpdatePageRequest;

class PageController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index($id)
    {
        $index = Page::where('feature_id', $id)->with('media')->get();
        return response()->json(['data' => $index]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StorePageRequest $request)
    {
        $store = Page::create($request->validated());
        if ($request->media) {
            $store->addMediaFromRequest('media')->toMediaCollection('pages');
        }
        return response()->json(['data' => $store, 'message' => 'Your Page has been successfully created,Now it is time to code.!']);
    }

    /**
     * Display the specified resource.
     */
    public function show(Page $page)
    {
        return response()->json(['data' => $page->load(['feature', 'media'])]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdatePageRequest $request, Page $page)
    {
        $page->update($request->validated());
        if ($request->media) {
            $page->addMediaFromRequest('media')->toMediaCollection('pages');
        }

        return response()->json([
            'message' => 'page has been updated successfully',
            'data' => $page
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Page $page)
    {
        $page->delete();
        return response()->json(['message' => 'Page been deleted successfully']);
    }
}
