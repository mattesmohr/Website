(function() {

    'use strict';

    const Navigation = function (element) {

        this.element = element;
        this.links = element.getElementsByClassName('link');

        if (this.element.classList.contains('style:menu')) {
            this.styleMenu();
        }
    };

    Navigation.prototype.styleMenu = function () {

        for (const link of this.links) {

            if (location.pathname.includes(link.pathname)) {
                this.toggleState(link);
            }
        }
    };

    Navigation.prototype.toggleState = function (target) {
        target.classList.add('state:active');
    };

    const navigations= document.getElementsByClassName('navigation');

    for (const navigation of navigations) {
        new Navigation(navigation);
    }

}());

