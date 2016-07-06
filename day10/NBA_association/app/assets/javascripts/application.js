// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

var app = angular.module('nbaApp', ['ngRoute']);
app.config(function($routeProvider, $httpProvider) {
  $routeProvider
    .when("/partial1", {
        templateUrl: "/partials/partial1.html",
        controller: "playersController"
    })
    .when("/partial2", {
        templateUrl: "/partials/partial2.html",
        controller: "teamsController"
    })
    .when("/partial3", {
        templateUrl: "/partials/partial3.html",
        controller: "associationsController"
    })
  // we are using jquery to get the value of the token and setting in as a default header
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
});

app.factory("playerFactory", function($http){
  var factory = {};
  factory.index = function(callback) {
    $http.get("/players").success(function(output){
      callback(output);
    })
  }
  factory.create = function(playerInfo, callback){
    $http.post("/players", playerInfo).success(function(output){
      callback(output);
    })
  }
  factory.delete = function(id, callback){
    $http.delete("/players/" + id).success(function(output){
      callback(output);
    })
  }
  return factory;
})

app.controller("playersController", function($scope, playerFactory, teamFactory){
  playerFactory.index(function(json){
    // console.log(json)
    $scope.players = json;
  })
  teamFactory.index(function(json){
    // console.log(json)
    $scope.teams = json;
  })
  $scope.createPlayer = function(){
    if ($scope.newPlayer && $scope.newPlayer.player.first_name && $scope.newPlayer.player.last_name && $scope.newPlayer.player.team_id){
      playerFactory.create($scope.newPlayer, function(json){
        if (json == 'has already been taken'){
          $scope.error = "The name " + json[0]
        }
        else {
          $scope.players = json;
          $scope.newPlayer = {};
        }
      });
    }
    else {
      $scope.error = "All fields must be filled!"
      $scope.newPlayer = {};
    }
  }
  $scope.deletePlayer = function(playerId){
    playerFactory.delete(playerId, function(json){
      $scope.players = json;
    })
  }
})

app.factory("teamFactory", function($http){
  var factory = {};
  factory.index = function(callback) {
    $http.get("/teams").success(function(output){
      callback(output);
    })
  }
  factory.create = function(teamInfo, callback){
    $http.post("/teams", teamInfo).success(function(output){
      callback(output);
    })
  }
  factory.delete = function(id, callback){
    $http.delete("/teams/" + id).success(function(output){
      callback(output);
    })
  }
  return factory;
})
app.controller("teamsController", function($scope, teamFactory){
  teamFactory.index(function(json){
    console.log(json)
    $scope.teams = json;
  })
  $scope.createTeam = function(){
    if ($scope.newTeam){
      teamFactory.create($scope.newTeam, function(json){
        if (json[0] == "has already been taken") {
          $scope.error = json[0];
          $scope.newTeam = {};
        }
        else {
          $scope.teams = json;
          $scope.newTeam = {};
        }
      });
    }
    else {
      console.log("Please enter team name!!!")
    }
  }
  $scope.deleteTeam = function(teamId){
    teamFactory.delete(teamId, function(json){
      $scope.teams = json;
    })
  }
})

app.controller("associationsController", function($scope, playerFactory, teamFactory){
  $scope.roster = "Los Angeles Lakers";
  playerFactory.index(function(json){
    // console.log(json)
    $scope.players = json;
  })
  teamFactory.index(function(json){
    // console.log(json)
    $scope.teams = json;
  })
})
