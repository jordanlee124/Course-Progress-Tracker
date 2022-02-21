# Python helper functions

def getProgram(db,code):
  cur = db.cursor()
  cur.execute("select * from Programs where code = %s",[code])
  info = cur.fetchone()
  cur.close()
  if not info:
    return None
  else:
    return info

def getStream(db,code):
  cur = db.cursor()
  cur.execute("select * from Streams where code = %s",[code])
  info = cur.fetchone()
  cur.close()
  if not info:
    return None
  else:
    return info

def getStudent(db,zid):
  cur = db.cursor()
  qry = """
  select p.*, c.name
  from   People p
         join Students s on s.id = p.id
         join Countries c on p.origin = c.id
  where  p.id = %s
  """
  cur.execute(qry,[zid])
  info = cur.fetchone()
  cur.close()
  if not info:
    return None
  else:
    return info

def getSubject(db,code):
  cur = db.cursor()
  qry = """
  select * from subjects where code = %s
  """
  cur.execute(qry,[code])
  info = cur.fetchone()
  cur.close()
  if not info:
    return None
  else:
    return info

def get_req(db,name):
  cur = db.cursor()
  qry = """
  select min_req, max_req from rules where name = %s
  """
  cur.execute(qry,[name])
  info = cur.fetchone()
  cur.close()
  if not info:
    return None
  else:
    return info

def getRuleType(db,name):
  cur = db.cursor()
  qry = """
  select type from rules where name = %s
  """
  cur.execute(qry,[name])
  info = cur.fetchone()
  cur.close()
  if not info:
    return None
  else:
    return info