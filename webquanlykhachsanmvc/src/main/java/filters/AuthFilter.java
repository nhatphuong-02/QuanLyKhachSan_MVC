package filters;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.*;
import java.io.IOException;

@WebFilter({
        "/admin",
        "/add-room",
        "/update-room",
        "/delete-room",
        "/dashboard",
        "/admin-invoice",
        "/search-room"
})
public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request,
                         ServletResponse response,
                         FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req =
                (HttpServletRequest) request;

        HttpServletResponse res =
                (HttpServletResponse) response;

        req.setCharacterEncoding("UTF-8");
        res.setCharacterEncoding("UTF-8");

        HttpSession session =
                req.getSession(false);

        if (session == null) {
            res.sendRedirect("login");
            return;
        }

        String role =
                (String) session.getAttribute("role");

        if (!"ADMIN".equals(role)) {
            res.sendRedirect("home");
            return;
        }

        chain.doFilter(request, response);
    }
}