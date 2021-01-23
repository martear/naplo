import 'package:filcnaplo/data/models/evaluation.dart';
import 'package:filcnaplo/data/context/app.dart';
import 'package:filcnaplo/ui/pages/evaluations/grades/tile.dart';
import 'package:flutter/material.dart';

class GradeBuilder {
  List<GradeTile> gradeTiles = [];

  void build({EvalType type, int sortBy}) {
    // sortBy
    // 0 date
    // 1 date R
    // 2 write date
    // 3 write date R
    // 4 value
    // 5 value R

    gradeTiles = [];
    List<Evaluation> evaluations = app.user.sync.evaluation.evaluations
        .where((evaluation) => evaluation.type == type)
        .toList();

    if (sortBy != null) {
      switch (sortBy) {
        case 0:
          evaluations.sort(
            (a, b) => -a.date.compareTo(b.date),
          );
          break;
        case 1:
          evaluations.sort(
            (a, b) => a.date.compareTo(b.date),
          );
          break;
        case 2:
          evaluations.sort(
            (a, b) => -(a.writeDate ?? DateTime.fromMillisecondsSinceEpoch(0))
                .compareTo(
                    b.writeDate ?? DateTime.fromMillisecondsSinceEpoch(0)),
          );
          break;
        case 3:
          evaluations.sort(
            (a, b) => (a.writeDate ?? DateTime.fromMillisecondsSinceEpoch(0))
                .compareTo(
                    b.writeDate ?? DateTime.fromMillisecondsSinceEpoch(0)),
          );
          break;
        case 4:
          evaluations.sort(
            (a, b) => -(a.value.value ?? 0).compareTo(b.value.value ?? 0),
          );
          break;
        case 5:
          evaluations.sort(
            (a, b) => (a.value.value ?? 0).compareTo(b.value.value ?? 0),
          );
          break;
      }
    } else {
      evaluations.sort(
        (a, b) => -a.date.compareTo(b.date),
      );
    }

    evaluations.forEach(
      (evaluation) => gradeTiles.add(GradeTile(
        evaluation,
        padding: EdgeInsets.only(bottom: 4.0),
      )),
    );
  }
}
