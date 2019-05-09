import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final List<Color> colors;
  final double width;
  final double height;
  final Widget child;
  final GestureTapCallback onTap;

  GradientButton(
      {this.colors,
      this.width,
      this.height,
      @required this.child,
      @required this.onTap});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    // 确保colors数组不为空
    List<Color> _colors = colors ??
        [theme.primaryColor, theme.primaryColorDark ?? theme.primaryColor];

    return DecoratedBox(
      decoration: BoxDecoration(gradient: LinearGradient(colors: _colors), borderRadius: BorderRadius.circular(5)),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor: _colors.last,
          highlightColor: Colors.transparent,
          onTap: onTap,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: height, width: width),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultTextStyle(
                  style: TextStyle(fontWeight: FontWeight.bold),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
