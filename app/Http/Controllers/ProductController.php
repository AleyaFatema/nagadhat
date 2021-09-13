<?php

namespace App\Http\Controllers;

use App\Category;
use App\Product;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Redirect;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $total_products = Product::all()->count();
        $products = Product::with(['categories'])->latest()->paginate(5);

        return view('products.index',compact('products','total_products'))
            ->with('i', (request()->input('page', 1) - 1) * 5);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories = Category::where('is_active', 1)->get();
        return view('products.create', compact('categories'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // Validate the form data
        $request->validate([
            'category_id' => 'required|exists:App\Category,id',
            'title' => 'required|unique:products',
            'product_code' => 'required|unique:products|alpha_num',
            'detail' => 'required|string',
            'price' => 'required|numeric|gt:0',
            'quantity' => 'required|numeric',
            'base_unit' => 'required',
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'description' => 'required',
        ]);
        if ($files = $request->file('image')) {
            $destinationPath = 'public/image/'; // upload path
            $profileImage = date('YmdHis') . "." . $files->getClientOriginalExtension();
            $files->move($destinationPath, $profileImage);
            $insert['thumbnail_url'] = "$profileImage";
        }

        $insert['category_id'] = $request->get('category_id');
        $insert['title'] = $request->get('title');
        $insert['product_code'] = $request->get('product_code');
        $insert['detail'] = $request->get('detail');
        $insert['price'] = $request->get('price');
        $insert['quantity'] = $request->get('quantity');
        $insert['base_unit'] = $request->get('base_unit');
        $insert['created_by'] = auth()->user()->id;
        $insert['created_at'] = Carbon::now();
        $insert['updated_at'] = Carbon::now();

        $product = Product::create($insert);
        return response()->json($product, 200);
//        return redirect()->route('products.index')
//            ->with('success','Product created successfully.');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function show(Product $product)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function edit(Product $product)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Product $product)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request,$id)
    {
        Product::where('id', $id)->delete();
//        return Redirect::to('products')->with('success','Product deleted successfully');
        return response()->json(['message' => ' Product has been deleted!']);
    }
}
