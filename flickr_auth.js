var exec = require("child_process").exec;

function auth(res) {
  exec('ruby ./flickr_auth.rb', function (err, stdout, stderr) {
    console.log(stdout);
    res.redirect(stdout);
  });
}

exports.auth = auth;
