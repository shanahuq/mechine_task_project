import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mechine_task_project/bloc/operator/bloc/operatoe_bloc_bloc.dart';
import 'package:mechine_task_project/bloc/operator/bloc/operatoe_bloc_event.dart';
import 'package:mechine_task_project/bloc/operator/bloc/operatoe_bloc_state.dart';
import 'package:mechine_task_project/bloc/user/bloc/user_bloc_bloc.dart';
import 'package:mechine_task_project/bloc/user/bloc/user_bloc_event.dart';
import 'package:mechine_task_project/bloc/user/bloc/user_bloc_state.dart';
import 'package:mechine_task_project/repository/api%20files/operators_api.dart';
import 'package:mechine_task_project/repository/api%20files/user_api.dart';
import 'package:mechine_task_project/ui_screnns/easy_card_drawer.dart';
import 'package:mechine_task_project/ui_screnns/stc_page.dart';

class EasyCard extends StatefulWidget {
  const EasyCard({super.key});

  @override
  State<EasyCard> createState() => _EasyCardState();
}

class _EasyCardState extends State<EasyCard> {
  // final List<String> logos = [
  //   'assets/images (5).png',
  //   'assets/zain_logo.webp',
  //   'assets/friendi_logo.jpg',
  //   'assets/stc_logo.png',
  //   'assets/lebara_logo.png',
  //   'assets/salam_mobile_logo.jpg',
  // ];
  @override
  void initState() {
    super.initState();

    context.read<UserBloc>().add(const GetUser());
    context.read<OperatorBloc>().add(const GetOperator());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const EasyCardDrawer(),

      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
        leading: Builder(
          builder:
              (context) => IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
        ),
        centerTitle: true,
        title: Text(
          'EASY CARD',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: Colors.red,
                child: Column(
                  children: [
                    Text(
                      'SPECIAL COMBP OFFER IS NOW AVAILABLE',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Column(
                      children: [
                        Container(
                          height: 80.h,
                          width: 350.w,
                          padding: EdgeInsets.symmetric(horizontal: 18.w),

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 10.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Balance',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: Colors.black,
                                      ),
                                    ),
                                    // Text(
                                    //   '1199.71 SAR',
                                    //   style: TextStyle(
                                    //     fontWeight: FontWeight.w500,
                                    //     fontSize: 16.sp,
                                    //     color: Colors.black,
                                    //   ),
                                    // ),
                                    BlocBuilder<UserBloc, UserState>(
                                      builder: (context, state) {
                                        if (state is UserLoading) {
                                          return SizedBox(
                                            height: 20.h,
                                            width: 20.w,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                            ),
                                          );
                                        }
                                        if (state is UserFailure) {
                                          return Text(
                                            '0 SAR',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16.sp,
                                              color: Colors.black,
                                            ),
                                          );
                                        }
                                        if (state is UserSuccess) {
                                          final user = state.user.data;

                                          return Text(
                                            '${user?.walletBalance ?? '0'} SAR',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16.sp,
                                              color: Colors.black,
                                            ),
                                          );
                                        }
                                        return Text(
                                          '0 SAR',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.sp,
                                            color: Colors.black,
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Image.asset(
                                'assets/addimage.png',
                                height: 20.h,
                                width: 20.w,
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 10.h),
                        Container(
                          height: 80.h,
                          width: 350.w,
                          padding: EdgeInsets.symmetric(horizontal: 18.w),

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            color: Colors.black,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Earnings',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                  // Text(
                                  //   '0.96 SAR',
                                  //   style: TextStyle(
                                  //     fontWeight: FontWeight.w500,
                                  //     fontSize: 16.sp,
                                  //     color: Colors.white,
                                  //   ),
                                  // ),
                                  BlocBuilder<UserBloc, UserState>(
                                    builder: (context, state) {
                                      if (state is UserLoading) {
                                        return SizedBox(
                                          height: 20.h,
                                          width: 20.w,
                                          child:
                                              const CircularProgressIndicator(
                                                strokeWidth: 2,
                                                color: Colors.white,
                                              ),
                                        );
                                      }

                                      if (state is UserSuccess) {
                                        final user = state.user.data;

                                        return Text(
                                          '${user?.profitPendingBalance ?? 0} SAR',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.sp,
                                            color: Colors.white,
                                          ),
                                        );
                                      }

                                      return Text(
                                        '0 SAR',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.sp,
                                          color: Colors.white,
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                              Image.asset(
                                'assets/money-transfer.png',
                                height: 20.h,
                                width: 20.w,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40.h),
                  ],
                ),
              ),
              BlocBuilder<OperatorBloc, OperatoeBlocState>(
                builder: (context, state) {
                  if (state is OperartorLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state is OperatorFailure) {
                    return Center(child: Text(state.message));
                  }
                  if (state is OperatorSuccess) {
                    final operators = state.operators;

                    return GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: operators.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 2,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (context, index) {
                        final operator = operators[index];
                        return InkWell(
                          onTap: () {
                            print('Operator ID: ${operator.id}');
                            print('Operator Title: ${operator.title}');
                            print('Operator Image: ${operator.imageLink}');
                            if (operator.title?.toLowerCase() == 'stc') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => StcPage(),
                                ),
                              );
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(12.w),
                              child: Image.network(
                                operators[index].imageLink ?? '',
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(Icons.image_not_supported);
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
