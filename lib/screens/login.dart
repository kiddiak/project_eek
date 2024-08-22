import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_eek/layouts/main.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Get.toNamed('/');
            },
            child: const Text('Go to Home Screen'),
          ),
        ]
      )
    );
  }
}