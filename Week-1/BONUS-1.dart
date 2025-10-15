enum Direction { north, east, south, west }

class RobotFinalPosition {
  final int x;
  final int y;
  Direction direction;

  RobotFinalPosition(this.x, this.y, this.direction);
}

RobotFinalPosition calculateMovement(
  int x,
  int y,
  String instruction,
  Direction direction,
) {
  for (var i = 0; i < instruction.length; i++) {
    String command = instruction[i].toLowerCase();
    if (direction == Direction.north) {
      if (command == 'a') {
        y++;
      } else if (command == 'r') {
        direction = Direction.east;
      } else if (command == 'l') {
        direction = Direction.west;
      }
    } else if (direction == Direction.east) {
      if (command == 'a') {
        x++;
      } else if (command == 'r') {
        direction = Direction.south;
      } else if (command == 'l') {
        direction = Direction.north;
      }
    } else if (direction == Direction.south) {
      if (command == 'a') {
        y--;
      } else if (command == 'r') {
        direction = Direction.west;
      } else if (command == 'l') {
        direction = Direction.east;
      }
    } else {
      if (command == 'a') {
        x--;
      } else if (command == 'r') {
        direction = Direction.north;
      } else if (command == 'l') {
        direction = Direction.south;
      }
    }
  }
  return RobotFinalPosition(x, y, direction);
}

void main() {
  // Initial position {7, 3} and facing north
  int x = 7;
  int y = 3;
  Direction direction = Direction.north;

  // Example instruction sequence
  const instructions = "RAALAL";

  // Process the instructions and get the final position and direction
  RobotFinalPosition robotPosition = calculateMovement(
    x,
    y,
    instructions,
    direction,
  );
  // Print the final position and direction
  print("Final position: ${robotPosition.x}, ${robotPosition.y}");
  print("Facing: ${robotPosition.direction.name}");
}
