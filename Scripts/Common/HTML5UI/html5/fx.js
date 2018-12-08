(function(b,a){a(["./kendo.core"],b);
})(function(){(function(){(function(a,am){var E=window.kendo,y=E.effects,t=a.each,w=a.extend,Q=a.proxy,Y=E.support,h=Y.browser,af=Y.transforms,ai=Y.transitions,V={scale:0,scalex:0,scaley:0,scale3d:0},ak={translate:0,translatex:0,translatey:0,translate3d:0},z=(typeof document.documentElement.style.zoom!=="undefined")&&!af,G=/matrix3?d?\s*\(.*,\s*([\d\.\-]+)\w*?,\s*([\d\.\-]+)\w*?,\s*([\d\.\-]+)\w*?,\s*([\d\.\-]+)\w*?/i,o=/^(-?[\d\.\-]+)?[\w\s]*,?\s*(-?[\d\.\-]+)?[\w\s]*/i,al=/translatex?$/i,J=/(zoom|fade|expand)(\w+)/,W=/(zoom|fade|expand)/,an=/[xy]$/i,ae=["perspective","rotate","rotatex","rotatey","rotatez","rotate3d","scale","scalex","scaley","scalez","scale3d","skew","skewx","skewy","translate","translatex","translatey","translatez","translate3d","matrix","matrix3d"],ac=["rotate","scale","scalex","scaley","skew","skewx","skewy","translate","translatex","translatey","matrix"],ad={rotate:"deg",scale:"",skew:"px",translate:"px"},p=af.css,U=Math.round,g="",R="px",H="none",e="auto",ao="width",A="height",B="hidden",K="origin",b="abortId",L="overflow",aj="translate",P="position",l="completeCallback",ah=p+"transition",aa=p+"transform",f=p+"backface-visibility",O=p+"perspective",r="1500px",ab="perspective("+r+")",s={left:{reverse:"right",property:"left",transition:"translatex",vertical:false,modifier:-1},right:{reverse:"left",property:"left",transition:"translatex",vertical:false,modifier:1},down:{reverse:"up",property:"top",transition:"translatey",vertical:true,modifier:1},up:{reverse:"down",property:"top",transition:"translatey",vertical:true,modifier:-1},top:{reverse:"bottom"},bottom:{reverse:"top"},"in":{reverse:"out",modifier:-1},out:{reverse:"in",modifier:1},vertical:{reverse:"vertical"},horizontal:{reverse:"horizontal"}};
E.directions=s;
w(a.fn,{kendoStop:function(ap,aq){if(ai){return y.stopQueue(this,ap||false,aq||false);
}else{return this.stop(ap,aq);
}}});
if(af&&!ai){t(ac,function(ap,aq){a.fn[aq]=function(au){if(typeof au=="undefined"){return d(this,aq);
}else{var ar=a(this)[0],at=aq+"("+au+ad[aq.replace(an,"")]+")";
if(ar.style.cssText.indexOf(aa)==-1){a(this).css(aa,at);
}else{ar.style.cssText=ar.style.cssText.replace(new RegExp(aq+"\\(.*?\\)","i"),at);
}}return this;
};
a.fx.step[aq]=function(ar){a(ar.elem)[aq](ar.now);
};
});
var q=a.fx.prototype.cur;
a.fx.prototype.cur=function(){if(ac.indexOf(this.prop)!=-1){return parseFloat(a(this.elem)[this.prop]());
}return q.apply(this,arguments);
};
}E.toggleClass=function(ar,aq,at,ap){if(aq){aq=aq.split(" ");
if(ai){at=w({exclusive:"all",duration:400,ease:"ease-out"},at);
ar.css(ah,at.exclusive+" "+at.duration+"ms "+at.ease);
setTimeout(function(){ar.css(ah,"").css(A);
},at.duration);
}t(aq,function(au,av){ar.toggleClass(av,ap);
});
}return ar;
};
E.parseEffects=function(aq,ar){var ap={};
if(typeof aq==="string"){t(aq.split(" "),function(aw,az){var ax=!W.test(az),ay=az.replace(J,function(aC,aA,aB){return aA+":"+aB.toLowerCase();
}),au=ay.split(":"),at=au[1],av={};
if(au.length>1){av.direction=(ar&&ax?s[at].reverse:at);
}ap[au[0]]=av;
});
}else{t(aq,function(au){var at=this.direction;
if(at&&ar&&!W.test(au)){this.direction=s[at].reverse;
}ap[au]=this;
});
}return ap;
};
function N(ap){return parseInt(ap,10);
}function M(ap,aq){return N(ap.css(aq));
}function F(aq){var ap=[];
for(var ar in aq){ap.push(ar);
}return ap;
}function X(aq){for(var ap in aq){if(ae.indexOf(ap)!=-1&&ac.indexOf(ap)==-1){delete aq[ap];
}}return aq;
}function I(aq,av){var aw=[],ap={},au,at,ax,ar;
for(at in av){au=at.toLowerCase();
ar=af&&ae.indexOf(au)!=-1;
if(!Y.hasHW3D&&ar&&ac.indexOf(au)==-1){delete av[at];
}else{ax=av[at];
if(ar){aw.push(at+"("+ax+")");
}else{ap[at]=ax;
}}}if(aw.length){ap[aa]=aw.join(" ");
}return ap;
}if(ai){w(y,{transition:function(ar,av,au){var ap,aq=0,at=ar.data("keys")||[],ay;
au=w({duration:200,ease:"ease-out",complete:null,exclusive:"all"},au);
var ax=false;
var aw=function(){if(!ax){ax=true;
if(ay){clearTimeout(ay);
ay=null;
}ar.removeData(b).dequeue().css(ah,"").css(ah);
au.complete.call(ar);
}};
au.duration=a.fx?a.fx.speeds[au.duration]||au.duration:au.duration;
ap=I(ar,av);
a.merge(at,F(ap));
ar.data("keys",a.unique(at)).height();
ar.css(ah,au.exclusive+" "+au.duration+"ms "+au.ease).css(ah);
ar.css(ap).css(aa);
if(ai.event){ar.one(ai.event,aw);
if(au.duration!==0){aq=500;
}}ay=setTimeout(aw,au.duration+aq);
ar.data(b,ay);
ar.data(l,aw);
},stopQueue:function(at,ap,au){var ar,aw=at.data("keys"),av=(!au&&aw),aq=at.data(l);
if(av){ar=E.getComputedStyles(at[0],aw);
}if(aq){aq();
}if(av){at.css(ar);
}return at.removeData("keys").stop(ap);
}});
}function d(aq,at){if(af){var au=aq.css(aa);
if(au==H){return at=="scale"?1:0;
}var ar=au.match(new RegExp(at+"\\s*\\(([\\d\\w\\.]+)")),ap=0;
if(ar){ap=N(ar[1]);
}else{ar=au.match(G)||[0,0,0,0,0];
at=at.toLowerCase();
if(al.test(at)){ap=parseFloat(ar[3]/ar[2]);
}else{if(at=="translatey"){ap=parseFloat(ar[4]/ar[2]);
}else{if(at=="scale"){ap=parseFloat(ar[2]);
}else{if(at=="rotate"){ap=parseFloat(Math.atan2(ar[2],ar[1]));
}}}}}return ap;
}else{return parseFloat(aq.css(at));
}}var v=E.Class.extend({init:function(ap,aq){var ar=this;
ar.element=ap;
ar.effects=[];
ar.options=aq;
ar.restore=[];
},run:function(av){var aE=this,at,ay,az,aA=av.length,aw=aE.element,aB=aE.options,ar=a.Deferred(),aC={},ax={},aD,ap,aq;
aE.effects=av;
ar.then(a.proxy(aE,"complete"));
aw.data("animating",true);
for(ay=0;
ay<aA;
ay++){at=av[ay];
at.setReverse(aB.reverse);
at.setOptions(aB);
aE.addRestoreProperties(at.restore);
at.prepare(aC,ax);
ap=at.children();
for(az=0,aq=ap.length;
az<aq;
az++){ap[az].duration(aB.duration).run();
}}for(var au in aB.effects){w(ax,aB.effects[au].properties);
}if(!aw.is(":visible")){w(aC,{display:aw.data("olddisplay")||"block"});
}if(af&&!aB.reset){aD=aw.data("targetTransform");
if(aD){aC=w(aD,aC);
}}aC=I(aw,aC);
if(af&&!ai){aC=X(aC);
}aw.css(aC).css(aa);
for(ay=0;
ay<aA;
ay++){av[ay].setup();
}if(aB.init){aB.init();
}aw.data("targetTransform",ax);
y.animate(aw,ax,w({},aB,{complete:ar.resolve}));
return ar.promise();
},stop:function(){a(this.element).kendoStop(true,true);
},addRestoreProperties:function(at){var ap=this.element,au,aq=0,ar=at.length;
for(;
aq<ar;
aq++){au=at[aq];
this.restore.push(au);
if(!ap.data(au)){ap.data(au,ap.css(au));
}}},restoreCallback:function(){var ap=this.element;
for(var aq=0,ar=this.restore.length;
aq<ar;
aq++){var at=this.restore[aq];
ap.css(at,ap.data(at));
}},complete:function(){var av=this,ar=0,aq=av.element,au=av.options,ap=av.effects,at=ap.length;
aq.removeData("animating").dequeue();
if(au.hide){aq.data("olddisplay",aq.css("display")).hide();
}this.restoreCallback();
if(z&&!af){setTimeout(a.proxy(this,"restoreCallback"),0);
}for(;
ar<at;
ar++){ap[ar].teardown();
}if(au.completeCallback){au.completeCallback(aq);
}}});
y.promise=function(av,aw){var at=[],aq,au=new v(av,aw),ax=E.parseEffects(aw.effects),ap;
aw.effects=ax;
for(var ar in ax){aq=y[i(ar)];
if(aq){ap=new aq(av,ax[ar].direction);
at.push(ap);
}}if(at[0]){au.run(at);
}else{if(!av.is(":visible")){av.css({display:av.data("olddisplay")||"block"}).css("display");
}if(aw.init){aw.init();
}av.dequeue();
au.complete();
}};
w(y,{animate:function(ap,ar,aq){var at=aq.transition!==false;
delete aq.transition;
if(ai&&"transition" in y&&at){y.transition(ap,ar,aq);
}else{if(af){ap.animate(X(ar),{queue:false,show:false,hide:false,duration:aq.duration,complete:aq.complete});
}else{ap.each(function(){var au=a(this),av={};
t(ae,function(az,aF){var aC,aw=ar?ar[aF]+" ":null;
if(aw){var aE=ar;
if(aF in V&&ar[aF]!==am){aC=aw.match(o);
if(af){w(aE,{scale:+aC[0]});
}}else{if(aF in ak&&ar[aF]!==am){var aD=au.css(P),aA=(aD=="absolute"||aD=="fixed");
if(!au.data(aj)){if(aA){au.data(aj,{top:M(au,"top")||0,left:M(au,"left")||0,bottom:M(au,"bottom"),right:M(au,"right")});
}else{au.data(aj,{top:M(au,"marginTop")||0,left:M(au,"marginLeft")||0});
}}var aB=au.data(aj);
aC=aw.match(o);
if(aC){var ax=aF==aj+"y"?+null:+aC[1],ay=aF==aj+"y"?+aC[1]:+aC[2];
if(aA){if(!isNaN(aB.right)){if(!isNaN(ax)){w(aE,{right:aB.right-ax});
}}else{if(!isNaN(ax)){w(aE,{left:aB.left+ax});
}}if(!isNaN(aB.bottom)){if(!isNaN(ay)){w(aE,{bottom:aB.bottom-ay});
}}else{if(!isNaN(ay)){w(aE,{top:aB.top+ay});
}}}else{if(!isNaN(ax)){w(aE,{marginLeft:aB.left+ax});
}if(!isNaN(ay)){w(aE,{marginTop:aB.top+ay});
}}}}}if(!af&&aF!="scale"&&aF in aE){delete aE[aF];
}if(aE){w(av,aE);
}}});
if(h.msie){delete av.scale;
}au.animate(av,{queue:false,show:false,hide:false,duration:aq.duration,complete:aq.complete});
});
}}}});
y.animatedPromise=y.promise;
var u=E.Class.extend({init:function(aq,ap){var ar=this;
ar.element=aq;
ar._direction=ap;
ar.options={};
ar._additionalEffects=[];
if(!ar.restore){ar.restore=[];
}},reverse:function(){this._reverse=true;
return this.run();
},play:function(){this._reverse=false;
return this.run();
},add:function(ap){this._additionalEffects.push(ap);
return this;
},direction:function(ap){this._direction=ap;
return this;
},duration:function(ap){this._duration=ap;
return this;
},compositeRun:function(){var ar=this,aq=new v(ar.element,{reverse:ar._reverse,duration:ar._duration}),ap=ar._additionalEffects.concat([ar]);
return aq.run(ap);
},run:function(){if(this._additionalEffects&&this._additionalEffects[0]){return this.compositeRun();
}var aA=this,at=aA.element,av=0,ax=aA.restore,aw=ax.length,aB,ar=a.Deferred(),ay={},au={},az,ap=aA.children(),aq=ap.length;
ar.then(a.proxy(aA,"_complete"));
at.data("animating",true);
for(av=0;
av<aw;
av++){aB=ax[av];
if(!at.data(aB)){at.data(aB,at.css(aB));
}}for(av=0;
av<aq;
av++){ap[av].duration(aA._duration).run();
}aA.prepare(ay,au);
if(!at.is(":visible")){w(ay,{display:at.data("olddisplay")||"block"});
}if(af){az=at.data("targetTransform");
if(az){ay=w(az,ay);
}}ay=I(at,ay);
if(af&&!ai){ay=X(ay);
}at.css(ay).css(aa);
aA.setup();
at.data("targetTransform",au);
y.animate(at,au,{duration:aA._duration,complete:ar.resolve});
return ar.promise();
},stop:function(){var ar=0,ap=this.children(),aq=ap.length;
for(ar=0;
ar<aq;
ar++){ap[ar].stop();
}a(this.element).kendoStop(true,true);
return this;
},restoreCallback:function(){var ap=this.element;
for(var aq=0,ar=this.restore.length;
aq<ar;
aq++){var at=this.restore[aq];
ap.css(at,ap.data(at));
}},_complete:function(){var aq=this,ap=aq.element;
ap.removeData("animating").dequeue();
aq.restoreCallback();
if(aq.shouldHide()){ap.data("olddisplay",ap.css("display")).hide();
}if(z&&!af){setTimeout(a.proxy(aq,"restoreCallback"),0);
}aq.teardown();
},setOptions:function(ap){w(true,this.options,ap);
},children:function(){return[];
},shouldHide:a.noop,setup:a.noop,prepare:a.noop,teardown:a.noop,directions:[],setReverse:function(ap){this._reverse=ap;
return this;
}});
function i(ap){return ap.charAt(0).toUpperCase()+ap.substring(1);
}function m(at,ap){var ar=u.extend(ap),aq=ar.prototype.directions;
y[i(at)]=ar;
y.Element.prototype[at]=function(au,av,aw,ax){return new ar(this.element,au,av,aw,ax);
};
t(aq,function(au,av){y.Element.prototype[at+i(av)]=function(aw,ax,ay){return new ar(this.element,av,aw,ax,ay);
};
});
}var x=["left","right","up","down"],D=["in","out"];
m("slideIn",{directions:x,divisor:function(ap){this.options.divisor=ap;
return this;
},prepare:function(av,ar){var ax=this,ay,aq=ax.element,ap=s[ax._direction],au=-ap.modifier*(ap.vertical?aq.outerHeight():aq.outerWidth()),aw=au/(ax.options&&ax.options.divisor||1)+R,at="0px";
if(ax._reverse){ay=av;
av=ar;
ar=ay;
}if(af){av[ap.transition]=aw;
ar[ap.transition]=at;
}else{av[ap.property]=aw;
ar[ap.property]=at;
}}});
m("tile",{directions:x,init:function(aq,ap,ar){u.prototype.init.call(this,aq,ap);
this.options={previous:ar};
},previousDivisor:function(ap){this.options.previousDivisor=ap;
return this;
},children:function(){var av=this,au=av._reverse,at=av.options.previous,ar=av.options.previousDivisor||1,aq=av._direction;
var ap=[E.fx(av.element).slideIn(aq).setReverse(au)];
if(at){ap.push(E.fx(at).slideIn(s[aq].reverse).divisor(ar).setReverse(!au));
}return ap;
}});
function n(ar,at,aq,ap){m(ar,{directions:D,startValue:function(au){this._startValue=au;
return this;
},endValue:function(au){this._endValue=au;
return this;
},shouldHide:function(){return this._shouldHide;
},prepare:function(ax,au){var aB=this,aA,av,aw=this._direction==="out",ay=aB.element.data(at),az=!(isNaN(ay)||ay==aq);
if(az){aA=ay;
}else{if(typeof this._startValue!=="undefined"){aA=this._startValue;
}else{aA=aw?aq:ap;
}}if(typeof this._endValue!=="undefined"){av=this._endValue;
}else{av=aw?ap:aq;
}if(this._reverse){ax[at]=av;
au[at]=aA;
}else{ax[at]=aA;
au[at]=av;
}aB._shouldHide=au[at]===ap;
}});
}n("fade","opacity",1,0);
n("zoom","scale",1,0.01);
m("slideMargin",{prepare:function(ax,aq){var ay=this,ap=ay.element,au=ay.options,av=ap.data(K),at=au.offset,ar,aw=ay._reverse;
if(!aw&&av===null){ap.data(K,parseFloat(ap.css("margin-"+au.axis)));
}ar=(ap.data(K)||0);
aq["margin-"+au.axis]=!aw?ar+at:ar;
}});
m("slideTo",{prepare:function(av,aq){var aw=this,ap=aw.element,at=aw.options,ar=at.offset.split(","),au=aw._reverse;
if(af){aq.translatex=!au?ar[0]:0;
aq.translatey=!au?ar[1]:0;
}else{aq.left=!au?ar[0]:0;
aq.top=!au?ar[1]:0;
}ap.css("left");
}});
m("expand",{directions:["horizontal","vertical"],restore:[L],prepare:function(az,aq){var aA=this,ap=aA.element,au=aA.options,ax=aA._reverse,av=aA._direction==="vertical"?A:ao,ay=ap[0].style[av],at=ap.data(av),ar=parseFloat(at||ay),aw=U(ap.css(av,e)[av]());
az.overflow=B;
ar=(au&&au.reset)?aw||ar:ar||aw;
aq[av]=(ax?0:ar)+R;
az[av]=(ax?ar:0)+R;
if(at===am){ap.data(av,ay);
}},shouldHide:function(){return this._reverse;
},teardown:function(){var at=this,ap=at.element,ar=at._direction==="vertical"?A:ao,aq=ap.data(ar);
if(aq==e||aq===g){setTimeout(function(){ap.css(ar,e).css(ar);
},0);
}}});
var Z={position:"absolute",marginLeft:0,marginTop:0,scale:1};
m("transfer",{init:function(ap,aq){this.element=ap;
this.options={target:aq};
this.restore=[];
},setup:function(){this.element.appendTo(document.body);
},prepare:function(aw,ar){var ax=this,aq=ax.element,au=y.box(aq),at=y.box(ax.options.target),ap=d(aq,"scale"),av=y.fillScale(at,au),ay=y.transformOrigin(at,au);
w(aw,Z);
ar.scale=1;
aq.css(aa,"scale(1)").css(aa);
aq.css(aa,"scale("+ap+")");
aw.top=au.top;
aw.left=au.left;
aw.transformOrigin=ay.x+R+" "+ay.y+R;
if(ax._reverse){aw.scale=av;
}else{ar.scale=av;
}}});
var k={top:"rect(auto auto $size auto)",bottom:"rect($size auto auto auto)",left:"rect(auto $size auto auto)",right:"rect(auto auto auto $size)"};
var T={top:{start:"rotatex(0deg)",end:"rotatex(180deg)"},bottom:{start:"rotatex(-180deg)",end:"rotatex(0deg)"},left:{start:"rotatey(0deg)",end:"rotatey(-180deg)"},right:{start:"rotatey(180deg)",end:"rotatey(0deg)"}};
function j(ap,aq){var at=E.directions[aq].vertical,ar=(ap[at?A:ao]()/2)+"px";
return k[aq].replace("$size",ar);
}m("turningPage",{directions:x,init:function(ar,aq,ap){u.prototype.init.call(this,ar,aq);
this._container=ap;
},prepare:function(au,aq){var av=this,ar=av._reverse,ap=ar?s[av._direction].reverse:av._direction,at=T[ap];
au.zIndex=1;
if(av._clipInHalf){au.clip=j(av._container,E.directions[ap].reverse);
}au[f]=B;
aq[aa]=ab+(ar?at.start:at.end);
au[aa]=ab+(ar?at.end:at.start);
},setup:function(){this._container.append(this.element);
},face:function(ap){this._face=ap;
return this;
},shouldHide:function(){var ar=this,aq=ar._reverse,ap=ar._face;
return(aq&&!ap)||(!aq&&ap);
},clipInHalf:function(ap){this._clipInHalf=ap;
return this;
},temporary:function(){this.element.addClass("temp-page");
return this;
}});
m("staticPage",{directions:x,init:function(ar,aq,ap){u.prototype.init.call(this,ar,aq);
this._container=ap;
},restore:["clip"],prepare:function(ar,aq){var at=this,ap=at._reverse?s[at._direction].reverse:at._direction;
ar.clip=j(at._container,ap);
ar.opacity=0.999;
aq.opacity=1;
},shouldHide:function(){var ar=this,aq=ar._reverse,ap=ar._face;
return(aq&&!ap)||(!aq&&ap);
},face:function(ap){this._face=ap;
return this;
}});
m("pageturn",{directions:["horizontal","vertical"],init:function(ar,aq,at,ap){u.prototype.init.call(this,ar,aq);
this.options={};
this.options.face=at;
this.options.back=ap;
},children:function(){var ay=this,au=ay.options,aq=ay._direction==="horizontal"?"left":"top",aw=E.directions[aq].reverse,av=ay._reverse,ax,at=au.face.clone(true).removeAttr("id"),ap=au.back.clone(true).removeAttr("id"),ar=ay.element;
if(av){ax=aq;
aq=aw;
aw=ax;
}return[E.fx(au.face).staticPage(aq,ar).face(true).setReverse(av),E.fx(au.back).staticPage(aw,ar).setReverse(av),E.fx(at).turningPage(aq,ar).face(true).clipInHalf(true).temporary().setReverse(av),E.fx(ap).turningPage(aw,ar).clipInHalf(true).temporary().setReverse(av)];
},prepare:function(aq,ap){aq[O]=r;
aq.transformStyle="preserve-3d";
aq.opacity=0.999;
ap.opacity=1;
},teardown:function(){this.element.find(".temp-page").remove();
}});
m("flip",{directions:["horizontal","vertical"],init:function(ar,aq,at,ap){u.prototype.init.call(this,ar,aq);
this.options={};
this.options.face=at;
this.options.back=ap;
},children:function(){var aw=this,ar=aw.options,ap=aw._direction==="horizontal"?"left":"top",au=E.directions[ap].reverse,at=aw._reverse,av,aq=aw.element;
if(at){av=ap;
ap=au;
au=av;
}return[E.fx(ar.face).turningPage(ap,aq).face(true).setReverse(at),E.fx(ar.back).turningPage(au,aq).setReverse(at)];
},prepare:function(ap){ap[O]=r;
ap.transformStyle="preserve-3d";
}});
var S=!Y.mobileOS.android;
var C=".km-touch-scrollbar, .km-actionsheet-wrapper";
m("replace",{_before:a.noop,_after:a.noop,init:function(ap,aq,ar){u.prototype.init.call(this,ap);
this._previous=a(aq);
this._transitionClass=ar;
},duration:function(){throw new Error("The replace effect does not support duration setting; the effect duration may be customized through the transition class rule");
},beforeTransition:function(ap){this._before=ap;
return this;
},afterTransition:function(ap){this._after=ap;
return this;
},_both:function(){return a().add(this._element).add(this._previous);
},_containerClass:function(){var aq=this._direction,ap="k-fx k-fx-start k-fx-"+this._transitionClass;
if(aq){ap+=" k-fx-"+aq;
}if(this._reverse){ap+=" k-fx-reverse";
}return ap;
},complete:function(aq){if(!this.deferred||(aq&&a(aq.target).is(C))){return;
}var ap=this.container;
ap.removeClass("k-fx-end").removeClass(this._containerClass()).off(ai.event,this.completeProxy);
this._previous.hide().removeClass("k-fx-current");
this.element.removeClass("k-fx-next");
if(S){ap.css(L,"");
}if(!this.isAbsolute){this._both().css(P,"");
}this.deferred.resolve();
delete this.deferred;
},run:function(){if(this._additionalEffects&&this._additionalEffects[0]){return this.compositeRun();
}var ax=this,at=ax.element,aw=ax._previous,aq=at.parents().filter(aw.parents()).first(),ap=ax._both(),ar=a.Deferred(),av=at.css(P),au;
if(!aq.length){aq=at.parent();
}this.container=aq;
this.deferred=ar;
this.isAbsolute=av=="absolute";
if(!this.isAbsolute){ap.css(P,"absolute");
}if(S){au=aq.css(L);
aq.css(L,"hidden");
}if(!ai){this.complete();
}else{at.addClass("k-fx-hidden");
aq.addClass(this._containerClass());
this.completeProxy=a.proxy(this,"complete");
aq.on(ai.event,this.completeProxy);
E.animationFrame(function(){at.removeClass("k-fx-hidden").addClass("k-fx-next");
aw.css("display","").addClass("k-fx-current");
ax._before(aw,at);
E.animationFrame(function(){aq.removeClass("k-fx-start").addClass("k-fx-end");
ax._after(aw,at);
});
});
}return ar.promise();
},stop:function(){this.complete();
}});
var c=E.Class.extend({init:function(){var ap=this;
ap._tickProxy=Q(ap._tick,ap);
ap._started=false;
},tick:a.noop,done:a.noop,onEnd:a.noop,onCancel:a.noop,start:function(){if(!this.enabled()){return;
}if(!this.done()){this._started=true;
E.animationFrame(this._tickProxy);
}else{this.onEnd();
}},enabled:function(){return true;
},cancel:function(){this._started=false;
this.onCancel();
},_tick:function(){var ap=this;
if(!ap._started){return;
}ap.tick();
if(!ap.done()){E.animationFrame(ap._tickProxy);
}else{ap._started=false;
ap.onEnd();
}}});
var ag=c.extend({init:function(ap){var aq=this;
w(aq,ap);
c.fn.init.call(aq);
},done:function(){return this.timePassed()>=this.duration;
},timePassed:function(){return Math.min(this.duration,(new Date())-this.startDate);
},moveTo:function(aq){var ar=this,ap=ar.movable;
ar.initial=ap[ar.axis];
ar.delta=aq.location-ar.initial;
ar.duration=typeof aq.duration=="number"?aq.duration:300;
ar.tick=ar._easeProxy(aq.ease);
ar.startDate=new Date();
ar.start();
},_easeProxy:function(ap){var aq=this;
return function(){aq.movable.moveAxis(aq.axis,ap(aq.timePassed(),aq.initial,aq.delta,aq.duration));
};
}});
w(ag,{easeOutExpo:function(at,ap,aq,ar){return(at==ar)?ap+aq:aq*(-Math.pow(2,-10*at/ar)+1)+ap;
},easeOutBack:function(au,ap,aq,ar,at){at=1.70158;
return aq*((au=au/ar-1)*au*((at+1)*au+at)+1)+ap;
}});
y.Animation=c;
y.Transition=ag;
y.createEffect=m;
y.box=function(ap){ap=a(ap);
var aq=ap.offset();
aq.width=ap.outerWidth();
aq.height=ap.outerHeight();
return aq;
};
y.transformOrigin=function(ap,aq){var ar=(ap.left-aq.left)*aq.width/(aq.width-ap.width),at=(ap.top-aq.top)*aq.height/(aq.height-ap.height);
return{x:isNaN(ar)?0:ar,y:isNaN(at)?0:at};
};
y.fillScale=function(ap,aq){return Math.min(ap.width/aq.width,ap.height/aq.height);
};
y.fitScale=function(ap,aq){return Math.max(ap.width/aq.width,ap.height/aq.height);
};
})(window.kendo.jQuery);
})();
return window.kendo;
},typeof define=="function"&&define.amd?define:function(a,b){b();
});
