import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stride_sync/ui/resources/app_colors.dart';
import 'package:stride_sync/ui/resources/app_fonts.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

class AppDropDown<T> extends StatefulWidget {
  final List<T> items;
  final String label, hint;
  final ValueSetter<T>? onChanged;
  final T? initialItem;
  final String Function(T) builder;
  const AppDropDown({
    super.key,
    required this.items,
    required this.label,
    required this.hint,
    required this.builder,
    this.onChanged,
    this.initialItem,
  });

  @override
  State<AppDropDown<T>> createState() => _AppDropDownState<T>();
}

class _AppDropDownState<S> extends State<AppDropDown<S>> {
  bool _isExpanded = false;
  S? _selectedItem;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _selectedItem = widget.initialItem;
        setState(() {});
      });
    });
  }

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20.h,
      crossAxisAlignment: .start,
      children: [
        Text(widget.label, style: AppFonts.black14w400),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: AppColors.borderColor),
          ),
          clipBehavior: Clip.antiAlias,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 13.5.h),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    _selectedItem != null
                        ? widget.builder(_selectedItem!)
                        : widget.hint,
                    style: AppFonts.black14w400,
                  ),
                  const Spacer(),
                  Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      onTap: _toggleExpansion,
                      customBorder: const CircleBorder(),
                      child: Padding(
                        padding: EdgeInsets.all(4.w),
                        child: AnimatedRotation(
                          turns: _isExpanded ? 0.5 : 0,
                          duration: const Duration(milliseconds: 200),
                          child: Icon(TablerIcons.chevronDown, size: 20.sp),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 250),
                child: SizedBox(
                  height: _isExpanded ? null : 0,
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.items.length,
                    itemBuilder: (_, index) {
                      return InkWell(
                        onTap: () {
                          widget.onChanged?.call(widget.items[index]);
                          _toggleExpansion();
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: Text(
                            widget.builder(widget.items[index]),
                            style: AppFonts.black14w400,
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (_, _) => const Divider(height: 0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
