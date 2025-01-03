import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:training_app/common/app_constants.dart';
import 'package:training_app/models/training_model.dart';

class TrainingController extends GetxController {
  var trainings = <TrainingModel>[].obs;
  var filteredTrainings = <TrainingModel>[].obs;
  var selectedFilterType = 'Location'.obs;

  final PageController carousalController = PageController();
  var carousalIndex = 0;

  var selectedLocations = <String>[].obs;
  var selectedTrainingNames = <String>[].obs;
  var selectedTrainers = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    getTrainings();
  }

  getTrainings() async {
    try {
      String body = await rootBundle.loadString('assets/data/workouts.json');
      final trainingsMap = jsonDecode(body);
      trainings.value = List<TrainingModel>.from(trainingsMap
          .map((training) => TrainingModel.fromMap(training))
          .toList());
      filteredTrainings.value = trainings;
    } catch (_) {}
  }

  void filterTrainings() {
    filteredTrainings.value = trainings.where((training) {
      if (selectedTrainers.isNotEmpty &&
          !selectedTrainers.contains(training.trainer)) {
        return false;
      }
      if (selectedLocations.isNotEmpty &&
          !selectedLocations.contains(training.location)) {
        return false;
      }
      if (selectedTrainingNames.isNotEmpty &&
          !selectedTrainingNames.contains(training.title)) {
        return false;
      }
      return true;
    }).toList();
  }

  List<String> getTrainers() {
    return trainings.map((e) => e.trainer).toSet().toList();
  }

  List<String> getTrainingNames() {
    return trainings.map((e) => e.title).toSet().toList();
  }

  List<String> getLocations() {
    return trainings.map((e) => e.location).toSet().toList();
  }

  RxList<String> getSelectedFilterItems() {
    if (selectedFilterType.value == AppConstants.location) {
      return selectedLocations;
    }
    if (selectedFilterType.value == AppConstants.trainer) {
      return selectedTrainers;
    }
    if (selectedFilterType.value == AppConstants.trainingName) {
      return selectedTrainingNames;
    }
    return <String>[].obs;
  }

  void addFilterItems(String item) {
    if (selectedFilterType.value == AppConstants.location) {
      selectedLocations.add(item);
    }
    if (selectedFilterType.value == AppConstants.trainer) {
      selectedTrainers.add(item);
    }
    if (selectedFilterType.value == AppConstants.trainingName) {
      selectedTrainingNames.add(item);
    }
    filterTrainings();
  }

  void removeFilterItems(String item) {
    if (selectedFilterType.value == AppConstants.location) {
      selectedLocations.remove(item);
    }
    if (selectedFilterType.value == AppConstants.trainer) {
      selectedTrainers.remove(item);
    }
    if (selectedFilterType.value == AppConstants.trainingName) {
      selectedTrainingNames.remove(item);
    }
    filterTrainings();
  }

  moveToNext() {
    if (carousalController.hasClients) {
      carousalIndex++;
      if (trainings.length <= carousalIndex) {
        carousalIndex = 0;
      }
      carousalController.animateToPage(
        carousalIndex,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  moveToPrevious() {
    if (carousalController.hasClients) {
      carousalIndex--;
      if (carousalIndex < 0) {
        carousalIndex = trainings.length - 1;
      }
      carousalController.animateToPage(
        carousalIndex,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}
