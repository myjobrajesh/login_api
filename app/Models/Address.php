<?php
/*
 *  Address model
 *  
 */
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Address extends Model {

    protected $table = 'address';

    public $timestamps = false;
 
     /* one to one relation
     */
    public function state() {
        return $this->hasOne('App\Models\State', 'id', 'state_id');
    }
    
}
