import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WalletHistory extends StatefulWidget {
  const WalletHistory({super.key});

  @override
  State<WalletHistory> createState() => _WalletHistoryState();
}

class _WalletHistoryState extends State<WalletHistory> {
  final List<Map<String, dynamic>> transactions = [
    {
      "date": "2026-07-13 09:13:02 PM",
      "type": "recharge",
      "payment": "card",
      "gross": "32.42 - 0.29",
      "amount": "32.13",
      "isCredit": true,
    },
    {
      "date": "2026-07-13 09:02:26 PM",
      "type": "datacard-purchase",
      "payment": "cash",
      "gross": "",
      "amount": "-20.00",
      "isCredit": false,
    },
    {
      "date": "2026-07-13 06:06:17 PM",
      "type": "profit-redeem",
      "payment": "cash",
      "gross": "",
      "amount": "27.96",
      "isCredit": true,
    },
    {
      "date": "2026-07-13 06:03:25 PM",
      "type": "datacard-purchase",
      "payment": "cash",
      "gross": "",
      "amount": "-20.00",
      "isCredit": false,
    },
    {
      "date": "2026-07-13 05:51:43 PM",
      "type": "admin-approved-fund",
      "payment": "cash",
      "gross": "",
      "amount": "100.00",
      "isCredit": true,
    },
    {
      "date": "2026-07-13 05:49:55 PM",
      "type": "recharge",
      "payment": "cash",
      "gross": "1.00-0.01",
      "amount": "0.88",
      "isCredit": true,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          'Wallet History',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20.sp,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.red,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
            child: Column(
              children: [
                _summaryRow("Balance", "1199.71"),
                _summaryRow("Total Recharge", "1733.21"),
                _summaryRow("Current Outstanding", "1733.21"),
                _summaryRow("Used Amount", "533.5"),
                _summaryRow("Total Collected", "0"),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8.w),
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final item = transactions[index];

                return _transactionCard(item);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _summaryRow(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _transactionCard(Map<String, dynamic> item) {
    return Card(
      margin: EdgeInsets.only(bottom: 12.h),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          children: [
            _historyRow("Date", item["date"]),
            _historyRow("Type", item["type"]),
            _historyRow("Payment Method", item["payment"]),

            if (item["gross"] != "") _historyRow("Gross Amount", item["gross"]),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Amount", style: TextStyle(fontSize: 13.sp)),
                Text(
                  item["amount"],
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                    color: item["isCredit"] ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _historyRow(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 13.sp, color: Colors.black87)),
          Text(value, style: TextStyle(fontSize: 13.sp, color: Colors.black54)),
        ],
      ),
    );
  }
}
