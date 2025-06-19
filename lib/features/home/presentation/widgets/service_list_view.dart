import 'package:auvnet/features/home/domain/entities/service_entity.dart';
import 'package:auvnet/features/home/presentation/widgets/service_list_view_item.dart';
import 'package:flutter/material.dart';

class ServiceListView extends StatelessWidget {
  final List<ServiceEntity> services;

  const ServiceListView({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ServiceListViewItem(service: service),
          );
        },
      ),
    );
  }
}