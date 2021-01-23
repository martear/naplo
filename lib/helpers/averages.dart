import 'package:filcnaplo/data/context/app.dart';
import 'package:filcnaplo/data/models/evaluation.dart';
import 'package:filcnaplo/data/models/subject.dart';
import 'package:flutter/cupertino.dart';

class SubjectAverage {
  SubjectAverage(this.subject, this.average, this.classAverage);
  final Subject subject;
  final double average;
  final double classAverage;
}

int roundSubjAvg(double average) {
  if ((average >= average.floor() + (app.settings.roundUp / 10)) &&
      average >= 2.0)
    return average.ceil();
  else
    return average.floor();
}

Color getAverageColor(double average) {
  return app.theme.evalColors[(roundSubjAvg(average) - 1).clamp(0, 4)];
}

List<SubjectAverage> calculateSubjectsAverage() {
  List<Evaluation> evaluations = app.user.sync.evaluation.evaluations
      .where((e) => e.type == EvalType.midYear)
      .toList();
  List<SubjectAverage> averages = [];
  evaluations.forEach((evaluation) {
    if (!averages
        .map((SubjectAverage s) => s.subject.id)
        .toList()
        .contains(evaluation.subject.id)) {
      double average = averageEvals(evaluations
          .where((e) => e.subject.id == evaluation.subject.id)
          .toList());

      double classAverage = 0;

      classAverage = app.user.sync.evaluation.averages.firstWhere(
          (a) => a[0].id == evaluation.subject.id,
          orElse: () => [null, 0.0])[1];

      if (average.isNaN) average = 0.0;

      averages.add(SubjectAverage(evaluation.subject, average, classAverage));
    }
  });
  return averages;
}

double averageEvals(List<Evaluation> evals, {int forceWeight}) {
  double average = 0.0;
  evals.forEach((e) {
    average += e.value.value * ((forceWeight ?? e.value.weight) / 100);
  });

  average = average /
      evals
          .map((e) => (forceWeight ?? e.value.weight) / 100)
          .reduce((a, b) => a + b);

  return average.isNaN ? 0.0 : average;
}
