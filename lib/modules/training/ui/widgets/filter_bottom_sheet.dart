import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/common/app_colors.dart';
import 'package:training_app/common/app_constants.dart';
import 'package:training_app/modules/training/controllers/training_controller.dart';

class FilterBottomSheet extends StatelessWidget {
  final TrainingController _controller = Get.find<TrainingController>();

  FilterBottomSheet({super.key});

  Widget _buildFilterList() {
    return Obx(() {
      List<String> items = _controller.getLocations();
      if (_controller.selectedFilterType.value == AppConstants.trainer) {
        items = _controller.getTrainers();
      }
      if (_controller.selectedFilterType.value == AppConstants.trainingName) {
        items = _controller.getTrainingNames();
      }
      return ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) => Obx(() {
                return CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(
                      items[index],
                      style: TextStyle(fontSize: 14, color: AppColors.black),
                    ),
                    value: _controller
                        .getSelectedFilterItems()
                        .contains(items[index]),
                    onChanged: (value) {
                      if (value ?? false) {
                        _controller.addFilterItems(items[index]);
                      } else {
                        _controller.removeFilterItems(items[index]);
                      }
                    });
              }));
    });
  }

  Widget _buildFilterTypes({required String name}) {
    return Obx(() {
      final isSelected = _controller.selectedFilterType.value == name;

      return InkWell(
        onTap: () {
          _controller.selectedFilterType.value = name;
        },
        child: Container(
          color:
              isSelected ? AppColors.white : AppColors.greyText.withAlpha(10),
          child: Row(
            children: [
              Container(
                width: 4,
                height: 70,
                color: isSelected
                    ? AppColors.primaryRed
                    : AppColors.greyText.withAlpha(10),
              ),
              SizedBox(
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  name,
                  style: TextStyle(
                      color: AppColors.black,
                      fontSize: 16,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal),
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.white),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Filter',
                  style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: AppColors.black,
                      size: 18,
                    )),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Column(
                    children: [
                      _buildFilterTypes(name: AppConstants.location),
                      _buildFilterTypes(name: AppConstants.trainingName),
                      _buildFilterTypes(name: AppConstants.trainer),
                    ],
                  ),
                ),
                Flexible(flex: 1, child: _buildFilterList())
              ],
            ),
          )
        ],
      ),
    );
  }
}
