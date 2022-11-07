<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Contracts\Session\Session;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class CustomerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data= User::where('usertype','customer')->get();
        return response($data, 201);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $user= User::where('email', $request->email)->first();
        if ($user) {
            return response([
                'message' => ['Already exits Email!!']
            ], 404);
        }else{
            $users = new User;
            $users->name = $request->name;
            $users->email = $request->email;
            $users->password = Hash::make($request->password);
            $users->address = $request->address;
            $users->created_at = Carbon::now();
            $users->updated_at = Carbon::now();
            $users->save();
        }

        $data= User::where('usertype','customer')->get();
    
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
        $data= User::where('id', $id)->first();
    
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
        $data= User::where('id', $id)->first();
    
        return response($data, 201);
    }
   

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        
            $users = User::findOrFail($request->id);
            $users->name = $request->name;
            $users->email = $request->email;
            $users->address = $request->address;
            $users->updated_at = Carbon::now();
            $users->save();

        $data= User::where('id', $request->id)->first();
    
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
        $user = User::findOrFail($id);
        $user->delete();
        $meg="Customer Delete Successfully";
        return response($meg, 201);
    }
   


}
