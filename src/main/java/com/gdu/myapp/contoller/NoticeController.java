package com.gdu.myapp.contoller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gdu.myapp.dto.NoticeDto;
import com.gdu.myapp.service.NoticeService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor  // private final NoticeService NoticeService;에 @Autowired를 하기 위한 코드이다.
@Controller
public class NoticeController {

  // NoticeController를 실행할 때 org.slf4j.Logger가 동작한다.
  // private static final Logger log = LoggerFactory.getLogger(NoticeController.class);
  
  private final NoticeService noticeService;
  
  @RequestMapping(value="/notice/list.do", method=RequestMethod.GET)
  public String list(Model model) {
    List<NoticeDto> noticeList = noticeService.getNoticeList();
    model.addAttribute("noticeList", noticeList);
    return "notice/list";
  }
  
  @RequestMapping(value="/notice/write.do", method=RequestMethod.GET)
  public String write() {
    return "notice/write";
  }
  
  @RequestMapping(value="/notice/add.do", method=RequestMethod.POST)
  public String add(NoticeDto noticeDto, RedirectAttributes redirectAttributes) {
    int addResult = noticeService.addNotice(noticeDto);
    redirectAttributes.addFlashAttribute("addResult", addResult);
    return "redirect:/notice/list.do";
  }
  
  @RequestMapping(value="/notice/detail.do", method=RequestMethod.GET)
  public String detail(@RequestParam(value="noticeNo", required=false, defaultValue="0") int noticeNo, Model model) {
    model.addAttribute("notice", noticeService.getNoticeByNo(noticeNo));
    return "notice/detail";
  }
  
  @RequestMapping(value="/notice/modify.do", method=RequestMethod.POST)
  public String modify(NoticeDto noticeDto, RedirectAttributes redirectAttributes) {
    int modifyResult = noticeService.modifyNotice(noticeDto);
    redirectAttributes.addFlashAttribute("modifyResult", modifyResult);
    return "redirect:/notice/list.do";
  }
  
  @RequestMapping(value="/notice/delete.do", method=RequestMethod.POST)
  public String delete(@RequestParam(value="noticeNo", required=false, defaultValue="0") int noticeNo, RedirectAttributes redirectAttributes) {
    int deleteResult = noticeService.deleteNotice(noticeNo);
    redirectAttributes.addFlashAttribute("deleteResult", deleteResult);
    return "redirect:/notice/list.do";
  }
  
 
  
}
