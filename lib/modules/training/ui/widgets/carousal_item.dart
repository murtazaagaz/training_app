import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/common/app_colors.dart';
import 'package:training_app/models/training_model.dart';
import 'package:training_app/navigation/app_routes.dart';

class CarousalItem extends StatelessWidget {
  final TrainingModel model;
  const CarousalItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          model.image,
          width: double.infinity,
          height: 150,
          fit: BoxFit.cover,
        ),
        Container(
          width: double.infinity,
          height: 150,
          color: Colors.black.withValues(alpha: .5),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          right: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(model.title,
                  style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18)),
              SizedBox(
                height: 4,
              ),
              Text(model.location,
                  style: TextStyle(color: AppColors.white, fontSize: 15)),
              SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        '\$299',
                        style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryRed),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        '\$199',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryRed),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.trainingDetails, arguments: model);
                    },
                    child: Row(
                      children: [
                        Text('View Details',
                            style: TextStyle(
                                color: AppColors.white, fontSize: 13)),
                        SizedBox(
                          width: 4,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: AppColors.white,
                          size: 13,
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
