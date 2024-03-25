<?php

namespace App\Traits;

use App\Jobs\SendEmail;
use App\Mail\EmailAlert;
use App\Models\Otp;
use App\Models\User;

trait utilities
{
    public $rands;
    public function sendOtp($userId)
{
    $this->rand = mt_rand(1000, 9999);
    $user = User::find($userId);

    if (!$user->id) {
        return false;
    }
    $r = new EmailAlert ([
        'name' => $user->first_name,
        'subject' => 'Email Verification',
        'view' => 'alerts',
        'message' => 'The OTP to verify your email address on ' . env('APP_NAME') . ' is <b>' . $this->rand . '</b>',
    ]);
    Otp::updateOrCreate(
        ['user_id' => $user->id],
        [
            'code' => $this->rand,
        ],
    );
    dispatch(new SendEmail($r, [$user->email]));
    return response()->json(['status' => 'ok', 'message' => 'OTP has been sent successfully.']);
}



public function sendEmail($data, array $emails)
{

    dispatch(new SendEmail($data, $emails));
}

}