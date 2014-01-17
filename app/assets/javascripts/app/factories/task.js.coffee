angular.module("AngularApp")
  .factory "Task", ($resource) ->
    $resource "/api/tasks/:id",
      { id: "@id" },
      { update: { method: "PUT" }}
