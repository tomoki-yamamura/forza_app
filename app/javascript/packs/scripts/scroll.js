class ScrollObserver {
    constructor(els, cb, options) {
        this.els = document.querySelectorAll(els);
        const defaultOptions = {
            root: null,
            rootMargin: "0px",
            threshold: 0,
            once: true
        };
        this.cb = cb;
        this.options = Object.assign(defaultOptions, options);
        this.once = this.options.once;
        this._init();
    }
    
    _init() {
        // それぞれの監視対象要素がentries
        const callback = function (entries, observer) {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    this.cb(entry.target, true);
                    if(this.once) {
                        observer.unobserve(entry.target);
                    }
                } else {
                    this.cb(entry.target, false);
                }
            });
        };
        this.io = new IntersectionObserver(callback.bind(this), this.options);
        this.io.POLL_INTERVAL = 100;
        this.els.forEach(el => this.io.observe(el));

    }

    destroy() {
        this.io.disconnect();
    }
}


const add = function(el, inview){
    if(inview) {
        el.classList.add('inview');
    }else {
        el.classList.remove('inview');
    }
};

const header = document.querySelector('header');
const nav = function(el, inview) {
    if(inview) {
        header.classList.remove('triggered');
    } else {
        header.classList.add('triggered');
    }
}


new ScrollObserver('.about-sec-left', add);

new ScrollObserver('.about-img01', add);

new ScrollObserver('.about-img02', add);

new ScrollObserver('.news_cover', add);

new ScrollObserver('.about_m_title', add);

new ScrollObserver('.news_m_title', add);

new ScrollObserver('.contact_m_title', add);

new ScrollObserver('.about_m_img1', add);

new ScrollObserver('.nav-trigger', nav, {once: false});




