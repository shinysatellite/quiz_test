<?php

namespace App\Http\Controllers\API;

use Session;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Http\Controllers\Controller;
use Auth;

class UserController extends Controller
{
    /**
     * Register
     */
    public function register(Request $request)
    {
        try {
            $user = new User();
            $user->name = $request->name;
            $user->email = $request->email;
            $user->type = 'tester';
            $user->password = Hash::make($request->password);
            $user->save();

            $success = true;
            $message = 'User register successfully';
        } catch (\Illuminate\Database\QueryException $ex) {
            $success = false;
            $message = $ex->getMessage();
        }

        // response
        $response = [
            'success' => $success,
            'message' => $message,
            'token' => $user->createToken('tokens')->plainTextToken,
            'user' => $user,
        ];
        return response()->json($response);
    }
    /**
     * Login
     */
    public function login(Request $request)
    {
        $credentials = [
            'email' => $request->email,
            'password' => $request->password
        ];

        if (Auth::attempt($credentials, true)) {
            $response = [
                'success' => true,
                'message' => 'User login successfully',
                'token' => auth()->user()->createToken('tokens')->plainTextToken,
                'user' => auth()->user(),
            ];
        } else {
            $response = [
                'success' => false,
                'message' => 'Unauthorised',
            ];
        }
        return response()->json($response);
    }

    public function current(Request $request)
    {
         $response = [
            'success' => true,
            'token' => auth()->user()->createToken('tokens')->plainTextToken,
            'user' => auth()->user(),
        ];
        return response()->json($response);
    }
    /**
     * Logout
     */
    public function logout(Request $request)
    {
        Auth::guard('web')->logout();
        // $this->guard()->logout();
        try {
            Session::flush();
            $success = true;
            $message = 'Successfully logged out';
        } catch (\Illuminate\Database\QueryException $ex) {
            $success = false;
            $message = $ex->getMessage();
        }

        // response
        $response = [
            'success' => $success,
            'message' => $message,
        ];
        return response()->json($response);
    }
}
