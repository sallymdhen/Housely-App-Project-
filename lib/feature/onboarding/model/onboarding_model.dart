class OnboardingModel {
  final String foregroundImage;
  final String backgroundImage;
  final String title;
  final String description;
  final bool isBackgroundRight;

  const OnboardingModel({
    required this.foregroundImage,
    required this.backgroundImage,
    required this.title,
    required this.description,
    required this.isBackgroundRight,
  });
}

final List<OnboardingModel> onboardingData = [
  OnboardingModel(
    foregroundImage: 'assets/image/Img.png',
    backgroundImage: 'assets/image/Group 1.png',
    title: 'Find the perfect place for your future house',
    description:
        'find the best place for your dream house with your family and loved ones',
    isBackgroundRight: true,
  ),
  OnboardingModel(
    foregroundImage: 'assets/image/Img (1).png',
    backgroundImage: 'assets/image/Group 1 (2).png',
    title: 'Fast sell your property in just one click',
    description:
        'Simplify the property sales process with just your smartphone',
    isBackgroundRight: false,
  ),
  OnboardingModel(
    foregroundImage: 'assets/image/Img (2).png',
    backgroundImage: 'assets/image/Group 1 (1).png',
    title: 'find your dream home with us',
    description:
        'Just search and select your favorite property you want to locate',
    isBackgroundRight: true,
  ),
];
