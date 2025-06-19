import 'package:auvnet/core/utils/app_assets.dart';
import 'package:auvnet/core/utils/app_constants.dart';
import 'package:auvnet/core/utils/app_text_styles.dart';
import 'package:auvnet/core/widgets/custom_button.dart';
import 'package:auvnet/features/auth/presentation/views/login_view.dart';
import 'package:auvnet/features/on_boarding/presentation/blocs/on_boarding_bloc/on_boarding_bloc.dart';
import 'package:auvnet/features/on_boarding/presentation/blocs/on_boarding_bloc/on_boarding_event.dart';
import 'package:auvnet/features/on_boarding/presentation/blocs/on_boarding_bloc/on_boarding_state.dart';
import 'package:auvnet/features/on_boarding/presentation/widgets/on_boarding_page_view.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnBoardingBloc(),
      child: const _OnBoardingViewContent(),
    );
  }
}

class _OnBoardingViewContent extends StatefulWidget {
  const _OnBoardingViewContent();

  @override
  State<_OnBoardingViewContent> createState() => _OnBoardingViewContentState();
}

class _OnBoardingViewContentState extends State<_OnBoardingViewContent> {
  final PageController _pageController = PageController();
  final hiveBox = Hive.box(AppConstants.settingsBox);

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnBoardingBloc, OnBoardingState>(
      listenWhen:
          (previous, current) => previous.currentPage != current.currentPage,
      listener: (context, state) {
        _pageController.animateToPage(
          state.currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      child: Column(
        children: [
          Expanded(child: OnBoardingPageView(pageController: _pageController)),
          const SizedBox(height: 52),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(Assets.imagesOnBoardingFooter),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    CustomButton(
                      text: 'Get Started',
                      onPressed: () {
                        hiveBox.put(AppConstants.isOnBoardingVisited, true);
                        Navigator.pushReplacementNamed(
                          context,
                          LoginView.routeName,
                        );
                      },
                    ),
                    const SizedBox(height: 14),
                    BlocBuilder<OnBoardingBloc, OnBoardingState>(
                      builder: (context, state) {
                        return TextButton(
                          onPressed: () {
                            if (state.currentPage < 2) {
                              context.read<OnBoardingBloc>().add(
                                OnNextPressed(),
                              );
                            } else {
                              hiveBox.put(
                                AppConstants.isOnBoardingVisited,
                                true,
                              );
                              Navigator.pushReplacementNamed(
                                context,
                                LoginView.routeName,
                              );
                            }
                          },
                          child: Text(
                            'Next',
                            style: AppTextStyles.regular14.copyWith(
                              color: const Color(0xff677294),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 43),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
