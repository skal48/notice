package com.gdu.myapp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class NoticeDto {
  private int noticeNo;
  private String title;
  private String gubun;
  private String content;
}
