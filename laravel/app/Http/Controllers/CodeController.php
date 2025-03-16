<?php

namespace App\Http\Controllers;

use App\Http\Requests\AddCodeToNewProjectRequest;
use App\Http\Requests\AddCodeWithExistingFeatureAndNewPageRequest;
use App\Http\Requests\AddCodeWithNewFeatureAndPageRequest;
use App\Models\Code;
use App\Http\Requests\StoreCodeRequest;
use App\Http\Requests\UpdateCodeRequest;
use App\Models\Feature;
use App\Models\Page;
use App\Models\Project;

class CodeController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index($id)
    {
        $index = Code::where('page_id', $id)->with('media')->get();
        return response()->json(['data' => $index]);
    }

    /**
     * Display the specified resource.
     */
    public function show(Code $code)
    {
        return response()->json(['data' => $code->load(['page', 'page.media', 'media'])]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateCodeRequest $request, Code $code)
    {
        $code->update($request->validated());
        if ($request->media) {
            $code->addMediaFromRequest('media')->toMediaCollection('codes');
        }

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

    // request for store code 

    public function addCodeToExistingPage(StoreCodeRequest $request)
    {
        $store = Code::create($request->validated());
        if ($request->media) {
            $store->addMediaFromRequest('media')->toMediaCollection('codes');
        }
        return response()->json(['data' => $store, 'message' => 'Your Code has been successfully created, Keep creating.!']);
    }


    public function addCodeToNewProject(AddCodeToNewProjectRequest $request)
    {
        $validated = $request->validated();

        $project = Project::create([
            'title' => $validated['project_title'],
            'description' => $validated['project_description'],
            'language' => $validated['language'],
            'user_id' => auth()->id(),
        ]);

        $feature = Feature::create([
            'title' => $validated['feature_title'],
            'description' => '',
            'project_id' => $project->id,
        ]);

        $page = Page::create([
            'title' => $validated['page_title'],
            'description' => '',
            'feature_id' => $feature->id,
        ]);

        $code = Code::create([
            'title' => $validated['code_title'],
            'description' => $validated['code_description'],
            'code' => $validated['code_content'],
            'page_id' => $page->id,
        ]);

        if ($request->hasFile('project_media')) {
            $project->addMediaFromRequest('project_media')->toMediaCollection('projects');
        }

        if ($request->hasFile('page_media')) {
            $page->addMediaFromRequest('page_media')->toMediaCollection('pages');
        }

        if ($request->hasFile('code_media')) {
            $code->addMediaFromRequest('code_media')->toMediaCollection('codes');
        }

        return response()->json([
            'message' => 'Project with feature, page and code successfully created!',
            'data' => $code
        ]);
    }

    public function addCodeWithNewFeatureAndPage(AddCodeWithNewFeatureAndPageRequest $request, Project $project)
    {
        $validated = $request->validated();

        $feature = Feature::create([
            'title' => $validated['feature_title'],
            'description' => $validated['feature_description'],
            'project_id' => $project->id,
        ]);

        $page = Page::create([
            'title' => $validated['page_title'],
            'description' => $validated['page_description'],
            'feature_id' => $feature->id,
        ]);

        $code = Code::create([
            'title' => $validated['code_title'],
            'description' => $validated['code_description'],
            'code' => $validated['code_content'],
            'page_id' => $page->id,
        ]);

        if ($request->hasFile('page_media')) {
            $page->addMediaFromRequest('page_media')->toMediaCollection('pages');
        }

        if ($request->hasFile('code_media')) {
            $code->addMediaFromRequest('code_media')->toMediaCollection('codes');
        }

        return response()->json([
            'message' => 'Feature, page and code created successfully!',
            'data' => $code
        ]);
    }

    public function addCodeWithExistingFeatureAndNewPage(AddCodeWithExistingFeatureAndNewPageRequest $request, Project $project, Feature $feature)
    {
        $validated = $request->validated();

        $page = Page::create([
            'title' => $validated['page_title'],
            'description' => '',
            'feature_id' => $feature->id,
        ]);

        $code = Code::create([
            'title' => $validated['code_title'],
            'description' => $validated['code_description'],
            'code' => $validated['code_content'],
            'page_id' => $page->id,
        ]);

        return response()->json([
            'message' => 'The new page has been created and the code has been added successfully!',
            'data' => $code
        ]);
    }
}
