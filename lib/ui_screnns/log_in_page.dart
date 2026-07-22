import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mechine_task_project/bloc/log_in/log_in_bloc_bloc.dart';
import 'package:mechine_task_project/bloc/log_in/log_in_bloc_event.dart';
import 'package:mechine_task_project/bloc/log_in/log_in_bloc_state.dart';
import 'package:mechine_task_project/ui_screnns/easy_card.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  bool isVisible = true;
  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => EasyCard()),
          );
        }

        if (state is LoginFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset('assets/backgroundimage.jpeg', fit: BoxFit.cover),
              Container(color: Colors.black.withOpacity(0.4)),
              SizedBox(height: 50.h),

              Center(
                child: Transform.translate(
                  offset: const Offset(0, -100), // Move up by 100 pixels
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 120,
                          width: 120.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10.w),
                            child: Image.asset(
                              'assets/splash.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        TextField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: 'Phone Number',
                            filled: true,
                            fillColor: Colors.white,
                            prefix: Padding(
                              padding: EdgeInsets.only(left: 2.w, right: 10.w),
                              child: Image.asset(
                                'assets/soudiflag.jpeg',
                                height: 20.h,
                                width: 20.w,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.r),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 15.h),
                        TextField(
                          controller: passwordController,
                          obscureText: isVisible,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            filled: true,
                            fillColor: Colors.white,
                            prefix: Padding(
                              padding: EdgeInsets.only(left: 2.w, right: 10.w),
                              child: Icon(
                                Icons.password,
                                color: const Color.fromARGB(213, 0, 0, 0),
                              ),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                isVisible
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                              ),
                              onPressed: () {
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              },

                              color: const Color.fromARGB(213, 0, 0, 0),
                              iconSize: 18.sp,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.r),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 28.h),
                        SizedBox(
                          height: 50.h,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              backgroundColor: Colors.red,
                            ),
                            onPressed: () {
                              context.read<LoginBloc>().add(
                                LoginButtonPressed(
                                  phone: phoneController.text.trim(),
                                  password: passwordController.text.trim(),
                                ),
                              );
                            },
                            child:
                                state is LoginLoading
                                    ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                    : Text(
                                      "LOGIN",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
