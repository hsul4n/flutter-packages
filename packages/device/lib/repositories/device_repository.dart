import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/providers.dart';
import '/modules/core/models/current.dart';
import '/modules/user/models/device.dart';
import '/modules/user/repositories/me_repository.dart';

part '../services/device_service.dart';

final deviceRepositoryProvider = Provider((ref) {
  return _DeviceRepository(
    service: _DeviceService(ref.watch(client)),
  );
});

class _DeviceRepository {
  _DeviceRepository({required this.service});

  final _DeviceService service;

  Future<Device> create(Device device) => service
          .create(device)
          .then((response) => Device.fromMap(response.data['data']))
          .then((device) {
        // Update current user cache object with new device info
        reader(meRepositoryProvider).write(Current.user!..device = device);

        return device;
      });

  Future<Device> update(Device device) => service
          .update(device)
          .then((response) => Device.fromMap(response.data['data']))
          .then((device) {
        // Update current user cache object with new device info
        reader(meRepositoryProvider).write(Current.user!..device = device);

        return device;
      });
}
