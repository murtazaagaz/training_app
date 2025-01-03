import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/common/app_colors.dart';
import 'package:training_app/models/training_model.dart';

class TrainingDetailPage extends StatelessWidget {
  const TrainingDetailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TrainingModel model = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(model.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Event Image
            Image.network(
              model.image,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tag
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.primaryRed,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      model.tag,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 8),
                  // Title
                  Text(
                    model.title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  // Date and Timings
                  Text(
                    "Date: ${model.date}",
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Timings: ${model.timings}",
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  SizedBox(height: 16),
                  // Location
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.red),
                      SizedBox(width: 8),
                      Text(
                        model.location,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  // Summary
                  Text(
                    "Summary",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    model.summary,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  // Trainer Section
                  Row(
                    children: [
                      // Trainer Image
                      CircleAvatar(
                        backgroundImage: AssetImage(model.trainerImage),
                        radius: 30,
                      ),
                      SizedBox(width: 16),
                      // Trainer Name
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Trainer",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            model.trainer,
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
