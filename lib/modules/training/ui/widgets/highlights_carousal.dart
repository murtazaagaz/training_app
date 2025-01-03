import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/common/app_colors.dart';
import 'package:training_app/models/training_model.dart';
import 'package:training_app/modules/training/controllers/training_controller.dart';
import 'package:training_app/modules/training/ui/widgets/carousal_item.dart';

class HighlightsCarousal extends StatefulWidget {
  const HighlightsCarousal({
    super.key,
  });

  @override
  State<HighlightsCarousal> createState() => _HighlightsCarousalState();
}

class _HighlightsCarousalState extends State<HighlightsCarousal> {
  final _controller = Get.find<TrainingController>();
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      _controller.moveToNext();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: Text(
              'Highlights',
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: _controller.moveToPrevious,
                  child: Container(
                    height: 60,
                    width: 20,
                    alignment: Alignment.center,
                    color: AppColors.black.withAlpha(150),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.white,
                        size: 17,
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 150,
                  child: Obx(() {
                    return PageView.builder(
                      controller: _controller.carousalController,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final TrainingModel model =
                            _controller.trainings[index];
                        return CarousalItem(model: model);
                      },
                      itemCount: _controller.trainings.length,
                    );
                  }),
                )),
                InkWell(
                  onTap: _controller.moveToNext,
                  child: Container(
                    height: 60,
                    width: 20,
                    alignment: Alignment.center,
                    color: AppColors.black.withAlpha(150),
                    child: Center(
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.white,
                        size: 17,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
