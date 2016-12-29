<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<footer style="opacity: 1; top: 0px;" id="footer" role="contentinfo">

	<div class="row">

		<div class="col-12">

			<div class="left">
				<script type="text/javascript">
					var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://"
							: " http://");
					document
							.write(unescape("%3Cscript src='"
									+ _bdhmProtocol
									+ "hm.baidu.com/h.js%3F7dff31a2111bbc9caa18e047c49254f4' type='text/javascript'%3E%3C/script%3E"));
				</script>
				Copyright© 2014 <a class="transition" href="http://www.miitbeian.gov.cn/">豫ICP备14019584 </a>

			</div>

			<nav id="nav-footer">

				<ul>
					<li class="page_item page-item-2"><a
						href="/code">coder</a>
					</li>
					<li class="page_item page-item-5"><a
						href="/photo">photo</a>
					</li>

					<li class="page_item page-item-9"><a href="/blog">blog</a>
					</li>
					<li class="page_item page-item-11"><a
						href="/contact">contact</a>
					</li>
				</ul>

			</nav>

			<div class="right">
				<wb:follow-button uid="2000645405" type="red_3" width="100%"
					height="24"></wb:follow-button>
			</div>

		</div>

	</div>

	<div class="gradient-white">
		<a class="top" href="#top">back to top</a>
	</div>

</footer>

<script type="text/javascript" src="files/jquery.js"></script>

<script src="files/jquery_002.js"></script>

<script src="files/script.js"></script>

<script type="text/javascript">
<!--
	//If browser is IE8 or older we show IE specific page
	if (ie < 9) {
		ieMessage();
	}

	/*
	 * Call functions when dom is ready
	 */
	$(document).ready(function() {

		// Hide browser top bar in mobiles
		$('body').scrollTop(1);

		// Toggle Navigation for mobile devices
		$('.icon-nav').on('click', function() {
			$('header nav').slideToggle();
			$(this).toggleClass('active');
		});

		// Function to scroll to top
		$('a[href=#top]').click(function() {

			$('html, body').animate({
				scrollTop : 0
			}, 600, 'easeInExpo');
			return false;
		});

		// Function to fade in image sprites
		$('.sprite').fadeSprite();

		//Function for thumbnail hover effect
		$('.thumbs li').hoverThumb();

		// Function to animate when leaving page
		$('.transition, #next a, #prev a, #logo').leavePage();

		// Preload the page with jPreLoader
		$('body').jpreLoader({

			showSplash : true

		}, function() {

			//Show the page once images are loaded

			// Animate the header first
			$('#header').stop().animate({
				'opacity' : '1',
				'top' : '0'
			}, 1000);

			$('#face').animateHome();
			$('#face').resizeFace();

		});

	});
</script>




</body>
</html>
