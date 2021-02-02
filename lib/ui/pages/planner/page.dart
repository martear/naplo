import 'package:filcnaplo/ui/common/label.dart';
import 'package:filcnaplo/ui/pages/planner/homeworks/builder.dart';
import 'package:filcnaplo/ui/pages/planner/exams/builder.dart';
import 'package:flutter/material.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:filcnaplo/ui/common/custom_snackbar.dart';
import 'package:filcnaplo/ui/common/custom_tabs.dart';
import 'package:filcnaplo/ui/common/empty.dart';
import 'package:filcnaplo/ui/pages/planner/timetable/frame.dart';
import 'package:flutter/cupertino.dart';
import 'package:filcnaplo/generated/i18n.dart';
import 'package:filcnaplo/utils/format.dart';
import 'package:filcnaplo/data/context/app.dart';

class PlannerPage extends StatefulWidget {
  PlannerPage();

  @override
  _PlannerPageState createState() => _PlannerPageState();
}

class _PlannerPageState extends State<PlannerPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  HomeworkBuilder _homeworkBuilder;
  ExamBuilder _examBuilder;

  final _refreshKeyTimetable = GlobalKey<RefreshIndicatorState>();
  final _refreshKeyHomeworks = GlobalKey<RefreshIndicatorState>();
  final _refreshKeyExams = GlobalKey<RefreshIndicatorState>();

  bool showPastExams = false;
  bool showPastHomework = false;

  @override
  void initState() {
    super.initState();

    _homeworkBuilder = HomeworkBuilder(() => setState(() {}));
    _examBuilder = ExamBuilder();
    _tabController = TabController(
      vsync: this,
      length: 3,
    );
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
            color: app.settings.theme.textTheme.bodyText1.color,
            onTap: (value) {
              _tabController.animateTo(value);
              app.sync.updateCallback();
            },
            labels: [
              CustomLabel(title: capital(I18n.of(context).plannerTimetable)),
              CustomLabel(title: capital(I18n.of(context).plannerHomework)),
              CustomLabel(title: capital(I18n.of(context).plannerExams)),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              // Timetable
              RefreshIndicator(
                key: _refreshKeyTimetable,
                onRefresh: () async {
                  if (!await app.user.sync.timetable.sync()) {
                    ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar(
                      message: I18n.of(context).errorMessages,
                      color: Colors.red,
                    ));
                  } else {
                    setState(() {});
                  }
                },
                child: TimetableFrame(),
              ),

              // Homeworks
              RefreshIndicator(
                key: _refreshKeyHomeworks,
                onRefresh: () async {
                  if (!await app.user.sync.homework.sync()) {
                    ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar(
                      message: I18n.of(context).errorMessages,
                      color: Colors.red,
                    ));
                  } else {
                    setState(() {});
                  }
                },
                child: _homeworkBuilder.homeworkTiles[0].length > 0 ||
                        _homeworkBuilder.homeworkTiles[1].length > 0
                    ? CupertinoScrollbar(
                        child: ListView(
                          padding: EdgeInsets.only(top: 12.0),
                          physics: BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          children: [
                            Column(children: _homeworkBuilder.homeworkTiles[0]),
                            _homeworkBuilder.homeworkTiles[0].length == 0
                                ? Label(I18n.of(context).homeworkPast)
                                : _homeworkBuilder.homeworkTiles[1].length > 0
                                    ? FlatButton(
                                        onPressed: () => setState(() =>
                                            showPastHomework =
                                                !showPastHomework),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: Text(I18n.of(context)
                                                    .homeworkPast)),
                                            Icon(
                                              showPastHomework
                                                  ? FeatherIcons.chevronUp
                                                  : FeatherIcons.chevronDown,
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(),
                            showPastHomework ||
                                    _homeworkBuilder.homeworkTiles[0].length ==
                                        0
                                ? Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 4.0),
                                    child: Column(
                                        children:
                                            _homeworkBuilder.homeworkTiles[1]))
                                : Container(),
                          ],
                        ),
                      )
                    : Empty(title: I18n.of(context).emptyHomework),
              ),

              // Exams
              RefreshIndicator(
                key: _refreshKeyExams,
                onRefresh: () async {
                  if (!await app.user.sync.exam.sync()) {
                    ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar(
                      message: I18n.of(context).errorMessages,
                      color: Colors.red,
                    ));
                  } else {
                    setState(() {});
                  }
                },
                child: _examBuilder.examTiles[0].length > 0 ||
                        _examBuilder.examTiles[1].length > 0
                    ? CupertinoScrollbar(
                        child: ListView(
                          padding: EdgeInsets.only(top: 12.0),
                          physics: BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          children: [
                            Column(children: _examBuilder.examTiles[0]),
                            _examBuilder.examTiles[0].length == 0
                                ? Label(I18n.of(context).examPast.toUpperCase())
                                : _examBuilder.examTiles[1].length > 0
                                    ? FlatButton(
                                        onPressed: () => setState(() =>
                                            showPastExams = !showPastExams),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: Text(
                                                    I18n.of(context).examPast)),
                                            Icon(
                                              showPastExams
                                                  ? FeatherIcons.chevronUp
                                                  : FeatherIcons.chevronDown,
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(),
                            showPastExams ||
                                    _examBuilder.examTiles[0].length == 0
                                ? Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 4.0),
                                    child: Column(
                                        children: _examBuilder.examTiles[1]))
                                : Container(),
                          ],
                        ),
                      )
                    : Empty(title: I18n.of(context).emptyExams),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  void buildPage() {
    _homeworkBuilder.build();
    _examBuilder.build();
  }
}
