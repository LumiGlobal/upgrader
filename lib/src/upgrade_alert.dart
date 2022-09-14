/*
 * Copyright (c) 2021-2022 Larry Aasen. All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:upgrader/upgrader.dart';

/// A widget to display the upgrade dialog.
class UpgradeAlert extends UpgradeBase {
  /// The [child] contained by the widget.
  final Widget? child;

  /// Takes in a boolean to determine color scheme of UI
  final bool? isDark;

  /// Optional callback during init of UpgradeAlert
  final Function()? onLaunch;

  /// Optional callback during clicking of update
  final Function()? onUpdateClick;

  /// Optional callback during clicking close icon
  final Function()? onClosed;

  /// Creates a new [UpgradeAlert].
  UpgradeAlert({
    Key? key,
    Upgrader? upgrader,
    this.isDark = false,
    this.child,
    this.onLaunch,
    this.onUpdateClick,
    this.onClosed,
  }) : super(upgrader ?? Upgrader.sharedInstance, key: key);

  /// Describes the part of the user interface represented by this widget.
  @override
  Widget build(BuildContext context, UpgradeBaseState state) {
    if (upgrader.debugLogging) {
      print('upgrader: build UpgradeAlert');
    }

    return FutureBuilder(
        future: state.initialized,
        builder: (BuildContext context, AsyncSnapshot<bool> processed) {
          if (processed.connectionState == ConnectionState.done &&
              processed.data != null &&
              processed.data!) {
            upgrader.checkVersion(
              context: context,
              isDark: isDark ?? false,
              onLaunch: onLaunch,
              onUpdateClick: onUpdateClick,
              onClosed: onClosed,
            );
          }
          return child ?? Container();
        });
  }
}
