import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/module/home/shop_screen.dart';
import 'package:shop_app/module/login/cubit/login_cubit.dart';
import 'package:shop_app/module/register/cubit/register_cubit.dart';
import 'package:shop_app/shared/components/constaints.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:shop_app/widgets/custom_button.dart';
import 'package:shop_app/widgets/custom_text_from_filed.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is RegisterSuccessState) {
            if (state.model.status!) {
              CacheHelper.saveData(key: 'token', value: state.model.data!.token)
                  .then((value) {
                flutterToastShow(state, Colors.green);
                navigateAndFinish(context, const ShopScreen());
              });
            } else {
              print((state.model.message));
              flutterToastShow(state, Colors.red);
            }
          }
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 110,
                    ),
                    const Text(
                      'REGISTER',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      'Register now to browse our hot offers',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    CustomTextFormField(
                      controller: emailController,
                      labelText: 'Email Address',
                      inputType: TextInputType.emailAddress,
                      prefixIcon: const Icon(Icons.email_outlined),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email address';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    CustomTextFormField(
                      controller: passwordController,
                      labelText: 'PassWord',
                      inputType: TextInputType.visiblePassword,
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: RegisterCubit.get(context).suffix,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        } else {
                          return null;
                        }
                      },
                      isPassword: RegisterCubit.get(context).isPassword,
                      suffixPressed: () {
                        RegisterCubit.get(context).changePasswordVisibility();
                      },
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    CustomTextFormField(
                      controller: nameController,
                      labelText: 'Name',
                      inputType: TextInputType.name,
                      prefixIcon: const Icon(Icons.person),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    CustomTextFormField(
                      controller: phoneController,
                      labelText: 'Phone',
                      inputType: TextInputType.phone,
                      prefixIcon: const Icon(Icons.phone),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your phone';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    ConditionalBuilder(
                      condition: state is! RegisterLoadingState,
                      builder: (context) => CustomButton(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            RegisterCubit.get(context).userRegister(
                                name: nameController.text,
                                phone: phoneController.text,
                                email: emailController.text,
                                password: passwordController.text);
                          }
                        },
                        text: 'REGISTER',
                      ),
                      fallback: (context) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account? ",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            ' Login',
                            style: TextStyle(
                              color: kAppbarColor,
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
            ),
          );
        },
      ),
    );
  }
}
