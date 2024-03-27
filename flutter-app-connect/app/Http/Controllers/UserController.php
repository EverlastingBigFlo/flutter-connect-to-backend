<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Traits\utilities;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
    use utilities;

    public function createTxPin(Request $request)
    {

        // validate the pin inputs and check the pin not for a simple pin 
        $validator = Validator::make($request->all(), [
            'pin' => ['required', 'digits:4', 'numeric', function ($attribute, $value, $fail) {

                if (
                    preg_match('/(\d)\1{2,}/', $value) || preg_match('/123|234|345|456|567|678|789|098|987|876|765|654|543|432|321|012/', $value)
                ) {
                    $fail('The pin is too simple.');
                }
            }],


        ]);


        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->errors()->first(),
                'status' => 'error',
            ]);
        }

        // find user by id 
        $user = User::find($request->user()->id)->first();

        // if user doesn't exist return with error message
        if (!$user) {
            return response()->json(['status' => 'error', "message" => 'User not found']);
        }
        // hash the pin inside the database
        $user->tx_pin = Hash::make($request->pin);
        $user->save();
        // return response()->json(['status' => 'ok', "message" => 'You have created your PIN successfully']);
    }
}
