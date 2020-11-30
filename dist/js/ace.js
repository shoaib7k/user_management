/*!
  * Ace Admin Template v3.1.1
  * Copyright 2013-2020
  * You need a commercial license to use this product
  * https://bit.ly/35ciMLb
  */
(function (global, factory) {
  typeof exports === 'object' && typeof module !== 'undefined' ? module.exports = factory(require('jquery'), require('bootstrap')) :
  typeof define === 'function' && define.amd ? define(['jquery', 'bootstrap'], factory) :
  (global = typeof globalThis !== 'undefined' ? globalThis : global || self, global.AceApp = factory(global.jQuery, global.bootstrap));
}(this, (function ($, bootstrap) { 'use strict';

  function _interopDefaultLegacy (e) { return e && typeof e === 'object' && 'default' in e ? e : { 'default': e }; }

  var $__default = /*#__PURE__*/_interopDefaultLegacy($);
  var bootstrap__default = /*#__PURE__*/_interopDefaultLegacy(bootstrap);

  function _typeof(obj) {
    "@babel/helpers - typeof";

    if (typeof Symbol === "function" && typeof Symbol.iterator === "symbol") {
      _typeof = function (obj) {
        return typeof obj;
      };
    } else {
      _typeof = function (obj) {
        return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj;
      };
    }

    return _typeof(obj);
  }

  function _classCallCheck(instance, Constructor) {
    if (!(instance instanceof Constructor)) {
      throw new TypeError("Cannot call a class as a function");
    }
  }

  function _defineProperties(target, props) {
    for (var i = 0; i < props.length; i++) {
      var descriptor = props[i];
      descriptor.enumerable = descriptor.enumerable || false;
      descriptor.configurable = true;
      if ("value" in descriptor) descriptor.writable = true;
      Object.defineProperty(target, descriptor.key, descriptor);
    }
  }

  function _createClass(Constructor, protoProps, staticProps) {
    if (protoProps) _defineProperties(Constructor.prototype, protoProps);
    if (staticProps) _defineProperties(Constructor, staticProps);
    return Constructor;
  }

  function _defineProperty(obj, key, value) {
    if (key in obj) {
      Object.defineProperty(obj, key, {
        value: value,
        enumerable: true,
        configurable: true,
        writable: true
      });
    } else {
      obj[key] = value;
    }

    return obj;
  }

  function ownKeys(object, enumerableOnly) {
    var keys = Object.keys(object);

    if (Object.getOwnPropertySymbols) {
      var symbols = Object.getOwnPropertySymbols(object);
      if (enumerableOnly) symbols = symbols.filter(function (sym) {
        return Object.getOwnPropertyDescriptor(object, sym).enumerable;
      });
      keys.push.apply(keys, symbols);
    }

    return keys;
  }

  function _objectSpread2(target) {
    for (var i = 1; i < arguments.length; i++) {
      var source = arguments[i] != null ? arguments[i] : {};

      if (i % 2) {
        ownKeys(Object(source), true).forEach(function (key) {
          _defineProperty(target, key, source[key]);
        });
      } else if (Object.getOwnPropertyDescriptors) {
        Object.defineProperties(target, Object.getOwnPropertyDescriptors(source));
      } else {
        ownKeys(Object(source)).forEach(function (key) {
          Object.defineProperty(target, key, Object.getOwnPropertyDescriptor(source, key));
        });
      }
    }

    return target;
  }

  function _slicedToArray(arr, i) {
    return _arrayWithHoles(arr) || _iterableToArrayLimit(arr, i) || _unsupportedIterableToArray(arr, i) || _nonIterableRest();
  }

  function _toConsumableArray(arr) {
    return _arrayWithoutHoles(arr) || _iterableToArray(arr) || _unsupportedIterableToArray(arr) || _nonIterableSpread();
  }

  function _arrayWithoutHoles(arr) {
    if (Array.isArray(arr)) return _arrayLikeToArray(arr);
  }

  function _arrayWithHoles(arr) {
    if (Array.isArray(arr)) return arr;
  }

  function _iterableToArray(iter) {
    if (typeof Symbol !== "undefined" && Symbol.iterator in Object(iter)) return Array.from(iter);
  }

  function _iterableToArrayLimit(arr, i) {
    if (typeof Symbol === "undefined" || !(Symbol.iterator in Object(arr))) return;
    var _arr = [];
    var _n = true;
    var _d = false;
    var _e = undefined;

    try {
      for (var _i = arr[Symbol.iterator](), _s; !(_n = (_s = _i.next()).done); _n = true) {
        _arr.push(_s.value);

        if (i && _arr.length === i) break;
      }
    } catch (err) {
      _d = true;
      _e = err;
    } finally {
      try {
        if (!_n && _i["return"] != null) _i["return"]();
      } finally {
        if (_d) throw _e;
      }
    }

    return _arr;
  }

  function _unsupportedIterableToArray(o, minLen) {
    if (!o) return;
    if (typeof o === "string") return _arrayLikeToArray(o, minLen);
    var n = Object.prototype.toString.call(o).slice(8, -1);
    if (n === "Object" && o.constructor) n = o.constructor.name;
    if (n === "Map" || n === "Set") return Array.from(o);
    if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray(o, minLen);
  }

  function _arrayLikeToArray(arr, len) {
    if (len == null || len > arr.length) len = arr.length;

    for (var i = 0, arr2 = new Array(len); i < len; i++) arr2[i] = arr[i];

    return arr2;
  }

  function _nonIterableSpread() {
    throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.");
  }

  function _nonIterableRest() {
    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.");
  }

  /**
   * --------------------------------------------------------------------------
   * Ace (v3.1.1): util.js
     Some Utility Functions
  */
  // import $ from 'jquery'
  // import bootstrap from 'bootstrap'
  var Util = /*#__PURE__*/function () {
    function Util() {
      _classCallCheck(this, Util);
    }

    _createClass(Util, null, [{
      key: "isReducedMotion",
      value: function isReducedMotion() {
        return window.matchMedia('(prefers-reduced-motion)').matches;
      }
    }, {
      key: "isRTL",
      value: function isRTL() {
        return document.documentElement.classList.contains('rtl') || document.documentElement.dir === 'rtl';
      }
    }, {
      key: "hasClosest",
      value: function hasClosest() {
        return 'closest' in document.documentElement;
      }
      /**
      static hasTransitionStart () {
        if (Util._supportsTransitionStart !== null) return Util._supportsTransitionStart
          Util._supportsTransitionStart = 'ontransitionstart' in window// doesn't work in Chrome
        if (!Util._supportsTransitionStart) {
          var tmp = $('<div style="opacity: 0; transition: opacity 1ms" />').appendTo(document.body)
          tmp.on('transitionstart', function () {
            Util._supportsTransitionStart = true
          }).on('transitionend', function () {
            tmp.remove()
          })
            tmp.get(0).offsetTop
          tmp.css('opacity', '1')
        }
          return Util._supportsTransitionStart
      }
      */

    }, {
      key: "getScrollbarInfo",
      value: function getScrollbarInfo() {
        var recalc = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : false;
        if (recalc === false && Util._scrollbarInfo !== null) return Util._scrollbarInfo;
        var scrollDiv = document.createElement('div');
        scrollDiv.style.overflow = 'scroll';
        scrollDiv.style.position = 'absolute';
        scrollDiv.style.width = '50px';
        scrollDiv.style.height = '50px';
        var scrollbar = {};
        document.body.appendChild(scrollDiv);
        scrollbar.width = scrollDiv.getBoundingClientRect().width - scrollDiv.clientWidth;
        document.documentElement.style.setProperty('--scrollbar-width', scrollbar.width + 'px');
        var thinWidth = scrollbar.width;

        if (window.CSS) {
          scrollbar.thin = window.CSS.supports('scrollbar-width', 'thin'); // currently only firefox 64+ supports it

          if (scrollbar.thin) {
            scrollDiv.style['scrollbar-width'] = 'thin';
            thinWidth = scrollDiv.getBoundingClientRect().width - scrollDiv.clientWidth;
          }

          scrollbar.overlay = window.CSS.supports('overflow', 'overlay');
        } else {
          scrollbar.thin = false;
          scrollDiv.style.overflow = 'overlay'; // Webkit/Chromium based browsers support it

          scrollbar.overlay = scrollbar.width > 0 && scrollDiv.getBoundingClientRect().width - scrollDiv.clientWidth === 0;
        }

        document.documentElement.style.setProperty('--moz-scrollbar-thin', thinWidth + 'px');
        scrollDiv.style['-ms-overflow-style'] = '-ms-autohiding-scrollbar'; // IE

        scrollbar.autohide = scrollbar.width > 0 && scrollDiv.getBoundingClientRect().width - scrollDiv.clientWidth === 0; /// //////////////////////////////////

        document.body.removeChild(scrollDiv);
        Util._scrollbarInfo = scrollbar;
        return Util._scrollbarInfo;
      }
    }]);

    return Util;
  }();

  Util._supportsTransitionStart = null; // static property

  Util._scrollbarInfo = null; // static property

  var Basic = /*#__PURE__*/function () {
    function Basic() {
      _classCallCheck(this, Basic);
    }

    _createClass(Basic, null, [{
      key: "_HandleBasics",
      value: function _HandleBasics() {
        // for IE
        if (window.NodeList && !window.NodeList.prototype.forEach) {
          window.NodeList.prototype.forEach = Array.prototype.forEach;
        }

        Basic._handleAlerts();

        Basic._handleDropdowns();

        Basic._handleNavbar();

        Basic._handleOther();

        $__default['default'](document.body).addClass('is-document-loaded');
      }
      /**
       * collapse .alert instead of fading it out
      */

    }, {
      key: "_handleAlerts",
      value: function _handleAlerts() {
        $__default['default'](document).on('close.bs.alert.alert-collapse', '.alert.alert-collapse', function (e) {
          e.preventDefault();
          $__default['default'](this).wrap('<div class="collapse show alert-collapse"></div>').parent().collapse('hide').one('hidden.bs.collapse.alert-collapse', function () {
            $__default['default'](this).remove();
          });
        });
      } /// ////////

    }, {
      key: "_handleDropdowns",
      value: function _handleDropdowns() {
        // dismiss (hide) a dropdown menu
        var _dismissDropdown = function _dismissDropdown() {
          var menu = $__default['default'](this).closest('.dropdown-menu');
          var dropdown = menu.parent();
          var toggle = dropdown.find('[data-toggle=dropdown]');
          toggle.dropdown('hide');
          menu.removeClass('show');
          dropdown.removeClass('show');
        }; // hide dropdown when clicked on an element inside it with `data-dismiss=dropdown` attribute


        $__default['default'](document).on('click', '[data-dismiss=dropdown]', function (e) {
          e.preventDefault();

          _dismissDropdown.call(e.target);
        }); // hide dropdown when a `form` inside it is submitted

        $__default['default'](document).on('submit', '.dropdown-menu form[data-submit=dismiss]', function (e) {
          e.preventDefault();

          _dismissDropdown.call(e.target);
        }); // don't hide dropdown when clicked inside a `.dropdown-clickable` element

        $__default['default'](document).on('click.dropdown-clickable', '.dropdown-clickable', function (e) {
          e.stopImmediatePropagation();
        }); // hide `body` scrollbars when dropdowns are opened in mobile view

        $__default['default'](document).on('shown.bs.dropdown', '.dropdown.dd-backdrop', function () {
          // check `display` of .dropdown::before, if not visible it means `backdrop` is not visible (applied)
          if (window.getComputedStyle(this, ':before').display === 'none') return; // the device width is such that backdrop is visible (.dropdown-inner is visible)

          var scrollbarInfo = Util.getScrollbarInfo();

          if (scrollbarInfo.width === 0) {
            document.body.classList.add('mob-dropdown-body');
          }

          this.classList.add('backdrop-shown'); // used later to add `.navbar-modal` class to .navbar

          $__default['default'](this).one('hidden.bs.dropdown', function () {
            document.body.classList.remove('mob-dropdown-body');
            this.classList.remove('backdrop-shown');
          });
        });
      } /// ////////

    }, {
      key: "_handleNavbar",
      value: function _handleNavbar() {
        // hide `.navbar-collapse` when clicked on it (specifically on the backdrop in mobile view)
        $__default['default'](document).on('click', '.navbar-backdrop.collapse.show', function (e) {
          if (e.target === this) $__default['default'](this).collapse('hide');
        }); // hide dropdown when a `form` inside it is submitted

        $__default['default'](document).on('submit', '.navbar-collapse.show form[data-submit=dismiss]', function (e) {
          e.preventDefault();
          $__default['default'](this).closest('.navbar-collapse').collapse('hide');
        }); // when navbar or a dropdown-menu inside it is displayed, move focus to the ".autofocus" element.
        // For example a search box can be .autofocus

        $__default['default'](document).on('shown.bs.dropdown', '.navbar .dropdown', function () {
          $__default['default'](this).find('.autofocus').focus();
        }).on('shown.bs.collapse', '.navbar-collapse', function () {
          $__default['default'](this).find('.autofocus').focus(); // also hide body scrollbars in mobile devices

          if (this.classList.contains('navbar-backdrop')) {
            var scrollbarInfo = Util.getScrollbarInfo();

            if (scrollbarInfo.width === 0) {
              document.body.classList.add('mob-navbar-body');
            }
          }
        }).on('hidden.bs.collapse', function () {
          document.body.classList.remove('mob-navbar-body');
        }).on('show.bs.collapse', function () {
          // hide other 'shown/open' ones
          $__default['default']('.navbar-collapse.show').css('transition-duration', '1ms').collapse('hide').css('transition-duration', '');
        }); // if navbar dropdowns are not entirely inside window area, move them accordingly

        var _adjustDropdown = function _adjustDropdown() {
          var isRTL = Util.isRTL();
          var isRightAligned = this.classList.contains('dropdown-menu-right');

          var _dir = !isRightAligned ? !isRTL ? 'left' : 'right' : !isRTL ? 'right' : 'left';

          var prop = 'margin-' + _dir;
          this.style.removeProperty(prop);
          var moveBy = 0;
          var rect = this.getBoundingClientRect();

          if (rect.left < 0) {
            moveBy = parseInt(-1 * rect.left) + 5;
          } else {
            var sw = document.body.scrollWidth;

            if (rect.right > sw) {
              moveBy = parseInt(sw - rect.right - 5);
            }
          }

          if (moveBy < 5) return;
          if (isRightAligned) moveBy *= -1;
          this.style.setProperty(prop, moveBy + 'px', 'important');
        };

        var _closest = ('closest' in document.documentElement);

        $__default['default'](document).on('transitionstart.adjust', '.navbar .dropdown-mega .dropdown-menu', function (ev) {
          if (ev.target !== this || ev.originalEvent.propertyName !== 'transform') return;

          _adjustDropdown.call(this);
        }).on('shown.bs.dropdown', '.navbar .dropdown', function () {
          if (this.classList.contains('dropdown-mega')) {
            var dropdown = this.querySelector('.dropdown-menu[data-display="static"]');
            if (dropdown !== null) _adjustDropdown.call(dropdown);
          } // when a .dropdown is opened, add .navbar-open to increase z-index, so that dropdowns go above 'asides', etc


          if (_closest) {
            var navbar = this.closest('.navbar');
            if (this.classList.contains('backdrop-shown')) navbar.classList.add('navbar-modal');else navbar.classList.add('navbar-open');
          }
        }).on('hidden.bs.dropdown', '.navbar .dropdown', function () {
          if (_closest) {
            var navbar = this.closest('.navbar');
            navbar.classList.remove('navbar-open');
            navbar.classList.remove('navbar-modal');
          }
        });
      } /// ////////

    }, {
      key: "_handleOther",
      value: function _handleOther() {
        document.querySelectorAll('.input-floating-label input').forEach(function (inp) {
          if (inp.value !== '') inp.classList.add('has-content');else inp.classList.remove('has-content');
        });
        document.addEventListener('focusout', function (ev) {
          var inp = ev.target;

          if ('matches' in inp) {
            if (!inp.matches('.input-floating-label input')) return;
          } else if ('msMatchesSelector' in inp && !inp.msMatchesSelector('.input-floating-label input')) return;

          if (inp.value !== '') inp.classList.add('has-content');else inp.classList.remove('has-content');
        });
      }
    }]);

    return Basic;
  }();
  /**
   * ------------------------------------------------------------------------
   * jQuery
   * ------------------------------------------------------------------------
  */


  if (typeof $__default['default'] !== 'undefined') {
    Basic._HandleBasics();
  }

  /**
   * ------------------------------------------------------------------------
   * Constants
   * ------------------------------------------------------------------------
   */

  var NAME = 'aceScroll';
  var VERSION = '3.1.1';
  var DATA_KEY = 'ace.scroll';
  var EVENT_KEY = ".".concat(DATA_KEY);
  var DATA_API_KEY = '.data-api';
  var Event = {
    LOAD_DATA_API: "load".concat(EVENT_KEY).concat(DATA_API_KEY)
  };
  var Selector = {
    ACE_SCROLL: '[ace-scroll]',
    DATA_ACE_SCROLL: '[data-ace-scroll]'
  };
  var DefaultType = {
    type: 'string',
    smooth: 'boolean',
    height: '(number|null)',
    lock: 'boolean',
    ignore: '(string|null)',
    plugin: 'string',
    options: '(object|null)',
    // plugin settings
    color: '(string|null)',
    autohide: '(boolean|null)'
  };
  var Default = {
    type: 'native',
    smooth: false,
    height: null,
    lock: false,
    ignore: null,
    plugin: 'SimpleBar',
    options: null,
    color: null,
    autohide: true
  };

  var Scrollbar = /*#__PURE__*/function () {
    function Scrollbar(element, config) {
      _classCallCheck(this, Scrollbar);

      this._element = element;
      this._config = this._getConfig(config);
      this._scrollbarInfo = Util.getScrollbarInfo();
      this.enableScrollbars();
    }

    _createClass(Scrollbar, [{
      key: "enableScrollbars",
      value: function enableScrollbars() {
        /**
        this._element.scrollTop = 0
        // For firefox. Because it has persistent scroll position on page reload
        // which doesn't look good when changing overflow: hidden to overflow: scroll on hover
        */
        // no scrollbars when specified
        if (this._config.ignore !== null) {
          if (this._config.ignore === 'mobile' && this._scrollbarInfo.width === 0 && 'ontouchstart' in window && window.matchMedia('(max-width: 840px)').matches) return;else if (this._config.ignore === 'desktop' && this._scrollbarInfo.width > 0) return;
        }

        this.update(this._config.height);
        this.lock(this._config.lock);

        this._element.classList.remove('ace-scroll', 'ace-scroll-mob', 'ace-scroll-wrap');

        if (this._config.type === 'native') {
          this._addNativeScrolls();
        } else if (this._config.type === 'auto') {
          this._preferNativeScrolls();
        } else if (this._config.type === 'plugin') {
          this._addPluginScrolls();
        }
      }
    }, {
      key: "update",
      value: function update(_height) {
        if (!_height) return;
        if (!isNaN(_height)) _height += 'px';
        this._element.style.maxHeight = _height;
      }
    }, {
      key: "lock",
      value: function lock(_lock) {
        if (_lock) this._element.classList.add('ace-scroll-lock');else this._element.classList.remove('ace-scroll-lock');
      }
    }, {
      key: "_addNativeScrolls",
      value: function _addNativeScrolls(smooth) {
        if (this._scrollbarInfo.width === 0) this._element.classList.add('ace-scroll-mob'); // mobile device
        else {
            this._element.classList.add('ace-scroll');

            if (this._config.color !== null) this._element.classList.add('ace-scroll-' + this._config.color);
            if (this._config.autohide === false) this._element.classList.add('is-always-on');

            var _smooth = typeof smooth !== 'undefined' ? smooth : this._config.smooth;

            if (_smooth) {
              // wrap children inside an .ace-scroll-inner
              var wrapper = document.createElement('div');
              wrapper.classList.add('ace-scroll-inner');
              wrapper.style.color = window.getComputedStyle(this._element).color;

              while (this._element.firstChild) {
                wrapper.appendChild(this._element.firstChild);
              }

              this._element.appendChild(wrapper); /// ///////
              // disable the initial transition effects


              this._element.style.transition = 'none';

              this._element.classList.add('ace-scroll-wrap');

              this._element.offsetHeight; // reflow

              this._element.style.transition = '';
            }
          }
      }
    }, {
      key: "_preferNativeScrolls",
      value: function _preferNativeScrolls() {
        if (this._scrollbarInfo.width === 0 || this._scrollbarInfo.overlay || this._scrollbarInfo.thin || !this._hasScrollbarPlugin()) {
          this._addNativeScrolls();
        } else {
          this._addPluginScrolls();
        }
      }
    }, {
      key: "_addPluginScrolls",
      value: function _addPluginScrolls() {
        if (this._hasScrollbarPlugin()) {
          return new window[this._config.plugin](this._element, this._config.options);
        } else {
          this._addNativeScrolls();
        }
      }
    }, {
      key: "_hasScrollbarPlugin",
      value: function _hasScrollbarPlugin() {
        return !!window[this._config.plugin];
      }
    }, {
      key: "_getConfig",
      value: function _getConfig(config) {
        config = _objectSpread2(_objectSpread2({}, Default), _typeof(config) === 'object' && config ? config : {});

        if (typeof bootstrap__default['default'] !== 'undefined') {
          bootstrap__default['default'].Util.typeCheckConfig(NAME, config, this.constructor.DefaultType);
        }

        return config;
      } // Static methods

    }], [{
      key: "_jQueryInterface",
      value: function _jQueryInterface(config) {
        return this.each(function () {
          var $this = $__default['default'](this);
          var data = $this.data(DATA_KEY);
          var options = this.getAttribute('ace-scroll') || this.getAttribute('data-ace-scroll') || {};
          if (!isNaN(options)) options = {
            height: parseInt(options)
          };else if (options.length > 1) {
            try {
              options = JSON.parse(options);
            } catch (e) {}
          }

          var _config = _objectSpread2(_objectSpread2(_objectSpread2(_objectSpread2({}, Default), $this.data()), _typeof(config) === 'object' && config ? config : {}), _typeof(options) === 'object' && options ? options : {});

          if (!data) {
            data = new Scrollbar(this, _config);
            $this.data(DATA_KEY, data);
          }

          if (typeof config === 'string') {
            if (typeof data[config] === 'undefined') {
              throw new TypeError("No method named \"".concat(config, "\""));
            }

            data[config]();
          }
        });
      }
    }, {
      key: "VERSION",
      get: function get() {
        return VERSION;
      }
    }, {
      key: "DefaultType",
      get: function get() {
        return DefaultType;
      }
    }, {
      key: "Default",
      get: function get() {
        return Default;
      }
    }]);

    return Scrollbar;
  }();
  /**
   * ------------------------------------------------------------------------
   * Data Api implementation
   * ------------------------------------------------------------------------
  */


  $__default['default'](window).on(Event.LOAD_DATA_API, function () {
    var scrollbars = [].slice.call(document.querySelectorAll(Selector.ACE_SCROLL)).concat([].slice.call(document.querySelectorAll(Selector.DATA_ACE_SCROLL)));

    for (var i = 0; i < scrollbars.length; i++) {
      var $scrollbars = $__default['default'](scrollbars[i]);

      Scrollbar._jQueryInterface.call($scrollbars, $scrollbars.data());
    }
  });
  /**
   * ------------------------------------------------------------------------
   * jQuery
   * ------------------------------------------------------------------------
  */

  if (typeof $__default['default'] !== 'undefined') {
    var JQUERY_NO_CONFLICT = $__default['default'].fn[NAME];
    $__default['default'].fn[NAME] = Scrollbar._jQueryInterface;
    $__default['default'].fn[NAME].Constructor = Scrollbar;

    $__default['default'].fn[NAME].noConflict = function () {
      $__default['default'].fn[NAME] = JQUERY_NO_CONFLICT;
      return Scrollbar._jQueryInterface;
    };
  }

  /**
   * ------------------------------------------------------------------------
   * Constants
   * ------------------------------------------------------------------------
   */

  var NAME$1 = 'aceSidebar';
  var VERSION$1 = '3.1.1';
  var DATA_KEY$1 = 'ace.sidebar';
  var EVENT_KEY$1 = ".".concat(DATA_KEY$1);
  var DATA_API_KEY$1 = '.data-api';
  var Event$1 = {
    SHOW: "show".concat(EVENT_KEY$1),
    HIDE: "hide".concat(EVENT_KEY$1),
    COLLAPSE: "collapse".concat(EVENT_KEY$1),
    EXPAND: "expand".concat(EVENT_KEY$1),
    SHOWN: "shown".concat(EVENT_KEY$1),
    HIDDEN: "hidden".concat(EVENT_KEY$1),
    COLLAPSED: "collapsed".concat(EVENT_KEY$1),
    EXPANDED: "expanded".concat(EVENT_KEY$1),
    LOAD_DATA_API: "load".concat(EVENT_KEY$1).concat(DATA_API_KEY$1),
    CLICK_DATA_API: "click".concat(EVENT_KEY$1).concat(DATA_API_KEY$1)
  };
  var Selector$1 = {
    SIDEBAR: '.sidebar',
    DATA_TOGGLE: '[data-toggle="sidebar"]',
    DATA_TOGGLE_MOBILE: '[data-toggle-mobile="sidebar"]'
  };
  var DefaultType$1 = {
    swipe: 'boolean',
    dismiss: 'boolean',
    backdrop: 'boolean',
    gotoactive: 'boolean',
    subscroll: 'boolean',
    pullup: 'boolean'
  };
  var Default$1 = {
    swipe: false,
    dismiss: false,
    backdrop: false,
    gotoactive: false,
    subscroll: true,
    pullup: false
  };
  var ClassName = {
    DESKTOP_HIDE: 'collapsed',
    MOBILE_SHOW: 'sidebar-visible',
    COLLAPSED: 'collapsed',
    TOGGLING: 'toggling',
    INNER_HOVER: 'is-hover',
    BACKDROP: 'sidebar-backdrop',
    HORIZONTAL: 'sidebar-h'
  };
  /**
   * ------------------------------------------------------------------------
   * Class Definition
   * ------------------------------------------------------------------------
   */

  var Sidebar = /*#__PURE__*/function () {
    function Sidebar(element, config) {
      var _this = this;

      _classCallCheck(this, Sidebar);

      this._hasTransitionEvent = false;
      this._hasTransitionEvent2 = false;
      this._isTransitioning = false;
      this._sidebar = element;
      this._sidebar.offsetHeight; // force reflow, so that if we instantly call 'collapse' or 'expand', transition effect takes place

      this._sidebar.classList.add('sidebar');

      this._inner = this._sidebar.querySelector('.sidebar-inner');
      this._config = this._getConfig(config);
      this._scroller = this._sidebar.querySelector('[class*="ace-scroll"]');
      if (this._sidebar.querySelector('.submenu.show') !== null) this._sidebar.classList.add('has-open');
      this._pullupEnabled = false;
      this._triggerArray = [].slice.call(document.querySelectorAll("[data-toggle=\"sidebar\"][href=\"#".concat(element.id, "\"],") + "[data-toggle=\"sidebar\"][data-target=\"#".concat(element.id, "\"]")));
      this._triggerArrayMobile = [].slice.call(document.querySelectorAll("[data-toggle-mobile=\"sidebar\"][href=\"#".concat(element.id, "\"],") + "[data-toggle-mobile=\"sidebar\"][data-target=\"#".concat(element.id, "\"]")));
      this._horizontal = this._sidebar.classList.contains(ClassName.HORIZONTAL);
      this._desktopCollapsedClass = this._triggerArray.length > 0 ? this._triggerArray[0].getAttribute('data-toggle-class') || ClassName.DESKTOP_HIDE : ClassName.DESKTOP_HIDE; //

      this._collapsed = this._sidebar.classList.contains(this._desktopCollapsedClass);
      $__default['default'](this._inner).on('focus', 'input', function (e) {
        if (!_this._collapsed) return;

        _this._inner.classList.add('has-focus');

        $__default['default'](e.target).one('blur', function () {
          _this._inner.classList.remove('has-focus');
        });
      }); //

      this._handleTriggerEvents();

      this.enableSubmenuToggle();
      if (this._config.pullup) this.enableSubmenuPullup();
      if (this._config.gotoactive) this.scrollToActive();

      if (this._config.backdrop) {
        this._sidebar.classList.add(ClassName.BACKDROP);
      } else if (this._sidebar.classList.contains(ClassName.BACKDROP)) {
        this._config.backdrop = true;
      }

      if (!this._horizontal && this._collapsed) {
        this._addTransitionEvent();
      }
    } // Getters


    _createClass(Sidebar, [{
      key: "_handleTriggerEvents",
      value: function _handleTriggerEvents() {
        var This = this;
        $__default['default'](this._triggerArray).on('click', function () {
          This.toggle(this);
        });
        $__default['default'](this._triggerArrayMobile).on('click', function () {
          This.toggleMobile(this);
        });
      }
    }, {
      key: "toggle",
      value: function toggle() {
        var btn = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : null;

        if (this._sidebar.classList.contains(this._desktopCollapsedClass)) {
          this.expand(btn);
        } else {
          this.collapse(btn);
        }
      }
    }, {
      key: "toggleMobile",
      value: function toggleMobile() {
        var btn = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : null;

        if (!this._sidebar.classList.contains(ClassName.MOBILE_SHOW)) {
          this.show(btn);
        } else {
          this.hide(btn);
        }
      } /// ////

    }, {
      key: "expand",
      value: function expand() {
        if (!this._hasTransitionEvent) this._addTransitionEvent();
        if (this._isTransitioning) return;
        var ev = new $__default['default'].Event(Event$1.EXPAND);
        $__default['default'](this._sidebar).trigger(ev);
        if (ev.isDefaultPrevented()) return;
        this._isTransitioning = true;

        this._sidebar.classList.add(ClassName.TOGGLING);

        this._sidebar.classList.remove(this._desktopCollapsedClass);

        this._updateTriggerBtns(this._triggerArray, true);

        this._collapsed = false;
        if (Util.isReducedMotion() || this._horizontal) this._toggleCompleted(); // call completion now
        //

        if (this._pullupEnabled) this._resetPullUp(); // this._inner.classList.remove(ClassName.INNER_HOVER)//we'll remove it in _toggleCompleted
      }
    }, {
      key: "collapse",
      value: function collapse() {
        var btn = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : null;
        if (!this._hasTransitionEvent) this._addTransitionEvent();
        if (this._isTransitioning) return;
        var ev = new $__default['default'].Event(Event$1.COLLAPSE);
        $__default['default'](this._sidebar).trigger(ev);
        if (ev.isDefaultPrevented()) return;
        this._isTransitioning = true;

        this._sidebar.classList.add(ClassName.TOGGLING);

        this._sidebar.classList.add(this._desktopCollapsedClass);

        this._updateTriggerBtns(this._triggerArray, false);

        this._collapsed = true;
        if (Util.isReducedMotion() || this._horizontal) this._toggleCompleted(); // call completion now
        //

        if (this._pullupEnabled) this._resetPullUp(); // if the triggering button is inside sidebar and we want it to remain expaned (.let-expanded), add .is-hover class as well

        if (btn !== null && this._sidebar.classList.contains('expandable') && this._sidebar.classList.contains('let-expanded') && this._inner.contains(btn)) {
          this._inner.classList.add(ClassName.INNER_HOVER);
        }
      }
    }, {
      key: "show",
      value: function show() {
        var _this2 = this;
        if (!this._hasTransitionEvent2) this._addTransitionEvent2();
        var ev = new $__default['default'].Event(Event$1.SHOW);
        $__default['default'](this._sidebar).trigger(ev);
        if (ev.isDefaultPrevented()) return;

        this._sidebar.classList.add(ClassName.MOBILE_SHOW);

        this._updateTriggerBtns(this._triggerArrayMobile, true); // hide sidebar if clicked outside of it


        if (this._config.dismiss) {
          $__default['default'](this._triggerArrayMobile).css('pointer-events', 'none'); // disable this button, because if we click on it, it will hide and then instantly show the sidebar again

          $__default['default'](document).on('mouseup.sidebar-dismiss', function (e) {
            if (!$__default['default'].contains(_this2._sidebar, e.target)) {
              // if clicked outside sidebar
              _this2.hide();
            }
          });
        }

        if (this._config.swipe) this.enableSwipeHide();
        if (Util.isReducedMotion()) this._toggleMobileCompleted(); // call completion now
        // in some webkit mobile browsers, sidebar scrolling works but scrollbars are not visible, unless something like this forces it to become visible

        if (this._scroller && !this._scroller.classList.contains('overflow-hidden')) {
          this._scroller.classList.add('overflow-hidden');

          this._scroller.offsetHeight; // force redraw

          this._scroller.classList.remove('overflow-hidden');
        } // hide body scrollbars
        // if sidebar is fixed and has backdrop or is .sidebar-push


        var scrollbarInfo = Util.getScrollbarInfo();

        if (scrollbarInfo.width === 0 && this._sidebar.classList.contains('sidebar-fixed') && (this._config.backdrop || this._sidebar.classList.contains('sidebar-push'))) {
          document.body.classList.add('mob-sidebar-body');
        }
      }
    }, {
      key: "hide",
      value: function hide() {
        if (!this._hasTransitionEvent2) this._addTransitionEvent2();
        var ev = new $__default['default'].Event(Event$1.HIDE);
        $__default['default'](this._sidebar).trigger(ev);
        if (ev.isDefaultPrevented()) return;

        this._sidebar.classList.remove(ClassName.MOBILE_SHOW);

        this._updateTriggerBtns(this._triggerArrayMobile, false); // document.body.classList.remove('mob-sidebar-body') // moved to `_toggleMobileCompleted`


        if (this._config.dismiss) {
          $__default['default'](this._triggerArrayMobile).css('pointer-events', '');
          $__default['default'](document).off('.sidebar-dismiss');
        }

        if (this._config.swipe) {
          $__default['default'](document).off('.sidebar-swipe');
        }

        if (Util.isReducedMotion()) this._toggleMobileCompleted(); // call completion now
      }
    }, {
      key: "_updateTriggerBtns",
      value: function _updateTriggerBtns(btns) {
        var expanded = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : false;

        for (var i = 0, len = btns.length; i < len; i++) {
          if (expanded) btns[i].classList.remove(ClassName.COLLAPSED);else btns[i].classList.add(ClassName.COLLAPSED);
          btns[i].setAttribute('aria-expanded', expanded);
        }
      }
    }, {
      key: "_toggleCompleted",
      value: function _toggleCompleted() {
        this._isTransitioning = false;

        this._sidebar.classList.remove(ClassName.TOGGLING);

        var expanded = !this._sidebar.classList.contains(this._desktopCollapsedClass);
        if (expanded) $__default['default'](this._sidebar).trigger(Event$1.EXPANDED);else $__default['default'](this._sidebar).trigger(Event$1.COLLAPSED);
        if (expanded) this._inner.classList.remove(ClassName.INNER_HOVER);
      }
    }, {
      key: "_toggleMobileCompleted",
      value: function _toggleMobileCompleted() {
        var shown = this._sidebar.classList.contains(ClassName.MOBILE_SHOW);

        if (shown) $__default['default'](this._sidebar).trigger(Event$1.SHOWN);else {
          document.body.classList.remove('mob-sidebar-body');

          if (this._config.swipe) {
            document.body.classList.remove('mob-sidebarswipe-body');
          }

          $__default['default'](this._sidebar).trigger(Event$1.HIDDEN);
        }
      }
    }, {
      key: "_addTransitionEvent",
      value: function _addTransitionEvent() {
        var _this3 = this;

        if (this._hasTransitionEvent) return;
        this._hasTransitionEvent = true;
        var counter = 0;
        $__default['default'](this._sidebar).on('transitionend', function (e) {
          if (e.target !== _this3._sidebar) return; // make sure its not the children triggerring the event!

          _this3._toggleCompleted();

          counter = 0;
        }); // add 'is-hover' class to '.sidebar-inner' when it becomes expanded (i.e. when mouse hovers it)

        $__default['default'](this._inner).on('transitionstart', function (e) {
          // skip on mobile (in which propertyName is `transform`)
          if (e.target !== _this3._inner || _this3._isTransitioning || e.originalEvent && e.originalEvent.propertyName !== 'width') return;
          counter++;
          if (counter === 1) _this3._inner.classList.add(ClassName.INNER_HOVER); // else if (counter >= 2) {
          //  this.classList.remove(ClassName.INNER_HOVER)
          //  counter = 0
          // }
        }).on('transitionend', function (e) {
          // skip `transitionend` on mobile (in which propertyName is `transform`)
          if (e.target !== _this3._inner || e.originalEvent && e.originalEvent.propertyName !== 'width') return;

          if (_this3._inner.clientWidth < 120) {
            // just to make sure we remove the extra class name when not needed
            _this3._inner.classList.remove(ClassName.INNER_HOVER);

            counter = 0; // blur input element

            if (document.activeElement.tagName === 'INPUT' && _this3._inner.contains(document.activeElement)) document.activeElement.blur();
          }
        });
      }
    }, {
      key: "_addTransitionEvent2",
      value: function _addTransitionEvent2() {
        var _this4 = this;

        if (this._hasTransitionEvent2) return;
        this._hasTransitionEvent2 = true;
        $__default['default'](this._inner).on('transitionend', function (e) {
          if (e.target !== _this4._inner || e.originalEvent && e.originalEvent.propertyName !== 'transform') return;

          _this4._toggleMobileCompleted();
        });
      }
    }, {
      key: "enableSwipeHide",
      value: function enableSwipeHide() {
        var _this5 = this;

        // swipe to hide sidebar
        var x1 = 0;
        var y1 = 0;
        var swipeDir = 0;
        var isRTL = false;
        var lastX = 0;
        var pushContent = false;
        var sidebarWidth = 0;

        var touchMoveCallback = function touchMoveCallback(ev) {
          var touches = ev.changedTouches[0] || null;
          if (!touches) return;
          var newX = touches.pageX;
          var newY = touches.pageY;
          lastX = newX;

          if (swipeDir === 0) {
            var diffY = Math.abs(y1 - newY);
            var diffX = Math.abs(x1 - newX);

            if (diffY > diffX) {
              swipeDir = 2; // vertical i.e. scroll

              if (this._scroller) this._scroller.classList.remove('overflow-hidden');
              document.body.classList.remove('mob-sidebarswipe-body');
              $__default['default'](document).off('touchmove.sidebar-swipe');
            } else if (diffX > 10) {
              swipeDir = 1; // horizontal swipe

              this._inner.setAttribute('style', 'transition: none !important; touch-action: none;');

              if (this._scroller) this._scroller.classList.add('overflow-hidden');
              document.body.classList.add('mob-sidebarswipe-body');
            }
          }

          if (swipeDir !== 1) return;
          var moveX = parseInt(x1 - newX);

          if (!isRTL && moveX > 0 || isRTL && moveX < 0) {
            // move it outside of view
            this._inner.style.transform = 'translateX(' + -1 * moveX + 'px)';
            if (pushContent) this._sidebar.style.width = sidebarWidth - (moveX > 0 ? moveX : -1 * moveX) + 'px';
          } else {
            this._inner.style.transform = '';
            if (pushContent) this._sidebar.style.width = '';
          }
        };

        var t1 = 0;
        $__default['default'](document).on('touchstart.sidebar-swipe', function (e) {
          var touches = e.originalEvent.changedTouches[0] || null;
          if (!touches) return;
          x1 = touches.pageX;
          y1 = touches.pageY;
          t1 = Date.now();
          isRTL = Util.isRTL();
          pushContent = _this5._sidebar.classList.contains('sidebar-push');

          if (pushContent) {
            sidebarWidth = _this5._sidebar.offsetWidth;
            _this5._sidebar.style.minWidth = 'auto';
            _this5._sidebar.style.transition = 'none';
          }

          $__default['default'](document).on('touchmove.sidebar-swipe', function (e) {
            touchMoveCallback.call(_this5, e.originalEvent);
          });
        }).on('touchend.sidebar-swipe touchcancel.sidebar-swipe', function (e) {
          var touches = e.originalEvent.changedTouches[0] || null; // if (!touches) return // in case we're coming from a `dismiss` mouseup event

          _this5._inner.setAttribute('style', '');

          if (pushContent) {
            _this5._sidebar.style.width = '';
            _this5._sidebar.style.minWidth = '';
            _this5._sidebar.style.transition = '';
          }

          var x2 = touches !== null ? touches.pageX : lastX;
          var t2 = Date.now();

          if (swipeDir === 1 && ( // dismiss if moved by more than 100px or moved more than 40px in a short time (less than 300ms)
          !isRTL && (x1 - x2 > 100 || x1 - x2 > 40 && t2 - t1 < 300) || isRTL && (x1 - x2 < -100 || x1 - x2 < -40 && t2 - t1 < 300))) {
            // if moved more than 100px or 40px in less than 300ms
            _this5.hide();
          } else {
            // remove '.mob-sidebarswipe-body' to bring back body scrollbars if sidebar isn't swiped to hide
            // but we probably won't have body scrollbars because of `.mob-sidebar-body`
            document.body.classList.remove('mob-sidebarswipe-body');
          } // bring back sidebar scrollbars


          if (_this5._scroller) _this5._scroller.classList.remove('overflow-hidden');
          swipeDir = 0;
        });
      }
    }, {
      key: "enableSubmenuToggle",
      value: function enableSubmenuToggle() {
        var _firefox = ('MozAppearance' in document.documentElement.style);

        var _scrollIntoViewOptions = ('scrollBehavior' in document.documentElement.style);

        var isOpening = false;
        var This = this;
        $__default['default'](this._sidebar).on('click', '.dropdown-toggle', function (ev) {
          ev.preventDefault();
          if (isOpening) return;
          var navItem = $__default['default'](this).closest('.nav-item'); // get the parent LI.nav-item

          var subMenu = navItem.find('> .submenu').eq(0); // get the direct submenu (not the children)

          var navLink = navItem.find('> .nav-link').eq(0); // get the parent LI.nav-item

          var subPos = null;

          if (This._collapsed && This._sidebar.classList.contains('hoverable') || This._sidebar.classList.contains('sidebar-hover')) {
            // don't toggle submenu if submenu is supposed to be displayed as popup (this includes horizontal sidebar when it's `.sidebar-hover`)
            subPos = window.getComputedStyle(subMenu.get(0)).position;
            if (subPos === 'absolute') return;
          }

          if (subMenu.hasClass('collapsing')) return; // don't toggle in the middle of toggling
          // hide sibling submenus

          navItem.addClass('is-toggling');
          navItem.parent().find('> .nav-item.open').addClass('is-toggling').not(navItem).removeClass('open').find('> .submenu.show').collapse('hide'); // toggle submenu

          if (navItem.hasClass('open')) {
            navItem.removeClass('open');
            navLink.addClass('collapsed');

            This._sidebar.classList.remove('has-open');

            subMenu.collapse('hide');
          } else {
            isOpening = true;
            navItem.addClass('open');
            navLink.removeClass('collapsed');

            This._sidebar.classList.add('has-open');

            subMenu.collapse('show');
          }

          if (!subMenu.data('has-event')) {
            subMenu.data('has-event', true).on('shown.bs.collapse.is-toggling hidden.bs.collapse.is-toggling', function () {
              isOpening = false;
              $__default['default'](This._sidebar).find('.is-toggling').removeClass('is-toggling'); // firefox continues to disable scroll chaining when sidebar is not scrollable anymore, so a little fix around here

              if (_firefox) {
                if (This._scroller === null) return;

                if (This._scroller.scrollHeight <= This._scroller.clientHeight) {
                  This._scroller.style.overscrollBehavior = 'auto';
                } else This._scroller.style.overscrollBehavior = '';
              }
            });
          } // scroll submenu into view (only on modern browsers)


          if (!Util.isReducedMotion() && _scrollIntoViewOptions && This._config.subscroll && This._sidebar.classList.contains('sidebar-fixed') && navItem.hasClass('open')) {
            if (This._sidebar.classList.contains(ClassName.HORIZONTAL)) {
              subPos = window.getComputedStyle(subMenu.get(0)).position;
              if (subPos === 'absolute') return; // no scroll for desktop horizontal menu (when it's not `.sidebar-hover`)
            }

            var smooth = !Util.isReducedMotion();
            setTimeout(function () {
              try {
                if (_scrollIntoViewOptions) {
                  subMenu.get(0).scrollIntoView({
                    behavior: smooth ? 'smooth' : 'auto',
                    block: 'nearest'
                  });
                } else {// subMenu.get(0).scrollIntoView(false)
                }
              } catch (err) {}
            }, smooth ? 150 : 0);
          }
        });
      }
    }, {
      key: "enableSubmenuPullup",
      value: function enableSubmenuPullup() {
        if (this._pullupEnabled) return;
        this._pullupEnabled = true;
        var marginProp = 'margin-' + (!Util.isRTL() ? 'left' : 'right');
        var This = this;
        $__default['default'](this._sidebar).on('transitionstart', '.submenu', function (ev) {
          if (ev.target !== this || ev.originalEvent.propertyName !== marginProp || !(This._collapsed || This._sidebar.classList.contains('sidebar-hover'))) return;
          var navItem = $__default['default'](this).parent();
          var submenu = $__default['default'](this);
          var navtxt = navItem.find('> .nav-link > .nav-text.fadeable'); // only first level nav-text items

          navItem.removeClass('submenu-pullup');
          submenu.css('transform', '');
          navtxt.css('transform', ''); /// ///////////////////////

          var rect = submenu.get(0).getBoundingClientRect();
          var wh = $__default['default'](window).height();
          var diff = parseInt(rect.bottom - wh);

          if (diff > 0) {
            // if submenu bottom is below window area
            // check to see if submenu top will go out of window if we move it up by "diff" pixels
            // also consider that the first level item's .nav-text shouldn't go out of window's top
            var navtxtHeight = navtxt.height() || 0;
            var diff2 = rect.top - navtxtHeight - diff - $__default['default']('.navbar').height(); // don't go above navbar

            if (diff2 < 0) diff = diff + diff2;
            diff = parseInt(diff) + 1; // so that submenu's border is visible

            if (This._collapsed) {
              if (navtxtHeight && diff > navtxtHeight / 2) navItem.addClass('submenu-pullup'); // this class makes the .sub-arrow's color white, to match submenu color
            } else {
              navItem.addClass('submenu-pullup');
            }

            submenu.css('transform', 'translateY(-' + diff + 'px)');

            if (This._collapsed) {
              navtxt.css('transform', 'translateY(-' + diff + 'px)');
            }
          }
        });
      }
    }, {
      key: "disableSubmenuPullup",
      value: function disableSubmenuPullup() {
        this._pullupEnabled = false;
        $__default['default'](this._sidebar).off('transitionstart.pullup');

        this._resetPullUp();
      }
    }, {
      key: "_resetPullUp",
      value: function _resetPullUp() {
        $__default['default'](this._sidebar).find('.submenu-pullup').removeClass('submenu-pullup').find('.nav-text, .submenu').css('transform', '');
      } // scroll active item into view

    }, {
      key: "scrollToActive",
      value: function scrollToActive() {
        if (!this._sidebar.classList.contains('sidebar-fixed') || this._scroller === null) return;

        var active = this._sidebar.querySelector('.nav-item.active:not(.open) > .nav-link');

        try {
          active.scrollIntoView({
            behavior: 'auto',
            block: 'end'
          }); // or block: "center"?

          this._scroller.scrollTop = this._scroller.scrollTop + 30;
        } catch (e) {}
      }
    }, {
      key: "_getConfig",
      value: function _getConfig(config) {
        config = _objectSpread2(_objectSpread2({}, Default$1), _typeof(config) === 'object' && config ? config : {});

        if (typeof bootstrap__default['default'] !== 'undefined') {
          bootstrap__default['default'].Util.typeCheckConfig(NAME$1, config, this.constructor.DefaultType);
        }

        return config;
      } // Static methods

    }], [{
      key: "_jQueryInterface",
      value: function _jQueryInterface(config) {
        return this.each(function () {
          var $this = $__default['default'](this);
          var data = $this.data(DATA_KEY$1);

          var _config = _objectSpread2(_objectSpread2(_objectSpread2({}, Default$1), $this.data()), _typeof(config) === 'object' && config ? config : {});

          if (!data) {
            data = new Sidebar(this, _config);
            $this.data(DATA_KEY$1, data);
          }

          if (typeof config === 'string') {
            if (typeof data[config] === 'undefined') {
              throw new TypeError("No method named \"".concat(config, "\""));
            }

            data[config]();
          }
        });
      }
    }, {
      key: "VERSION",
      get: function get() {
        return VERSION$1;
      }
    }, {
      key: "Default",
      get: function get() {
        return Default$1;
      }
    }, {
      key: "DefaultType",
      get: function get() {
        return DefaultType$1;
      }
    }]);

    return Sidebar;
  }();
  /**
   * ------------------------------------------------------------------------
   * Data Api implementation
   * ------------------------------------------------------------------------
  */


  $__default['default'](window).on(Event$1.LOAD_DATA_API, function () {
    var sidebars = [].slice.call(document.querySelectorAll(Selector$1.SIDEBAR));

    for (var i = 0; i < sidebars.length; i++) {
      var $sidebar = $__default['default'](sidebars[i]);

      Sidebar._jQueryInterface.call($sidebar, $sidebar.data());
    }
  });
  /**
  $(document).on(Event.CLICK_DATA_API, `${Selector.DATA_TOGGLE} , ${Selector.DATA_TOGGLE_MOBILE}`, function (event) {
  	if (event.currentTarget.tagName === 'A') {
  	  event.preventDefault()
  	}

  	const $trigger = $(this)
  	const selector = bootstrap.Util.getSelectorFromElement(this)
  	const selectors = [].slice.call(document.querySelectorAll(selector))

  	$(selectors).each(function () {
  	  const $target = $(this)
  	  const data    = $target.data(DATA_KEY)
  	  const config  = data ? 'toggle' : $trigger.data()
  	  Sidebar._jQueryInterface.call($target, config)
  	})
  })
  */

  /**
   * ------------------------------------------------------------------------
   * jQuery
   * ------------------------------------------------------------------------
  */

  if (typeof $__default['default'] !== 'undefined') {
    var JQUERY_NO_CONFLICT$1 = $__default['default'].fn[NAME$1];
    $__default['default'].fn[NAME$1] = Sidebar._jQueryInterface;
    $__default['default'].fn[NAME$1].Constructor = Sidebar;

    $__default['default'].fn[NAME$1].noConflict = function () {
      $__default['default'].fn[NAME$1] = JQUERY_NO_CONFLICT$1;
      return Sidebar._jQueryInterface;
    };
  }

  /**
   * ------------------------------------------------------------------------
   * Constants
   * ------------------------------------------------------------------------
   */

  var NAME$2 = 'aceAside';
  var VERSION$2 = '3.1.1';
  var DATA_KEY$2 = 'ace.aside';
  var EVENT_KEY$2 = ".".concat(DATA_KEY$2);
  var Event$2 = {
    SHOW: "show".concat(EVENT_KEY$2),
    HIDE: "hide".concat(EVENT_KEY$2)
  };
  var DefaultType$2 = {
    placement: 'string',
    // margin: 'number',
    fade: 'boolean',
    autohide: '(boolean|number)',
    dismiss: 'boolean',
    blocking: 'boolean',
    backdrop: '(boolean|string)',
    container: 'boolean',
    belowNav: 'boolean',
    aboveNav: 'boolean',
    width: '(boolean|number)',
    height: '(boolean|number)',
    scroll: '(boolean|string)'
  };
  var Default$2 = {
    placement: 'center',
    // margin: 0,
    fade: false,
    autohide: false,
    dismiss: false,
    blocking: false,
    backdrop: false,
    container: false,
    belowNav: false,
    aboveNav: false,
    width: false,
    height: false,
    scroll: 'body'
  };
  /**
   * ------------------------------------------------------------------------
   * Class Definition
   * ------------------------------------------------------------------------
   */

  var Aside = /*#__PURE__*/function () {
    function Aside(element, config) {
      _classCallCheck(this, Aside);

      this._config = this._getConfig(config);
      this._element = element;
      this.$element = $__default['default'](element);

      this._init(this._config);
    }

    _createClass(Aside, [{
      key: "_init",
      value: function _init(config) {
        var _this$_element$classL;

        this._setPlacement(config.placement);

        this._element.classList.add('ace-aside');

        if (!config.blocking) {
          this._element.classList.add('modal-nb');

          this.$element.attr('data-backdrop', 'false').data('backdrop', false);
        } else {
          if (config.backdrop) {
            this.$element.attr('data-backdrop-bg', config.backdrop);
          }

          this.$element.attr('data-backdrop', 'true').data('backdrop', true);
        }

        if (config.dismiss) this._element.classList.add('modal-dismiss');

        if (config.fade) {
          this._element.classList.add('aside-fade', 'fade');
        }

        if (config.belowNav) this._element.classList.add('aside-below-nav');
        if (config.aboveNav) this._element.classList.add('aside-above-nav');
        if (config.extraClass) (_this$_element$classL = this._element.classList).add.apply(_this$_element$classL, _toConsumableArray(config.extraClass.split(' ')));

        if (config.container) {
          this._element.classList.add('container');

          var bdc = document.querySelector('.body-container');

          if (bdc !== null && bdc.classList.contains('container-plus')) {
            this._element.classList.add('container-plus');
          }
        }

        if (config.width) {
          this.$element.find('.modal-dialog').css('width', isNaN(config.width) ? config.width : this._config.width + 'px');
        }

        if (config.height) {
          this.$element.find('.modal-dialog').css('height', isNaN(config.height) ? config.height : this._config.height + 'px');
        } // if (/^(content|body)$/.test(config.scroll)) {
        //  this.$element.find('.modal-content').addClass('scroll-' + config.scroll)
        // }


        this.$element.off('shown.bs.modal.autohide');

        if (config.autohide) {
          var This = this;
          this.$element.on('shown.bs.modal.autohide', function () {
            setTimeout(function () {
              This.hide();
            }, config.autohide);
          });
        }
      }
    }, {
      key: "_setPlacement",
      value: function _setPlacement() {
        var placement = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : 'center';
        var placementMap = {
          t: 'aside-top',
          top: 'aside-top',
          tc: 'aside-top aside-c',
          tr: 'aside-top aside-r',
          tl: 'aside-top aside-l',
          b: 'aside-bottom',
          bottom: 'aside-bottom',
          bc: 'aside-bottom aside-c',
          br: 'aside-bottom aside-r',
          bl: 'aside-bottom aside-l',
          r: 'aside-right',
          right: 'aside-right',
          rc: 'aside-right aside-m',
          l: 'aside-left',
          left: 'aside-left',
          lc: 'aside-left aside-m',
          c: 'aside-center',
          center: 'aside-center'
        };
        placement = placement || 'c';
        var className = placementMap[placement] || 'aside-center';

        if (placement === 'c' || placement === 'center') {
          this._config.fade = true;

          this._element.classList.remove('container');
        }

        this._element.className = this._element.className + ' ' + className;
      } // Public methods

    }, {
      key: "show",
      value: function show() {
        var showEvent = new $__default['default'].Event(Event$2.SHOW);
        this.$element.trigger(showEvent);

        if (showEvent.isDefaultPrevented()) {
          return;
        }

        this.$element.modal('show');
      }
    }, {
      key: "hide",
      value: function hide() {
        var hideEvent = new $__default['default'].Event(Event$2.HIDE);
        this.$element.trigger(hideEvent);

        if (hideEvent.isDefaultPrevented()) {
          return;
        }

        this.$element.modal('hide');
      } // Private methods

    }, {
      key: "_getConfig",
      value: function _getConfig(config) {
        config = _objectSpread2(_objectSpread2({}, Default$2), _typeof(config) === 'object' && config ? config : {});

        if (typeof bootstrap__default['default'] !== 'undefined') {
          bootstrap__default['default'].Util.typeCheckConfig(NAME$2, config, this.constructor.DefaultType);
        }

        return config;
      } // Static methods

    }], [{
      key: "_jQueryInterface",
      value: function _jQueryInterface(config) {
        return this.each(function () {
          var $this = $__default['default'](this);
          var data = $this.data(DATA_KEY$2);

          var _config = _objectSpread2(_objectSpread2(_objectSpread2({}, Default$2), $__default['default'](this).data()), _typeof(config) === 'object' && config ? config : {});

          if (!data) {
            data = new Aside(this, _config);
            $this.data(DATA_KEY$2, data);
          }

          if (typeof config === 'string') {
            if (typeof data[config] === 'undefined') {
              throw new TypeError("No method named \"".concat(config, "\""));
            }

            data[config]();
          }
        });
      } //

    }, {
      key: "_HandleAside",
      value: function _HandleAside() {
        var visibleModalSelector = '.modal.show:not(.modal-nb)';
        var dismissEventId = 0;
        $__default['default']('.ace-aside.modal-nb').attr('data-backdrop', 'false').data('backdrop', false);
        $__default['default'](document).on('show.bs.modal', '.modal', function (e) {
          if (e.isDefaultPrevented()) return;
          var modal = this;

          if (modal.classList.contains('modal-nb')) {
            if ($__default['default'](visibleModalSelector).length === 0) {
              document.body.classList.add('modal-nb'); // disable .modal-open effects for .modal-nb
            }
          } else {
            if (!modal.classList.contains('ace-aside')) {
              // check to see if we will have modal scrollbars
              modal.style.display = 'block';
              if (modal.scrollHeight > modal.clientHeight) document.body.classList.add('modal-scroll');
              var scrollbars = Util.getScrollbarInfo();
              if (scrollbars.width === 0) document.body.classList.add('scrollbar-w0');
              modal.style.display = '';
            } // set modal padding value (equal to scrollbar width)


            document.body.style.setProperty('--modal-padding', window.innerWidth - document.body.scrollWidth + 'px');
            var isModalOff = modal.className.match(/modal-off(-[a-z0-9]*)?/i);
            var backdropBg = $__default['default'](modal).attr('data-backdrop-bg');

            if (backdropBg || isModalOff) {
              setTimeout(function () {
                var backdrop = document.querySelector('.modal-backdrop:last-child');

                if (backdrop !== null) {
                  if (backdropBg) backdrop.classList.add(backdropBg); // for example if our modal is a `.modal-off-lg` then we add `.d-lg-none` to `.modal-backdrop` to hide it in `lg+` view

                  if (isModalOff) backdrop.classList.add("d".concat(isModalOff[1] || '', "-none"));
                }
              }, 0);
            }

            var blur = modal.getAttribute('data-blur');

            if (blur !== null && window.CSS) {
              /**
               // using `backdrop-filter` is less intrusive but doesn't have the same blur effect
               if (window.CSS.supports("backdrop-filter", "none")) {
                setTimeout(function () {
                  $('.modal-backdrop:last-child').addClass('modal-blur')
                }, 0)
              }
              else */
              if (window.CSS.supports('filter', 'none')) {
                var bodyContainer = document.querySelector('.body-container');

                if (bodyContainer !== null) {
                  document.body.classList.add('modal-blur');
                  bodyContainer.style.filter = 'blur(' + blur + ')';
                  var modalParent = modal.parentNode;
                  var modalSibling = modal.nextSibling;
                  $__default['default'](modal).appendTo('body').one('hidden.bs.modal.blur', function () {
                    modalParent.insertBefore(modal, modalSibling);
                    document.body.classList.remove('modal-blur');
                    bodyContainer.style.filter = '';
                  });
                }
              }
            }
          }
        }).on('shown.bs.modal', '.modal', function (e) {
          var modal = this;

          if (modal.classList.contains('modal-nb')) {
            document.body.classList.remove('modal-nb');

            if ($__default['default'](visibleModalSelector).length === 0) {
              // if no blocking modals
              document.body.classList.remove('modal-open'); // disable .modal-open effects

              document.body.style.paddingRight = ''; // and remove paddingRight
            }

            if (modal.classList.contains('modal-dismiss') || modal.getAttribute('data-dismiss') === 'true') {
              // we add an extra ID to our event namespace
              // because sometimes before a dismissible modal is hidden inside the below setTimeout, another dismissible gets shown and registers the following event which gets
              // cleared in the on.hidden event below ... so we use different IDs for each one ...
              modal.setAttribute('data-dismiss-event-id', ++dismissEventId);
              $__default['default'](document).on('mouseup.aside-dismiss.' + dismissEventId, function (e) {
                // why mouseup? because 'click' may get 'stopPropagated' in some plugins such as Bootstrap's dropdown
                if (!$__default['default'].contains(modal, e.target)) {
                  // clicked outside modal
                  // why timeout?
                  // because if we click on the same button that triggers this modal, its 'hide' function will be called and instantly followed by 'show' function
                  // so we first let 'show' be called and then we call 'hide'
                  setTimeout(function () {
                    $__default['default'](modal).modal('hide');
                  }, 0);
                }
              });
            }
          }
        }).on('hidden.bs.modal', '.modal', function () {
          if ($__default['default'](visibleModalSelector).length === 0) document.body.style.paddingRight = ''; // required for rare cases that body padding is still not cleared
          else document.body.classList.add('modal-open'); // sometimes an aside is closed (so .modal-open is removed) but a .modal is still open (so we add .modal-open again)

          if (!this.classList.contains('modal-nb')) {
            document.body.classList.remove('modal-scroll');
            document.body.classList.remove('scrollbar-w0');
          } // we might have dismissed modal dialog using the close button inside it, so we turn off the events looking for clicks outside modal


          if (this.classList.contains('modal-dismiss') || this.getAttribute('data-dismiss') === 'true') {
            var eid = this.getAttribute('data-dismiss-event-id');
            $__default['default'](document).off('.aside-dismiss.' + eid);
          }
        }); // enable modal functionality for modal boxes and asides that are shown (.show) by default

        $__default['default']('.modal.show').modal('show');
      }
    }, {
      key: "VERSION",
      get: function get() {
        return VERSION$2;
      }
    }, {
      key: "DefaultType",
      get: function get() {
        return DefaultType$2;
      }
    }, {
      key: "Default",
      get: function get() {
        return Default$2;
      }
    }]);

    return Aside;
  }();
  /**
   * ------------------------------------------------------------------------
   * jQuery
   * ------------------------------------------------------------------------
  */


  if (typeof $__default['default'] !== 'undefined') {
    Aside._HandleAside();

    var JQUERY_NO_CONFLICT$2 = $__default['default'].fn[NAME$2];
    $__default['default'].fn[NAME$2] = Aside._jQueryInterface;
    $__default['default'].fn[NAME$2].Constructor = Aside;

    $__default['default'].fn[NAME$2].noConflict = function () {
      $__default['default'].fn[NAME$2] = JQUERY_NO_CONFLICT$2;
      return Aside._jQueryInterface;
    };
  }

  /**
   * ------------------------------------------------------------------------
   * Constants
   * ------------------------------------------------------------------------
   */

  var NAME$3 = 'aceToaster';
  var VERSION$3 = '3.1.1';
  var DATA_KEY$3 = 'ace.toaster';
  var EVENT_KEY$3 = ".".concat(DATA_KEY$3);
  var Event$3 = {
    CLEAR: "clear".concat(EVENT_KEY$3),
    ADD: "add".concat(EVENT_KEY$3),
    ADDED: "added".concat(EVENT_KEY$3)
  };
  var DefaultType$3 = {
    placement: 'string',
    close: 'boolean',
    autoremove: 'boolean',
    delay: 'number',
    template: 'string',
    alert: 'boolean'
  };
  var Default$3 = {
    placement: 'tr',
    close: true,
    autoremove: true,
    delay: 2500,
    template: '<div class="toast"><div class="d-flex"><div class="toast-image"></div><div class="toast-main"><div class="toast-header"></div><div class="toast-body"></div></div></div></div>',
    alert: true
  };
  /**
   * ------------------------------------------------------------------------
   * Class Definition
   * ------------------------------------------------------------------------
   */

  var Toaster = /*#__PURE__*/function () {
    function Toaster() {
      _classCallCheck(this, Toaster);

      this._lastToastId = 0;
      this._toast = null;
    }

    _createClass(Toaster, [{
      key: "add",
      // Public methods
      value: function add(config) {
        var _config = this._getConfig(config);

        var $newToast = $__default['default'](_config.template);
        this._toast = $newToast[0];
        this._lastToastId++;
        $newToast.addClass('ace-toaster-item').attr({
          id: "ace-toaster-item-".concat(this._lastToastId),
          'aria-atomic': 'true'
        });

        if (_config.alert) {
          $newToast.attr({
            role: 'alert',
            'aria-live': 'assertive'
          });
        } else {
          $newToast.attr({
            role: 'status',
            'aria-live': 'polite'
          });
        }

        var $toastHeader = $newToast.find('.toast-header');

        if (_config.title) {
          var title = typeof _config.title === 'function' ? _config.title.call(this._toast, _config) : _config.title;
          title = $__default['default']("<div class=\"toast-title\">".concat(title, "</div>"));

          if (_config.titleClass) {
            title.addClass(_config.titleClass);
          }

          $toastHeader.append(title);
        }

        if (_config.close) {
          var close = $newToast.find('[data-dismiss="toast"]');

          if (close.length === 0) {
            close = $__default['default']('<button type="button" data-dismiss="toast" aria-label="Close"><span aria-hidden="true">&times;</span></button>');
            $toastHeader.append(close);
          }

          close.addClass(_config.closeClass ? _config.closeClass : 'close');
        }

        if (_config.body) {
          $newToast.find('.toast-body').append(typeof _config.body === 'function' ? _config.body.call(this._toast, _config) : _config.body);

          if (_config.bodyClass) {
            $newToast.find('.toast-body').addClass(_config.bodyClass);
          }
        }

        if (_config.image) {
          $newToast.find('.toast-image').append("<img src=\"".concat(_config.image, "\" />"));

          if (_config.imageClass) {
            $newToast.find('.toast-image').find('img').addClass(_config.imageClass);
          }
        }

        if (_config.icon) {
          var icon = $__default['default'](_config.icon).appendTo($newToast.find('.toast-image'));

          if (!_config.image && _config.imageClass) {
            icon.addClass(_config.imageClass);
          }
        }

        if (!(_config.image || _config.icon)) $newToast.find('.toast-image').remove();

        if (_config.className) {
          $newToast.addClass(_config.className);
        }

        if (_config.headerClass) {
          $toastHeader.addClass(_config.headerClass);
        } // if delay is below 30, we consider it as seconds, not milliseconds


        _config.delay = _config.delay > 30 ? _config.delay : _config.delay * 1000;

        if (_config.progress && !_config.sticky && _config.autohide !== false) {
          var progress = $__default['default']("<div class=\"toast-progress ".concat(_config.progress, "\"></div>")).appendTo($newToast);
          progress.get(0).style.transition = "width ".concat(parseInt(_config.delay * 1.015), "ms linear");
          progress.get(0).style.width = _config.progressReverse ? 'calc(100% - 1px)' : 0; // progress.get(0).offsetWidth

          setTimeout(function () {
            progress.get(0).style.width = _config.progressReverse ? 0 : 'calc(100% - 2px)';
          }, 0);
        }

        return this._addToContainer($newToast, _config);
      } // add an existing toast element to our container

    }, {
      key: "addEl",
      value: function addEl(element, config) {
        var _config = this._getConfig(config);

        this._toast = element;
        var $existingToast = $__default['default'](this._toast).addClass('ace-toaster-item');
        if (!$existingToast.attr('id')) $existingToast.attr('id', "ace-toaster-item-".concat(++this._lastToastId));

        this._addToContainer($existingToast, _config, false);
      } // add toast element to container

    }, {
      key: "_addToContainer",
      value: function _addToContainer($toast, _config) {
        var isNewElement = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : true;
        // trigger ADD event before adding it to our container
        var addEvent = new $__default['default'].Event(Event$3.ADD);

        var _toast = $toast.get(0);

        addEvent.target = _toast;
        $__default['default'](document).trigger(addEvent);

        if (addEvent.isDefaultPrevented()) {
          if (isNewElement) $toast.remove();
          return null;
        } // end of trigger
        // add the toaster container to body


        var container = $__default['default'](".ace-toaster-container.position-".concat(_config.placement)).eq(0);

        if (container.length === 0) {
          container = $__default['default']("<div class=\"ace-toaster-container position-".concat(_config.placement, "\"/>")).appendTo(document.body);
        }

        if (_config.belowNav) {
          container.addClass('toaster-below-nav');
        } // add to container


        if (_config.placement.indexOf('b') === 0) {
          // bottom placement
          container.prepend($toast);
        } else {
          container.append($toast);
        } // without having an initial .toast element, fade-in animation isn't taking place??!!


        var dummy = $__default['default']('#ace-toaster-dummy-toast-1');
        if (dummy.length === 0) dummy = $__default['default']('<div id="ace-toaster-dummy-toast-1" class="toast d-none invisible"></div>').appendTo('body');
        dummy.toast('show'); /// ///////////////////////////////////////////////

        var _toastOptions = {};
        if (_config.sticky === true || _config.autohide === false) _toastOptions.autohide = false;
        if (_config.animation === false) _toastOptions.animation = false;
        _toastOptions.delay = _config.delay;
        if (_config.width) $toast.css('width', isNaN(_config.width) ? _config.width : _config.width + 'px');
        $toast.toast(_toastOptions).toast('show').one('hidden.bs.toast.1', function () {
          // show it again (invisibly with opacity = 0) and use bootstrap Collapse plugin to hide it, so that other toasts stacked below it move up smoothly
          $toast.removeClass('hide').addClass('show').collapse('hide').one('hidden.bs.collapse', function () {
            $toast.toast('dispose');

            if (_config.autoremove) {
              $toast.remove();
            }
          });
        }); // trigger ADDED event before adding it to DOM

        var addedEvent = new $__default['default'].Event(Event$3.ADDED);
        addedEvent.target = _toast;
        $__default['default'](document).trigger(addedEvent);
        return _toast;
      } // hide toasts

    }, {
      key: "remove",
      value: function remove(id) {
        var instant = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : false;
        this.hide(id, true, instant);
      }
    }, {
      key: "removeAll",
      value: function removeAll() {
        var placement = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : null;
        var instant = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : false;
        this.hideAll(placement, true, instant);
      } // remove toast by ID or element reference

    }, {
      key: "hide",
      value: function hide(id) {
        var remove = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : false;
        var instant = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : false;
        var selector = isNaN(id) ? id : '#ace-toaster-item-' + parseInt(id);

        this._hideBySelector(selector, remove, instant);
      } // remove ALL toasts

    }, {
      key: "hideAll",
      value: function hideAll() {
        var placement = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : null;
        var remove = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : false;
        var instant = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : false;
        // trigger CLEAR event before removing ALL
        var clearEvent = new $__default['default'].Event(Event$3.CLEAR); // ,  { placement: placement || 'all', remove: remove })

        $__default['default'](document).trigger(clearEvent, {
          placement: placement || 'all',
          remove: remove
        });

        if (clearEvent.isDefaultPrevented()) {
          return;
        } // end of trigger


        var selector = '.toast.ace-toaster-item';
        if (placement) selector = ".ace-toaster-container.position-".concat(placement, " ").concat(selector);

        this._hideBySelector(selector, remove, instant);
      }
    }, {
      key: "_hideBySelector",
      value: function _hideBySelector(selector) {
        var remove = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : false;
        var instant = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : false;
        $__default['default'](selector).each(function () {
          var $toast = $__default['default'](this);

          if (!instant && $toast.is(':visible')) {
            // fade out and then remove
            $toast.toast('hide').off('hidden.bs.toast.1') // remove the previous handler above (because it has autoremove)
            .one('hidden.bs.toast.2', function () {
              $toast.toast('dispose');
              if (remove) $toast.remove();
            });
          } else {
            $toast.toast('dispose'); // instantly remove if not visible

            if (remove) $toast.remove();
          }
        });
      } // Private methods

    }, {
      key: "_getConfig",
      value: function _getConfig(config) {
        config = _objectSpread2(_objectSpread2({}, Default$3), _typeof(config) === 'object' && config ? config : {});

        if (typeof bootstrap__default['default'] !== 'undefined') {
          bootstrap__default['default'].Util.typeCheckConfig(NAME$3, config, this.constructor.DefaultType);
        }

        return config;
      } // Static methods

    }], [{
      key: "_jQueryInterface",
      value: function _jQueryInterface(config) {
        return this.each(function () {
          config = _objectSpread2(_objectSpread2(_objectSpread2({}, {
            autoremove: false
          }), $__default['default'](this).data()), _typeof(config) === 'object' && config ? config : {});
          $__default['default'].aceToaster.addEl(this, config);
        });
      }
    }, {
      key: "VERSION",
      get: function get() {
        return VERSION$3;
      }
    }, {
      key: "DefaultType",
      get: function get() {
        return DefaultType$3;
      }
    }, {
      key: "Default",
      get: function get() {
        return Default$3;
      }
    }]);

    return Toaster;
  }();
  /**
   * ------------------------------------------------------------------------
   * jQuery
   * ------------------------------------------------------------------------
  */


  if (typeof $__default['default'] !== 'undefined') {
    $__default['default'][NAME$3] = new Toaster();
    var JQUERY_NO_CONFLICT$3 = $__default['default'].fn[NAME$3];
    $__default['default'].fn[NAME$3] = Toaster._jQueryInterface;
    $__default['default'].fn[NAME$3].Constructor = Toaster;

    $__default['default'].fn[NAME$3].noConflict = function () {
      $__default['default'].fn[NAME$3] = JQUERY_NO_CONFLICT$3;
      return Toaster._jQueryInterface;
    };
  }

  /**
   * ------------------------------------------------------------------------
   * Constants
   * ------------------------------------------------------------------------
   */

  var NAME$4 = 'aceWidget';
  var VERSION$4 = '3.1.1';
  var DATA_KEY$4 = 'ace.widget';
  var EVENT_KEY$4 = ".".concat(DATA_KEY$4);
  var DATA_API_KEY$2 = '.data-api';
  var Event$4 = {
    SHOW: "show".concat(EVENT_KEY$4),
    HIDE: "hide".concat(EVENT_KEY$4),
    SHOWN: "shown".concat(EVENT_KEY$4),
    HIDDEN: "hidden".concat(EVENT_KEY$4),
    CLOSE: "close".concat(EVENT_KEY$4),
    CLOSED: "closed".concat(EVENT_KEY$4),
    EXPAND: "expand".concat(EVENT_KEY$4),
    EXPANDED: "expanded".concat(EVENT_KEY$4),
    RESTORE: "restore".concat(EVENT_KEY$4),
    RESTORED: "restored".concat(EVENT_KEY$4),
    // RELOADED: `reloaded${EVENT_KEY}`,
    RELOAD: "reload".concat(EVENT_KEY$4),
    CLICK_DATA_API: "click".concat(EVENT_KEY$4).concat(DATA_API_KEY$2)
  };
  var Selector$2 = {
    DATA_ACTION: '.card a[data-action]'
  };
  /**
   * ------------------------------------------------------------------------
   * Class Definition
   * ------------------------------------------------------------------------
   */

  var Widget = /*#__PURE__*/function () {
    function Widget(element, config) {
      _classCallCheck(this, Widget);

      this._config = this._getConfig(config);
      this._element = element;
      this._element.offsetHeight; // force reflow, so that if we instantly call 'close' etc, transition effect takes place

      this.$box = $__default['default'](element);
    }

    _createClass(Widget, [{
      key: "reload",

      /**
      static get DefaultType () {
        return DefaultType
      }
        static get Default () {
        return Default
      }
      */
      value: function reload() {
        var ev = new $__default['default'].Event(Event$4.RELOAD);
        this.$box.trigger(ev);
        if (ev.isDefaultPrevented()) return;
        this.startLoading();
      }
    }, {
      key: "startLoading",
      value: function startLoading() {
        var loadingHtml = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : '<i class="bs-card-loading-icon fa fa-spinner fa-spin fa-2x text-white"></i>';
        this.$box.append('<div class="bs-card-loading-overlay">' + loadingHtml + '</div>');
      }
    }, {
      key: "stopLoading",
      value: function stopLoading() {
        this.$box.find('.bs-card-loading-overlay').remove();
      }
    }, {
      key: "closeFast",
      value: function closeFast() {
        var ev = new $__default['default'].Event(Event$4.CLOSE);
        this.$box.trigger(ev);
        if (ev.isDefaultPrevented()) return;
        this.$box.trigger(Event$4.CLOSED).remove();
      }
    }, {
      key: "close",
      value: function close() {
        var ev = new $__default['default'].Event(Event$4.CLOSE);
        this.$box.trigger(ev);
        if (ev.isDefaultPrevented()) return;
        var $box = this.$box;

        var _closeComplete = function _closeComplete() {
          if (this.hasClass('card-expand')) this.next('.card-expanded-placeholder').remove(); // remove the placeholder

          this.trigger(Event$4.CLOSED).remove();
        };

        if (Util.isReducedMotion()) _closeComplete.call($box);else {
          $box.addClass('fade').on('transitionend.close', function (e) {
            if (e.target !== this) return; // because transitionend might fire for children elements (like animated toolbar buttons)

            _closeComplete.call($box);

            $box.off('transitionend.close');
          });
        }
      }
    }, {
      key: "toggle",
      value: function toggle(type) {
        var $box = this.$box;
        var $body = $box.find('.card-body').eq(0);
        var action = type && typeof type === 'string' && type.match(/show|hide/)[0] || ($body.is(':visible') ? 'hide' : 'show');
        var eventName = action === 'hide' ? 'hide' : 'show';
        var ev = new $__default['default'].Event(eventName + EVENT_KEY$4);
        this.$box.trigger(ev);
        if (ev.isDefaultPrevented()) return;

        this._toggleIcon(type && _typeof(type) === 'object' && type instanceof window.HTMLElement ? type : null, action); ///


        if (action === 'hide') $body.addClass('show'); // .show class required for bs collapse plugin

        var eventCompleteName = action === 'hide' ? 'hidden' : 'shown';
        $body.collapse(action).one(eventCompleteName + '.bs.collapse', function () {
          $box.trigger(eventCompleteName + EVENT_KEY$4);
        });
      }
    }, {
      key: "hide",
      value: function hide() {
        this.toggle('hide');
      }
    }, {
      key: "show",
      value: function show() {
        this.toggle('show');
      }
    }, {
      key: "toggleFast",
      value: function toggleFast(type) {
        var $body = this.$box.find('.card-body').eq(0);
        var action = type && typeof type === 'string' && type.match(/show|hide/)[0] || ($body.is(':visible') ? 'hide' : 'show');
        var eventName = action === 'hide' ? 'hide' : 'show';
        var ev = new $__default['default'].Event(eventName + EVENT_KEY$4);
        this.$box.trigger(ev);
        if (ev.isDefaultPrevented()) return;
        $body.addClass('collapse');
        if (action === 'hide') $body.removeClass('show');else $body.addClass('show');

        this._toggleIcon(type && _typeof(type) === 'object' && type instanceof window.HTMLElement ? type : null, action);

        var eventCompleteName = action === 'hide' ? 'hidden' : 'shown';
        this.$box.trigger(eventCompleteName + EVENT_KEY$4);
      }
    }, {
      key: "hideFast",
      value: function hideFast() {
        this.toggleFast('hide');
      }
    }, {
      key: "showFast",
      value: function showFast() {
        this.toggleFast('show');
      }
    }, {
      key: "_toggleIcon",
      value: function _toggleIcon(button, action) {
        if (!button) {
          button = this.$box.find('a[data-action=toggle]').get(0);
        } //


        if (button) {
          if (action === 'show') {
            button.classList.remove('collapsed');
          } else {
            button.classList.add('collapsed');
          }
        }
      } // fullscreen

    }, {
      key: "expand",
      value: function expand(_expand, animate) {
        var button = this.$box.find('> .card-header a[data-action=expand]');
        var $expand = _expand === true || !this.$box.hasClass('card-expand');
        animate = !(animate === false || Util.isReducedMotion()); // default is true

        var $box = this.$box;
        var box = $box[0];

        if ($expand) {
          var ev = new $__default['default'].Event(Event$4.EXPAND);
          this.$box.trigger(ev);
          if (ev.isDefaultPrevented()) return;
          button.addClass('active');

          if (animate) {
            var rect = box.getBoundingClientRect();
            box.setAttribute('style', "left: ".concat(rect.left, "px; top: ").concat(rect.top, "px; width: ").concat(rect.width, "px; height: ").concat(rect.height, "px;"));
            box.classList.add('card-expanding');
            $box.on('transitionend.expanding', function (e) {
              if (e.target !== this) return; // because transitionend might fire for children elements (like animated icons of toolbar)

              $box.off('transitionend.expanding').removeClass('card-expanding').trigger(Event$4.EXPANDED);
            });
            var placeholder = document.createElement('DIV');
            placeholder.classList.add('card-expanded-placeholder');
            placeholder.setAttribute('style', "width: ".concat(rect.width, "px; height: ").concat(rect.height, "px;"));
            box.parentNode.insertBefore(placeholder, box.nextSibling); // insert after

            box.offsetHeight; // reflow...to force browser apply css/dom changes

            box.removeAttribute('style');
          }

          box.classList.add('card-expand');
          if (!animate) $box.trigger(Event$4.EXPANDED);
        } else {
          // restore
          var _ev = new $__default['default'].Event(Event$4.RESTORE);

          this.$box.trigger(_ev);
          if (_ev.isDefaultPrevented()) return;
          button.removeClass('active');
          animate = animate && box.nextElementSibling !== null && box.nextElementSibling.classList.contains('card-expanded-placeholder');

          if (animate) {
            var rect1 = box.nextElementSibling.getBoundingClientRect();
            box.classList.add('card-expanding');
            box.setAttribute('style', "left: ".concat(rect1.left, "px; top: ").concat(rect1.top, "px; width: ").concat(rect1.width, "px; height: ").concat(rect1.height, "px;"));
            $box.on('transitionend.restoring', function (e) {
              if (e.target !== this) return; // because transitionend might fire for children elements (like animated icons of toolbar)

              $box.next().remove();
              $box.off('transitionend.restoring').removeClass('card-expanding').attr('style', '').trigger(Event$4.RESTORED);
            });
          }

          box.classList.remove('card-expand');
          if (!animate) $box.trigger(Event$4.RESTORED);
        }
      } // function expand

    }, {
      key: "expandFast",
      value: function expandFast() {
        return this.expand(true, false);
      }
    }, {
      key: "restore",
      value: function restore() {
        return this.expand(false);
      }
    }, {
      key: "restoreFast",
      value: function restoreFast() {
        return this.expand(false, false);
      }
    }, {
      key: "_getConfig",
      value: function _getConfig(config) {
        config = _objectSpread2({}, _typeof(config) === 'object' && config ? config : {});

        if (typeof bootstrap__default['default'] !== 'undefined') {
          bootstrap__default['default'].Util.typeCheckConfig(NAME$4, config, this.constructor.DefaultType);
        }

        return config;
      } // Static methods

    }], [{
      key: "_jQueryInterface",
      value: function _jQueryInterface(config, value) {
        return this.each(function () {
          var $this = $__default['default'](this);
          var data = $this.data(DATA_KEY$4);

          var _config = _objectSpread2(_objectSpread2({}, $this.data()), _typeof(config) === 'object' && config ? config : {});

          if (!data) {
            data = new Widget(this, _config);
            $this.data(DATA_KEY$4, data);
          }

          if (typeof config === 'string') {
            if (typeof data[config] === 'undefined') {
              throw new TypeError("No method named \"".concat(config, "\""));
            }

            data[config](value);
          }
        });
      }
    }, {
      key: "VERSION",
      get: function get() {
        return VERSION$4;
      }
    }]);

    return Widget;
  }();
  /**
   * ------------------------------------------------------------------------
   * Data Api implementation
   * ------------------------------------------------------------------------
  */


  $__default['default'](document).on(Event$4.CLICK_DATA_API, "".concat(Selector$2.DATA_ACTION), function (event) {
    if (event.currentTarget.tagName === 'A') {
      event.preventDefault();
    }

    var $actionBtn = $__default['default'](this);
    var $box = $actionBtn.closest('.card');
    if ($box.length === 0) return;
    var $action = $actionBtn.data('action');
    $box.trigger(event = $__default['default'].Event($action + EVENT_KEY$4));
    if (event.isDefaultPrevented()) return;
    $box.aceWidget($action, this);
  });
  /**
   * ------------------------------------------------------------------------
   * jQuery
   * ------------------------------------------------------------------------
  */

  if (typeof $__default['default'] !== 'undefined') {
    var JQUERY_NO_CONFLICT$4 = $__default['default'].fn[NAME$4];
    $__default['default'].fn[NAME$4] = Widget._jQueryInterface;
    $__default['default'].fn[NAME$4].Constructor = Widget;

    $__default['default'].fn[NAME$4].noConflict = function () {
      $__default['default'].fn[NAME$4] = JQUERY_NO_CONFLICT$4;
      return Widget._jQueryInterface;
    };
  }

  /**
   * ------------------------------------------------------------------------
   * Constants
   * ------------------------------------------------------------------------
  */

  var NAME$5 = 'aceFileInput';
  var VERSION$5 = '3.1.1';
  var DATA_KEY$5 = 'ace.file';
  var EVENT_KEY$5 = ".".concat(DATA_KEY$5);
  var Event$5 = {
    // PREVIEW: `preview${EVENT_KEY}`,
    INVALID: "invalid".concat(EVENT_KEY$5),
    RESET: "reset".concat(EVENT_KEY$5),
    PREVIEW_FAILED: "preview_failed".concat(EVENT_KEY$5)
  };
  var Default$4 = {
    style: false,
    persistent: false,
    container: 'border-1 brc-grey-l2 brc-h-warning-m1',
    btnChooseClass: 'bgc-default text-white px-2 pt-2 text-90 my-1px mr-1px',
    btnChangeClass: 'bgc-blue text-white px-2 pt-2 text-90 my-1px mr-1px',
    btnChooseText: 'Choose',
    btnChangeText: 'Change',
    placeholderClass: 'text-grey-m2 px-1',
    placeholderText: 'No file chosen',
    placeholderIcon: '<i class="fa fa-upload bgc-grey-m1 text-white w-4 py-2 text-center"></i>',
    iconClass: 'mx-2px',
    reset: '',
    resetText: '',
    resetIcon: '<i class="fa fa-times"></i>',
    droppable: false,
    thumbnail: false,
    // large, fit, small
    previewImage: true,
    allowExt: null,
    denyExt: null,
    allowMime: null,
    denyMime: null,
    maxSize: null,
    previewSize: false,
    previewWidth: false,
    previewHeight: false,
    // callbacks
    beforeChange: null,
    fileIcons: {
      file: '<i class="fa fa-file bgc-grey-m1 text-white w-4 py-2 text-center"></i>',
      image: '<i class="far fa-image bgc-purple-m1 text-white w-4 py-2 text-center"></i>',
      video: '<i class="fas fa-video bgc-success-m1 text-white w-4 py-2 text-center"></i>',
      audio: '<i class="fas fa-music bgc-pink-m1 text-white w-4 py-2 text-center"></i>',
      document: '<i class="far fa-file-alt bgc-default-d1 text-white w-4 py-2 text-center"></i>',
      archive: '<i class="far fa-file-archive bgc-warning text-white w-4 py-2 text-center"></i>',
      code: '<i class="fas fa-code file-code bgc-secondary text-white w-4 py-2 text-center"></i>'
    }
  };
  var DefaultType$4 = {
    persistent: 'boolean',
    style: '(boolean|string)',
    btn: '(string|undefined)',
    container: '(string|undefined)',
    icon: '(string|undefined)',
    placeholderText: '(string|undefined)',
    placeholderIcon: '(string|undefined)',
    btnChooseText: '(string|undefined)',
    btnChangeText: '(string|undefined)',
    reset: '(string|undefined)',
    resetText: '(string|undefined)',
    resetIcon: '(string|undefined)',
    droppable: 'boolean',
    thumbnail: '(boolean|string)',
    previewImage: 'boolean',
    allowExt: '(string|null)',
    denyExt: '(string|null)',
    allowMime: '(string|null)',
    denyMime: '(string|null)',
    maxSize: '(number|null)',
    previewSize: '(boolean|number)',
    previewWidth: '(boolean|number)',
    previewHeight: '(boolean|number)',
    fileIcons: '(object|null)',
    // callbacks
    beforeChange: '(function|null)'
  };
  var PreviewError = {
    FILE_LOAD_FAILED: 1,
    IMAGE_LOAD_FAILED: 2,
    THUMBNAIL_FAILED: 3
  };
  /**
   * ------------------------------------------------------------------------
   * Class Definition
   * ------------------------------------------------------------------------
   */

  var FileInput = /*#__PURE__*/function () {
    function FileInput(element, config) {
      var _this = this;

      _classCallCheck(this, FileInput);

      this.settings = this._getConfig(config);
      this.settings.fileIcons = $__default['default'].extend({}, Default$4.fileIcons, this.settings.fileIcons);
      this.fileList = [];
      this.selectMethod = '';
      this._hasMultiple = 'multiple' in document.createElement('INPUT');
      this._hasFileList = 'FileList' in window; // file list enabled in modern browsers

      this._hasFileReader = 'FileReader' in window;
      this._hasFile = 'File' in window;
      this.element = element;
      this.$element = $__default['default'](element);
      this.disabled = false;
      this.canReset = true;
      this._hasAcceptAttr = this.element.getAttribute('accept') !== null;
      this.$element.off('change.aceInnerCall').on('change.aceInnerCall', function (e, aceInnerCall) {
        if (_this.disabled) return;
        if (aceInnerCall === true) return; // this change Event is called from within this class (_enableFileDrop) and extra checkings are taken care of there

        return _this._handleOnChange();
      });
      var parentLabel = this.$element.closest('label').addClass('d-block');
      var tagName = parentLabel.length === 0 ? 'label' : 'span'; // if not inside a "LABEL" tag, use "LABEL" tag, otherwise use "SPAN"

      this.$element.wrap('<' + tagName + ' class="ace-file-input" />');
      this.$wrap = this.$element.parent();

      this._applySettings();
    } // Getters


    _createClass(FileInput, [{
      key: "_getConfig",
      value: function _getConfig(config, Default) {
        config = _objectSpread2(_objectSpread2({}, Default), config);
        bootstrap__default['default'].Util.typeCheckConfig(NAME$5, config, DefaultType$4);
        return config;
      }
    }, {
      key: "_applySettings",
      value: function _applySettings() {
        var _this2 = this;

        this._isMulti = this.$element.attr('multiple') && this._hasMultiple;
        this._isDropStyle = this.settings.style === 'drop';

        if (this._isDropStyle) {
          if (!this.settings.thumbnail) this.settings.thumbnail = 'small';
          this.$wrap.addClass('ace-file-multiple');
        } else {
          this.$wrap.removeClass('ace-file-multiple');
        }

        this.$wrap.find('*:not(input[type=file])').remove(); // remove all except our input, good for when changing settings

        var placeholder = "<div class=\"ace-file-placeholder h-100\">\n<span class=\"ace-file-icon align-self-center ".concat(this.settings.iconClass || '', "\">\n  ").concat(this.settings.placeholderIcon || '', "\n</span>\n<span class=\"ace-file-name ").concat(this.settings.placeholderClass || '', "\">\n  ").concat(this.settings.placeholderText, "\n</span>") + (!this._isDropStyle ? "<span class=\"ace-file-btn ml-auto ".concat(this.settings.btnChooseClass || '', "\">").concat(this.settings.btnChooseText, "</span>") : '') + '</div>';
        this.$element.after("<div class=\"ace-file-container d-flex flex-column ".concat(this.settings.container || '', "\">").concat(placeholder, "</div>"));
        this.$container = this.$element.next();

        if (this.settings.reset !== false) {
          var remove = this.settings.reset.length > 0 ? this.settings.reset : !this._isDropStyle ? 'position-rc text-danger mr-n25 w-3 radius-2 border-1 brc-h-danger-m4 text-center' : 'position-tr bgc-white text-danger mt-n25 mr-n25 w-4 h-4 text-center pt-2px radius-round border-2 brc-grey-m4 brc-h-danger-m3';
          var btn = $__default['default']("<a title=\"".concat(this.settings.resetText || '', "\" class=\"remove ").concat(remove, "\" href=\"#\">").concat(this.settings.resetIcon, "</a>")).appendTo(this.$wrap);
          if (this.settings.resetText) btn.tooltip({
            container: 'body'
          });
          btn.on('click', function (e) {
            e.preventDefault();
            if (!_this2.canReset) return false;
            var event;

            _this2.$element.trigger(event = new $__default['default'].Event(Event$5.RESET));

            if (event.isDefaultPrevented()) return false;

            _this2.resetInput();

            _this2.stopLoading();

            return false;
          });
        }

        if (this.settings.droppable && this._hasFileList) {
          this._enableFileDrop();
        } // set 'accept' attribute if not set


        if (!this._hasAcceptAttr) {
          this._setAcceptAttr(this.settings.allowExt, this.settings.allowMime);
        }
      }
    }, {
      key: "showFileList",
      value: function showFileList($files, innerCall) {
        var _this3 = this;

        var files = $files || this.fileList;
        if (!files || !files.length) return; /// ///////////////////////////////////////////////////////////////

        if (!this.settings.persistent) {
          this.resetInputUI();
        }

        this.$container.addClass('selected');
        this.$container.find('.ace-file-placeholder').addClass('d-none');

        var _loop = function _loop(i) {
          var filename = '';
          var format = false;
          if (typeof files[i] === 'string') filename = files[i];else if (_this3._hasFile && files[i] instanceof window.File) filename = $__default['default'].trim(files[i].name);else if (files[i] instanceof Object && Object.prototype.hasOwnProperty.call(files[i], 'name')) {
            // format & name specified by user (pre-displaying name, etc)
            filename = files[i].name;
            if (Object.prototype.hasOwnProperty.call(files[i], 'type')) format = files[i].type;
            if (!Object.prototype.hasOwnProperty.call(files[i], 'path')) files[i].path = files[i].name;
          } else return "continue";
          var index = filename.lastIndexOf('\\') + 1;
          if (index === 0) index = filename.lastIndexOf('/') + 1;
          filename = filename.substr(index);

          if (!format) {
            if (/\.(jpe?g|png|gif|svg|bmp|tiff?|webp)$/i.test(filename)) {
              format = 'image';
            } else if (/\.(mpe?g|flv|mov|avi|swf|mp4|mkv|webm|wmv|3gp)$/i.test(filename)) {
              format = 'video';
            } else if (/\.(mp3|ogg|wav|wma|amr|aac)$/i.test(filename)) {
              format = 'audio';
            } else if (/\.(pdf|docx?|rtf|txt)$/i.test(filename)) {
              format = 'document';
            } else if (/\.(zip|rar|tar)$/i.test(filename)) {
              format = 'archive';
            } else if (/\.(html?|js|s?css|less|php|py|aspx?|rb|c|cpp|java|cs)$/i.test(filename)) {
              format = 'code';
            } else format = 'file';
          }

          var fileIcon = _this3.settings.fileIcons[format];
          var className = 'ace-file-item d-flex h-100';
          if (_this3.settings.thumbnail) className += " ".concat(_this3.settings.thumbnail !== 'small' ? 'flex-column my-2px py-2' : 'mx-1 py-1', " align-items-center");
          var label = $__default['default']("<div class=\"".concat(className, "\">\n<span class=\"ace-file-icon align-self-center ").concat(_this3.settings.iconClass || '', "\">").concat(fileIcon, "</span>\n<span class=\"ace-file-name ").concat(_this3.settings.thumbnail && _this3.settings.thumbnail !== 'small' ? 'px-2' : 'px-1', "\">").concat(filename, "</span>") + (!_this3._isDropStyle ? "<span class=\"ace-file-btn ml-auto ".concat(_this3.settings.btnChangeClass || '', "\">").concat(_this3.settings.btnChangeText, "</span>") : '') + '</div>').appendTo(_this3.$container);
          var type = innerCall === true && _this3._hasFile && files[i] instanceof window.File ? $__default['default'].trim(files[i].type) : '';
          var canPreview = _this3.settings.previewImage !== false && _this3._hasFileReader && _this3.settings.thumbnail && (type.length > 0 && type.match('image') || type.length === 0 && format === 'image'); // the second one is for older Android's default browser which gives an empty text for file.type

          if (canPreview) {
            $__default['default'].when(_this3._previewImage(files[i], label)) // .done( ()  => {
            // if( this.settings.thumbnail === 'small' ) label.find('.ace-file-icon').addClass('thumbnail-img');
            // })
            .fail(function (result) {
              _this3.$element.trigger(Event$5.PREVIEW_FAILED, {
                filename: filename,
                code: result.code
              });
            });
          }
        };

        for (var i = 0; i < files.length; i++) {
          var _ret = _loop(i);

          if (_ret === "continue") continue;
        }
      }
    }, {
      key: "resetInput",
      value: function resetInput() {
        this.resetInputUI();
        this.resetInputField();
        this.resetInputData();
        this.$container.removeClass('selected');
      }
    }, {
      key: "resetInputUI",
      value: function resetInputUI() {
        this.$container.find('div:not(.ace-file-placeholder)').remove();
        this.$container.find('.ace-file-placeholder').removeClass('d-none'); // this.resetInputData();
      }
    }, {
      key: "resetInputField",
      value: function resetInputField() {
        // http://stackoverflow.com/questions/1043957/clearing-input-type-file-using-jquery/13351234#13351234
        this.$element.wrap('<form>').parent().each(function (index, formEl) {
          formEl.reset();
        });
        this.$element.unwrap(); // when reset is called on this temporary inner form
        // only **IE10** triggers 'reset' on the outer form as well
        // and as we have mentioned to reset input on outer form reset
        // it causes infinite recusrsion by coming back to resetInputField
        // thus calling reset again and again and again
        // so because when "reset" button of outer form is hit, file input is automatically reset
        // we just resetInputUI to avoid recursion
      }
    }, {
      key: "resetInputData",
      value: function resetInputData() {
        this.fileList = [];
        this.selectMethod = '';

        if (this.$element.data('ace_input_files')) {
          this.$element.removeData('ace_input_files');
          this.$element.removeData('ace_input_method');
        }
      }
    }, {
      key: "enableReset",
      value: function enableReset() {
        this.canReset = true;
      }
    }, {
      key: "disableReset",
      value: function disableReset() {
        this.canReset = false;
      }
    }, {
      key: "disable",
      value: function disable() {
        this.disabled = true;
        this.$element.attr('disabled', 'disabled').addClass('disabled');
      }
    }, {
      key: "enable",
      value: function enable() {
        this.disabled = false;
        this.$element.removeAttr('disabled').removeClass('disabled');
      }
    }, {
      key: "files",
      value: function files() {
        return this.fileList.length > 0 ? this.fileList : null;
      }
    }, {
      key: "method",
      value: function method() {
        return this.selectMethod;
      }
    }, {
      key: "updateSettings",
      value: function updateSettings(newSettings) {
        this.settings = $__default['default'].extend({}, this.settings, newSettings);

        this._applySettings();
      }
    }, {
      key: "startLoading",
      value: function startLoading() {
        var loadingHtml = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : '<i class="overlay-content fa fa-spin fa-spinner text-white fa-2x"></i>';
        var loader = this.$wrap.find('.ace-file-overlay');

        if (loader.length === 0) {
          loader = $__default['default']('<div class="ace-file-overlay text-center"></div>').appendTo(this.$wrap);
          loader.on('click', function (e) {
            e.stopImmediatePropagation();
            e.preventDefault();
            return false;
          });
          this.element.setAttribute('readonly', 'true'); // for IE
        }

        loader.empty().append(loadingHtml);
      }
    }, {
      key: "stopLoading",
      value: function stopLoading() {
        this.$wrap.find('.ace-file-overlay').remove();
        this.element.removeAttribute('readonly');
      }
    }, {
      key: "_enableFileDrop",
      value: function _enableFileDrop() {
        var _this4 = this;

        var dropbox = this.$element.parent();
        dropbox.off('dragenter').on('dragenter', function (e) {
          e.preventDefault();
          e.stopPropagation();
        }).off('dragover').on('dragover', function (e) {
          e.preventDefault();
          e.stopPropagation();
        }).off('drop').on('drop', function (e) {
          e.preventDefault();
          e.stopPropagation();
          if (_this4.disabled) return;
          var dt = e.originalEvent.dataTransfer;
          var tmpFileList = dt.files;

          if (!_this4._isMulti && tmpFileList.length > 1) {
            // single file upload, but dragged multiple files
            var tmpfiles = [];
            tmpfiles.push(tmpFileList[0]);
            tmpFileList = tmpfiles; // keep only first file
          }

          tmpFileList = _this4._processFiles(tmpFileList, true); // true means files have been dropped

          if (tmpFileList === false) return false;

          _this4.$element.data('ace_input_method', 'drop');

          _this4.selectMethod = 'drop'; // const fileArray = [...tmpFileList]

          var fileArray = [];

          for (var f = 0; f < tmpFileList.length; f++) {
            fileArray.push(tmpFileList[f]);
          }

          if (_this4.settings.persistent) {
            _this4.fileList = _this4.fileList.concat(fileArray);
          } else {
            _this4.fileList = fileArray;
          }

          _this4.$element.data('ace_input_files', _this4.fileList);

          _this4.$element.data('ace_input_method', _this4.selectMethod);

          _this4.showFileList(fileArray, true);

          _this4.$element.triggerHandler('change', [true]); // true means aceInnerCall


          return true;
        });
      } /// ///////////

    }, {
      key: "_handleOnChange",
      value: function _handleOnChange() {
        var tmpFileList = this.element.files || [this.element.value]; // make it an array

        tmpFileList = this._processFiles(tmpFileList, false); // false means files have been selected, not dropped

        if (tmpFileList === false) return false; // const fileArray = [...tmpFileList];

        var fileArray = [];

        for (var f = 0; f < tmpFileList.length; f++) {
          fileArray.push(tmpFileList[f]);
        }

        this.selectMethod = 'select';

        if (this.settings.persistent) {
          this.fileList = this.fileList.concat(fileArray);
        } else {
          this.fileList = fileArray;
        }

        this.$element.data('ace_input_files', this.fileList);
        this.$element.data('ace_input_method', this.selectMethod);
        this.showFileList(fileArray, true);
        return true;
      }
    }, {
      key: "_previewImage",
      value: function _previewImage(file, label) {
        var $icon = label.find('.ace-file-icon'); // it should be out of onload, otherwise all onloads may target the same $icon because of delays

        $icon.empty();
        var deferred = new $__default['default'].Deferred();

        var getImage = function getImage(src, $file) {
          $icon.prepend("<img style='display: none;' />");
          var img = $icon.find('img:last').get(0);
          $__default['default'](img).one('load', function () {
            imgLoaded(img, $file);
          }).one('error', function () {
            imgFailed();
          });
          img.src = src;
        };

        var This = this;

        var imgLoaded = function imgLoaded(img, $file) {
          // if image loaded successfully
          var size = This.settings.previewSize;

          if (!size) {
            if (This.settings.previewWidth || This.settings.previewHeight) {
              size = {
                previewWidth: This.settings.previewWidth,
                previewHeight: This.settings.previewHeight
              };
            } else {
              size = 50;
              if (This.settings.thumbnail === 'large') size = 150;
            }
          }

          if (This.settings.thumbnail === 'fit') size = $icon.parent().width();else if (typeof size === 'number') size = parseInt(Math.min(size, $icon.parent().width()));
          var svg = /svg/.test($file.type);
          var thumb = !svg ? This._getThumbnail(img, size, $file.type) : false; //, file.type;

          if (thumb === null) {
            // if making thumbnail fails
            $__default['default'](This).remove();
            deferred.reject({
              code: PreviewError.THUMBNAIL_FAILED
            });
            return;
          }
          /**
          // add width/height info to "file" and trigger preview finished event for each image!
          if ($file && $file instanceof window.File) {
            if (thumb) {
              $file.width = thumb.width
              $file.height = thumb.height
            }
              var event
            This.$element.trigger(event = new $.Event(Event.PREVIEW), { file: $file })
            if (event.isDefaultPrevented()) showPreview = false
          }
          */

          {
            if (svg) {
              if (This.settings.thumbnail === 'small') {
                $__default['default'](img).css({
                  width: size
                });
              } else {
                if (img.width > img.height) {
                  $__default['default'](img).css({
                    width: size
                  });
                } else $__default['default'](img).css({
                  height: size
                });
              }
            } else {
              var w = thumb.previewWidth;
              var h = thumb.previewHeight;

              if (This.settings.thumbnail === 'small') {
                w = h = parseInt(Math.max(w, h));
              } else $icon.addClass('thumbnail-large');

              $__default['default'](img).css({
                background: 'url(' + thumb.src + ') center no-repeat',
                width: w,
                height: h
              }).data('src', thumb.src).attr({
                src: 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVQImWNgYGBgAAAABQABh6FO1AAAAABJRU5ErkJggg=='
              });
            }

            img.style.display = '';
          } /// ////////////////


          deferred.resolve();
        };

        var imgFailed = function imgFailed() {
          // for example when a file has image extenstion, but format is something else
          $icon.find('img').remove();
          deferred.reject({
            code: PreviewError.IMAGE_LOAD_FAILED
          });
        };

        if (this._hasFile && file instanceof window.File) {
          var reader = new window.FileReader();

          reader.onload = function (e) {
            getImage(e.target.result, file);
          };

          reader.onerror = function (e) {
            deferred.reject({
              code: PreviewError.FILE_LOAD_FAILED
            });
          };

          reader.readAsDataURL(file);
        } else {
          if (file instanceof Object && Object.prototype.hasOwnProperty.call(file, 'path')) {
            getImage(file.path, file); // file is a file name (path) --- this is used to pre-show user-selected image
          }
        }

        return deferred.promise();
      } /// //////////

    }, {
      key: "_getThumbnail",
      value: function _getThumbnail(img, size, type) {
        var imgWidth = img.width;
        var imgHeight = img.height; //* *IE10** is not giving correct width using img.width so we use $(img).width()

        imgWidth = imgWidth > 0 ? imgWidth : $__default['default'](img).width();
        imgHeight = imgHeight > 0 ? imgHeight : $__default['default'](img).height();
        var previewSize = false;
        var previewHeight = false;
        var previewWidth = false;
        if (typeof size === 'number') previewSize = size;else if (size instanceof Object) {
          if (size.previewWidth && !size.previewHeight) previewWidth = size.previewWidth;else if (size.previewHeight && !size.previewWidth) previewHeight = size.previewHeight;else if (size.previewWidth && size.previewHeight) {
            previewWidth = size.previewWidth;
            previewHeight = size.previewHeight;
          }
        }

        if (previewSize) {
          if (imgWidth > imgHeight) {
            previewWidth = previewSize;
            previewHeight = parseInt(imgHeight / imgWidth * previewWidth);
          } else {
            previewHeight = previewSize;
            previewWidth = parseInt(imgWidth / imgHeight * previewHeight);
          }
        } else {
          if (!previewHeight && previewWidth) {
            previewHeight = parseInt(imgHeight / imgWidth * previewWidth);
          } else if (previewHeight && !previewWidth) {
            previewWidth = parseInt(imgWidth / imgHeight * previewHeight);
          }
        }

        var dataURL;

        try {
          var canvas = document.createElement('canvas');
          canvas.width = previewWidth;
          canvas.height = previewHeight;
          var context = canvas.getContext('2d');
          context.imageSmoothingQuality = 'medium';
          context.drawImage(img, 0, 0, imgWidth, imgHeight, 0, 0, previewWidth, previewHeight);
          dataURL = canvas.toDataURL(type, 0.8); // dataURL = canvas.toDataURL();
        } catch (e) {
          dataURL = null;
        }

        if (!dataURL) return null; // there was only one image that failed in firefox completely randomly! so let's double check things

        if (!/^data:image\/(png|jpe?g|gif|svg);base64,[0-9A-Za-z+/=]+$/.test(dataURL)) dataURL = null;
        if (!dataURL) return null;
        return {
          src: dataURL,
          previewWidth: previewWidth,
          previewHeight: previewHeight,
          width: imgWidth,
          height: imgHeight
        };
      }
    }, {
      key: "_processFiles",
      value: function _processFiles(tmpFileList, dropped) {
        var ret = this._checkFileList(tmpFileList, dropped);

        if (ret === -1) {
          this.resetInput();
          return false;
        }

        if (!ret || ret.length === 0) {
          if (!this.$element.data('ace_input_files')) this.resetInput(); // if nothing selected before, reset because of the newly unacceptable (ret=false||length=0) selection
          // otherwise leave the previous selection intact?!!!

          return false;
        }

        if (ret instanceof Array || this._hasFileList && ret instanceof window.FileList) tmpFileList = ret;
        ret = true;
        if (this.settings.beforeChange) ret = this.settings.beforeChange.call(this.element, tmpFileList, dropped);

        if (ret === -1) {
          this.resetInput();
          return false;
        }

        if (!ret || ret.length === 0) {
          if (!this.$element.data('ace_input_files')) this.resetInput();
          return false;
        } // inside beforeChange you can return a modified File Array as result


        if (ret instanceof Array || this._hasFileList && ret instanceof window.FileList) tmpFileList = ret;
        return tmpFileList;
      } /// ///////

    }, {
      key: "_checkFileList",
      value: function _checkFileList(files, dropped) {
        var allowExt = this._getExtRegex(this.settings.allowExt);

        var denyExt = this._getExtRegex(this.settings.denyExt);

        var allowMime = this._getMimeRegex(this.settings.allowMime);

        var denyMime = this._getMimeRegex(this.settings.denyMime);

        var maxSize = this.settings.maxSize || false;
        if (!(allowExt || denyExt || allowMime || denyMime || maxSize)) return true; // no checking required

        var safeFiles = [];
        var errorList = {}; // for (const file of files) {

        for (var i = 0; i < files.length; i++) {
          var file = files[i]; // file is either a string(file name) or a File object

          var filename = !this._hasFile ? file : file.name;

          if (allowExt && !allowExt.test(filename)) {
            // extension not matching whitelist, so drop it
            if (!('ext' in errorList)) errorList.ext = [];
            errorList.ext.push(filename);
            continue;
          } else if (denyExt && denyExt.test(filename)) {
            // extension is matching blacklist, so drop it
            if (!('ext' in errorList)) errorList.ext = [];
            errorList.ext.push(filename);
            continue;
          }

          var type = void 0;

          if (!this._hasFile) {
            // in browsers that don't support FileReader API
            safeFiles.push(file);
            continue;
          } else if ((type = $__default['default'].trim(file.type)).length > 0) {
            // there is a mimetype for file so let's check against are rules
            if (allowMime && !allowMime.test(type)) {
              // mimeType is not matching whitelist, so drop it
              if (!('mime' in errorList)) errorList.mime = [];
              errorList.mime.push(filename);
              continue;
            } else if (denyMime && denyMime.test(type)) {
              // mimeType is matching blacklist, so drop it
              if (!('mime' in errorList)) errorList.mime = [];
              errorList.mime.push(filename);
              continue;
            }
          }

          if (maxSize && file.size > maxSize) {
            // file size is not acceptable
            if (!('size' in errorList)) errorList.size = [];
            errorList.size.push(filename);
            continue;
          }

          safeFiles.push(file);
        }

        if (safeFiles.length === files.length) return files; // return original file list if all are valid
        /// //////

        var errorCount = {
          ext: 0,
          mime: 0,
          size: 0
        };
        if ('ext' in errorList) errorCount.ext = errorList.ext.length;
        if ('mime' in errorList) errorCount.mime = errorList.mime.length;
        if ('size' in errorList) errorCount.size = errorList.size.length;
        var event;
        this.$element.trigger(event = new $__default['default'].Event(Event$5.INVALID), {
          fileCount: files.length,
          invalidCount: files.length - safeFiles.length,
          errorList: errorList,
          errorCount: errorCount,
          dropped: dropped
        });
        if (event.isDefaultPrevented()) return -1; // it will reset input
        /// ///////

        return safeFiles; // return safeFiles
      }
    }, {
      key: "_setAcceptAttr",
      value: function _setAcceptAttr() {
        var ext = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : '';
        var mime = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : '';

        if (ext) {
          if (Array.isArray(ext)) ext = ext.join(',.');else ext = ext.replace(/\|/g, ',.');
          ext = '.' + ext;
        }

        if (mime) {
          if (Array.isArray(mime)) mime = mime.join(','); // replace `/\w+` with `/*` ... for example, `image/\w+` becomes `image/*`
          else mime = mime.replace(/\|/g, ',').replace(/\/\\w+/g, '/*');
        }

        var accept = (ext || '') + (ext && mime ? ',' : '') + (mime || '');
        accept = accept.replace(/\s/g, '');
        if (accept) this.element.setAttribute('accept', accept);
      }
    }, {
      key: "_getExtRegex",
      value: function _getExtRegex(ext) {
        if (!ext) return null;
        if (Array.isArray(ext)) ext = ext.join('|');
        if (ext.length === 0) return null;
        return new RegExp('\\.(?:' + ext + ')$', 'i');
      }
    }, {
      key: "_getMimeRegex",
      value: function _getMimeRegex(mime) {
        if (!mime) return null;
        if (Array.isArray(mime)) mime = mime.join('|');
        if (mime.length === 0) return null; // replace `/*` with `/\w+` ... for example, `image/*` becomes `image/\w+`

        return new RegExp('^(?:' + mime.replace(/\/\*/g, '/\\w+').replace(/\//g, '\\/') + ')$', 'i');
      }
    }], [{
      key: "_jQueryInterface",
      value: function _jQueryInterface(config, value) {
        var retval;
        var reteach = this.each(function () {
          var matches = this.matches ? this.matches('input[type=file]') : this.msMatchesSelector ? this.msMatchesSelector('input[type=file]') : false;
          if (!matches) return;
          var $this = $__default['default'](this);
          var data = $this.data(DATA_KEY$5);

          var _config = _objectSpread2(_objectSpread2(_objectSpread2({}, Default$4), $this.data()), _typeof(config) === 'object' && config ? config : {});

          if (!data) {
            data = new FileInput(this, _config);
            $this.data(DATA_KEY$5, data);
          }

          if (typeof config === 'string') {
            if (typeof data[config] === 'undefined') {
              throw new TypeError("No method named \"".concat(config, "\""));
            }

            retval = data[config](value);
          }
        });
        return typeof retval !== 'undefined' ? retval : reteach;
      }
    }, {
      key: "VERSION",
      get: function get() {
        return VERSION$5;
      }
    }, {
      key: "DefaultType",
      get: function get() {
        return DefaultType$4;
      }
    }]);

    return FileInput;
  }();
  /**
   * ------------------------------------------------------------------------
   * jQuery
   * ------------------------------------------------------------------------
  */


  if (typeof $__default['default'] !== 'undefined') {
    var JQUERY_NO_CONFLICT$5 = $__default['default'].fn[NAME$5];
    $__default['default'].fn[NAME$5] = FileInput._jQueryInterface;
    $__default['default'].fn[NAME$5].Constructor = FileInput;

    $__default['default'].fn[NAME$5].noConflict = function () {
      $__default['default'].fn[NAME$5] = JQUERY_NO_CONFLICT$5;
      return FileInput._jQueryInterface;
    };
  }

  /**
   * ------------------------------------------------------------------------
   * Constants
   * ------------------------------------------------------------------------
   */

  var NAME$6 = 'aceWysiwyg';
  var VERSION$6 = '3.1.1';
  var DATA_KEY$6 = 'ace.wysiwyg';
  var DefaultType$5 = {
    wysiwyg: 'object',
    colors: 'array',
    // speech: 'boolean',
    toolbar: 'array',
    toolbarPlacement: '(function|null)',
    toolbarStyle: '(string|number)'
  };
  var Default$5 = {
    wysiwyg: {},
    // speech: true,
    toolbarPlacement: null,
    toolbarStyle: '',
    colors: ['#000000', '#424242', '#636363', '#9c9c94', '#cec6ce', '#efefef', '#f7f7f7', '#ffffff', '#ff0000', '#ff9c00', '#ffff00', '#00ff00', '#00ffff', '#0000ff', '#9c00ff', '#ff00ff', '#f7c6ce', '#ffe7ce', '#ffefc6', '#d6efd6', '#cedee7', '#cee7f7', '#d6d6e7', '#e7d6de', '#e79c9c', '#ffc69c', '#ffe79c', '#b5d6a5', '#a5c6ce', '#9cc6ef', '#b5a5d6', '#d6a5bd', '#e76363', '#f7ad6b', '#ffd663', '#94bd7b', '#73a5ad', '#6badde', '#8c7bc6', '#c67ba5', '#ce0000', '#e79439', '#efc631', '#6ba54a', '#4a7b8c', '#3984c6', '#634aa5', '#a54a7b', '#9c0000', '#b56308', '#bd9400', '#397b21', '#104a5a', '#085294', '#311873', '#731842', '#630000', '#7b3900', '#846300', '#295218', '#083139', '#003163', '#21104a', '#4a1031'],
    toolbar: ['font', null, 'fontSize', null, 'bold', 'italic', 'strikethrough', 'underline', null, 'insertunorderedlist', 'insertorderedlist', 'outdent', 'indent', null, 'justifyleft', 'justifycenter', 'justifyright', 'justifyfull', null, 'createLink', 'unlink', null, 'insertImage', null, 'foreColor', null, 'undo', 'redo', null, 'viewSource']
  };

  var Wysiwyg = /*#__PURE__*/function () {
    function Wysiwyg(element, config) {
      _classCallCheck(this, Wysiwyg);

      this._element = element;
      this._config = this._getConfig(config);
      this.initEditor();
    }

    _createClass(Wysiwyg, [{
      key: "initEditor",
      value: function initEditor() {
        var toolbarHtml = this._createToolbarHtml();

        var toolbar; // if we have a function to decide where to put the toolbar, then call that

        if (this._config.toolbarPlacement) toolbar = this._config.toolbarPlacement.call(this._element, toolbarHtml);else toolbar = $__default['default'](this._element).before(toolbarHtml).prev(); // otherwise put it just before our DIV

        if (this._config.toolbarStyle) toolbar.addClass('bsw-toolbar-style-' + this._config.toolbarStyle); // enable tooltips

        if ($__default['default'].fn.tooltip) toolbar.find('a[title]').tooltip({
          animation: false,
          container: 'body'
        });
        toolbar.find('.dropdown-menu input[type=text]').on('click', function () {
          return false;
        }).on('change', function () {
          $__default['default'](this).closest('.dropdown-menu').siblings('.dropdown-toggle').dropdown('toggle');
        }).on('keydown', function (e) {
          if (e.which === 27) {
            this.value = '';
            $__default['default'](this).change();
          } else if (e.which === 13) {
            e.preventDefault();
            e.stopPropagation();
            $__default['default'](this).change();
          }
        });
        toolbar.find('input[type=file]').prev().on('click', function (e) {
          $__default['default'](this).next().click();
        });
        var self = $__default['default'](this._element); // view source

        var viewSource = false;
        toolbar.find('a[data-toggle=source]').on('click', function (e) {
          e.preventDefault();

          if (!viewSource) {
            $__default['default']('<textarea />').css({
              width: self.outerWidth(),
              height: self.outerHeight()
            }).val(self.html()).insertAfter(self);
            self.addClass('d-none');
            $__default['default'](this).addClass('active');
          } else {
            var textarea = self.next();
            self.html(textarea.val()).removeClass('d-none');
            textarea.remove();
            $__default['default'](this).removeClass('active');
          }

          viewSource = !viewSource;
        }); // initiate wysiwyg plugin

        var $options = $__default['default'].extend({}, {
          activeToolbarClass: 'active',
          toolbarSelector: toolbar
        }, this._config.wysiwyg || {});
        $__default['default'](this._element).wysiwyg($options);

        this._handleImages();
      }
    }, {
      key: "_createToolbarHtml",
      value: function _createToolbarHtml() {
        var _buttonDefaults = {
          font: {
            values: ['Arial', 'Courier', 'Comic Sans MS', 'Helvetica', 'Open Sans', 'Tahoma', 'Verdana'],
            icon: 'fa fa-font text-secondary',
            title: 'Font'
          },
          fontSize: {
            values: {
              5: 'Huge',
              3: 'Normal',
              1: 'Small'
            },
            icon: 'fa fa-text-height text-secondary',
            title: 'Font Size'
          },
          bold: {
            icon: 'fa fa-bold text-secondary',
            title: 'Bold (Ctrl/Cmd+B)'
          },
          italic: {
            icon: 'fa fa-italic text-secondary',
            title: 'Italic (Ctrl/Cmd+I)'
          },
          strikethrough: {
            icon: 'fa fa-strikethrough text-secondary',
            title: 'Strikethrough'
          },
          underline: {
            icon: 'fa fa-underline text-secondary',
            title: 'Underline'
          },
          insertunorderedlist: {
            icon: 'fa fa-list-ul text-secondary',
            title: 'Bullet list'
          },
          insertorderedlist: {
            icon: 'fa fa-list-ol text-secondary',
            title: 'Number list'
          },
          outdent: {
            icon: 'fa fa-outdent text-secondary',
            title: 'Reduce indent (Shift+Tab)'
          },
          indent: {
            icon: 'fa fa-indent text-secondary',
            title: 'Indent (Tab)'
          },
          justifyleft: {
            icon: 'fa fa-align-left text-secondary',
            title: 'Align Left (Ctrl/Cmd+L)'
          },
          justifycenter: {
            icon: 'fa fa-align-center text-secondary',
            title: 'Center (Ctrl/Cmd+E)'
          },
          justifyright: {
            icon: 'fa fa-align-right text-secondary',
            title: 'Align Right (Ctrl/Cmd+R)'
          },
          justifyfull: {
            icon: 'fa fa-align-justify text-secondary',
            title: 'Justify (Ctrl/Cmd+J)'
          },
          createLink: {
            icon: 'fa fa-link text-secondary',
            title: 'Hyperlink',
            button_text: 'Add',
            placeholder: 'URL',
            button_class: 'btn-light-primary'
          },
          unlink: {
            icon: 'fa fa-unlink text-secondary',
            title: 'Remove Hyperlink'
          },
          insertImage: {
            icon: 'fa fa-image text-secondary',
            title: 'Insert picture',
            button_text: '<i class="far fa-file mr-1"></i> Choose an Image &hellip;',
            placeholder: 'Remote Image URL',
            button_insert: 'Insert',
            button_class: 'btn-light-success',
            button_insert_class: 'btn-light-primary',
            choose_file: true // show the choose file button?

          },
          foreColor: {
            icon: 'fas fa-eye-dropper text-pink-m1',
            values: this._config.colors,
            title: 'Foreground Color'
          },
          backColor: {
            icon: 'fas fa-fill-drip text-secondary',
            values: this._config.colors,
            title: 'Background Color'
          },
          removeFormat: {
            icon: 'fa fa-eraser text-secondary',
            title: 'Remove Format'
          },
          undo: {
            icon: 'fa fa-undo text-secondary',
            title: 'Undo (Ctrl/Cmd+Z)'
          },
          redo: {
            icon: 'fa fa-redo text-secondary',
            title: 'Redo (Ctrl/Cmd+Y)'
          },
          viewSource: {
            icon: 'fa fa-code text-secondary',
            title: 'View Source'
          }
        };
        var toolbarButtons = this._config.toolbar;
        var toolbarHtml = ' <div class="bootstrap-wysiwyg-toolbar btn-toolbar text-center"> <div class="btn-group mb-2px"> ';

        for (var tb in toolbarButtons) {
          if (Object.prototype.hasOwnProperty.call(toolbarButtons, tb)) {
            var button = toolbarButtons[tb];

            if (button === null) {
              toolbarHtml += ' </div> <div class="btn-group mb-2px"> ';
              continue;
            }

            if (typeof button === 'string' && button in _buttonDefaults) {
              button = _buttonDefaults[button];
              button.name = toolbarButtons[tb];
            } else if (_typeof(button) === 'object' && button.name in _buttonDefaults) {
              button = $__default['default'].extend(_buttonDefaults[button.name], button);
            } else continue;

            var className = 'className' in button ? button.className : 'btn-sm btn-outline-secondary btn-h-light-dark btn-a-light-dark';

            switch (button.name) {
              case 'font':
                toolbarHtml += " <a class=\"btn btn-sm ".concat(className, " dropdown-toggle\" data-toggle=\"dropdown\" title=\"").concat(button.title, "\"><i class=\"").concat(button.icon, "\">").concat(button.iconText || '', "</i><i class=\"fa fa-angle-down ml-1 text-secondary-m2\"></i></a> ");
                toolbarHtml += ' <div class="dropdown-menu radius-1 brc-secondary-m4">';

                for (var font in button.values) {
                  if (Object.prototype.hasOwnProperty.call(button.values, font)) {
                    toolbarHtml += " <div class=\"dropdown-item\"><a data-edit=\"fontName ".concat(button.values[font], "\" style=\"font-family:'").concat(button.values[font], "'\">").concat(button.values[font], "</a></div> ");
                  }
                }

                toolbarHtml += ' </div>';
                break;

              case 'fontSize':
                toolbarHtml += " <a class=\"btn btn-sm ".concat(className, " dropdown-toggle\" data-toggle=\"dropdown\" title=\"").concat(button.title, "\"><i class=\"").concat(button.icon, "\">").concat(button.iconText || '', "</i>&nbsp;<i class=\"fa fa-angle-down ml-1 text-secondary-m2\"></i></a> ");
                toolbarHtml += ' <div class="dropdown-menu radius-1 brc-secondary-m4"> ';

                for (var size in button.values) {
                  if (Object.prototype.hasOwnProperty.call(button.values, size)) {
                    toolbarHtml += " <div class=\"dropdown-item\"><a data-edit=\"fontSize ".concat(size, "\"><font size=\"").concat(size, "\">").concat(button.values[size], "</font></a></div> ");
                  }
                }

                toolbarHtml += ' </div> ';
                break;

              case 'createLink':
                toolbarHtml += " <div class=\"btn-group\"> <a class=\"btn btn-sm ".concat(className, " dropdown-toggle\" data-toggle=\"dropdown\" title=\"").concat(button.title, "\"><i class=\"").concat(button.icon, "\">").concat(button.iconText || '', "</i></a> ");
                toolbarHtml += " <div class=\"dropdown-menu py-1 px-3 brc-default-m3 border-2 radius-1 shadow-sm\" style=\"min-width: 300px;\">\n\t\t\t\t\t\t <div class=\"input-group my-3\">\n\t\t\t\t\t\t\t<input class=\"form-control\" placeholder=\"".concat(button.placeholder, "\" type=\"text\" data-edit=\"").concat(button.name, "\" />\n\t\t\t\t\t\t\t<div class=\"input-group-append\">\n\t\t\t\t\t\t\t\t<button class=\"btn btn-sm ").concat(button.button_class, "\" type=\"button\">").concat(button.button_text, "</button>\n\t\t\t\t\t\t\t</div>\n\t\t\t\t\t\t </div>\n\t\t\t\t\t</div> </div>");
                break;

              case 'insertImage':
                toolbarHtml += " <div class=\"btn-group\"> <a class=\"btn btn-sm ".concat(className, " dropdown-toggle\" data-toggle=\"dropdown\" title=\"").concat(button.title, "\"><i class=\"").concat(button.icon, "\">").concat(button.iconText || '', "</i></a> ");
                toolbarHtml += ' <div class="dropdown-menu p-3 brc-default-m3 border-2 radius-1 shadow-sm" style="min-width: 300px;">';

                if (button.choose_file && 'FileReader' in window) {
                  toolbarHtml += "<div class=\"text-secondary-d1\">Drag &amp; drop images into editor or</div>\n\t\t\t\t\t\t   <label class=\"text-center d-block mt-3 mb-0\">\n\t\t\t\t\t\t\t<button class=\"btn btn-sm ".concat(button.button_class, " wysiwyg-choose-file\" type=\"button\">").concat(button.button_text, "</button>\n\t\t\t\t\t\t\t<input type=\"file\" class=\"file-input-invisible\" data-edit=\"").concat(button.name, "\" />\n\t\t\t\t\t\t   </label><hr /> ");
                }

                toolbarHtml += "<div class=\"input-group my-3\">\n\t\t\t\t\t\t\t<input class=\"form-control\" placeholder=\"".concat(button.placeholder, "\" type=\"text\" data-edit=\"").concat(button.name, "\" />\n\t\t\t\t\t\t\t<div class=\"input-group-append\">\n\t\t\t\t\t\t\t\t<button class=\"btn btn-sm ").concat(button.button_insert_class, "\" type=\"button\">").concat(button.button_insert, "</button>\n\t\t\t\t\t\t\t</div>\n\t\t\t\t\t\t </div>");
                toolbarHtml += ' </div> </div>';
                break;

              case 'foreColor':
              case 'backColor':
                toolbarHtml += "<div class=\"mr-1px\"><a class=\"btn btn-sm ".concat(className, " dropdown-toggle\" data-toggle=\"dropdown\" title=\"").concat(button.title, "\"><i class=\"").concat(button.icon, "\">").concat(button.iconText || '', "</i></a> ");
                toolbarHtml += ' <div class="dropdown-menu p-1 brc-secondary-m4 border-1 radius-1" style="min-width:auto;width:10.66rem;"><div class="d-flex flex-wrap">';

                for (var color in button.values) {
                  if (Object.prototype.hasOwnProperty.call(button.values, color)) {
                    toolbarHtml += " <div class=\"dropdown-item m-0 p-0 d-inline-block w-auto\"><a class=\"p-0 dh-zoom-3\" role=\"button\" data-edit=\"".concat(button.name, " ").concat(button.values[color], "\" style=\"width:1.25rem;height:1.25rem;background-color:").concat(button.values[color], ";\"></a></div> ");
                  }
                }

                toolbarHtml += ' </div></div></div>';
                break;

              case 'viewSource':
                toolbarHtml += " <a class=\"btn btn-sm ".concat(className, "\" data-toggle=\"source\" title=\"").concat(button.title, "\"><i class=\"").concat(button.icon, "\">").concat(button.iconText || '', "</i></a> ");
                break;

              default:
                toolbarHtml += " <a class=\"btn btn-sm ".concat(className, "\" data-edit=\"").concat(button.name, "\" title=\"").concat(button.title, "\"><i class=\"").concat(button.icon, "\">").concat(button.iconText || '', "</i></a> ");
                break;
            }
          }
        }

        toolbarHtml += ' </div> '; // for .btn-group
        // var speech_input;
        // if (this._config.speech && 'onwebkitspeechchange' in (speech_input = document.createElement('input'))) {
        // toolbarHtml += ' <input class="wysiwyg-speech-input" type="text" data-edit="inserttext" x-webkit-speech />';
        // }
        // speech_input = null;
        /// /////////

        toolbarHtml += ' </div> '; // for .btn-toolbar

        return toolbarHtml;
      }
    }, {
      key: "_handleImages",
      value: function _handleImages() {
        // option for resizing an image
        var currentImg = null;
        $__default['default'](this._element).on('click', 'img', function (ev) {
          if (currentImg) $__default['default'](currentImg).popover('dispose');
          currentImg = this;
          if (!$__default['default'](currentImg).data('original-width')) $__default['default'](currentImg).data('original-width', currentImg.width);
          $__default['default'](currentImg).popover({
            container: 'body',
            html: true,
            placement: function placement(popover) {
              var offset = currentImg.getBoundingClientRect();
              var scrollTop = document.scrollTop || document.documentElement.scrollTop || document.body.scrollTop;
              $__default['default'](popover).addClass('popover-wysiwyg-image shadow brc-secondary-m4').css({
                'margin-left': offset.left + 4 + 'px',
                'margin-top': offset.top + scrollTop + 4 + 'px'
              });
              return 'auto';
            },
            title: 'Image Size & Position',
            trigger: 'manual',
            content: function content() {
              return $__default['default']("<div class='btn-group'>\n\t\t\t\t\t\t\t\t<button type='button' class='btn btn-xs btn-outline-default' data-action='resize' data-value='0.25'>25%</button>\n\t\t\t\t\t\t\t\t<button type='button' class='btn btn-xs btn-outline-default' data-action='resize' data-value='0.50'>50%</button>\n\t\t\t\t\t\t\t\t<button type='button' class='btn btn-xs btn-outline-default' data-action='resize' data-value='1'>100%</button>\n\t\t\t\t\t\t\t  </div>\n\t\t\t\t\t\t\t  <input type='number' class='form-control d-inline-block form-control-sm' data-action='resize' style='max-width: 96px;' placeholder='specify width' value='".concat(currentImg.width, "' />\n\t\t\t\t\t\t\t  <hr class='my-2' />\n\t\t\t\t\t\t\t  <div class='btn-group'>\n\t\t\t\t\t\t\t\t<button type='button' class='btn btn-xs btn-outline-secondary' data-action='align' data-value='left'>left</button>\n\t\t\t\t\t\t\t\t<button type='button' class='btn btn-xs btn-outline-secondary' data-action='align' data-value='right'>right</button>\n\t\t\t\t\t\t\t\t<button type='button' class='btn btn-xs btn-outline-secondary' data-action='align' data-value='none'>none</button>\n\t\t\t\t\t\t\t </div>\n\t\t\t\t\t\t\t <div class='btn-group float-right'>\n\t\t\t\t\t\t\t\t<button type='button' tooltip='Remove image' class='btn btn-sm btn-danger border-2 radius-round' data-action='remove'><i class='fa fa-trash-alt text-red'></i></button>\n\t\t\t\t\t\t\t </div>"));
            }
          }).popover('show');
          $__default['default'](document).on('click.popover-wysiwyg-image', function (ev) {
            if (ev.target === currentImg) return;

            if ($__default['default'](ev.target).closest('.popover-wysiwyg-image').length > 0) {
              return;
            }

            if (currentImg) $__default['default'](currentImg).popover('hide');
            currentImg = null;
            $__default['default'](document).off('click.popover-wysiwyg-image');
          });
        });
        $__default['default'](document).on('click', '.popover-wysiwyg-image button.btn', function () {
          if (!currentImg) return;
          var action = $__default['default'](this).data('action');
          var value = $__default['default'](this).data('value');

          if (action === 'resize') {
            var width = parseInt($__default['default'](currentImg).data('original-width') * value);
            $__default['default'](currentImg).css({
              width: width
            });
            $__default['default']('.popover-wysiwyg-image input[type=number]').val(width);
          }

          if (action === 'align') $__default['default'](currentImg).attr('class', 'float-' + value);else if (action === 'remove') {
            $__default['default'](currentImg).popover('dispose').remove(); // fadeOut(200, function() { $(this).remove() });

            currentImg = null;
          }
        });
        $__default['default'](document).on('change', '.popover-wysiwyg-image input[type=number]', function () {
          if (currentImg) $__default['default'](currentImg).css({
            width: $__default['default'](this).val() + 'px'
          });
        }); /// //////////////
      }
    }, {
      key: "_getConfig",
      value: function _getConfig(config) {
        config = _objectSpread2(_objectSpread2({}, Default$5), _typeof(config) === 'object' && config ? config : {});

        if (typeof bootstrap__default['default'] !== 'undefined') {
          bootstrap__default['default'].Util.typeCheckConfig(NAME$6, config, this.constructor.DefaultType);
        }

        return config;
      } // Static methods

    }], [{
      key: "_jQueryInterface",
      value: function _jQueryInterface(config) {
        return this.each(function () {
          var $this = $__default['default'](this);
          var data = $this.data(DATA_KEY$6);

          var _config = _objectSpread2(_objectSpread2(_objectSpread2({}, Default$5), $this.data()), _typeof(config) === 'object' && config ? config : {});

          if (!data) {
            data = new Wysiwyg(this, _config);
            $this.data(DATA_KEY$6, data);
          }

          if (typeof config === 'string') {
            if (typeof data[config] === 'undefined') {
              throw new TypeError("No method named \"".concat(config, "\""));
            }

            data[config]();
          }
        });
      }
    }, {
      key: "VERSION",
      get: function get() {
        return VERSION$6;
      }
    }, {
      key: "DefaultType",
      get: function get() {
        return DefaultType$5;
      }
    }, {
      key: "Default",
      get: function get() {
        return Default$5;
      }
    }]);

    return Wysiwyg;
  }();

  if (typeof $__default['default'] !== 'undefined') {
    var JQUERY_NO_CONFLICT$6 = $__default['default'].fn[NAME$6];
    $__default['default'].fn[NAME$6] = Wysiwyg._jQueryInterface;
    $__default['default'].fn[NAME$6].Constructor = Wysiwyg;

    $__default['default'].fn[NAME$6].noConflict = function () {
      $__default['default'].fn[NAME$6] = JQUERY_NO_CONFLICT$6;
      return Wysiwyg._jQueryInterface;
    };
  }

  /**
   * ------------------------------------------------------------------------
   * Constants
   * ------------------------------------------------------------------------
   */

  var NAME1 = 'aceTabScroll';
  var NAME2 = 'aceTabLinkScroll';
  var VERSION$7 = '3.1.1';
  var DATA_KEY$7 = 'ace.tabscroll';
  var EVENT_KEY$6 = ".".concat(DATA_KEY$7);
  var DATA_API_KEY$3 = '.data-api';
  var Event$6 = {
    LOAD_DATA_API: "load".concat(EVENT_KEY$6).concat(DATA_API_KEY$3)
  };
  var Selector$3 = {
    TAB_SCROLL: '.nav-tabs-scroll',
    ACTIVE: '.active'
  };
  /**
   * ------------------------------------------------------------------------
   * Class Definitions
   * ------------------------------------------------------------------------
   */

  var NavTabScroller = /*#__PURE__*/function () {
    function NavTabScroller(element) {
      _classCallCheck(this, NavTabScroller);

      this._element = element;
      this._firefox = 'MozAppearance' in document.documentElement.style;

      this._init();
    }

    _createClass(NavTabScroller, [{
      key: "_init",
      value: function _init() {
        var _this = this;

        // scroll to active element on page load
        var active = this._element.querySelector(Selector$3.ACTIVE);

        if (active) {
          var navLinkScroll = new NavLinkScroller(active);

          if (!this._firefox) {
            navLinkScroll._scrollIntoView(false);
          } else {
            // still firefox doesn't scroll back to `zero` on page load!
            setTimeout(function () {
              _this._element.scrollLeft = 1;

              navLinkScroll._scrollIntoView(false);
            }, 500);
          }
        }

        this.enable();
      }
    }, {
      key: "enable",
      value: function enable() {
        if (!('closest' in document.documentElement)) return;

        this._element.addEventListener('click', function (ev) {
          var navLink = ev.target.closest('a');
          if (!navLink) return;
          var navLinkScroll = new NavLinkScroller(navLink);

          navLinkScroll._scrollIntoView();
        });
      } // Static methods

    }], [{
      key: "_jQueryInterface",
      value: function _jQueryInterface(config) {
        return this.each(function () {
          var $this = $__default['default'](this);
          var data = $this.data(DATA_KEY$7);

          if (!data) {
            data = new NavTabScroller(this);
            $this.data(DATA_KEY$7, data);
          }

          if (typeof config === 'string') {
            if (typeof data[config] === 'undefined') {
              throw new TypeError("No method named \"".concat(config, "\""));
            }

            data[config]();
          }
        });
      }
    }, {
      key: "VERSION",
      get: function get() {
        return VERSION$7;
      }
    }]);

    return NavTabScroller;
  }();

  var NavLinkScroller = /*#__PURE__*/function () {
    function NavLinkScroller(element) {
      _classCallCheck(this, NavLinkScroller);

      this._element = element;
      this._firefox = 'MozAppearance' in document.documentElement.style;
    }

    _createClass(NavLinkScroller, [{
      key: "_scrollIntoView",
      // scroll tab button elements into view when clicked
      value: function _scrollIntoView() {
        var smooth = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : true;
        var li = this._element.parentNode;
        var nav = li.parentNode;
        var navClientWidth = nav.clientWidth;
        var navScrollWidth = nav.scrollWidth;
        if (navScrollWidth <= navClientWidth) return; // don't scroll if not needed

        var isRTL = Util.isRTL(); // scroll to this element (center it)

        var _scrollLeft;

        if (!isRTL) {
          _scrollLeft = li.offsetLeft - (navClientWidth - li.clientWidth) / 2;
        } else {
          // firefox and webkit have different ways of dealing with scrolling right/left and offsets in RTL mode
          if (!this._firefox) {
            _scrollLeft = navScrollWidth - navClientWidth + li.offsetLeft - (navClientWidth - li.clientWidth) / 2;
          } else {
            _scrollLeft = li.offsetLeft - (navClientWidth - li.clientWidth) / 2;
          }
        }

        _scrollLeft = _scrollLeft | 0; // convert FLOAT to INT

        smooth = !Util.isReducedMotion() && smooth === true;

        try {
          nav.scrollTo({
            top: 0,
            left: _scrollLeft,
            behavior: smooth ? 'smooth' : 'auto'
          }); // firefox needs extra push when scrolling back

          if (this._firefox && _scrollLeft < nav.scrollLeft) {
            setTimeout(function () {
              nav.scrollTo({
                top: 0,
                left: _scrollLeft,
                behavior: smooth ? 'smooth' : 'auto'
              });
            }, 0);
          }
        } catch (e) {
          nav.scrollLeft = _scrollLeft;
        }
      } // Static methods

    }], [{
      key: "_jQueryInterface",
      value: function _jQueryInterface(config) {
        return this.each(function () {
          var $this = $__default['default'](this);
          var data = $this.data(DATA_KEY$7);

          if (!data) {
            data = new NavLinkScroller(this);
            $this.data(DATA_KEY$7, data);

            data._scrollIntoView();
          }

          if (typeof config === 'string') {
            if (typeof data[config] === 'undefined') {
              throw new TypeError("No method named \"".concat(config, "\""));
            }

            data[config]();
          }
        });
      }
    }, {
      key: "VERSION",
      get: function get() {
        return VERSION$7;
      }
    }]);

    return NavLinkScroller;
  }();
  /**
   * ------------------------------------------------------------------------
   * Data Api implementation
   * ------------------------------------------------------------------------
  */


  $__default['default'](window).on(Event$6.LOAD_DATA_API, function () {
    var scrollableNavTabs = document.querySelectorAll(Selector$3.TAB_SCROLL);

    for (var i = 0; i < scrollableNavTabs.length; i++) {
      var $tabscroll = $__default['default'](scrollableNavTabs[i]);

      NavTabScroller._jQueryInterface.call($tabscroll);
    }
  });
  /**
   * ------------------------------------------------------------------------
   * jQuery
   * ------------------------------------------------------------------------
  */

  if (typeof $__default['default'] !== 'undefined') {
    var JQUERY_NO_CONFLICT1 = $__default['default'].fn[NAME1];
    $__default['default'].fn[NAME1] = NavTabScroller._jQueryInterface;
    $__default['default'].fn[NAME1].Constructor = NavTabScroller;

    $__default['default'].fn[NAME1].noConflict = function () {
      $__default['default'].fn[NAME1] = JQUERY_NO_CONFLICT1;
      return NavTabScroller._jQueryInterface;
    };

    var JQUERY_NO_CONFLICT2 = $__default['default'].fn[NAME2];
    $__default['default'].fn[NAME2] = NavLinkScroller._jQueryInterface;
    $__default['default'].fn[NAME2].Constructor = NavLinkScroller;

    $__default['default'].fn[NAME2].noConflict = function () {
      $__default['default'].fn[NAME2] = JQUERY_NO_CONFLICT2;
      return NavLinkScroller._jQueryInterface;
    };
  }

  /**
   * ------------------------------------------------------------------------
   * Constants
   * ------------------------------------------------------------------------
   */

  var NAME$7 = 'aceTabSwipe';
  var VERSION$8 = '3.1.1';
  var DATA_KEY$8 = 'ace.tabswipe';
  var EVENT_KEY$7 = ".".concat(DATA_KEY$8);
  var DATA_API_KEY$4 = '.data-api';
  var Event$7 = {
    LOAD_DATA_API: "load".concat(EVENT_KEY$7).concat(DATA_API_KEY$4)
  };
  var Selector$4 = {
    TAB_SWIPE: '.tab-sliding:not([data-swipe="none"])',
    ACTIVE: '.active'
  };
  /**
   * ------------------------------------------------------------------------
   * Class Definition
   * ------------------------------------------------------------------------
   */

  var TabSwipe = /*#__PURE__*/function () {
    function TabSwipe(element) {
      _classCallCheck(this, TabSwipe);

      this._element = element;
      this._firefox = 'MozAppearance' in document.documentElement.style;

      this._init();
    }

    _createClass(TabSwipe, [{
      key: "_init",
      value: function _init() {
        var _this = this;

        if (!('closest' in document.documentElement)) return;

        this._element.addEventListener('touchstart', function (ev) {
          var pane = ev.target.closest('.tab-pane');
          if (!pane) return;

          _this._startPaneSwipe(ev, pane);
        });
      }
    }, {
      key: "_startPaneSwipe",
      value: function _startPaneSwipe(ev, pane) {
        if (!pane.classList.contains('active')) return;
        var curPane = pane;
        var isRTL = Util.isRTL();
        var initialTransform = !isRTL ? 'translateX(100%)' : 'translateX(-100%)';
        var touches = ev.changedTouches[0];
        var swipeDir = 0;
        var x1 = touches.pageX;
        var y1 = touches.pageY;
        var t1 = Date.now();
        var lastX = 0;
        var curDir = 0;
        var paneWidth = curPane.clientWidth;
        var siblingPane = null;
        var allowedDir = this._element.getAttribute('data-swipe') || null;

        var paneTouchMoveCallback = function paneTouchMoveCallback(ev) {
          var touches = ev.changedTouches[0];
          var newX = touches.pageX;
          var newY = touches.pageY;
          lastX = newX;

          if (swipeDir === 0) {
            var diffY = Math.abs(y1 - newY);
            var diffX = Math.abs(x1 - newX);

            if (diffY > diffX) {
              swipeDir = 2; // vertical i.e. scroll

              curPane.removeEventListener('touchmove', paneTouchMoveCallback);
            } else if (diffX > 10) {
              swipeDir = 1; // horizontal swipe
            }
          }

          if (swipeDir !== 1) return; // return if not horizontal swipe

          var moveX = parseInt(x1 - newX);
          var newDir = 0;
          if ((allowedDir === null || allowedDir === 'left') && (!isRTL && moveX > 0 || isRTL && moveX < 0)) newDir = 1;else if ((allowedDir === null || allowedDir === 'right') && (!isRTL && moveX < 0 || isRTL && moveX > 0)) newDir = -1;

          if (newDir !== 0 && newDir !== curDir) {
            if (siblingPane !== null) _reset(siblingPane); // undo previous direction for when we change swipe direction before a touchend

            curDir = newDir;
            var targetPane = curPane.getAttribute('data-swipe-' + (curDir === 1 ? 'next' : 'prev'));
            if (targetPane) targetPane = document.querySelector(targetPane);
            siblingPane = targetPane || (curDir === 1 ? curPane.nextElementSibling : curPane.previousElementSibling);

            if (siblingPane === null || siblingPane === curPane) {
              curDir = 0;
            } else {
              curPane.classList.add('tab-swiping');
              siblingPane.classList.add('tab-swiping');
            }
          }

          var moveXabs = Math.abs(moveX);

          if (curDir !== 0 && moveXabs < paneWidth + 24) {
            // don't move more than 24px beyond its size
            curPane.style.transform = initialTransform + ' translateX(' + -1 * moveX + 'px)';
            siblingPane.style.transform = 'translateX(' + -1 * moveX + 'px)';
          } else if (curDir === 0 && moveXabs < 24) {
            curPane.style.transform = initialTransform + ' translateX(' + -1 * moveX + 'px)';
          }
        };

        var paneTouchEndCallback = function paneTouchEndCallback(ev) {
          var touches = ev.changedTouches[0] || null;
          var x2 = touches !== null ? touches.pageX : lastX;
          var t2 = Date.now();
          var diff = Math.abs(x2 - x1);

          _dismiss();

          if (curDir !== 0 && swipeDir === 1 && (diff > paneWidth / 4 || diff > 100 || diff > paneWidth / 6 && t2 - t1 < 300)) {
            // if moved more than 1/4 of its width or 100px or 1/6 in less than 300ms
            siblingPane.classList.add('active', 'show');
            curPane.classList.remove('active', 'show');
            var id1 = curPane.id;
            var id2 = siblingPane.id;
            document.querySelectorAll('[href="#' + id1 + '"],[data-target="#' + id1 + '"]').forEach(function (a) {
              return a.classList.remove('active');
            });
            var newActive = document.querySelectorAll('[href="#' + id2 + '"],[data-target="#' + id2 + '"]');
            newActive.forEach(function (a) {
              return a.classList.add('active');
            });

            if (newActive.length > 0) {
              try {
                /* global AceApp */
                var navLinkScroll = new AceApp.NavLinkScroller(newActive[0]);

                navLinkScroll._scrollIntoView();
              } catch (err) {}
            }
          }
        };

        var _dismiss = function _dismiss() {
          curPane.removeEventListener('touchmove', paneTouchMoveCallback);
          curPane.removeEventListener('touchend', paneTouchEndCallback);
          curPane.removeEventListener('touchcancel', paneTouchEndCallback);
          curPane.style.transform = '';
          curPane.classList.remove('tab-swiping');

          if (siblingPane) {
            siblingPane.style.transform = '';
            siblingPane.classList.remove('tab-swiping');
          }
        };

        var _reset = function _reset(sibling) {
          sibling.style.transform = '';
          sibling.style.transitionDuration = '0ms'; // so when we quickly and frequently swipe left/right without a `touchend`, the other pane moves away (disappears) instantly

          sibling.classList.remove('tab-swiping');
          sibling.offsetHeight;
          sibling.style.transitionDuration = '';
        };

        pane.addEventListener('touchmove', paneTouchMoveCallback);
        pane.addEventListener('touchend', paneTouchEndCallback);
        pane.addEventListener('touchcancel', paneTouchEndCallback);
      } // Static methods

    }], [{
      key: "_jQueryInterface",
      value: function _jQueryInterface(config) {
        return this.each(function () {
          var $this = $__default['default'](this);
          var data = $this.data(DATA_KEY$8);

          if (!data) {
            data = new TabSwipe(this);
            $this.data(DATA_KEY$8, data);
          }

          if (typeof config === 'string') {
            if (typeof data[config] === 'undefined') {
              throw new TypeError("No method named \"".concat(config, "\""));
            }

            data[config]();
          }
        });
      }
    }, {
      key: "VERSION",
      get: function get() {
        return VERSION$8;
      }
    }]);

    return TabSwipe;
  }();
  /**
   * ------------------------------------------------------------------------
   * Data Api implementation
   * ------------------------------------------------------------------------
  */


  $__default['default'](window).on(Event$7.LOAD_DATA_API, function () {
    if (!('ontouchstart' in document.documentElement)) return;
    var swipeablePanes = document.querySelectorAll(Selector$4.TAB_SWIPE);

    for (var i = 0; i < swipeablePanes.length; i++) {
      var $tabswipe = $__default['default'](swipeablePanes[i]);

      TabSwipe._jQueryInterface.call($tabswipe);
    }
  });
  /**
   * ------------------------------------------------------------------------
   * jQuery
   * ------------------------------------------------------------------------
  */

  if (typeof $__default['default'] !== 'undefined') {
    var JQUERY_NO_CONFLICT$7 = $__default['default'].fn[NAME$7];
    $__default['default'].fn[NAME$7] = TabSwipe._jQueryInterface;
    $__default['default'].fn[NAME$7].Constructor = TabSwipe;

    $__default['default'].fn[NAME$7].noConflict = function () {
      $__default['default'].fn[NAME$7] = JQUERY_NO_CONFLICT$7;
      return TabSwipe._jQueryInterface;
    };
  }

  /**
   * ------------------------------------------------------------------------
   * Constants
   * ------------------------------------------------------------------------
   */

  var NAME$8 = 'aceScrollTop';
  var VERSION$9 = '3.1.1';
  var DATA_KEY$9 = 'ace.scrolltop';
  var EVENT_KEY$8 = ".".concat(DATA_KEY$9);
  var DATA_API_KEY$5 = '.data-api';
  var Event$8 = {
    LOAD_DATA_API: "load".concat(EVENT_KEY$8).concat(DATA_API_KEY$5)
  };
  var Selector$5 = {
    SCROLL_TOP_BTN: '.btn-scroll-up'
  };
  var CLASS_NAME_SHOW = 'scroll-btn-visible';
  /**
   * ------------------------------------------------------------------------
   * Class Definition
   * ------------------------------------------------------------------------
   */

  var ScrollTop = /*#__PURE__*/function () {
    function ScrollTop(element) {
      _classCallCheck(this, ScrollTop);

      this._element = element;

      this._init();
    }

    _createClass(ScrollTop, [{
      key: "_init",
      value: function _init() {
        var _this = this;

        var _modernBrowser = ('IntersectionObserver' in window);

        this._element.addEventListener('click', function (ev) {
          ev.preventDefault();
          if (_modernBrowser) _this.hide();

          _this.scrollToTop();
        });

        if (!_modernBrowser) {
          // if browser doesn't support `IntersectionObserver`, always show the scroll to top button
          this.show();
        } else {
          var _scrollBtnObserve = document.createElement('DIV');

          _scrollBtnObserve.classList.add('scroll-btn-observe');

          document.body.appendChild(_scrollBtnObserve);
          var observer = new window.IntersectionObserver(function (_ref) {
            var _ref2 = _slicedToArray(_ref, 1),
                entry = _ref2[0];

            var isObserverOut = entry.intersectionRatio < 1 && entry.boundingClientRect.bottom < 0;

            if (isObserverOut) {
              _this.show();
            } else {
              _this.hide();
            }
          }, {
            threshold: [1.0],
            delay: 100
          });
          observer.observe(_scrollBtnObserve);
        }
      }
    }, {
      key: "show",
      value: function show() {
        this._element.classList.add(CLASS_NAME_SHOW);
      }
    }, {
      key: "hide",
      value: function hide() {
        this._element.classList.remove(CLASS_NAME_SHOW);
      }
    }, {
      key: "scrollToTop",
      value: function scrollToTop() {
        var smooth = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : true;

        // ScrollToOptions parameter may not be supported on some older browsers
        // so we use try/catch block in case of an error
        try {
          smooth = !Util.isReducedMotion() && smooth === true;
          window.scroll({
            top: 0,
            behavior: smooth ? 'smooth' : 'auto'
          });
        } catch (e) {
          window.scroll(0, 0);
        }
      } // Static methods

    }], [{
      key: "_jQueryInterface",
      value: function _jQueryInterface(config) {
        return this.each(function () {
          var $this = $__default['default'](this);
          var data = $this.data(DATA_KEY$9);

          if (!data) {
            data = new ScrollTop(this);
            $this.data(DATA_KEY$9, data);
          }

          if (typeof config === 'string') {
            if (typeof data[config] === 'undefined') {
              throw new TypeError("No method named \"".concat(config, "\""));
            }

            data[config]();
          }
        });
      }
    }, {
      key: "VERSION",
      get: function get() {
        return VERSION$9;
      }
    }]);

    return ScrollTop;
  }();
  /**
   * ------------------------------------------------------------------------
   * Data Api implementation
   * ------------------------------------------------------------------------
  */


  $__default['default'](window).on(Event$8.LOAD_DATA_API, function () {
    var scrollTopTopBtn = document.querySelectorAll(Selector$5.SCROLL_TOP_BTN);

    for (var i = 0; i < scrollTopTopBtn.length; i++) {
      var $scrollTopBtn = $__default['default'](scrollTopTopBtn[i]);

      ScrollTop._jQueryInterface.call($scrollTopBtn);
    }
  });
  /**
   * ------------------------------------------------------------------------
   * jQuery
   * ------------------------------------------------------------------------
  */

  if (typeof $__default['default'] !== 'undefined') {
    var JQUERY_NO_CONFLICT1$1 = $__default['default'].fn[NAME$8];
    $__default['default'].fn[NAME$8] = ScrollTop._jQueryInterface;
    $__default['default'].fn[NAME$8].Constructor = ScrollTop;

    $__default['default'].fn[NAME$8].noConflict = function () {
      $__default['default'].fn[NAME$8] = JQUERY_NO_CONFLICT1$1;
      return ScrollTop._jQueryInterface;
    };
  }

  /**
   * ------------------------------------------------------------------------
   * Constants
   * ------------------------------------------------------------------------
   */

  var NAME$9 = 'aceSticky';
  var VERSION$a = '3.1.1';
  var DATA_KEY$a = 'ace.sticky';
  var EVENT_KEY$9 = ".".concat(DATA_KEY$a);
  var DATA_API_KEY$6 = '.data-api';
  var Event$9 = {
    LOAD_DATA_API: "load".concat(EVENT_KEY$9).concat(DATA_API_KEY$6)
  };
  var Selector$6 = {
    STICKY: '[class*="sticky-nav"]'
  };
  /**
   * ------------------------------------------------------------------------
   * Class Definition
   * ------------------------------------------------------------------------
   */

  var Sticky = /*#__PURE__*/function () {
    function Sticky(element) {
      _classCallCheck(this, Sticky);

      this._element = element;

      this._init();
    }

    _createClass(Sticky, [{
      key: "_init",
      value: function _init() {
        var _this = this;

        if (!window.IntersectionObserver) return;

        this._initObserver(); // add a dummy child to be observed
        // when it goes out of window it means .sticky-nav is sticky now
        // because dummy element is `top: -1px` or when below navbar it's `top : -1 * ($navbar-height + 1px)`;


        var observedChild = document.createElement(this._element.tagName === 'UL' ? 'LI' : 'DIV');
        observedChild.classList.add('sticky-trigger');

        this._element.insertBefore(observedChild, this._element.firstChild);

        Sticky._observer.observe(observedChild);

        setTimeout(function () {
          if (observedChild.getBoundingClientRect().bottom < 0) {
            var isSticky = true;

            if (isSticky && !_this._element.classList.contains('sticky-nav')) {
              var pos = window.getComputedStyle(_this._element).position;
              if (!(pos === 'sticky' || pos === '-webkit-sticky')) isSticky = false;
            }

            var evt = new window.CustomEvent('sticky-change', {
              detail: {
                isSticky: isSticky,
                initialCheck: true
              }
            });

            _this._element.dispatchEvent(evt);
          }
        }, 200);
      } /// /
      // we use it when a sticky element becomes stuck on top and 1 pixel of it goes out of view (because of top: -1px)
      // so IntersectionObserver is triggered with intersectionRatio < 1 and y < 0
      // then we trigger an event for it, so later we may for example change its classList to update styling

    }, {
      key: "_initObserver",
      value: function _initObserver() {
        if (Sticky._observer !== null) return;
        Sticky._observer = new window.IntersectionObserver(function (_ref) {
          var _ref2 = _slicedToArray(_ref, 1),
              entry = _ref2[0];

          var isSticky = entry.intersectionRatio < 1 && entry.boundingClientRect.bottom < 0; // isSticky=true means we are at sticky position
          // so if our sticky element is for example 'sticky-nav-md' and we are at sticky position
          // but our window size is above 'md' and therefore CSS rule 'position: sticky' is not applied at all
          // so we check if we are really sticky or not

          var stickyNav = entry.target.parentElement; // entry.target is the `.sticky-trigger` and parentElement is the `.sticky-nav` element
          // check if `position` is actually `sticky` ... for example if we have `.sticky-nav-md`, it will be sticky only on small (md) devices

          if (isSticky && !stickyNav.classList.contains('sticky-nav')) {
            // don't check `.sticky-nav` element because it's sticky regardless of window size
            var pos = window.getComputedStyle(stickyNav).position;
            if (!(pos === 'sticky' || pos === '-webkit-sticky')) isSticky = false;
          }

          var evt = new window.CustomEvent('sticky-change', {
            detail: {
              isSticky: isSticky
            }
          });
          stickyNav.dispatchEvent(evt);
        }, {
          threshold: [1.0],
          delay: 100
        });
      } // Static methods

    }], [{
      key: "_jQueryInterface",
      value: function _jQueryInterface(config) {
        return this.each(function () {
          var $this = $__default['default'](this);
          var data = $this.data(DATA_KEY$a);

          if (!data) {
            data = new Sticky(this);
            $this.data(DATA_KEY$a, data);
          }

          if (typeof config === 'string') {
            if (typeof data[config] === 'undefined') {
              throw new TypeError("No method named \"".concat(config, "\""));
            }

            data[config]();
          }
        });
      }
    }, {
      key: "VERSION",
      get: function get() {
        return VERSION$a;
      }
    }]);

    return Sticky;
  }();

  Sticky._observer = null; // static property

  /**
   * ------------------------------------------------------------------------
   * Data Api implementation
   * ------------------------------------------------------------------------
  */

  $__default['default'](window).on(Event$9.LOAD_DATA_API, function () {
    var stickyEl = document.querySelectorAll(Selector$6.STICKY);

    for (var i = 0; i < stickyEl.length; i++) {
      var $stickyEl = $__default['default'](stickyEl[i]);

      Sticky._jQueryInterface.call($stickyEl);
    }
  });
  /**
   * ------------------------------------------------------------------------
   * jQuery
   * ------------------------------------------------------------------------
  */

  if (typeof $__default['default'] !== 'undefined') {
    var JQUERY_NO_CONFLICT1$2 = $__default['default'].fn[NAME$9];
    $__default['default'].fn[NAME$9] = Sticky._jQueryInterface;
    $__default['default'].fn[NAME$9].Constructor = Sticky;

    $__default['default'].fn[NAME$9].noConflict = function () {
      $__default['default'].fn[NAME$9] = JQUERY_NO_CONFLICT1$2;
      return Sticky._jQueryInterface;
    };
  }

  /**
   * --------------------------------------------------------------------------
   * Ace (v3.1.1): index.js
   * --------------------------------------------------------------------------
   */
  var index_umd = {
    Util: Util,
    Basic: Basic,
    Scrollbar: Scrollbar,
    Sidebar: Sidebar,
    Aside: Aside,
    Toaster: Toaster,
    Widget: Widget,
    FileInput: FileInput,
    Wysiwyg: Wysiwyg,
    NavTabScroller: NavTabScroller,
    NavLinkScroller: NavLinkScroller,
    TabSwipe: TabSwipe,
    ScrollTop: ScrollTop,
    Sticky: Sticky
  };

  return index_umd;

})));
//# sourceMappingURL=ace.js.map
