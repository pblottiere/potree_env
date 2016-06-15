<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Greyhound Potree Viewer</title>

	<link rel="stylesheet" type="text/css" href="../src/viewer/potree.css">
	<link rel="stylesheet" type="text/css" href="../libs/jquery-ui-1.11.4/jquery-ui.css">
	<link rel="stylesheet" href="http://openlayers.org/en/v3.11.2/css/ol.css" type="text/css">
  </head>

  <body>

	<script src="../libs/jquery-2.1.4/jquery-2.1.4.min.js"></script>
	<script src="../libs/jquery-ui-1.11.4/jquery-ui.min.js"></script>

	<script src="../libs/three.js/build/three.js"></script>
	<script src="../libs/other/stats.min.js"></script>
	<script src="../libs/other/BinaryHeap.js"></script>
	<script src="../libs/tween/tween.min.js"></script>
	<script src="../libs/d3/d3.js"></script>

	<script src="../build/potree/potree.js"></script>

	<script src="http://openlayers.org/en/v3.11.2/build/ol-debug.js"></script>
	<script src="../libs/proj4/proj4.js"></script>
	<script src="../src/viewer/map.js"></script>

    <div class="potree_container" style="position: absolute; width: 100%; height: 100%; left: 0px; top: 0px; ">

		<div id="potree_render_area">

			<img class="potree_menu_toggle" src="../resources/icons/menu_button.svg" onclick="viewer.toggleSidebar()" />
			<img id="potree_map_toggle" src="../resources/icons/map_icon.png" onclick="viewer.toggleMap()" style="display: none"/>

			<div id="potree_map" class="mapBox" style="position: absolute; left: 50px; top: 50px; width: 400px; height: 400px; display: none">
				<div id="potree_map_header" style="position: absolute; width: 100%; height: 25px; top: 0px; background-color: rgba(0,0,0,0.5); z-index: 1000; border-top-left-radius: 3px; border-top-right-radius: 3px;">
				</div>
				<div id="potree_map_content" class="map" style="position: absolute; z-index: 100; top: 25px; width: 100%; height: calc(100% - 25px); border: 2px solid rgba(0,0,0,0.5); box-sizing: border-box;"></div>
			</div>

			<!-- HEADING -->
			<div id="potree_description" class="potree_info_text"></div>
		</div>

		<div id="potree_sidebar_container"> </div>
    </div>

	<script>

		var onPointCloudLoaded = function(event){
			// do stuff here that should be executed whenever a point cloud has been loaded.
			// event.pointcloud returns the point cloud object
			console.log("a point cloud has been loaded");
		};

		viewer = new Potree.Viewer(document.getElementById("potree_render_area"), {
			"onPointCloudLoaded": onPointCloudLoaded
		});

		viewer.setEDLEnabled(true);
		viewer.setPointSize(3);
		viewer.setMaterial("RGB");
		viewer.setFOV(60);
		viewer.setPointSizing("Fixed");
		viewer.setQuality("Squares");
		viewer.setPointBudget(2*1000*1000);
		viewer.setDescription("");

        // Since this parameter to addPointCloud starts with the string
        // 'greyhound://', it is recognised as a greyhound server URL.
        var server = "greyhound://HOST_IP:HOST_PORT_GREYHOUND/resource/"; //IP host / port host
        var resource = "terrain";

		viewer.addPointCloud(server + resource + "/");
		viewer.loadGUI();

	</script>
  </body>
</html>
