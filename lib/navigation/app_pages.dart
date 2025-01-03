import 'package:get/get.dart';
import 'package:training_app/modules/training/bindings/training_binding.dart';
import 'package:training_app/modules/training/ui/training_detail_page.dart';
import 'package:training_app/modules/training/ui/training_page.dart';
import 'package:training_app/navigation/app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
        name: AppRoutes.trainings,
        page: () => TrainingPage(),
        binding: TrainingBinding()),
    GetPage(
      name: AppRoutes.trainingDetails,
      page: () => TrainingDetailPage(),
    )
  ];
}
