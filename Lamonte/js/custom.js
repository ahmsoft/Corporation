jQuery(document).ready(function(){
	
	//Add Class Js to html
	jQuery('html').addClass('js');	
	
    //=================================== MENU ===================================//
	jQuery("ul.sf-menu").supersubs({ 
	minWidth		: 10,		// requires em unit.
	maxWidth		: 15,		// requires em unit.
	extraWidth		: 3	// extra width can ensure lines don't sometimes turn over due to slight browser differences in how they round-off values
						   // due to slight rounding differences and font-family 
	}).superfish();  // call supersubs first, then superfish, so that subs are 
					 // not display:none when measuring. Call before initialising 
					 // containing tabs for same reason. 
	
	//=================================== MOBILE MENU DROPDOWN ===================================//
	jQuery('#topnav').tinyNav({
		active: 'current'
	});	
	
//=================================== CAROUSEL ===================================//
	jQuery(document).ready(function(){
	
		var carousel = jQuery('.carousel');
		
		function carousel_port_init(){
			carousel.each(function(){
				var port_carousel = jQuery(this);
				var port_holder = port_carousel.children('.carousel-item-container');
				var port_item = port_carousel.find('.item');
				
				port_item.css('float', 'right');
				
				var child_size;
				if( port_item.filter(':first').hasClass('one_fourth') ){
					port_holder.attr('data-num', 4);
					child_size = port_carousel.parents('.row').width() / 4;
				}else if( port_item.filter(':first').hasClass('one_third') ){
					port_holder.attr('data-num', 3);
					child_size = port_carousel.parents('.row').width() / 3;
				}
				
				if( jQuery(window).width() <= '767' ){
					port_holder.attr('data-num', 1);
					child_size = port_carousel.parents('.row').width();
				}
				
				port_item.width( child_size );
				
				port_holder.attr('data-width', child_size);
				port_holder.attr('data-max', port_item.length);
				port_holder.width( port_item.length * child_size );
				
				var cur_index = parseInt(port_holder.attr('data-index'));
				port_holder.css({ 'margin-right': -(cur_index * child_size + 10) });
			});
		}
		
		// navigation
		var port_nav = carousel.children('.carousel-nav');
		port_nav.children('.port-nav.right').click(function(){
			var port_holder = jQuery(this).parent('.carousel-nav').siblings('.carousel-item-container');
			var cur_index = parseInt(port_holder.attr('data-index'));
			
			if( cur_index > 0 ){ cur_index--;  }
			
			port_holder.attr('data-index', cur_index);
			port_holder.animate({ 'margin-right': -(cur_index * parseInt(port_holder.attr('data-width')) + 10) });
		});
		port_nav.children('.port-nav.left').click(function(){
			var port_holder = jQuery(this).parent('.carousel-nav').siblings('.carousel-item-container');
			var cur_index = parseInt(port_holder.attr('data-index'));
			
			if( cur_index + parseInt(port_holder.attr('data-num')) < parseInt(port_holder.attr('data-max')) ){
				cur_index++;
			}
			
			port_holder.attr('data-index', cur_index);
			port_holder.animate({ 'margin-right': -(cur_index * parseInt(port_holder.attr('data-width')) + 10) });
		});
		
		carousel_port_init();

		jQuery(window).resize(function(){
			carousel_port_init();
		});
		
	});
	
	//=================================== BACK TO TOP ===================================//
	jQuery(window).scroll(function() {
		if(jQuery(this).scrollTop() != 0) {
			jQuery('#toTop').fadeIn();	
		} else {
			jQuery('#toTop').fadeOut();
		}
	});
 
	jQuery('#toTop').click(function() {
		jQuery('body,html').animate({scrollTop:0},800);
	});	
	
});


