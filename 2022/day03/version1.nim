import sets, sequtils, strutils

proc getDup(s: string): char =
  let
    lineMid = s.high div 2
    p1 = s[0..lineMid].toHashSet
    p2 = s[lineMid+1..^1].toHashSet
  for item in p1 * p2:
    return item

proc getBadge(line, overlap: string): string =
  let
    s1 = line.toHashSet
    s2 = overlap.toHashSet
  return (s1 * s2).toSeq.join("")

proc calcPrio(c: char): int =
  let cnum = int(c)
  if cnum > 90:
    result = cnum - 96
  else:
    result = cnum - 64 + 26

var
  prioSum = 0
  prioSum2 = 0
  last = ""
  counter = 0

for line in "input".lines:
  prioSum += line.getDup.calcPrio
  if last.len > 0:
    last = getBadge(line, last)
    if counter == 2:
      prioSum2 += last[0].calcPrio
      last = ""
      counter = 0
    else:
      inc counter
  else:
    last = line
    inc counter

echo prioSum
echo prioSum2

