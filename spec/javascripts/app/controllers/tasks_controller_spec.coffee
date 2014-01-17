#= require spec_helper

describe 'TasksController', ->
  beforeEach ->
    @controller('TasksController', { $scope: @scope })
    @Task = @model('Task')
    @tasks = [new @Task({ id: 1, name: 'first task' })]

    @http.whenGET('/api/tasks').respond(200, @tasks)
    @http.flush()

  describe 'load', ->
    it 'sets up the list of current tasks', ->
      expect(@scope.tasks.length).toEqual(1)

  describe 'addTask', ->
    it 'creates a new task via api', ->
      @http.expectPOST('/api/tasks').respond(201, { id: 2, name: 'buy dogecoin' })
      @scope.addTask({ name: 'buy dogecoin' })
      @http.flush()

    it 'adds the task to the display list', ->
      @http.whenPOST('/api/tasks').respond(201, { id: 2, name: 'buy dogecoin' })
      @scope.addTask({ name: 'buy dogecoin' })
      @http.flush()
      expect(@scope.tasks.last().name).toEqual('buy dogecoin')

  describe 'completeTask', ->
    beforeEach ->
      @task = @tasks.first()
      @http.whenPUT('/api/tasks/1').respond(204, '')

    it 'marks the task as complete', ->
      expect(@task.completed_at).toBe(undefined)
      @scope.completeTask(@task)
      expect(@task.completed_at).toNotBe(undefined)

    it 'updates the task via api', ->
      @http.expectPUT('/api/tasks/1').respond(204, '')
      @scope.completeTask(@task)
      @http.flush()

    it 'removes the task from the display list', ->
      @scope.completeTask(@task)
      @http.flush()
      expect(@scope.tasks.findIndex(@task)).toEqual(-1)
