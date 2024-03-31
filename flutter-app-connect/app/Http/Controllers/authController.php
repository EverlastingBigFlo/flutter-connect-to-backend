<?php

namespace App\Http\Controllers;

use App\Models\Otp;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use App\Traits\utilities;


class AuthController extends Controller
{

    use utilities;
    public $rand;
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
    }

    public function login(Request $request)
    {

        // validate inputs 
        $valid = Validator::make($request->all(), [
            'email_or_phone' => 'required',
            'password' => 'required',
            'device_model' => 'required',
            'device_id' => 'required',
        ]);
        if ($valid->fails()) {
            return response()->json(['status' => 'error', 'message' => $valid->errors()->first()]);
        }

        // find active user by email or phone number
        $user = User::where([['email', $request->email_or_phone], ['status', 1]])
            ->orWhere([['phone', $request->email_or_phone], ['status', 1]])
            ->first();

        if (!$user || !Hash::check($request->password, $user->password)) {
            return response()->json([
                'status' => 'error',
                'message' => 'The provided credentials are incorrect. Please check your email/phone and password.',
                'otp' => false,
            ]);
        }
        $user->tokens()->delete();


        // if ($user) {

        //     $this->sendOtp($user->id);
        // }

        // check if the user has been verified 
        if (!$user->email_verified_at) {
            $this->sendOtp($user->id);
            return response()->json(['otp' => true, 'status' => 'error', 'message' => 'Your email has not been verified. please verify it now', 'user' => $user]);
        }
        // check if the user is login in with new mobile device 
        if ($user->device_id != $request->device_id) {
            $this->sendOtp($user->id);
            return response()->json(['otp' => true, 'status' => 'error', 'message' => 'Your account is active on another device, Verification needed to use it here.', 'user' => $user]);
        }
        $user->tokens()->delete();

        return response()->json([
            'data' => 'Hello world',
            'otp' => false,
            'status' => 'ok',
            'user' => $user,
            'token' => $user->createToken($request->device_model)->plainTextToken
        ]);

        // return $user->createToken($request->device_name)->plainTextToken;
    }

    public function checkOtp(Request $request)
    {
        $id = User::where('email', $request->email)->first()->id;
        return $this->verifyOtp($id, $request->otp);
    }




    public function sendOtpNow(Request $request)
    {

        $id = User::where('email', $request->email)->first()->id;
        return $this->sendOtp($id);
    }




    public function verifyOtp($userId, $code)
    {

        $time = Otp::where('user_id', $userId)->first();
        if (!$time) {
            return response()->json(['status' => 'error', 'message' => 'Invalid OTP']);
        }

        if (!Hash::check($code . '', $time->code)) {

            return response()->json(['status' => 'error', 'message' => 'Invalid OTP']);
        }
        $startTime = Carbon::parse($time->updated_at);
        $finishTime = Carbon::parse(Carbon::now());
        $totalDuration = $finishTime->diffInSeconds($startTime);
        if ($totalDuration > 300) {

            return response()->json(['status' => 'error', 'message' => 'OTP has expired']);
        }

        Otp::updateOrCreate(['user_id' => $time->user_id], [
            'code' => Hash::make($this->rand)

        ]);
        $user = User::find($userId);
        if (!$user->email_verified_at) {
            $user->email_verified_at = now();
            $user->save();
        }



        return response()->json(['status' => 'ok', 'message' => 'OTP has been sent']);
    }
}
