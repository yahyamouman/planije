package web.security;

import javax.servlet.http.HttpServletRequest;

public interface UserDetailsServices {
    UserDetails loadUserDetailsByUsername(String username);
    boolean validate(String username, String password);
}
