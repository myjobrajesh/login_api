<?php
/*
 *  State model
 *  
 */
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class State extends Model {

    protected $table = 'state';

    public $timestamps = false;
 
    
    /* one to one relation
     */
    public function country() {
        return $this->hasOne('App\Models\Country', 'id', 'country_id');
    }
}
