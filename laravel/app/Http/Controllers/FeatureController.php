<?php

namespace App\Http\Controllers;

use App\Models\Feature;
use App\Http\Requests\StoreFeatureRequest;
use App\Http\Requests\UpdateFeatureRequest;

class FeatureController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index($id)
    {
        $index = Feature::where('project_id', $id)->with('pages')->get();
        return response()->json(['data' => $index]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreFeatureRequest $request)
    {
        $store = Feature::create($request->validated());
        return response()->json(['data' => $store, 'message' => 'Your Feature has been successfully created, Now it is time to organize.!']);
    }

    /**
     * Display the specified resource.
     */
    public function show(Feature $feature)
    {
        return response()->json(['data' => $feature->load('project')]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateFeatureRequest $request, Feature $feature)
    {
        $feature->update($request->validated());

        return response()->json([
            'message' => 'feature has been updated successfully',
            'data' => $feature
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Feature $feature)
    {
        $feature->delete();
        return response()->json(['data' => 'Feature been deleted successfully']);
    }
}
