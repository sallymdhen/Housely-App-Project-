import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'SwipeActionButton.dart';

class SwipeableMessageTile extends StatefulWidget {
  final Widget child;
  final VoidCallback onMore;
  final VoidCallback onDelete;
  final VoidCallback? onTap;
  final String? tileKey;
  final ValueChanged<String>? onOpened;

  const SwipeableMessageTile({
    super.key,
    required this.child,
    required this.onMore,
    required this.onDelete,
    this.tileKey,
    this.onOpened,
    this.onTap,
  });

  @override
  State<SwipeableMessageTile> createState() => SwipeableMessageTileState();
}

class SwipeableMessageTileState extends State<SwipeableMessageTile> {
  static const double _actionWidth = 80;
  static const double _totalActionsWidth = _actionWidth * 2;

  double _dragExtent = 0;

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    setState(() {
      _dragExtent += details.delta.dx;
      _dragExtent = _dragExtent.clamp(-_totalActionsWidth, 0.0);
    });

    if (_dragExtent < 0 && widget.tileKey != null && widget.onOpened != null) {
      widget.onOpened!(widget.tileKey!);
    }
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    final shouldOpen = _dragExtent.abs() > _totalActionsWidth / 2;
    setState(() {
      _dragExtent = shouldOpen ? -_totalActionsWidth : 0;
    });
  }

  void close() {
    if (_dragExtent != 0) {
      setState(() => _dragExtent = 0);
    }
  }

  void _handleMore() {
    close();
    widget.onMore();
  }

  void _handleDelete() {
    widget.onDelete();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Stack(
        children: [
          Positioned.fill(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SwipeActionButton(
                  icon: SvgPicture.asset("assets/icons/More.svg"),
                  label: 'More',
                  backgroundColor: AppColor.lightgrey,
                  width: _actionWidth,
                  onTap: _handleMore,
                ),
                SwipeActionButton(
                  icon: SvgPicture.asset("assets/icons/Delete.svg"),
                  label: 'Delete',
                  backgroundColor: AppColor.primaryColor,
                  width: _actionWidth,
                  onTap: _handleDelete,
                ),
              ],
            ),
          ),

          Transform.translate(
            offset: Offset(_dragExtent, 0),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                if (_dragExtent == 0) {
                  widget.onTap?.call();
                } else {
                  close();
                }
              },
              onHorizontalDragUpdate: _onHorizontalDragUpdate,
              onHorizontalDragEnd: _onHorizontalDragEnd,
              child: SizedBox(
                width: double.infinity,
                child: Material(
                  color: AppColor.whiteColor,
                  child: widget.child,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
