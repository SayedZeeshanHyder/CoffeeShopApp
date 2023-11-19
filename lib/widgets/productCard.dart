import 'package:coffeeshop/controllers/ordersController.dart';
import 'package:coffeeshop/model/itemmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget{

  final imageUrl;
  final name;

  ProductCard({required this.imageUrl,required this.name});

  final orderController = Get.put(OrdersController());

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      height: height*0.25,
      width: width*0.85,
      child: Card(
        color: Colors.brown,
        child: Padding(
          padding: EdgeInsets.all(width*0.02),
          child: Row(
            children: [
              Image.network(imageUrl,width: width*0.3),
              Expanded(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(name,style: Theme.of(context).textTheme.displayMedium,maxLines: 2,overflow: TextOverflow.ellipsis,),
                    ElevatedButton(onPressed: (){
                      orderController.incrementOrder(ItemModel.fromJson({"productname": name, "imageurl": imageUrl,"quantity":0}));
                    },style: ElevatedButton.styleFrom(backgroundColor: Colors.white,foregroundColor: Colors.brown),
                      child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Add to Cart",),
                        Icon(Icons.shopping_cart,color: Colors.brown,)
                      ],
                    ),),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(backgroundColor: Colors.white,foregroundColor: Colors.brown),child: const Text("Buy Now"),)),
                  ],
                ),
              ),),
            ],
          ),
        ),
      ),
    );
  }

}