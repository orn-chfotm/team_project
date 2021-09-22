package com.project.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.AttachFileDTO;
import com.project.domain.BoardAttachVO;
import com.project.domain.Criteria;
import com.project.domain.MeetingSelectVO;
import com.project.domain.MeetingVO;
import com.project.domain.PageDTO;
import com.project.service.BoardService;
import com.project.util.CheckImageType;
import com.project.util.Folder;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@RequestMapping("/Board")
@Log4j
@AllArgsConstructor
public class BoardController {
	
	BoardService boardService;
	
	// page 이동
	@GetMapping("/popular")
	public void popular(Model model,Criteria cri) {
		log.info(cri);
		cri.setAmount(8);
		model.addAttribute("cri", cri);
		model.addAttribute("list", boardService.getListWithPaging(cri).getList());
		int total = boardService.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping("/insert")
	public void insert() {
		log.info("board insert 로 이동");
//		int total = boardService.getTotal(cri);
//		model.addAttribute("pageMaker",new PageDTO(cri,total));
	}
	
	// 상세보기
	@GetMapping("/detail/{no}")
	public String detail(@PathVariable("no") int no, Model model, Criteria cri) {
		boardService.meetcounting(no);
		model.addAttribute("list", boardService.detail(no));
		model.addAttribute("board", boardService.getListWithPaging(cri).getList());
		int total = boardService.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		model.addAttribute("replyTotalCount",boardService.getTotalReply(no));
		return "/Board/detail";
	}
	
	// insert
	@PostMapping("/insert")
	public String postInsert(MeetingVO meetingvo, RedirectAttributes rttr) {
		
		log.info("=============");
		
		if(meetingvo.getAttach_list() != null) {
			meetingvo.getAttach_list().forEach(attach -> log.info("attach: " + attach));
		}
		
		log.info("=======================");
		
		boardService.insert(meetingvo);
		log.info("insert: " + meetingvo);
		
		return "redirect:/index";
	}
	
	@PostMapping("/detail")
	public String postDetail(MeetingSelectVO meetingselectvo, RedirectAttributes rttr) {
		log.info(meetingselectvo);
		if (boardService.meetingselect(meetingselectvo)) {
			log.info(boardService);
			rttr.addFlashAttribute("message", "참여 성공");
			return "redirect:/Board/popular";
		}else {
			rttr.addFlashAttribute("message", "참여 실패");
			return "redirect:/Board/popular";
		}
	}
	
	@PostMapping("/delete")
	public String deleteDetail(MeetingSelectVO meetingselectvo, RedirectAttributes rttr) {
		log.info(meetingselectvo);
		if(boardService.selectdelete(meetingselectvo)) {
			log.info(meetingselectvo);
			rttr.addFlashAttribute("message", "취소 완료");
			return "redirect:/Board/popular";
		}else {
			rttr.addFlashAttribute("message", "취소 실패");
			return "redirect:/Board/popular";
		}
	}
	
	// 파일 첨부
	@PostMapping(value="/uploadAjaxAction", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody // ajax형식으로 data 전송
	public ResponseEntity<List<AttachFileDTO>>uploadAjaxPost(MultipartFile[] uploadFile) {
		
		List<AttachFileDTO> list = new ArrayList<>();
		
		// log.info("update ajax post............");
		
		String uploadFolder = "D:\\WorkSpace\\Spring_workspace\\TIS_Project\\img\\upload\\";
		
		// 폴더 생성
		Folder folder = new Folder(); // com.zerock.util에 있는 Folder class를 import

		String uploadFolderPath = folder.getFolder();
		
		File uploadPath = new File(uploadFolder, folder.getFolder()); // C:\\upload\\yyyy\\MM\\dd 형식으로 경로를 설정한다.
		// log.info("upload path: " + uploadPath);
		
		// 이전에 폴더가 생성 되지 않았다면 폴더를 생성한다.
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs(); // mkdir는 상위 directory가 없는 경우 생성이 불가하다. 
								 // mkdirs는 상위 directory가 없는 경우, 상위 directory도 같이 생성한다.
		} // yyyy/MM/dd 형식의 폴더를 생성
		
		// 불러온 파일들을 저장한다.
		for(MultipartFile multipartFile : uploadFile) {
			
			AttachFileDTO attachFileDTO = new AttachFileDTO();
			
//			log.info("-------------------");
//			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
//			log.info("Upload File Size: " + multipartFile.getSize());
			
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			// log.info("only file name: " + uploadFileName);
			attachFileDTO.setFile_name(uploadFileName);
			
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			attachFileDTO.setUuid(uuid.toString());
			
			CheckImageType checkImageType = new CheckImageType(); 
			
			attachFileDTO.setUuid(uuid.toString());
			attachFileDTO.setUpload_path(uploadFolderPath);

			// File saveFile = new File(uploadFolder, uploadFileName); 파일을 C://upload에만 저장
			File saveFile = new File(uploadPath, uploadFileName);

			try {
				multipartFile.transferTo(saveFile);
				
				// 파일이 이미지 type인지 체크하는 것
				if(checkImageType.checkImageType(saveFile)) {
					attachFileDTO.setFile_type(true);
					
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
					
					thumbnail.close();
				}
				
				// list에 추가
				list.add(attachFileDTO);
				
			} catch (Exception e) {
				
				log.error(e.getMessage());
			}
		//	log.info("attach_VO: "+ attachFileDTO);
		}
		return new ResponseEntity<List<AttachFileDTO>>(list, HttpStatus.OK);
	}
	
	// 파일 상세보기
	@GetMapping(value="/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(int no){
		log.info("getAttachList"+ no);
		return new ResponseEntity<List<BoardAttachVO>>(boardService.listAttach(no), HttpStatus.OK);
	}
	
	// 첨부 파일 삭제
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deletFlie(String fileName, String type){
		// log.info("delete File: " + fileName);
		
		File file;
		
		try {
			file = new File("D:\\WorkSpace\\Spring_workspace\\TIS_Project\\img\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
			
			file.delete();
			
			if(type.equals("image")) {
				String largeFileName = file.getAbsolutePath().replace("s_", "");
				
				// log.info("largeFileName: " + largeFileName);
				
				file = new File(largeFileName);
				
				file.delete();
			}
		} catch(UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	// 게시글 삭제
	@PostMapping("/postDelete")
	public String postDelete(MeetingVO meetingvo) {
		if(boardService.postDelete(meetingvo)) {
			return "redirect:/Board/popular";
		}else {
			return "redirect:/Board/popular";
		}
		
	}
	
	// 첨부 파일 썸네일
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName){
//		log.info("fileName: " + fileName);
		File file = new File("D:\\WorkSpace\\Spring_workspace\\TIS_Project\\img\\upload\\" + fileName);
//		log.info("file: " + file);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@ResponseBody
	@PostMapping(value = "/selectcheck")
	public ResponseEntity<String> selectcheck (@RequestBody MeetingSelectVO meetingselectvo) {
		log.info(meetingselectvo);
		boolean result = boardService.selectcheck(meetingselectvo);
		System.out.println(result);
		if (result) {
			return new ResponseEntity<>("true", HttpStatus.OK);
		} else {
			return new ResponseEntity<>("false", HttpStatus.OK);
		}
	}
	
	@GetMapping("/update/{meet_num}")
	public String getUpdate(HttpServletRequest request, Model model, @PathVariable("meet_num") int num) {
		model.addAttribute("update", boardService.detail(num));
		return "/Board/update";
	}
	
	@PostMapping("/update")
	public String update(MeetingVO meetingvo, BoardAttachVO attachvo ,RedirectAttributes rttr) {
		log.info("uuid: "+ attachvo.getUuid());
		if(boardService.update(meetingvo)) {
			return "redirect:/Board/detail/"+ meetingvo.getMeet_num();
			//return "redirect:/Board/popular";
		} else {
			return "redirect:/Board/detail/"+ meetingvo.getMeet_num();
		}
	}
}
