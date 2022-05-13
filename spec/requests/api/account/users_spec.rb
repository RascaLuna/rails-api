require 'rails_helper'

describe 'UserAPI' do
    it '全てのユーザーを取得する' do
        FactoryBot.create_list(:user, 10)

        get '/api/account/users'
        json = JSON.parse(response.body)

        # リクエスト成功を表す200が返ってきたか確認する。
        expect(response.status).to eq(200)

        # 正しい数のデータが返されたか確認する。
        expect(json['data'].length).to eq(10)
    end
end

describe 'UserAPI' do
    it '特定のuserを取得する' do
        user = create(:user, name: 'tanaka')

        get "/api/account/users/#{user.id}"
        json = JSON.parse(response.body)

        # リクエスト成功を表す200が返ってきたか確認する。
        expect(response.status).to eq(200)

        # 要求した特定のポストのみ取得した事を確認する
        expect(json['data']['name']).to eq(user.name)
    end
end

describe 'UserAPI' do
    it '新しいuserを作成する' do
        valid_params = { name: 'tanaka', sex: 'male', email: 'tanaka@tanaka.com', prefecture: 'Tokyo', birthday: '2000-02-01' }

        #データが作成されている事を確認
        expect { user '/api/account/users', params: { user: valid_params } }.to change(User, :count).by(+1)

        # リクエスト成功を表す200が返ってきたか確認する。
        expect(response.status).to eq(200)
    end
end

describe 'UserAPI' do
    it 'userの編集を行う' do
        user = create(:user, name: 'tanaka')

        put "/api/account/users/#{user.id}", params: { user: {name: 'tanaka'}  }
        json = JSON.parse(response.body)

        # リクエスト成功を表す200が返ってきたか確認する。
        expect(response.status).to eq(200)

        #データが更新されている事を確認
        expect(json['data']['name']).to eq('tanaka')
    end
end

describe 'UserAPI' do
    it 'userを削除する' do
        user = create(:user)

        #データが削除されている事を確認
        expect { delete "/api/account/users/#{user.id}" }.to change(User, :count).by(-1)

        # リクエスト成功を表す200が返ってきたか確認する。
        expect(response.status).to eq(200)
    end
end
