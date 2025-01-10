# app/controllers/api/v1/projects_controller.rb
module Api
  module V1
    class ProjectsController < ApplicationController
      def show
        project = Project.find_by(id: params[:id])
        if project
          render json: project_response(project), status: :ok
        else
          render json: { error: 'Project not found' }, status: :not_found
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
          created_at: project.created_at,
          updated_at: project.updated_at,
          deleted_at: project.deleted_at,
          members: project.members.includes(:user).map do |member|
            user = member.user
            {
              id: user.id,
              name: user.name,
              email: user.email,
              tel: user.tel,
              role: user.role,
              last_sign_in_at: user.last_sign_in_at,
              created_at: user.created_at,
              updated_at: user.updated_at,
              deleted_at: nil
            }
          end
        }
      end
    end
  end
end
