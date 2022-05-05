package org.diary.moon;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.diary.moon.dto.BoardDTO;
import org.diary.moon.dto.BookDTO;
import org.diary.moon.dto.CommentDTO;
import org.diary.moon.dto.MemberDTO;
import org.diary.moon.service.BoardService;
import org.diary.moon.service.BookService;
import org.diary.moon.service.CommentService;
import org.diary.moon.service.MemberService;
import org.diary.moon.vo.JoinVO;
import org.diary.moon.vo.PaggingVO;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	private MemberService mService;
	private BoardService bService;
	private CommentService cService;
	private BookService bookService;

	public MainController(MemberService mService, BoardService bService, CommentService cService,
			BookService bookService) {
		this.mService = mService;
		this.bService = bService;
		this.cService = cService;
		this.bookService = bookService;
	}

	// 메모리에 미리 할당해놓고 메서드 내에서 바로 request 로 접근하게 하는 코드
	// 이거 써두면 메서드에서 매개변수로 request 안받아도 돼요~
	@Autowired
	HttpServletRequest request;

	// 기본 url만 쳤을 때
	@RequestMapping("/")
	public String index() {
		String[] message = {
				"포기하지 않는다면<br>행운이 널 찾아낼거야!",
				"사소한 것들을 소중히 해야 한다.<br>그것이 삶을 이루는 버팀목이니까",
				"많은 사람이 재능의 부족보다<br>결심의 부족으로 실패한다.",
				"그대여 이제 그만 마음 아파해라",
				"어떤 사람에게서 빛이 나는 건<br>깊은 어둠을 지나온 까닭이다.",
				"우린 어둠을 밝히려는<br>길 잃은 별들이 아닐까",
				"여기는 괜찮아 안심해도 돼<br>억지로 빛나려 안 그래도 돼",
				"언제나 현재에<br>집중할 수 있다면 행복할 것 이다.",
				"오늘 하루는 어땠어,<br>마냥 즐거운 하루였으면 좋겠다.",
				"누군가의 흐린 마음에<br>비치는 무지개가 되어라",
				"지나간 슬픔에<br>새로운 눈물을 낭비하지 말라",
				"한번 실패와 영원한 실패를<br>혼동하지 말라",
				"사람은 행복하기로<br>마음먹은 만큼 행복하다.",
				"성공해서 만족하는 것은 아니다.<br>만족하고 있었기 때문에<br>성공한 것이다.",
				"당신이 포기할 때,<br>나는 시작한다.<br>-일론 머스크-",
				"가장 어두운 시간은<br>해뜨기 바로 직전의 시간이다.",
				"인간의 감정은<br>누군가를 만날 때와 헤어질 때<br>가장 순수하며 빛난다.",
				"우리가 나쁜 사람들인 건 아니잖아<br>우린 그냥,<br>그저 잘못된 곳에 있는 것 뿐이야.",
				"가장 빛나는 별은<br>아직 발견되지 않은 별이고,<br>당신 인생의 최고의 날은<br>아직 살지 않은 날이다.",
				"우리의 최대의 영광은<br>한번도 실패하지 않는 것이 아니고<br>넘어질 때마다 일어서는 것이다.",
				"아는 것을 안다 하고,<br>모르는 것을 모른다 하는 것이<br>참으로 아는 것이다."
		};
		Random rand = new Random();
		int num = rand.nextInt(21);
		String msg = message[num];
		request.setAttribute("message", msg);
		
		return "index";
	}

	// main(소개)페이지로 이동
	@RequestMapping("/main.do")
	public String main() {
		return "main";
	}

	/** ======= member 관련 컨트롤러 ================ */

	// 회원가입 페이지
	@RequestMapping("/joinView.do")
	public String join(HttpSession session) {
		return "join";
	}

	// 회원가입시 id 중복체크
	@RequestMapping("id_chk.do")
	public String id_chK(String id, HttpServletResponse response, HttpSession session) throws IOException {

		response.setContentType("text/html;charset=utf-8");
		
		//사용가능한지 아닌지
		int num = 0;
		num = mService.selectAllMember(id);
		
		JSONObject json = new JSONObject();
		json.put("id_result", num);
				
		response.getWriter().write(json.toString());	

		return null;
	}

	// 회원가입시 닉네임 중복체크
	@RequestMapping("name_chk.do")
	public String name_chk(String m_name, HttpServletResponse response, HttpSession session) throws IOException {

		response.setContentType("text/html;charset=utf-8");

		int num = 0;
		num = mService.selectNameMember(m_name);
		
		JSONObject json = new JSONObject();
		json.put("name_result", num);
		
		response.getWriter().write(json.toString());	
	
		return null;
	}
	
	// 회원가입 수행
	@RequestMapping("/member_insert.do")
	public String member_insert(HttpServletResponse response, JoinVO vo) throws IOException {

		response.setContentType("text/html;charset=utf-8");

		// 1) email 주소 합쳐주기
		String fullEmail = vo.getEmail() + "@" + vo.getAddress();

		// 2) MemberDTO 만들어서 insert 하기
		MemberDTO dto = new MemberDTO(vo.getId(), vo.getPass(), fullEmail, vo.getNick_name(), "u");
		int result = mService.insertMember(dto);

		if (result == 0) {
			response.getWriter().write("<script>alert('회원가입 실패');history.back();</script>");
		} else {
			response.getWriter().write("<script>alert('회원가입 성공'); location.href = '/' ;</script>");
		}
		return null;
	}

	
	
	// 로그인 화면으로 이동하는 메서드
	@RequestMapping("/loginView.do")
	public String loginView() {
		return "login";
	}

	// 실제 로그인을 하는 메서드
	@RequestMapping("/login.do")
	public String login(HttpSession session, String id, String password, HttpServletResponse response)
			throws IOException {

		// 응답 메세지 인코딩
		response.setContentType("text/html; charset=UTF-8");

		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("password", password);

		// 로그인 정보로 select 해온 member 정보를 dto로 치환.
		MemberDTO dto = mService.login(map);

		// 만약 dto 가 null이면 로그인 실패
		if (dto == null) {
			response.getWriter().write("<script>alert('아이디와 비밀번호를 확인하세요!!'); history.back();</script>");
			return null;
		} else {
			// 로그인 성공 시 세션에 로그인 유저 정보 저장하고 main.do 로 이동. 서버간 이동은 redirect 로 !!
			session.setAttribute("member", dto);
			
			return "redirect:main.do";
		}
	}

	
	
	
	// 회원정보 수정화면으로 이동
	@RequestMapping("/informationView.do")
	public String information(String id) {

		MemberDTO dto = mService.selectMember(id);

		// 합쳐져 있던 address와 domain 분리해서 request 영역에 setting
		request.setAttribute("member", dto);

		return "information";
	}

	// 회원정보 수정
	@RequestMapping("member_update.do")
	public String member_update(String id, String nick_name, String pass, String current_pw, HttpServletResponse response)
			throws IOException {

		response.setContentType("text/html;charset=utf-8");
		int result = 0;
		
		// 1) 변경된 pw 가 공백이라면?
		if(pass.replaceAll(" ", "").length()==0) {
			 result = mService.updateMember(new MemberDTO(id, current_pw, nick_name));
		} else {
			 result = mService.updateMember(new MemberDTO(id, pass, nick_name));
		}
		
		

		if (result != 0) {
			response.getWriter().write("<script>alert('회원 정보 수정 완료');location.href='main.do';</script>");
		} else {
			response.getWriter().write("<script>alert('회원 정보 수정 실패');history.back();</script>");
		}
		return null;
	}
	
	// 회원정보수정시 닉네임 중복체크
		@RequestMapping("info_name_chk.do")
		public String chk(HttpServletResponse response, String m_name, String m_id) throws IOException {

			response.setContentType("text/html;charset=utf-8");

			// resultNum 0 : 사용 가능 , resultNum 1: 내가 사용중 , resultNum 2: 남이 사용중  으로 상수로 셋팅할 예정
			int resultNum = 0;
			
			//m_name 으로 넘어온 닉네임을 사용중인 유저가 있는지?에 대한 결과
			int num = 0;
			

			// 1) id 로 회원 정보 받아옴
			MemberDTO dto = mService.selectMember(m_id);
			
			// 2) 넘어온 닉네임과 사용자의 현재 닉네임을 비교
			if (m_name.equals(dto.getM_name())) {
				num = 1;
			} else {
				//넘어온 닉네임과 사용자의 닉네임이 다를 때, m_name 으로 DB 를 찾아봐야 함
				num = mService.selectNameMember(m_name);
				if(num >= 1) {
					//넘어온 닉네임과 현재 사용자의 닉네임이 다르고, 
					//닉네임으로 검색한 유저가 1명 이상일 때 ====> 이 말은 곧 나 이외에 사용자가 이 닉네임을 사용중이라는 얘기.
					resultNum = 2;
				}			
			}
			
			// 2) JsonObject 에 결과 저장
				JSONObject json = new JSONObject();
				json.put("name_result", resultNum);
				
				response.getWriter().write(json.toString());

			return null;
		}

		
		
		
		
	// 아이디, 비밀번호 찾기 이동
	@RequestMapping("/find_info.do")
	public String find_info() {
		return "find_info";
	}

	// 아이디 찾기
	@RequestMapping("find_id.do")
	// @ResponseBody
	public String find_id(String email, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");

		MemberDTO dto = mService.find_id(new MemberDTO(email));

		if (dto != null) {
			String id = dto.getM_id();
			String msg = "등록된 아이디는 : " + id + " 입니다.";
			response.getWriter().write("<script>alert('" + msg + "');history.back();</script>");
		} else {
			response.getWriter().write("<script>alert('해당 이메일로 등록된 아이디가 없습니다.');history.back();</script>");
		}
		return null;
	}

	// 비밀번호 찾기
	@RequestMapping("find_pass.do")
	public String find_pass(String id, String email, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");

		MemberDTO dto = mService.find_pass(new MemberDTO(id, email));

		if (dto != null) {
			String msg = "해당 아이디의 비밀번호는 " + dto.getM_pw() + " 입니다.";
			response.getWriter().write("<script>alert('" + msg + "');history.back();</script>");
		} else {
			response.getWriter().write("<script>alert('해당 아이디와 이메일로 등록된 계정이 없습니다.');history.back();</script>");
		}
		return null;
	}

	// 회원탈퇴
	@RequestMapping("member_delete.do")
	public String member_delete(String id, HttpServletResponse response, HttpSession session) throws IOException {

		response.setContentType("text/html;charset=utf-8");
		
		//DB 삭제 및 session 만료
		int result = mService.deleteMember(id);
		session.invalidate();

		if (result == 0) {
			response.getWriter().write("<script>alert('회원탈퇴 실패!! 관리자에게 문의하세요!');history.back();</script>");
		} else {
			response.getWriter().write("<script>alert('탈퇴하셨습니다. ㅠㅠ 잘가요~~ㅠㅠ'); location.href='/';</script>");
		}
		return null;
	}

	// 로그아웃
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	// data 시간부분 짤라주는 메서드 --> 게시판 list 보여주는 거의 모든 페이지에서 사용될 예정이라 따로 메서드화 시킴.
	public List<BoardDTO> regDay(List<BoardDTO> list) {
		String[] regDay = new String[list.size()];

		for (int i = 0; i < list.size(); i++) {
			regDay[i] = list.get(i).getRegist_day().split(" ")[0];
			list.get(i).setRegist_day(regDay[i]);
		}
		return list;
	}

	/** ===============my-Diary 영역================== */

	// myDiary 페이지로 이동 
	@RequestMapping("/myDiary.do")
	public String boardList(HttpSession session) {

		// 세션 유효성 체크
		if (session.getAttribute("member") == null)
			return "redirect:main.do";
		
		//로그인 된 사용자 id 받기
		String b_writer = ((MemberDTO) session.getAttribute("member")).getM_id();

		// redirect 경로 기억하기
		session.setAttribute("host", "myDiary.do");

		// admin 계정 -- > 왜 필요한거지?? ㅇ.ㅇ
		List<MemberDTO> one = mService.selectOne();

		//내가 쓴 댓글 목록 받아오기
		List<CommentDTO> c_list = cService.selectCommentList(b_writer);
	
		// 페이지 변수 초기값
		int pageNo = 1;

		if (request.getParameter("page") != null) {
			pageNo = Integer.parseInt(request.getParameter("page"));
		}
		
		//내가 쓴 글 중에, 첫 페이지 게시글 7개 받아오기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("b_writer", b_writer);
		map.put("pageNo", pageNo);
		
		List<BoardDTO> writer = bService.selectMyList(map);
		writer = regDay(writer);

		// 내가 쓴 글 개수
		int count = bService.selectAllCount(b_writer);
		//내가 쓴 댓글 개수
		int c_count = c_list.size();
		PaggingVO vo = new PaggingVO(count, pageNo, 7, 4);

		request.setAttribute("writer", writer);			//내가 쓴 게시글 중 pageNo에 맞는 게시글 list
		request.setAttribute("pagging", vo);					//pagging 정보
		request.setAttribute("b_count", count);			//내가 쓴 게시글 수
		request.setAttribute("c_count", c_count);		//내가 쓴 댓글 수
		session.setAttribute("b_writer", b_writer);	//현재 유저 id

		return "my_diary";
	}

	// myDiary : 작성한 댓글 목록 뷰 매핑
	@RequestMapping("/viewComment.do")
	public String viewComent(HttpSession session) {
		
		//세션 확인
		if (session.getAttribute("member") == null)
			return "redirect:main.do";
		
		//로그인 유저 정보 받기
		String b_writer = ((MemberDTO) session.getAttribute("member")).getM_id();
		
		//내가 작성한 전체 댓글 목록 읽어오기
		List<CommentDTO> c_list = cService.selectCommentList(b_writer);
		
		//내가 쓴 전체 게시글 수
		int count = bService.selectAllCount(b_writer);
		
		//페이징
		int pageNo = 1;
		if (request.getParameter("page") != null) {
			pageNo = Integer.parseInt(request.getParameter("page"));
		}
		
		// 페이징 데이터 셋팅
		PaggingVO vo = new PaggingVO(c_list.size(), pageNo, 7, 4);
		
		//나의 전체 댓글 중 첫페이지 7개만 읽어오기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("b_writer", b_writer);
		map.put("pageNo", pageNo);	
		List<CommentDTO> commentList = cService.selectPageComment(map);


	//	int c_count = c_list.size();
		request.setAttribute("pagging", vo);
		request.setAttribute("c_list", commentList);
		request.setAttribute("b_count", count);
		request.setAttribute("c_count", c_list.size());

		return "comment_view";
	}

	/** ========content3 영역 (공유게시판)=================== */

	// content3: 공유 space (임시작명) 게시판 list 영역
	@RequestMapping("/content3.do")
	public String content3(String page, HttpSession session) {
		
		//redirect 경로 기억하기
		session.setAttribute("host", "content3.do");

		List<BoardDTO> boardList = null;
		int pageNo = 1;

		// 기억하는 page 가 있는지?
		if (page == null)
			page = "1";
		else
			pageNo = Integer.parseInt(page);

		//공개여부가 '공개'인 전체 게시글 개수
		int cnt = bService.selectBoardCount();
		
		//페이징 정보 세팅
		PaggingVO vo = new PaggingVO(cnt, pageNo, 7, 4);

		// 게시글 첫 페이지 글목록 읽어오기
		boardList = bService.selectPageBoard(pageNo);
		boardList = regDay(boardList); // 시간 부분 짤라주는 메서드

		// 공유 게시판에 필터가 [일기별로보기], [글귀별로보기], [전체-default], [검색결과보기] 이렇게 4가지 경우이기 때문에,
		// jsp 에 알려주기 위해 requestScope 를 사용했습니다.
		request.setAttribute("board_list", boardList);
		request.setAttribute("pagging", vo);
		request.setAttribute("kind", null); // 종류, 검색어 없으니까 둘다 null
		request.setAttribute("keyword", null);

		return "content3";
	}

	// content3: 드롭다운 메뉴에서 kind 별 list + pagging
	@RequestMapping("/kindList.do")
	public String kindList(String kind, String page, HttpServletResponse response) throws IOException {

		// 전체를 선택했다면 그냥 content3.do 로 이동
		if (kind.equals("a"))
			return "redirect:content3.do";

		int pageNo = 1;
		if (page == null)
			page = "1";
		else
			pageNo = Integer.parseInt(page);

		// kind에 맞는 글 갯수만 확인
		int cnt = bService.selectKindBoardCount(kind);
		
		//kind 별 글 갯수에 맞춘 페이징 정보 세팅
		PaggingVO vo = new PaggingVO(cnt, pageNo, 7, 4);
		
		//kind 별 게시판 첫페이지 글 7개 읽어오기
		Map<String, Object> map = new HashMap<>();
		map.put("kind", kind);
		map.put("page", pageNo);

		List<BoardDTO> boardList = bService.selectKind(map);
		
		//시간 자르기
		boardList = regDay(boardList);

		request.setAttribute("board_list", boardList);
		request.setAttribute("pagging", vo);
		request.setAttribute("kind", kind);
		request.setAttribute("keyword", null); // 검색어 없으니까 null

		return "content3";
	}

	// content3: 좌측하단 검색결과
	@RequestMapping("boardSearch.do")
	public String search(String keyword, String page) {

		int pageNo = 1;

		if (page == null)
			page = "1";
		else
			pageNo = Integer.parseInt(page);

		// 키워드를 포함하는 게시글 개수 찾기
		int cnt = bService.selectKeywordBoardCount(keyword);
		
		//키워드에 맞춘 페이징 정보 세팅
		PaggingVO vo = new PaggingVO(cnt, pageNo, 7, 4);
		
		//키워드에 맞는 게시판 첫페이지 7개 찾기
		Map<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("page", pageNo);

		List<BoardDTO> boardList = bService.selectKeyword(map);
		
		//시간 자르기
		boardList = regDay(boardList);

		request.setAttribute("board_list", boardList);
		request.setAttribute("pagging", vo);
		request.setAttribute("kind", null);
		request.setAttribute("keyword", keyword);

		return "content3";
	}

	/** =========== 글쓰기 + 글읽기 영역 ============== */

	// 글쓰기 페이지로 이동
	@RequestMapping("boardWriteView.do")
	public String writeView() {
		return "boardWrite";
	}

	// 글쓰기
	@RequestMapping("boardWrite.do")
	public String boardWrite(HttpSession session, BoardDTO dto, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		
		//세션 정보 확인
		if (session.getAttribute("member") == null)
			return "redirect:content3.do";
		
		//로그인 유저 정보 확인
		String m_id = ((MemberDTO) session.getAttribute("member")).getM_id();

		// board 객체 생성 및 insert
		dto = new BoardDTO(dto.getTitle(), dto.getContent(), dto.getB_kind(), dto.getB_secret(), dto.getBook_name(),
				m_id);
		int check = 0;
		check = bService.insertBoard(dto);

		// 책정보가 있을 때만 실행, Board 랑 변수명이 겹쳐서 부득이 request.getParameter 로 받음.
		String bookTitle = request.getParameter("book_name");

		if (bookTitle != null && !bookTitle.isBlank()) {
			String bookAuthor = request.getParameter("selectAuthor");
			String bookPublisher = request.getParameter("selectPublisher");
			int bookPrice = Integer.parseInt(request.getParameter("selectPrice"));
			String bookImage = request.getParameter("selectImage");
			String bookIsbn = request.getParameter("selectIsbn");
			String bookLink = request.getParameter("selectLink");
			String bookDescription = request.getParameter("selectDescription");

			// 등록성공 후 시퀀스로 생성된 bno를 알아와야 하는 상황
			int currentBno = bService.selectFindAllColums(dto);

			// book 객체 insert
			BookDTO book = new BookDTO(bookTitle, bookAuthor, bookPublisher, bookPrice, bookImage, bookIsbn, currentBno,
					bookLink, bookDescription);

			int bookCheck = 0;
			bookCheck = bookService.insertBook(book);
		}
		
		
		String callBackHost = (String) session.getAttribute("host");

		if (check > 0) {
			response.getWriter().write("<script>alert('★등록 완료★'); location.href='" + callBackHost + "';</script>");
		} else {
			response.getWriter().write("<script>alert('등록실패!! 관리자에게 문의하세요.'); history.back();</script>");
		}

		return null;
	}

	// 제목 눌렀을 때 글읽기 페이지로 이동
	@RequestMapping("/boardView.do")
	public String boardView(int bno, String page, HttpSession session) {

		// 1) 로그인 유저 정보 확인 및 안전장치+예외처리
		if (session.getAttribute("member") == null)
			return "redirect:content3.do";
		String id = ((MemberDTO) session.getAttribute("member")).getM_id();

		// 2) 조회수 증가
		HashSet<Integer> set = (HashSet<Integer>) session.getAttribute("pageSet");
		if (set == null) {
			set = new HashSet<Integer>();
			session.setAttribute("pageSet", set);
		}
		if (set.add(bno))
			bService.addCount(bno);

		// 3) bno로 해당 글 정보와 공감 갯수 찾기
		BoardDTO dto = bService.selectBoard(bno);
		int bLike = bService.selectBoardLikeCount(bno);

		// 4) 댓글 정보
		List<CommentDTO> c_list = cService.selectAllCommentList(bno);

		// 5) 지금 로그인 한 사용자가 이 글에 공감을 눌렀는가?? 를 확인.
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("m_id", id);
		map.put("bno", bno);

		int userLikeTrue = 0;
		userLikeTrue = bService.selectUserLikeTrue(map);

		// 6) 날짜에서 시간부분 짜르기
		String tmpDate = dto.getRegist_day().split(" ")[0];
		dto.setRegist_day(tmpDate);

		// 7) 책 정보 읽어오기
		BookDTO book = bookService.selectBnoBook(bno);
		if (book != null) {
			request.setAttribute("book_info", book);
		}

		// jsp 에서 식별해야 할 정보 셋팅
		request.setAttribute("board", dto);
		request.setAttribute("bLike", bLike);
		request.setAttribute("userLikeTrue", userLikeTrue);
		request.setAttribute("page", page);
		request.setAttribute("c_list", c_list);

		return "boardView";
	}

	// 공감버튼 눌렀을 때, ajax 통신
	@RequestMapping("/boardLike.do")
	public String boardLike(int bno, String id, HttpServletResponse response) throws IOException {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bno", bno);
		map.put("m_id", id);

		// 공감 테이블에 m_id 와 bno 를 insert 할 때, 만약 이 정보가 공감테이블에 있다면
		// SQL Exception이 발생됩니다. (pk제약조건 충돌)
		// 때문에 예외처리를 하고 catch 영역에서 그 정보를 지우는 방식으로 원클릭 공감/비공감 을 구현. (수업시간에 한거 복붙!!ㅋㅋ)
		int count = 0;
		try {
			count = bService.insertBoardLike(map);
		} catch (Exception e) {
			// 여기 들어왔다는건 공감테이블에 id+bno 정보가 이미 있다는 것!! (공감버튼을 눌렀다는 얘기)
			bService.deleteBoardLike(map);
		}

		// json 객체에 공감인지 비공감인지 여부(result), 공감 갯수 셋팅
		JSONObject obj = new JSONObject();
		obj.put("result", count);
		obj.put("count", bService.selectBoardLikeCount(bno));

		response.getWriter().write(obj.toString());

		return null;
	}

	// 게시글 삭제 -- 본인글 및 Admin 관리자만 가능
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(int bno, String page, HttpServletResponse response, HttpSession session)
			throws IOException {

		response.setContentType("text/html; charset=UTF-8");

		int check = 0;
		check = bService.deleteBoard(bno);

		String callBackHost = (String) session.getAttribute("host");

		if (check <= 0)
			response.getWriter().write("<script>alert('삭제실패!! 관리자에게 문의하세요.'); history.back();</script>");
		else
			response.getWriter().write(
					"<script>alert('삭제완료!'); location.href = '" + callBackHost + "?page=" + page + "';  </script>");

		return null;
	}

	// 게시글 수정 화면으로 이동할 때, jsp 로 부터 bno 받아서 넘겨넘겨줍니다.
	@RequestMapping("/updateBoardView.do")
	public String updateBoardView(int bno) {

		BoardDTO dto = bService.selectBoard(bno);
		request.setAttribute("board", dto);

		return "updateBoardView";
	}

	// 게시글 수정
	@RequestMapping("/updateBoard.do")
	public String updateBoard(BoardDTO dto, HttpServletResponse response, HttpSession session) throws IOException {

		response.setContentType("text/html; charset=UTF-8");
		int insertBookCheck =0;
		
		//redirect 경로 읽어오기
		String callBackHost = (String) session.getAttribute("host");
		
		//게시글 내용 수정
		int check = 0;
		check = bService.updateBoard(dto);
		
		//이 글에 기등록된 책이 있는지 체크
		BookDTO checkDto = bookService.selectBnoBook(dto.getBno());		
						
		//수정jsp 에서 책제목이 있는지 확인
		String bookTitle = request.getParameter("book_name");
		
		
		//--------------새로운 책 제목이 없을 때
		if(bookTitle==null || bookTitle.isBlank()) {
			
			// 1) 기존책 O, 새로운 책X --> 책정보 삭제
			if(checkDto != null) {
				bookService.deleteBook(checkDto);
			} // 2) 기존책 X, 새로운 책 X -- 할일 없음
			
		
		} else {	//------새로운 책 제목이 있을 때--------------
			
			if(checkDto != null) {		//기존 책도 있고, 새로운 책 제목도 있을 때
				
				// 3) 기존책 O, 새로운 책 O  -- 제목이 다를 때
				if(!(checkDto.getTitle().equals(bookTitle))) {
					//newBook 생성 및 삭제/등록
					//단, 검색 창에서 제대로 클릭해서 책 정보를 바꾼게 아니라 임의로 제목만 바꿀 때를 대비한
					//예외처리 및 책정보 등록실패
					try {
						String bookAuthor = request.getParameter("selectAuthor");
						String bookPublisher = request.getParameter("selectPublisher");
						int bookPrice = Integer.parseInt(request.getParameter("selectPrice"));
						String bookImage = request.getParameter("selectImage");
						String bookIsbn = request.getParameter("selectIsbn");
						String bookLink = request.getParameter("selectLink");
						String bookDescription = request.getParameter("selectDescription");

						BookDTO newBook = new BookDTO(bookTitle, bookAuthor, bookPublisher, bookPrice, bookImage, bookIsbn,
								dto.getBno(), bookLink, bookDescription);
						
						bookService.deleteBook(checkDto);
						insertBookCheck = bookService.insertBook(newBook);
						
					} catch (NumberFormatException e) {
						e.printStackTrace();
						response.getWriter().write("<script>alert('!!! 책 정보 등록에 실패했습니다 !!!'); </script>");
					}	
				} // 4) 기존책 O, 새로운 책 O  -- 제목이 같을 때 : 할일 없음
				
			} else { 
				// 5) 기존 책 X, 새로운 책O : 3번과 설명 같음
				try {
					String bookAuthor = request.getParameter("selectAuthor");
					String bookPublisher = request.getParameter("selectPublisher");
					int bookPrice = Integer.parseInt(request.getParameter("selectPrice"));
					String bookImage = request.getParameter("selectImage");
					String bookIsbn = request.getParameter("selectIsbn");
					String bookLink = request.getParameter("selectLink");
					String bookDescription = request.getParameter("selectDescription");

					BookDTO newBook = new BookDTO(bookTitle, bookAuthor, bookPublisher, bookPrice, bookImage, bookIsbn,
							dto.getBno(), bookLink, bookDescription);
					
					insertBookCheck = bookService.insertBook(newBook);
					
				} catch (NumberFormatException e) {
					e.printStackTrace();
					response.getWriter().write("<script>alert('!!! 책 정보 등록에 실패했습니다 !!!'); </script>");
				}	
			}
			
		} 

		if (check > 0)
			response.getWriter().write("<script>alert('★수정 완료★'); location.href='" + callBackHost + "';</script>");
		else
			response.getWriter().write("<script>alert('수정실패!! 관리자에게 문의하세요.'); history.back();</script>");

		return null;
	}

	//댓글 작성 ajax 통신
	@RequestMapping("/commentAdd.do")
	public String addComment(String content, int c_bno, HttpSession session, HttpServletResponse response)
			throws IOException {
		
		if(session.getAttribute("member") == null) return "redirect: main.do";
		String c_writer = ((MemberDTO) session.getAttribute("member")).getM_id();

		CommentDTO cDto = new CommentDTO(c_bno, c_writer, content);

		int count = cService.addComment(cDto);
		List<CommentDTO> c_list = null;

		if (count > 0) {
			c_list = cService.selectComment(c_bno);
		}

		JSONArray arr = new JSONArray(c_list);

		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write(arr.toString());

		return null;
	}
	
	//글쓰기 책 검색하면 열리는 팝업으로 이동할 때
	@RequestMapping("popupView.do")
	public String popupView(String keyword) {

		List<BookDTO> bookList = bookApi(keyword);

		request.setAttribute("keyword", keyword);
		request.setAttribute("bookList", bookList);

		return "popup_bookSearch";
	}

	
	
	
	/** ======= content4 책 추천 영역 ================ */
	
	//책추천 페이지 이동
	@RequestMapping("bestSeller.do")
	public String bestSeller(HttpSession session) {
		
		if(session.getAttribute("member")==null) return "redirect:main.do";
		
		// dummy book list
		String[] bestIsbn = {
				"9791197647604", "9788972773597", "9791191056372", "9788950999957", "9791130677774",
				"9791170400523", "9791161571188", "9791191891072", "9791189327156", "9788933871751", 
				"9791197377143","9788950998707", "9791191043297", "9791165344252", "9791135493218", 
				"9791157771561", "9791191777130","9788934949671",  "9791191600704", "9791197037153", 
				"9791191347685", "9788997396870", "9791191056556", "9791165344719", "9791197037122", 
				"9791190826839", "9791191043617", "9791190030922", "9791191043631", "9791191824001" , 
				"9791158741426", "9788932474427", "9791158883591", "9788984374386", "9788937472954",
				"9788962185027", "9788955824933", "9791159095894", "9788937420481", "9788901256603",
				"9791188632039","9791130679822", "9791165216603", "9791170400417", "9791196764616",
				"9791164136452", "9788954681179", "9791160948929", "9788934986652", "9788954677158",
				
				"9791191438406", "9791190090018", "9791162542644", "9788901255552", "9788936434267",
				"9791157280292", "9788970509716", "9788937461033", "9791168340039", "9788946422056",
				"9788998441012", "9788933871744", "9788937437564", "9788983711892", "9788932473901",
				"9791163030911", "9788970128207", "9791197549335", "9791139701326", "9791162143605"};
		//총 70개의 isbn

		Random r = new Random();

		// 15개의 중복없는 isbn을 뽑는데에 사용될 hashSet
		Set<String> viewBookIsbn = new HashSet<String>();

		// size가 15가 될 때 까지 중복없이 값을 뽑는다.
		while (viewBookIsbn.size() < 15) {
			viewBookIsbn.add(bestIsbn[r.nextInt(70)]);
		}
				
		// 검색할 15개의 bookList
		List<String> viewBestBook = new ArrayList<String>(viewBookIsbn);
		
		//검색 결과가 담길 배열
		List<BookDTO> bestList = new ArrayList<BookDTO>();
		
		//검색 + 호출 예외처리
		for (int i = 0; i < viewBestBook.size(); i++) {		
			BookDTO dto = null;
			
			//메서드에서 HTTP_OK (통신성공) 이 아니면 dto에 null을 리턴한다. 
			dto = bestSellerApi(viewBestBook.get(i));
			try {
				//시간초과 70보다 작아지면 index out of bounds 가 뜨는데 ... 원인을 못찾겠음 ㅜㅜ
				Thread.sleep(70);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			//dto 가 null이면 continue 해서 재검색 요청
			if(dto==null) continue; 
				
			bestList.add(dto);
		}		
		request.setAttribute("bestSeller", bestList);		
		return "best_seller";
	}

	// 책 검색 api 메서드 -- 글쓰기 페이지 사용
	public List<BookDTO> bookApi(String keyword) {

		List<BookDTO> bookList = new ArrayList<BookDTO>();

		if (keyword == null || keyword.isBlank()) {
			bookList = null;
			return bookList;
		}

		final String CLIENT_ID = "H4hMMoaG7Dj64dJgvsGr";
		final String CLIENT_SECRET = "3t0m2oOcMA";
		final String APIURL = "https://openapi.naver.com/v1/search/book.json?query=";

		String result = "";

		HttpURLConnection con = null;
		DataOutputStream dos = null;
		BufferedReader br = null;

		try {
			keyword = URLEncoder.encode(keyword, "utf-8");
			URL url = new URL(APIURL + keyword);

			con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", CLIENT_ID);
			con.setRequestProperty("X-Naver-Client-Secret", CLIENT_SECRET);

			con.setDoOutput(true);
			int responseCode = con.getResponseCode();

			if (responseCode == HttpURLConnection.HTTP_OK) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}

			while (true) {
				String str = br.readLine();
				if (str == null)
					break;
				result += str;
			}

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			System.out.println("bookApi: " + e.getMessage());
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("bookApi: " + e.getMessage());
		}

		JSONObject json = new JSONObject(result);
		JSONArray jArr = json.getJSONArray("items");

		for (int i = 0; i < jArr.length(); i++) {
			JSONObject tmpJson = jArr.getJSONObject(i);

			String title = (String) tmpJson.getString("title").split("\\(")[0].trim();
			String author = (String) tmpJson.getString("author");
			String publisher = (String) tmpJson.getString("publisher");
			String price = (String) tmpJson.getString("price");
			String image = (String) tmpJson.getString("image");
			String isbn = (String) tmpJson.getString("isbn");
			String link = (String) tmpJson.getString("link");
			String description = (String) tmpJson.getString("description");

			BookDTO dto = new BookDTO(title, author, publisher, Integer.parseInt(price), image, isbn, link,
					description);
			bookList.add(dto);
		}

		return bookList;

	} // bookApi 끝
	
	
	// bestSeller Api  -- 책추천 페이지에서 사용
		public BookDTO bestSellerApi(String keyword) {

			BookDTO book = null;

			final String CLIENT_ID = "H4hMMoaG7Dj64dJgvsGr";
			final String CLIENT_SECRET = "3t0m2oOcMA";
			final String APIURL = "https://openapi.naver.com/v1/search/book.json?query=";

			String result = "";

			HttpURLConnection con = null;
			DataOutputStream dos = null;
			BufferedReader br = null;

			try {
				keyword = URLEncoder.encode(keyword, "utf-8");
				URL url = new URL(APIURL + keyword);

				con = (HttpURLConnection) url.openConnection();
				con.setRequestMethod("GET");
				con.setRequestProperty("X-Naver-Client-Id", CLIENT_ID);
				con.setRequestProperty("X-Naver-Client-Secret", CLIENT_SECRET);

				con.setDoOutput(true);
				int responseCode = con.getResponseCode();

				if (responseCode == HttpURLConnection.HTTP_OK) {
					br = new BufferedReader(new InputStreamReader(con.getInputStream()));
				} else {
					br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
					return null;
				}

				while (true) {
					String str = br.readLine();
					if (str == null)
						break;
					result += str;
				}

			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
				System.out.println("bestSellerApi(): " + e.getMessage());
			} catch (IOException e) {
				e.printStackTrace();
				System.out.println("bestSellerApi(): " + e.getMessage());
			}

			JSONObject json = new JSONObject(result);
			JSONArray jArr=null;
			try {
				jArr = json.getJSONArray("items");
				JSONObject tmp = jArr.getJSONObject(0);
				
				String title = (String) tmp.getString("title").split("\\(")[0].trim();
				String author = (String) tmp.getString("author");
				String publisher = (String) tmp.getString("publisher");
				String price = (String) tmp.getString("price");
				String image = (String) tmp.getString("image");
				String isbn = (String) tmp.getString("isbn");
				String link = (String) tmp.getString("link");
				String description = (String) tmp.getString("description");

				book = new BookDTO(title, author, publisher, Integer.parseInt(price), image, isbn, link,
						description);
				
			} catch (JSONException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return book;
		} // bookApi 끝

	
	
}// controller 끝
