import 'package:zorro_sign_contacts/flavour_config.dart';
import 'package:mobx/mobx.dart';

part 'environmental_store.g.dart';

class EnvironmentalStore = _EnvironmentalStore with _$EnvironmentalStore;

abstract class _EnvironmentalStore with Store {
  @observable
  FlavourConfig? environmentConfig;

  @action
  Future<void> setFlavourConfig(FlavourConfig? envConfig) async {
    environmentConfig = envConfig;
  }

  @action
  Future<void> resetEnvironmentStore() async {
    environmentConfig = null;
  }
}
