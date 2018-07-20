<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">

<head>

<meta charset="UTF-8">

<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>



<style>

/* bootstrap-tagsinput.css file - add in local */

.bootstrap-tagsinput {
  background-color: #fff;
  border: 1px solid #ccc;
  box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
  display: inline-block;
  padding: 4px 6px;
  color: #555;
  vertical-align: middle;
  border-radius: 4px;
  max-width: 500px;
  line-height: 30px;
  cursor: text;
}
.bootstrap-tagsinput input {
  border: none;
  box-shadow: none;
  outline: none;
  background-color: transparent;
  padding: 0 6px;
  margin: 0;
  width: auto;
  max-width: inherit;
}
.bootstrap-tagsinput.form-control input::-moz-placeholder {
  color: #777;
  opacity: 1;
}
.bootstrap-tagsinput.form-control input:-ms-input-placeholder {
  color: #777;
}
.bootstrap-tagsinput.form-control input::-webkit-input-placeholder {
  color: #777;
}
.bootstrap-tagsinput input:focus {
  border: none;
  box-shadow: none;
}
.bootstrap-tagsinput .tag {
  margin-right: 2px;
  color: white;
}
.bootstrap-tagsinput .tag [data-role="remove"] {
  margin-left: 8px;
  cursor: pointer;
}
.bootstrap-tagsinput .tag [data-role="remove"]:after {
  content: "x";
  padding: 0px 2px;
}
.bootstrap-tagsinput .tag [data-role="remove"]:hover {
  box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
}
.bootstrap-tagsinput .tag [data-role="remove"]:hover:active {
  box-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
}

</style>

<script type="text/javascript">

var i=0;
var text="";

function appendText(content) {
    text = text + content;
    $("#count").val(i);
    $("#hashTag").val(text);
    i++;
  }
  
(function ($) {
	  "use strict";
	  
	  var defaultOptions = {
	    tagClass: function(item) {
	      return 'label label-info';
	    },
	    itemValue: function(item) {
	      return item ? item.toString() : item;
	    },
	    itemText: function(item) {
	      return this.itemValue(item);
	    },
	    itemTitle: function(item) {
	      return null;
	    },
	    freeInput: true,
	    addOnBlur: true,
	    maxTags: undefined,
	    maxChars: undefined,
	    confirmKeys: [13, 44],
	    delimiter: ',',
	    delimiterRegex: null,
	    cancelConfirmKeysOnEmpty: true,
	    onTagExists: function(item, $tag) {
	      $tag.hide().fadeIn();
	    },
	    trimValue: false,
	    allowDuplicates: false
	  };

	  /**
	   * Constructor function
	   */
	  function TagsInput(element, options) {
	    this.itemsArray = [];

	    this.$element = $(element);
	    this.$element.hide();

	    this.isSelect = (element.tagName === 'SELECT');
	    this.multiple = (this.isSelect && element.hasAttribute('multiple'));
	    this.objectItems = options && options.itemValue;
	    this.placeholderText = element.hasAttribute('placeholder') ? this.$element.attr('placeholder') : '';
	    this.inputSize = Math.max(1, this.placeholderText.length);

	    this.$container = $('<div class="bootstrap-tagsinput"></div>');
	    this.$input = $('<input type="text" maxlength="15" style="width:200px;" name="hashInput" placeholder="' + this.placeholderText + '"/>').appendTo(this.$container);

	    this.$element.before(this.$container);

	    this.build(options);
	  }

	  TagsInput.prototype = {
	    constructor: TagsInput,

	    /**
	     * Adds the given item as a new tag. Pass true to dontPushVal to prevent
	     * updating the elements val()
	     */
	    
	    add: function(item, dontPushVal, options) {
	      var self = this;
	      var count = $("#count").val();
	      
	      if(count>=20)
	    	  return;
	      
	      if (self.options.maxTags && self.itemsArray.length >= self.options.maxTags)
	        return;

	      // Ignore falsey values, except false
	      if (item !== false && !item)
	        return;

	      // Trim value
	      if (typeof item === "string" && self.options.trimValue) {
	        item = $.trim(item);
	      }

	      // Throw an error when trying to add an object while the itemValue option was not set
	      if (typeof item === "object" && !self.objectItems)
	        throw("Can't add objects when itemValue option is not set");

	      // Ignore strings only containg whitespace
	      
	      if (item.toString().match(/^\s*$/))
	        return;
	      
	      else if (item.toString().match(/[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\$%&\\\=\(\'\"]/gi))
	    	return;
	      
	      else if(item.charAt(0)!="#"){
	    	  item = "#"+item;
	      }
	      else{ 
	    	 var chr_pass_0="";
	    	 var chr_pass_1="";
	    	 var temp = "";
	    	 
	    	 for(var i=0; i < item.toString().length; i++) {
	    		 
	    		 chr_pass_0 = item.charAt(i); 
				 chr_pass_1 = item.charAt(i+1);
	    	 
				if(chr_pass_0=="#" && chr_pass_1==""){
					return;
				} 
				 
				else if(chr_pass_0==chr_pass_1 && item.charAt(i)=="#"){
	    	 		chr_pass_0 = "";
	    	 	}
	    	 	temp = temp + chr_pass_0;
	    	 } 
	    	item = temp;
	      }
	      
		  // If SELECT but not multiple, remove current tag
	      if (self.isSelect && !self.multiple && self.itemsArray.length > 0)
	        self.remove(self.itemsArray[0]);

	      if (typeof item === "string" && this.$element[0].tagName === 'INPUT') {
	        var delimiter = (self.options.delimiterRegex) ? self.options.delimiterRegex : self.options.delimiter;
	        var items = item.split(delimiter);
	        if (items.length > 1) {
	          for (var i = 0; i < items.length; i++) {
	            this.add(items[i], true);
	          }

	          if (!dontPushVal)
	            self.pushVal();
	          return;
	        }
	      }

	      var itemValue = self.options.itemValue(item),
	          itemText = self.options.itemText(item),
	          tagClass = self.options.tagClass(item),
	          itemTitle = self.options.itemTitle(item);

	      // Ignore items allready added
	      var existing = $.grep(self.itemsArray, function(item) { return self.options.itemValue(item) === itemValue; } )[0];
	      if (existing && !self.options.allowDuplicates) {
	        // Invoke onTagExists
	        if (self.options.onTagExists) {
	          var $existingTag = $(".tag", self.$container).filter(function() { return $(this).data("item") === existing; });
	          self.options.onTagExists(item, $existingTag);
	        }
	        return;
	      }

	      // if length greater than limit
	      if (self.items().toString().length + item.length + 1 > self.options.maxInputLength)
	        return;

	      // raise beforeItemAdd arg
	      var beforeItemAddEvent = $.Event('beforeItemAdd', { item: item, cancel: false, options: options});
	      self.$element.trigger(beforeItemAddEvent);
	      if (beforeItemAddEvent.cancel)
	        return;

	      // register item in internal array and map
	      self.itemsArray.push(item);

	      // add a tag element
		
	      var $tag = $('<span class="tag ' + htmlEncode(tagClass) + (itemTitle !== null ? ('" title="' + itemTitle) : '') + '">' + htmlEncode(itemText) + '<span data-role="remove"></span></span>');
	      //개수 제한
	      
	      appendText(itemText);
	
	      $tag.data('item', item);
	      self.findInputWrapper().before($tag);
	      $tag.after(' ');

	      // add <option /> if item represents a value not present in one of the <select />'s options
	      if (self.isSelect && !$('option[value="' + encodeURIComponent(itemValue) + '"]',self.$element)[0]) {
	        var $option = $('<option selected>' + htmlEncode(itemText) + '</option>');
	        $option.data('item', item);
	        $option.attr('value', itemValue);
	        self.$element.append($option);
	      }

	      if (!dontPushVal)
	        self.pushVal();

	      // Add class when reached maxTags
	      if (self.options.maxTags === self.itemsArray.length || self.items().toString().length === self.options.maxInputLength)
	        self.$container.addClass('bootstrap-tagsinput-max');

	      self.$element.trigger($.Event('itemAdded', { item: item, options: options }));
	    },

	    /**
	     * Removes the given item. Pass true to dontPushVal to prevent updating the
	     * elements val()
	     */
	    remove: function(item, dontPushVal, options) {
	      var self = this;

	      if (self.objectItems) {
	        if (typeof item === "object")
	          item = $.grep(self.itemsArray, function(other) { return self.options.itemValue(other) ==  self.options.itemValue(item); } );
	        else
	          item = $.grep(self.itemsArray, function(other) { return self.options.itemValue(other) ==  item; } );

	        item = item[item.length-1];
	      }

	      if (item) {
	        var beforeItemRemoveEvent = $.Event('beforeItemRemove', { item: item, cancel: false, options: options });
	        self.$element.trigger(beforeItemRemoveEvent);
	        if (beforeItemRemoveEvent.cancel)
	          return;

	        $('.tag', self.$container).filter(function() { return $(this).data('item') === item; }).remove();
	        $('option', self.$element).filter(function() { return $(this).data('item') === item; }).remove();
	        if($.inArray(item, self.itemsArray) !== -1)
	          self.itemsArray.splice($.inArray(item, self.itemsArray), 1);
	      }

	      if (!dontPushVal)
	        self.pushVal();

	      // Remove class when reached maxTags
	      if (self.options.maxTags > self.itemsArray.length)
	        self.$container.removeClass('bootstrap-tagsinput-max');

	      self.$element.trigger($.Event('itemRemoved',  { item: item, options: options }));
	    },

	    /**
	     * Removes all items
	     */
	    removeAll: function() {
	      var self = this;

	      $('.tag', self.$container).remove();
	      $('option', self.$element).remove();

	      while(self.itemsArray.length > 0)
	        self.itemsArray.pop();

	      self.pushVal();
	    },

	    /**
	     * Refreshes the tags so they match the text/value of their corresponding
	     * item.
	     */
	    refresh: function() {
	      var self = this;
	      $('.tag', self.$container).each(function() {
	        var $tag = $(this),
	            item = $tag.data('item'),
	            itemValue = self.options.itemValue(item),
	            itemText = self.options.itemText(item),
	            tagClass = self.options.tagClass(item);

	          // Update tag's class and inner text
	          $tag.attr('class', null);
	          $tag.addClass('tag ' + htmlEncode(tagClass));
	          $tag.contents().filter(function() {
	            return this.nodeType == 3;
	          })[0].nodeValue = htmlEncode(itemText);

	          if (self.isSelect) {
	            var option = $('option', self.$element).filter(function() { return $(this).data('item') === item; });
	            option.attr('value', itemValue);
	          }
	      });
	    },

	    /**
	     * Returns the items added as tags
	     */
	    items: function() {
	      return this.itemsArray;

	    },
	    /**
	     * Assembly value by retrieving the value of each item, and set it on the
	     * element.
	     */
	    pushVal: function() {
	      var self = this,
	          val = $.map(self.items(), function(item) {
	            return self.options.itemValue(item).toString();
	          });

	      self.$element.val(val, true).trigger('change');
	    },

	    /**
	     * Initializes the tags input behaviour on the element
	     */
	    build: function(options) {
	      var self = this;

	      self.options = $.extend({}, defaultOptions, options);
	      // When itemValue is set, freeInput should always be false
	      if (self.objectItems)
	        self.options.freeInput = false;

	      makeOptionItemFunction(self.options, 'itemValue');
	      makeOptionItemFunction(self.options, 'itemText');
	      makeOptionFunction(self.options, 'tagClass');

	      // Typeahead Bootstrap version 2.3.2
	      if (self.options.typeahead) {
	        var typeahead = self.options.typeahead || {};

	        makeOptionFunction(typeahead, 'source');

	        self.$input.typeahead($.extend({}, typeahead, {
	          source: function (query, process) {
	            function processItems(items) {
	              var texts = [];

	              for (var i = 0; i < items.length; i++) {
	                var text = self.options.itemText(items[i]);
	                map[text] = items[i];
	                texts.push(text);
	              }
	              process(texts);
	            }

	            this.map = {};
	            var map = this.map,
	                data = typeahead.source(query);

	            if ($.isFunction(data.success)) {
	              // support for Angular callbacks
	              data.success(processItems);
	            } else if ($.isFunction(data.then)) {
	              // support for Angular promises
	              data.then(processItems);
	            } else {
	              // support for functions and jquery promises
	              $.when(data)
	               .then(processItems);
	            }
	          },
	          updater: function (text) {
	            self.add(this.map[text]);
	            return this.map[text];
	          },
	          matcher: function (text) {
	            return (text.toLowerCase().indexOf(this.query.trim().toLowerCase()) !== -1);
	          },
	          sorter: function (texts) {
	            return texts.sort();
	          },
	          highlighter: function (text) {
	            var regex = new RegExp( '(' + this.query + ')', 'gi' );
	            return text.replace( regex, "<strong>$1</strong>" );
	          }
	        }));
	      }

	      // typeahead.js
	      if (self.options.typeaheadjs) {
	          var typeaheadConfig = null;
	          var typeaheadDatasets = {};

	          // Determine if main configurations were passed or simply a dataset
	          var typeaheadjs = self.options.typeaheadjs;
	          if ($.isArray(typeaheadjs)) {
	            typeaheadConfig = typeaheadjs[0];
	            typeaheadDatasets = typeaheadjs[1];
	          } else {
	            typeaheadDatasets = typeaheadjs;
	          }

	          self.$input.typeahead(typeaheadConfig, typeaheadDatasets).on('typeahead:selected', $.proxy(function (obj, datum) {
	            if (typeaheadDatasets.valueKey)
	              self.add(datum[typeaheadDatasets.valueKey]);
	            else
	              self.add(datum);
	            self.$input.typeahead('val', '');
	          }, self));
	      }

	      self.$container.on('click', $.proxy(function(event) {
	        if (! self.$element.attr('disabled')) {
	          self.$input.removeAttr('disabled');
	        }
	        self.$input.focus();
	      }, self));

	        if (self.options.addOnBlur && self.options.freeInput) {
	          self.$input.on('focusout', $.proxy(function(event) {
	              // HACK: only process on focusout when no typeahead opened, to
	              //       avoid adding the typeahead text as tag
	              if ($('.typeahead, .twitter-typeahead', self.$container).length === 0) {
	                self.add(self.$input.val());
	                self.$input.val('');
	              }
	          }, self));
	        }


	      self.$container.on('keydown', 'input', $.proxy(function(event) {
	        var $input = $(event.target),
	            $inputWrapper = self.findInputWrapper();

	        if (self.$element.attr('disabled')) {
	          self.$input.attr('disabled', 'disabled');
	          return;
	        }

	        switch (event.which) {
	          // BACKSPACE
	          case 8:
	            if (doGetCaretPosition($input[0]) === 0) {
	              var prev = $inputWrapper.prev();
	              if (prev.length) {
	                self.remove(prev.data('item'));
	              }
	            }
	            break;

	          // DELETE
	          case 46:
	            if (doGetCaretPosition($input[0]) === 0) {
	              var next = $inputWrapper.next();
	              if (next.length) {
	                self.remove(next.data('item'));
	              }
	            }
	          
	            break;

	          // LEFT ARROW
	          case 37:
	            // Try to move the input before the previous tag
	            var $prevTag = $inputWrapper.prev();
	            if ($input.val().length === 0 && $prevTag[0]) {
	              $prevTag.before($inputWrapper);
	              $input.focus();
	            }
	            break;
	          // RIGHT ARROW
	          case 39:
	            // Try to move the input after the next tag
	            var $nextTag = $inputWrapper.next();
	            if ($input.val().length === 0 && $nextTag[0]) {
	              $nextTag.after($inputWrapper);
	              $input.focus();
	            }
	            break;
	         default:
	             // ignore
	         }

	        // Reset internal input's size
	        var textLength = $input.val().length,
	            wordSpace = Math.ceil(textLength / 5),
	            size = textLength + wordSpace + 1;
	        $input.attr('size', Math.max(this.inputSize, $input.val().length));
	      }, self));

	      self.$container.on('keypress', 'input', $.proxy(function(event) {
	         var $input = $(event.target);

	         if (self.$element.attr('disabled')) {
	            self.$input.attr('disabled', 'disabled');
	            return;
	         }

	         var text = $input.val(),
	         maxLengthReached = self.options.maxChars && text.length >= self.options.maxChars;
	         if (self.options.freeInput && (keyCombinationInList(event, self.options.confirmKeys) || maxLengthReached)) {
	            // Only attempt to add a tag if there is data in the field
	            if (text.length !== 0) {
	               self.add(maxLengthReached ? text.substr(0, self.options.maxChars) : text);
	               $input.val('');
	            }

	            // If the field is empty, let the event triggered fire as usual
	            if (self.options.cancelConfirmKeysOnEmpty === false) {
	               event.preventDefault();
	            }
	         }

	         // Reset internal input's size
	         var textLength = $input.val().length,
	            wordSpace = Math.ceil(textLength / 5),
	            size = textLength + wordSpace + 1;
	         $input.attr('size', Math.max(this.inputSize, $input.val().length));
	      }, self));

	      // Remove icon clicked
	      self.$container.on('click', '[data-role=remove]', $.proxy(function(event) {
	        if (self.$element.attr('disabled')) {
	          return;
	        }
	        self.remove($(event.target).closest('.tag').data('item'));
	      }, self));

	      // Only add existing value as tags when using strings as tags
	      if (self.options.itemValue === defaultOptions.itemValue) {
	        if (self.$element[0].tagName === 'INPUT') {
	            self.add(self.$element.val());
	        } else {
	          $('option', self.$element).each(function() {
	            self.add($(this).attr('value'), true);
	          });
	        }
	      }
	    },

	    /**
	     * Removes all tagsinput behaviour and unregsiter all event handlers
	     */
	    destroy: function() {
	      var self = this;

	      // Unbind events
	      self.$container.off('keypress', 'input');
	      self.$container.off('click', '[role=remove]');

	      self.$container.remove();
	      self.$element.removeData('tagsinput');
	      self.$element.show();
	    },

	    /**
	     * Sets focus on the tagsinput
	     */
	    focus: function() {
	      this.$input.focus();
	    },

	    /**
	     * Returns the internal input element
	     */
	    input: function() {
	      return this.$input;
	    },

	    /**
	     * Returns the element which is wrapped around the internal input. This
	     * is normally the $container, but typeahead.js moves the $input element.
	     */
	    findInputWrapper: function() {
	      var elt = this.$input[0],
	          container = this.$container[0];
	      while(elt && elt.parentNode !== container)
	        elt = elt.parentNode;

	      return $(elt);
	    }
	  };

	  /**
	   * Register JQuery plugin
	   */
	  $.fn.tagsinput = function(arg1, arg2, arg3) {
	    var results = [];

	    this.each(function() {
	      var tagsinput = $(this).data('tagsinput');
	      // Initialize a new tags input
	      if (!tagsinput) {
	          tagsinput = new TagsInput(this, arg1);
	          $(this).data('tagsinput', tagsinput);
	          results.push(tagsinput);

	          if (this.tagName === 'SELECT') {
	              $('option', $(this)).attr('selected', 'selected');
	          }

	          // Init tags from $(this).val()
	          $(this).val($(this).val());
	      } else if (!arg1 && !arg2) {
	          // tagsinput already exists
	          // no function, trying to init
	          results.push(tagsinput);
	      } else if(tagsinput[arg1] !== undefined) {
	          // Invoke function on existing tags input
	            if(tagsinput[arg1].length === 3 && arg3 !== undefined){
	               var retVal = tagsinput[arg1](arg2, null, arg3);
	            }else{
	               var retVal = tagsinput[arg1](arg2);
	            }
	          if (retVal !== undefined)
	              results.push(retVal);
	      }
	    });

	    if ( typeof arg1 == 'string') {
	      // Return the results from the invoked function calls
	      return results.length > 1 ? results : results[0];
	    } else {
	      return results;
	    }
	  };

	  $.fn.tagsinput.Constructor = TagsInput;

	  /**
	   * Most options support both a string or number as well as a function as
	   * option value. This function makes sure that the option with the given
	   * key in the given options is wrapped in a function
	   */
	  function makeOptionItemFunction(options, key) {
	    if (typeof options[key] !== 'function') {
	      var propertyName = options[key];
	      options[key] = function(item) { return item[propertyName]; };
	    }
	  }
	  function makeOptionFunction(options, key) {
	    if (typeof options[key] !== 'function') {
	      var value = options[key];
	      options[key] = function() { return value; };
	    }
	  }
	  /**
	   * HtmlEncodes the given value
	   */
	  var htmlEncodeContainer = $('<div />');
	  function htmlEncode(value) {
	    if (value) {
	      return htmlEncodeContainer.text(value).html();
	    } else {
	      return '';
	    }
	  }

	  /**
	   * Returns the position of the caret in the given input field
	   * http://flightschool.acylt.com/devnotes/caret-position-woes/
	   */
	  function doGetCaretPosition(oField) {
	    var iCaretPos = 0;
	    if (document.selection) {
	      oField.focus ();
	      var oSel = document.selection.createRange();
	      oSel.moveStart ('character', -oField.value.length);
	      iCaretPos = oSel.text.length;
	    } else if (oField.selectionStart || oField.selectionStart == '0') {
	      iCaretPos = oField.selectionStart;
	    }
	    return (iCaretPos);
	  }

	  /**
	    * Returns boolean indicates whether user has pressed an expected key combination.
	    * @param object keyPressEvent: JavaScript event object, refer
	    *     http://www.w3.org/TR/2003/WD-DOM-Level-3-Events-20030331/ecma-script-binding.html
	    * @param object lookupList: expected key combinations, as in:
	    *     [13, {which: 188, shiftKey: true}]
	    */
	  function keyCombinationInList(keyPressEvent, lookupList) {
	      var found = false;
	      $.each(lookupList, function (index, keyCombination) {
	          if (typeof (keyCombination) === 'number' && keyPressEvent.which === keyCombination) {
	              found = true;
	              return false;
	          }

	          if (keyPressEvent.which === keyCombination.which) {
	              var alt = !keyCombination.hasOwnProperty('altKey') || keyPressEvent.altKey === keyCombination.altKey,
	                  shift = !keyCombination.hasOwnProperty('shiftKey') || keyPressEvent.shiftKey === keyCombination.shiftKey,
	                  ctrl = !keyCombination.hasOwnProperty('ctrlKey') || keyPressEvent.ctrlKey === keyCombination.ctrlKey;
	              if (alt && shift && ctrl) {
	                  found = true;
	                  return false;
	              }
	          }
	      });

	      return found;
	  }
	   
	  $(function() {
	    $("input[data-role=tagsinput], select[multiple][data-role=tagsinput]").tagsinput();
	  });
	})(window.jQuery);

/**
* Initialize tagsinput behaviour on inputs and selects which have
* data-role=tagsinput
*/

//////////////////////

var maxChecked = 3;
var totalChecked = 0;

function fncAddGroup(){
	
	var regName = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;
	var regLimit = /^[0-9]+$/;
	var check = $("#interest_no1").val();
	var groupName = $("#groupName").val();
	var memberLimit = $("#memberLimit").val();
	var nameCheck = $("#nameCheck").val();
	
	if(nameCheck == "1"){
		alert("이미존재하는 모임명입니다.");
		$("#groupName").focus();
		return;
	}
	
    if(regName.test(groupName)){
    	alert("모임명에는 특수문자를 입력하실수 없습니다.");
        $("#groupName").val("");
        $("#groupName").focus();
        return;
    }
	
    if(!regLimit.test(memberLimit)){
    	if(memberLimit!=""){
    		alert("모임원 수에는 숫자만 입력하실수 있습니다.");
        	$("#memberLimit").val("");
            $("#memberLimit").focus();
            return;
    	}
    }
	
	if(groupName==""){
		alert("모임명은 반드시 입력하셔야합니다.");
		return;
	}
	
	if(!$("#memberLimitCheck").is(":checked") && memberLimit==""){
		alert("제한인원을 반드시 입력하셔야합니다.");
		return;
	}
	
	if(check==""){
		alert("관심사 1개는 반드시 선택하셔야 합니다.");
		return;
	}
	
	$("#form").attr("method" , "POST").attr("action" , "/group/addGroup").submit();
}


function CountChecked(field) {
	
    if (field.checked){
    	totalChecked += 1;
    	
    	if(totalChecked==1){
        	$("#interest_no1").val(field.value);
        }
    	else if(totalChecked==2){
    	   	$("#interest_no2").val(field.value);
    	}
    	else if(totalChecked==3){
    	   	$("#interest_no3").val(field.value);
    	}
    }
    else{
    	totalChecked -= 1;
    	
    	if(totalChecked==2){
        	$("#interest_no3").val("");
        }
    	else if(totalChecked==1){
    	   	$("#interest_no2").val("");
    	}
    	else if(totalChecked==0){
    	   	$("#interest_no1").val("");
    	}
    }
    
    if (totalChecked > maxChecked) {
        alert ("최대 3개 까지만 가능합니다.");
    field.checked = false;
    totalChecked -= 1;
    }
    
}	

$(document).on("keyup","input[name=hashInput]",function(e) {
	if(e.keyCode==8){
		if(i >= 0){
			i = $("#count").val();
			i--;
			if(i == -1)
				i = 0;
			$("#count").val(i);
		}
	}
});	 

 
$(function(){
	
	$("#postcodify_search_button").postcodifyPopUp();
	 
	$("#memberLimitCheck").bind("click", function() {
		
		if( $("#memberLimitCheck").is(":checked") ){
			$("#memberLimit").attr("disabled",true);
			$("#memberLimit").val("");
		}
		else{
			$("#memberLimit").attr("disabled",false);
			$("#memberLimit").val("30");
		}
	});
	
	
	$("#add").bind("click", function() {
		fncAddGroup();
	});
	
	$("#mainImg").change(function(){
		if($(this).val() != ""){
			var ext = $(this).val().split(".").pop().toLowerCase();
			if($.inArray(ext, ["jpg","gif","jpeg","png"]) == -1){
				alert("gif, jpg, jpeg, png 파일만 업로드 해주세요.");
				$(this).val("");
				return;
			}
			
			var fileSize = this.files[0].size;
			var maxSize = 1024 * 1024;
			if(fileSize > maxSize){
				alert("파일용량이 1MB를 초과했습니다.");
				$(this).val("");
			}

		}
	});
		
	$("#groupName").bind("keyup", function() {
		
		if ($("#groupName").val().length == 0) {
			$("#checkName").text("모임명을 입력해주세요.");
		}
		else{

			$.ajax({
						url : "/group/json/checkedGroupName/",
						method : "POST" ,
						data : { 	
										groupName : $("#groupName").val(),
									} ,	
						contentType : "application/x-www-form-urlencoded; charset=UTF-8",
						dataType : "json" ,
						success : function(JSONData, status) {
							if (JSONData == "1") {
								$("#checkName").text("사용할 수 있는 모임명입니다.");
								$("#nameCheck").val("0");
							} else {				
								$("#checkName").text("이미 존재하는 모임명입니다.");
								$("#nameCheck").val("1");
							} 
						}
				});
		}
	
	}); 

});	

</script>

</head>

<body>

<div class="container">
	<div class="row">
	<form class="form-horizontal" id="form" enctype="multipart/form-data">
<fieldset>

<legend>::: 모임생성</legend>

<div class="control-group">
  <label class="control-label">모임명</label>
  <div class="controls">
    <input id="groupName" name="groupName" class="input-xlarge" type="text" maxlength="10">
    <strong class="text-danger"	id="checkName">모임명을 입력해주세요.</strong>
  </div>
</div> 

<div class="control-group">
  <label class="control-label">대표이미지</label>
  <div class="controls">
    <input id="mainImg" name="mainImgFile" class="input-file" type="file">
  </div>
</div>

<div class="control-group">
  <label class="control-label">활동지</label>
  <div class="controls">            
    <input id="address" name="address" class="postcodify_address form-control input-md" placeholder="주소를 검색하세요."type="text" readonly> 
 
    <input id="postcodify_search_button" name="postcodify_search_button" class="btn btn-default" type="button" value="검색">
 </div>
</div>

<div class="control-group">
  <label class="control-label" for="groupInfo">소개글</label>
  <div class="controls">
    <textArea id="groupInfo" name="groupInfo" style="width:500px; height:200px;" maxlength="150"></textArea>
  </div>
</div>

<!-- Text input-->
<div class="control-group">
  <label class="control-label">인원제한</label>
  <div class="controls">
    <input id="memberLimit" name="memberLimit" class="input-xlarge" value="30" type="text"  maxlength="3">
  	<input id="memberLimitCheck" type="checkbox"> 제한없음
  </div>
</div>

<div class="control-group">
  <label class="control-label" for="course">연령제한</label>
  <div class="controls">
    <select id="ageLimitStart" name="ageLimitStart" class="input-xlarge">
		<c:forEach var="i" begin="1918" end="2018" step="1">
			<option value="${i}">${i}</option>
		</c:forEach>
    </select>
      ~
    <select id="ageLimitEnd" name="ageLimitEnd" class="input-xlarge">
		<c:forEach var="i" begin="1918" end="2018" step="1">
			<option value="${i}" selected>${i}</option>
		</c:forEach>
    </select>
  </div>
</div>


<!-- Multiple Radios (inline) -->
<div class="control-group">
  <label class="control-label" for="interest">관심사</label>
  <div class="controls">
    <input type="checkbox" value="스포츠" onClick=CountChecked(this)> 스포츠 
 	<input type="checkbox" value="친목" onClick=CountChecked(this)> 친목 
	<input type="checkbox" value="스터디" onClick=CountChecked(this)> 스터디
	<input type="checkbox" value="예술" onClick=CountChecked(this)> 예술
 	<input type="checkbox" value="게임" onClick=CountChecked(this)> 게임 
	<input type="checkbox" value="여행" onClick=CountChecked(this)> 여행
	<input type="checkbox" value="건강" onClick=CountChecked(this)> 건강 
 	<input type="checkbox" value="음식" onClick=CountChecked(this)> 음식 
	<input type="checkbox" value="고민" onClick=CountChecked(this)> 고민
	<input type="checkbox" value="자유주제" onClick=CountChecked(this)> 자유주제

	<input type="hidden" id="hashTag" name="hashTag" value=" "/>
	<input type="hidden" id="count" name="count" value="0"/>
	<input type="hidden" id="nameCheck" value="0"/>
	<input type="hidden" id="interest_no1" name="interestNo1" value=""/>
	<input type="hidden" id="interest_no2" name="interestNo2" value=""/>
	<input type="hidden" id="interest_no3" name="interestNo3" value=""/>
	
  </div>
</div>

<div class="control-group">
  <label class="control-label" for="hashTag">해시태그</label>
  <div class="controls">
  	<input type="text" data-role="tagsinput">
  </div>
</div>

<div class="control-group">
  <label class="control-label" for="submit"></label>
  <div class="controls">
    <input id="add" class="btn btn-primary" type="button" value="생성">
  </div>
</div>

</fieldset>
</form>

	</div>
</div>


<script type="text/javascript" src="./js/hashTag.js"></script>
</body>

</html>