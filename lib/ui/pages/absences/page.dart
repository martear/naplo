import 'package:flutter/material.dart';
import 'package:filcnaplo/ui/pages/absences/absence/builder.dart';
import 'package:filcnaplo/ui/pages/absences/delay/builder.dart';
import 'package:filcnaplo/ui/pages/absences/miss/builder.dart';
import 'package:filcnaplo/ui/common/custom_snackbar.dart';
import 'package:filcnaplo/ui/common/custom_tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:filcnaplo/data/context/app.dart';
import 'package:filcnaplo/utils/format.dart';
import 'package:filcnaplo/generated/i18n.dart';
import 'package:filcnaplo/ui/common/empty.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AbsencesPage extends StatefulWidget {
  @override
  _AbsencesPageState createState() => _AbsencesPageState();
}

class _AbsencesPageState extends State<AbsencesPage>
    with SingleTickerProviderStateMixin {
  AbsenceBuilder _absenceBuilder;
  DelayBuilder _delayBuilder;
  MissBuilder _missBuilder;

  _AbsencesPageState() {
    this._absenceBuilder = AbsenceBuilder();
    this._delayBuilder = DelayBuilder();
    this._missBuilder = MissBuilder();
  }

  void buildPage() {
    _absenceBuilder.build();
    _delayBuilder.build();
    _missBuilder.build();
  }

  final _refreshKeyAbsences = GlobalKey<RefreshIndicatorState>();
  final _refreshKeyDelays = GlobalKey<RefreshIndicatorState>();
  final _refreshKeyMisses = GlobalKey<RefreshIndicatorState>();

  TabController _tabController;
  bool didPageChange;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: 3,
    );
    didPageChange = false;
    _tabController.addListener(() => setState(() => didPageChange = true));
  }

  @override
  void dispose() {
    if (mounted) {
      _tabController.dispose();
      super.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    buildPage();

    return Scaffold(
      body: Column(children: [
        SafeArea(
          child: CustomTabBar(
            padding: EdgeInsets.only(top: 4.0),
            controller: _tabController,
            onTap: (value) => _tabController.animateTo(value),
            color: app.settings.theme.textTheme.bodyText1.color,
            labels: [
              CustomLabel(title: capital(I18n.of(context).absenceAbsences)),
              CustomLabel(title: capital(I18n.of(context).absenceDelays)),
              CustomLabel(title: capital(I18n.of(context).absenceMisses)),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              // Absences
              RefreshIndicator(
                key: _refreshKeyAbsences,
                onRefresh: () async {
                  if (!await app.user.sync.absence.sync()) {
                    ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar(
                      message: I18n.of(context).errorMessages,
                      color: Colors.red,
                    ));
                  } else {
                    setState(() {});
                  }
                },
                child: _absenceBuilder.absenceTiles.length > 0
                    ? CupertinoScrollbar(
                        child: AnimationLimiter(
                          child: ListView.builder(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              physics: BouncingScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              itemCount: _absenceBuilder.absenceTiles.length,
                              itemBuilder: (context, index) {
                                return AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: didPageChange
                                      ? Duration.zero
                                      : Duration(milliseconds: 400),
                                  delay: didPageChange ? Duration.zero : null,
                                  child: SlideAnimation(
                                    verticalOffset: 150,
                                    child: FadeInAnimation(
                                        child: _absenceBuilder
                                            .absenceTiles[index]),
                                  ),
                                );
                              }),
                        ),
                      )
                    : Empty(title: I18n.of(context).emptyAbsences),
              ),

              // Delays
              RefreshIndicator(
                key: _refreshKeyDelays,
                onRefresh: () async {
                  if (!await app.user.sync.absence.sync()) {
                    ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar(
                      message: I18n.of(context).errorMessages,
                      color: Colors.red,
                    ));
                  } else {
                    setState(() {});
                  }
                },
                child: _delayBuilder.delayTiles.length > 0
                    ? CupertinoScrollbar(
                        child: ListView(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            physics: BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            children: _delayBuilder.delayTiles),
                      )
                    : Empty(title: I18n.of(context).emptyDelays),
              ),

              // Misses
              RefreshIndicator(
                  key: _refreshKeyMisses,
                  onRefresh: () async {
                    if (!await app.user.sync.note.sync()) {
                      ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar(
                        message: I18n.of(context).errorMessages,
                        color: Colors.red,
                      ));
                    } else {
                      setState(() {});
                    }
                  },
                  child: _missBuilder.missTiles.length > 0
                      ? CupertinoScrollbar(
                          child: ListView(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              physics: BouncingScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              children: _missBuilder.missTiles),
                        )
                      : Empty(
                          title:
                              I18n.of(context).emptyMisses)), // get from notes
            ],
          ),
        ),
      ]),
    );
  }
}
