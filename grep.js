var u = require('util');
var processOptions = function(argv) {

  var opts = {};
  argv.forEach(function(value, index, arr){
    if(index == 2) opts.regex = new RegExp(value);
    opts.files = arr.filter(function(el,index){ if(index >= 3) return el; });
  });

  return opts;

};
var grepFiles = function(files, regex) {
  // do sth with file
};

options = processOptions(process.argv);

console.log(u.inspect(options, false, 4, true));


var results = grepFiles(options.files, options.regex);
