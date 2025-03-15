<?php

namespace App\Http\Controllers;

use App\Models\Chat;
use App\Http\Requests\StoreChatRequest;
use App\Http\Requests\UpdateChatRequest;
use Illuminate\Support\Facades\DB;

class ChatController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $index = DB::table('chats')
            ->join('features', 'features.id', '=', 'chats.feature_id')
            ->join('projects', 'projects.id', '=', 'features.project_id')
            ->join('users', 'users.id', '=', 'projects.user_id')
            ->where('users.id', auth()->id())
            ->select('chats.*')
            ->get();
        return response()->json(['data' => $index]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreChatRequest $request)
    {
        $store = Chat::create($request->validated());
        return response()->json(['data' => $store, 'message' => "Hello! Let's embark on a new journey of discovery together, where every question brings you closer to the answer!"]);
    }

    /**
     * Display the specified resource.
     */
    public function show(Chat $chat)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateChatRequest $request, Chat $chat)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Chat $chat)
    {
        //
    }
}
