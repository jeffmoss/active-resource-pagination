active-resource-pagination ![Build status](https://secure.travis-ci.org/jeffmoss/active-resource-pagination.png)
==========================

Pagination support for ActiveResource

Usage
=====
```ruby
class Posts < ActiveResource::Base
  include ActiveResource::Pagination

  ...
end
```
This will add a JSON decoder that intercepts any response with the format:
```ruby
{
  "total_pages": 5,
  "current_page": 1,
  "posts": [{
    "id": 1
  }]
}
```
This should work well with will_paginate style pagination on the controller, typically like this:
```ruby
posts = Post.all(:params => {:per_page => 5, :page => 1})
```