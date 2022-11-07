<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Contracts\Session\Session;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    function login(Request $request)
    {
        $user= User::where('email', $request->email)->first();
        if (!$user || !Hash::check($request->password, $user->password)) {
            return response([
                'message' => ['These credentials do not match our records.']
            ], 404);
        }
    
        $token = $user->createToken('my-app-token')->plainTextToken;
    
        $response = [
            'user' => $user,
            'token' => $token
        ];
    
        return response($response, 201);
    }

    function register(Request $request)
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

        $data= User::where('email', $request->email)->first();
    
        return response($data, 201);
    }

    function logout(Request $request){
        // Auth::logout();

        $request->session()->flush();
        return redirect('/');
    }
}
