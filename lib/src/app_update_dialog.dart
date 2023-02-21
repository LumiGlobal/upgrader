import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upgrader/src/app_theme.dart';
import 'package:upgrader/upgrader.dart';

class AppUpdateDialog extends StatelessWidget {
  final bool isDark;
  final UpgraderMessages messages;
  final String? releaseNotes;
  final VoidCallback? ignoreCallback;
  final VoidCallback? laterCallback;
  final VoidCallback updateCallback;
  const AppUpdateDialog({
    super.key,
    required this.isDark,
    required this.messages,
    this.ignoreCallback,
    this.laterCallback,
    required this.updateCallback,
    this.releaseNotes,
  });

  @override
  Widget build(BuildContext context) {
    return AppTheme(
      data: isDark ? AppThemeVariants.darkTheme : AppThemeVariants.lightTheme,
      child: Platform.isAndroid
          ? AlertDialog(
              title: UpgraderAlertTitle(
                text: messages.message(UpgraderMessage.title)!,
              ),
              content: UpgraderAlertSubtitle(
                text: messages.message(UpgraderMessage.body)!,
                releaseNotes: releaseNotes,
              ),
              actions: [
                if (ignoreCallback != null)
                  CancelButton(
                    text: messages.message(UpgraderMessage.buttonTitleIgnore)!,
                    callback: ignoreCallback!,
                  ),
                OKButton(
                  text: messages.message(UpgraderMessage.buttonTitleUpdate)!,
                  callback: updateCallback,
                ),
              ],
            )
          : CupertinoAlertDialog(
              title: UpgraderAlertTitle(
                text: messages.message(UpgraderMessage.title)!,
              ),
              content: UpgraderAlertSubtitle(
                text: messages.message(UpgraderMessage.body)!,
              ),
              actions: [
                if (ignoreCallback != null)
                  CancelButton(
                    text: messages.message(UpgraderMessage.buttonTitleIgnore)!,
                    callback: ignoreCallback!,
                  ),
                OKButton(
                  text: messages.message(UpgraderMessage.buttonTitleUpdate)!,
                  callback: updateCallback,
                ),
              ],
            ),
    );
  }
}

class UpgraderAlertTitle extends StatelessWidget {
  final String text;
  const UpgraderAlertTitle({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? Text(
            text,
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontWeight: FontWeight.w400,
                ),
          )
        : Text(text);
  }
}

class UpgraderAlertSubtitle extends StatelessWidget {
  final String text;
  final String? releaseNotes;
  const UpgraderAlertSubtitle({
    super.key,
    required this.text,
    this.releaseNotes,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? Text(
            releaseNotes != null ? '$text\n\n${releaseNotes!}' : text,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: AppTheme.of(context).medium,
                ),
          )
        : Text(text);
  }
}

class CancelButton extends StatelessWidget {
  final String text;
  final VoidCallback callback;
  const CancelButton({
    super.key,
    required this.text,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? TextButton(
            onPressed: callback,
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: AppTheme.of(context).lightest,
                  ),
            ),
          )
        : CupertinoDialogAction(
            onPressed: callback,
            child: Text(text),
          );
  }
}

class OKButton extends StatelessWidget {
  final String text;
  final VoidCallback callback;
  const OKButton({
    super.key,
    required this.text,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? TextButton(
            onPressed: callback,
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: AppTheme.of(context).primary1,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          )
        : CupertinoDialogAction(
            onPressed: callback,
            child: Text(text),
          );
  }
}
