import strformat, strutils, tables

let
  debug = false
  day = 2

proc getMove(move: char): int =
  if move == 'X':
    return 1
  elif move == 'Y':
    return 2
  else:
    return 3

proc getResult1(game: string): int =
  let
    wins = ["A Y", "B Z", "C X"]
    loses = ["A Z", "B X", "C Y"]
  if game in wins:
    return 6
  elif game in loses:
    return 0
  else:
    return 3

proc getResult2(game: string): int =
  let
    convert = {'A': 'X', 'B': 'Y', 'C': 'Z'}.toTable
    wins = {'A': 'B', 'B': 'C', 'C': 'A'}.toTable
    loses = {'A': 'C', 'B': 'A', 'C': 'B'}.toTable
  case game[2]:
    of 'X':
      return getMove(convert[loses[game[0]]])
    of 'Y':
      return (3 + getMove(convert[game[0]]))
    of 'Z':
      return (6 + getMove(convert[wins[game[0]]]))
    else:
      quit(fmt"Bad input: {game}")

var
  i = 0
  score1 = 0
  score2 = 0

for line in "input".lines:
  score1 += getResult1(line) + getMove(line[2])
  score2 += getResult2(line)
  if debug:
    echo fmt"'{line}' {getResult1(line)} {getMove(line[2])}"
    if i > 5:
      break
    i += 1

echo repeat('=',27)
echo "Advent of code 2022, day ", day
echo repeat('=',27)

echo "Problem 1: ", score1
echo "Problem 2: ", score2