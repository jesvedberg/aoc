import std/[tables, algorithm, strutils, sequtils]

proc getMoves(s: string): (int, int, int) =
  let cols = s.split
  return (cols[1].parseInt, cols[3].parseInt, cols[5].parseInt)

proc makeStack(i:int): Table[int, seq[char]] =
  for j in countup(1,i):
    result[j] = @[]

let numStacks = 9

var
  stacks = makeStack(numStacks)
  stacks2 = makeStack(numStacks)
  readStacks = true
  i = 1
  hpos = 1
  numMoves, source, dest: int
  output1, output2: string

for line in "input".lines:
  if readStacks:
    if line.strip[0] == '[':
      while i <= numStacks:
        if line[hpos] != ' ':
          stacks[i].add line[hpos]
          stacks2[i].add line[hpos]
        i += 1
        hpos += 4
      i = 1
      hpos = 1
    elif line[1] == '1':
      readStacks = false
      for i in countup(1,numStacks):
        stacks[i].reverse()
        stacks2[i].reverse()
  elif line != "":
    (numMoves, source, dest) = line.getMoves
    for x in countup(1,numMoves):
      stacks[dest].add stacks[source].pop
    stacks2[dest] = concat(stacks2[dest], stacks2[source][^numMoves..^1])
    stacks2[source] = stacks2[source][0..^(numMoves+1)]

for key in countup(1,numStacks):
  output1.add stacks[key][^1]
  output2.add stacks2[key][^1]

echo "Part 1: ", output1
echo "Part 2: ", output2
