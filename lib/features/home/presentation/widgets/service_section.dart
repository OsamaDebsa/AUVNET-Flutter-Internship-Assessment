import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auvnet/features/home/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:auvnet/features/home/presentation/widgets/service_list_view.dart';

class ServiceSection extends StatelessWidget {
  const ServiceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          previous.services != current.services ||
          previous.isLoading != current.isLoading,
      builder: (context, state) {
        if (state.isLoading && state.services.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.services.isEmpty) {
          return const Center(child: Text('No services found'));
        }
        return ServiceListView(services: state.services);
      },
    );
  }
}
