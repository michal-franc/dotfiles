#!/usr/bin/env node
var program = require('commander');
var shell = require('shelljs');
var { spawn } = require('child_process');
var co = require('co');
var opn = require('opn');

var prompt = require('co-prompt');

var spawnChrome = (site) => {
  opn(site);
};

var openVim = (file) => {
  var editor = process.env.EDITOR || 'vim'; 

  var child = spawn(editor, [file, '-c Goyo'], {
    stdio: 'inherit' 
  });
};

program
.arguments('<command> [arg1]')
  .action((command, arg1) => {
    co(function *() {
      if(command === 'site') {
        spawnChrome('http://mfranc.com/');
      }

      if(command === 'social') {
        spawnChrome('https://tweetdeck.twitter.com/');
        spawnChrome('https://facebook.com/');
        spawnChrome('https://reddit.com/');
        spawnChrome('https://devspl.slack.com/');
      }

      if(command === 'vim') {
        openVim('');
      }
    })
  })
.parse(process.argv);
