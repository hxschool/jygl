package com.hxci.filter;

import com.hxci.pojo.StudentDetail;
import com.hxci.pojo.Teacher;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@SuppressWarnings("all")
public class LoginFilter extends OncePerRequestFilter {

    /**
     * Same contract as for {@code doFilter}, but guaranteed to be
     * just invoked once per request within a single request thread.
     * See {@link #shouldNotFilterAsyncDispatch()} for details.
     * <p>Provides HttpServletRequest and HttpServletResponse arguments instead of the
     * default ServletRequest and ServletResponse ones.
     *
     * @param request
     * @param response
     * @param filterChain
     */
    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        //默认需要doFilter
        boolean doFilter = true;
        String url = request.getRequestURI();
        String[] doNotFilterUrls = {"/", "/student","/teacher"};
        response.setContentType("text/html;charset=gbk"); 
        String stu = "/student";
        String tea = "/teacher";
        StudentDetail student = (StudentDetail) request.getSession().getAttribute("student");
        Teacher teacher = (Teacher)request.getSession().getAttribute("teacher");
        if(url.equals("/login") || url.equals("/slogin") || url.equals("/logout") || url.equals("/slogout") ){
            filterChain.doFilter(request , response);
        }
        if(student != null ){
            filterChain.doFilter(request , response);
        }else{
            if(url.equals("/student/index") || url.equals("/student/studentdetail") || url.equals("/student/password") || url.equals("/student/updatepassword") ){
                response.getWriter().println("<script>alert('页面失效，请重新登录');location.href='/slogin.jsp';</script>");
                return ;
            }
        }
        if(teacher != null ){
            filterChain.doFilter(request , response);
        }else {
            if(url.contains(tea) || (url.contains(stu) && (!url.equals("/student/index"))) ){
                response.getWriter().println("<script>alert('页面失效，请重新登录');location.href='/login.jsp';</script>");
                return ;
            }
        }
        if(url.equals("/") || url.equals("/slogin.jsp") || url.equals("/login.jsp")){
            filterChain.doFilter(request , response);
        }



    }

    public static void main(String[] args) {
        String a = "/student";
        System.out.println("/student/index".contains(a));
    }



}
