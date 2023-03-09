import 'package:flutter/material.dart';
import 'package:quiz_admin/core/extensions/string_extension.dart';
import 'package:quiz_admin/core/util/navigator_helper.dart';
import 'package:quiz_admin/features/authentication/presentation/widgets/custom_button.dart';
import 'package:quiz_admin/resources/colors_manager.dart';

import '../../core/shared/components/background_image.dart';
import '../../resources/app_strings.dart';
import '../home_screen/presentation/home_screen.dart';

class ScoreScreen extends StatelessWidget {
  final String score;
  const ScoreScreen({required this.score, Key? key}) : super(key: key);
  static String routeName = 'score_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const BackgroundImage(),
          SafeArea(
            child: Column(
              children: [
                const Spacer(flex: 3),
                Text(
                  AppStrings.score.tr(context),
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(color: ColorsManager.kSecondaryColor),
                ),
                const Spacer(),
                Text(
                  score,
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(color: ColorsManager.kSecondaryColor),
                ),
                const Spacer(flex: 3),
                CustomButton(
                  text: AppStrings.toHomeScreen.tr(context),
                  buttonColor: ColorsManager.kSecondaryColor.withAlpha(100),
                  onTap: () {
                    NavigatorHelper.pushReplacement(
                        context, const HomeScreen());
                  },
                ),
                const Spacer(flex: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
