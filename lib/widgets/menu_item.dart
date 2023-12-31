import 'package:flutter/material.dart';
import 'package:gojek_duplicates/data/models/item_favorite_model.dart';
import 'package:gojek_duplicates/data/models/item_submenu_amount_model.dart';
import 'package:gojek_duplicates/utils/colors.dart';

class MenuItemNavigation extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool? isSelected;
  final double? width;
  final Function()? onTapped;
  const MenuItemNavigation(
      {required this.icon,
      required this.label,
      this.width,
      this.isSelected,
      required this.onTapped,
      super.key});

  @override
  State<MenuItemNavigation> createState() => _MenuItemNavigationState();
}

class _MenuItemNavigationState extends State<MenuItemNavigation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  double resizeIcon = 26;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    _animation = Tween<double>(begin: 1.0, end: 1.05).animate(_controller);
    _controller.addListener(() {
      setState(() {});
    });
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTapped!();
        _controller.forward();
      },
      child: Transform.scale(
        scale: _animation.value,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.2,
          child: Column(
            children: [
              Icon(widget.icon,
                  size: resizeIcon,
                  color: !(widget.isSelected ?? false)
                      ? Colors.black
                      : CustomColors.green2),
              const SizedBox(height: 4),
              Text(widget.label,
                  style: TextStyle(
                      fontWeight: widget.isSelected ?? false
                          ? FontWeight.bold
                          : FontWeight.w300,
                      fontSize: 12 * MediaQuery.textScaleFactorOf(context),
                      color: CustomColors.dark2))
            ],
          ),
        ),
      ),
    );
  }
}

class SubMenuItemAmount extends StatelessWidget {
  final ItemSubMenuAmountModel? item;
  const SubMenuItemAmount({this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 65,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/icons/${item?.image}.png', height: 24, width: 24),
          const SizedBox(height: 8),
          Text(item?.label ?? '',
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}

class FavoriteMenu extends StatelessWidget {
  final ItemFavoriteModel? item;
  const FavoriteMenu({this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/icons/menus/${item?.icon ?? 'ic-gocar'}.png',
            height: 40, width: 40),
        const SizedBox(height: 8),
        Text(item?.label ?? '')
      ],
    );
  }
}
