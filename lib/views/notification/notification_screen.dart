import 'package:farm_loan_app/constant/color_const.dart';
import 'package:farm_loan_app/views/dashboard/services/dashboard_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<DashboardServices>().fetchNotification(context);
  }

  @override
  Widget build(BuildContext context) {
    List data = context.watch<DashboardServices>().notifications;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text('Notification'),
      ),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, index) {
            return ListTile(
              leading: Container(
                height: 45.sp,
                width: 45.sp,
                child: Icon(Icons.notifications),
                decoration: BoxDecoration(
                    color: ColorConst.mainPrimaryColor,
                    borderRadius: BorderRadius.circular(4.r)),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data[index]['title'],
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    data[index]['body'],
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
