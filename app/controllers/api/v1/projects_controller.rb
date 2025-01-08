class Api::V1::ProjectsController < ApplicationController
  def show
    project = Project.find(id: params[:id])

    if project
      render json: project_response(project), status: :ok
    else
      render json: { error: 'Project not found'}, status: :not_found
    end
  end

  private

  def project_response(project)
    {
      id: project.id,
      name: project.name,
      place: project.place,
      start_at: project.start_at,
      end_at: project.end_at,
      members: project.users.map do |user|
        {
          id: user.id,
          name: user.name,
          email: user.email,
          tel: user.tel,
          role: user.role,
          last_sign_in_at: user.last_sign_in_at,
          created_at: user.created_at,
          updated_at: user.updated_at
        }
      end
    }
  end
end
