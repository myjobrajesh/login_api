<?php

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

/*Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:api');
*/

/* routes for without authentication
 */

Route::group(['prefix' => 'v1'], function () {
    /* Login
     */
    Route::post('/login',
                ['as'   => 'login',
                 'uses' => '\Laravel\Passport\Http\Controllers\AccessTokenController@issueToken',
                 ]);
    
});


/* routes with authentication
 */
Route::group(['prefix' => 'v1', 'middleware' => 'auth:api'], function () {
   
    /* logout
     */
    Route::get('/logout', [
       'uses' => 'UserController@logout',
        'as'   => 'logout'
    ]);
    
    /* get user information
     */
    Route::get('/user', [
       'uses' => 'UserController@getUser',
        'as'   => 'user.get'
    ]);
});
