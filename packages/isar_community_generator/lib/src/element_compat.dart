// ignore_for_file: camel_case_types

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

typedef Element2 = Element;
typedef ClassElement2 = ClassElement;
typedef PropertyInducingElement2 = PropertyInducingElement;
typedef ConstructorElement2 = ConstructorElement;
typedef FieldElement2 = FieldElement;
typedef ExecutableElement2 = ExecutableElement;
typedef EnumElement2 = EnumElement;
typedef MixinElement2 = MixinElement;
typedef PropertyAccessorElement2 = PropertyAccessorElement;

extension ElementCompat on Element {
  String? get name3 => name;
  Element? get element3 => this;
  Element get nonSynthetic2 => this; // Approximate mapping
}

extension ClassElementCompat on ClassElement {
  List<ConstructorElement> get constructors2 => constructors;
  List<FieldElement> get fields2 => fields;
  List<MethodElement> get methods2 => methods;

  List<PropertyAccessorElement> get getters2 {
    // Fallback: implicit getters from fields.
    // Explicit accessors might be missing if 'accessors' is not available.
    return fields
        .map((f) => f.getter)
        .where((e) => e != null)
        .cast<PropertyAccessorElement>()
        .toList();
  }

  List<PropertyAccessorElement> get setters2 {
    // Fallback: implicit setters from fields.
    return fields
        .map((f) => f.setter)
        .where((e) => e != null)
        .cast<PropertyAccessorElement>()
        .toList();
  }
}

extension EnumElementCompat on EnumElement {
  List<FieldElement> get fields2 => fields;
  FieldElement? getField2(String name) => getField(name);
}

extension PropertyAccessorElementCompat on PropertyAccessorElement {
  PropertyInducingElement? get variable3 => variable;
}

extension DartTypeCompat on DartType {
  Element? get element3 => element;
}

extension InstantiatedTypeAliasElementCompat on InstantiatedTypeAliasElement {
  Element get element2 => element;
}

extension ConstructorElementCompat on ConstructorElement {
  Element get enclosingElement2 => enclosingElement;
  CompatFragment get firstFragment =>
      CompatFragment((name ?? '').isEmpty ? null : 0);
}

extension PropertyInducingElementCompat on PropertyInducingElement {
  PropertyAccessorElement? get setter2 => setter;
  PropertyAccessorElement? get getter2 => getter;
}

class CompatFragment {
  final int? periodOffset;
  CompatFragment(this.periodOffset);
}
