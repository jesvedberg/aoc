import std/[sets, sequtils, strutils, monotimes]

proc getDup(s: string): char =
  let
    lineMid = s.high div 2
    s1 = s[0..lineMid]
    s2 = s[lineMid+1..^1]
  for c in s1:
    if c in s2:
      return c

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

let start = getMonoTime()
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
echo "Time: ",(getMonoTime()-start)
