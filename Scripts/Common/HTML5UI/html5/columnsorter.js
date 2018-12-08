(function(b,a){a(["./kendo.core"],b);
})(function(){(function(){(function(a,n){var h=window.kendo;
var m=h.ui;
var o=m.Widget;
var f="dir";
var c="asc";
var j="single";
var g="field";
var e="desc";
var k=".kendoColumnSorter";
var l=".k-link";
var b="aria-sort";
var i=a.proxy;
var d=o.extend({init:function(p,r){var s=this,q;
o.fn.init.call(s,p,r);
s._refreshHandler=i(s.refresh,s);
s.dataSource=s.options.dataSource.bind("change",s._refreshHandler);
q=s.element.find(l);
if(!q[0]){q=s.element.wrapInner('<a class="k-link" href="#"/>').find(l);
}s.link=q;
s.element.on("click"+k,i(s._click,s));
},options:{name:"ColumnSorter",mode:j,allowUnsort:true,compare:null,filter:""},destroy:function(){var p=this;
o.fn.destroy.call(p);
p.element.off(k);
p.dataSource.unbind("change",p._refreshHandler);
p._refreshHandler=p.element=p.link=p.dataSource=null;
},refresh:function(){var w=this,v=w.dataSource.sort()||[],t,u,p,q,r=w.element,s=r.attr(h.attr(g));
r.removeAttr(h.attr(f));
r.removeAttr(b);
for(t=0,u=v.length;
t<u;
t++){p=v[t];
if(s==p.field){r.attr(h.attr(f),p.dir);
}}q=r.attr(h.attr(f));
r.find(".k-i-arrow-n,.k-i-arrow-s").remove();
if(q===c){a('<span class="k-icon k-i-arrow-n" />').appendTo(w.link);
r.attr(b,"ascending");
}else{if(q===e){a('<span class="k-icon k-i-arrow-s" />').appendTo(w.link);
r.attr(b,"descending");
}}},_click:function(r){var y=this,s=y.element,t=s.attr(h.attr(g)),q=s.attr(h.attr(f)),w=y.options,p=y.options.compare===null?n:y.options.compare,x=y.dataSource.sort()||[],u,v;
r.preventDefault();
if(w.filter&&!s.is(w.filter)){return;
}if(q===c){q=e;
}else{if(q===e&&w.allowUnsort){q=n;
}else{q=c;
}}if(w.mode===j){x=[{field:t,dir:q,compare:p}];
}else{if(w.mode==="multiple"){for(u=0,v=x.length;
u<v;
u++){if(x[u].field===t){x.splice(u,1);
break;
}}x.push({field:t,dir:q,compare:p});
}}this.dataSource.sort(x);
}});
m.plugin(d);
})(window.kendo.jQuery);
})();
return window.kendo;
},typeof define=="function"&&define.amd?define:function(a,b){b();
});