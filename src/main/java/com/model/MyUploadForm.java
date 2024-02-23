/**
 * 
 */
package com.model;

import org.springframework.web.multipart.MultipartFile;

/**
 * @author Huynh Tan Dat last on 01-08-2020 19:38:02

 *
 */
public class MyUploadForm {
	 
    private String description;
 
    // Upload files.
    private MultipartFile[] fileDatas;
 
    public String getDescription() {
        return description;
    }
 
    public void setDescription(String description) {
        this.description = description;
    }
 
    public MultipartFile[] getFileDatas() {
        return fileDatas;
    }
 
    public void setFileDatas(MultipartFile[] fileDatas) {
        this.fileDatas = fileDatas;
    }
 
}