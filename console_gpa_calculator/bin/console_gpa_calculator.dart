import 'dart:io';
import 'dart:math';

class SubjectGrade {
  SubjectGrade({
    required this.subject,
    required this.gradeInput,
    required this.gradePoint,
  });

  final String subject;
  final String gradeInput;
  final double gradePoint;
}

void main(List<String> arguments) {
  stdout.writeln('=== GPA Calculator ===');
  stdout.writeln('Enter subjects and grades to calculate final GPA.');
  stdout.writeln('');

  final subjectCount = _readPositiveInt('How many subjects? ');
  final records = <SubjectGrade>[];

  for (var i = 0; i < subjectCount; i++) {
    stdout.writeln('');
    stdout.writeln('Subject ${i + 1}:');

    final subjectName = _readRequiredText('  Subject name: ');
    final parsedGrade = _readGrade('  Grade (A, B+, 3.5, or 87): ');

    records.add(
      SubjectGrade(
        subject: subjectName,
        gradeInput: parsedGrade.$1,
        gradePoint: parsedGrade.$2,
      ),
    );
  }

  final totalPoints = records.fold<double>(
    0,
    (sum, record) => sum + record.gradePoint,
  );
  final gpa = totalPoints / records.length;

  stdout.writeln('');
  stdout.writeln('=== Results ===');
  _printTable(records);
  stdout.writeln('');
  stdout.writeln('Final GPA: ${gpa.toStringAsFixed(2)} / 4.00');
  stdout.writeln('');
  stdout.write('Press Enter to close...');
  stdin.readLineSync();
}

int _readPositiveInt(String prompt) {
  while (true) {
    stdout.write(prompt);
    final input = stdin.readLineSync()?.trim() ?? '';
    final value = int.tryParse(input);

    if (value != null && value > 0) {
      return value;
    }

    stdout.writeln('Please enter a valid number greater than 0.');
  }
}

String _readRequiredText(String prompt) {
  while (true) {
    stdout.write(prompt);
    final input = stdin.readLineSync()?.trim() ?? '';
    if (input.isNotEmpty) {
      return input;
    }

    stdout.writeln('This field cannot be empty.');
  }
}

(String, double) _readGrade(String prompt) {
  while (true) {
    stdout.write(prompt);
    final input = stdin.readLineSync()?.trim() ?? '';

    if (input.isEmpty) {
      stdout.writeln('Grade cannot be empty.');
      continue;
    }

    final gradePoint = _parseGradePoint(input);
    if (gradePoint != null) {
      return (input.toUpperCase(), gradePoint);
    }

    stdout.writeln(
      'Invalid grade. Use letters (A, B+, C-) or numbers (0-4 or 0-100).',
    );
  }
}

double? _parseGradePoint(String input) {
  final normalized = input.trim().toUpperCase();
  const letterMap = <String, double>{
    'A+': 4.0,
    'A': 4.0,
    'A-': 3.7,
    'B+': 3.3,
    'B': 3.0,
    'B-': 2.7,
    'C+': 2.3,
    'C': 2.0,
    'C-': 1.7,
    'D+': 1.3,
    'D': 1.0,
    'F': 0.0,
  };

  if (letterMap.containsKey(normalized)) {
    return letterMap[normalized];
  }

  final numeric = double.tryParse(normalized);
  if (numeric == null) {
    return null;
  }

  if (numeric >= 0 && numeric <= 4) {
    return numeric;
  }

  if (numeric >= 0 && numeric <= 100) {
    if (numeric >= 90) return 4.0;
    if (numeric >= 85) return 3.7;
    if (numeric >= 80) return 3.3;
    if (numeric >= 75) return 3.0;
    if (numeric >= 70) return 2.7;
    if (numeric >= 65) return 2.3;
    if (numeric >= 60) return 2.0;
    if (numeric >= 55) return 1.7;
    if (numeric >= 50) return 1.0;
    return 0.0;
  }

  return null;
}

void _printTable(List<SubjectGrade> records) {
  const headers = ['#', 'Subject', 'Grade', 'Point'];

  final indexWidth = max(headers[0].length, records.length.toString().length);

  var subjectWidth = headers[1].length;
  var gradeWidth = headers[2].length;
  var pointWidth = headers[3].length;

  for (final record in records) {
    subjectWidth = max(subjectWidth, record.subject.length);
    gradeWidth = max(gradeWidth, record.gradeInput.length);
    pointWidth = max(pointWidth, record.gradePoint.toStringAsFixed(2).length);
  }

  final divider =
      '+-${'-' * indexWidth}-+-${'-' * subjectWidth}-+-${'-' * gradeWidth}-+-${'-' * pointWidth}-+';

  stdout.writeln(divider);
  stdout.writeln(
    '| ${headers[0].padRight(indexWidth)} | ${headers[1].padRight(subjectWidth)} | ${headers[2].padRight(gradeWidth)} | ${headers[3].padRight(pointWidth)} |',
  );
  stdout.writeln(divider);

  for (var i = 0; i < records.length; i++) {
    final row = records[i];
    stdout.writeln(
      '| ${(i + 1).toString().padRight(indexWidth)} | ${row.subject.padRight(subjectWidth)} | ${row.gradeInput.padRight(gradeWidth)} | ${row.gradePoint.toStringAsFixed(2).padRight(pointWidth)} |',
    );
  }

  stdout.writeln(divider);
}
