import 'package:flutter/cupertino.dart';

class EmailAddress {
  /*can't create consts in calsses unless they are static and when thy are static they
  are shared between all instances */
  final String value;
  //constant constructors save performance by creating objects in compile time
  const EmailAddress._(this.value);
  //overriding the Email Address class toString function
  @override
  String toString() => 'EmailAddress(value: $value)';
  //overriding the == operator to make it use value equaltiy and not referential equality
  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is EmailAddress && o.value == value;
  }

//returning the
  @override
  int get hashCode => value.hashCode;
  factory EmailAddress(String input) {
    assert(input != null);
    return EmailAddress(validateEmail(input));
  }
}

String validateEmail(String input) {
  const emailReg = r"""[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}""";
  if (RegExp(emailReg).hasMatch(input)) {
    return input;
  }
  throw EmailError(failedValue: input);
}

class EmailError {
  final String failedValue;
  EmailError({@required this.failedValue});
}
