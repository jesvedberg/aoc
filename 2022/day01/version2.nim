import strutils, math

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
  top3 = [0,0,0]

for line in "input".lines:
  if line == "":
    top3 = addAndSort(top3, current)
    current = 0
  else:
    current += parseInt(line)
top3 = addAndSort(top3, current)

echo "Problem 1: ", top3[0]
echo "Problem 2: ", top3.sum
