<?php
/*
 *  Person address model
 *  
 */
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PersonAddress extends Model {

    protected $table = 'person_address';

    public $timestamps = false;
 
    /* one to one relation with person
     */
    public function address() {
        return $this->hasOne('App\Models\Address', 'id', 'address_id');
    }
    
}
