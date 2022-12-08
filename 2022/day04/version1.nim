import std/[enumerate, strutils, sequtils]

proc getLimits(s: string): seq[int] =
  return map(s.split({',', '-'}), proc(s: string): int = s.parseInt)

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

for i, line in enumerate "input".lines:
  limits = getLimits(line)
  if limits.isContained:
    inc contained
  if limits.isOverlapping:
    inc overlapped

echo contained
echo overlapped