import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../themes/typography_theme.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool disabled;
  final bool loading;
  final double? verticalMargin;
  final double? horizontalMargin;

  const ButtonWidget({
    super.key,
    required this.title,
    required this.onTap,
    this.verticalMargin,
    this.horizontalMargin,
    this.disabled = false,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: horizontalMargin ?? 20,
        vertical: verticalMargin ?? 20,
      ),
      height: 50,
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: loading || disabled ? null : onTap,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: disabled
                      ? Theme.of(context).disabledColor
                      : Theme.of(context).primaryColor,
                ),
                child: Visibility(
                  visible: loading,
                  replacement: Text(
                    title,
                    style: h5.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ).tr(),
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.onSurface,
                      strokeWidth: 1.5,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
