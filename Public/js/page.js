 (function() {

     'use strict';

     const Navigation = function (element) {
         
         this.element = element;
         this.trigger = element.getElementsByClassName('navigation-trigger')[0];
         this.mobile = element.getElementsByClassName('navigation-mobile')[0];
         this.links = element.getElementsByClassName('link');
         this.breakpoint = matchMedia('(min-width: 64rem)');
         
         if (this.element.classList.contains('style:menu')) {
             this.styleMenu();
         }

         this.evaluateState = this.evaluateState.bind(this);
         this.openNavigation = this.openNavigation.bind(this);
         this.closeNavigation = this.closeNavigation.bind(this);

         this.initiateListener();
         this.styleMenu();
     };

     Navigation.prototype.initiateListener = function () {

         this.trigger.addEventListener('click', this.evaluateState);
     }
     
     Navigation.prototype.styleMenu = function () {

         for (const link of this.links) {

             if (location.pathname.includes(link.pathname)) {
                 this.toggleState(link);
             }
         }
     }

     Navigation.prototype.toggleState = function (target) {
         target.classList.add('state:active');
     }

     Navigation.prototype.evaluateState = function (event) {

         event.stopPropagation();

         if (!this.mobile.classList.contains('state:attached')) {
             this.openNavigation();

         } else {
             this.closeNavigation(event);
         }
     }

     Navigation.prototype.openNavigation = function () {
         this.mobile.classList.add('state:attached');

         window.addEventListener('keyup', this.closeNavigation);
         window.addEventListener('click', this.closeNavigation);
         this.breakpoint.addEventListener('change', this.closeNavigation);
     }

     Navigation.prototype.closeNavigation = function (event) {

         if (event.type === 'change' && event.matches) {
             this.mobile.classList.remove('state:attached');
         }

         if (event.type === 'keyup' && event.key === 'Escape') {
             this.mobile.classList.remove('state:attached');
         }

         if (event.type === 'click' && event.target === this.trigger) {
             this.mobile.classList.remove('state:attached');
         }

         if(event.type === 'click' && !event.target.closest('.navigation')) {
             this.mobile.classList.remove('state:attached');
         }

         window.removeEventListener('keyup', this.closeNavigation);
         window.removeEventListener('click', this.closeNavigation);
         this.breakpoint.removeEventListener('change', this.closeNavigation);
     }
     
     const navigations= document.getElementsByClassName('navigation');

     for (const navigation of navigations) {
         new Navigation(navigation);
     }

 }());
