<?php
/*
 *  Country model
 *  
 */
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Person extends Model {

    protected $table = 'person';

    public $timestamps = false;
 
    
    /* one to one relation with person
     */
    public function personAddress() {
        return $this->hasOne('App\Models\PersonAddress', 'person_id', 'address_id');
    }
    
}
