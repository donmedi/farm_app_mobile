import 'package:farm_loan_app/constant/color_const.dart';
import 'package:farm_loan_app/tools/cutomBottomSheet.dart';
import 'package:farm_loan_app/views/dashboard/services/dashboard_services.dart';
import 'package:farm_loan_app/views/dashboard/widget/histroy_widget.dart';
import 'package:farm_loan_app/views/repayment_screen/model/history_model.dart';
import 'package:farm_loan_app/views/transactions/widget/transaction_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<DashboardServices>().fetchHistory(context);
  }

  @override
  Widget build(BuildContext context) {
    List<HistoryModel> historyList =
        context.watch<DashboardServices>().histories;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text('Transactions'),
      ),
      body: ListView(
        children: [...historyList.map((item) => HistoryCard(item: item))],
      ),
    );
  }
}
