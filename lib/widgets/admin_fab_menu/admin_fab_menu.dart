import 'package:flutter/material.dart';
import 'dart:ui';

class AdminFabMenu extends StatefulWidget {
  final void Function(int index) onItemTap;

  const AdminFabMenu({super.key, required this.onItemTap});

  @override
  State<AdminFabMenu> createState() => _AdminFabMenuState();
}

class _AdminFabMenuState extends State<AdminFabMenu>
    with SingleTickerProviderStateMixin {

  bool _isOpen = false;
  late final AnimationController _controller;
  late final Animation<double> _expandAnim;

  final List<_FabItem> _items = const [
    _FabItem(icon: Icons.home,   label: 'home'),
    _FabItem(icon: Icons.settings_rounded,     label: 'profile'),
    _FabItem(icon: Icons.group_rounded,        label: 'Users'),
    _FabItem(icon: Icons.meeting_room_rounded, label: 'Hall'),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    _expandAnim = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
      reverseCurve: Curves.easeIn,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() => _isOpen = !_isOpen);
    _isOpen ? _controller.forward() : _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Expanded items (animate in from bottom upward) ──
        ..._items.asMap().entries.map((entry) {
          final delay = entry.key / _items.length;
          final itemAnim = Tween<double>(begin: 0, end: 1).animate(
            CurvedAnimation(
              parent: _controller,
              curve: Interval(delay * 0.4, 0.6 + delay * 0.4,
                  curve: Curves.easeOut),
            ),
          );

          return AnimatedBuilder(
            animation: itemAnim,
            builder: (_, __) => Opacity(
              opacity: itemAnim.value,
              child: Transform.translate(
                offset: Offset(0, 16 * (1 - itemAnim.value)),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: _FabItemRow(
                    item: entry.value,
                    onTap: () {
                      _toggle();
                      widget.onItemTap(entry.key);
                    },
                  ),
                ),
              ),
            ),
          );
        }).toList().reversed.toList(), // reversed = bottom item first

        // ── Main FAB button ──
        _MainFab(isOpen: _isOpen, onTap: _toggle),
      ],
    );
  }
}

// ── Sub-item row: round button + pill label ───────────────────────────────
class _FabItemRow extends StatelessWidget {
  final _FabItem item;
  final VoidCallback onTap;

  const _FabItemRow({required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [

          // Round glass icon button
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 7, 1, 176).withOpacity(0.5),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.45),
                  ),
                ),
                child: Icon(item.icon,
                    color: const Color.fromARGB(255, 255, 255, 255), size: 22),
              ),
            ),
          ),

          const SizedBox(width: 10),

          // Pill label
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color:const Color.fromARGB(255, 7, 1, 176).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xFF7F77DD).withOpacity(0.3),
                    width: 0.8,
                  ),
                ),
                child: Text(
                  item.label,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
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

// ── Main round FAB ────────────────────────────────────────────────────────
class _MainFab extends StatelessWidget {
  final bool isOpen;
  final VoidCallback onTap;

  const _MainFab({required this.isOpen, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 54,
        height: 54,
        decoration: BoxDecoration(
          color: isOpen
              ? const Color(0xFF534AB7)
              : const Color(0xFF7F77DD),
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white.withOpacity(0.2),
          ),
        ),
        child: AnimatedRotation(
          turns: isOpen ? 0.125 : 0, // 45°
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Icon(
            isOpen ? Icons.close_rounded : Icons.menu_rounded,
            color: Colors.white,
            size: 24,
          ),
        ),
      ),
    );
  }
}

// ── Data model ────────────────────────────────────────────────────────────
class _FabItem {
  final IconData icon;
  final String label;
  const _FabItem({required this.icon, required this.label});
}