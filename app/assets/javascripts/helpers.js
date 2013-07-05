/*!
Helper functions for the ARIA Calendar Module
All statements beginning with "$A" refer to AccDC API methods.
Bryan Garaventa, WhatSock
*/

var getEl = function(e){
if (document.getElementById) return document.getElementById(e);
else if (document.all) return document.all[e];
else return null;
},

createAttr = function(a){
return document.createAttribute(a);
},

css = function(obj, p, v){
if (!obj) return null;
var o = isArray(obj) ? obj : [obj],
check = 'top left bottom right width height';
for (var i = 0; i < o.length; i++){
if (typeof p === 'string'){
try {
o[i].style[xCamelize(p)] = check.indexOf(p) !== -1 && typeof v === 'number' ? v + 'px' : v;
} catch (ex) {
/*@cc_on
@if (@_jscript_version <= 5.7) // IE7 and down
if (p != 'display') continue;
var s = '',
t = o[i].nodeName.toLowerCase();
switch(t){
case 'table' :
case 'tr' :
case 'td' :
case 'li' :
s = 'block';
break;
case 'caption' :
s = 'inline';
break;
}
o[i].style[p] = s;
@end @*/
}
} else if (typeof p === 'object'){
for (var a = 1; a < arguments.length; a++){
for (var n in arguments[a]){
try {
o[i].style[xCamelize(n)] = check.indexOf(n) !== -1 && typeof arguments[a][n] === 'number' ? arguments[a][n] + 'px' : arguments[a][n];
} catch (ex) {
/*@cc_on
@if (@_jscript_version <= 5.7) // IE7 and down
if (n != 'display') continue;
var s = '',
t = o[i].nodeName.toLowerCase();
switch(t){
case 'table' :
case 'tr' :
case 'td' :
case 'li' :
s = 'block';
break;
case 'caption' :
s = 'inline';
break;
}
o[i].style[n] = s;
@end @*/
}
}
}
}
}
return obj;
},

trim = function(str){
return str.replace(/^\s+|\s+$/g, '');
},

setAttr = function(obj, name, value){
if (!obj) return null;
if (typeof name === 'string'){
var a = createAttr(name);
a.nodeValue = value;
obj.setAttributeNode(a);
} else if (typeof name === 'object'){
for (n in name){
var a = createAttr(n);
a.nodeValue = name[n];
obj.setAttributeNode(a);
}
}
return obj;
},

isArray = function(v){
return v && typeof v === 'object' && typeof v.length === 'number' && typeof v.splice === 'function' && !(v.propertyIsEnumerable('length'));
},

inArray = function(search, stack){
if (stack.indexOf) return stack.indexOf(search);
for (var i = 0; i < stack.length; i++){
if (stack[i] === search) return i;
}
return -1;
},

hasClass = function(obj, cn){
if (!obj || !obj.className) return false;
var names = cn.split(' '),
i = 0;
for (var n = 0; n < names.length; n++){
if (obj.className.indexOf(names[n]) !== -1) i += 1;
}
if (i === names.length) return true;
return false;
},

addClass = function(obj, cn){
if (!obj) return null;
var o = isArray(obj) ? obj : [obj],
names = cn.split(' ');
for (var i = 0; i < o.length; i++){
for (var n = 0; n < names.length; n++){
if (!hasClass(o[i], names[n])){
o[i].className = trim(o[i].className + ' ' + names[n]);
}
}
}
return obj;
},

remClass = function(obj, cn){
if (!obj) return null;
var o = isArray(obj) ? obj : [obj],
names = cn.split(' ');
for (var i = 0; i < o.length; i++){
for (var n = 0; n < names.length; n++){
var classes = o[i].className.split(' ');
var a = inArray(names[n], classes);
if (a !== -1){
classes.splice(a, 1);
if (classes.length) o[i].className = trim(classes.join(' '));
else o[i].className = '';
}
}
}
return obj;
},

// X Lib functions

xCamelize = function(cssPropStr){
var i, c, a, s;
a = cssPropStr.split('-');
s = a[0];
for (i=1; i<a.length; i++) {
c = a[i].charAt(0);
s += a[i].replace(c, c.toUpperCase());
}
return s;
};
