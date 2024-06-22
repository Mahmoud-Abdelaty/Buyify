import 'package:Buyify/core/utils/app_colors.dart';
import 'package:Buyify/core/utils/app_icons.dart';
import 'package:Buyify/features/authentication/cubit/login/login_cubit.dart';
import 'package:Buyify/features/authentication/view/widgets/custom_text_field.dart';
import 'package:Buyify/features/authentication/view/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconic/iconic.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var color = AppColors.half_grey;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(AppIcons.arrow_left_2),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 50.h),
                    Icon(Iconic.home),
                    Text(
                      "Welcome back to\nBuyify",
                      style: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "Please enter your login information.",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    StreamBuilder<String?>(
                        stream: context.read<LoginCubit>().emailStream,
                        builder: (context, snapshot) {
                          return CustomTextField(
                            hint: 'Email',
                            controller: _emailController,
                            onChanged: context.read<LoginCubit>().updateEmail,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                          );
                        }),
                    SizedBox(height: 20.h),
                    StreamBuilder<String?>(
                        stream: context.read<LoginCubit>().passwordStream,
                        builder: (context, snapshot) {
                          return CustomTextField(
                            hint: 'Password',
                            obscure: true,
                            obscureClicked: () => context
                                .read<LoginCubit>()
                                .changePasswordVisibility(),
                            icon: context.read<LoginCubit>().visibility
                                ? AppIcons.eye
                                : AppIcons.eye_slash,
                            controller: _passwordController,
                            onChanged:
                                context.read<LoginCubit>().updatePassword,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          );
                        }),
                    SizedBox(height: 20.h),
                    PrimaryButton(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            color = AppColors.blue_ocean;
                          });
                          print('Email: ${_emailController.text}');
                          print('Password: ${_passwordController.text}');
                        }
                      },
                      color: color,
                      text: 'Login',
                    ),
                    SizedBox(height: 150.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Forgot Password",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.navy_black,
                          ),
                        ),
                        Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.blue_ocean,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _emailController.dispose();
  }
}
