#!/usr/bin/env node
const express=require('express');
const app=express();
app.use(express.static('..'));
app.listen(12345);
console.log('http://127.0.0.1:12345');
