class Api::TasksController < InheritedResources::Base
  respond_to :json

  private

  def collection
    @tasks ||= end_of_association_chain.incomplete
  end

  def permitted_params
    params.permit(task: [:name, :completed_at])
  end
end
