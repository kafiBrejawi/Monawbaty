import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/locator.dart';
import '../../../core/shared_prefrence_repository.dart';
import '../../shared/components/components.dart';
import '../welcome/welcome_screen.dart';
import 'package:lottie/lottie.dart';

class BoardingModel {
  final String images;
  final String title;
  final String body;

  BoardingModel({
    required this.images,
    required this.title,
    required this.body,
  });
}

class on_board extends StatefulWidget {
  const on_board({super.key});

  @override
  State<on_board> createState() => _onboardState();
}

class _onboardState extends State<on_board> {
  var pageController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
        title: "بادر بحجز مناوبتك ",
        images: 'assets/images/onboard2.png',
        body: "ساهم بمساعدة الآخرين وتلبية احتياجاتهم "),
    BoardingModel(
        images: 'assets/images/onboard1.png',
        title: "Labor market ",
        body:
            "Enter with us within the work team to help buyers select the best goods "),
    BoardingModel(
        images: 'assets/images/onboard2.png',
        title: " Online Shopping",
        body: "Our store provides the best products at the cheapest prices ")
  ];
  bool islast = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (int index) {
                  {
                    if (index == boarding.length - 1) {
                      setState(() {
                        islast = true;
                      });
                    } else {
                      setState(() {
                        islast = false;
                      });
                    }
                  }
                },
                controller: pageController,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    WidgetBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: pageController,
                  count: boarding.length,
                  effect: ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      expansionFactor: 4,
                      dotWidth: 10,
                      spacing: 5,
                      activeDotColor: Colors.blueGrey),
                ),
                Spacer(),
                FloatingActionButton(
                    onPressed: () {
                      if (islast) {
                        submit();
                      } else {
                        pageController.nextPage(
                            duration: Duration(milliseconds: 750),
                            curve: Curves.fastLinearToSlowEaseIn);
                      }
                    },
                    child: Icon(
                      color: Colors.red,
                      Icons.skip_next,
                    ))
              ],
            )
          ],
        ),
      ),
    );
    ;
  }

  void submit() {
    locator
        .get<SharedPreferencesRepository>()
        .savedata(key: 'on_board', value: true)
        .then((value) {
      if (value) {
        if (islast) {
          navigateAndFinish(context, WelcomeScreen());
        }
      }
    });
  }

  WidgetBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Lottie.network(
            '${model.images}',
          )),
          SizedBox(
            height: 20,
          ),
          Text(
            '${model.title}',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            '${model.body}',
            style: TextStyle(
              fontSize: 14,
            ),
          )
        ],
      );
}
