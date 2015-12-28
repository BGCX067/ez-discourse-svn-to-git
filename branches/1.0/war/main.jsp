<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<script src="/js/jquery-2.1.0.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/main.css" />
<link rel="stylesheet" href="/css/bootstrap.min.css" />
<title>EZ Discourse</title>
<script>
	$(document).ready(function() {
		$("#submit-url").click(function() {
			var img = $("<img style='width: 400px' />").attr("src", $("#url").val()).load(function() {
				if (!this.complete || typeof this.naturalWidth == "undefined" || this.naturalWidth == 0) {
					console.log('broken image!');
				} else {
					$(".preview-image").append(img);
					console.log('load image!');
				}
			});
		});
		var canvas = document.getElementById("canvas");
		var ctx = canvas.getContext("2d");

		var canvasOffset = $("#canvas").offset();
		var offsetX = canvasOffset.left;
		var offsetY = canvasOffset.top;

		// animation variables
		var currentX = 10;
		var currentY = 10;
		var frameCount = 60;
		var timer;
		var points;
		var currentFrame;

		function animate() {
			var point = points[currentFrame++];
			draw(point.x, point.y);

			// refire the timer until out-of-points
			if (currentFrame < points.length) {
				timer = setTimeout(animate, 1000 / 60);
			}
		}

		function linePoints(x1, y1, x2, y2, frames) {
			var dx = x2 - x1;
			var dy = y2 - y1;
			var length = Math.sqrt(dx * dx + dy * dy);
			var incrementX = dx / frames;
			var incrementY = dy / frames;
			var a = new Array();

			a.push({
				x : x1,
				y : y1
			});
			for (var frame = 0; frame < frames - 1; frame++) {
				a.push({
					x : x1 + (incrementX * frame),
					y : y1 + (incrementY * frame)
				});
			}
			a.push({
				x : x2,
				y : y2
			});
			return (a);
		}

		function draw(x, y) {
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			ctx.beginPath();
			ctx.fillStyle = "skyblue";
			ctx.strokeStyle = "gray";
			ctx.rect(x, y, 30, 20);
			ctx.fill();
			ctx.stroke();
		}

		function handleMouseDown(e) {
			mouseX = parseInt(e.clientX - offsetX);
			mouseY = parseInt(e.clientY - offsetY);
			$("#downlog").html("Down: " + mouseX + " / " + mouseY);

			// Put your mousedown stuff here
			points = linePoints(currentX, currentY, mouseX, mouseY, frameCount);
			currentFrame = 0;
			currentX = mouseX;
			currentY = mouseY;
			animate();
		}

		$("#canvas").mousedown(function(e) {
			handleMouseDown(e);
		});

		draw(10, 10);
	});
</script>
</head>
<body>
	<!-- Navbar top position -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header pull-left">
				<a class="navbar-brand" href="#">Ez Discourse</a>
			</div>
		</div>
	</nav>

	<!--  Main container -->
	<div class="center-view">
		<div class="container">
			<div class="main-frame">
				<!-- 			<div class="image-frame"> -->
				<!-- 				<div class="preview-image"> -->
				<!-- 					<canvas id="canvas" width="100%" height=300></canvas> -->
				<!-- 				</div> -->
				<!-- 			</div> -->
			</div>
		</div>
	</div>

	<!-- 	Navbar bottom position -->
	<nav class="navbar navbar-inverse navbar-fixed-bottom"
		role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Insert <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#">+ Text</a></li>
							<li class="divider"></li>
							<li><a href="#">+ Image</a></li>
						</ul></li>
				</ul>
				<div class="navbar-form navbar-right">
					<div class="form-group">
						<input type="email" id="url" class="form-control" id="url"
							placeholder="Enter Url" />

					</div>
					<button type="submit" id="submit-url" class="btn btn-default">Load</button>
				</div>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>

</body>
</html>