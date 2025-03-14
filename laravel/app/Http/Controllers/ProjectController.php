<?php

namespace App\Http\Controllers;

use App\Models\Project;
use App\Http\Requests\StoreProjectRequest;
use App\Http\Requests\UpdateProjectRequest;

class ProjectController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $index = Project::where('user_id', auth()->id())->get();
        return response()->json(['data' => $index]);
    }
    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreProjectRequest $request)
    {
        $store = Project::create($request->validated());
        return response()->json(['data' => $store, 'message' => 'Your project has been successfully created, now go ahead and share your creativity with the world!']);
    }

    /**
     * Display the specified resource.
     */
    public function show(Project $project)
    {
        return response()->json(['data' => $project]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateProjectRequest $request, Project $project)
    {
        $project->update($request->validated());

        return response()->json([
            'message' => 'project has been updated successfully',
            'data' => $project
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Project $project)
    {
        $project->delete();
        return response()->json(['message' => 'Project been deleted successfully']);
    }
}
