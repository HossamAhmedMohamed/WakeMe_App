// ignore_for_file: library_private_types_in_public_api
import 'package:alarm_app/screens/clock_view.dart';
import 'package:alarm_app/utils/app_styles.dart';
import 'package:alarm_app/utils/colors.dart';
import 'package:alarm_app/widgets/digital_clock.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClockPage extends StatefulWidget {
  const ClockPage({super.key});

  @override
  _ClockPageState createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();

    var formattedDate = DateFormat('EEE, d MMM').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = timezoneString.startsWith('-') ? '-' : '+';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Text(
              'Clock',
              style: AppStyle.styleSemiBold25(context).copyWith(
                color: CustomColors.primaryTextColor,
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DigitalClockWidget(),
                Text(formattedDate,
                    style: AppStyle.styleRegular20(context).copyWith(
                      color: CustomColors.primaryTextColor,
                    )),
              ],
            ),
          ),
          Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: Align(
              alignment: Alignment.center,
              child: ClockView(
                size: MediaQuery.sizeOf(context).height / 3.3,
              ),
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Timezone',
                    style: AppStyle.styleRegular25(context).copyWith(
                      fontWeight: FontWeight.w500,
                      color: CustomColors.primaryTextColor,
                    )),
                SizedBox(height: 16),
                Row(
                  children: [
                    Icon(
                      Icons.language,
                      color: CustomColors.primaryTextColor,
                    ),
                    SizedBox(width: 10),
                    Text('UTC $offsetSign$timezoneString',
                        style: AppStyle.styleRegular16(context).copyWith(
                          color: CustomColors.primaryTextColor,
                        )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
