import strutils, math

proc checkMax(current, maxval: int): int =
  if current > maxval:
    return current
  else:
    return maxval

proc addAndSort(top3: array[3,int], current: int): array[3,int] =
  if current > top3[0]:
    return [current, top3[0], top3[1]]
  elif current > top3[1]:
    return [top3[0], current, top3[1]]
  elif current > top3[2]:
    return [top3[0], top3[1], current]
  else:
    return top3  

var
  current = 0
  maxVal = 0

for line in "input".lines:
  if line == "":
    maxval = checkMax(current, maxVal)
    current = 0
  else:
    current += parseInt(line)
maxVal = checkMax(current, maxVal)
current = 0

echo "Problem 1: ", maxVal

var
  top3 = [0,0,0]

for line in "input".lines:
  if line == "":
    top3 = addAndSort(top3, current)
    current = 0
  else:
    current += parseInt(line)
top3 = addAndSort(top3, current)

echo "Problem 2: ", top3.sum
