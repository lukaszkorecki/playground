var u = require('util'),
    fs = require('fs');
var processOptions = function(argv) {

  var opts = {};
  argv.forEach(function(value, index, arr){
    if(index == 2) opts.regex = new RegExp(value);
    opts.files = arr.filter(function(el,index){ if(index >= 3) return el; });
  });

  return opts;

};
var grepFiles = function(files, regex, acceptor) {

  var readAndMatch = function(file) {
    fs.readFile(file, function(err,data){
      if(! err) {
        data.toString().split("\n").forEach(function(line, index){
          if(f = line.match(regex)) {
            console.log(file, index+1, f.input);
          }

        });
      }

    });

  };
  files.forEach(readAndMatch);
};

options = processOptions(process.argv);

console.log(u.inspect(options, false, 4, true));


var results = grepFiles(options.files, options.regex);
