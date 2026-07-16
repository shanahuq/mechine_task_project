import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mechine_task_project/ui_screnns/stc_price_page.dart';

class StcPage extends StatefulWidget {
  const StcPage({super.key});

  @override
  State<StcPage> createState() => _StcPageState();
}

class _StcPageState extends State<StcPage> {
  final List<Map<String, dynamic>> comboPackages = [
    {
      'image': 'assets/sava_basic.jpeg',
      'price': '35.00 SR',
      'oldPrise': '31.00 SR',
    },
    {
      'image': 'assets/sawa_flex.jpeg',
      'price': '75.00 SR',
      'oldPrise': '67.30 SR',
    },
    {
      'image': 'assets/sawa_like_plus.jpeg',
      'price': '86.50 SR',
      'oldPrise': '77.75 SR',
    },
    {
      'image': 'assets/sawa_flex_100.jpeg',
      'price': '115.00 SR',
      'oldPrise': '102.00 SR',
    },
    {
      'image': 'assets/sawa_share_plus_115.jpeg',
      'price': '115.00 SR',
      'oldPrise': '102.00 SR',
    },
    {
      'image': 'assets/sawa_flex_150.jpeg',
      'price': '115.00 SR',
      'oldPrise': '102.00 SR',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.amberAccent,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back, color: Colors.black),
          ),
          title: Text(
            'Stc',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20.sp,
              color: Colors.black,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(45.h),
            child: TabBar(
              indicatorColor: Colors.black,
              indicatorWeight: 3,
              labelColor: Colors.black,
              unselectedLabelColor: const Color.fromARGB(187, 0, 0, 0),
              tabs: const [
                Tab(text: 'Data'),
                Tab(text: 'Voice'),
                Tab(text: 'Combo'),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('Data')),
            Center(child: Text('Voice')),
            Padding(
              padding: EdgeInsets.all(16.w),
              child: GridView.builder(
                itemCount: comboPackages.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.h,
                  childAspectRatio: 0.80,
                ),
                itemBuilder: (context, index) {
                  final item = comboPackages[index];

                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(.18),
                          blurRadius: 12,
                          spreadRadius: 2,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12.w),
                      child: Column(
                        children: [
                          Image.asset(
                            item['image'],
                            height: 120.h,
                            fit: BoxFit.contain,
                          ),

                          SizedBox(height: 12.h),

                          Text(
                            item['price'],
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 4.h),

                          Text(
                            item['oldPrise'],
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey,
                            ),
                          ),

                          const Spacer(),

                          SizedBox(
                            width: 90.w,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.yellow,
                                foregroundColor: Colors.black,
                                elevation: 3,
                                shape: const StadiumBorder(),
                              ),
                              onPressed: () {
                                if (index == 0) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => const StcPricePage(),
                                    ),
                                  );
                                }
                              },
                              child: const Text("Details"),
                            ),
                          ),
                        ],
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
