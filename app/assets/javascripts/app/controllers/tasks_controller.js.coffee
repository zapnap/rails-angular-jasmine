angular.module("AngularApp")
  .controller "TasksController", ($scope, Task) ->
    $scope.load = ->
      $scope.tasks = Task.query()

    $scope.addTask = (data) ->
      Task.save data, (task) ->
        $scope.tasks.push(new Task(task))
        $scope.task = new Task()

    $scope.completeTask = (task) ->
      task.completed_at = new Date()
      task.$update {}, ->
        $scope.tasks.remove(task)

    $scope.load()
