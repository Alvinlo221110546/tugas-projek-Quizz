import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz/page/link.dart';
import 'package:quizz/page/provider/providerScore.dart';

class QuizPage extends StatefulWidget {
  final String quizType;
  final String title;

  QuizPage(this.quizType, this.title);
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  List<Map<String, Object>> _questions = [];
   Map<int, String> _selectedAnswers = {};

  final List<Map<String, Object>> _questions1 = [
    {
      'question': 'What is Python? ',
      'answers': [
        'A snake',
        'A programming language',
        'A car model',
        'A movie'
      ],
      'correctAnswer': 'A programming language',
      'theme': {'color': Colors.blue, 'icon': Icons.code},
    },
    {
      'question': 'Who created Python?',
      'answers': [
        'Dennis Ritchie',
        'Bjarne Stroustrup',
        'Guido van Rossum',
        'James Gosling'
      ],
      'correctAnswer': 'Guido van Rossum',
      'theme': {'color': Colors.green, 'icon': Icons.person},
    },
    {
      'question': 'What is a list in Python?',
      'answers': [
        'A collection of elements',
        'A built-in function',
        'A type of loop',
        'A conditional statement'
      ],
      'correctAnswer': 'A collection of elements',
      'theme': {'color': Colors.orange, 'icon': Icons.list},
    },
    {
      'question': 'What is the output of print(2 ** 3)?',
      'answers': ['6', '8', '9', 'None of the above'],
      'correctAnswer': '8',
      'theme': {'color': Colors.red, 'icon': Icons.functions},
    },
    {
      'question': 'How do you start a comment in Python?',
      'answers': ['//', '--', '#', '/* */'],
      'correctAnswer': '#',
      'theme': {'color': Colors.purple, 'icon': Icons.comment},
    },
  ];

  final List<Map<String, Object>> _questions2 = [
    {
      'question': 'What is Photoshop? ',
      'answers': ['A Photo', 'A shop', 'A Photo shop', 'A software'],
      'correctAnswer': 'A software',
      'theme': {'color': Colors.blue},
    },
    {
      'question': 'Who created Photoshop?',
      'answers': ['Budi', 'Andi', 'Guido van Rossum', 'None of above'],
      'correctAnswer': 'None of above',
      'theme': {'color': Colors.green},
    },
    {
      'question': 'What color is #FFFFFF?',
      'answers': ['Pink', 'Black', 'White', 'Blue'],
      'correctAnswer': 'White',
      'theme': {'color': Colors.orange},
    },
    {
      'question': 'What color is #000000',
      'answers': ['Pink', 'Black', 'White', 'Blue'],
      'correctAnswer': 'Black',
      'theme': {'color': Colors.red},
    },
    {
      'question': 'What letter written in photoshop icon logo?',
      'answers': ['Ps', 'XX', 'XY', 'YZ'],
      'correctAnswer': 'Ps',
      'theme': {'color': Colors.purple},
    },
  ];

  final List<Map<String, Object>> _questions3 = [
    {
      'question': 'What is Unity primarily used for?',
      'answers': [
        'Creating music',
        'Developing video games',
        'Editing videos',
        'Writing books'
      ],
      'correctAnswer': 'Developing video games',
      'theme': {'color': Colors.green},
    },
    {
      'question': 'Which programming language is commonly used in Unity?',
      'answers': ['Python', 'Java', 'C#', 'Ruby'],
      'correctAnswer': 'C#',
      'theme': {'color': Colors.blue},
    },
    {
      'question':
          'What is the name of the Unity interface used to design scenes?',
      'answers': [
        'Scene Editor',
        'Layout Manager',
        'Scene View',
        'Design Panel'
      ],
      'correctAnswer': 'Scene View',
      'theme': {'color': Colors.orange},
    },
    {
      'question':
          'What is the default 3D object that can be added to a scene in Unity?',
      'answers': ['Cube', 'Sphere', 'Plane', 'Cylinder'],
      'correctAnswer': 'Cube',
      'theme': {'color': Colors.purple},
    },
    {
      'question': 'What is the name of Unity’s physics engine?',
      'answers': ['Unreal Physics', 'Unity Engine', 'PhysX', 'Havok'],
      'correctAnswer': 'PhysX',
      'theme': {'color': Colors.red},
    },
  ];

  final List<Map<String, Object>> _questions4 = [
    {
      'question': 'What does SQL stand for?',
      'answers': [
        'Structured Query Language',
        'Simple Query Language',
        'Standardized Query Language',
        'Sequential Query Language'
      ],
      'correctAnswer': 'Structured Query Language',
      'theme': {'color': Colors.blue},
    },
    {
      'question': 'Which keyword is used to retrieve data from a database?',
      'answers': ['FETCH', 'SELECT', 'RETRIEVE', 'GET'],
      'correctAnswer': 'SELECT',
      'theme': {'color': Colors.green},
    },
    {
      'question': 'Which statement is used to update data in a database?',
      'answers': ['UPDATE', 'MODIFY', 'SET', 'EDIT'],
      'correctAnswer': 'UPDATE',
      'theme': {'color': Colors.orange},
    },
    {
      'question': 'Which statement is used to delete data from a database?',
      'answers': ['REMOVE', 'DELETE', 'ERASE', 'DROP'],
      'correctAnswer': 'DELETE',
      'theme': {'color': Colors.red},
    },
    {
      'question':
          'Which keyword is used to sort the result of a query in ascending order?',
      'answers': ['ASC', 'SORT', 'ORDER BY', 'SORT BY'],
      'correctAnswer': 'ORDER BY',
      'theme': {'color': Colors.purple},
    },
  ];

  final List<Map<String, Object>> _questions5 = [
    {
      'question':
          'Which type of graph is best suited for showing trends over time?',
      'answers': ['Bar graph', 'Pie chart', 'Line graph', 'Scatter plot'],
      'correctAnswer': 'Line graph',
      'theme': {'color': Colors.blue},
    },
    {
      'question': 'Which type of graph is used to compare quantities?',
      'answers': ['Histogram', 'Dot plot', 'Scatter plot', 'Bar graph'],
      'correctAnswer': 'Bar graph',
      'theme': {'color': Colors.green},
    },
    {
      'question':
          'Which type of graph is used to show proportions or percentages?',
      'answers': ['Bar graph', 'Histogram', 'Line graph', 'Pie chart'],
      'correctAnswer': 'Pie chart',
      'theme': {'color': Colors.orange},
    },
    {
      'question':
          'Which type of graph is used to show the relationship between two variables?',
      'answers': ['Dot plot', 'Line graph', 'Scatter plot', 'Histogram'],
      'correctAnswer': 'Scatter plot',
      'theme': {'color': Colors.red},
    },
    {
      'question':
          'Which type of graph is used to display the distribution of a dataset?',
      'answers': ['Line graph', 'Pie chart', 'Histogram', 'Bar graph'],
      'correctAnswer': 'Histogram',
      'theme': {'color': Colors.purple},
    },
  ];
  final List<Map<String, Object>> _questions6 = [
    {
      'question': 'What is the value of x in the equation: 3x + 5 = 17?',
      'answers': ['4', '6', '7', '8'],
      'correctAnswer': '4',
      'theme': {'color': Colors.blue},
    },
    {
      'question':
          'What is the result of the expression: 2x^2 + 3x - 5 when x = 2?',
      'answers': ['9', '10', '11', '12'],
      'correctAnswer': '12',
      'theme': {'color': Colors.green},
    },
    {
      'question': 'Solve for x: 2(x + 3) = 14',
      'answers': ['5', '6', '7', '8'],
      'correctAnswer': '5',
      'theme': {'color': Colors.orange},
    },
    {
      'question': 'What is the value of y in the equation: 4y - 7 = 25?',
      'answers': ['8', '9', '10', '11'],
      'correctAnswer': '8',
      'theme': {'color': Colors.red},
    },
    {
      'question': 'Solve for x: 3x - 2 = 13',
      'answers': ['3', '5', '6', '7'],
      'correctAnswer': '5',
      'theme': {'color': Colors.purple},
    },
  ];

  final List<Map<String, Object>> _questions7 = [
    {
      'question': 'What is the slope of the line with equation y = 3x + 2?',
      'answers': ['3', '2', '-3', '-2'],
      'correctAnswer': '3',
      'theme': {'color': Colors.blue},
    },
    {
      'question':
          'What is the y-intercept of the line with equation y = -2x + 5?',
      'answers': ['2', '5', '-2', '-5'],
      'correctAnswer': '5',
      'theme': {'color': Colors.green},
    },
    {
      'question': 'Which of the following lines has a slope of 0?',
      'answers': ['y = 2x + 3', 'y = -3', 'x = 5', 'y = -4x'],
      'correctAnswer': 'y = -3',
      'theme': {'color': Colors.orange},
    },
    {
      'question': 'What is the slope of a horizontal line?',
      'answers': ['0', '1', 'Undefined', 'Infinity'],
      'correctAnswer': '0',
      'theme': {'color': Colors.red},
    },
    {
      'question': 'What is the slope of a vertical line?',
      'answers': ['0', '1', 'Undefined', 'Infinity'],
      'correctAnswer': 'Undefined',
      'theme': {'color': Colors.purple},
    },
  ];

  final List<Map<String, Object>> _questions8 = [
    {
      'question': 'What is the formula for the volume of a cube?',
      'answers': ['V = s^2', 'V = l * w * h', 'V = πr^2', 'V = 4/3πr^3'],
      'correctAnswer': 'V = s^2',
      'theme': {'color': Colors.blue},
    },
    {
      'question':
          'What is the surface area of a rectangular prism with length 4 cm, width 3 cm, and height 2 cm?',
      'answers': ['20 cm^2', '28 cm^2', '36 cm^2', '48 cm^2'],
      'correctAnswer': '28 cm^2',
      'theme': {'color': Colors.green},
    },
    {
      'question':
          'What is the volume of a cylinder with radius 5 cm and height 10 cm?',
      'answers': ['50π cm^3', '100π cm^3', '125π cm^3', '250π cm^3'],
      'correctAnswer': '250π cm^3',
      'theme': {'color': Colors.orange},
    },
    {
      'question': 'What is the surface area of a sphere with radius 7 cm?',
      'answers': ['98π cm^2', '154π cm^2', '196π cm^2', '392π cm^2'],
      'correctAnswer': '196π cm^2',
      'theme': {'color': Colors.red},
    },
    {
      'question':
          'What is the volume of a triangular prism with base 8 cm, height 10 cm, and prism height 15 cm?',
      'answers': ['160 cm^3', '240 cm^3', '320 cm^3', '400 cm^3'],
      'correctAnswer': '240 cm^3',
      'theme': {'color': Colors.purple},
    },
  ];

  final List<Map<String, Object>> _questions9 = [
    {
      'question': 'What is another term for regression line?',
      'answers': [
        'Trend line',
        'Control line',
        'Fractal line',
        'Coherent line'
      ],
      'correctAnswer': 'Trend line',
      'theme': {'color': Colors.blue},
    },
    {
      'question':
          'In regression analysis, what is done by the regression coefficient?',
      'answers': [
        'Measures the strength of relationship',
        'Measures the slope of the regression line',
        'Measures the curvature of the data',
        'Measures the concentration of the data'
      ],
      'correctAnswer': 'Measures the slope of the regression line',
      'theme': {'color': Colors.green},
    },
    {
      'question':
          'What does the coefficient of determination (R^2) indicate in regression analysis?',
      'answers': [
        'Percentage of variation explained by the model',
        'Number of observations in the sample',
        'Significance level of the model',
        'Accuracy of the model predictions'
      ],
      'correctAnswer': 'Percentage of variation explained by the model',
      'theme': {'color': Colors.orange},
    },
    {
      'question':
          'What does the correlation coefficient indicate in linear regression analysis?',
      'answers': [
        'Strength and direction of relationship between variables',
        'Slope of the regression line',
        'Percentage of variation explained by the model',
        'Accuracy of the model predictions'
      ],
      'correctAnswer':
          'Strength and direction of relationship between variables',
      'theme': {'color': Colors.red},
    },
    {
      'question': 'What does the p-value indicate in regression analysis?',
      'answers': [
        'Significance of the predictor variables',
        'Accuracy of the regression model',
        'Strength of the relationship between variables',
        'Variability of the residuals'
      ],
      'correctAnswer': 'Significance of the predictor variables',
      'theme': {'color': Colors.purple},
    },
  ];

  final List<Map<String, Object>> _questions10 = [
    {
      'question': 'What is the formula for calculating the area of a triangle?',
      'answers': [
        'A = 1/2 * base * height',
        'A = π * r^2',
        'A = length * width',
        'A = s^2'
      ],
      'correctAnswer': 'A = 1/2 * base * height',
      'theme': {'color': Colors.blue},
    },
    {
      'question': 'What is the Pythagorean theorem?',
      'answers': [
        'a^2 + b^2 = c^2',
        'a^2 + b^2 = d^2',
        'a + b = c',
        'a + b + c = 180'
      ],
      'correctAnswer': 'a^2 + b^2 = c^2',
      'theme': {'color': Colors.green},
    },
    {
      'question': 'What is the formula for calculating the volume of a cone?',
      'answers': [
        'V = 1/3 * π * r^2 * h',
        'V = l * w * h',
        'V = s^2',
        'V = 4/3 * π * r^3'
      ],
      'correctAnswer': 'V = 1/3 * π * r^2 * h',
      'theme': {'color': Colors.orange},
    },
    {
      'question':
          'What is the formula for calculating the circumference of a circle?',
      'answers': [
        'C = 2 * π * r',
        'C = π * d',
        'C = 4 * π * r',
        'C = 1/2 * π * r^2'
      ],
      'correctAnswer': 'C = 2 * π * r',
      'theme': {'color': Colors.red},
    },
    {
      'question':
          'What is the formula for calculating the surface area of a sphere?',
      'answers': [
        'A = 4 * π * r^2',
        'A = 2 * π * r',
        'A = π * r^2',
        'A = 1/3 * π * r^2 * h'
      ],
      'correctAnswer': 'A = 4 * π * r^2',
      'theme': {'color': Colors.purple},
    },
  ];

  final List<Map<String, Object>> _questions11 = [
    {
      'question': 'What is Newton\'s first law of motion?',
      'answers': [
        'An object in motion tends to stay in motion, and an object at rest tends to stay at rest unless acted upon by an external force',
        'Force equals mass times acceleration',
        'For every action, there is an equal and opposite reaction',
        'The rate of change of momentum of an object is proportional to the applied force and takes place in the direction of the force'
      ],
      'correctAnswer':
          'An object in motion tends to stay in motion, and an object at rest tends to stay at rest unless acted upon by an external force',
      'theme': {'color': Colors.blue},
    },
    {
      'question': 'What is Newton\'s second law of motion?',
      'answers': [
        'An object in motion tends to stay in motion, and an object at rest tends to stay at rest unless acted upon by an external force',
        'Force equals mass times acceleration',
        'For every action, there is an equal and opposite reaction',
        'The rate of change of momentum of an object is proportional to the applied force and takes place in the direction of the force'
      ],
      'correctAnswer': 'Force equals mass times acceleration',
      'theme': {'color': Colors.green},
    },
    {
      'question': 'What is Newton\'s third law of motion?',
      'answers': [
        'An object in motion tends to stay in motion, and an object at rest tends to stay at rest unless acted upon by an external force',
        'Force equals mass times acceleration',
        'For every action, there is an equal and opposite reaction',
        'The rate of change of momentum of an object is proportional to the applied force and takes place in the direction of the force'
      ],
      'correctAnswer':
          'For every action, there is an equal and opposite reaction',
      'theme': {'color': Colors.orange},
    },
    {
      'question': 'What is inertia?',
      'answers': [
        'The tendency of an object to resist a change in its motion',
        'The force exerted by a surface as an object moves across it',
        'The force of attraction between two objects',
        'The force that opposes the motion of objects through air'
      ],
      'correctAnswer':
          'The tendency of an object to resist a change in its motion',
      'theme': {'color': Colors.red},
    },
    {
      'question': 'What is momentum?',
      'answers': [
        'The product of an object\'s mass and velocity',
        'The force exerted by a surface as an object moves across it',
        'The force of attraction between two objects',
        'The force that opposes the motion of objects through air'
      ],
      'correctAnswer': 'The product of an object\'s mass and velocity',
      'theme': {'color': Colors.purple},
    },
  ];

  final List<Map<String, Object>> _questions12 = [
    {
      'question': 'What is the basic unit of life?',
      'answers': ['Cell', 'Atom', 'Molecule', 'Organism'],
      'correctAnswer': 'Cell',
      'theme': {'color': Colors.blue},
    },
    {
      'question': 'What is the process by which plants make their own food?',
      'answers': ['Photosynthesis', 'Respiration', 'Digestion', 'Fermentation'],
      'correctAnswer': 'Photosynthesis',
      'theme': {'color': Colors.green},
    },
    {
      'question': 'Which organelle is known as the powerhouse of the cell?',
      'answers': [
        'Mitochondria',
        'Nucleus',
        'Ribosome',
        'Endoplasmic reticulum'
      ],
      'correctAnswer': 'Mitochondria',
      'theme': {'color': Colors.orange},
    },
    {
      'question':
          'What is the process by which organisms exchange gases with the environment?',
      'answers': ['Respiration', 'Photosynthesis', 'Diffusion', 'Osmosis'],
      'correctAnswer': 'Respiration',
      'theme': {'color': Colors.red},
    },
    {
      'question': 'What is the genetic material found in all living organisms?',
      'answers': ['DNA', 'RNA', 'Protein', 'Carbohydrate'],
      'correctAnswer': 'DNA',
      'theme': {'color': Colors.purple},
    },
  ];

  final List<Map<String, Object>> _questions13 = [
    {
      'question': 'What is the boiling point of water in Celsius?',
      'answers': ['100°C', '0°C', '50°C', '150°C'],
      'correctAnswer': '100°C',
      'theme': {'color': Colors.blue},
    },
    {
      'question': 'What is absolute zero?',
      'answers': [
        'The lowest possible temperature',
        'The highest possible temperature',
        'The temperature at which water boils',
        'The temperature at which water freezes'
      ],
      'correctAnswer': 'The lowest possible temperature',
      'theme': {'color': Colors.green},
    },
    {
      'question': 'What is the unit of temperature in the Kelvin scale?',
      'answers': ['Kelvin', 'Celsius', 'Fahrenheit', 'Rankine'],
      'correctAnswer': 'Kelvin',
      'theme': {'color': Colors.orange},
    },
    {
      'question': 'What is the freezing point of water in Fahrenheit?',
      'answers': ['32°F', '0°F', '100°F', '212°F'],
      'correctAnswer': '32°F',
      'theme': {'color': Colors.red},
    },
    {
      'question': 'What is the temperature of absolute zero in Kelvin?',
      'answers': ['0 K', '100 K', '273 K', '373 K'],
      'correctAnswer': '0 K',
      'theme': {'color': Colors.purple},
    },
  ];

  final List<Map<String, Object>> _questions14 = [
    {
      'question': 'What is an atom?',
      'answers': [
        'The smallest unit of an element',
        'A type of chemical bond',
        'A molecule',
        'A subatomic particle'
      ],
      'correctAnswer': 'The smallest unit of an element',
      'theme': {'color': Colors.blue},
    },
    {
      'question': 'What is the atomic number of an element?',
      'answers': [
        'The number of protons in the nucleus',
        'The number of neutrons in the nucleus',
        'The number of electrons in the outer shell',
        'The total number of protons and neutrons'
      ],
      'correctAnswer': 'The number of protons in the nucleus',
      'theme': {'color': Colors.green},
    },
    {
      'question': 'What is a chemical reaction?',
      'answers': [
        'The process of breaking chemical bonds',
        'The process of forming new chemical bonds',
        'The process of converting matter into energy',
        'The process of converting energy into matter'
      ],
      'correctAnswer': 'The process of forming new chemical bonds',
      'theme': {'color': Colors.orange},
    },
    {
      'question': 'What is the law of conservation of mass?',
      'answers': [
        'Matter cannot be created or destroyed, only transformed',
        'Energy cannot be created or destroyed, only transformed',
        'The total mass of reactants must equal the total mass of products in a chemical reaction',
        'The total energy of a closed system remains constant over time'
      ],
      'correctAnswer':
          'Matter cannot be created or destroyed, only transformed',
      'theme': {'color': Colors.red},
    },
    {
      'question': 'What is a chemical bond?',
      'answers': [
        'A force that holds atoms together in a compound',
        'A type of subatomic particle',
        'A unit of matter',
        'A unit of energy'
      ],
      'correctAnswer': 'A force that holds atoms together in a compound',
      'theme': {'color': Colors.purple},
    },
  ];

  final List<Map<String, Object>> _questions15 = [
    {
      'question': 'What is a galaxy?',
      'answers': [
        'A large system of stars, dust, and gas bound together by gravity',
        'A single star in space',
        'A group of planets orbiting a star',
        'A cluster of asteroids'
      ],
      'correctAnswer':
          'A large system of stars, dust, and gas bound together by gravity',
      'theme': {'color': Colors.blue},
    },
    {
      'question': 'What is a planet?',
      'answers': [
        'A celestial body that orbits a star',
        'A type of satellite',
        'A type of asteroid',
        'A large moon'
      ],
      'correctAnswer': 'A celestial body that orbits a star',
      'theme': {'color': Colors.green},
    },
    {
      'question': 'What is a black hole?',
      'answers': [
        'An area in space with a gravitational pull so strong that nothing, not even light, can escape',
        'A collapsed star with a small radius and extremely high density',
        'A region of space where time is distorted',
        'A massive explosion in space'
      ],
      'correctAnswer':
          'An area in space with a gravitational pull so strong that nothing, not even light, can escape',
      'theme': {'color': Colors.orange},
    },
    {
      'question': 'What is a comet?',
      'answers': [
        'A small, icy body that orbits the sun',
        'A large, rocky body that orbits the sun',
        'A type of moon',
        'A type of asteroid'
      ],
      'correctAnswer': 'A small, icy body that orbits the sun',
      'theme': {'color': Colors.red},
    },
    {
      'question': 'What is an asteroid?',
      'answers': [
        'A small, rocky body that orbits the sun',
        'A large, icy body that orbits the sun',
        'A type of planet',
        'A type of comet'
      ],
      'correctAnswer': 'A small, rocky body that orbits the sun',
      'theme': {'color': Colors.purple},
    },
  ];

  final List<Map<String, Object>> _questions16 = [
    {
      'question': 'What is the formula to calculate the area of a rectangle?',
      'answers': [
        'A = l * w',
        'A = s^2',
        'A = πr^2',
        'A = 1/2 * base * height'
      ],
      'correctAnswer': 'A = l * w',
      'theme': {'color': Colors.blue},
    },
    {
      'question':
          'What is the formula for calculating the perimeter of a square?',
      'answers': ['P = 4s', 'P = l + w + h', 'P = 2πr', 'P = s^2'],
      'correctAnswer': 'P = 4s',
      'theme': {'color': Colors.green},
    },
    {
      'question': 'What is the formula to find the volume of a cylinder?',
      'answers': ['V = πr^2 * h', 'V = l * w * h', 'V = s^2', 'V = 4/3πr^3'],
      'correctAnswer': 'V = πr^2 * h',
      'theme': {'color': Colors.orange},
    },
    {
      'question':
          'What is the formula to calculate the circumference of a circle?',
      'answers': ['C = 2πr', 'C = l + w + h', 'C = πr^2', 'C = s^2'],
      'correctAnswer': 'C = 2πr',
      'theme': {'color': Colors.red},
    },
    {
      'question':
          'What is the formula for finding the surface area of a rectangular prism?',
      'answers': [
        'A = 2lw + 2lh + 2wh',
        'A = l * w',
        'A = πr^2',
        'A = 1/2 * base * height'
      ],
      'correctAnswer': 'A = 2lw + 2lh + 2wh',
      'theme': {'color': Colors.purple},
    },
  ];

  final List<Map<String, Object>> _questions17 = [
    {
      'question': 'What is the formula for calculating compound interest?',
      'answers': [
        'A = P(1 + r/n)^(nt)',
        'A = P * r * t',
        'A = P * (1 + r)^t',
        'A = P + rt'
      ],
      'correctAnswer': 'A = P(1 + r/n)^(nt)',
      'theme': {'color': Colors.blue},
    },
    {
      'question': 'What is the Pythagorean theorem in 3D?',
      'answers': [
        'c^2 = a^2 + b^2',
        'c = √(a^2 + b^2)',
        'a^2 + b^2 = d^2',
        'a + b = c'
      ],
      'correctAnswer': 'c^2 = a^2 + b^2',
      'theme': {'color': Colors.green},
    },
    {
      'question': 'What is the formula for the volume of a cone?',
      'answers': [
        'V = 1/3 * π * r^2 * h',
        'V = l * w * h',
        'V = s^2',
        'V = 4/3 * π * r^3'
      ],
      'correctAnswer': 'V = 1/3 * π * r^2 * h',
      'theme': {'color': Colors.orange},
    },
    {
      'question':
          'What is the formula for calculating the area of a trapezoid?',
      'answers': [
        'A = 1/2 * (b1 + b2) * h',
        'A = l * w',
        'A = πr^2',
        'A = 1/2 * base * height'
      ],
      'correctAnswer': 'A = 1/2 * (b1 + b2) * h',
      'theme': {'color': Colors.red},
    },
    {
      'question': 'What is the formula for the surface area of a cylinder?',
      'answers': [
        'A = 2πr(r + h)',
        'A = l * w',
        'A = πr^2',
        'A = 1/2 * base * height'
      ],
      'correctAnswer': 'A = 2πr(r + h)',
      'theme': {'color': Colors.purple},
    },
  ];

  final List<Map<String, Object>> _questions18 = [
    {
      'question': 'What is the capital of France?',
      'answers': ['Paris', 'London', 'Rome', 'Berlin'],
      'correctAnswer': 'Paris',
      'theme': {'color': Colors.blue},
    },
    {
      'question': 'Which planet is known as the Red Planet?',
      'answers': ['Mars', 'Venus', 'Jupiter', 'Saturn'],
      'correctAnswer': 'Mars',
      'theme': {'color': Colors.green},
    },
    {
      'question': 'What is the chemical symbol for water?',
      'answers': ['H2O', 'CO2', 'O2', 'CH4'],
      'correctAnswer': 'H2O',
      'theme': {'color': Colors.orange},
    },
    {
      'question': 'Who wrote "To Kill a Mockingbird"?',
      'answers': [
        'Harper Lee',
        'Mark Twain',
        'Charles Dickens',
        'William Shakespeare'
      ],
      'correctAnswer': 'Harper Lee',
      'theme': {'color': Colors.red},
    },
    {
      'question': 'What is the tallest mammal?',
      'answers': ['Giraffe', 'Elephant', 'Whale', 'Gorilla'],
      'correctAnswer': 'Giraffe',
      'theme': {'color': Colors.purple},
    },
  ];

  final List<Map<String, Object>> _questions19 = [
    {
      'question': 'What is the chemical symbol for carbon?',
      'answers': ['C', 'Ca', 'Co', 'Cu'],
      'correctAnswer': 'C',
      'theme': {'color': Colors.blue},
    },
    {
      'question': 'What is the capital of Japan?',
      'answers': ['Tokyo', 'Kyoto', 'Osaka', 'Seoul'],
      'correctAnswer': 'Tokyo',
      'theme': {'color': Colors.green},
    },
    {
      'question': 'Who painted the Mona Lisa?',
      'answers': [
        'Leonardo da Vinci',
        'Vincent van Gogh',
        'Pablo Picasso',
        'Michelangelo'
      ],
      'correctAnswer': 'Leonardo da Vinci',
      'theme': {'color': Colors.orange},
    },
    {
      'question': 'What is the largest ocean on Earth?',
      'answers': [
        'Pacific Ocean',
        'Atlantic Ocean',
        'Indian Ocean',
        'Arctic Ocean'
      ],
      'correctAnswer': 'Pacific Ocean',
      'theme': {'color': Colors.red},
    },
    {
      'question': 'What is the main component of Earth\'s atmosphere?',
      'answers': ['Nitrogen', 'Oxygen', 'Carbon dioxide', 'Argon'],
      'correctAnswer': 'Nitrogen',
      'theme': {'color': Colors.purple},
    },
  ];

  final List<Map<String, Object>> _questions20 = [
    {
      'question': 'What is the capital of Australia?',
      'answers': ['Canberra', 'Sydney', 'Melbourne', 'Brisbane'],
      'correctAnswer': 'Canberra',
      'theme': {'color': Colors.blue},
    },
    {
      'question': 'Who discovered penicillin?',
      'answers': [
        'Alexander Fleming',
        'Louis Pasteur',
        'Marie Curie',
        'Gregor Mendel'
      ],
      'correctAnswer': 'Alexander Fleming',
      'theme': {'color': Colors.green},
    },
    {
      'question': 'What is the chemical symbol for gold?',
      'answers': ['Au', 'Ag', 'Fe', 'Hg'],
      'correctAnswer': 'Au',
      'theme': {'color': Colors.orange},
    },
    {
      'question': 'Who wrote "Romeo and Juliet"?',
      'answers': [
        'William Shakespeare',
        'Charles Dickens',
        'Jane Austen',
        'Mark Twain'
      ],
      'correctAnswer': 'William Shakespeare',
      'theme': {'color': Colors.red},
    },
    {
      'question': 'What is the largest planet in our solar system?',
      'answers': ['Jupiter', 'Saturn', 'Neptune', 'Uranus'],
      'correctAnswer': 'Jupiter',
      'theme': {'color': Colors.purple},
    },
  ];

  void initState() {
    super.initState();
    _loadQuestions();
  }

  void _loadQuestions() {
    switch (widget.quizType) {
      case 'Phytonquiz':
        _questions = _questions1;
        break;
      case 'Photoshopquiz':
        _questions = _questions2;
        break;
      case 'Unityquiz':
        _questions = _questions3;
        break;
      case 'Sqlquiz':
        _questions = _questions4;
        break;
      case 'Grapicquiz':
        _questions = _questions5;
        break;
      case 'Algebraquiz':
        _questions = _questions6;
        break;
      case 'Linearquiz':
        _questions = _questions7;
        break;
      case 'Ruangquiz':
        _questions = _questions8;
        break;
      case 'Regresiquiz':
        _questions = _questions9;
        break;
      case 'Kecerdasanquiz':
        _questions = _questions10;
        break;
      case 'fisikaquiz':
        _questions = _questions11;
        break;
      case 'Biologyquiz':
        _questions = _questions12;
        break;
      case 'Suhuquiz':
        _questions = _questions13;
        break;
      case 'Sainsquiz':
        _questions = _questions14;
        break;
      case 'Astronomiquiz':
        _questions = _questions15;
        break;
      case 'Elementryquiz':
        _questions = _questions16;
        break;
      case 'advancequiz':
        _questions = _questions17;
        break;
      case 'hardquiz':
        _questions = _questions18;
        break;
      case 'C1quiz':
        _questions = _questions19;
        break;
      case 'nextlvlquiz':
        _questions = _questions20;
        break;
      default:
        _questions = [];
        break;
    }
  }

  void _answerQuestion(String answer) {
    setState(() {
      _selectedAnswers[_currentQuestionIndex] = answer;
         if (answer == _questions[_currentQuestionIndex]['correctAnswer']) {
        _score++;
      }
    });
  }

  void _previousQuestion() {
    setState(() {
      if (_currentQuestionIndex > 0) {
        _currentQuestionIndex--;
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        _showFinalScore(context);
      }
    });
  }

  void _chooseQuestion(int index) {
    setState(() {
      _currentQuestionIndex = index;
    });
  }

  void _showFinalScore(BuildContext context) {
    final scoreProvider = Provider.of<ScoreProvider>(context, listen: false);
    final currentQuiz = widget.title;
    final currentDate = DateTime.now().toLocal().toString().split(' ')[0];
    final questionLength = _questions.length;
    final scoreRatio = _score / questionLength;

    scoreProvider.updateScore(currentQuiz, scoreRatio);
    scoreProvider.addHistory(currentQuiz, currentDate);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Quiz Completed!'),
        content: Text('Your score is $_score out of ${_questions.length}'),
        actions: <Widget>[
          TextButton(
            child: Text('Back to Home'),
            onPressed: () {
              Navigator.of(ctx).pop();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButtons() {
    final questionTheme =
        _questions[_currentQuestionIndex]['theme'] as Map<String, Object>;
    final themeColor = questionTheme['color'] as Color;
    if (_currentQuestionIndex == _questions.length - 1) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: themeColor.withOpacity(0.9),
          shadowColor: themeColor.withOpacity(0.3),
          elevation: 4,
        ),
        onPressed: () {
          _showFinalScore(context);
        },
        child: Text('Submit',
            style: TextStyle(fontSize: 16.0, color: Colors.white)),
      );
    } else {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: themeColor.withOpacity(0.9),
          shadowColor: themeColor.withOpacity(0.3),
          elevation: 4,
        ),
        onPressed: _nextQuestion,
        child:
            Text('Next', style: TextStyle(fontSize: 16.0, color: Colors.white)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final progress = (_currentQuestionIndex + 1) / _questions.length;
    final questionTheme = _questions[_currentQuestionIndex]['theme'] as Map<String, Object>;
    final themeColor = questionTheme['color'] as Color;
    final selectedAnswer = _selectedAnswers[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.title}',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LinkPage()));
            },
            icon: Icon(Icons.share),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            LinearProgressIndicator(
              value: progress,
              backgroundColor: themeColor.withOpacity(0.1),
              valueColor: AlwaysStoppedAnimation<Color>(themeColor),
            ),
            SizedBox(height: 16),
            Text(
              'Question ${_currentQuestionIndex + 1} of ${_questions.length}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: themeColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: SingleChildScrollView(
                  child: Text(
                    _questions[_currentQuestionIndex]['question'] as String,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: themeColor,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ...(_questions[_currentQuestionIndex]['answers'] as List<String>).map((answer) {
              final isSelected = selectedAnswer == answer;
              return GestureDetector(
                onTap: () => _answerQuestion(answer),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: isSelected ? themeColor.withOpacity(0.7) : themeColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: themeColor),
                  ),
                  child: Text(
                    answer,
                    style: TextStyle(
                      color: isSelected ? Colors.white : themeColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }).toList(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _previousQuestion,
                  child: Text(
                    'Previous',
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: themeColor.withOpacity(0.9),
                    shadowColor: themeColor.withOpacity(0.3),
                    elevation: 4,
                  ),
                ),
                _buildBottomButtons(),
              ],
            ),
            SizedBox(height: 20),
            Container(
              height: 50.0,
              child: Center(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _questions.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => _chooseQuestion(index),
                      child: Container(
                        margin: const EdgeInsets.all(4.0),
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          color: index == _currentQuestionIndex ? themeColor.withOpacity(0.9) : Colors.grey[200],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Text(
                            '${index + 1}',
                            style: TextStyle(
                              color: index == _currentQuestionIndex ? Colors.white : themeColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}