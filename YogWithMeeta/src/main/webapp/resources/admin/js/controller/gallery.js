app.controller('galleryCtrl', function($scope, $http, $window, $filter,
			$location, $timeout) {	
	$scope.pages = [10,20,30,40,50,100];
	$scope.currentPage = 0;
    $scope.pageSize = 20;
    $scope.search = '';
    $scope.IVToggle = 1;
    var baseUrl = $location.protocol()+"://"+location.host+url;
    
    $scope.setflag = function (){
    	$scope.errorAlbumName = 0;
    	$scope.msgAlbumName = "";
    	$scope.errorImageTitle = 0;
    	$scope.msgTitle = "";
    	$scope.albumSubmitSuccess = 0;
    	$scope.successMsg = "";
    	$scope.albumSubmitError = 0;
    	$scope.errorMsg = "";
    	$scope.spin=0;
    	$scope.erroreditImageTitle = 0;
		$scope.msgeditTitle = "";
    	$scope.albumEditSubmitSuccess = 0;
    	$scope.successEditMsg = "";
    	$scope.albumEditSubmitError = 0;
    	$scope.errorEditMsg = "";
    	
    }
    
    $scope.getData = function () {
    	return $filter('filter')($scope.data, $scope.search)
    }
    $scope.numberOfPages=function() {
    	return Math.ceil($scope.album.length/$scope.pageSize);
    }
    
    $scope.getALbumOnCall = function(){
    	 var link = baseUrl+'getAllAlbum';
    		$http.get(link).success(function(data, status, headers, config) {
    			$scope.getallalbum = data;
    		}).error(function(data, status, headers, config) {
    			$scope.getallalbum = "Response Fail";
    		});
    }
    
    var link = baseUrl+'getAllAlbum';
	$http.get(link).success(function(data, status, headers, config) {
		$scope.getallalbum = data;
	}).error(function(data, status, headers, config) {
		$scope.getallalbum = "Response Fail";
	});
	
	$scope.getId = function(url) {
	    const regExp = /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|&v=)([^#&?]*).*/;
	    const match = url.match(regExp);

	    return (match && match[2].length === 11)
	      ? match[2]
	      : null;
	}
	
	var formData = new FormData();
	$scope.albumimage = [{}];
	$scope.addAlbumImageRow = function() {
		var imagedescription = $scope.imagedescription;
		if(imagedescription==undefined || imagedescription=="") {
			imagedescription = "Description";
		}
		
		if(!$scope.VideoUrl) {
			$scope.videoId = "";
			console.log("inside if");
		}else{
			$scope.videoId = $scope.getId($scope.VideoUrl);
			console.log("inside else");
		}
		
		if($scope.imagetitle==undefined || $scope.imagetitle=="") {
			$scope.errorImageTitle = 1;
	    	$scope.msgTitle = "Please Enter Image Title!";
			document.getElementById("imagetitle").focus();
			return;
		} else {
			console.log($scope.videoId);
			$scope.albumimage.push({'imageTitle':$scope.imagetitle, 'imageDescription':imagedescription, 'videoUrl':$scope.videoId});
			formData.append("image",image.files[0]);
			$scope.imagedescription = "";
			$scope.imagetitle = "";
			$scope.VideoUrl = "";
		}
	};
	
	$scope.removeAlbumImageRow = function(imagetitle) {
		var index = -1;
		var comArr = eval( $scope.albumimage);
		for( var i = 0; i < comArr.length; i++ ) {
			if( comArr[i].imageTitle === imagetitle ) {
				index = i;
				break;
			}
		}
		if( index === -1 ) {
			alert( "Something gone wrong" );
		}
		$scope.albumimage.splice( index, 1 );
	};
			
	$scope.temp1 = 1;
	$scope.temp2 = 0;
	
	$scope.addalbum = function() {	
		$scope.spin=1;
		var tourdate = document.getElementById("datepicker").value;		
		
		if($scope.albumsubtitle == undefined) {	
			$scope.albumsubtitle = "";
		}					
		if(tourdate == undefined) {	
			tourdate = "";
		}										
		if($scope.description==undefined) {
			$scope.description="";
		}	
			
		if($scope.albumtitle==undefined || $scope.albumtitle=="") {
			$scope.errorAlbumName = 1;
	    	$scope.msgAlbumName = "Please Enter Album Title!";
			document.getElementById("albumtitle").focus();
			return;
		} else {
			$scope.temp1 = 0;
			$scope.temp2 = 1;
			
			var pap = $scope.albumtitle.replace("&","$");
			var pap1 = pap.replace("#","~");
			var pap2 = pap1.replace("%","!");
			
			var sub = $scope.albumsubtitle.replace("&","$");
			var sub1 = sub.replace("#","~");
			var sub2 = sub1.replace("%","!");
			
			var link = baseUrl + 'addAlbum?title='+pap2+'&subtitle='+sub2+'&tourdate='+tourdate+'&description='+$scope.description;			
			$http.post(link).success(function(data, status, headers, config) {
				$scope.addalbum = data;											
				$scope.titleimage = [];
				$scope.desc = [];
				$scope.VideoUrl=[];
				angular.forEach($scope.albumimage, function(item) {
					if(item.imageTitle != null) {
						console.log(item.imageTitle+"  "+ item.imageTitle  +" "+ item.videoUrl)
						var tit = item.imageTitle.replace("&","$");
						var tit1 = tit.replace("#","~");
						var tit2 = tit1.replace("%","!");
						
						var vid = item.videoUrl.replace("&","$");
						var vid1 = vid.replace("#","~");
						var vid2 = vid1.replace("%","!");
						
						$scope.titleimage.push(tit2);
						$scope.desc.push(item.imageDescription);
						$scope.VideoUrl.push(vid2);
					}
				});														
											
				var link = baseUrl + 'addAlbumImage?imagetitle='+$scope.titleimage+'&imagedescription='+$scope.desc+'&videoId='+$scope.VideoUrl;
				$http({method: 'POST', url: link, headers: {'Content-Type': undefined}, data: formData, transformRequest: function(data, headersGetterFunction) {
					return data;
				}}).success(function(data, status, headers, config) {
					$scope.addalbumimage = data;
					$scope.temp1 = 1;
					$scope.temp2 = 0;
					$scope.albumSubmitSuccess = 1;
			    	$scope.successMsg = "Album added successfully...";
					$window.location.href = adminurl+'manage_Album';
				}).error(function(data, status, headers, config) {
					$scope.addalbumimage = "Response Fail";
					$scope.albumSubmitError = 1;
			    	$scope.errorMsg = "Something went wrong";
				});
			}).error(function() {
				$scope.addalbum = "Responce fail";
			});
		}
	}
	$scope.getAlbum = function(albumid) {
		$scope.id = albumid;
		var link = baseUrl+'getAlbumDetailById?albumid='+albumid;
		$http.get(link).success(function(data, status, headers, config) {
			$scope.album = data;
			
			$scope.editalbumtitle = $scope.album.albumTitle;
			$scope.editalbumsubtitle = $scope.album.albumSubtitle;
			$scope.edittourdate = $scope.album.albumDate;
			$scope.editdescription = $scope.album.description;
			$scope.albumid = $scope.album.albumId;
			
			
		}).error(function(data, status, headers, config) {
			$scope.album = "Response Fail";
		});				
		
		var link = baseUrl+'AlbumImage?albumid='+albumid;					
		$http.get(link).success(function(data, status, headers, config) {
			$scope.albumimagenew = data;
		}).error(function(data, status, headers, config) {
			$scope.albumimagenew = "Response Fail";
		});
	}
	
	$scope.getLink = function(vidId){
		$scope.vidLink="//www.youtube.com/embed/"+vidId;
		$scope.vidLinkkk="<iframe style='height:auto;' width='220' src='https://www.youtube.com/embed/"+vidId+"' frameborder='0' allow='accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe>";
		document.getElementById(vidId).innerHTML = $scope.vidLinkkk;
	}
	$scope.removeRow1 = function(imagetitle) {				
		var index = -1;
		var comArr = eval( $scope.albumimage);
		for( var i = 0; i < comArr.length; i++ ) {
			if( comArr[i].imageTitle === imagetitle ) {
				index = i;
				break;
			}
		}
		if( index === -1 ) {
			alert( "Something gone wrong" );
		}
		$scope.albumimage.splice( index, 1 );
	};
	
	
	/*$scope.albumimagenew = [{}];*/
		
	$scope.addAlbumImageRowEdit = function() {
		if($scope.editimagedescription==undefined || $scope.editimagedescription=="") {
			$scope.editimagedescription = "Description";
		}
		if(!$scope.editVideoUrl) {
			$scope.videoId = "";
		}else{
			$scope.videoId = $scope.getId($scope.editVideoUrl);
		}
		
		if($scope.editimagetitle==undefined || $scope.editimagetitle=="") {
			$window.alert("Please Enter Image Title!");
			document.getElementById("imagetitle").focus();
			return;
		} else {
			var link = baseUrl+'editAlbumImage?albumid='+$scope.albumid+'&imagetitle='+$scope.editimagetitle+'&imagedescription='+$scope.editimagedescription+'&videoId='+$scope.videoId;
			var formData = new FormData();
			formData.append("image",editimage.files[0]);
			$http({method: 'POST', url: link, headers: {'Content-Type': undefined}, data: formData, transformRequest: function(data, headersGetterFunction) { return data; }
			}).success(function(data, status) {
				$scope.editalbumimage = data;
				$scope.getAlbum($scope.albumid);
				$scope.temp1 = 0;
				$scope.temp2 = 1;
				$window.alert("Album image Updated Successfully");
			}).error(function(data, status, headers, config) {
				$scope.editalbumimage = "Response Fail";
			});
			/*$scope.albumimagenew.push({'albumTitle':$scope.editimagetitle, 'albumDescription':$scope.editimagedescription});
			formData.append("image",editimage.files[0]);*/
		}
	};
					
	$scope.removeAlbumImageRowEdit = function(imagetitle, albumid) {				
		var link = baseUrl+'removeAlbumImageRowEdit?albumid='+albumid+'&imagetitle='+imagetitle;
		$http.post(link).success(function(data, status, headers, config) {
			$scope.removeAlbmuImageRow = data;
			$scope.getAlbum($scope.albumid);
		}).error(function(data, status, headers, config) {
			$scope.getalbumoneimage = "Response Fail";
		});
	};
	
	$scope.editalbum = function(albumid) {					
		var title = $scope.editalbumtitle;
		var subtitle = $scope.editalbumsubtitle;
		var AlbumDate = document.getElementById("fromdatetimepickerEdit").value;
		var description = $scope.editdescription;		
					
		if($scope.editalbumsubtitle == undefined) {	
			$scope.editalbumsubtitle = "";
		}					
		if(AlbumDate == undefined || AlbumDate == "") {	
			AlbumDate = "";
		}										
		if($scope.editdescription==undefined) {
			$scope.editdescription="";
		}					
		if($scope.editalbumtitle==undefined) {
			$scope.erroreditImageTitle = 1;
			$scope.msgeditTitle = "Please Enter Album Title!";
			document.getElementById("editalbumtitle").focus();
			return;
		} else {
			$scope.temp1 = 0;
			$scope.temp2 = 1;
			
										
			var pap = $scope.editalbumtitle.replace("&","$");
			var pap1 = pap.replace("#","~");
			var pap2 = pap1.replace("%","!");
						
			var link = baseUrl + 'editAlbum?albumid='+albumid+'&title='+pap2+'&subtitle='+$scope.editalbumsubtitle+'&tourdate='+AlbumDate+'&description='+$scope.editdescription;
			$http.put(link).success(function(data, status, headers, config) {
				$scope.editalbum = data;
					if($scope.editalbum == "Success") {
						$scope.temp1 = 0;
						$scope.temp2 = 1;
						$scope.albumEditSubmitSuccess = 1;
				    	$scope.successEditMsg = "Album Updated Successfully";
				    	$scope.spin = 1;
						$window.location.href = adminurl+'manage_Album';
					}
					var a = 0;
					
			}).error(function(data, status, headers, config) {
				$scope.editalbum = "Response Fail";
			});
		}
	}				
		
	$scope.checkAll = function() {
		if ($scope.selectedAll) {
			$scope.selectedAll = false;
		} else {
            $scope.selectedAll = true;
        }
		angular.forEach($scope.album, function (item) {
			item.selected = $scope.selectedAll;
		});
    }
	
	
	$scope.delete = function(albumId) {
		var link = baseUrl+'deleteAlbum?albumid='+albumId;
		$http['delete'](link).success(function(data, status, headers, config) {
			$scope.deletealbum = data;
			$('#deleteModal').modal('hide');
			toastr.success('Album deleted!');
			 $scope.getALbumOnCall();
		}).error(function(data, status, headers, config) {
			$scope.deletealbum = "Response Fail";
			toastr.error('Something went wrong!');
		});	
	}
		
	/*$scope.deletealbum = function() {
		deleteAlbum = $window.confirm('Are you sure you want to delete album?');
		if(deleteAlbum) {
	    angular.forEach($scope.getallalbum, function(item) {
		    	if (item.selected) {
		    		var link = baseUrl+'deleteAlbum?albumid='+item.albumId;
		    		$http['delete'](link).success(function(data, status, headers, config) {
		    			$scope.deletealbum = data;
		    		}).error(function(data, status, headers, config) {
		    			$scope.deletealbum = "Response Fail";
		    		});				    		
		    	}
		    });
		    $window.location.href = adminurl+'manage_Album';
		}
	}*/
	
});