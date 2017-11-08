div.row
  div.col-sm-11
    h2 Posts
  div.col-sm-1
    a.btn.btn-success.btn-xs href="/posts/new" New
div.table-responsive
  table.table.table-striped
    thead
      tr
        th Name
        th Body
        th Draft
        th Actions
    tbody
    - posts.each do |post|
      tr
        td = post.name
        td = post.body
        td = post.draft
        td
          span
            == link_to("read", "/posts/#{post.id}", class: "btn btn-success btn-xs")
            == link_to("edit", "/posts/#{post.id}/edit", class: "btn btn-success btn-xs")
            == link_to("delete", "/posts/#{ post.id }?_method=delete&_csrf=#{csrf_token}", class: "btn btn-danger btn-xs", onclick: "return confirm('Are you sure?');")
