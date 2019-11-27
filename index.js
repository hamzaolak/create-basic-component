#! /usr/bin/env node
const { exec } = require('child_process');

let componentName = ''
if(process.argv[2]){
  componentName = process.argv[2]
}else{
  componentName = 'Component'
}

exec(`./index.sh${componentName}`, (error, stdout, stderr) => {
  if (error) {
    console.error(`exec error: ${error}`);
    return;
  }
  console.log(`stdout: ${stdout}`);
  console.error(`stderr: ${stderr}`);
});