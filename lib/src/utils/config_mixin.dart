import '../domain/config/config_yaml.dart';

///
mixin ConfigMixin {
  ///
  Future<ConfigYaml> getConfig() async {
    final config = await ConfigYaml.loadFromPubspec();
    return config;
  }
}
