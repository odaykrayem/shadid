// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:shadid/localization/localization.dart';
import 'package:shadid/model/order.dart';
import 'package:shadid/utils/constant.dart';
import 'package:shadid/utils/size_config.dart';
import 'package:shadid/utils/styles.dart';
import 'package:shadid/view/pages/user_pages/orders.dart';
import 'package:shadid/view/pages/user_pages/others.dart';
import 'package:shadid/view/pages/user_pages/quick_trans.dart';
import 'package:shadid/view/pages/user_pages/trucks.dart';

enum Questions { questionOne, questionTwo }

enum QuestionAnswers { answerOne, answerTwo, answerThree }

class SelecteService extends StatefulWidget {
  String name;
  SelecteService({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  State<SelecteService> createState() => _SelecteServiceState();
}

class _SelecteServiceState extends State<SelecteService> {
  late dynamic firstQuestionChoice;
  late dynamic secondQuestionChoice;
  var isFirstQuestionAnswered = false;
  var isSecondQuestionAnswered = false;

  late Map<Questions, Map<dynamic, String>> questionAnswers;
  late Map<Questions, String> questions;
  late ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    scrollController = ScrollController();

    questionAnswers = {
      Questions.questionOne: {
        QuestionAnswers.answerOne:
            '${AppLocalization.of(context)?.getTranslatedValue('myPreviousOrders')}',
        QuestionAnswers.answerTwo:
            '${AppLocalization.of(context)?.getTranslatedValue('newOrder')}',
        QuestionAnswers.answerThree:
            '${AppLocalization.of(context)?.getTranslatedValue('iNeedHelp')}'
      },
      Questions.questionTwo: {
        QuestionAnswers.answerOne:
            '${AppLocalization.of(context)?.getTranslatedValue('quickTrans')}',
        QuestionAnswers.answerTwo:
            '${AppLocalization.of(context)?.getTranslatedValue('trucks')}',
        QuestionAnswers.answerThree:
            '${AppLocalization.of(context)?.getTranslatedValue('other')}'
      }
    };

    questions = {
      Questions.questionOne:
          '${AppLocalization.of(context)?.getTranslatedValue('howCanServeBotMsg')}',
      Questions.questionTwo:
          '${AppLocalization.of(context)?.getTranslatedValue('whatServiceDoYouWantBotMsg')}'
    };

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: colorBackground,
        body: Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.fromSwatch().copyWith(
              secondary: Colors.grey[200],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: CustomScrollView(
              controller: scrollController,
              clipBehavior: Clip.none,
              shrinkWrap: true,
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  expandedHeight: 90,
                  backgroundColor: colorBackground,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Align(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: GestureDetector(
                                      onTap: () {},
                                      child: Icon(
                                        Icons.close,
                                        size: 30,
                                        color: colorIconGrey,
                                      )),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: CircleAvatar(
                                  backgroundColor: primaryColor,
                                  maxRadius: 30.0,
                                  child: Image.asset('assets/img/ex_logo.png'),
                                ),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isFirstQuestionAnswered = false;
                                        isSecondQuestionAnswered = false;
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            color: Colors.white),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 2.5),
                                                child: Center(
                                                  child: Text(
                                                    '${AppLocalization.of(context)?.getTranslatedValue('startOver')}',
                                                    style: lightText2,
                                                  ),
                                                ),
                                              ),
                                              Icon(
                                                Icons.autorenew_sharp,
                                                color: colorIconGrey,
                                              )
                                            ]),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'p 03:09',
                            style: lightText,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    Padding(
                      padding: const EdgeInsets.only(top: 14.0, bottom: 8.0),
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                            Container(
                              width: SizeConfig.screenH! * 0.4,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.white),
                              child: Padding(
                                padding: const EdgeInsets.all(11.0),
                                child: Text(
                                  '${AppLocalization.of(context)?.getTranslatedValue('goodEveningBotMsg')} ${widget.name}',
                                  style: messageText,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    botQuestions(Questions.questionOne),
                    isFirstQuestionAnswered == true
                        ? botReplyQuestion(Questions.questionOne)
                        : const SizedBox.shrink(),
                    isFirstQuestionAnswered == true &&
                            firstQuestionChoice ==
                                questionAnswers[Questions.questionOne]![
                                    QuestionAnswers.answerTwo]!
                        ? botQuestions(Questions.questionTwo)
                        : const SizedBox.shrink(),
                    isFirstQuestionAnswered == true &&
                            firstQuestionChoice ==
                                questionAnswers[Questions.questionOne]![
                                    QuestionAnswers.answerThree]!
                        ? botAnswerThree()
                        : const SizedBox.shrink(),
                    isSecondQuestionAnswered
                        ? botReplyQuestion(Questions.questionTwo)
                        : const SizedBox.shrink(),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget botQuestions(Questions question) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: SizeConfig.screenH! * 0.35,
              height: 190,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          questions[question]!,
                          style: messageText,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Divider(
                        color: colorCallMeTextDisabled,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            question == Questions.questionOne
                                ? answerQuestionOne(QuestionAnswers.answerOne)
                                : answerQuestionTwo(QuestionAnswers.answerOne);
                          });
                          navigate(question, QuestionAnswers.answerOne);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Center(
                            child: Text(
                              questionAnswers[question]![
                                  QuestionAnswers.answerOne]!,
                              style: messageTextGreen,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Divider(
                        color: colorCallMeTextDisabled,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            question == Questions.questionOne
                                ? answerQuestionOne(QuestionAnswers.answerTwo)
                                : answerQuestionTwo(QuestionAnswers.answerTwo);
                          });
                          navigate(question, QuestionAnswers.answerTwo);
                        },
                        child: Center(
                          child: Text(
                            questionAnswers[question]![
                                QuestionAnswers.answerTwo]!,
                            style: messageTextGreen,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Divider(
                        color: colorCallMeTextDisabled,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            question == Questions.questionOne
                                ? answerQuestionOne(QuestionAnswers.answerThree)
                                : answerQuestionTwo(
                                    QuestionAnswers.answerThree);
                          });
                          navigate(question, QuestionAnswers.answerThree);
                        },
                        child: Center(
                          child: Text(
                            questionAnswers[question]![
                                QuestionAnswers.answerThree]!,
                            style: messageTextGreen,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void answerQuestionOne(QuestionAnswers answer) {
    if (isFirstQuestionAnswered) return;
    isFirstQuestionAnswered = true;
    firstQuestionChoice = questionAnswers[Questions.questionOne]![answer]!;
  }

  void answerQuestionTwo(QuestionAnswers answer) {
    // if (isSecondQuestionAnswered) return;
    isSecondQuestionAnswered = true;
    secondQuestionChoice = questionAnswers[Questions.questionTwo]![answer]!;
    scrollController.jumpTo(scrollController.position.maxScrollExtent + 50);
  }

  Widget botAnswerThree() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: SizeConfig.screenH! * 0.23,
              height: 75,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          '${AppLocalization.of(context)?.getTranslatedValue('technicalSupport')}',
                          style: messageText,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${AppLocalization.of(context)?.getTranslatedValue('hi')}',
                              style: messageTextGreen,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            // Image.asset("assets/img/chat_bot_head.png")
                            SvgPicture.asset(
                              "assets/img/chat_bot_head.svg",
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget botReplyQuestion(Questions question) {
    return Padding(
      padding: const EdgeInsets.only(top: 14.0, bottom: 8.0),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // width: SizeConfig.screenH! * 0.258,
              // height: 42,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: primaryColor),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    question == Questions.questionOne
                        ? firstQuestionChoice
                        : secondQuestionChoice,
                    style: messageTextWhite,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

//TODO: edit the navigation to use routes
//TODO: edit parent widget for orders

  void navigate(Questions question, QuestionAnswers answer) {
    if (question == Questions.questionOne) {
      if (answer == QuestionAnswers.answerOne) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                Orders(selectedOrderType: OrderType.completed)));
      } else {
        return;
      }
    } else {
      if (answer == QuestionAnswers.answerOne) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => QuickTrans()));
      } else if (answer == QuestionAnswers.answerTwo) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Trucks()));
      } else {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Others()));
      }
    }
  }
}
