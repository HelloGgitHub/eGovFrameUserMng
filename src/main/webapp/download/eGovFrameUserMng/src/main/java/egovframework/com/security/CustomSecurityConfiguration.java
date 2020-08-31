//package egovframework.com.security;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.authentication.AuthenticationManager;
//import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//import org.springframework.security.config.annotation.web.configurers.ExpressionUrlAuthorizationConfigurer;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//
//@Configuration
//@EnableWebSecurity
//public class CustomSecurityConfiguration extends WebSecurityConfigurerAdapter {
//    public CustomSecurityConfiguration() {
//    }
//
//    @Value("${security.user}")
//    String username;
//    @Value("${security.password}")
//    String password;
//
//    @Bean
//    public BCryptPasswordEncoder passwordEncoder() {
//        return new BCryptPasswordEncoder();
//    }
//
//    @Autowired
//    protected void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
//        auth.inMemoryAuthentication().withUser(username).password(passwordEncoder().encode(password)).roles(new String[]{"USER"});
//    }
//
//    @Bean
//    public AuthenticationManager authenticationManagerBean() throws Exception {
//        return super.authenticationManagerBean();
//    }
//
//    protected void configure(HttpSecurity http) throws Exception {
//        ((HttpSecurity)((HttpSecurity)((ExpressionUrlAuthorizationConfigurer.AuthorizedUrl)((ExpressionUrlAuthorizationConfigurer.AuthorizedUrl)http.authorizeRequests()
//                .antMatchers("/svc/ck").permitAll()
//                .antMatchers("/db-console/**").permitAll()
//                .antMatchers(new String[]{"/**","/v2/**"}))
//                .hasRole("USER").anyRequest())
//                .authenticated().and())
//                .httpBasic()
//                .and())
//                .csrf()
//                .disable();
//        
////        http.securityContext()
////	        .and().exceptionHandling()
////	        // 예외 핸들링
////	        .and().servletApi()
////	        // 서블릿 API 통합
////	        .and().httpBasic()
////	        // http 기본인증
////	        .and().logout().logoutSuccessUrl("/")
////			.and().headers().frameOptions().sameOrigin()
////			        // 로그아웃후 브라우저의 뒤로 가기 버튼을 사용하면 로그아웃이 성공하더라도 이전 페이지를 계속볼수 있다.
////			        // 이는 브라우저 페이지를 캐시한다는 사실과 관련이 있다.
////			        // 그러므로 header() 구성 메소드로 보안 헤더를 활성화하면 브라우저가 페이지를 캐시하지 않도록 지시한다.
////			        // no-cache 헤더 옆에서 콘텐츠 스니핑이 비활성화되고 x-frame 보호가 활성화된다.
////			 .and().csrf().ignoringAntMatchers("/h2-console/**")
////			 .and().anonymous().principal("guest").authorities("ROLE_GUEST")
////			 .and().rememberMe()
////			        // 기본적으로 사용자 이름, 암호, remember-me 만료 시간 및 개인 키를 토큰으로 인코딩하고 쿠키로 사용자의 브라우저에 저장한다.
////			        // 다음에 사용자가 동일한 웹 애플리케이션에 액세스하면 이 토큰이 감지돼 사용자가 잗종으로 로그인할 수 있따.
////			        // 정적 Remeber-Me 토큰은 해커가 캡쳐할 수 있기 때문에 보안문제가 있다. 그러므로 롤링토큰을 지원하지만,
////			        // 토큰을 유지하려면 데이터베이스가 필요하다. 자세한것은 다음게시물에 작성예정이다.
////			 .and().formLogin().loginPage("/login.html").defaultSuccessUrl("/books.html").failureUrl("/login.html?error=true").permitAll()
////			        // 폼기반 로그인
////	         .and().authorizeRequests().mvcMatchers("/","/db-console/**" ).permitAll().anyRequest().authenticated()
////	        // "/"들어오는 요청은 모두허용   &&  어떤요청이든 인증확인
////        ;
//    }
//}
