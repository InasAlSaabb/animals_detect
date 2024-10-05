import 'dart:io';

import 'package:animals_detect/home_view/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final AnimalDetectorController controller =
        Get.put(AnimalDetectorController());

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text(
          "Detect animals",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 112, 142, 113),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Obx(() {
              return controller.imagePath.value.isNotEmpty
                  ? Image.file(
                      File(controller.imagePath.value),
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    )
                  : const Text('Pick an image to identify');
            }),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: controller.pickImage,
              child: const Text('Pick Image from Gallery'),
            ),
            const SizedBox(height: 20),
            Obx(() {
              return Text(controller.recognitions.isNotEmpty
                  ? controller.recognitions.toString()
                  : ''); // عرض النتائج
            }),
          ],
        ),
      ),
    );
  }
}
