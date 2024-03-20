<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class authController extends Controller
{
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'first_name' => 'string|required|min:2',
            'last_name' => 'string|required|min:2',
            'gender' => 'string|required',
            'date_of_birth' => 'required|date',
            'username' => 'required|string|unique:users|min:4',
            'email' => 'string|required|email|unique:users',
            'phone' => 'required|unique:users|min:11|max:15',
            'password' => [
                'required',
                'confirmed',
                'digits:6',
                'numeric',
                function ($attribute, $value, $fail) {
                    if (preg_match('/(\d)\1{2,}/', $value) || preg_match('/123|234|345|456|567|678|789|098|987|876|765|654|543|432|321|012/', $value)) {
                        $fail('The password is too simple.');
                    }
                },
            ],
            'device_id' => 'string|required',
            'device_model' => 'string|required',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->errors()->first(),
                'status' => 'error',
            ]);
        }

        $validated = $validator->validated();
        $validated['dob'] = Carbon::createFromFormat('m/d/Y', $validated['date_of_birth'])->toDateString();
        $user = User::create($validated);

        $this->sendOtp($user->id);

        return response()->json(['status' => 'ok', 'user' => $user, 'token' => $user->createToken($request->device_model)->plainTextToken]);
        // return response()->json(['data' => 'Hello world', 'otp' => false, 'status' => 'ok', 'user' => $user, 'token' => $user->createToken($request->device_model)->plainTextToken]);
    }

}
