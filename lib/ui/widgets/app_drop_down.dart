import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stride_sync/ui/resources/app_colors.dart';
import 'package:stride_sync/ui/resources/app_fonts.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

/// A fully reusable custom dropdown widget.
///
/// Usage example:
/// ```dart
/// CustomDropdown(
///   label: 'Gender',
///   hint: 'Select Gender',
///   options: ['Stallion', 'Gelding', 'Mare'],
///   onChanged: (value) => print(value),
/// )
/// ```
class CustomDropdown extends StatefulWidget {
  /// Label shown above the dropdown field.
  final String label;

  /// Placeholder text shown when nothing is selected.
  final String hint;

  /// List of options to display in the dropdown menu.
  final List<String> options;

  /// Called whenever the user selects an option.
  final ValueChanged<String>? onChanged;

  /// Pre-selected value (optional).
  final String? initialValue;

  const CustomDropdown({
    super.key,
    required this.label,
    required this.hint,
    required this.options,
    this.onChanged,
    this.initialValue,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _selectedValue;

  final LayerLink _layerLink = LayerLink();
  final GlobalKey _triggerKey = GlobalKey();
  OverlayEntry? _overlayEntry;
  bool _isOpen = false;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    if (mounted) setState(() => _isOpen = false);
  }

  void _toggleDropdown() {
    _isOpen ? _removeOverlay() : _openOverlay();
  }

  void _openOverlay() {
    final renderBox =
        _triggerKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;
    final double triggerWidth = renderBox.size.width;

    _overlayEntry = OverlayEntry(
      builder: (_) => Stack(
        children: [
          // Tap-outside dismisser — translucent so scrolling still works
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: _removeOverlay,
              child: const IgnorePointer(child: SizedBox.expand()),
            ),
          ),

          // Panel anchored to the bottom-left of the trigger
          CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            targetAnchor: Alignment.bottomLeft,
            followerAnchor: Alignment.topLeft,
            offset: Offset(0, 8.h),
            child: Material(
              color: Colors.transparent,
              child: SizedBox(
                width: triggerWidth,
                child: _DropdownPanel(
                  options: widget.options,
                  selectedOption: _selectedValue,
                  onSelect: (value) {
                    setState(() => _selectedValue = value);
                    widget.onChanged?.call(value);
                    _removeOverlay();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
    setState(() => _isOpen = true);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Text(widget.label, style: AppFonts.grey18w400),
        SizedBox(height: 20.h),

        // Trigger
        CompositedTransformTarget(
          link: _layerLink,
          child: GestureDetector(
            key: _triggerKey,
            onTap: _toggleDropdown,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: AppColors.textFeildBorder),
              ),
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _selectedValue ?? widget.hint,
                    style: AppFonts.black18w400.copyWith(
                      color: _selectedValue != null
                          ? AppColors.secondary
                          : AppColors.textGrey,
                    ),
                  ),
                  AnimatedRotation(
                    turns: _isOpen ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                      TablerIcons.chevronDown,
                      color: AppColors.secondary,
                      size: 24.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ── Internal panel ───────────────────────────────────────────────────────────

class _DropdownPanel extends StatelessWidget {
  final List<String> options;
  final String? selectedOption;
  final ValueChanged<String> onSelect;

  const _DropdownPanel({
    required this.options,
    required this.selectedOption,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12.r,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: options.map((option) {
          final bool isSelected = option == selectedOption;
          return GestureDetector(
            onTap: () => onSelect(option),
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 5.h),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.black : Colors.white,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: Colors.black, width: 1.w),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
              child: Text(
                option,
                style: AppFonts.black18w400.copyWith(
                  color: isSelected ? Colors.white : Colors.black87,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
