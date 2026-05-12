import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stride_sync/ui/resources/app_colors.dart';
import 'package:stride_sync/ui/resources/app_fonts.dart';
import 'package:stride_sync/ui/widgets/custom_app_bar.dart';
import 'package:stride_sync/ui/widgets/horse_container.dart';
import 'package:stride_sync/utils/enums.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

class HorsesPage extends StatefulWidget {
  const HorsesPage({super.key});

  @override
  State<HorsesPage> createState() => _HorsesPageState();
}

class _HorsesPageState extends State<HorsesPage> {
  final GlobalKey _filterKey = GlobalKey();
  OverlayEntry? _overlayEntry;
  String _selectedSort = 'Oldest First';

  bool get _isMenuOpen => _overlayEntry != null;

  double _getFilterButtonBottom() {
    final RenderBox? box =
        _filterKey.currentContext?.findRenderObject() as RenderBox?;
    if (box == null) return 0;
    final position = box.localToGlobal(Offset.zero);
    return position.dy + box.size.height + 8;
  }

  void _openFilterMenu() {
    _overlayEntry = OverlayEntry(
      builder: (context) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _closeFilterMenu,
        child: Stack(
          children: [
            Positioned(
              top: _getFilterButtonBottom(),
              left: 22.w,
              right: 22.w,
              child: Material(
                color: Colors.transparent,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(8.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildSortOption('Oldest First'),
                        _buildSortOption('Youngest First'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    Overlay.of(context).insert(_overlayEntry!);
    setState(() {});
  }

  void _closeFilterMenu() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() {});
  }

  void _toggleFilterMenu() {
    if (_isMenuOpen) {
      _closeFilterMenu();
    } else {
      _openFilterMenu();
    }
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Horses",
        leadingWidget: Icon(Icons.menu, size: 30.sp),
        actionIcon: TablerIcons.bell,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            Text("All Horses", style: AppFonts.black20w700),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search by name or breed...",
                      prefixIcon: Icon(TablerIcons.search, size: 24.sp),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                GestureDetector(
                  onTap: _toggleFilterMenu,
                  child: Container(
                    key: _filterKey,
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                      gradient: AppColors.buttonGradient,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: AppColors.buttonBorder),
                    ),
                    child: Icon(
                      TablerIcons.filter,
                      size: 30.sp,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(bottom: 24.h),
                itemCount: 20,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 13.h),
                    child: HorseContainer(
                      status: index % 2 == 0 ? Status.inActive : Status.active,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressed: () {},
        child: Container(
          height: 50.h,
          width: 50.w,
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            gradient: AppColors.buttonGradient,
            border: Border.all(color: AppColors.buttonBorder),
            shape: BoxShape.circle,
          ),
          child: Icon(TablerIcons.plus, size: 30.sp, color: AppColors.white),
        ),
      ),
    );
  }

  Widget _buildSortOption(String label) {
    final bool isSelected = _selectedSort == label;

    return GestureDetector(
      onTap: () {
        setState(() => _selectedSort = label);
        _closeFilterMenu();
        // TODO: apply sort logic here
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 6.h),
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF1A3A2A) : AppColors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? Colors.transparent : Colors.grey.shade300,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: AppFonts.black20w700.copyWith(
            color: isSelected ? AppColors.white : Colors.black,
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }
}
