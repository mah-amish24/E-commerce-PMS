<?php

namespace App\Http\Controllers\Api;
use Illuminate\Http\JsonResponse;

trait ApiResponseTrait
{
    public function successResponse($data, $message = null, $status = 200): JsonResponse
    {
        return response()->json([
            'status' => 'success',
            'message' => $message,
            'data' => $data,
        ], $status);
    }
    protected function errorResponse($message, $status = 400): JsonResponse
    {
        return response()->json([
            'status' => 'error',
            'message' => $message,
            'data' => null,
        ], $status);
    }


}

