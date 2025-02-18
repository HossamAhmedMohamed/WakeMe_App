import 'dart:async';

import 'package:alarm_app/utils/app_styles.dart';
import 'package:alarm_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DigitalClockWidget extends StatefulWidget {
  const DigitalClockWidget({
    super.key,
  });
  @override
  State<StatefulWidget> createState() {
    return DigitalClockWidgetState();
  }
}

class DigitalClockWidgetState extends State<DigitalClockWidget> {
  var formattedTime = DateFormat('h:mm a').format(DateTime.now());

  late Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      var perviousMinute = DateTime.now().add(Duration(seconds: -1)).minute;
      var currentMinute = DateTime.now().minute;
      if (perviousMinute != currentMinute) {
        setState(() {
          formattedTime = DateFormat('h:mm a').format(DateTime.now());
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print('=====>digital clock updated');
    return Text(formattedTime,
        style: AppStyle.styleSemiBold70(context).copyWith(
          color: CustomColors.primaryTextColor,
          fontWeight: FontWeight.w400,
        ));
  }
}
