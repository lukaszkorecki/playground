var u = require('util'),
    fs = require('fs'),
    ev = require('events');

function processOptions(argv) {
  var opts = {};
  argv.forEach(function(value, index, arr){
    if(index == 2) opts.regex = new RegExp(value);
    opts.files = arr.slice(3);
  });

  return opts;

}

function grepFiles(files, regex, acceptor) {
  function readAndMatch(file) {
    fs.readFile(file, function(err, data){ search(file,err,data); });
  }

  function search(file,err,data){
    if( err) {
      acceptor.emit('err', file);
    } else {
      data.toString().split("\n").forEach(function(line, index){
        if(line.match(regex)) acceptor.emit('found', file, index+1, line);
      });
    }
  }

  files.forEach(readAndMatch);
}

var options = processOptions(process.argv),
    watcher = new ev.EventEmitter();

watcher.on('found',function(file, line_no, line_str){
  console.log(file,line_no, line_str);
});

watcher.on('err', function(file){
   console.log('Could not grep ' + file);
});

grepFiles(options.files, options.regex, watcher);
