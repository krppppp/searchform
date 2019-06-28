(function($){
    var defs = {
        keyword:"",
        tag:"span",
        mark:"highlight",
        caseSensitive:false
    };
    $.fn.findInPage = function(option){
        option = $.extend({},defs,option);
        var tag = option.tag;
        var matchClass = option.mark;
        var keyword = option.keyword;
        var caseSensitive = option.caseSensitive;
        $(this).find('*').addBack().contents().filter(function(){
            if( this.nodeType === 3 ){
                var elm = this;
                var text = elm.nodeValue;
                var cond = "g";
                if(!caseSensitive){
                    cond+= "i";
                }
                text = text.replace(new RegExp('('+keyword+')',cond),'<'+tag+' class="'+ matchClass +'">$1</'+tag+'>');
                $(elm).before($.parseHTML(text));
                $(elm).remove();
            }
        });
    }
})(jQuery);