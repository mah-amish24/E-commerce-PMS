<?php
namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use App\Models\product;
use Illuminate\Http\Request;
 use App\Http\Controllers\Api\ApiResponseTrait;
 use Illuminate\Http\JsonResponse;
 use App\Http\Resources\ProductResource;



class ProductController extends Controller
{
    use ApiResponseTrait;
    public function index(){ 
           
        // $items = product::all();
        $items =  ProductResource::collection(product::get());

        return $this->successResponse($items, 'Items retrieved successfully');
          }

          public function show($id)
          {
              $item = product::find($id);
            // $item = new ProductResource(product::find($id));
      
              if (!$item) {
                  return $this->errorResponse('Item not found', 404);
              }
      
              return $this->successResponse(new ProductResource($item), 'Item retrieved successfully');
          }

               public function store(Request $request){
               
                $validator = Validator::make($request->all(), [
                  //'name' => 'required|string|max:255',
                  'description' => 'required',
                  // 'price' => 'required|numeric|min:0',
                  ]);
                  // if ($validator->fails()) {
                  //  return $this->errorResponse($validator->errors(),400);
                  //                    }


               $product = product::create($request->all());

               if ($product) {
               return $this->successResponse(new ProductResource($product), 'Item Saved successfully');
               } else {

               return $this->errorResponse('Item not found', 404);
               }

          }


}
