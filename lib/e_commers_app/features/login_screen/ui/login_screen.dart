import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/core/widgets/button.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/core/widgets/text_field.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/core/widgets/toast.dart';
import '../logic/cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCubit = GetIt.I<LoginCubit>();

    return BlocProvider.value(
      value: loginCubit,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccessState) {
                showToast("Login successful!", background: Colors.green);
              } else if (state is LoginErrorState) {
                showToast(state.errorModel.message ?? "Login failed", background: Colors.red);
              }
            },
            builder: (context, state) {
              final cubit = context.read<LoginCubit>();

              return Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
                    ),
                    const SizedBox(height: 20),
                    const Text('Welcome',
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 6),
                    const Text('Please enter your data to continue',
                        style: TextStyle(color: Colors.grey)),
                    const SizedBox(height: 40),

                    AppTextField(
                      label: 'Username',
                      controller: cubit.usernameController,
                    ),
                    const SizedBox(height: 20),
                    AppTextField(
                      label: 'Password',
                      controller: cubit.passwordController,
                      obscureText: true,
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text('Forgot password?',
                            style: TextStyle(color: Colors.red)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Remember me", style: TextStyle(fontSize: 16)),
                        Switch(
                          value: cubit.rememberMe,
                          onChanged: cubit.toggleRemember,
                          activeColor: Colors.green,
                        ),
                      ],
                    ),
                    const Spacer(),
                    AppButton(
                      title: 'Login',
                      isLoading: state is LoginLoadingState,
                      onPressed: cubit.login,
                    ),
                    const SizedBox(height: 16),
                    const Center(
                      child: Text.rich(
                        TextSpan(
                          text:
                              'By connecting your account confirm that you agree\nwith our ',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                          children: [
                            TextSpan(
                              text: 'Term and Condition',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.black),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
