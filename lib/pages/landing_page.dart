import 'package:flutter/material.dart';
import 'package:sample_flutter_app/pages/home_page.dart';
import 'package:sample_flutter_app/values/app_assets.dart';
import 'package:sample_flutter_app/values/app_colors.dart';
import 'package:sample_flutter_app/values/app_strings.dart';
import 'package:sample_flutter_app/values/app_styles.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [
          Expanded(
              child: Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              'Welcome to',
              style: AppStyles.h3,
            ),
          )),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                AppStrings.appName,
                style: AppStyles.h2.copyWith(
                    color: AppColors.blackGray, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 70),
                child: Text(
                  'Quotes"',
                  textAlign: TextAlign.right,
                  style: AppStyles.h4.copyWith(height: 0.5),
                ),
              )
            ],
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: RawMaterialButton(
              shape: const CircleBorder(),
              fillColor: AppColors.lightBlue,
              onPressed: () {
                // Redirect to home page and enable to back
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => const HomePage()));

                // Redirect to home page and disable to back
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                    (route) => false);
              },
              child: Image.asset(AppAssets.icFolderPlus),
            ),
          ))
        ]),
      ),
    );
  }
}
