package cc.weno.interceptor;

import cc.weno.pojo.YiBanUser;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 拦截器，未登录拦截器
 * @author xiaohiu
 */
public class LoginInterceptor implements HandlerInterceptor {

    /**
     * 前置拦截器，拦截登录
     * @param request
     * @param response
     * @param handler
     * @return
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        // 从session中获取对象
        YiBanUser user = (YiBanUser) session.getAttribute("yibanUser");
        // 用户存在
        if (user!=null){
            return true;
        } else {
             response.sendRedirect("/yibanlogin");
            // 开发的时候改为绝对网址
            // response.sendRedirect("xxxx");

            return false;
        }
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
