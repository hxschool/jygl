package org.jasig.cas.client.filter;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jasig.cas.client.authentication.AttributePrincipal;
import org.springframework.util.StringUtils;

import com.hxci.pojo.StudentDetail;
import com.hxci.pojo.Teacher;
import com.hxci.service.StudentDetailService;
import com.hxci.service.TeacherService;

public class AutoSetUserAdapterFilter implements Filter {
	@Override
	public void destroy() {

	}

	public final void doFilter(final ServletRequest servletRequest, final ServletResponse servletResponse,
			final FilterChain filterChain) throws IOException, ServletException {
		final HttpServletRequest request = (HttpServletRequest) servletRequest;
		final HttpServletResponse response = (HttpServletResponse) servletResponse;
		final HttpSession session = request.getSession();
		try {
		
			if(!StringUtils.isEmpty(session.getAttribute("student"))||!StringUtils.isEmpty(session.getAttribute("teacher"))) {
				filterChain.doFilter(request, response);
			}
		
		AttributePrincipal principal = (AttributePrincipal) request.getUserPrincipal();

		java.util.Map<String, Object> attributes = principal.getAttributes();

		
		if (attributes != null && attributes.size() > 0) {
			String loginname  = "";
			String name  = "";
			String phone  = "";
			String email  = "";
			String no  = "";
			if(!StringUtils.isEmpty(attributes.get("login_name"))) {
				loginname = attributes.get("login_name").toString();
			}
			
			if(!StringUtils.isEmpty(attributes.get("name"))) {
				name = attributes.get("name").toString();
			}
			if(!StringUtils.isEmpty(attributes.get("phone"))) {
				phone = attributes.get("phone").toString();
			}
			
			if(!StringUtils.isEmpty(attributes.get("email"))) {
				email = attributes.get("email").toString();
			}
			if(!StringUtils.isEmpty(attributes.get("no"))) {
				no = attributes.get("no").toString();
			}
			if(StringUtils.isEmpty(loginname)) {
				loginname = no;
			}
			String roleId = (String)attributes.get("roleId");
			
			roleId = roleId.replaceAll("[\\[\\]]", "");  
			
			String[] roleIds = roleId.split(",");
			System.out.println("roleIds:[]" + roleIds);

				if (!StringUtils.isEmpty(roleIds)) {

					if (Arrays.asList(roleIds).contains("99")) {
						
						StudentDetailService studentDetailService = (StudentDetailService) SpringContextHelper.getBean("studentDetailService");
						StudentDetail studentDetail = studentDetailService.casLogin(no);
						if (StringUtils.isEmpty(studentDetail)) {
							studentDetail = new StudentDetail();
							Date date = new Date();
							SimpleDateFormat fomat = new SimpleDateFormat("yyyyMMddHHmmss");
							String mydate = fomat.format(date);
							studentDetail.setKsh(no);
							studentDetail.setSfzh(loginname);
							studentDetail.setMobilePhone(phone);
							studentDetail.setXm(name);
							studentDetail.setXh(no);
							studentDetailService.casStudent(studentDetail);
						}
						session.setAttribute("student", studentDetail);
					} else {
						TeacherService teacherService = (TeacherService) SpringContextHelper.getBean("teacherService");
						Teacher teacher = teacherService.casLogin(no);
						if (StringUtils.isEmpty(teacher)) {
							teacher = new Teacher();
							teacher.setZhiwu("教师");
							teacher.setUserpassword("******");
							teacher.setEmail(email);
							teacher.setUsername(no);
							teacher.setName(name);
							teacherService.casTeacher(teacher);
						}
						
						session.setAttribute("teacher", teacher);
					}
				}

		}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return;
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

}
