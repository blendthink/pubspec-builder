[![Pub Version](https://badgen.net/pub/v/pubspec_builder)](https://pub.dev/packages/pubspec_builder/)
[![Dart SDK Version](https://badgen.net/pub/sdk-version/pubspec_builder)](https://pub.dev/packages/pubspec_builder/)
[![Pub popularity](https://badgen.net/pub/popularity/pubspec_builder)](https://pub.dev/packages/pubspec_builder/score)

# pubspec_builder

A builder for extracting the contents of pubspec.yaml into code.

## Usage

1. Add this package to your dev_dependencies in `pubspec.yaml`:

    ```yaml
    dependencies:
      pubspec_parse: ^1.2.0
   
    dev_dependencies:
      build_runner: ^2.1.11
      pubspec_builder: any
    ```

2. Run a build:

   ```console
   dart pub run build_runner build
   ```

3. `lib/gen/pubspec.dart` will be generated with content:

    ```dart
    // GENERATED CODE - DO NOT MODIFY BY HAND
    
    import 'package:pubspec_parse/pubspec_parse.dart';
    
    final pubspec = Pubspec.parse("""...""");
    ```

### Optional

To change the path of the generated file, create a `build.yaml` in the root of your package.
By changing the `output` option of this builder, the path can be customized:

```yaml
targets:
  $default:
    builders:
      pubspec_builder:
        options:
          output: 'lib/custom/path/to/pubspec.dart'
```

## See also

- [build](https://pub.dev/packages/build)
- [build_config](https://pub.dev/packages/build_config)
- [build_runner](https://pub.dev/packages/build_runner)
- [pubspec_parse](https://pub.dev/packages/pubspec_parse)
- [pub_semver](https://pub.dev/packages/pub_semver)
