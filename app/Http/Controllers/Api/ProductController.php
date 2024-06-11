<?php
namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use App\Models\product;
use Illuminate\Http\Request;
 use App\Http\Controllers\Api\ApiResponseTrait;
 use Illuminate\Http\JsonResponse;
 use App\Http\Resources\ProductResource;
 use Illuminate\Support\Facades\Storage;



class ProductController extends Controller
{
    use ApiResponseTrait;
    public function index(){ 
           
        // $items = product::all();
        $items =  ProductResource::collection(product::get());

        return $this->successResponse($items, 'Items saved successfully');
          }

     public function show($id)
        {
              $item = product::find($id);
      
              if (!$item) {
                  return $this->errorResponse('Item not found', 404);
              }
      
              return $this->successResponse(new ProductResource($item), 'Item retrieved successfully');
          }

               public function store(Request $request){

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
                echo $product->save();

                  return $this->successResponse($product, 'Items saved successfully');

                } catch (\Exception $e) {
    
                   return $this->errorResponse('Item not found', 404);
                   }

          }
          
          public function  update(Request $request, $id){
           $product = product::find($id);
           if (!$product) {
            return $this->errorResponse('Item not found', 404);
        }
            $request->validate([
              'name' => 'required|string|max:255',
              'description' => 'required|string',
              'price' => 'required|numeric',
              'image' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
          ]);
             
            
            $updateData = $request->only([ 'name','description','price','user_id', ]);
            $file = $request->file('image');
            $originalName = $file->getClientOriginalName();
            $path = $file->storeAs('', $originalName, 'public2');
            $updateData['image'] = $path;
            $product->update($updateData);
            return response()->json(['message' => 'Product updated successfully', 'product' => $product]);

          }
     public function destroy( $id){
      
    {
        // Find the product by ID
        $product = Product::find($id);
        if (!$product) {
            return response()->json(['message' => 'Product not found'], 404);
        }
        // Delete the image file if it exists
        if ($product->image) {
            Storage::delete($product->image);
        }

        // Delete the product
        $product->delete();

        return response()->json(['message' => 'Product deleted successfully']);
    }

        }
      }
