(function(){Type.registerNamespace("Telerik.Web.UI");
var b=Telerik.Web.UI;
var a=$telerik.$;
var f=".";
var c="rgBack";
var d="rgCancel";
var e="rgDone";
Telerik.Web.UI.GridMobileView=function(g){b.GridMobileView.initializeBase(this,[g]);
this._type=null;
this._owner=null;
this._isViewInitialized=false;
this._changed=false;
this._classNames=null;
this._$element=a(g);
};
b.GridMobileView.prototype={initialize:function(){b.GridMobileView.callBaseMethod(this,"initialize");
this._initializeEvents();
},dispose:function(){b.GridMobileView.callBaseMethod(this,"dispose");
},get_$element:function(){return this._$element;
},get_owner:function(){if(!this._owner){var g=this.get_id().split("_");
g=g.slice(0,g.length-1);
this._owner=$find(g.join("_"));
}return this._owner;
},get_$owner:function(){return this._$element.closest(".RadGrid");
},get_type:function(){return this._type;
},set_title:function(g){this._$element.find(".rgCommandRow").find("strong").text(g);
},onInit:function(){},onApplyChanges:function(){},onCancelChanges:function(){},onChange:function(){},onShown:function(){},show:function(g){if(this._changed){this._$element.find(f+c).show().end().find(f+d).hide().end().find(f+e).hide().end();
}this._changed=false;
this._$element.show();
this.onShown(a(g));
if(!this._isViewInitialized){this.onInit();
this._isViewInitialized=true;
}},close:function(){this._$element.hide();
this.onCancelChanges();
},applyChanges:function(){this._$element.hide();
this.onApplyChanges();
},changed:function(){if(!this._changed){this._$element.find(f+c).hide().end().find(f+d).show().end().find(f+e).show().end();
this._changed=true;
}},_initializeEvents:function(){this._$element.onEvent("up",a.proxy(this._handleUp,this)).on("click",this._handleClick);
},_handleUp:function(i){var h=a(i.target);
var g=h.closest(".rgLabel");
if(!h.hasClass("rgActionButton")){h=h.parent();
}if(h.hasClass(c)||h.hasClass(d)){this.close();
i.preventDefault();
}else{if(h.hasClass(e)){this.applyChanges();
i.preventDefault();
}else{this._fireLabelAction(g);
}}},_handleClick:function(h){var g=a(h.target);
if(!g.hasClass("rgActionButton")){g=g.parent();
}if(g.hasClass(c)||g.hasClass(d)||g.hasClass(e)){h.preventDefault();
}},_fireLabelAction:function(g){var h=g.find("input").attr("type");
if(h&&!g.prop("checked")){this.onChange(b.Grid.MobileViewActionType[h[0].toUpperCase()+h.substring(1)],g.text());
this.changed();
}}};
a.registerEnum(b.Grid,"MobileViewActionType",{Button:0,Checkbox:1,Radio:2});
a.registerEnum(b.Grid,"MobileViewType",{Filter:0,Column:1,Columns:2,Export:3,Edit:4,Group:5});
b.GridMobileView.registerClass("Telerik.Web.UI.GridMobileView",Sys.UI.Control);
})();
