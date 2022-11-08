<?php

namespace App\Listeners;
use App\Events\SendMail;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use App\Models\Bill;
use Mail;
class SendMailFired
{
   
    public function handle($event)
    {
      $bill = $event->bill;

      Mail::to($bill->customer->email)->send(new BillConfirmation($bill));
    }
}