import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mechine_task_project/bloc/purchase/bloc/purchase_bloc_bloc.dart';
import 'package:mechine_task_project/bloc/purchase/bloc/purchase_bloc_event.dart';
import 'package:mechine_task_project/bloc/purchase/bloc/purchase_bloc_state.dart';

class StcPricePage extends StatefulWidget {
  final int planId;

  const StcPricePage({super.key, required this.planId});

  @override
  State<StcPricePage> createState() => _StcPricePageState();
}

class _StcPricePageState extends State<StcPricePage> {
  int selectedCard = 3;
  final TextEditingController quantityController = TextEditingController();
  @override
  void dispose() {
    quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PurchaseBloc, PurchaseBlocState>(
      listener: (context, state) {
        if (state is PurchaseSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Purchase successful')));
        }

        if (state is PurchaseFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.amberAccent,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back, color: Colors.black),
          ),
          centerTitle: true,
          title: Text(
            'Stc',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20.sp,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  color: Colors.amberAccent,
                  padding: EdgeInsets.all(16.w),
                  child: Container(
                    width: double.infinity,
                    height: 130.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(18.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Balance',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            '0.00SR',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 34.sp,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                Text(
                  'Choose Number of Cards',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 22.sp,
                  ),
                ),
                SizedBox(height: 20.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(5, (index) {
                    final colors = [
                      Colors.green,
                      Colors.lightGreen,
                      Colors.lime,
                      Colors.brown,
                      Colors.yellow,
                    ];

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCard = index + 1;
                        });
                      },
                      child: Container(
                        width: 45.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                          color: colors[index],
                          borderRadius: BorderRadius.circular(10.r),
                          border:
                              selectedCard == index + 1
                                  ? Border.all(color: Colors.black, width: 2)
                                  : null,
                        ),
                        child: Center(
                          child: Text(
                            '${index + 1}',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                SizedBox(height: 24.h),

                Text(
                  "- OR -",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),

                SizedBox(height: 24.h),
                Container(
                  width: 240.w,
                  height: 200.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 160.w,
                        child: TextField(
                          controller: quantityController,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: 'Enter Quantity',
                            hintStyle: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 12.h,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 30.h),

                      BlocBuilder<PurchaseBloc, PurchaseBlocState>(
                        builder: (context, state) {
                          final isLoading = state is PurchaseLoading;

                          return SizedBox(
                            width: 90.w,
                            height: 40.h,
                            child: ElevatedButton(
                              onPressed:
                                  isLoading
                                      ? null
                                      : () {
                                        final quantity = int.tryParse(
                                          quantityController.text,
                                        );

                                        if (quantity == null || quantity <= 0) {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                'Please enter a valid quantity',
                                              ),
                                            ),
                                          );

                                          return;
                                        }

                                        context.read<PurchaseBloc>().add(
                                          GetPurchase(
                                            planId: widget.planId,
                                            quantity: quantity,
                                          ),
                                        );
                                      },
                              child:
                                  isLoading
                                      ? SizedBox(
                                        width: 20.w,
                                        height: 20.h,
                                        child: const CircularProgressIndicator(
                                          strokeWidth: 2,
                                        ),
                                      )
                                      : Text(
                                        'Buy',
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Net Price:',
                      style: TextStyle(fontSize: 18.sp, color: Colors.black87),
                    ),
                    Text(
                      '31.00',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 12.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Gross Price:',
                      style: TextStyle(fontSize: 18.sp, color: Colors.black87),
                    ),
                    Text(
                      '35.00',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
