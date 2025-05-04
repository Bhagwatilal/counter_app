part of '../counter_screen.dart';

class _CounterButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final String heroTag;

  const _CounterButton({
    required this.icon,
    required this.onPressed,
    required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: heroTag,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
