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

        $userQuestion = $request->input('text');

        try {
            // ارسال الطلب إلى Python Service
            $client = new \GuzzleHttp\Client();
            $response = $client->post('http://127.0.0.1:8001/generate-code/', [
                'json' => [
                    'user_question' => $userQuestion
                ]
            ]);

            $data = json_decode($response->getBody()->getContents(), true);

            $answer = $data['answer'];

            // تخزين السؤال والإجابة في قاعدة البيانات
            $user = Message::create([
                'text' => $request->text,
                'sender' => 0,
                'chat_id' => $request->chat_id,
            ]);
            $ai = Message::create([
                'text' => $answer,
                'sender' => 1,
                'chat_id' => $request->chat_id,
            ]);
            // ارجاع الرد للواجهة
            return response()->json([
                'message' => 'تم الحصول على الإجابة!',
                'data'    => $answer
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'حدث خطأ أثناء المعالجة',
                'error'   => $e->getMessage()
            ], 500);
        }
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
