import 'package:farm_loan_app/layout/empty_transactions.dart';
import 'package:farm_loan_app/tools/cutomBottomSheet.dart';
import 'package:farm_loan_app/tools/date_time_management.dart';
import 'package:farm_loan_app/tools/helper.dart';
import 'package:farm_loan_app/views/repayment_screen/model/repayment_model.dart';
import 'package:farm_loan_app/views/repayment_screen/services/repayment_service.dart';
import 'package:farm_loan_app/widget/repayment_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class RepaymentScreen extends StatefulWidget {
  const RepaymentScreen({super.key});

  @override
  State<RepaymentScreen> createState() => _RepaymentScreenState();
}

class _RepaymentScreenState extends State<RepaymentScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<RepaymentService>().getRepaymentHistory(context);
  }

  @override
  Widget build(BuildContext context) {
    List<RepaymentModel> data =
        context.watch<RepaymentService>().outstandingHistory;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Repayment'),
        ),
        body: data.isEmpty
            ? Center(child: EmptyTransaction())
            : SingleChildScrollView(
                padding: EdgeInsets.all(20.sp),
                child: Column(
                  children: [
                    ...data.map((item) => InkWell(
                          onTap: () {
                            context
                                .read<RepaymentService>()
                                .addRequestId(item.sId ?? '');
                            customBottomSheet(context, LoanRepaymentWidget());
                          },
                          child: Card(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15.h, horizontal: 20.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Loan Deadline: ',
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        DateTimeManagmentClass.formattedDate(
                                            item.loanDate ?? ''),
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Outstanding Balance: ',
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        'NGN${digitConverterString(item.outstanding ?? '0')}',
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ));
  }
}
