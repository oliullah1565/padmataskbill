<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Bill;
use Carbon\Carbon;
use Illuminate\Contracts\Session\Session;
use Event;
use App\Events\SendMail;

class BillController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data= Bill::with('customer')->get();
        return response($data, 201);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $data= User::where('usertype','customer')->get();
        return response($data, 201);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $billcheck= Bill::where('bill_month', $request->bill_month)->where('year', $request->year)->where('cusid', $request->cusid)->first();
        if ($billcheck) {
            return response([
                'message' => ['Already exits This Month Bill!!']
            ], 404);
        }else{
            $bill = new Bill;
            $bill->cusid = $request->cusid;
            $bill->bill_month = $request->bill_month;
            $bill->amount = $request->amount;
            $bill->year = $request->year;
            $bill->status = $request->status;
            $bill->created_at = Carbon::now();
            $bill->updated_at = Carbon::now();
            $bill->save();
        }

        $data= $bill;
    
        return response($data, 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $data= Bill::with('customer')->get();
        //Event::fire(new SendMail($data->id));
        return response($data, 201);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $data= Bill::where('id', $id)->first();
    
        return response($data, 201);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $bill = Bill::findOrFail($id);
        $bill->cusid = $request->cusid;
        $bill->bill_month = $request->bill_month;
        $bill->amount = $request->amount;
        $bill->year = $request->year;
        $bill->status = $request->status;
        $bill->updated_at = Carbon::now();
        $bill->save();

        $data= Bill::with('customer')->get();
        return response($data, 201);
    }
    

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $bill = Bill::findOrFail($id);
        $bill->delete();
        $data= Bill::with('customer')->get();
        return response($data, 201);
    }

    public function changestatus($id)
    {
        $bill = Bill::findOrFail($id);
        $bill->status = 'Paid';
        $bill->updated_at = Carbon::now();
        $bill->save();
        $data= Bill::with('customer')->get();
        return response($data, 201);
    }
}
