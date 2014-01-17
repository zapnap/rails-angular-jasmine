angular.module("AngularApp")
  .controller "TasksController", ($scope, Task) ->
    $scope.load = ->
      $scope.tasks = Task.query()

    $scope.addTask = (data) ->
      task = new Task(data)
      task.$save ->
        $scope.tasks.push(task)

    $scope.load()
