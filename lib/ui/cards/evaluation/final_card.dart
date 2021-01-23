import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:filcnaplo/data/context/app.dart';
import 'package:filcnaplo/data/context/page.dart';
import 'package:filcnaplo/generated/i18n.dart';
import 'package:filcnaplo/helpers/averages.dart';
import 'package:flutter/material.dart';
import 'package:filcnaplo/ui/cards/base.dart';
import 'package:filcnaplo/data/models/evaluation.dart';

class FinalCard extends BaseCard {
  final List<Evaluation> evals;
  final Key key;
  final DateTime compare;

  FinalCard(
    this.evals, {
    this.key,
    this.compare,
  });

  @override
  Widget build(BuildContext context) {
    double finalAvg =
        double.parse(averageEvals(evals, forceWeight: 100).toStringAsFixed(1));

    String title = "";
    switch (evals.first.type) {
      case EvaluationType.firstQ:
        title += I18n.of(context).evaluationsQYear;
        break;
      case EvaluationType.secondQ:
        title += I18n.of(context).evaluations2qYear;
        break;
      case EvaluationType.halfYear:
        title += I18n.of(context).evaluationsHalfYear;
        break;
      case EvaluationType.thirdQ:
        title += I18n.of(context).evaluations3qYear;
        break;
      case EvaluationType.fourthQ:
        title += I18n.of(context).evaluations4qYear;
        break;
      case EvaluationType.endYear:
        title += I18n.of(context).evaluationsEndYear;
        break;
      case EvaluationType.midYear:
        break;
    }
    title += (" " + I18n.of(context).evaluations);

    int dicseretesAmount =
        evals.where((e) => e.description == "Dicséret").length;
    int failedAmount = evals.where((e) => e.value.value == 1).length;

    return BaseCard(
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Container(
            width: 46.0,
            height: 46.0,
            child: Container(
                alignment: Alignment.center,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    finalAvg.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 32.0,
                        height: 1.2,
                        fontWeight: FontWeight.w500,
                        color: getAverageColor(finalAvg)),
                  ),
                ))),
        title: Row(
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(" • " + evals.length.toString() + I18n.of(context).amount,
                style: TextStyle(
                    fontSize: Theme.of(context).textTheme.bodyText2.fontSize,
                    color: Theme.of(context).textTheme.caption.color),
                overflow: TextOverflow.ellipsis)
          ],
        ),
        subtitle: (dicseretesAmount + failedAmount) > 0
            ? Text((dicseretesAmount > 0
                    ? (I18n.of(context).evaluationsCompliment +
                        ": " +
                        dicseretesAmount.toString() +
                        I18n.of(context).amount +
                        ((failedAmount > 0) ? ", " : ""))
                    : ("")) +
                (failedAmount > 0
                    ? (I18n.of(context).evaluationsFailed +
                        ": " +
                        failedAmount.toString() +
                        I18n.of(context).amount)
                    : ("")))
            : null,
        trailing: IconButton(
          icon: Icon(FeatherIcons.arrowRight),
          onPressed: () {
            app.gotoPage(PageType.evaluations,
                pageContext: PageContext(evaluationType: evals.first.type));
          },
        ),
      ),
    );
  }
}
