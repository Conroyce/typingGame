app.controller("NavCtrl", ["$scope","$window","$location", function($scope,$window,$location) {
  
  var path = $location.path();
  if ($location.path() === "/landing") {
    $scope.mainNav = false;
    angular.element($window).bind("scroll", function() {
      if (!$scope.scrollPosition) {
        $scope.scrollPosition = 0;
        console.log("created scrollposition")
      }

      if ($scope.scrollPosition > 50) {
        $scope.landingNav = true;
      } else {
        $scope.landingNav = false;
      }
      $scope.scrollPosition = this.pageYOffset;
      $scope.$apply();
    })
  } else {
    $scope.landingNav = false;
    $scope.mainNav = true;
  }
  
}]);