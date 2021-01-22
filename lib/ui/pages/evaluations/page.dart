import 'package:filcnaplo/ui/pages/evaluations/grades/builder.dart';
import 'package:filcnaplo/ui/pages/evaluations/subjects/builder.dart';
import 'package:filcnaplo/ui/pages/evaluations/tabs.dart';
import 'package:flutter/material.dart';
import 'package:filcnaplo/data/context/app.dart';

class EvaluationsPage extends StatefulWidget {
  EvaluationsPage();

  @override
  _EvaluationsPageState createState() => _EvaluationsPageState();
}

class _EvaluationsPageState extends State<EvaluationsPage> {
  GradeBuilder _gradeBuilder;
  SubjectBuilder _subjectBuilder;

  _EvaluationsPageState() {
    this._gradeBuilder = GradeBuilder();
    this._subjectBuilder = SubjectBuilder();
  }

  void updateCallback() {
    setState(() {});
  }

  void buildPage() {
    _gradeBuilder.build(sortBy: app.evalSortBy);
    _subjectBuilder.build();
  }

  @override
  Widget build(BuildContext context) {
    buildPage();

    return EvaluationTabs(
      _gradeBuilder.gradeTiles,
      _subjectBuilder.subjectTiles,
      updateCallback,
    );
  }
}
