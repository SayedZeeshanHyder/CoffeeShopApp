import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeeshop/model/itemmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController{

  final _currentUser = FirebaseAuth.instance.currentUser;
  RxInt orderNo = 0.obs;
  var myorders = [].obs;

  deccrementOrder(int index) async {
    myorders.value.removeAt(index);
    orderNo.value=orderNo.value-1;
    updateOrder();
  }

  incrementOrder(ItemModel itemModel){
    myorders.value.add(itemModel.toJson());
    orderNo.value=orderNo.value+1;
    updateOrder();
  }

  updateOrder()async{
    await FirebaseFirestore.instance.collection('Users').doc(_currentUser!.uid).update({
      "nooforders":orderNo.value,
      "orders":myorders.value
    });
  }



}