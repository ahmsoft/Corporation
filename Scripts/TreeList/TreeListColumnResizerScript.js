Type.registerNamespace("Telerik.Web.UI");
Telerik.Web.UI.TreeListColumnResizer=function(b){Telerik.Web.UI.TreeListColumnResizer.initializeBase(this);
this._column=b;
this._columnElement=this._column.get_element();
this._ownerElement=this._column._owner.get_element();
this._isRealTimeResize=this._column._owner._clientSettings._resizing._enableRealTimeResize;
this._currentWidth=null;
this._leftResizer=document.createElement("span");
this._leftResizer.className="rtlResizer";
this._rightResizer=document.createElement("span");
this._rightResizer.className="rtlResizer";
this._resizerToolTip=document.createElement("span");
this._resizerToolTip.style.display=(this._column._owner._clientSettings._clientMessages._columnResizeTooltipFormatString=="")?"none":"";
this._resizerToolTipFormatString=this._column._owner._clientSettings._clientMessages._columnResizeTooltipFormatString;
if(this._column._owner.Skin!=""){this._resizerToolTip.className=String.format("TreeListToolTip TreeListToolTip_{0}",this._column._owner.Skin);
}if(!this._column._owner._embeddedSkin||this._column._owner.Skin==""){this._resizerToolTip.style.position="absolute";
this._resizerToolTip.style.zIndex=10000;
this._resizerToolTip.style.backgroundColor="#F5F5DC";
this._resizerToolTip.style.border="1px solid";
this._resizerToolTip.style.font="icon";
this._resizerToolTip.style.padding="2px";
}var a=this._columnElement.offsetWidth;
this._resizerToolTip.innerHTML=this._applyTooltipText(this._column._correctWidthForFirstColumn(a));
document.body.appendChild(this._leftResizer);
document.body.appendChild(this._rightResizer);
document.body.appendChild(this._resizerToolTip);
this._resizerToolTip.style.width=this._resizerToolTip.clientWidth+(parseInt(a,10).toString().length>=3?0:10)+"px";
this._canDestroy=true;
this._onMouseUpDelegate=$telerik.addMobileHandler(this,document,"mouseup",this._onMouseUpHandler,null,true);
this._onMouseMoveDelegate=$telerik.addMobileHandler(this,document,"mousemove",this._onMouseMoveHandler,null,true);
};
Telerik.Web.UI.TreeListColumnResizer.prototype={dispose:function(){this._cleanUp();
},_position:function(b){var f=$get(this._ownerElement.id+"_rtlData");
var g=f?this._findPosY(f):0;
var a=this._findPosY(this._columnElement);
var h=g>a?g:a;
if(this._column._owner.__useStaticHeaders){h=a;
}this._leftResizer.style.top=h+"px";
this._leftResizer.style.left=this._findPosX(this._columnElement)+"px";
this._rightResizer.style.top=this._leftResizer.style.top;
this._rightResizer.style.left=parseInt(this._leftResizer.style.left,10)+this._columnElement.offsetWidth+"px";
this._correctLeftResizerPosition();
var d=parseInt(this._rightResizer.style.top,10)-this._resizerToolTip.offsetHeight-2;
if(d<0){d+=(this._resizerToolTip.offsetHeight+this._columnElement.offsetHeight+2);
}this._resizerToolTip.style.top=d+"px";
var c=parseInt(this._rightResizer.style.left,10)-5;
this._resizerToolTip.style.left=c+"px";
if(parseInt(this._leftResizer.style.left,10)<this._findPosX(this._ownerElement)){this._leftResizer.style.display="none";
}this._calculateResizersHeight();
},_calculateResizersHeight:function(){var c=null;
var b=null;
var a=!!(this._column._owner._clientSettings._scrolling&&this._column._owner._clientSettings._scrolling._allowScroll);
var d=this._column._owner.__useStaticHeaders&&a;
if(a||d){c=$get(this._ownerElement.id+"_rtlData");
if(this._column._owner.__useStaticHeaders){b=$get(this._ownerElement.id+"_rtlHeader");
}else{b={offsetHeight:0};
}this._leftResizer.style.height=c.clientHeight+b.offsetHeight+"px";
}else{c=this._ownerElement.getElementsByTagName("table")[0];
b=c.tHead;
c=c.tBodies[0];
this._leftResizer.style.height=c.offsetHeight+b.offsetHeight+"px";
}this._rightResizer.style.height=this._leftResizer.style.height;
},_onMouseUpHandler:function(a){this._cleanUp();
},_onMouseMoveHandler:function(a){if($telerik.isTouchDevice){a.preventDefault();
}this._move(a);
},_cleanUp:function(){if(this._canDestroy){if(this._onMouseUpDelegate){$telerik.removeMobileHandler(document,"mouseup",this._onMouseUpDelegate,null,true);
this._onMouseUpDelegate=null;
}if(this._onMouseMoveDelegate){$telerik.removeMobileHandler(document,"mousemove",this._onMouseMoveDelegate,null,true);
this._onMouseMoveDelegate=null;
}if(this._currentWidth!=null&&this._currentWidth>0){this._column._owner.notifyClientStateModified();
this._column.resize(this._currentWidth);
this._currentWidth=null;
}document.body.removeChild(this._leftResizer);
document.body.removeChild(this._rightResizer);
document.body.removeChild(this._resizerToolTip);
this._leftResizer=null;
this._rightResizer=null;
this._resizerToolTip=null;
this._column._isResizeInProgress=false;
this._canDestroy=false;
}},_move:function(b){this._leftResizer.style.left=this._findPosX(this._columnElement)+"px";
var l=this._rightResizer.style.left;
var c=this._getEventPosX(b);
var m=c-this._findPosX(this._ownerElement);
this._rightResizer.style.left=c+"px";
this._correctLeftResizerPosition();
var q=parseInt(this._rightResizer.style.left,10)-parseInt(this._leftResizer.style.left,10);
var f=parseInt(this._column.get_minWidth(),10);
var d=parseInt(this._column.get_maxWidth(),10);
var g=(f&&q<f)||d&&(q>d);
if(q<=0||g||(this._column.isIE67&&q<=this._column._correctWidthForIE())||(m>=this._ownerElement.offsetWidth&&this._column._owner._clientSettings._resizing._resizeMode!=Telerik.Web.UI.TreeListResizeMode.AllowScroll)){this._rightResizer.style.left=l;
return;
}var k=this._column._owner._buildEventArgs(new Sys.CancelEventArgs(),{column:this._column,width:q});
this._column._owner.raise_columnResizing(k);
this._column._columnResizingFired=true;
if(k.get_cancel()){return;
}var j=parseInt(this._rightResizer.style.left,10)-5;
this._resizerToolTip.style.left=j+"px";
var i=this._resizerToolTip.offsetHeight;
this._resizerToolTip.innerHTML=this._applyTooltipText(q);
if(this._resizerToolTip.offsetHeight>i){this._resizerToolTip.style.width=parseInt(this._resizerToolTip.style.width,10)+10+"px";
}if(this._column.get_element().className.indexOf("rtlCF")==-1){q=q-this._column._correctWidthForIE();
}this._currentWidth=q;
if(!this._isRealTimeResize){return;
}this._column.resize(this._currentWidth);
this._leftResizer.style.left=this._findPosX(this._columnElement)+"px";
this._correctLeftResizerPosition();
this._rightResizer.style.left=this._findPosX(this._columnElement)+this._columnElement.offsetWidth+"px";
this._resizerToolTip.style.left=parseInt(this._rightResizer.style.left,10)-5+"px";
var h=this._findPosY(this._columnElement);
if(this._findPosY(this._leftResizer)!=h){var n=$get(this._ownerElement.id+"_rtlData");
var o=n?this._findPosY(n):0;
var a=h;
var p=o>a?o:a;
if(this._column._owner.__useStaticHeaders){p=a;
}this._leftResizer.style.top=p+"px";
this._rightResizer.style.top=this._leftResizer.style.top;
}this._calculateResizersHeight();
},_getEventPosX:function(a){if($telerik.isTouchDevice){return $telerik.getTouchEventLocation(a).x;
}else{var b=parseInt(a.clientX,10)+parseInt($telerik.getScrollOffset(document.body,true).x,10);
return b;
}},_getEventPosY:function(a){if($telerik.isTouchDevice){return $telerik.getTouchEventLocation(a).y;
}else{var b=parseInt(a.clientY,10)+parseInt($telerik.getScrollOffset(document.body,true).y,10);
return b;
}},_findPosX:function(a){return this._getLocation(a).x;
},_findPosY:function(a){return this._getLocation(a).y;
},_getLocation:function(a){if($telerik.isOpera){return $telerik.originalGetLocation(a);
}return $telerik.getLocation(a);
},_applyTooltipText:function(b){var a=/\{0[^\}]*\}/g;
return this._resizerToolTipFormatString.replace(a,b);
},_correctLeftResizerPosition:function(){if(this._column.get_element().className.indexOf("rtlCF")>-1){this._leftResizer.style.left=this._findPosX(this._columnElement)+(this._columnElement.colSpan-1)*this._column._getFirstColWidth()+"px";
}}};
Telerik.Web.UI.TreeListColumnResizer.registerClass("Telerik.Web.UI.TreeListColumnResizer",null,Sys.IDisposable);
Telerik.Web.UI.TreeListResizeMode=function(){};
Telerik.Web.UI.TreeListResizeMode.prototype={NoScroll:0,AllowScroll:1,ResizeTreeList:2};
Telerik.Web.UI.TreeListResizeMode.registerEnum("Telerik.Web.UI.TreeListResizeMode",false);
