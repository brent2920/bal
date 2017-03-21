/**
 * go map !
 */


var map;
var infoWindow;
var service;
var temp =
{  
	   "geometry":{  
	      "location":{  
	         "lat":37.5326049,
	         "lng":126.8646878
	 //getBounds==>((37.512404078607844, 126.83898150880123), (37.549976293684466, 126.87949359376216))
	      }
	   },
	   "id":"2e3dec069aed3a50278a0f8556d7520d84d3c4e6",
	   "place_id":"ChIJZ934S0KuEmsR_0lxV3PTR4M",
	   "reference":"CmRSAAAA63xm_pqSZSM6v3eVji64Ael9avkjcYNxKRPNVlA_06Mi5TfIhXHdJ6JJCvjUgjfqQ0H-uFA8odt17_NB-fGBXv2XpbI_NnCKxnFqcsUXmQLiUP1ATfoANN2feZfObRW1EhAdYjAWa3tqFP8aV_1zaMVlGhSYN-eSQxYD3WyPaxKj1u2VYMBdCg",
	   "html_attributions":[  

	   ]
	}; 
var temp2 =
{  
	   "geometry":{  
	      "location":{  
	         "lat":-33.8615479,
	         "lng":152.20760719999998
	      }
	   },
	   "id":"2e3dec069aed3a50278a0f8556d7520d84d3c4e6",
	   "place_id":"ChIJZ934S0KuEmsR_0lxV3PTR4M",
	   "reference":"CmRSAAAA63xm_pqSZSM6v3eVji64Ael9avkjcYNxKRPNVlA_06Mi5TfIhXHdJ6JJCvjUgjfqQ0H-uFA8odt17_NB-fGBXv2XpbI_NnCKxnFqcsUXmQLiUP1ATfoANN2feZfObRW1EhAdYjAWa3tqFP8aV_1zaMVlGhSYN-eSQxYD3WyPaxKj1u2VYMBdCg",
	   "html_attributions":[  

	   ]
	}; 


function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat:37.5326049, lng: 126.8646878},
    zoom: 15,
    styles: [{
      stylers: [{ visibility: 'simplified' }]
    }, {
      elementType: 'labels',
      stylers: [{ visibility: 'off' }]
    }]
  });

  infoWindow = new google.maps.InfoWindow();
  service = new google.maps.places.PlacesService(map);

  // The idle event is a debounced event, so we can query & listen without
  // throwing too many requests at the server.
  map.addListener('idle', performSearch);
}

function performSearch() {
  var request = {
    bounds: map.getBounds(),
    keyword: 'best view'
  };
  service.radarSearch(request, callback);
}

function callback(results, status) {
  if (status !== google.maps.places.PlacesServiceStatus.OK) {
    console.error(status);
    return;
  }
  addMarker(temp);

//  for (var i = 0, result; result = results[i]; i++) {
//	  console.log("result=>"+ result.toString);
//    addMarker(result);
//  }
}

function addMarker(place) {
	//console.log("place=>"+JSON.stringify(place));
	  console.log("center===>"+map.getCenter());
	  console.log("getBounds==>"+map.getBounds());
  var marker = new google.maps.Marker({
    map: map,
    position: place.geometry.location,
    icon: {
      url: 'http://maps.gstatic.com/mapfiles/circle.png',
      anchor: new google.maps.Point(10, 10),
      scaledSize: new google.maps.Size(10, 17)
    }
  });

  google.maps.event.addListener(marker, 'click', function() {

    service.getDetails(place, function(result, status) {
      if (status !== google.maps.places.PlacesServiceStatus.OK) {
        console.error(status);
        return;
      }
      infoWindow.setContent(result.name);
      infoWindow.open(map, marker);
    });
  });
}