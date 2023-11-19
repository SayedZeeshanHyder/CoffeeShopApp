import 'package:coffeeshop/controllers/ordersController.dart';
import 'package:coffeeshop/model/itemmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyOrders extends StatefulWidget {
  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  final orderController = Get.put(OrdersController());

  @override
  Widget build(BuildContext context) {
    List itemList = orderController.myorders.value;

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Orders"),
      ),
      body: itemList.isEmpty?Center(child: Text("Items Added to the Cart Appears Here",textAlign: TextAlign.center,style: Theme.of(context).textTheme.displayMedium?.copyWith(color: Colors.brown),),):ListView.builder(
          itemCount: itemList.length,
          itemBuilder: (context, index) {
            return SizedBox(
              height: height * 0.25,
              width: width * 0.85,
              child: Card(
                color: Colors.brown,
                child: Padding(
                  padding: EdgeInsets.all(width * 0.03),
                  child: Row(
                    children: [
                      Image.network(itemList[index]['imageurl'],
                          width: width * 0.3),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              SizedBox(
                                child: Text(
                                  itemList[index]['productname'],
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Qty : ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium,
                                  ),
                                  Text(
                                    itemList[index]['quantity'].toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium,
                                  ),
                                  const Spacer(),
                                  InkWell(onTap: (){
                                    orderController.deccrementOrder(index);
                                    setState(() {});
                                  },child: const Icon(Icons.delete,color: Colors.white,),),
                                ],
                              ),
                              const Spacer(),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      foregroundColor: Colors.brown),
                                  child: const Text("Buy Now"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
