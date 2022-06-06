import 'dart:convert';

import 'package:zorro_sign_contacts/core/data/datasources/remote/group_remote_datasource.dart';
import 'package:zorro_sign_contacts/core/domain/common_usecases/get_group/get_group.params.dart';
import 'package:zorro_sign_contacts/core/domain/entities/group.dart';
import 'package:http/http.dart' as http;
import 'package:zorro_sign_contacts/features/group_form/domain/usecases/create_group/create_group.params.dart';
import 'package:zorro_sign_contacts/features/group_form/domain/usecases/update_group/update_group.params.dart';
import 'package:zorro_sign_contacts/flavour_config.dart';
import 'package:zorro_sign_contacts/helpers/logger/logger.dart';
import 'package:zorro_sign_contacts/store/environment_store/environmental_store.dart';

class GroupRemoteDataSrouceImpl extends GroupRemoteDataSource {
  late final http.Client client;
  late final EnvironmentalStore environmentalStore;
  late final Logger logger;

  GroupRemoteDataSrouceImpl(
      {required this.client,
      required this.environmentalStore,
      required this.logger});

  @override
  Future<List<Group>?> getGroups() async {
    try {
      if (environmentalStore.environmentConfig
                  ?.serverEndPoints?[ServerEndPoints.apiGateway] !=
              null &&
          environmentalStore.environmentConfig
                  ?.serverEndPoints?[ServerEndPoints.apiGateway] !=
              '') {
        final response = await client.get(
            Uri.parse(((environmentalStore.environmentConfig
                        ?.serverEndPoints?[ServerEndPoints.apiGateway] ??
                    '') +
                (environmentalStore.environmentConfig?.endPoints?.groups ??
                    ''))),
            headers: environmentalStore.environmentConfig?.publicRequestHeader);
        return (json.decode(response.body) as List<dynamic>)
            .map((e) => Group.fromJson(e as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception(
            'Environment configuration is not loaded successfully.');
      }
    } on Exception catch (e) {
      await logger.recordError(e);
      throw Exception(e.toString());
    }
  }

  @override
  Future<Group?> getGroupById(GetGroupUsecaseParams params) async {
    try {
      if (environmentalStore.environmentConfig
                  ?.serverEndPoints?[ServerEndPoints.apiGateway] !=
              null &&
          environmentalStore.environmentConfig
                  ?.serverEndPoints?[ServerEndPoints.apiGateway] !=
              '') {
        final response = await client.get(
          Uri.parse(
              '${(environmentalStore.environmentConfig?.serverEndPoints?[ServerEndPoints.apiGateway] ?? '')}${(environmentalStore.environmentConfig?.endPoints?.groups ?? '')}/${(params.id ?? 0).toString()}'),
          headers: environmentalStore.environmentConfig?.publicRequestHeader,
        );

        return Group.fromJson(
            json.decode(response.body) as Map<String, dynamic>);
      } else {
        throw Exception(
            'Environment configuration is not loaded successfully.');
      }
    } on Exception catch (e) {
      await logger.recordError(e);
      throw Exception(e.toString());
    }
  }

  @override
  Future<Group?> insert(CreateGroupUsecaseParams params) async {
    try {
      if (environmentalStore.environmentConfig
                  ?.serverEndPoints?[ServerEndPoints.apiGateway] !=
              null &&
          environmentalStore.environmentConfig
                  ?.serverEndPoints?[ServerEndPoints.apiGateway] !=
              '') {
        final response = await client.post(
          Uri.parse(((environmentalStore.environmentConfig
                      ?.serverEndPoints?[ServerEndPoints.apiGateway] ??
                  '') +
              (environmentalStore.environmentConfig?.endPoints?.groups ?? ''))),
          headers: environmentalStore.environmentConfig?.publicRequestHeader,
          body: json.encode(params.data?.toJson()),
        );

        return Group.fromJson(
            json.decode(response.body) as Map<String, dynamic>);
      } else {
        throw Exception(
            'Environment configuration is not loaded successfully.');
      }
    } on Exception catch (e) {
      await logger.recordError(e);
      throw Exception(e.toString());
    }
  }

  @override
  Future<Group?> udpate(UpdateGroupUsecaseParams params) async {
    try {
      if (environmentalStore.environmentConfig
                  ?.serverEndPoints?[ServerEndPoints.apiGateway] !=
              null &&
          environmentalStore.environmentConfig
                  ?.serverEndPoints?[ServerEndPoints.apiGateway] !=
              '') {
        final response = await client.put(
          Uri.parse(((environmentalStore.environmentConfig
                      ?.serverEndPoints?[ServerEndPoints.apiGateway] ??
                  '') +
              (environmentalStore.environmentConfig?.endPoints?.groups ?? ''))),
          headers: environmentalStore.environmentConfig?.publicRequestHeader,
          body: json.encode(params.data?.toJson()),
        );

        return Group.fromJson(
            json.decode(response.body) as Map<String, dynamic>);
      } else {
        throw Exception(
            'Environment configuration is not loaded successfully.');
      }
    } on Exception catch (e) {
      await logger.recordError(e);
      throw Exception(e.toString());
    }
  }
}
