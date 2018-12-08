(function(b,a){a(["./kendo.core"],b);
})(function(){(function(){(function(a,x){var l=window.kendo,B=l.ui.Widget,p=".kendoValidator",j="k-invalid-msg",k=new RegExp(j,"i"),i="k-invalid",A="k-valid",e=/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$/i,y=/^(https?|ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(\#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/i,h=":input:not(:button,[type=submit],[type=reset],[disabled],[readonly])",c=":checkbox:not([disabled],[readonly])",q="[type=number],[type=range]",b="blur",n="name",f="form",o="novalidate",u=a.proxy,t=function(D,C){if(typeof C==="string"){C=new RegExp("^(?:"+C+")$");
}return C.test(D);
},m=function(C,E,D){var F=C.val();
if(C.filter(E).length&&F!==""){return t(F,D);
}return true;
},g=function(C,D){if(C.length){return C[0].attributes[D]!=null;
}return false;
};
if(!l.ui.validator){l.ui.validator={rules:{},messages:{}};
}function v(C){var E=l.ui.validator.ruleResolvers||{},F={},D;
for(D in E){a.extend(true,F,E[D].resolve(C));
}return F;
}function d(C){return C.replace(/&amp/g,"&amp;").replace(/&quot;/g,'"').replace(/&#39;/g,"'").replace(/&lt;/g,"<").replace(/&gt;/g,">");
}function r(C){C=(C+"").split(".");
if(C.length>1){return C[1].length;
}return 0;
}function s(C){if(a.parseHTML){return a(a.parseHTML(C));
}return a(C);
}function w(F,G){var D=a(),E,C;
for(var H=0,I=F.length;
H<I;
H++){E=F[H];
if(k.test(E.className)){C=E.getAttribute(l.attr("for"));
if(C===G){D=D.add(E);
}}}return D;
}var z=B.extend({init:function(C,D){var F=this,E=v(C),G="["+l.attr("validate")+"!=false]";
D=D||{};
D.rules=a.extend({},l.ui.validator.rules,E.rules,D.rules);
D.messages=a.extend({},l.ui.validator.messages,E.messages,D.messages);
B.fn.init.call(F,C,D);
F._errorTemplate=l.template(F.options.errorTemplate);
if(F.element.is(f)){F.element.attr(o,o);
}F._inputSelector=h+G;
F._checkboxSelector=c+G;
F._errors={};
F._attachEvents();
F._isValidated=false;
},events:["validate","change"],options:{name:"Validator",errorTemplate:'<span class="k-widget k-tooltip k-tooltip-validation"><span class="k-icon k-warning"> </span> #=message#</span>',messages:{required:"{0} is required",pattern:"{0} is not valid",min:"{0} should be greater than or equal to {1}",max:"{0} should be smaller than or equal to {1}",step:"{0} is not valid",email:"{0} is not valid email",url:"{0} is not valid URL",date:"{0} is not valid date",dateCompare:"End date should be greater than or equal to the start date"},rules:{required:function(D){var C=D.filter("[type=checkbox]").length&&!D.is(":checked"),E=D.val();
return !(g(D,"required")&&(E===""||!E||C));
},pattern:function(C){if(C.filter("[type=text],[type=email],[type=url],[type=tel],[type=search],[type=password]").filter("[pattern]").length&&C.val()!==""){return t(C.val(),C.attr("pattern"));
}return true;
},min:function(C){if(C.filter(q+",["+l.attr("type")+"=number]").filter("[min]").length&&C.val()!==""){var D=parseFloat(C.attr("min"))||0,E=l.parseFloat(C.val());
return D<=E;
}return true;
},max:function(C){if(C.filter(q+",["+l.attr("type")+"=number]").filter("[max]").length&&C.val()!==""){var D=parseFloat(C.attr("max"))||0,E=l.parseFloat(C.val());
return D>=E;
}return true;
},step:function(D){if(D.filter(q+",["+l.attr("type")+"=number]").filter("[step]").length&&D.val()!==""){var E=parseFloat(D.attr("min"))||0,G=parseFloat(D.attr("step"))||1,H=parseFloat(D.val()),C=r(G),F;
if(C){F=Math.pow(10,C);
return((Math.floor((H-E)*F))%(G*F))/Math.pow(100,C)===0;
}return((H-E)%G)===0;
}return true;
},email:function(C){return m(C,"[type=email],["+l.attr("type")+"=email]",e);
},url:function(C){return m(C,"[type=url],["+l.attr("type")+"=url]",y);
},date:function(C){if(C.filter("[type^=date],["+l.attr("type")+"=date]").length&&C.val()!==""){return l.parseDate(C.val(),C.attr(l.attr("format")))!==null;
}return true;
}},validateOnBlur:true},destroy:function(){B.fn.destroy.call(this);
this.element.off(p);
},value:function(){if(!this._isValidated){return false;
}return this.errors().length===0;
},_submit:function(C){if(!this.validate()){C.stopPropagation();
C.stopImmediatePropagation();
C.preventDefault();
return false;
}return true;
},_checkElement:function(C){var D=this.value();
this.validateInput(C);
if(this.value()!==D){this.trigger("change");
}},_attachEvents:function(){var C=this;
if(C.element.is(f)){C.element.on("submit"+p,u(C._submit,C));
}if(C.options.validateOnBlur){if(!C.element.is(h)){C.element.on(b+p,C._inputSelector,function(){C._checkElement(a(this));
});
C.element.on("click"+p,C._checkboxSelector,function(){C._checkElement(a(this));
});
}else{C.element.on(b+p,function(){C._checkElement(C.element);
});
if(C.element.is(c)){C.element.on("click"+p,function(){C._checkElement(C.element);
});
}}}},validate:function(){var D;
var C;
var H=false;
var G;
var F=this.value();
this._errors={};
if(!this.element.is(h)){var E=false;
D=this.element.find(this._inputSelector);
for(C=0,G=D.length;
C<G;
C++){if(!this.validateInput(D.eq(C))){E=true;
}}H=!E;
}else{H=this.validateInput(this.element);
}this.trigger("validate",{valid:H});
if(F!==H){this.trigger("change");
}return H;
},validateInput:function(E){E=a(E);
this._isValidated=true;
var L=this,K=L._errorTemplate,J=L._checkValidity(E),M=J.valid,C="."+j,D=(E.attr(n)||""),F=L._findMessageContainer(D).add(E.next(C).filter(function(){var N=a(this);
if(N.filter("["+l.attr("for")+"]").length){return N.attr(l.attr("for"))===D;
}return true;
})).hide(),I;
E.removeAttr("aria-invalid");
if(!M){I=L._extractMessage(E,J.key);
L._errors[D]=I;
var H=s(K({message:d(I)}));
var G=F.attr("id");
L._decorateMessageContainer(H,D);
if(G){H.attr("id",G);
}if(!F.replaceWith(H).length){H.insertAfter(E);
}H.show();
E.attr("aria-invalid",true);
}else{delete L._errors[D];
}E.toggleClass(i,!M);
E.toggleClass(A,M);
return M;
},hideMessages:function(){var E=this,C="."+j,D=E.element;
if(!D.is(h)){D.find(C).hide();
}else{D.next(C).hide();
}},_findMessageContainer:function(D){var G=l.ui.validator.messageLocators,H,C=a();
for(var E=0,F=this.element.length;
E<F;
E++){C=C.add(w(this.element[E].getElementsByTagName("*"),D));
}for(H in G){C=C.add(G[H].locate(this.element,D));
}return C;
},_decorateMessageContainer:function(C,D){var E=l.ui.validator.messageLocators,F;
C.addClass(j).attr(l.attr("for"),D||"");
for(F in E){E[F].decorate(C,D);
}C.attr("role","alert");
},_extractMessage:function(E,F){var G=this,C=G.options.messages[F],D=E.attr(n);
C=l.isFunction(C)?C(E):C;
return l.format(E.attr(l.attr(F+"-msg"))||E.attr("validationMessage")||E.attr("title")||C||"",D,E.attr(F));
},_checkValidity:function(C){var E=this.options.rules,D;
for(D in E){if(!E[D].call(this,C)){return{valid:false,key:D};
}}return{valid:true};
},errors:function(){var E=[],D=this._errors,C;
for(C in D){E.push(D[C]);
}return E;
}});
l.ui.plugin(z);
})(window.kendo.jQuery);
})();
return window.kendo;
},typeof define=="function"&&define.amd?define:function(a,b){b();
});
