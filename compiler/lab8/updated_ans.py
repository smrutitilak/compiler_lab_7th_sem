Terminals = set('$')
NTs = {}
rules = set()
start_symbol = ""

dp_firsts = {}

n = 0
def first(nt):
  if not nt.isupper() or nt == '~':
    Terminals.add(nt)
    return set([(nt, nt+" => " + nt)])

  if nt in dp_firsts:
    return set(dp_firsts[nt])

  ans = set()
  for r in NTs[nt]:
    if r == "~":
      ans.add( ("~", nt + " => " + r) )
      continue
    #print r

    for i in range(len(r)):
      cf = [x[0] for x in first(r[i])]

      for x in cf:
	if x != "~":
          ans.add( (x, nt + " => " + r) )
      if "~" not in cf:
        break

  dp_firsts[nt] = ans
  return set(ans)


dp_follows = {}
def follow(nt):
  if nt in dp_follows:
    return set(dp_follows[nt])

  ans = set()
  if nt == start_symbol:
    ans = set('$')
  
  for rp in rules:
    r = rp[1]
    x = set()
    for i in range(1,len(r)):
      if r[i-1] == nt:
        t = first(r[i])
        if '~' in t:
          t.discard('~')
          t = t.union(follow(r[i]))
        x = x.union(t)
    if r[-1] == nt and nt != rp[0]:
      ans = ans.union(follow(rp[0]))
    ans = ans.union(x)
  dp_follows[nt] = ans
  return set(ans)

while True:
  try:
    r = raw_input()
    print "handling ", r
    nt, rule = r.split(" = ")
    NTs[nt] = [x.strip() for x in rule.split("|")]
    rules = rules.union(set([ (nt,x.strip()) for x in rule.split("|")]))
    if start_symbol == "":
      start_symbol = nt

  except EOFError:
    break


for nt in NTs:
  print nt, "\nFirst: ", set([ x[0] for x in first(nt)]), "\nFollow: ", set([ x[0] for x in follow(nt) ]), "\n"


parsingTable = {}

for nt in NTs:
  parsingTable[nt] = {}
  print nt, ": ",

  for t in Terminals:
    firsts = [ x[0] for x in first(nt) ]
    myrules= [ x[1] for x in first(nt) ]
    follows = [ x[0] for x in follow(nt) ]
    if t in firsts:
      print "\t'" + t + "': " + myrules[ firsts.index(t) ]
    elif t in follows:
      print "\t'" + t + "': " + nt + " => ~" 
  print "\n",

print "done"

