<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Bill extends Model
{
    use HasFactory;
    protected $table = 'bills';
    protected $fillable = [
        'cusid',
        'bil_month',
        'year',
        'amount',
        'status',
    ];
    public function customer(){
        return $this->belongsTo(User::class,'cusid','id');
    }
}
