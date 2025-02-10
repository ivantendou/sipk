/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/add1.svg
  SvgGenImage get add1 => const SvgGenImage('assets/images/add1.svg');

  /// File path: assets/images/arrow-left.svg
  SvgGenImage get arrowLeft =>
      const SvgGenImage('assets/images/arrow-left.svg');

  /// File path: assets/images/arrow-right.svg
  SvgGenImage get arrowRight =>
      const SvgGenImage('assets/images/arrow-right.svg');

  /// File path: assets/images/bell.svg
  SvgGenImage get bell => const SvgGenImage('assets/images/bell.svg');

  /// File path: assets/images/check.svg
  SvgGenImage get check => const SvgGenImage('assets/images/check.svg');

  /// File path: assets/images/chevron-down-thin.svg
  SvgGenImage get chevronDownThin =>
      const SvgGenImage('assets/images/chevron-down-thin.svg');

  /// File path: assets/images/chevron-down.svg
  SvgGenImage get chevronDown =>
      const SvgGenImage('assets/images/chevron-down.svg');

  /// File path: assets/images/chevron-right.svg
  SvgGenImage get chevronRight =>
      const SvgGenImage('assets/images/chevron-right.svg');

  /// File path: assets/images/cross.svg
  SvgGenImage get cross => const SvgGenImage('assets/images/cross.svg');

  /// File path: assets/images/document.svg
  SvgGenImage get document => const SvgGenImage('assets/images/document.svg');

  /// File path: assets/images/email.svg
  SvgGenImage get email => const SvgGenImage('assets/images/email.svg');

  /// File path: assets/images/eye-off.svg
  SvgGenImage get eyeOff => const SvgGenImage('assets/images/eye-off.svg');

  /// File path: assets/images/eye.svg
  SvgGenImage get eye => const SvgGenImage('assets/images/eye.svg');

  /// File path: assets/images/filter.svg
  SvgGenImage get filter => const SvgGenImage('assets/images/filter.svg');

  /// File path: assets/images/logo.svg
  SvgGenImage get logo => const SvgGenImage('assets/images/logo.svg');

  /// File path: assets/images/manage-data-off.svg
  SvgGenImage get manageDataOff =>
      const SvgGenImage('assets/images/manage-data-off.svg');

  /// File path: assets/images/manage-data-on.svg
  SvgGenImage get manageDataOn =>
      const SvgGenImage('assets/images/manage-data-on.svg');

  /// File path: assets/images/password.svg
  SvgGenImage get password => const SvgGenImage('assets/images/password.svg');

  /// File path: assets/images/pdf.svg
  SvgGenImage get pdf => const SvgGenImage('assets/images/pdf.svg');

  /// File path: assets/images/profile-off.svg
  SvgGenImage get profileOff =>
      const SvgGenImage('assets/images/profile-off.svg');

  /// File path: assets/images/profile-on.svg
  SvgGenImage get profileOn =>
      const SvgGenImage('assets/images/profile-on.svg');

  /// File path: assets/images/scoring-off.svg
  SvgGenImage get scoringOff =>
      const SvgGenImage('assets/images/scoring-off.svg');

  /// File path: assets/images/scoring-on.svg
  SvgGenImage get scoringOn =>
      const SvgGenImage('assets/images/scoring-on.svg');

  /// File path: assets/images/search.svg
  SvgGenImage get search => const SvgGenImage('assets/images/search.svg');

  /// File path: assets/images/submission-off.svg
  SvgGenImage get submissionOff =>
      const SvgGenImage('assets/images/submission-off.svg');

  /// File path: assets/images/submission-on.svg
  SvgGenImage get submissionOn =>
      const SvgGenImage('assets/images/submission-on.svg');

  /// File path: assets/images/user-placeholder.svg
  SvgGenImage get userPlaceholder =>
      const SvgGenImage('assets/images/user-placeholder.svg');

  /// File path: assets/images/waiting.svg
  SvgGenImage get waiting => const SvgGenImage('assets/images/waiting.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        add1,
        arrowLeft,
        arrowRight,
        bell,
        check,
        chevronDownThin,
        chevronDown,
        chevronRight,
        cross,
        document,
        email,
        eyeOff,
        eye,
        filter,
        logo,
        manageDataOff,
        manageDataOn,
        password,
        pdf,
        profileOff,
        profileOn,
        scoringOff,
        scoringOn,
        search,
        submissionOff,
        submissionOn,
        userPlaceholder,
        waiting
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
