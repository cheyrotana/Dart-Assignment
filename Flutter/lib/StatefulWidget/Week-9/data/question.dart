import '../model/question_model.dart';

final List<Question> sampleQuestions = [
  Question(
    title: 'What is the capital of France?',
    choices: ['Paris', 'London', 'Berlin', 'Madrid'],
    goodChoice: 'Paris',
  ),
  Question(
    title: 'Which planet is known as the Red Planet?',
    choices: ['Earth', 'Mars', 'Jupiter', 'Venus'],
    goodChoice: 'Mars',
  ),
  Question(
    title: 'Who wrote "Romeo and Juliet"?',
    choices: [
      'William Shakespeare',
      'Charles Dickens',
      'Jane Austen',
      'Mark Twain',
    ],
    goodChoice: 'William Shakespeare',
  ),
  Question(
    title: 'What is the largest ocean on Earth?',
    choices: [
      'Atlantic Ocean',
      'Indian Ocean',
      'Arctic Ocean',
      'Pacific Ocean',
    ],
    goodChoice: 'Pacific Ocean',
  ),
  Question(
    title: 'Which element has the chemical symbol O?',
    choices: ['Gold', 'Oxygen', 'Osmium', 'Iron'],
    goodChoice: 'Oxygen',
  ),
];
