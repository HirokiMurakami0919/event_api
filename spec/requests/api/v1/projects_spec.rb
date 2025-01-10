require 'rails_helper'

RSpec.describe "Api::V1::Projects", type: :request do
  describe "GET /api/v1/projects/:id" do
    let(:project) { create(:project) }
   


    context 'プロジェクトが存在する場合' do
      it 'プロジェクトの詳細を返すこと' do
        get "/api/v1/projects/#{project.id}"

        expect(response).to have_http_status(:ok)
        json_response = JSON.parse(response.body)

        expect(json_response).to include(
          'id' => project.id,
          'name' => project.name,
          'place' => project.place,
          'start_at' => project.start_at.as_json,
          'end_at' => project.end_at.as_json,
          'created_at' => project.created_at.as_json,
          'updated_at' => project.updated_at.as_json,
          'deleted_at' => project.deleted_at.as_json
        )


        expect(json_response['members'].length).to eq(project.members.length)

        project.members.each do |member|
          expect(json_response['members']).to include(
            include(
              'id' => member.user.id,
              'name' => member.user.name,
              'email' => member.user.email,
              'tel' => member.user.tel,
              'role' => member.user.role,
              'last_sign_in_at' => member.user.last_sign_in_at.as_json,
              'created_at' => member.user.created_at.as_json,
              'updated_at' => member.user.updated_at.as_json,
              'deleted_at' => nil
            )
          )
        end
      end
    end

    context 'プロジェクトが存在しない場合' do
      it 'エラーを返すこと' do
        get "/api/v1/projects/0"
        expect(response).to have_http_status(:not_found)
        json_response = JSON.parse(response.body)
        expect(json_response).to include('error' => 'Project not found')
      end
    end
  end
end
