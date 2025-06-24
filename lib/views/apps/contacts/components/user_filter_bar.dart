import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:webkit/helpers/widgets/my_container.dart';

class ChatGptStyleFilterMenu extends StatefulWidget {
  const ChatGptStyleFilterMenu({super.key});

  @override
  State<ChatGptStyleFilterMenu> createState() => _ChatGptStyleFilterMenuState();
}

class _ChatGptStyleFilterMenuState extends State<ChatGptStyleFilterMenu> {
  final GlobalKey _menuKey = GlobalKey();
  OverlayEntry? _overlayEntry;

  void _showMenu() {
    final RenderBox renderBox = _menuKey.currentContext!.findRenderObject() as RenderBox;
    final Offset position = renderBox.localToGlobal(Offset.zero);
    final Size size = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: position.dx,
        top: position.dy + size.height + 8,
        child: Material(
          elevation: 6,
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          child: Container(
            width: 220,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _menuItem(LucideIcons.accessibility, 'Active Users'),
                _menuItem(Icons.not_accessible, 'Inactive users'),
                // _menuItem(Icons.code, 'Write or code'),
                // _menuItem(Icons.science_outlined, 'Run deep research'),
                // _menuItem(Icons.lightbulb_outline, 'Think for longer'),
              ],
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  Widget _menuItem(IconData icon, String title) {
    return InkWell(
      onTap: () {
        _overlayEntry?.remove();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: [
            Icon(icon, size: 20),
            const SizedBox(width: 10),
            Expanded(child: Text(title)),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: _menuKey,
      onTap: _showMenu,
      child: MyContainer.bordered(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.tune, size: 18),
            SizedBox(width: 6),
            Text("Filters"),
           
          ],
        ),
      ),
    );
  }
}
