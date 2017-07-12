#!/usr/bin/env node
var program = require('commander');
var shell = require('shelljs');
var { spawn } = require('child_process');
var co = require('co');
var opn = require('opn');
var prependFile = require('prepend-file');

var prompt = require('co-prompt');

var mainBlogFolder = 'C:\\Users\\mfranc\\DropBox\\blog\\michal-franc.github.io\\';

var spawnChrome = (site) => {
  opn(site);
};

var openVim = (file) => {
  var editor = process.env.EDITOR || 'vim'; 

  var child = spawn(editor, [file, '-c Goyo'], {
    stdio: 'inherit' 
  });

  child.on('exit', function (e, code) {
      console.log("finished");
  });
};

program
.arguments('<command> [filename]')
.version('0.0.1')
.on("--help", () =>{
  console.log('site - opens main blog site');
  console.log('local - opens local blog, if not runinng do jekyll run on bash subsystem');
  console.log('social - opens various social sites');
  console.log('idea - opens main idea file');
  console.log('ideas - opens folder with ideas');
  console.log('draft - opens new draft file');
  console.log('drafts - opens folder with drafts');
  console.log('template - adds jekyll template');
  console.log('publish - moves post to proper folder and adds datetime');
})
.action((command, filename) => {
  co(function *() {
    if(command === 'site') {
      spawnChrome('http://mfranc.com/');
    }
    
    if(command === 'local') {
      // assuming here that blog is running on local all the time, need to somehow run ruby jekyll all the time
      spawnChrome('http://mfranc.com.local/');
    }

    if(command === 'social') {
      spawnChrome('https://tweetdeck.twitter.com/');
      spawnChrome('https://facebook.com/');
      spawnChrome('https://reddit.com/');
      spawnChrome('https://devspl.slack.com/');
    }

    if(command === 'idea') {
     openVim(mainBlogFolder + '_posts\\_draft\\ideas\\' + 'new_idea.md');
    }

    if(command === 'draft') {
     openVim(mainBlogFolder + '_posts\\_draft\\' + 'new_draft.md');
    }

    if(command === 'template') {
      var title = yield prompt('title:');
      var summary = yield prompt('summary:');
      var slug = yield prompt('slug:');
      var category = yield prompt('category:');
      var tags = yield prompt('tags (comma):');
      var image = yield prompt('image.jpg (images folder):');

      var template = 
          `---
layout: post
title: ${title}
summary: ${summary}
date: %date%
author: Michal Franc
comments: true
categories: [${category}]
tags: [${tags}]
image: ${image}
---`;

      if(filename){
        prependFile(filename, template, function(error) {
          if (error) {
              console.error(error.message);
          }

          console.log('file template added');
          shell.mv(filename, mainBlogFolder + '_posts\\_draft\\' + slug + '.md');
          console.log('file move');
          process.exit();
        });
      } 
    }

    if(command === 'publish') {
      var category = yield prompt('category:');
      var date = yield prompt('date (yyyy-mm-dd hh:mm):');

      shell.sed('-i', '%date%', date, filename);
      shell.mv(filename, mainBlogFolder + '_posts\\' + category + '\\' + date.substring(0, 10) + '-' + filename);
      process.exit();
    }

    if(command === 'drafts') {
     openVim(mainBlogFolder + '_posts\\_draft\\');
    }

    if(command === 'ideas') {
     openVim(mainBlogFolder + '_posts\\_draft\\ideas\\');
    }
  })
})
.parse(process.argv);
