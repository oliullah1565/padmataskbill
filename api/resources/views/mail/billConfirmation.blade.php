@component('mail::message')
Thanks you. Your bill is ready. Here your bill info.

-Name: {{$bill->customer->name}}
-Month: {{$bill->bill_month}}
-Year: {{$bill->Year}}
-Amount: {{$bill->amount}}
-Status: {{$bill->status}}


@endcomponent