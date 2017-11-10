- active = context.request.path == "/" ? "active" : ""
a class="nav-item #{active}" href="/" Home
- active = context.request.path == "/posts" ? "active" : ""
a class="nav-item #{active}" href="/posts" Posts
- active = context.request.path == "/orders" ? "active" : ""
a class="nav-item #{active}" href="/orders" Orders
- active = context.request.path == "/users" ? "active" : ""
a class="nav-item #{active}" href="/users" Users
