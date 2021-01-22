import 'package:filcnaplo/ui/cards/evaluation/tile.dart';
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
    return Container(height: 400, color: Colors.red);
  }
}
