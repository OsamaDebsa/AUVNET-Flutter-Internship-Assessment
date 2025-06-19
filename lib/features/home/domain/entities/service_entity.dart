import 'package:equatable/equatable.dart';

class ServiceEntity extends Equatable {
  final String name;
  final String imageUrl;
  final String duration;

  const ServiceEntity({
    required this.name,
    required this.imageUrl,
    required this.duration,
  });

  @override
  List<Object?> get props => [name, imageUrl, duration];
}