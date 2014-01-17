angular.module("AngularApp")
  .controller "TasksController", ($scope, Task) ->
    $scope.load = ->
      console.log 'load'
      $scope.tasks = Task.query {}, ->
        console.log 'ok'
        $scope.$broadcast("tasks.loaded")

    $scope.addTask = (data) ->
      task = new Task(data)
      console.log task
      task.$save ->
        $scope.tasks.push(task)

    $scope.load()
