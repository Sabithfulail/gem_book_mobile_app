import 'package:flutter/material.dart';
import 'package:gem_book/utils/app_strings.dart';
import '../../widgets/common_appbar.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar:CommonAppBar(
        title: AppStrings.notification,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'There is nothing to show',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
