Type.registerNamespace("Telerik.Web.UI.Scheduler.Rendering");
(function(){var a=Telerik.Web.UI.Scheduler.Rendering;
a.BlockCollection=function(){this._blocks=[];
};
a.BlockCollection.prototype={add:function(e){var b;
if(this._blocks.length==0){b=this._createBlock();
}else{var d=[];
for(var c=0;
c<this._blocks.length;
c++){if(this._blocks[c].overlapsWith(e)){Array.add(d,this._blocks[c]);
}}if(d.length==0){b=this._createBlock();
}else{if(d.length==1){b=d[0];
}else{b=this._mergeBlocks(d);
}}}b.add(e);
},remove:function(e){var b=[];
var c,d;
for(c=0,d=this._blocks.length;
c<d;
c++){this._blocks[c].remove(e);
if(this._blocks[c]._parts.length==0){Array.add(b,this._blocks[c]);
}}for(c=0,d=b.length;
c<d;
c++){Array.remove(this._blocks,b[c]);
}},forEach:function(d){for(var c=0,b=this._blocks.length;
c<b;
c++){this._blocks[c].forEach(d);
}},_createBlock:function(){var b=new a.Block();
var c=this._blocks.length;
Array.insert(this._blocks,c,b);
return b;
},_mergeBlocks:function(c){var e=c[0];
for(var b=0;
b<c.length;
b++){var d=c[b];
if(d==e){continue;
}for(var f=0;
f<d._parts.length;
f++){e.add(d._parts[f]);
}Array.remove(this._blocks,d);
}return e;
}};
a.BlockCollection.registerClass("Telerik.Web.UI.Scheduler.Rendering.BlockCollection");
})();
