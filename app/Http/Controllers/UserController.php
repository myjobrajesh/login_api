<?php
/* User controller
 */

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class UserController extends Controller
{
    /* get user information
     * @param string $id null
     * @param token as header $token
     * @return user object $user
     */
    public function getUser($id = null)
    {
        $user = auth()->user();
        
        $userData = $user->toArray();
        $data = $userData;
        
        // instead of qurying multtiple with models. use joins
        $obj = \App\Models\Person::where("person.id", $user->person_id)
                ->leftjoin("person_address as PA", "PA.person_id", "person.id")
                ->leftjoin("address as A", "A.id", "PA.address_id")
                ->leftjoin("state as S", "S.id", "A.state_id")
                ->leftjoin("country as C", "C.id", "S.country_id")
                ->first(["person.name",
                         "PA.active_from as address_active_form","PA.active_thru as address_active_thru",
                         "A.id as address_id, A.*",
                         "S.name as state_name",
                         "C.name as country_name", "C.id as country_id"]);
        
        $data = $userData   +   $obj->toArray();
        
        return response(array(
                'error' => false,
                'user' =>$data,
               ),200);
    }

    /* Logout
     * @return void
     */
    public function logout(Request $request)
    {
        $userTokens = $request->user()->tokens;
        foreach($userTokens as $obj) {
            $tokenId = $obj->id;
            if (is_null($token = $userTokens->find($tokenId))) {
                return response(array(
                'error' => false,
                'message'=> 'Error'
               ),404); 
             }
            $token->revoke();
        }

        return response(array(
                'error' => false
               ),200);       
    }
}