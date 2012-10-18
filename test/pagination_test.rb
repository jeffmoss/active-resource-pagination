require 'test/unit'

require 'active_resource'
require 'active_resource/pagination'

class Post < ActiveResource::Base
  self.element_name = "post"

  include ActiveResource::Pagination
end

class PaginationTest < Test::Unit::TestCase
  def test_works
    arr = ActiveResource::Pagination::PagedArray.new([1, 2, 3])
    arr.total_pages = 5
    arr.current_page = 1

    assert_equal arr.total_pages, 5
    assert_equal arr.current_page, 1
  end

  def test_paging_attributes
    ActiveResource::HttpMock.respond_to do |mock|
      fixture = <<-JSON
        {
          "total_pages" : 5,
          "current_page" : 1,
          "posts" : [{
            "id" : 1,
            "title" : "Hello World"
          }]
        }
      JSON

      mock.get "/posts.json", {}, fixture, 200
    end

    # late bind the site
    Post.site = "http://localhost"
    posts = Post.find(:all)

    assert_equal posts.total_pages, 5
    assert_equal posts.current_page, 1
  end

  def test_fallback
    ActiveResource::HttpMock.respond_to do |mock|
      fixture = <<-JSON
        [{
          "id" : 1,
          "title" : "Hello World"
        }]
      JSON

      mock.get "/posts.json", {}, fixture, 200
    end

    # late bind the site
    Post.site = "http://localhost"
    posts = Post.find(:all)

    assert_equal posts.length, 1

    # mock page totals
    assert_equal posts.total_pages, 1
    assert_equal posts.current_page, 1
  end
end
