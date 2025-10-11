import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:omar_ahmed_mentor_ship/ahwa_app/services/di.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/core/widgets/button.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/core/widgets/text_field.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/core/widgets/toast.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/features/home_screen/ui/home_screen.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/features/login_screen/data/login_req_model.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/features/login_screen/logic/cubit/login_cubit.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/features/register_screen/ui/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginLoadingState) {
            showToast("Logging in...", background: Colors.blueAccent);
          } else if (state is LoginSuccessState) {
            showToast("Login Successful ✅", background: Colors.green);
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          } else if (state is LoginErrorState) {
            showToast(
              state.errorModel.errors.toString(),
              background: Colors.red,
              toastLength: Toast.LENGTH_LONG,
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<LoginCubit>();

          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40.h),

                    // Header
                    Center(
                      child: Column(
                        children: [
                          Text(
                            "Welcome",
                            style: TextStyle(
                              fontSize: 28.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            "Please enter your data to continue",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 60.h),

                    // Username
                    AppTextField(
                      controller: cubit.usernameController,
                      label: "Username",
                      suffix: const Icon(Icons.check, color: Colors.green),
                    ),

                    // Password
                    AppTextField(
                      controller: cubit.passwordController,
                      label: "Password",
                      obscureText: true,
                      suffix: const Text(
                        "Strong",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot password?",
                          style: TextStyle(color: Colors.red, fontSize: 14.sp),
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Remember me", style: TextStyle(fontSize: 14.sp)),
                        Switch(
                          value: true,
                          onChanged: (v) {},
                          activeColor: Colors.green,
                        ),
                      ],
                    ),

                    SizedBox(height: 50.h),

                    AppButton(
                      text: "Login",
                      loading: state is LoginLoadingState,
                      onPressed: () {
                        final loginData = LoginModelRequest(
                          email: cubit.usernameController.text,
                          password: cubit.passwordController.text,
                        );
                        cubit.login();
                      },
                    ),

                    SizedBox(height: 20.h),
                    //* Sign Up
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterScreen(),
                                ),
                              );
                            },
                            child: const Text("Sign up"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40.h),
                    Center(
                      child: Text(
                        "By connecting your account you confirm that you agree with our ",
                        style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Center(
                      child: Text(
                        "Term and Condition",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
