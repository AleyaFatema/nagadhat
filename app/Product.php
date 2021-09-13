<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Category;

class Product extends Model
{
    protected $fillable = [
        'category_id','title','product_code','detail','return_policy','price',
        'quantity','base_unit','thumbnail_url','is_active','created_by','created_at','updated_at'
    ];
    public function categories() {
        return $this->belongsTo(Category::class,'category_id');
    }
}
