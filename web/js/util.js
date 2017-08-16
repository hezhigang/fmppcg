/**
 * 将String类型解析为Date类型
 * @param str
 * @returns
 */
function parseDate(str){
  if(typeof str == 'string'){
    var results = str.match(/^ *(\d{4})-(\d{1,2})-(\d{1,2}) *$/);
    if(results && results.length>3)
      return new Date(parseInt(results[1],10),parseInt(results[2],10)-1,parseInt(results[3],10));
    results = str.match(/^ *(\d{4})-(\d{1,2})-(\d{1,2}) +(\d{1,2}):(\d{1,2}):(\d{1,2}) *$/);
    if(results && results.length>6)
      return new Date(parseInt(results[1],10),parseInt(results[2],10)-1,parseInt(results[3],10),parseInt(results[4],10),parseInt(results[5],10),parseInt(results[6],10));   
    results = str.match(/^ *(\d{4})-(\d{1,2})-(\d{1,2}) +(\d{1,2}):(\d{1,2}):(\d{1,2})\.(\d{1,9}) *$/);
    if(results && results.length>7)
      return new Date(parseInt(results[1],10),parseInt(results[2],10)-1,parseInt(results[3],10),parseInt(results[4],10),parseInt(results[5],10),parseInt(results[6],10),parseInt(results[7],10));   
  }
  return null;
}

/**
 * 格式化日期
 * @param pattern
 * @returns
 */
Date.prototype.format = function(pattern)
{
  var o = { 
    "M+": this.getMonth()+1, //month
    "d+": this.getDate(),    //day
    "h+": this.getHours(),   //hour
    "m+": this.getMinutes(), //minute
    "s+": this.getSeconds(), //second
    "q+": Math.floor((this.getMonth()+3)/3),  //quarter
    "S": this.getMilliseconds() //millisecond
  };
  if(/(y+)/.test(pattern))
	  pattern=pattern.replace(RegExp.$1,(this.getFullYear()+"").substr(4-RegExp.$1.length)); 
  for(var k in o)if(new RegExp("("+ k +")").test(pattern)) 
	  pattern = pattern.replace(RegExp.$1, RegExp.$1.length==1 ? o[k] : ("00"+o[k]).substr((""+o[k]).length)); 
  return pattern; 
};

/**
 * 去字符串首尾空格
 * @returns
 */
String.prototype.trim = function()
{
 return this.replace(/(^\s*)|(\s*$)/g, "");
};

/**
 * 数组是否含有相应元素
 */
Array.prototype.contain=function(x) {
   var b=false;
   for (var i=0;i<this.length;i++) {
     if (x==this[i]) {
    	 b=true;
    	 break;
     }
   }
   return b;	
};