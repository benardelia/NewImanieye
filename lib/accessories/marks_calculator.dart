class MarksCalculator {
 static String checkGrade(var marks) {
    try {
      if (int.parse(marks) >= 75) {
        return 'A';
      } else if (int.parse(marks) >= 65) {
        return 'B';
      } else if (int.parse(marks) >= 45) {
        return 'C';
      } else if (int.parse(marks) >= 30) {
        return 'D';
      } else {
        return 'F';
      }
    } catch (e) {
      return '-';
    }
  }

  static String checkGradeForPrimary(var marks) {
    try {
      if (int.parse(marks) >= 40) {
        return 'A';
      } else if (int.parse(marks) >= 30) {
        return 'B';
      } else if (int.parse(marks) >= 20) {
        return 'C';
      } else if (int.parse(marks) >= 10) {
        return 'D';
      } else {
        return 'F';
      }
    } catch (e) {
      return '-';
    }
  }

 static double calculateAverage(var marks) {
    double sum = 0;
    int count = 0;
    for (var i in marks) {
      try {
        sum += i;
        count++;
      } catch (e) {}
    }

    return (sum / count).roundToDouble();
  }

 static double totalMarsk(var marks) {
    double sum = 0;

    for (var i in marks) {
      try {
        sum += i;
      } catch (e) {}
    }

    return sum.roundToDouble();
  }
}
