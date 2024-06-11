<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Storage;
use App\Models\product;
use App\Models\user;

use Illuminate\Support\Facades\Auth;

use Illuminate\Http\Request;
class ProductController extends Controller
{
    
    public function index()
    {
        // Storage::disk('public')->put('test.txt','welcome');  
        $userId = Auth::user()->id;
            $products = product::where('user_id','=',$userId)->get();
            return view('products.index', compact('products'));
    }

  
    public function create()
    {
        $user = Auth::user();
        return view('products.create',compact('user'));
    }

   
         public function store(Request $request)
    { 

        $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'required|string',
            'price' => 'required|numeric',
            'image' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);

        try {
        $file = $request->file('image');
        $originalName = $file->getClientOriginalName();
        $path = $file->storeAs('', $originalName, 'public2');

        $product = new Product();
        $product->user_id = $request->user_id;
        $product->name = $request->name;
        $product->description = $request->description;
        $product->price = $request->price;
        $product->image = $path;
        $product->save();
        //  return back()->with('success', 'File uploaded successfully')->with('path', $path);
        return redirect()->route('products.index')->with('success', 'Product created successfully.');
              } catch (\Exception $e) {
             return redirect()->back()->withErrors(['error' => $e->getMessage()]);
                  }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\product  $product
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $product = product::findorFail($id);
        return view('products.showProduct', compact('product'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\product  $product
     * @return \Illuminate\Http\Response
     */
    public function edit( $id)
    {
        $product = product::findorFail($id);
        return view('products.edit', compact('product'));
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\product  $product
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,  $id)
    {
        
        //    $product = product::findorFail($id);

        // try {
        //        $product = product::findorFail($id);

        //        $product->update($request->all());

        //         return redirect()->back()->with('edit', 'Data Updated successfully');

        //      } catch (\Exception $e) {

        //     return redirect()->back()->withErrors(['error' => $e->getMessage()]);
        //    }
             $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'required|string',
            'price' => 'required|numeric',
            'image' => 'sometimes|image|mimes:jpeg,png,jpg,gif|max:2048',
             ]);


        $product = Product::findOrFail($id);
        $product->name = $request->name;
        $product->description = $request->description;
        $product->price = $request->price;

        if ($request->hasFile('image')) {
            $file = $request->file('image');
            $originalName = $file->getClientOriginalName();
            $path = $file->storeAs('', $originalName, 'public2');
            $product->image = $path;
        }

        $product->save();

        return redirect()->route('products.index')->with('success', 'Product updated successfully');

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\product  $product
     * @return \Illuminate\Http\Response
     */
    public function destroy( $id)
    {
        echo $id ;
        try {

            Product::destroy($id);
            
            return redirect()->back()->with('delete', 'Data has been deleted successfully');

        } 
        catch (\Exception $e) {

            return redirect()->back()->withErrors(['error' => $e->getMessage()]);
        }
    }
}
