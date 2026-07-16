import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mechine_task_project/ui_screnns/wallet_history.dart';

class EasyCardDrawer extends StatefulWidget {
  const EasyCardDrawer({super.key});

  @override
  State<EasyCardDrawer> createState() => _EasyCardDrawerState();
}

class _EasyCardDrawerState extends State<EasyCardDrawer> {
  final List<Map<String, dynamic>> drawerItems = [
    {
      'icon': Icons.history,
      'title': 'Wallet History',
      'iconColor': Colors.blue,
      'bgColor': Color(0xffEAF4FF),
    },
    {
      'icon': Icons.insert_chart_outlined,
      'title': 'Reports',
      'iconColor': Colors.green,
      'bgColor': Color(0xffEAF7EE),
    },
    {
      'icon': Icons.attach_money,
      'title': 'Fund Request',
      'iconColor': Colors.green,
      'bgColor': Color(0xffEEF8E7),
    },
    {
      'icon': Icons.report_problem_outlined,
      'title': 'Complaint Register',
      'iconColor': Colors.amber,
      'bgColor': Color(0xffFFF8E1),
    },
    {
      'icon': Icons.local_offer_outlined,
      'title': 'Offers',
      'iconColor': Colors.pink,
      'bgColor': Color(0xffFDEBF2),
    },
    {
      'icon': Icons.phone_android,
      'title': 'Device and User Details',
      'iconColor': Colors.brown,
      'bgColor': Color(0xffF5ECE7),
    },
    {
      'icon': Icons.language,
      'title': 'Switch Language',
      'iconColor': Colors.pink,
      'bgColor': Color(0xffFCE8F3),
    },
    {
      'icon': Icons.support_agent,
      'title': 'Support',
      'iconColor': Colors.teal,
      'bgColor': Color(0xffE7F8F7),
    },
    {
      'icon': Icons.sync,
      'title': 'Reconcile Now',
      'iconColor': Colors.orange,
      'bgColor': Color(0xffFFF2E4),
    },
    {
      'icon': Icons.logout,
      'title': 'Logout',
      'iconColor': Colors.purple,
      'bgColor': Color(0xffF2E8FC),
    },
    {
      'icon': Icons.exit_to_app,
      'title': 'Exit',
      'iconColor': Colors.deepOrange,
      'bgColor': Color(0xffFDEDE8),
    },
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
                          child: Icon(
                            Icons.person,
                            color: Colors.red,
                            size: 26.sp,
                          ),
                        ),
                        SizedBox(width: 15.w),
                        Column(
                          children: [
                            Text(
                              'Siraj test 2',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
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
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(12.w),
                itemCount: drawerItems.length,
                itemBuilder: (context, index) {
                  final item = drawerItems[index];

                  return Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12.r),
                      onTap: () {
                        Navigator.pop(context);

                        if (index == 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const WalletHistory(),
                            ),
                          );
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 15.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ListTile(
                          leading: Container(
                            padding: EdgeInsets.all(8.w),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Container(
                              width: 42.w,
                              height: 42.h,
                              decoration: BoxDecoration(
                                color: item['bgColor'],
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              child: Icon(
                                item['icon'],
                                color: item['iconColor'],
                                size: 22.sp,
                              ),
                            ),
                          ),
                          title: Text(
                            item['title'],
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          trailing: const Icon(
                            Icons.chevron_right,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
