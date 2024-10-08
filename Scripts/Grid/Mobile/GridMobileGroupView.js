(function(){Type.registerNamespace("Telerik.Web.UI");
var b=Telerik.Web.UI,a=$telerik.$,c=b.Grid;
Telerik.Web.UI.GridMobileGroupView=function(d){b.GridMobileGroupView.initializeBase(this,[d]);
this._groupFieldNames=[];
this._dropValue=null;
this._$groupExpressions=null;
};
b.GridMobileGroupView.prototype={initialize:function(){b.GridMobileGroupView.callBaseMethod(this,"initialize");
this._initDragDrop();
this._$groupExpressions=this.get_$element().find(".rgColumnItem");
},dispose:function(){b.GridMobileGroupView.callBaseMethod(this,"dispose");
},_initializeEvents:function(){this._$element.find(".rgUngroup").offEvent(b.EventNamesMap.up).onEvent(b.EventNamesMap.up,a.proxy(this._handleCloseUp,this)).on("click",$telerik.preventDefault);
this._$element.find("[class *= 'rgSort']").offEvent(b.EventNamesMap.up).onEvent(b.EventNamesMap.up,a.proxy(this._handleSortUp,this)).on("click",$telerik.preventDefault);
a(document).onEvent(b.EventNamesMap.down,a.proxy(this._closeGroupView,this));
},_closeGroupView:function(d){if(a(d.target).closest(".rgGroupPanelCell").length==0&&this._$element.prev().hasClass("rgGroupPanelExpand")){this.hide();
}},_handleSortUp:function(g){var f=a(g.target);
var d=f.parent(".rgColumnItem");
this._$groupExpressions=this.get_$element().find(".rgColumnItem");
var i={};
if(f.hasClass("rgSortAsc")){f.removeClass("rgSortAsc").addClass("rgSortDesc");
}else{f.removeClass("rgSortDesc").addClass("rgSortAsc");
}a(this._dragData).each(function(j,k){var e=k.$element;
i[e.data("groupFieldName")]=e[0];
});
for(var h in i){if(i[h]==d[0]){this.get_owner().fireCommand("SortGroup",h);
break;
}}},_handleCloseUp:function(g){var f=a(g.target);
var d=f.parents(".rgColumnItem");
this._$groupExpressions=this.get_$element().find(".rgColumnItem");
var j=this._$groupExpressions.index(d);
var i={};
a(this._dragData).each(function(k,l){var e=l.$element;
i[e.data("groupFieldName")]=e[0];
});
d.remove();
for(var h in i){if(i[h]==d[0]){this.get_owner().fireCommand("UnGroupByColumn",h);
break;
}}this._groupFieldNames.splice(j,1);
this._initPositions();
},toggle:function(){this._$element.toggle();
var d=this._$element.prev()[0];
if(d.className.indexOf("Expand")>-1){d.className=d.className.replace(/Expand/g,"Collapse");
}else{d.className=d.className.replace(/Collapse/g,"Expand");
}this._initPositions();
},hide:function(){this._$element.hide();
var d=this._$element.prev()[0];
if(d.className.indexOf("Expand")>-1){d.className=d.className.replace(/Expand/g,"Collapse");
}},get__groupFieldNames:function(){return this._groupFieldNames;
},_initDragDrop:function(){this._draggable=new c.Draggable({container:this.get_element(),thisArg:this,canDrag:function(d){if(a(d.target).hasClass("rgDrag")){return true;
}},createDraggable:function(g){var f=a(g.target).parent();
var d=f.clone();
f.css("visibility","hidden");
return a("<div>").data("owner",f).addClass(a(this.get_owner().get_owner().get_element()).attr("class")).addClass("RadGrid_Drag").append(d);
},createDropClue:function(){return a("<div>").addClass(a(this.get_owner().get_owner().get_element()).attr("class")).addClass("RadGrid_Drag").append(a("<span>").addClass("rgDragClue"));
},dragging:function(h,g){var d=g.$dropClue;
var i=this._findClosest($telerik.getEventLocation(h).pageY);
var f=g.$dragElement.data("owner");
if(f.is(i.$element)||(f.next().is(i.$element)&&!i.isBottom)){d.hide();
this._dropValue=null;
}else{d.show().offset({top:i.position,left:this.get_$element().find(".rgColumnItem").offset().left});
this._dropValue=i;
}},stopDragging:function(j,h){var f=h.$dragElement.data("owner").css("visibility","visible");
var d;
var i=this._dropValue;
if(i){d=i.$element;
if(i.isBottom){d.after(f);
}else{d.before(f);
}this._groupFieldNames=Telerik.Web.UI.Grid.reorderArray(this._groupFieldNames,parseInt(f.data("index"),10),parseInt(d.data("index"),10));
var g="0:"+f.data("index")+",0:"+d.data("index");
this.get_owner().fireCommand("ReorderGroupByExpression",g);
}this._initPositions();
}});
},_initPositions:function(){var f=this._dragData=[];
var d=this.get_$element().find(".rgColumnItem");
var e=d.last();
var g=this._groupFieldNames;
if(d.length>0){d.each(function(i){var h=a(this);
var j=h.offset().top;
f.push({position:j,$element:h.data("groupFieldName",g[i]).data("index",i)});
});
f.pop();
f.push({position:e.offset().top,offset:e.height(),$element:e.data("groupFieldName",g[g.length-1]).data("index",d.length-1),isBottom:true});
}},_createGroupItem:function(e){var h=this._$element.find(".rgMobileForm")[0];
var f=this.get_owner().get_owner();
var g=document.createElement("label");
g.className="rgLabel rgColumnItem";
if(f.ClientSettings.AllowDragToGroup){var d=document.createElement("span");
d.className="rgDrag";
g.appendChild(d);
}var j=document.createElement("span");
j.className="rgSortAsc";
j.innerHTML=e;
g.appendChild(j);
if(f._showUnGroupButton){var k=document.createElement("button");
k.setAttribute("type","submit");
k.className="rgActionButton rgUngroup";
k.title="Ungroup";
var i=document.createElement("span");
i.className="rgIcon rgUngroupIcon";
k.appendChild(i);
g.appendChild(k);
}h.appendChild(g);
},_findClosest:function(f){var d=Number.MAX_VALUE;
var e;
var g;
this._dragData.forEach(function(h){e=Math.abs(h.position-f);
if(d>e){d=e;
g=h;
}},this);
return g;
}};
b.GridMobileGroupView.registerClass("Telerik.Web.UI.GridMobileGroupView",Telerik.Web.UI.GridMobileView);
})();
