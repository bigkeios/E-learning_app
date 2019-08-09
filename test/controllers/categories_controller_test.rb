require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get import" do
    get categories_import_url
    assert_response :success
  end

end
