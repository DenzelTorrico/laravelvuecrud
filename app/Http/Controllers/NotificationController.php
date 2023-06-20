<?php

namespace App\Http\Controllers;

use App\Events\NotificationEvent;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class NotificationController extends Controller
{
    
    public function sendNotification()
    {
        $user = Auth::user();
        $message = 'Nueva notificación';

        event(new NotificationEvent($user, $message));
    }
}
