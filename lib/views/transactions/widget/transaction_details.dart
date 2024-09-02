import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionDetails extends StatelessWidget {
  const TransactionDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 14.h,
          ),
          Row(
            children: [
              BackButton(),
              Text(
                'Transaction Details',
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          _rowData('Date', '12/03/2024'),
          SizedBox(
            height: 14.h,
          ),
          _rowData('Status', 'Pending'),
          SizedBox(
            height: 14.h,
          ),
          _rowData('Transaction Type', 'Debit'),
          SizedBox(
            height: 14.h,
          ),
          _rowData('Amount', '20000'),
          SizedBox(
            height: 14.h,
          ),
          _rowData('Payment Type', 'Farm Produce'),
          SizedBox(
            height: 24.h,
          )
          // _rowData('Date', '12/03/2024'),
        ],
      ),
    );
  }
}

Widget _rowData(String title, String desc) {
  return Row(
    children: [
      Text(title),
      Spacer(),
      Text(desc),
    ],
  );
}
