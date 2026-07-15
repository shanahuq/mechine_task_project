import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EasyCardDrawer extends StatefulWidget {
  const EasyCardDrawer({super.key});

  @override
  State<EasyCardDrawer> createState() => _EasyCardDrawerState();
}

class _EasyCardDrawerState extends State<EasyCardDrawer> {
  final List<Map<String,dynamic>> drawerItems = [{
'icon':Icons.history,'title':'Wallet History'
  },
  {'icon':Icons.insert_chart_outlined,'title':'Reports'},
  {'icon':Icons.accoun}
  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.red,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'EasyCart',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30.r,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.person, color: Colors.red,size: 26.sp,),
                        ),
                        SizedBox(width: 15.w,),
                        Column(
                          children: [
                            Text(
                              'Siraj test 2',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '0510775485',
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: const Color.fromARGB(165, 255, 255, 255),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
