import 'package:flutter/material.dart';

import '../../core/config/themes/theme_manager.dart';

class GenericTextField extends StatelessWidget {
  Function(String)? onChange;
  Function(String?)? onTab;
  final EdgeInsetsGeometry margin;
  final TextEditingController controller;


  GenericTextField({
    super.key,
    required this.margin,
    this.onChange,
    this.onTab, 
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            filled: true,
            fillColor: ThemeManager().appColor[6].withOpacity(0.4),
            prefixIcon: Icon(
              Icons.language_outlined,
              color: ThemeManager().appColor[4],
            ),
            suffixIcon: Icon(
              Icons.mic,
              color: ThemeManager().appColor[4],
            ),
            hintText: 'Enter Message',
            hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(color: ThemeManager().appColor[4]),
          ),
          onChanged: onChange,
          onSaved: onTab,
        ),
      ),
    );
  }
}
