// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_yaml.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TemplateYaml _$TemplateYamlFromJson(Map json) => $checkedCreate(
      'TemplateYaml',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'template',
            'description',
            'source',
            'files',
            'vars',
            'replace'
          ],
        );
        final val = TemplateYaml(
          name: $checkedConvert('template', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String),
          source: $checkedConvert('source', (v) => v as String? ?? '/'),
          files: $checkedConvert(
              'files',
              (v) =>
                  (v as List<dynamic>?)?.map((e) => e as String).toList() ??
                  const []),
          replace: $checkedConvert(
              'replace',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) => ReplaceVariableProperties.fromJson(
                          Map<String, dynamic>.from(e as Map)))
                      .toList() ??
                  const []),
          vars: $checkedConvert(
              'vars',
              (v) => v == null
                  ? const <String, BrickVariableProperties>{}
                  : const VarsConverter().fromJson(v)),
        );
        return val;
      },
      fieldKeyMap: const {'name': 'template'},
    );

Map<String, dynamic> _$TemplateYamlToJson(TemplateYaml instance) {
  final val = <String, dynamic>{
    'template': instance.name,
    'description': instance.description,
    'source': instance.source,
    'files': instance.files,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('vars', const VarsConverter().toJson(instance.vars));
  val['replace'] = instance.replace.map((e) => e.toJson()).toList();
  return val;
}
