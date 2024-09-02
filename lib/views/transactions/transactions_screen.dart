import 'package:farm_loan_app/constant/color_const.dart';
import 'package:farm_loan_app/tools/cutomBottomSheet.dart';
import 'package:farm_loan_app/views/transactions/widget/transaction_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text('Transactions'),
      ),
      body: ListView(
        children: [
          ...List.generate(20, (e) {
            return ListTile(
              onTap: () {
                customBottomSheet(context, TransactionDetails());
              },
              leading: CircleAvatar(
                backgroundColor: ColorConst.darkText,
                child: Icon(FeatherIcons.arrowDownLeft),
              ),
              title: Text('Repayment'),
              subtitle: Text('12/3/2024'),
              trailing: Text('12,000'),
            );
          })
        ],
      ),
    );
  }
}
