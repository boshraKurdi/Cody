<?php

namespace App\Http\Controllers;

use App\Models\Message;
use App\Http\Requests\StoreMessageRequest;
use App\Http\Requests\UpdateMessageRequest;
use Illuminate\Http\Request;

class MessageController extends Controller
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
    public function store(StoreMessageRequest $request)
    {

        $store = Message::create($request->validated());
        return response()->json(['data' => $store, 'message' => 'Your Message has been successfully created']);
    }

    public function create(Request $request)
    {

        $store = Message::create([
            'text' => $request->text,
            'sender' => 1,
            'chat_id' => $request->chat_id,
        ]);
        return response()->json(['data' => $store, 'message' => 'Ai Message has been successfully created']);
    }

    /**
     * Display the specified resource.
     */
    public function show(Message $message)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateMessageRequest $request, Message $message)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Message $message)
    {
        //
    }
}
