app.controller("NavCtrl", ["$scope","$window", function($scope,$window) {
  angular.element($window).bind("scroll", function() {
    if (!$scope.scrollPosition) {
      $scope.scrollPosition = 0;
      console.log("created scrollposition")
    }

    if ($scope.scrollPosition > 50) {
      $scope.changeNav = true;
    } else {
      $scope.changeNav = false;
    }
    $scope.scrollPosition = this.pageYOffset;
    console.log("scrollPosition: ", $scope.scrollPosition);
    $scope.$apply();
  })
}]);