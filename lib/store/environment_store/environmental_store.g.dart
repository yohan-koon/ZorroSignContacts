// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'environmental_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EnvironmentalStore on _EnvironmentalStore, Store {
  late final _$environmentConfigAtom =
      Atom(name: '_EnvironmentalStore.environmentConfig', context: context);

  @override
  FlavourConfig? get environmentConfig {
    _$environmentConfigAtom.reportRead();
    return super.environmentConfig;
  }

  @override
  set environmentConfig(FlavourConfig? value) {
    _$environmentConfigAtom.reportWrite(value, super.environmentConfig, () {
      super.environmentConfig = value;
    });
  }

  late final _$setFlavourConfigAsyncAction =
      AsyncAction('_EnvironmentalStore.setFlavourConfig', context: context);

  @override
  Future<void> setFlavourConfig(FlavourConfig? envConfig) {
    return _$setFlavourConfigAsyncAction
        .run(() => super.setFlavourConfig(envConfig));
  }

  late final _$resetEnvironmentStoreAsyncAction = AsyncAction(
      '_EnvironmentalStore.resetEnvironmentStore',
      context: context);

  @override
  Future<void> resetEnvironmentStore() {
    return _$resetEnvironmentStoreAsyncAction
        .run(() => super.resetEnvironmentStore());
  }

  @override
  String toString() {
    return '''
environmentConfig: ${environmentConfig}
    ''';
  }
}
