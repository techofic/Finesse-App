
import 'package:finesse/components/navigation/build_icon.dart';
import 'package:finesse/components/navigation/chip_style.dart';
import 'package:finesse/components/navigation/inspired/inspired.dart';
import 'package:finesse/components/navigation/inspired/transition_container.dart';
import 'package:finesse/components/navigation/tab_item.dart';
import 'package:flutter/material.dart';

class KNavigationBar extends StatefulWidget {
  final List<TabItem> items;
  final double? height;
  final Color backgroundColor;
  final double? elevation;
  final bool fixed;
  final int indexSelected;
  final Function(int index)? onTap;
  final Color color;
  final Color colorSelected;
  final Color selectedTextColor;
  final double iconSize;
  final TextStyle? titleStyle;
  final ChipStyle? chipStyle;
  final ItemStyle? itemStyle;
  final bool animated;
  final bool isAnimated;
  final Duration? duration;
  final Curve? curve;
  final double? sizeInside;
  final double? padTop;
  final double? padbottom;
  final double? pad;
  final double? radius;
  final int? fixedIndex;

  const KNavigationBar({
    Key? key,
    required this.items,
    required this.backgroundColor,
    required this.color,
    required this.colorSelected,
    required this.selectedTextColor,
    this.height = 50,
    this.elevation,
    this.fixed = false,
    this.indexSelected = 0,
    this.onTap,
    this.iconSize = 22,
    this.titleStyle,
    this.chipStyle,
    this.itemStyle,
    this.animated = true,
    this.isAnimated = true,
    this.duration,
    this.curve,
    this.sizeInside = 44,
    this.padTop = 5,
    this.padbottom = 5,
    this.pad = 4,
    this.radius = 0,
    this.fixedIndex = 0,
  }) : super(key: key);

  @override
  _KNavigationBarState createState() => _KNavigationBarState();
}

class _KNavigationBarState extends State<KNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Inspired(
      height: widget.height!,
      count: widget.items.length,
      background: widget.backgroundColor,
      selectedTextColor: widget.selectedTextColor,
      fixed: widget.fixed,
      elevation: widget.elevation,
      animated: widget.animated,
      isAnimated: widget.isAnimated,
      pad: widget.pad,
      padTop: widget.padTop,
      padbottom: widget.padbottom,
      fixedIndex: widget.fixedIndex,
      radius: widget.radius,
      itemBuilder: (_, int index, bool active) => buildItem(
        context,
        item: widget.items[index],
        index: index,
        isSelected: index == widget.indexSelected,
      ),
      initialActive: widget.indexSelected,
      iconChip: (int index) => widget.items[index].icon,
      onTap: widget.onTap,
      chipStyle: widget.chipStyle,
      itemStyle: widget.itemStyle,
    );
  }

  Widget buildItem(
    BuildContext context, {
    required TabItem item,
    required int index,
    bool isSelected = false,
  }) {
    Color itemColor() {
      if (widget.fixed) {
        return isSelected ? widget.chipStyle!.background! : widget.color;
      }
      return isSelected ? widget.colorSelected : widget.color;
    }

    Color selectedTextColor() {
      // if (widget.fixed) {
      //   return isSelected ? widget.chipStyle!.background! : widget.color;
      // }
      return isSelected ? widget.selectedTextColor : widget.color;
    }

    if (widget.fixed ? widget.fixedIndex == index : isSelected) {
      if (widget.animated) {
        return TransitionContainer.flip(
          data: index,
          duration: widget.duration ?? const Duration(milliseconds: 350),
          height: 80,
          curve: widget.curve ?? Curves.easeInOutCubic,
          bottomChild: buildContentItem(item, itemColor(), widget.iconSize,
              widget.sizeInside!, selectedTextColor()),
        );
      }
      return buildContentItem(item, itemColor(), widget.iconSize,
          widget.sizeInside!, selectedTextColor());
    }
    return Container(
      padding: EdgeInsets.only(bottom: widget.padbottom!, top: widget.padTop!),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BuildIcon(
            item: item,
            iconColor: itemColor(),
            iconSize: widget.iconSize,
          ),
          if (item.title is String && item.title != '') ...[
            SizedBox(height: widget.pad),
            Text(
              item.title!,
              style: Theme.of(context)
                  .textTheme
                  .overline
                  ?.merge(widget.titleStyle)
                  .copyWith(
                    color: itemColor(),
                  ),
              textAlign: TextAlign.center,
            )
          ],
        ],
      ),
    );
  }

  Widget buildContentItem(TabItem item, Color itemColor, double iconSize,
      double sizeInside, Color selectedTextColor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (widget.itemStyle == ItemStyle.circle)
          Container(
            width: sizeInside,
            height: sizeInside,
            decoration: BoxDecoration(
                color: widget.chipStyle?.background!, shape: BoxShape.circle),
            alignment: Alignment.center,
            child: BuildIcon(
              item: item,
              iconColor: widget.fixed ? widget.colorSelected : itemColor,
              iconSize: iconSize,
            ),
          ),
        if (item.title is String && item.title != '') ...[
          SizedBox(height: widget.pad),
          Text(
            item.title!,
            style: Theme.of(context)
                .textTheme
                .overline
                ?.merge(widget.titleStyle)
                .copyWith(
                  color:
                      widget.fixed ? widget.colorSelected : selectedTextColor,
                ),
            textAlign: TextAlign.center,
          )
        ],
      ],
    );
  }
}
