@component('mail::message')
Thanks you. Your bill is ready. Here your bill info.

-Name: {{$bill->customer->name}}
-Month: {{$bill->bill_month}}
-Amount: {{$bill->amount}}


@endcomponent