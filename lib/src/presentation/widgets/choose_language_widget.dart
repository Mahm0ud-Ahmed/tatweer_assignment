import 'package:flutter/material.dart';

import '../../core/config/l10n/generated/l10n.dart';

class ChooseLanguageWidget extends StatelessWidget {
  const ChooseLanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.language, ),
        const SizedBox(width: 8),
        Text(
          S.of(context).start_page_language_title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}