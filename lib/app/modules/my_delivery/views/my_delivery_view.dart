import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/my_delivery_controller.dart';

class MyDeliveryView extends GetView<MyDeliveryController> {
  const MyDeliveryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyDeliveryView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MyDeliveryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
