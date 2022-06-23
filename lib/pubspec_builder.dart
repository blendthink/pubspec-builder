library pubspec_builder;

import 'dart:async';

import 'package:build/build.dart';

export 'pubspec_builder.dart';

Builder builder(BuilderOptions options) => PubspecBuilder(options);

class PubspecBuilder implements Builder {
  PubspecBuilder(BuilderOptions options)
      : _output = options.config['output'] ?? 'lib/gen/pubspec.dart';

  final String _output;

  @override
  Map<String, List<String>> get buildExtensions => {
        '^pubspec.yaml': [_output]
      };

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final assetId = buildStep.inputId;
    final content = await buildStep.readAsString(assetId);

    await buildStep.writeAsString(buildStep.allowedOutputs.single, '''
// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:pubspec_parse/pubspec_parse.dart';

final pubspec = Pubspec.parse("""$content""");
''');
  }
}
