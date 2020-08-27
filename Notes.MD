        <%if !!current_user%>
          <a class="navbar-brand" href="<%= user_path(current_user) %>"/><%= current_user.name +"'s profile" %></a>
          <a class="navbar-brand" href="<%= logout_path %>"/>Log Out</a>
        <%else %>