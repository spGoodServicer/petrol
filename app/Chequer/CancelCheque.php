<?php

namespace App\Chequer;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;

class CancelCheque extends Model
{
    use LogsActivity;

    protected static $logAttributes = ['*'];

    protected static $logFillable = true;

    protected static $logName = 'cancel_cheque'; 

    protected $guarded = ['id'];
  
    protected $table = 'cancel_cheque';
}
