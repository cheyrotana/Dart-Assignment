class CustomDuration {
  final int _millisecond;

  int get millisecond => _millisecond;

  CustomDuration(this._millisecond) {
    if (_millisecond < 0) {
      throw Exception("Duration can not be negative.");
    }
  }

  // name constructor
  CustomDuration.fromHours(int hour)
    : _millisecond = hour * 60 * 60 * 1000;
  CustomDuration.fromMinutes(int min)
    : _millisecond = min * 60 * 1000;
  CustomDuration.fromSeconds(int sec)
    : _millisecond = sec * 1000;

  //Overloaded Operators
  CustomDuration operator +(CustomDuration other) {
    return CustomDuration(this._millisecond + other.millisecond);
  }

  CustomDuration operator -(CustomDuration other) {
    int result = this.millisecond - other._millisecond;
    return CustomDuration(result);
  }

  bool operator >(CustomDuration other) {
    return this._millisecond > other.millisecond;
  }

  int get ms => this._millisecond;
  double get seconds => _millisecond / 1000.0;
  double get minutes => _millisecond / (60 * 1000);
  double get hours => _millisecond / (60 * 60 * 1000);
}

void main() {
  var d1 = CustomDuration.fromSeconds(10);
  var d2 = CustomDuration.fromSeconds(4);

  print('d1: ${d1.ms} ms');
  print('d2: ${d2.ms} ms');

  print('Is d1 > d2?  ${d1 > d2}');
  print('Is d2 > d1?  ${d2 > d1}');

  var sum = d1 + d2;
  print('d1 + d2 = ${sum.ms} ms');

  var diff1 = d1 - d2;
  print('d1 - d2 = ${diff1.ms} ms');

  try {
    var diff2 = d2 - d1;
    print('d2 - d1 = ${diff2.ms} ms');
  } catch (e) {
    print('d2 - d1: Error - $e');
  }
}
