var u = require('util'),
    fs = require('fs'),
    ev = require('events');
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
      if( err) return ;
      data.toString().split("\n").forEach(function(line, index){
        if(f = line.match(regex)) {
          acceptor.emit('found', file, index+1, f.input);
        }

      });

    });

  };
  files.forEach(readAndMatch);
};

options = processOptions(process.argv);

console.log(u.inspect(options, false, 4, true));

var watcher = new ev.EventEmitter();

watcher.on('found',function(file, line_no, line_str){

  console.log(file,line_no, line_str);

});
grepFiles(options.files, options.regex, watcher);
