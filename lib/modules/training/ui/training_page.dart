import 'package:flutter/material.dart';
import 'package:training_app/common/app_colors.dart';
import 'package:training_app/modules/training/ui/widgets/filter_bottom_sheet.dart';
import 'package:training_app/modules/training/ui/widgets/highlights_carousal.dart';
import 'package:training_app/modules/training/ui/widgets/trainings_list.dart';

class TrainingPage extends StatelessWidget {
  const TrainingPage({super.key});

  Widget _buildFilter(context) => Flexible(
      flex: 3,
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
              context: context, builder: (_) => FilterBottomSheet());
        },
        child: Container(
          alignment: Alignment.bottomLeft,
          color: Colors.white,
          child: Container(
              height: 30,
              width: 50,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                border: Border.all(
                    width: .7, color: AppColors.greyText), // Border color
                borderRadius: BorderRadius.circular(4),
                // Border radius
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.filter_alt,
                      size: 10, color: AppColors.greyText), // Filter icon
                  SizedBox(width: 2), // Spacing between icon and text
                  Text(
                    'Filter', // Text inside the container
                    style: TextStyle(fontSize: 10, color: AppColors.greyText),
                  ),
                ],
              )),
        ),
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
              flex: 3,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Flexible(
                        flex: 5,
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              vertical: 80, horizontal: 30),
                          color: AppColors.primaryRed,
                          child: Text(
                            'Trainings',
                            style: TextStyle(
                                color: AppColors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      _buildFilter(context),
                    ],
                  ),
                  Positioned(bottom: 100, child: HighlightsCarousal())
                ],
              )),
          Flexible(flex: 3, child: TrainingsList()),
        ],
      ),
    );
  }
}
