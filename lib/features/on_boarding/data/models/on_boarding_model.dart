import 'package:dalel/core/utils/app_assets.dart';

class OnBoardingModel {
  final String imagePath;
  final String title;
  final String subtitle;

  OnBoardingModel(
      {required this.imagePath, required this.title, required this.subtitle});
}

List<OnBoardingModel> onBoardingData = [
  OnBoardingModel(
      imagePath: Assets.imagesOnboarding1,
      title: 'Explore The history with Dalel in a smart way',
      subtitle:
          'Using our app’s history libraries you can find many historical periods'),
  OnBoardingModel(
      imagePath: Assets.imagesOnboarding2,
      title: 'From every place on earth',
      subtitle: 'A big variety of ancient places from all over the world'),
  OnBoardingModel(
      imagePath: Assets.imagesOnboarding3,
      title: 'Using modern AI technology for better user experience',
      subtitle:
          'AI provide recommendations and helps you to continue the search journey'),
];
