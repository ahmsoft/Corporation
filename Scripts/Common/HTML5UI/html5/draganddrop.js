(function(b,a){a(["./kendo.core","./kendo.userevents"],b);
})(function(){(function(){(function(a,U){var E=window.kendo,Q=E.support,j=window.document,b=a(window),f=E.Class,W=E.ui.Widget,J=E.Observable,V=E.UserEvents,O=a.proxy,y=a.extend,A=E.getOffset,p={},w={},t={},G,x=E.elementUnderCursor,F="keyup",d="change",r="dragstart",C="hold",k="drag",m="dragend",l="dragcancel",B="hintDestroyed",n="dragenter",q="dragleave",s="drop";
function h(aa,Y){try{return a.contains(aa,Y)||aa==Y;
}catch(Z){return false;
}}function I(Y,Z){return parseInt(Y.css(Z),10)||0;
}function X(Z,Y){return Math.min(Math.max(Z,Y.min),Y.max);
}function g(Y,Z){var ae=A(Y),ac=ae.left+I(Y,"borderLeftWidth")+I(Y,"paddingLeft"),ad=ae.top+I(Y,"borderTopWidth")+I(Y,"paddingTop"),aa=ac+Y.width()-Z.outerWidth(true),ab=ad+Y.height()-Z.outerHeight(true);
return{x:{min:ac,max:aa},y:{min:ad,max:ab}};
}function e(ab,ad,Z){var af,ae,aa=0,ac=ad&&ad.length,Y=Z&&Z.length;
while(ab&&ab.parentNode){for(aa=0;
aa<ac;
aa++){af=ad[aa];
if(af.element[0]===ab){return{target:af,targetElement:ab};
}}for(aa=0;
aa<Y;
aa++){ae=Z[aa];
if(a.contains(ae.element[0],ab)&&Q.matchesSelector.call(ab,ae.options.filter)){return{target:ae,targetElement:ab};
}}ab=ab.parentNode;
}return U;
}var R=J.extend({init:function(Z,aa){var ab=this,Y=Z[0];
ab.capture=false;
if(Y.addEventListener){a.each(E.eventMap.down.split(" "),function(){Y.addEventListener(this,O(ab._press,ab),true);
});
a.each(E.eventMap.up.split(" "),function(){Y.addEventListener(this,O(ab._release,ab),true);
});
}else{a.each(E.eventMap.down.split(" "),function(){Y.attachEvent(this,O(ab._press,ab));
});
a.each(E.eventMap.up.split(" "),function(){Y.attachEvent(this,O(ab._release,ab));
});
}J.fn.init.call(ab);
ab.bind(["press","release"],aa||{});
},captureNext:function(){this.capture=true;
},cancelCapture:function(){this.capture=false;
},_press:function(Y){var Z=this;
Z.trigger("press");
if(Z.capture){Y.preventDefault();
}},_release:function(Y){var Z=this;
Z.trigger("release");
if(Z.capture){Y.preventDefault();
Z.cancelCapture();
}}});
var M=J.extend({init:function(Y){var Z=this;
J.fn.init.call(Z);
Z.forcedEnabled=false;
a.extend(Z,Y);
Z.scale=1;
if(Z.horizontal){Z.measure="offsetWidth";
Z.scrollSize="scrollWidth";
Z.axis="x";
}else{Z.measure="offsetHeight";
Z.scrollSize="scrollHeight";
Z.axis="y";
}},makeVirtual:function(){a.extend(this,{virtual:true,forcedEnabled:true,_virtualMin:0,_virtualMax:0});
},virtualSize:function(Z,Y){if(this._virtualMin!==Z||this._virtualMax!==Y){this._virtualMin=Z;
this._virtualMax=Y;
this.update();
}},outOfBounds:function(Y){return Y>this.max||Y<this.min;
},forceEnabled:function(){this.forcedEnabled=true;
},getSize:function(){return this.container[0][this.measure];
},getTotal:function(){return this.element[0][this.scrollSize];
},rescale:function(Y){this.scale=Y;
},update:function(Z){var ab=this,ac=ab.virtual?ab._virtualMax:ab.getTotal(),Y=ac*ab.scale,aa=ab.getSize();
if(ac===0&&!ab.forcedEnabled){return;
}ab.max=ab.virtual?-ab._virtualMin:0;
ab.size=aa;
ab.total=Y;
ab.min=Math.min(ab.max,aa-Y);
ab.minScale=aa/ac;
ab.centerOffset=(Y-aa)/2;
ab.enabled=ab.forcedEnabled||(Y>aa);
if(!Z){ab.trigger(d,ab);
}}});
var N=J.extend({init:function(Y){var Z=this;
J.fn.init.call(Z);
Z.x=new M(y({horizontal:true},Y));
Z.y=new M(y({horizontal:false},Y));
Z.container=Y.container;
Z.forcedMinScale=Y.minScale;
Z.maxScale=Y.maxScale||100;
Z.bind(d,Y);
},rescale:function(Y){this.x.rescale(Y);
this.y.rescale(Y);
this.refresh();
},centerCoordinates:function(){return{x:Math.min(0,-this.x.centerOffset),y:Math.min(0,-this.y.centerOffset)};
},refresh:function(){var Y=this;
Y.x.update();
Y.y.update();
Y.enabled=Y.x.enabled||Y.y.enabled;
Y.minScale=Y.forcedMinScale||Math.min(Y.x.minScale,Y.y.minScale);
Y.fitScale=Math.max(Y.x.minScale,Y.y.minScale);
Y.trigger(d);
}});
var L=J.extend({init:function(Y){var Z=this;
y(Z,Y);
J.fn.init.call(Z);
},outOfBounds:function(){return this.dimension.outOfBounds(this.movable[this.axis]);
},dragMove:function(Z){var ad=this,aa=ad.dimension,Y=ad.axis,ab=ad.movable,ac=ab[Y]+Z;
if(!aa.enabled){return;
}if((ac<aa.min&&Z<0)||(ac>aa.max&&Z>0)){Z*=ad.resistance;
}ab.translateAxis(Y,Z);
ad.trigger(d,ad);
}});
var K=f.extend({init:function(Z){var ab=this,ac,ad,aa,Y;
y(ab,{elastic:true},Z);
aa=ab.elastic?0.5:0;
Y=ab.movable;
ab.x=ac=new L({axis:"x",dimension:ab.dimensions.x,resistance:aa,movable:Y});
ab.y=ad=new L({axis:"y",dimension:ab.dimensions.y,resistance:aa,movable:Y});
ab.userEvents.bind(["move","end","gesturestart","gesturechange"],{gesturestart:function(ae){ab.gesture=ae;
ab.offset=ab.dimensions.container.offset();
},gesturechange:function(ag){var am=ab.gesture,al=am.center,ae=ag.center,an=ag.distance/am.distance,ai=ab.dimensions.minScale,ah=ab.dimensions.maxScale,af;
if(Y.scale<=ai&&an<1){an+=(1-an)*0.8;
}if(Y.scale*an>=ah){an=ah/Y.scale;
}var aj=Y.x+ab.offset.left,ak=Y.y+ab.offset.top;
af={x:(aj-al.x)*an+ae.x-aj,y:(ak-al.y)*an+ae.y-ak};
Y.scaleWith(an);
ac.dragMove(af.x);
ad.dragMove(af.y);
ab.dimensions.rescale(Y.scale);
ab.gesture=ag;
ag.preventDefault();
},move:function(ae){if(ae.event.target.tagName.match(/textarea|input/i)){return;
}if(ac.dimension.enabled||ad.dimension.enabled){ac.dragMove(ae.x.delta);
ad.dragMove(ae.y.delta);
ae.preventDefault();
}else{ae.touch.skip();
}},end:function(ae){ae.preventDefault();
}});
}});
var S=Q.transitions.prefix+"Transform",T;
if(Q.hasHW3D){T=function(Z,aa,Y){return"translate3d("+Z+"px,"+aa+"px,0) scale("+Y+")";
};
}else{T=function(Z,aa,Y){return"translate("+Z+"px,"+aa+"px) scale("+Y+")";
};
}var H=J.extend({init:function(Y){var Z=this;
J.fn.init.call(Z);
Z.element=a(Y);
Z.element[0].style.webkitTransformOrigin="left top";
Z.x=0;
Z.y=0;
Z.scale=1;
Z._saveCoordinates(T(Z.x,Z.y,Z.scale));
},translateAxis:function(Y,Z){this[Y]+=Z;
this.refresh();
},scaleTo:function(Y){this.scale=Y;
this.refresh();
},scaleWith:function(Y){this.scale*=Y;
this.refresh();
},translate:function(Y){this.x+=Y.x;
this.y+=Y.y;
this.refresh();
},moveAxis:function(Y,Z){this[Y]=Z;
this.refresh();
},moveTo:function(Y){y(this,Y);
this.refresh();
},refresh:function(){var Z=this,aa=Z.x,ab=Z.y,Y;
if(Z.round){aa=Math.round(aa);
ab=Math.round(ab);
}Y=T(aa,ab,Z.scale);
if(Y!=Z.coordinates){if(E.support.browser.msie&&E.support.browser.version<10){Z.element[0].style.position="absolute";
Z.element[0].style.left=Z.x+"px";
Z.element[0].style.top=Z.y+"px";
}else{Z.element[0].style[S]=Y;
}Z._saveCoordinates(Y);
Z.trigger(d);
}},_saveCoordinates:function(Y){this.coordinates=Y;
}});
function i(Y,ac){var aa=ac.options.group,Z=Y[aa],ab;
W.fn.destroy.call(ac);
if(Z.length>1){for(ab=0;
ab<Z.length;
ab++){if(Z[ab]==ac){Z.splice(ab,1);
break;
}}}else{Z.length=0;
delete Y[aa];
}}var u=W.extend({init:function(Y,aa){var ab=this;
W.fn.init.call(ab,Y,aa);
var Z=ab.options.group;
if(!(Z in w)){w[Z]=[ab];
}else{w[Z].push(ab);
}},events:[n,q,s],options:{name:"DropTarget",group:"default"},destroy:function(){i(w,this);
},_trigger:function(aa,Z){var ab=this,Y=p[ab.options.group];
if(Y){return ab.trigger(aa,y({},Z.event,{draggable:Y,dropTarget:Z.dropTarget}));
}},_over:function(Y){this._trigger(n,Y);
},_out:function(Y){this._trigger(q,Y);
},_drop:function(Z){var aa=this,Y=p[aa.options.group];
if(Y){Y.dropped=!aa._trigger(s,Z);
}}});
u.destroyGroup=function(Z){var Y=w[Z]||t[Z],aa;
if(Y){for(aa=0;
aa<Y.length;
aa++){W.fn.destroy.call(Y[aa]);
}Y.length=0;
delete w[Z];
delete t[Z];
}};
u._cache=w;
var v=u.extend({init:function(Y,aa){var ab=this;
W.fn.init.call(ab,Y,aa);
var Z=ab.options.group;
if(!(Z in t)){t[Z]=[ab];
}else{t[Z].push(ab);
}},destroy:function(){i(t,this);
},options:{name:"DropTargetArea",group:"default",filter:null}});
var o=W.extend({init:function(Y,Z){var aa=this;
W.fn.init.call(aa,Y,Z);
aa._activated=false;
aa.userEvents=new V(aa.element,{global:true,allowSelection:true,filter:aa.options.filter,threshold:aa.options.distance,start:O(aa._start,aa),hold:O(aa._hold,aa),move:O(aa._drag,aa),end:O(aa._end,aa),cancel:O(aa._cancel,aa),select:O(aa._select,aa)});
aa._afterEndHandler=O(aa._afterEnd,aa);
aa._captureEscape=O(aa._captureEscape,aa);
},events:[C,r,k,m,l,B],options:{name:"Draggable",distance:(E.support.touch?0:5),group:"default",cursorOffset:null,axis:null,container:null,filter:null,ignore:null,holdToDrag:false,autoScroll:false,dropped:false},cancelHold:function(){this._activated=false;
},_captureEscape:function(Y){var Z=this;
if(Y.keyCode===E.keys.ESC){Z._trigger(l,{event:Y});
Z.userEvents.cancel();
}},_updateHint:function(ac){var ae=this,aa,ad=ae.options,Z=ae.boundaries,Y=ad.axis,ab=ae.options.cursorOffset;
if(ab){aa={left:ac.x.location+ab.left,top:ac.y.location+ab.top};
}else{ae.hintOffset.left+=ac.x.delta;
ae.hintOffset.top+=ac.y.delta;
aa=a.extend({},ae.hintOffset);
}if(Z){aa.top=X(aa.top,Z.y);
aa.left=X(aa.left,Z.x);
}if(Y==="x"){delete aa.top;
}else{if(Y==="y"){delete aa.left;
}}ae.hint.css(aa);
},_shouldIgnoreTarget:function(Z){var Y=this.options.ignore;
return Y&&a(Z).is(Y);
},_select:function(Y){if(!this._shouldIgnoreTarget(Y.event.target)){Y.preventDefault();
}},_start:function(Z){var ad=this,ac=ad.options,Y=ac.container,aa=ac.hint;
if(this._shouldIgnoreTarget(Z.touch.initialTouch)||(ac.holdToDrag&&!ad._activated)){ad.userEvents.cancel();
return;
}ad.currentTarget=Z.target;
ad.currentTargetOffset=A(ad.currentTarget);
if(aa){if(ad.hint){ad.hint.stop(true,true).remove();
}ad.hint=E.isFunction(aa)?a(aa.call(ad,ad.currentTarget)):aa;
var ab=A(ad.currentTarget);
ad.hintOffset=ab;
ad.hint.css({position:"absolute",zIndex:20000,left:ab.left,top:ab.top}).appendTo(j.body);
ad.angular("compile",function(){ad.hint.removeAttr("ng-repeat");
var ae=a(Z.target);
while(!ae.data("$$kendoScope")&&ae.length){ae=ae.parent();
}return{elements:ad.hint.get(),scopeFrom:ae.data("$$kendoScope")};
});
}p[ac.group]=ad;
ad.dropped=false;
if(Y){ad.boundaries=g(Y,ad.hint);
}a(j).on(F,ad._captureEscape);
if(ad._trigger(r,Z)){ad.userEvents.cancel();
ad._afterEnd();
}ad.userEvents.capture();
},_hold:function(Y){this.currentTarget=Y.target;
if(this._trigger(C,Y)){this.userEvents.cancel();
}else{this._activated=true;
}},_drag:function(Z){var aa=this;
Z.preventDefault();
var Y=this._elementUnderCursor(Z);
aa._withDropTarget(Y,function(ac,ad){if(!ac){if(G){G._trigger(q,y(Z,{dropTarget:a(G.targetElement)}));
G=null;
}return;
}if(G){if(ad===G.targetElement){return;
}G._trigger(q,y(Z,{dropTarget:a(G.targetElement)}));
}ac._trigger(n,y(Z,{dropTarget:a(ad)}));
G=y(ac,{targetElement:ad});
});
aa._trigger(k,y(Z,{dropTarget:G,elementUnderCursor:Y}));
if(this.options.autoScroll){if(this._cursorElement!==Y){this._scrollableParent=z(Y);
this._cursorElement=Y;
}if(this._scrollableParent[0]){var ab=c(Z.x.location,Z.y.location,P(this._scrollableParent));
this._scrollCompenstation=a.extend({},this.hintOffset);
this._scrollVelocity=ab;
if(ab.y===0&&ab.x===0){clearInterval(this._scrollInterval);
this._scrollInterval=null;
}else{if(!this._scrollInterval){this._scrollInterval=setInterval(a.proxy(this,"_autoScroll"),50);
}}}}if(aa.hint){aa._updateHint(Z);
}},_autoScroll:function(){var aa=this._scrollableParent[0],ab=this._scrollVelocity,Y=this._scrollCompenstation;
if(!aa){return;
}var ah,ae;
var Z=aa===j.body;
if(Z){ah=j.body.offsetHeight>b.height();
ae=j.body.offsetWidth>b.width();
}else{ah=aa.offsetHeight<=aa.scrollHeight;
ae=aa.offsetWidth<=aa.scrollWidth;
}var af=aa.scrollTop+ab.y;
var ag=ah&&af>0&&af<aa.scrollHeight;
var ac=aa.scrollLeft+ab.x;
var ad=ae&&ac>0&&ac<aa.scrollWidth;
if(ag){aa.scrollTop+=ab.y;
}if(ad){aa.scrollLeft+=ab.x;
}if(Z&&(ad||ag)){if(ag){Y.top+=ab.y;
}if(ad){Y.left+=ab.x;
}this.hint.css(Y);
}},_end:function(Y){this._withDropTarget(this._elementUnderCursor(Y),function(Z,aa){if(Z){Z._drop(y({},Y,{dropTarget:a(aa)}));
G=null;
}});
this._cancel(this._trigger(m,Y));
},_cancel:function(Y){var Z=this;
Z._scrollableParent=null;
clearInterval(this._scrollInterval);
Z._activated=false;
if(Z.hint&&!Z.dropped){setTimeout(function(){Z.hint.stop(true,true);
if(Y){Z._afterEndHandler();
}else{Z.hint.animate(Z.currentTargetOffset,"fast",Z._afterEndHandler);
}},0);
}else{Z._afterEnd();
}},_trigger:function(Z,Y){var aa=this;
return aa.trigger(Z,y({},Y.event,{x:Y.x,y:Y.y,currentTarget:aa.currentTarget,initialTarget:Y.touch?Y.touch.initialTouch:null,dropTarget:Y.dropTarget,elementUnderCursor:Y.elementUnderCursor}));
},_elementUnderCursor:function(Y){var aa=x(Y),Z=this.hint;
if(Z&&h(Z[0],aa)){Z.hide();
aa=x(Y);
if(!aa){aa=x(Y);
}Z.show();
}return aa;
},_withDropTarget:function(aa,Z){var ac,ab=this.options.group,ad=w[ab],Y=t[ab];
if(ad&&ad.length||Y&&Y.length){ac=e(aa,ad,Y);
if(ac){Z(ac.target,ac.targetElement);
}else{Z();
}}},destroy:function(){var Y=this;
W.fn.destroy.call(Y);
Y._afterEnd();
Y.userEvents.destroy();
this._scrollableParent=null;
this._cursorElement=null;
clearInterval(this._scrollInterval);
Y.currentTarget=null;
},_afterEnd:function(){var Y=this;
if(Y.hint){Y.hint.remove();
}delete p[Y.options.group];
Y.trigger("destroy");
Y.trigger(B);
a(j).off(F,Y._captureEscape);
}});
E.ui.plugin(u);
E.ui.plugin(v);
E.ui.plugin(o);
E.TapCapture=R;
E.containerBoundaries=g;
y(E.ui,{Pane:K,PaneDimensions:N,Movable:H});
function P(Z){var Y=j.body,ab,ac,aa;
if(Z[0]===Y){ac=Y.scrollTop;
aa=Y.scrollLeft;
return{top:ac,left:aa,bottom:ac+b.height(),right:aa+b.width()};
}else{ab=Z.offset();
ab.bottom=ab.top+Z.height();
ab.right=ab.left+Z.width();
return ab;
}}function D(Y){return Y===j.body||Y===j.documentElement||Y===j;
}function z(Y){if(!Y||D(Y)){return a(j.body);
}var Z=a(Y)[0];
while(!E.isScrollable(Z)&&!D(Z)){Z=Z.parentNode;
}return a(Z);
}function c(Z,aa,ab){var ac={x:0,y:0};
var Y=50;
if(Z-ab.left<Y){ac.x=-(Y-(Z-ab.left));
}else{if(ab.right-Z<Y){ac.x=Y-(ab.right-Z);
}}if(aa-ab.top<Y){ac.y=-(Y-(aa-ab.top));
}else{if(ab.bottom-aa<Y){ac.y=Y-(ab.bottom-aa);
}}return ac;
}E.ui.Draggable.utils={autoScrollVelocity:c,scrollableViewPort:P,findScrollableParent:z};
})(window.kendo.jQuery);
})();
return window.kendo;
},typeof define=="function"&&define.amd?define:function(a,b){b();
});
