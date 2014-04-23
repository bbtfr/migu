//     Zepto.js
//     (c) 2010-2012 Thomas Fuchs
//     Zepto.js may be freely distributed under the MIT license.

;(function($, undefined){
  var document = window.document, docElem = document.documentElement,
    origShow = $.fn.show, origHide = $.fn.hide, origToggle = $.fn.toggle

  function anim(el, speed, opacity, scale, callback) {
    if (typeof speed == 'function' && !callback) callback = speed, speed = undefined
    var props = { opacity: opacity }
    if (scale) {
      props.scale = scale
      el.css($.fx.cssPrefix + 'transform-origin', '0 0')
    }
    return el.animate(props, speed, null, callback)
  }

  function hide(el, speed, scale, callback) {
    return anim(el, speed, 0, scale, function(){
      origHide.call($(this))
      callback && callback.call(this)
    })
  }

  $.fn.show = function(speed, callback) {
    origShow.call(this)
    if (speed === undefined) speed = 0
    else this.css('opacity', 0)
    return anim(this, speed, 1, '1,1', callback)
  }

  $.fn.hide = function(speed, callback) {
    if (speed === undefined) return origHide.call(this)
    else return hide(this, speed, '0,0', callback)
  }

  $.fn.toggle = function(speed, callback) {
    if (speed === undefined || typeof speed == 'boolean')
      return origToggle.call(this, speed)
    else return this.each(function(){
      var el = $(this)
      el[el.css('display') == 'none' ? 'show' : 'hide'](speed, callback)
    })
  }

  $.fn.fadeTo = function(speed, opacity, callback) {
    return anim(this, speed, opacity, null, callback)
  }

  $.fn.fadeIn = function(speed, callback) {
    var target = this.css('opacity')
    if (target > 0) this.css('opacity', 0)
    else target = 1
    return origShow.call(this).fadeTo(speed, target, callback)
  }

  $.fn.fadeOut = function(speed, callback) {
    return hide(this, speed, null, callback)
  }

  $.fn.fadeToggle = function(speed, callback) {
    return this.each(function(){
      var el = $(this)
      el[
        (el.css('opacity') == 0 || el.css('display') == 'none') ? 'fadeIn' : 'fadeOut'
      ](speed, callback)
    })
  }

  /* SlideDown */
  $.fn.slideDown = function (duration) {

    // get the element position to restore it then
    var position = this.css('position');

    // show element if it is hidden
    origShow.call(this);

    // place it so it displays as usually but hidden
    this.css({
      position: 'absolute',
      visibility: 'hidden'
    });

    // get naturally height, margin, padding
    var marginTop = this.css('margin-top');
    var marginBottom = this.css('margin-bottom');
    var paddingTop = this.css('padding-top');
    var paddingBottom = this.css('padding-bottom');
    var height = this.css('height');

    // set initial css for animation
    this.css({
      position: position,
      visibility: 'visible',
      overflow: 'hidden',
      height: 0,
      marginTop: 0,
      marginBottom: 0,
      paddingTop: 0,
      paddingBottom: 0
    });

    // animate to gotten height, margin and padding
    this.animate({
      height: height,
      marginTop: marginTop,
      marginBottom: marginBottom,
      paddingTop: paddingTop,
      paddingBottom: paddingBottom
    }, duration);

  };

  /* SlideUp */
  $.fn.slideUp = function (duration) {

    // active the function only if the element is visible
    if (this.height() > 0) {

      // get the element position to restore it then
      var position = this.css('position');

      // get the element height, margin and padding to restore them then
      var height = this.css('height');
      var marginTop = this.css('margin-top');
      var marginBottom = this.css('margin-bottom');
      var paddingTop = this.css('padding-top');
      var paddingBottom = this.css('padding-bottom');

      // set initial css for animation
      this.css({
        visibility: 'visible',
        overflow: 'hidden',
        height: height,
        marginTop: marginTop,
        marginBottom: marginBottom,
        paddingTop: paddingTop,
        paddingBottom: paddingBottom
      });

      // animate element height, margin and padding to zero
      this.animate({
        height: 0,
        marginTop: 0,
        marginBottom: 0,
        paddingTop: 0,
        paddingBottom: 0
      }, {
        // callback : restore the element position, height, margin and padding to original values
        duration: duration,
        queue: false,
        complete: function() {
          var $this = $(this);
          origHide.call($this);
          $this.css({
            visibility: 'visible',
            overflow: 'hidden',
            height: height,
            marginTop: marginTop,
            marginBottom: marginBottom,
            paddingTop: paddingTop,
            paddingBottom: paddingBottom
          });
        }
      });
    }
  };

  /* SlideToggle */
  $.fn.slideToggle = function (duration) {

      // if the element is hidden, slideDown !
      if (this.height() == 0) {
          this.slideDown(duration);
      }
      // if the element is visible, slideUp !
      else {
          this.slideUp(duration);
      }
  };

})(Zepto)
