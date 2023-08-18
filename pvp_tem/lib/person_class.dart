void main() {
  Person p1 = Person('John', 'Black', 'Brown', 'Beard', 21, 176, 75, 3);
  int p1_score = GetScore(p1);
  print("${p1.name}:${p1_score}");

  Person p2 = Person('Mike', 'Grey', 'Blue', 'None', 75, 155, 99, 0);
  int p2_score = GetScore(p2);
  print("${p2.name}:${p2_score}");

  Person p3 = Person('Michelle', 'Blonde', 'Blue', 'None', 19, 180, 65, 2);
  int p3_score = GetScore(p3);
  print("${p3.name}:${p3_score}");

  Person p4 = Person('Nicole', 'None', 'Green', 'Mustache', 65, 151, 92, 1);
  int p4_score = GetScore(p4);
  print("${p4.name}:${p4_score}");
}

class Person {
  String? name, hairColor, eyeColor, facialHair;
  int? age, height, weight, muscleMass;

  Person(String this.name, this.hairColor, this.eyeColor, this.facialHair,
      int this.age, this.height, this.weight, this.muscleMass);
}

int GetScore(Person p) {
  int score = 0;
  if ((p.height! >= 160) && (p.weight! <= 80) && (p.muscleMass! >= 1)) {
    score = score + 10;
  } else {
    score = score + 5;
  }
  return score;
}
