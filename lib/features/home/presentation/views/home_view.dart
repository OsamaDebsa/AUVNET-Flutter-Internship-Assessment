import 'package:auvnet/features/home/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:auvnet/features/home/presentation/widgets/custom_got_code_widget.dart';
import 'package:auvnet/features/home/presentation/widgets/custom_page_view.dart';
import 'package:auvnet/features/home/presentation/widgets/header_widget.dart';
import 'package:auvnet/features/home/presentation/widgets/page_indicator.dart';
import 'package:auvnet/features/home/presentation/widgets/section_title.dart';
import 'package:auvnet/features/home/presentation/widgets/service_section.dart';
import 'package:auvnet/features/home/presentation/widgets/shortcut_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_onPageChanged);
  }

  void _onPageChanged() {
    final newIndex = _pageController.page?.round() ?? 0;
    if (newIndex != _currentIndex) {
      setState(() {
        _currentIndex = newIndex;
      });
    }
  }

  @override
  void dispose() {
    _pageController.removeListener(_onPageChanged);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc()..add(FetchServicesEvent()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const HeaderWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 19),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: SectionTitle("Services:"),
                    ),
                    const ServiceSection(),
                    const SizedBox(height: 14),
                    const CustomGotCodeWidget(),
                    const SizedBox(height: 14),
                    CustomPageView(pageController: _pageController),
                    PageIndicatorWidget(controller: _pageController),
                    const SizedBox(height: 10),
                    const SectionTitle("Shortcuts:"),
                    const SizedBox(height: 10),
                    const ShortcutListView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
