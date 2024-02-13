import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salla'),
        
      ),
    );
  }
}


// TextButton(
//               onPressed: () {
//                 CacheHelper.removeData(key: 'token');
//                 navigateAndFinish(context, LoginScreen());
//               },
//               child: const Text('SIGN OUT'),
//             )