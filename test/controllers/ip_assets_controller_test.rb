require 'test_helper'

class IpAssetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ip_asset = ip_assets(:one)
  end

  test "should get index" do
    get ip_assets_url
    assert_response :success
  end

  test "should get new" do
    get new_ip_asset_url
    assert_response :success
  end

  test "should create ip_asset" do
    assert_difference('IpAsset.count') do
      post ip_assets_url, params: { ip_asset: { description: @ip_asset.description, filename: @ip_asset.filename, title: @ip_asset.title } }
    end

    assert_redirected_to ip_asset_url(IpAsset.last)
  end

  test "should show ip_asset" do
    get ip_asset_url(@ip_asset)
    assert_response :success
  end

  test "should get edit" do
    get edit_ip_asset_url(@ip_asset)
    assert_response :success
  end

  test "should update ip_asset" do
    patch ip_asset_url(@ip_asset), params: { ip_asset: { description: @ip_asset.description, filename: @ip_asset.filename, title: @ip_asset.title } }
    assert_redirected_to ip_asset_url(@ip_asset)
  end

  test "should destroy ip_asset" do
    assert_difference('IpAsset.count', -1) do
      delete ip_asset_url(@ip_asset)
    end

    assert_redirected_to ip_assets_url
  end
end
