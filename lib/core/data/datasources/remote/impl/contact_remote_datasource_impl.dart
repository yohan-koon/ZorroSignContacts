import 'dart:convert';

import 'package:zorro_sign_contacts/core/data/datasources/remote/contact_remote_datasource.dart';
import 'package:zorro_sign_contacts/core/domain/entities/contact.dart';
import 'package:http/http.dart' as http;
import 'package:zorro_sign_contacts/features/contact_form/domain/usecases/create_contact/create_contact.params.dart';
import 'package:zorro_sign_contacts/flavour_config.dart';
import 'package:zorro_sign_contacts/helpers/logger/logger.dart';
import 'package:zorro_sign_contacts/store/environment_store/environmental_store.dart';

class ContactRemoteDataSrouceImpl extends ContactRemoteDataSource {
  late final http.Client client;
  late final EnvironmentalStore environmentalStore;
  late final Logger logger;

  ContactRemoteDataSrouceImpl(
      {required this.client,
      required this.environmentalStore,
      required this.logger});

  @override
  Future<List<Contact>?> getContacts() async {
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
                (environmentalStore.environmentConfig?.endPoints?.contacts ??
                    ''))),
            headers: environmentalStore.environmentConfig?.publicRequestHeader);
        return (json.decode(response.body) as List<dynamic>)
            .map((e) => Contact.fromJson(e as Map<String, dynamic>))
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
  Future<Contact?> insert(CreateContactUsecaseParams params) async {
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
              (environmentalStore.environmentConfig?.endPoints?.contacts ??
                  ''))),
          headers: environmentalStore.environmentConfig?.publicRequestHeader,
          body: json.encode(params.data?.toJson()),
        );

        return Contact.fromJson(
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
