import 'package:flutter/material.dart';

class Person {
  final double height;
  final double weight;
  final double muscleMass;

  Person({
    required this.height,
    required this.weight,
    required this.muscleMass,
  });
}

int GetScore(Person p) {
  int score = 0;
  if ((p.height >= 160) && (p.weight <= 80) && (p.muscleMass >= 1)) {
    score = score + 10;
  } else {
    score = score + 5;
  }
  return score;
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 34, 5, 83),
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Check how attractive you are!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  List<String> hairColorOptions = ['Black', 'Brown', 'Blonde', 'Red', 'Green'];
  String selectedHairColor = 'Black';

  List<String> eyeColorOptions = ['Black', 'Brown', 'Green', 'Blue'];
  String selectedEyeColor = 'Black';

  List<String> facialHairOptions = ['None', 'Beard', 'Mustache'];
  String selectedFacialHair = 'None';

  List<int> muscleMassOptions = [1, 2, 3];
  int selectedMuscleMass = 1;

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            DropdownButtonFormField<String>(
              value: selectedHairColor,
              onChanged: (value) {
                setState(() {
                  selectedHairColor = value!;
                });
              },
              items: hairColorOptions.map<DropdownMenuItem<String>>(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                },
              ).toList(),
              decoration: InputDecoration(labelText: 'Hair Color'),
            ),
            DropdownButtonFormField<String>(
              value: selectedEyeColor,
              onChanged: (value) {
                setState(() {
                  selectedEyeColor = value!;
                });
              },
              items: eyeColorOptions.map<DropdownMenuItem<String>>(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                },
              ).toList(),
              decoration: InputDecoration(labelText: 'Eye Color'),
            ),
            DropdownButtonFormField<String>(
              value: selectedFacialHair,
              onChanged: (value) {
                setState(() {
                  selectedFacialHair = value!;
                });
              },
              items: facialHairOptions.map<DropdownMenuItem<String>>(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                },
              ).toList(),
              decoration: InputDecoration(labelText: 'Facial Hair'),
            ),
            DropdownButtonFormField<int>(
              value: selectedMuscleMass,
              onChanged: (value) {
                setState(() {
                  selectedMuscleMass = value!;
                });
              },
              items: muscleMassOptions.map<DropdownMenuItem<int>>(
                (int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()),
                  );
                },
              ).toList(),
              decoration: InputDecoration(labelText: 'Muscle Mass'),
            ),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _heightController,
              decoration: InputDecoration(labelText: 'Height (cm)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _weightController,
              decoration: InputDecoration(labelText: 'Weight (kg)'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final String name = _nameController.text;
                final int age = int.tryParse(_ageController.text) ?? 0;
                final double height =
                    double.tryParse(_heightController.text) ?? 0.0;
                final double weight =
                    double.tryParse(_weightController.text) ?? 0.0;

                final person = Person(
                  height: height,
                  weight: weight,
                  muscleMass: selectedMuscleMass.toDouble(),
                );

                final int score = GetScore(person);

                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('User Information and Score'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Name: $name'),
                          Text('Hair Color: $selectedHairColor'),
                          Text('Eye Color: $selectedEyeColor'),
                          Text('Facial Hair: $selectedFacialHair'),
                          Text('Age: $age'),
                          Text('Height: $height cm'),
                          Text('Weight: $weight kg'),
                          Text('Muscle Mass: ${person.muscleMass}'),
                          Text('Score: $score'),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Check'),
            ),
          ],
        ),
      ),
    );
  }
}
