;(function($){

	$.fn.niceTree = function(method) {
		
		// Default properties for the tree
		var defaults = {
			animation			: 'none',
			animSpeed			: 'fast',
			ajaxId				: 'nicetree-content',
			ajaxLoadingText		: '<img src="./css/img/ajax-loader.gif" alt="Loading" />',
			ajaxOptions			: {},
			allowMultiple		: false,
			color				: 'blue',
			ellipsis			: true,
			highlightNoMenu		: true,
			useCookies			: false
		};
		
		var helpers = {
		
			state: function(uls) {
				return uls
						.map(function() {
							if($(this).is(':hidden')) {
								return 0;
							} else {
								return 1;
							}
						}).get().join(',');
			},
			
			cookie: function(action, id, ul, cookies) {
				if (cookies) {
					if (action === 'set') {
						document.cookie = 'nicetree-' + id + '=' + escape(ul);
					} else {
						var dcookie = document.cookie;
						var index = dcookie.indexOf('nicetree-' + id + '=');
						
						if (index >= 0) {
							if (action === 'check') {
								return true;
							}
							
							var start = index + id.length + 10;
							var end = dcookie.indexOf(';', start);
							
							if (start !== id.length) {
								if (end === -1) {
									end = dcookie.length;
								}
								
								return unescape(dcookie.substring(start, end));
							}
						}
						
						return false;
					}
				}
				
				return false;
			}
		};
		
		var methods = {
		
			init: function(options) {
			
				var option = $.extend(defaults, options);
				
				return this.each(function() {
				
					var $tree = $(this);
					var treeId = $tree.attr('id');
					
					// Store options
					$tree.data('tree-options', option);
					
					// Add tree class
					$tree.addClass('nicetree');
					
					// Add Theme
					$tree.children('li').addClass(option.color);
					
					// Ellipsis Option
					if (!option.ellipsis) {
						$tree.find('a').css('text-overflow', 'clip').css('white-space', 'normal');
					}
					
					// Add a subsection class to all uls
					$tree.find('ul').addClass('subsections');
					
					// All menus should start collapsed
					$tree.find('li').removeClass('active').removeClass('withsubsections').children('a').removeClass('selected');
					$tree.find('ul').hide();
					
					// Figure out is cookies are being used
					if (helpers.cookie('check', treeId, false, option.useCookies)) {
						var uls = helpers.cookie('get', treeId, false, option.useCookies).split(',');
						var index = 0;
						
						$tree.find('ul').each(function() {
							if (parseInt(uls[index], 10)) {
								if (!$(this).parent('li').parent('ul').hasClass('subsections')) {
									$(this).show().parent('li').addClass('active').addClass('withsubsections').children('a').addClass('selected');
								} else {
									$(this).show();
								}
							} else {
								$(this).hide();
							}
							
							index += 1;
						});
					} else {
						// Open menu if it has the open class
						$tree.children('li.nt_open').addClass('active').addClass('withsubsections').children('a').addClass('selected').end().children('ul').show();
						$tree.children('li').find('li.nt_open').children('ul').show();
						
						$tree.children('li.nt_open').each(function() {
							if ($(this).children('ul').length < 1) {
								$(this).css('padding-bottom', '0');
							}
						});
					}
					
					// What to do when the tree is clicked
					$tree.children('li').click(function() {
						if (!option.allowMultiple) {
							$tree.children('li').not($(this)).removeClass('active').removeClass('withsubsections').children('a').removeClass('selected');
							$tree.children('li').not($(this)).children('ul').slideUp(option.animSpeed, function() {});
						}
						
						if ($(this).children('ul').length < 1) {
							$(this).css('padding-bottom', '0');
							helpers.cookie('set', treeId, helpers.state($tree.find('ul')), option.useCookies);
						}
						
						if ($(this).children('ul').length < 1 && !option.highlightNoMenu) {
						} else {
							$(this).toggleClass('active').toggleClass('withsubsections').children('a').toggleClass('selected');
							
							if (option.animation != 'none')
								$(this).children('ul').children('li').css("visibility", "hidden");
							
							$(this).children('ul').slideToggle(option.animSpeed, function() {
								if (option.animation == 'slide')
									$(this).children('li').css("visibility", "visible").show("slide", {direction: "left"}, option.animSpeed);
									
								if (option.animation == 'fold')
									$(this).children('li').css("visibility", "visible").show("fold", {}, option.animSpeed);
									
								if (option.animation == 'explode')
									$(this).children('li').css("visibility", "visible").show("explode", {}, option.animSpeed);
									
								if (option.animation == 'drop')
									$(this).children('li').css("visibility", "visible").show("drop", {direction: 'up'}, option.animSpeed);
									
								if (option.animation == 'clip')
									$(this).children('li').css("visibility", "visible").show("clip", {direction: 'vertical'}, option.animSpeed);
									
								if (option.animation == 'cliph')
									$(this).children('li').css("visibility", "visible").show("clip", {direction: 'horizontal'}, option.animSpeed);
									
								if (option.animation == 'blind')
									$(this).children('li').css("visibility", "visible").show("blind", {direction: 'horizontal'}, option.animSpeed);
									
								if (option.animation == 'bounce')
									$(this).children('li').css("visibility", "visible").show("scale", {percent: 200, origin:['left','top']}, option.animSpeed);
									
								helpers.cookie('set', treeId, helpers.state($tree.find('ul')), option.useCookies);
							});
						}
						
						if ($(this).children('a').attr('href') == "#" || $(this).children('a').attr('rel') == "nicetree-ajax") {
							return false;
						}
					}).find('li').not(".subsections").click(function() {
						if ($(this).children('a').attr('href') != "#" && $(this).children('a').attr('rel') != "nicetree-ajax") {
							window.location.href = $(this).children('a').attr('href');
						
							return false;
						}
						
						return false;
					});
					
					// What to do when ajax link is clicked
					$tree.find('a[rel*="nicetree-ajax"]').click(function() {
						$('#' + option.ajaxId).html(option.ajaxLoadingText);
						var ajaxDefaults = {
							dataType: 'html',
							url: $(this).attr('href'),
							error: function(xhr) {
								$('#' + option.ajaxId).html(xhr.statusText + ' ' + xhr.status);
							},
							success: function(data) {
								$('#' + option.ajaxId).html(data);
							}
						};
						$.ajax($.extend(ajaxDefaults, option.ajaxOptions));
					});
					
					// What to do when an expand is clicked
					$('.nicetree_expand').click(function() {
						var expand_id = $(this).attr('rel');
						$('#'+expand_id).niceTree('expand');
					});
					
					// What to do when a collapse is clicked
					$('.nicetree_collapse').click(function() {
						var collapse_id = $(this).attr('rel');
						$('#'+collapse_id).niceTree('collapse');
					});
					
					// What to do when a link is clicked with no link
					$tree.find('a[href="#"]').click(function(e) {
						e.preventDefault();
					});
					
					// What to do when submenu is clicked
					$tree.children('li').find('li').click(function() {
						$(this).children('ul').slideToggle(option.animSpeed, function() {
							helpers.cookie('set', treeId, helpers.state($tree.find('ul')), option.useCookies);
						});
					});
					
					// What to do when the tree is moused over
					$tree.children('li').mouseover(function() {
						$(this).children('a').addClass('nicetree_hover');
					});
					
					// What to do when the tree is moused out
					$tree.children('li').mouseout(function() {
						$(this).children('a').removeClass('nicetree_hover');
					});
				});
			},
			
			expand: function() {
				return this.each(function() {
				
					var $tree = $(this);
					var treeId = $tree.attr('id');
					var option = $tree.data('tree-options');
				
					$tree.children('li').addClass('active').addClass('withsubsections').children('a').addClass('selected');
					$tree.children('li').children('ul').slideDown(option.animSpeed, function() {});
					$tree.children('li').find('li').children('ul').slideDown(option.animSpeed, function() {
						helpers.cookie('set', treeId, helpers.state($tree.find('ul')), option.useCookies);
					});
					
					$tree.children('li').each(function() {
						if ($(this).children('ul').length < 1) {
							$(this).css('padding-bottom', '0');
						}
					});
				});
			},
			
			collapse: function() {
				return this.each(function() {
				
					var $tree = $(this);
					var treeId = $tree.attr('id');
					var option = $tree.data('tree-options');
				
					$tree.children('li').removeClass('active').removeClass('withsubsections').children('a').removeClass('selected');
					$tree.children('li').children('ul').slideUp(option.animSpeed, function() {});
					$tree.children('li').find('li').children('ul').slideUp(option.animSpeed, function() {
						helpers.cookie('set', treeId, helpers.state($tree.find('ul')), option.useCookies);
					});
				});
			}
		};
		
        if (methods[method] && method.toLowerCase() != 'init') {
			return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
        } else if (typeof method === 'object' || !method){
			return methods.init.apply(this, arguments);
        } else {
			$.error('Method "' +  method + '" does not exist in niceTree');
        }
	};
}(jQuery));