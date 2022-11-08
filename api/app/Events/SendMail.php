<?php

namespace App\Events;
use Event;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use App\Models\Bill;
class SendMail extends Event
{
    use SerializesModels, Dispatchable;
    public $bill;
    public function __construct(Bill $bill)
    {
        $this->bill = $bill;
    }
 
}