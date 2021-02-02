import 'package:filcnaplo/data/controllers/search.dart';
import 'package:filcnaplo/data/models/searchable.dart';
import 'package:filcnaplo/generated/i18n.dart';
import 'package:filcnaplo/utils/format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:filcnaplo/data/context/app.dart';
import 'package:filcnaplo/ui/common/account_button.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class SearchBar extends StatefulWidget {
  final Function callback;

  SearchBar({@required this.callback});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final FloatingSearchBarController _barController =
      FloatingSearchBarController();

  List<Searchable> results = [];

  @override
  Widget build(context) {
    return FloatingSearchBar(
      backgroundColor: app.settings.theme.backgroundColor,
      margins: EdgeInsets.only(left: 12.0, right: 12.0, top: 42.0),
      padding: EdgeInsets.symmetric(horizontal: 2.0),
      hint: capital(I18n.of(context).search),
      borderRadius: BorderRadius.circular(12.0),
      controller: _barController,
      transition: CircularFloatingSearchBarTransition(),
      leadingActions: [
        FloatingSearchBarAction.icon(
          icon: Icon(FeatherIcons.search, color: app.settings.appColor),
          onTap: () {
            _barController.open();
          },
        )
      ],
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: ClipOval(
            child: Material(
              color: Colors.transparent,
              child: AccountButton(padding: EdgeInsets.zero),
            ),
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
          color: app.settings.appColor,
          duration: Duration(milliseconds: 400),
        )
      ],
      debounceDelay: const Duration(milliseconds: 500),
      transitionDuration: const Duration(milliseconds: 300),
      transitionCurve: Curves.easeInOut,
      onQueryChanged: (text) {
        setState(() {
          if (text != "") {
            results = SearchController.searchableResults(
              app.search.getSearchables(context, widget.callback),
              text,
            );
          } else {
            results = [];
          }
        });
      },
      physics: const BouncingScrollPhysics(),
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: app.settings.theme.backgroundColor,
            elevation: 4.0,
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: results.length > 0
                  ? EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 12.0)
                  : EdgeInsets.zero,
              itemCount: results.length,
              itemBuilder: (context, index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: Duration(milliseconds: 500),
                  child: SlideAnimation(
                    verticalOffset: 150,
                    child: FadeInAnimation(child: results[index].child),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
