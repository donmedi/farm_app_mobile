import 'package:farm_loan_app/constant/color_const.dart';
import 'package:farm_loan_app/layout/empty_transactions.dart';
import 'package:farm_loan_app/tools/cutomBottomSheet.dart';
import 'package:farm_loan_app/tools/date_time_management.dart';
import 'package:farm_loan_app/tools/helper.dart';
import 'package:farm_loan_app/views/dashboard/services/dashboard_services.dart';
import 'package:farm_loan_app/views/repayment_screen/model/history_model.dart';
import 'package:farm_loan_app/views/transactions/widget/transaction_details.dart';
import 'package:farm_loan_app/widget/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<HistoryModel> historyList =
        context.watch<DashboardServices>().histories;

    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Transactions',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
              ),
              Text(
                'See all',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline),
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          historyList.isEmpty
              ? EmptyTransaction()
              : Column(
                  children: [
                    ...historyList.map((item) => HistoryCard(
                          item: item,
                        ))
                  ],
                )
        ],
      ),
    );
  }
}

class HistoryCard extends StatelessWidget {
  final HistoryModel item;
  const HistoryCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        customBottomSheet(context, TransactionDetails());
      },
      leading: CircleAvatar(
        backgroundColor:
            item.type == 'loan' ? Colors.orangeAccent : Colors.green,
        child: Icon(item.type != 'loan'
            ? FeatherIcons.arrowUpRight
            : FeatherIcons.arrowDownLeft),
      ),
      title: Text(capitalize(item.type ?? '')),
      subtitle:
          Text(DateTimeManagmentClass.formattedDate(item.createdAt ?? '')),
      trailing: Text(
          'NGN ${item.amountPaid != 'null' ? digitConverterString(item.amountPaid ?? '0') : digitConverterString(item.amount ?? '0')}'),
    );
  }
}
