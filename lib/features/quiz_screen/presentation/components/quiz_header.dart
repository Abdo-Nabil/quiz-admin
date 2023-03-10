import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_admin/core/extensions/string_extension.dart';
import 'package:quiz_admin/features/home_screen/services/models/quiz_model.dart';
import 'package:quiz_admin/features/quiz_screen/cubits/quiz_screen_cubit.dart';
import 'package:quiz_admin/features/quiz_screen/presentation/components/timer_widget.dart';
import 'package:quiz_admin/resources/app_strings.dart';

import '../../../../core/shared/components/add_horizontal_space.dart';
import '../../../../resources/app_margins_paddings.dart';
import '../../../../resources/colors_manager.dart';

class QuizHeader extends StatelessWidget {
  const QuizHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    final QuizModel quizModel = QuizScreenCubit.getInst(context).quizModel!;
    //
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  quizModel.quizName.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: ColorsManager.whiteColor,
                    fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                  ),
                ),
              ),
              const AddHorizontalSpace(AppPadding.p8),
              TimerWidget(durationInMin: quizModel.quizDuration),
              const AddHorizontalSpace(AppPadding.p32),
            ],
          ),
        ),
        Text.rich(
          TextSpan(
            text:
                '${AppStrings.question.tr(context)} ${BlocProvider.of<QuizScreenCubit>(context, listen: true).questionNumber}',
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.headlineSmall?.fontSize,
              color: ColorsManager.whiteColor,
            ),
            children: <TextSpan>[
              TextSpan(
                text: '/ ${quizModel.questions.length}',
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                  color: ColorsManager.whiteColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
