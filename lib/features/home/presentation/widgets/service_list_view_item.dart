import 'package:auvnet/features/home/domain/entities/service_entity.dart';
import 'package:flutter/material.dart';

class ServiceListViewItem extends StatelessWidget {
  final ServiceEntity service;

  const ServiceListViewItem({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _ServiceImage(imageUrl: service.imageUrl),
        const SizedBox(height: 4),
        _ServiceDurationLabel(duration: service.duration),
        const SizedBox(height: 2),
        Text(
          service.name,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _ServiceImage extends StatelessWidget {
  final String imageUrl;

  const _ServiceImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 70,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(imageUrl, fit: BoxFit.contain),
        ),
      ),
    );
  }
}

class _ServiceDurationLabel extends StatelessWidget {
  final String duration;

  const _ServiceDurationLabel({required this.duration});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: const Color(0xFF8900FE),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        duration,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
