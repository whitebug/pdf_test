/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/add.png
  AssetGenImage get add => const AssetGenImage('assets/images/add.png');

  /// File path: assets/images/cross.png
  AssetGenImage get cross => const AssetGenImage('assets/images/cross.png');

  /// File path: assets/images/cubes.png
  AssetGenImage get cubes => const AssetGenImage('assets/images/cubes.png');

  /// File path: assets/images/doc.png
  AssetGenImage get doc => const AssetGenImage('assets/images/doc.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/main_icon.jpg
  AssetGenImage get mainIcon =>
      const AssetGenImage('assets/images/main_icon.jpg');

  /// File path: assets/images/nothing.png
  AssetGenImage get nothing => const AssetGenImage('assets/images/nothing.png');

  /// File path: assets/images/nothing_s.png
  AssetGenImage get nothingS =>
      const AssetGenImage('assets/images/nothing_s.png');

  /// File path: assets/images/onboard1.png
  AssetGenImage get onboard1 =>
      const AssetGenImage('assets/images/onboard1.png');

  /// File path: assets/images/onboard2.png
  AssetGenImage get onboard2 =>
      const AssetGenImage('assets/images/onboard2.png');

  /// File path: assets/images/pen.png
  AssetGenImage get pen => const AssetGenImage('assets/images/pen.png');

  /// File path: assets/images/right_arrow.png
  AssetGenImage get rightArrow =>
      const AssetGenImage('assets/images/right_arrow.png');

  /// File path: assets/images/scan.png
  AssetGenImage get scan => const AssetGenImage('assets/images/scan.png');

  /// File path: assets/images/search.png
  AssetGenImage get search => const AssetGenImage('assets/images/search.png');

  /// File path: assets/images/share.png
  AssetGenImage get share => const AssetGenImage('assets/images/share.png');

  /// File path: assets/images/sort_false.png
  AssetGenImage get sortFalse =>
      const AssetGenImage('assets/images/sort_false.png');

  /// File path: assets/images/sort_true.png
  AssetGenImage get sortTrue =>
      const AssetGenImage('assets/images/sort_true.png');

  /// File path: assets/images/sorter.png
  AssetGenImage get sorter => const AssetGenImage('assets/images/sorter.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    add,
    cross,
    cubes,
    doc,
    logo,
    mainIcon,
    nothing,
    nothingS,
    onboard1,
    onboard2,
    pen,
    rightArrow,
    scan,
    search,
    share,
    sortFalse,
    sortTrue,
    sorter,
  ];
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/de.json
  String get de => 'assets/translations/de.json';

  /// File path: assets/translations/en-US.json
  String get enUS => 'assets/translations/en-US.json';

  /// File path: assets/translations/en.json
  String get en => 'assets/translations/en.json';

  /// File path: assets/translations/es.json
  String get es => 'assets/translations/es.json';

  /// File path: assets/translations/fr.json
  String get fr => 'assets/translations/fr.json';

  /// File path: assets/translations/it.json
  String get it => 'assets/translations/it.json';

  /// File path: assets/translations/pt-BR.json
  String get ptBR => 'assets/translations/pt-BR.json';

  /// File path: assets/translations/ru.json
  String get ru => 'assets/translations/ru.json';

  /// List of all assets
  List<String> get values => [de, enUS, en, es, fr, it, ptBR, ru];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
