void main() {
  // List of student scores
  List<int> scores = [45, 67, 82, 49, 51, 78, 92, 30];

  // You code
  var scoresPassed = scores.where((score) => score >= 50);
  print(scoresPassed.toList());
  print("${scoresPassed.length} students passed.");
}
