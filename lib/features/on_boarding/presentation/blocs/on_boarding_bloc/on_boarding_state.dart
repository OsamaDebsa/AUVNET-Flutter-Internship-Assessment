class OnBoardingState {
  final int currentPage;

  const OnBoardingState({required this.currentPage});

  OnBoardingState copyWith({int? currentPage}) {
    return OnBoardingState(currentPage: currentPage ?? this.currentPage);
  }
}
