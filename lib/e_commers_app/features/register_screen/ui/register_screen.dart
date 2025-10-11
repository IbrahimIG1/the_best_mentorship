import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:omar_ahmed_mentor_ship/ahwa_app/services/di.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/core/widgets/button.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/core/widgets/text_field.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/core/widgets/toast.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/features/register_screen/logic/cubit/register_cubit.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/features/verify_email/cubit/verify_email_cubit.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/features/verify_email/ui/verify_email_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RegisterCubit>(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterErrorState) {
            showToast(
              state.errorModel.errors.toString(),
              background: Colors.red,
              toastLength: Toast.LENGTH_LONG,
            );
          } else if (state is RegisterSuccessState) {
            showToast(
              'Account created successfully!',
              background: Colors.green,
            );
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => BlocProvider(
                  create: (context) => VerifyEmailCubit(getIt()),
                  child: VerifyEmailScreen(
                    email: RegisterCubit.get(context).emailController.text,
                  ),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = RegisterCubit.get(context);

          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back button
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20.h),

                    // Title
                    Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 40.h),

                    // Username
                    AppTextField(
                      controller: cubit.firstNameController,
                      label: "First name",
                    ),
                    SizedBox(height: 24.h),
                    AppTextField(
                      controller: cubit.lastNameController,
                      label: "Last name",
                    ),

                    // Password
                    AppTextField(
                      controller: cubit.passwordController,
                      label: "Password",
                      obscureText: true,
                    ),
                    SizedBox(height: 24.h),

                    // Email Address
                    AppTextField(
                      controller: cubit.emailController,
                      label: "Email Address",
                    ),
                    SizedBox(height: 24.h),

                    // Remember Me
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Remember me",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Switch(
                          value: cubit.rememberMe,
                          activeColor: Colors.green,
                          onChanged: (value) => cubit.toggleRememberMe(value),
                        ),
                      ],
                    ),
                    SizedBox(height: 40.h),

                    // Sign Up Button
                    AppButton(
                      text: "Sign Up",
                      loading: state is RegisterLoadingState,
                      onPressed: () {
                        cubit.register();
                      },
                    ),
                    SizedBox(height: 16.h),
                    AppButton(
                      text: "Go to Verification Screen",
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => BlocProvider(
                  create: (context) => getIt<VerifyEmailCubit>(),
                              child: VerifyEmailScreen(
                                email: cubit.emailController.text,
                              ),
                            ),
                          ),
                        );
                      },
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
