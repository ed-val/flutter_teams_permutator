import 'package:flutter/material.dart';

List getListOfThings(List list) {
  return list.where((listitem) => listitem == true).toList();
}
