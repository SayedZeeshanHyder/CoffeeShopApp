import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeeshop/controllers/ordersController.dart';
import 'package:coffeeshop/screens/myorders.dart';
import 'package:coffeeshop/screens/startpage.dart';
import 'package:coffeeshop/widgets/productCard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget{
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>{


  String search="";

  final searchController = TextEditingController();

  final orderController = Get.put(OrdersController());
 
  final currentUser = FirebaseAuth.instance.currentUser;

  getOrders() async {
    FirebaseFirestore.instance.collection("Users").doc(currentUser!.uid).get().then((value){
      orderController.orderNo.value = value.data()!["nooforders"];
      orderController.myorders.value=value.data()!["orders"];
    });
  }

  @override
  void initState() {
    super.initState();
    getOrders();
  }

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final listOfImages = [
      "https://listerr.in/wp-content/uploads/2021/06/1622716000_Nescafe_Classic_Coffee_Powder_Pouch_500g.jpg",
      "https://images.jdmagicbox.com/quickquotes/images_main/instant-coffee-premium-classic-250-grams-packet-2039251139-13gk4ndf.jpg",
      "https://nithara.com/cdn/shop/products/NitharaSuper-200gx5Combo_720x.jpg?v=1585943214",
      "https://m.media-amazon.com/images/I/410D2Mcq6dL._SX300_SY300_QL70_FMwebp_.jpg",
    ];

    final namesOfProducts = [
      "Nescafe Classic Coffee Powder Pouch (500g)",
      "Instant Coffee - Classic (70% Coffee - 30% Chicory) ( 250 Grams Packet )",
      "Nithara Super - 55% Coffee, 45% Chicory Filter Coffee - 1kg (200g X 5 Packets) - Combo",
      "Amzn 3 In 1 Regular Coffee Premix Powder Coffee Milk And Sugar 1 Kg Pack For Vending Machine And Manual Use, Bag"
    ];

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () async{
            await FirebaseAuth.instance.signOut();
            Get.off(()=>StartPage());
          },icon: const Icon(Icons.logout),),
        ],
        title: Text("Coffee Day",style: Theme.of(context).textTheme.displayMedium,),
      ),
      floatingActionButton: InkWell(
        onTap: (){
          Get.to(()=>MyOrders(),transition: Transition.cupertino);
        },
        child: CircleAvatar(
          radius: 30,
          child: Stack(
            children: [
              const Icon(Icons.shopping_cart,size: 40,color: Colors.brown,),
              Positioned(top: 0,right: 0,child: CircleAvatar(backgroundColor: Colors.white,radius: 10,child: Obx(()=> Text(orderController.orderNo.toString(),style: const TextStyle(color: Colors.brown),),),),),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Products",style: Theme.of(context).textTheme.displayLarge?.copyWith(color: Colors.brown),),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onTapOutside: (val){
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    onChanged: (val){
                      setState(() {
                        search = val;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Search for Products here.",
                      border: OutlineInputBorder(
                        borderRadius:BorderRadius.circular(30)
                      ),
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                ),
              ),
              IconButton(onPressed: (){

                Get.bottomSheet(Container(
                  color: Colors.white,
                  height: height*0.25,
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Brands",style: Theme.of(context).textTheme.displayMedium?.copyWith(color: Colors.brown),),
                        Expanded(
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Chip(label: Text("Nescafe"),),
                              Chip(label: Text("Nescafe"),),
                              Chip(label: Text("Nescafe"),),
                            ],
                          ),
                        ),
                        Text("Prices",style: Theme.of(context).textTheme.displayMedium?.copyWith(color: Colors.brown),),
                        Expanded(
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Chip(label: Text("Above ₹50"),),
                              Chip(label: Text("Above ₹100"),),
                              Chip(label: Text("Above ₹200"),),
                            ],
                          ),
                        ),
                        Text("Brands",style: Theme.of(context).textTheme.displayMedium?.copyWith(color: Colors.brown),),
                        Expanded(
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Chip(label: Text("Nescafe"),),
                              Chip(label: Text("Nescafe"),),
                              Chip(label: Text("Nescafe"),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),);

              }, icon: const Icon(Icons.filter_list),),
            ],
          ),
          Expanded(
            child: ListView.builder(physics: const BouncingScrollPhysics(),itemCount: 4,itemBuilder: (context,index){
              if(search!="" && !namesOfProducts[index].toLowerCase().contains(search.toLowerCase())) {
                return const SizedBox();
              }
              return ProductCard(imageUrl: listOfImages[index],
                  name: namesOfProducts[index]);
            }),
          ),
        ],
      ),
    );
  }
}