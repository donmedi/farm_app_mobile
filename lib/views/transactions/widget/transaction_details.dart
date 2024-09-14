import 'package:farm_loan_app/tools/date_time_management.dart';
import 'package:farm_loan_app/tools/helper.dart';
import 'package:farm_loan_app/views/repayment_screen/model/history_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionDetails extends StatelessWidget {
  final HistoryModel model;
  const TransactionDetails({super.key, required this.model});

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
          _rowData('Date',
              DateTimeManagmentClass.formattedDate(model.createdAt ?? '')),
          SizedBox(
            height: 14.h,
          ),
          _rowData('Status', 'Success'),
          SizedBox(
            height: 14.h,
          ),
          _rowData('Transaction Type', capitalize(model.type ?? '')),
          SizedBox(
            height: 14.h,
          ),
          _rowData('Amount',
              'NGN ${model.amountPaid != 'null' ? digitConverterString(model.amountPaid ?? '0') : digitConverterString(model.amount ?? '0')}'),
          SizedBox(
            height: 14.h,
          ),
          // _rowData('Payment Type', 'Farm Produce'),
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
