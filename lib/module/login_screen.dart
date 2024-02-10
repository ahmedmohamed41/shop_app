import 'package:flutter/material.dart';
import 'package:shop_app/shared/components/constaints.dart';
import 'package:shop_app/widgets/custom_button.dart';
import 'package:shop_app/widgets/custom_text_from_filed.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const Center(
              child: CircleAvatar(
                radius: 100.0,
                backgroundColor: defaultColor,
                child: Image(
                  image: AssetImage('assets/images/onboard_1.jpg'),
                ),
              ),
            ),
            const Text(
              'LOGIN',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            const CustomTextFormField(
              labelText: 'Email',
              inputType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 15.0,
            ),
            const CustomTextFormField(
              labelText: 'PassWord',
              inputType: TextInputType.visiblePassword,
            ),
            const SizedBox(
              height: 30.0,
            ),
            const CustomButton(
              text: 'LOGIN',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "don't have an account? ",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(
                    //   builder: (context) {
                    //     return const RegisterPage();
                    //   },
                    // ));
                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
