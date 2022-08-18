import 'package:flutter/material.dart';
import 'package:flutter_application_1/values/app_assets.dart';
import 'package:flutter_application_1/values/app_colors.dart';
import 'package:flutter_application_1/values/app_styles.dart';
import 'package:flutter_application_1/values/shared_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ControlPage extends StatefulWidget {
  const ControlPage({Key? key}) : super(key: key);

  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  double sliderValue = 5;
  late SharedPreferences prefs;

  onLeadingTapped() async {
    await prefs.setInt(SharedKeys.counter, sliderValue.toInt());
    if (!mounted) return;
    Navigator.pop(context);
  }

  initDefaultValues() async {
    prefs = await SharedPreferences.getInstance();
    int newSliderValue = prefs.getInt(SharedKeys.counter) ?? 5;
    setState(() {
      sliderValue = newSliderValue.toDouble();
    });
  }

  @override
  void initState() {
    initDefaultValues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondColor,
      appBar: AppBar(
        backgroundColor: AppColors.secondColor,
        elevation: 0,
        title: Text(
          'English today',
          style: AppStyles.h3.copyWith(
              color: AppColors.textColor,
              fontSize: 36,
              fontWeight: FontWeight.bold),
        ),
        leading: InkWell(
          onTap: onLeadingTapped,
          child: Image.asset(AppAssets.icFolderPlus),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(children: [
          const Spacer(),
          Text(
            'How much a number word at once',
            style:
                AppStyles.h4.copyWith(color: AppColors.textColor, fontSize: 18),
          ),
          const Spacer(),
          Text('${sliderValue.toInt()}',
              style: AppStyles.h1.copyWith(
                  color: AppColors.primaryColor,
                  fontSize: 150,
                  fontWeight: FontWeight.bold)),
          Slider(
              value: sliderValue,
              min: 5,
              max: 100,
              divisions: 95,
              activeColor: AppColors.primaryColor,
              inactiveColor: AppColors.primaryColor,
              onChanged: (value) {
                setState(() {
                  sliderValue = value;
                });
              }),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            alignment: Alignment.centerLeft,
            child: Text('Slide to set',
                style: AppStyles.h5.copyWith(
                  color: AppColors.textColor,
                )),
          ),
          const Spacer(),
          const Spacer(),
          const Spacer(),
        ]),
      ),
    );
  }
}
