EDITOR="/usr/local/bin/vim";

// a simple no operation function
var no = function() {
  print("Not on my watch.");
}

// prevent dropping databases
db.dropDatabase = DB.prototype.dropDatabase = no;

// prevent dropping collections
DBCollection.prototype.drop = no;

// prevent dropping indexes
DBCollection.prototype.dropIndex = no;

// show the current database I'm using
prompt = function() {
  if (typeof db == 'undefined') {
    return '(nodb)> ';
  }

  // Check the last db operation
  try {
    db.runCommand({getLastError:1});
  }
  catch (e) {
    print(e);
  }

  return db+"> ";
};
