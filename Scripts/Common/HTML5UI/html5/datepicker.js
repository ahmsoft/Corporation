(function(b,a){a(["./kendo.calendar","./kendo.popup"],b);
})(function(){(function(){(function(a,Q){var x=window.kendo,P=x.ui,R=P.Widget,G=x.parseDate,y=x.keys,O=x.template,b=x._activeElement,p="<div />",M="<span />",E=".kendoDatePicker",i="click"+E,F="open",j="close",h="change",o="disabled",J="readonly",n="k-state-default",r="k-state-focused",L="k-state-selected",N="k-state-disabled",s="k-state-hover",t="mouseenter"+E+" mouseleave"+E,C="mousedown"+E,u="id",A="min",z="max",B="month",c="aria-disabled",d="aria-expanded",e="aria-hidden",f="aria-readonly",g=x.calendar,w=g.isInRange,K=g.restrictValue,v=g.isEqualDatePart,q=a.extend,I=a.proxy,k=Date;
function D(T){var U=T.parseFormats,S=T.format;
g.normalize(T);
U=a.isArray(U)?U:[U];
if(!U.length){U.push("yyyy-MM-dd");
}if(a.inArray(S,U)===-1){U.splice(0,0,T.format);
}T.parseFormats=U;
}function H(S){S.preventDefault();
}var m=function(V){var W=this,U,S=document.body,T=a(p).attr(e,"true").addClass("k-calendar-container").appendTo(S);
W.options=V=V||{};
U=V.id;
if(U){U+="_dateview";
T.attr(u,U);
W._dateViewID=U;
}W.popup=new P.Popup(T,q(V.popup,V,{name:"Popup",isRtl:x.support.isRtl(V.anchor)}));
W.div=T;
W.value(V.value);
};
m.prototype={_calendar:function(){var V=this;
var S=V.calendar;
var U=V.options;
var T;
if(!S){T=a(p).attr(u,x.guid()).appendTo(V.popup.element).on(C,H).on(i,"td:has(.k-link)",I(V._click,V));
V.calendar=S=new P.Calendar(T);
V._setOptions(U);
x.calendar.makeUnselectable(S.element);
S.navigate(V._value||V._current,U.start);
V.value(V._value);
}},_setOptions:function(S){this.calendar.setOptions({focusOnNav:false,change:S.change,culture:S.culture,dates:S.dates,depth:S.depth,footer:S.footer,format:S.format,max:S.max,min:S.min,month:S.month,start:S.start});
},setOptions:function(T){var S=this.options;
this.options=q(S,T,{change:S.change,close:S.close,open:S.open});
if(this.calendar){this._setOptions(this.options);
}},destroy:function(){this.popup.destroy();
},open:function(){var S=this;
S._calendar();
S.popup.open();
},close:function(){this.popup.close();
},min:function(S){this._option(A,S);
},max:function(S){this._option(z,S);
},toggle:function(){var S=this;
S[S.popup.visible()?j:F]();
},move:function(T){var X=this,V=T.keyCode,S=X.calendar,W=T.ctrlKey&&V==y.DOWN||V==y.ENTER,U=false;
if(T.altKey){if(V==y.DOWN){X.open();
T.preventDefault();
U=true;
}else{if(V==y.UP){X.close();
T.preventDefault();
U=true;
}}}else{if(X.popup.visible()){if(V==y.ESC||(W&&S._cell.hasClass(L))){X.close();
T.preventDefault();
return true;
}X._current=S._move(T);
U=true;
}}return U;
},current:function(S){this._current=S;
this.calendar._focus(S);
},value:function(V){var U=this,S=U.calendar,T=U.options;
U._value=V;
U._current=new k(+K(V,T.min,T.max));
if(S){S.value(V);
}},_click:function(S){if(S.currentTarget.className.indexOf(L)!==-1){this.close();
}},_option:function(T,V){var U=this;
var S=U.calendar;
U.options[T]=V;
if(S){S[T](V);
}}};
m.normalize=D;
x.DateView=m;
var l=R.extend({init:function(V,W){var X=this,S,T;
R.fn.init.call(X,V,W);
V=X.element;
W=X.options;
W.min=G(V.attr("min"))||G(W.min);
W.max=G(V.attr("max"))||G(W.max);
D(W);
X._initialOptions=q({},W);
X._wrapper();
X.dateView=new m(q({},W,{id:V.attr(u),anchor:X.wrapper,change:function(){X._change(this.value());
X.close();
},close:function(Y){if(X.trigger(j)){Y.preventDefault();
}else{V.attr(d,false);
T.attr(e,true);
}},open:function(Z){var aa=X.options,Y;
if(X.trigger(F)){Z.preventDefault();
}else{if(X.element.val()!==X._oldText){Y=G(V.val(),aa.parseFormats,aa.culture);
X.dateView[Y?"current":"value"](Y);
}V.attr(d,true);
T.attr(e,false);
X._updateARIA(Y);
}}}));
T=X.dateView.div;
X._icon();
try{V[0].setAttribute("type","text");
}catch(U){V[0].type="text";
}V.addClass("k-input").attr({role:"combobox","aria-expanded":false,"aria-owns":X.dateView._dateViewID});
X._reset();
X._template();
S=V.is("[disabled]")||a(X.element).parents("fieldset").is(":disabled");
if(S){X.enable(false);
}else{X.readonly(V.is("[readonly]"));
}X._old=X._update(W.value||X.element.val());
X._oldText=V.val();
x.notify(X);
},events:[F,j,h],options:{name:"DatePicker",value:null,footer:"",format:"",culture:"",parseFormats:[],min:new Date(1900,0,1),max:new Date(2099,11,31),start:B,depth:B,animation:{},month:{},dates:[],ARIATemplate:'Current focused date is #=kendo.toString(data.current, "D")#'},setOptions:function(S){var T=this;
var U=T._value;
R.fn.setOptions.call(T,S);
S=T.options;
S.min=G(S.min);
S.max=G(S.max);
D(S);
T.dateView.setOptions(S);
if(U){T.element.val(x.toString(U,S.format,S.culture));
T._updateARIA(U);
}},_editable:function(V){var X=this,U=X._dateIcon.off(E),T=X.element.off(E),Y=X._inputWrapper.off(E),W=V.readonly,S=V.disable;
if(!W&&!S){Y.addClass(n).removeClass(N).on(t,X._toggleHover);
T.removeAttr(o).removeAttr(J).attr(c,false).attr(f,false).on("keydown"+E,I(X._keydown,X)).on("focusout"+E,I(X._blur,X)).on("focus"+E,function(){X._inputWrapper.addClass(r);
});
U.on(i,I(X._click,X)).on(C,H);
}else{Y.addClass(S?N:n).removeClass(S?n:N);
T.attr(o,S).attr(J,W).attr(c,S).attr(f,W);
}},readonly:function(S){this._editable({readonly:S===Q?true:S,disable:false});
},enable:function(S){this._editable({readonly:false,disable:!(S=S===Q?true:S)});
},destroy:function(){var S=this;
R.fn.destroy.call(S);
S.dateView.destroy();
S.element.off(E);
S._dateIcon.off(E);
S._inputWrapper.off(E);
if(S._form){S._form.off("reset",S._resetHandler);
}},open:function(){this.dateView.open();
},close:function(){this.dateView.close();
},min:function(S){return this._option(A,S);
},max:function(S){return this._option(z,S);
},value:function(T){var S=this;
if(T===Q){return S._value;
}S._old=S._update(T);
if(S._old===null){S.element.val("");
}S._oldText=S.element.val();
},_toggleHover:function(S){a(S.currentTarget).toggleClass(s,S.type==="mouseenter");
},_blur:function(){var S=this,T=S.element.val();
S.close();
if(T!==S._oldText){S._change(T);
}S._inputWrapper.removeClass(r);
},_click:function(){var T=this,S=T.element;
T.dateView.toggle();
if(!x.support.touch&&S[0]!==b()){S.focus();
}},_change:function(T){var S=this;
T=S._update(T);
if(+S._old!=+T){S._old=T;
S._oldText=S.element.val();
if(!S._typing){S.element.trigger(h);
}S.trigger(h);
}S._typing=false;
},_keydown:function(T){var V=this,S=V.dateView,W=V.element.val(),U=false;
if(!S.popup.visible()&&T.keyCode==y.ENTER&&W!==V._oldText){V._change(W);
}else{U=S.move(T);
V._updateARIA(S._current);
if(!U){V._typing=true;
}}},_icon:function(){var U=this,S=U.element,T;
T=S.next("span.k-select");
if(!T[0]){T=a('<span unselectable="on" class="k-select"><span unselectable="on" class="k-icon k-i-calendar">select</span></span>').insertAfter(S);
}U._dateIcon=T.attr({role:"button","aria-controls":U.dateView._dateViewID});
},_option:function(S,V){var U=this,T=U.options;
if(V===Q){return T[S];
}V=G(V,T.parseFormats,T.culture);
if(!V){return;
}T[S]=new k(+V);
U.dateView[S](V);
},_update:function(aa){var Z=this,Y=Z.options,X=Y.min,W=Y.max,S=Z._value,T=G(aa,Y.parseFormats,Y.culture),V=(T===null&&S===null)||(T instanceof Date&&S instanceof Date),U;
if(+T===+S&&V){U=x.toString(T,Y.format,Y.culture);
if(U!==aa){Z.element.val(T===null?aa:U);
}return T;
}if(T!==null&&v(T,X)){T=K(T,X,W);
}else{if(!w(T,X,W)){T=null;
}}Z._value=T;
Z.dateView.value(T);
Z.element.val(T?x.toString(T,Y.format,Y.culture):aa);
Z._updateARIA(T);
return T;
},_wrapper:function(){var T=this,S=T.element,U;
U=S.parents(".k-datepicker");
if(!U[0]){U=S.wrap(M).parent().addClass("k-picker-wrap k-state-default");
U=U.wrap(M).parent();
}U[0].style.cssText=S[0].style.cssText;
S.css({width:"100%",height:S[0].style.height});
T.wrapper=U.addClass("k-widget k-datepicker k-header").addClass(S[0].className);
T._inputWrapper=a(U[0].firstChild);
},_reset:function(){var V=this,S=V.element,U=S.attr("form"),T=U?a("#"+U):S.closest("form");
if(T[0]){V._resetHandler=function(){V.value(S[0].defaultValue);
V.max(V._initialOptions.max);
V.min(V._initialOptions.min);
};
V._form=T.on("reset",V._resetHandler);
}},_template:function(){this._ariaTemplate=O(this.options.ARIATemplate);
},_updateARIA:function(U){var T;
var V=this;
var S=V.dateView.calendar;
V.element.removeAttr("aria-activedescendant");
if(S){T=S._cell;
T.attr("aria-label",V._ariaTemplate({current:U||S.current()}));
V.element.attr("aria-activedescendant",T.attr("id"));
}}});
P.plugin(l);
})(window.kendo.jQuery);
})();
return window.kendo;
},typeof define=="function"&&define.amd?define:function(a,b){b();
});