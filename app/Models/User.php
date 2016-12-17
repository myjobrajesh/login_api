<?php

namespace App\Models;

use Laravel\Passport\HasApiTokens;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use Notifiable, HasApiTokens;

    protected $table = 'login';

    protected $primaryKey = 'person_id';
    
    public $timestamps = false;
    
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'pass', 'remember_token',
    ];
    
    /* this is for change password to pass field
     */
    public function getPasswordAttribute() {
        return $this->pass;
    }
    
    
    /* one to one relation with person
     */
    public function person() {
        return $this->hasOne('App\Models\Person', 'id', 'person_id');
    }
    
}
