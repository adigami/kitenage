require 'test_helper'

class AdAccountsControllerTest < ActionController::TestCase
  setup do
    @ad_account = ad_accounts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ad_accounts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ad_account" do
    assert_difference('AdAccount.count') do
      post :create, ad_account: { active: @ad_account.active, name: @ad_account.name, oauth_token: @ad_account.oauth_token, source_id: @ad_account.source_id, user_id: @ad_account.user_id }
    end

    assert_redirected_to ad_account_path(assigns(:ad_account))
  end

  test "should show ad_account" do
    get :show, id: @ad_account
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ad_account
    assert_response :success
  end

  test "should update ad_account" do
    patch :update, id: @ad_account, ad_account: { active: @ad_account.active, name: @ad_account.name, oauth_token: @ad_account.oauth_token, source_id: @ad_account.source_id, user_id: @ad_account.user_id }
    assert_redirected_to ad_account_path(assigns(:ad_account))
  end

  test "should destroy ad_account" do
    assert_difference('AdAccount.count', -1) do
      delete :destroy, id: @ad_account
    end

    assert_redirected_to ad_accounts_path
  end
end
