import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mechine_task_project/ui_screnns/easy_card_drawer.dart';
import 'package:mechine_task_project/ui_screnns/stc_page.dart';

class EasyCard extends StatefulWidget {
  const EasyCard({super.key});

  @override
  State<EasyCard> createState() => _EasyCardState();
}

class _EasyCardState extends State<EasyCard> {
  final List<String> logos = [
    'assets/images (5).png',
    'assets/zain_logo.webp',
    'assets/friendi_logo.jpg',
    'assets/stc_logo.png',
    'assets/lebara_logo.png',
    'assets/salam_mobile_logo.jpg',
  ];
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
                                    Text(
                                      '1199.71 SAR',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.sp,
                                        color: Colors.black,
                                      ),
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
                                  Text(
                                    '0.96 SAR',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                      color: Colors.white,
                                    ),
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
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: logos.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      if (index == 3) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => StcPage()),
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
                        child: Image.asset(logos[index], fit: BoxFit.cover),
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
  }
}
