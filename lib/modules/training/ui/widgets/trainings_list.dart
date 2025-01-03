import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/common/app_colors.dart';
import 'package:training_app/models/training_model.dart';
import 'package:training_app/modules/training/controllers/training_controller.dart';
import 'package:training_app/navigation/app_routes.dart';

class TrainingsList extends StatelessWidget {
  TrainingsList({super.key});

  final _controller = Get.find<TrainingController>();

  Widget _buildDateAndLocation(TrainingModel model) => Flexible(
        flex: 2,
        child: Column(
          children: [
            Text(
              model.date,
              style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              model.timings,
              style: TextStyle(
                  color: AppColors.greyText,
                  fontWeight: FontWeight.normal,
                  fontSize: 12),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              model.location,
              style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 14),
            ),
          ],
        ),
      );

  Widget _buildTrainerInfo(TrainingModel model) => Flexible(
        flex: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.tag,
              style: TextStyle(
                  color: AppColors.primaryRed,
                  fontSize: 10,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 7,
            ),
            Text(
              model.title,
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 7,
            ),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(90),
                  child: Image.asset(
                    model.trainerImage,
                    height: 30,
                    width: 30,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 7,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Keynote Speaker',
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      model.trainer,
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                height: 32,
                width: 120,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(0),
                        backgroundColor: AppColors.primaryRed,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2))),
                    onPressed: () {
                      Get.toNamed(AppRoutes.trainingDetails, arguments: model);
                    },
                    child: Text(
                      'Enquire Now',
                      style: TextStyle(color: AppColors.white),
                    )),
              ),
            )
          ],
        ),
      );

  Widget _buildTrainingItem(TrainingModel model) => GestureDetector(
        onTap: () {
          Get.toNamed(AppRoutes.trainingDetails, arguments: model);
        },
        child: Container(
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withAlpha(50), // Shadow color
                spreadRadius: 1,
                blurRadius: 1, // Softness of the shadow
                offset: Offset(.3, .3), // Horizontal and vertical offset
              ),
            ],
          ),
          child: Row(
            children: [
              _buildDateAndLocation(model),
              const SizedBox(
                width: 15,
              ),
              SizedBox(
                width: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(15, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Container(
                        height: 4,
                        width: 1,
                        decoration: BoxDecoration(
                          color: AppColors.greyText, // Color of the dot
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              _buildTrainerInfo(model),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView.builder(
          itemCount: _controller.filteredTrainings.length,
          itemBuilder: (context, index) =>
              _buildTrainingItem(_controller.filteredTrainings[index]),
        ),
      );
    });
  }
}
