var $ = (function () {

    'use strict';

    var constructor = function (selector) {
        this.elems = document.querySelectorAll(selector);
    };
    
    /**
     * This function is for
     */
    constructor.prototype.onHover = function (callback) {
        
        this.elems[0].addEventListener("mouseenter", callback);
    };
    
    /**
     * This function is for
     */
    constructor.prototype.onChange = function (callback) {
        
        this.elems[0].addEventListener("change", callback);
    };
    
    /**
     * This function is for
     */
    constructor.prototype.onClick = function (callback) {
        
        this.elems[0].addEventListener("click", callback);
    };
    
    /**
     * This function is for
     */
    constructor.prototype.onTapGesture = function (callback) {
        
        this.elems[0].addEventListener("touchend", callback);
    };
    
    /**
     * This function is for
     */
    constructor.prototype.onLongPressGesture = function (callback) {
        
        this.elems[0].addEventListener("touchstart", callback);
    };
    
    /**
     * This function is for
     */
    constructor.prototype.onDrag = function (callback) {
        
        this.elems[0].addEventListener("drag", callback);
    };
    
    /**
     * This function is for
     */
    constructor.prototype.onDrop = function (callback) {
        
        this.elems[0].addEventListener("drop", callback);
    };
    
    /**
     * This function is for
     */
    constructor.prototype.onFocus = function (callback) {
        
        this.elems[0].addEventListener("focus", callback);
    };
    
    /**
     * This function is for
     */
    constructor.prototype.onSubmit = function (callback) {
        
        this.elems[0].addEventListener("submit", callback);
    };
    
    /**
     * This function is for
     */
    constructor.prototype.show = function() {
        
        this.elems[0].style.display = 'block';
    };
    
    /**
     * This function is for
     */
    constructor.prototype.hide = function() {
        
        this.elems[0].style.display = 'none';
    };
    
    /**
     * This function is for
     */
    constructor.prototype.animate = function({params}, speed) {
        
        this.elems[0].animate({params}, speed);
    };
    
    var instantiate = function (selector) {
        return new constructor(selector);
    };

    return instantiate;

})();
