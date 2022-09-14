import 'package:flutter/material.dart';
import 'package:upgrader/src/app_theme.dart';
import 'package:upgrader/src/upgrade_messages.dart';

class AppUpdateModal extends StatefulWidget {
  final String? Function(UpgraderMessage) message;
  final String buttonText;
  final String? releaseNotes;
  final Function()? onLaunch;
  final Function()? onClosed;
  final Function()? onUpdateClick;

  const AppUpdateModal({
    Key? key,
    required this.message,
    required this.buttonText,
    required this.onClosed,
    required this.onUpdateClick,
    this.onLaunch,
    this.releaseNotes,
  }) : super(key: key);

  @override
  State<AppUpdateModal> createState() => _AppUpdateModalState();
}

class _AppUpdateModalState extends State<AppUpdateModal> {
  late String title;
  late String subtitle;
  late String desc1;
  late String desc2;
  late String desc3;

  @override
  void initState() {
    var textElements =
        widget.message(UpgraderMessage.body).toString().split("\n");
    title = textElements[0];
    subtitle = textElements[1];
    desc1 = textElements[2];
    desc2 = textElements[3];
    desc3 = textElements[4];

    if (widget.onLaunch != null) {
      widget.onLaunch!();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        widget.onClosed!();
                      },
                      icon: const Icon(Icons.close, size: 24),
                    ),
                  ),
                  const SizedBox(height: 56),
                  Center(
                    child: Text(
                      "🥮",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headline3,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppTheme.of(context).offWhite,
                        ),
                        child: const Center(child: Text("🧈")),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          desc1,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppTheme.of(context).offWhite,
                        ),
                        child: const Center(
                          child: Text(
                            "⚡️",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          desc2,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppTheme.of(context).offWhite,
                        ),
                        child: const Center(
                          child: Text(
                            "✨️",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          desc3,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 36),
                  TextButton(
                    onPressed: () {
                      widget.onUpdateClick!();
                    },
                    style: ElevatedButton.styleFrom(
                      alignment: AlignmentDirectional.center,
                      backgroundColor: AppTheme.of(context).primary1,
                      disabledForegroundColor:
                          AppTheme.of(context).justWhiteText.withOpacity(0.38),
                      disabledBackgroundColor:
                          AppTheme.of(context).justWhiteText.withOpacity(0.12),
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          16.0,
                        ),
                      ),
                    ),
                    child: Text(
                      widget.buttonText,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: AppTheme.of(context).justWhiteText,
                          ),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
