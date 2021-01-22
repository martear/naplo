import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:filcnaplo/data/context/app.dart';
import 'package:filcnaplo/generated/i18n.dart';
import 'package:filcnaplo/helpers/averages.dart';
import 'package:flutter/material.dart';
import 'package:filcnaplo/ui/cards/card.dart';
import 'package:filcnaplo/data/models/evaluation.dart';

class FinalCard extends BaseCard {
  final List<Evaluation> evals;
  final Key key;
  final DateTime compare;

  FinalCard(this.evals, {this.key, this.compare});

  @override
  Widget build(BuildContext context) {
    double finalAvg = (averageOfEvals(evals) * 10).roundToDouble() /
        10; //this is pretty jank sry

    int finalType = evalTypes[evals.first.type.name];

    String title = "";
    switch (finalType) {
      case 1:
        title += (I18n.of(context).evaluationsQYear);
        break;
      case 2:
        title += (I18n.of(context).evaluations2qYear);
        break;
      case 3:
        title += (I18n.of(context).evaluationsHalfYear);
        break;
      case 4:
        title += (I18n.of(context).evaluations3qYear);
        break;
      case 5:
        title += (I18n.of(context).evaluations4qYear);
        break;
      case 6:
        title += (I18n.of(context).evaluationsEndYear);
        break;
      default:
        print("error!" + evals.first.subject.name);
        title += "error";
        break;
    }
    title += (" " + I18n.of(context).evaluations);

    int dicseretesAmount =
        evals.where((element) => element.description == "Dicséret").length;
    //TODO remove comment
    int failedAmount = 2; //evals.where((element) => element.value == 1).length;

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
                        fontSize: 38.0,
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
            Text(" - " + evals.length.toString() + I18n.of(context).amount,
                style: TextStyle(
                    //Copied directly from ListTile source code, same as subtitle
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
          onPressed: () {},
        ),
      ),
    );
  }
}
