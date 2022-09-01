/*
 * Copyright (c) 2020-2022 Larry Aasen. All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:upgrader/src/message_constants.dart';

/// This allows a value of type T or T? to be treated as a value of type T?.
///
/// We use this so that APIs that have become non-nullable can still be used
/// with `!` and `?` to support older versions of the API as well.
T? ambiguate<T>(T? value) => value;

/// The message identifiers used in upgrader.
enum UpgraderMessage {
  /// Body of the upgrade message
  body,

  /// Ignore button
  buttonTitleIgnore,

  /// Later button
  buttonTitleLater,

  /// Update Now button
  buttonTitleUpdate,

  /// Prompt message
  prompt,

  /// Release Notes
  releaseNotes,

  /// Title
  title,
}

/// The default localized messages used for display in upgrader. Extend this
/// class to provide custom values and new localizations for languages.
/// An example to replace the Ignore button with a custom value would be:
///
/// ```dart
/// class MyUpgraderMessages extends UpgraderMessages {
///   @override
///   String get buttonTitleIgnore => 'My Ignore';
/// }
///
/// UpgradeAlert(messages: MyUpgraderMessages());
/// ```
///
class UpgraderMessages {
  /// The primary language subtag for the locale, which defaults to the
  /// system-reported default locale of the device.
  final String languageCode;

  /// Provide a [code] to override the system-reported default locale.
  UpgraderMessages({String? code})
      : languageCode = (code ?? findLanguageCode()) {
    assert(languageCode.isNotEmpty);
  }

  /// Override the message function to provide custom language localization.
  String? message(UpgraderMessage messageKey) {
    switch (messageKey) {
      case UpgraderMessage.body:
        return body;
      case UpgraderMessage.buttonTitleIgnore:
        return buttonTitleIgnore;
      case UpgraderMessage.buttonTitleLater:
        return buttonTitleLater;
      case UpgraderMessage.buttonTitleUpdate:
        return buttonTitleUpdate;
      case UpgraderMessage.prompt:
        return prompt;
      case UpgraderMessage.releaseNotes:
        return releaseNotes;
      case UpgraderMessage.title:
        return title;
      default:
    }
    return null;
  }

  /// Determine the current language code, either from the context, or
  /// from the system-reported default locale of the device.
  static String findLanguageCode({BuildContext? context}) {
    Locale? locale;
    if (context != null) {
      locale = Localizations.maybeLocaleOf(context);
    } else {
      // Get the system locale
      locale = ambiguate(WidgetsBinding.instance)!.window.locale;
    }
    final code = locale == null || locale.languageCode.isEmpty
        ? 'en'
        : locale.languageCode;
    return code;
  }

  /// The body of the upgrade message. This string supports mustache style
  /// template variables:
  ///   {{appName}}
  ///   {{currentAppStoreVersion}}
  ///   {{currentInstalledVersion}}
  /// Example:
  ///  'A new version of Upgrader is available! Version 1.2 is now available-you have 1.0.';

  /// Override this getter to provide a custom value. Values provided in the
  /// [message] function will be used over this value.
  String get body {
    String message;
    switch (languageCode) {
      case 'ms':
        message = messageBody['ms']!;
        break;
      case 'zh':
        message = messageBody['zh']!;
        break;
      case 'en':
      default:
        message = messageBody['en']!;
        break;
    }
    return message;
  }

  /// The ignore button title.
  /// Override this getter to provide a custom value. Values provided in the
  /// [message] function will be used over this value.
  String get buttonTitleIgnore {
    String message;
    switch (languageCode) {
      case 'ms':
        message = messageButtonTitleIgnore['ms']!;
        break;
      case 'zh':
        message = messageButtonTitleIgnore['zh']!;
        break;
      case 'en':
      default:
        message = messageButtonTitleIgnore['en']!;
        break;
    }
    return message;
  }

  /// The later button title.
  /// Override this getter to provide a custom value. Values provided in the
  /// [message] function will be used over this value.
  String get buttonTitleLater {
    String message;
    switch (languageCode) {
      case 'ms':
        message = messageButtonTitleLater['ms']!;
        break;
      case 'zh':
        message = messageButtonTitleLater['zh']!;
        break;
      case 'en':
      default:
        message = messageButtonTitleLater['en']!;
        break;
    }
    return message;
  }

  /// The update button title.
  /// Override this getter to provide a custom value. Values provided in the
  /// [message] function will be used over this value.
  String get buttonTitleUpdate {
    String message;
    switch (languageCode) {
      case 'ms':
        message = messageButtonTitleUpdate['ms']!;
        break;
      case 'zh':
        message = messageButtonTitleUpdate['zh']!;
        break;
      case 'en':
      default:
        message = messageButtonTitleUpdate['en']!;
        break;
    }
    return message;
  }

  /// The call to action prompt message.
  /// Override this getter to provide a custom value. Values provided in the
  /// [message] function will be used over this value.
  String get prompt {
    String message;
    switch (languageCode) {
      case 'ms':
        message = messagePrompt['ms']!;
        break;
      case 'zh':
        message = messagePrompt['zh']!;
        break;
      case 'en':
      default:
        message = messagePrompt['en']!;
        break;
    }
    return message;
  }

  /// The release notes message.
  /// Override this getter to provide a custom value. Values provided in the
  /// [message] function will be used over this value.
  String get releaseNotes {
    String message;
    switch (languageCode) {
      case 'ms':
        message = messageReleaseNotes['ms']!;
        break;
      case 'zh':
        message = messageReleaseNotes['zh']!;
        break;
      case 'en':
      default:
        message = messageReleaseNotes['en']!;
        break;
    }
    return message;
  }

  /// The alert dialog title.
  /// Override this getter to provide a custom value. Values provided in the
  /// [message] function will be used over this value.
  String get title {
    String message;
    switch (languageCode) {
      case 'ms':
        message = messageTitle['ms']!;
        break;
      case 'zh':
        message = messageTitle['zh']!;
        break;
      case 'en':
      default:
        message = messageTitle['en']!;
        break;
    }
    return message;
  }
}
