import std/[strutils, sequtils]

proc isContained(limits: seq[int]): bool =
  result = false
  if limits[0] < limits[2]:
    if limits[1] >= limits[3]:
      result = true
  elif limits[0] > limits[2]:
    if limits[1] <= limits[3]:
      result = true
  else:
    result = true

proc isOverlapping(limits: seq[int]): bool =
  result = false
  if limits[1] >= limits[2] and limits[1] <= limits[3]:
    result = true
  elif limits[3] >= limits[0] and limits[3] <= limits[1]:
    result = true

var
  limits: seq[int]
  contained = 0
  overlapped = 0

for line in "input".lines:
  limits = line.split({',', '-'}).mapIt(it.parseInt)
  if limits.isContained:
    inc contained
  if limits.isOverlapping:
    inc overlapped

echo contained
echo overlapped