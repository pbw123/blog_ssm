package cn.niit.pojo;

import org.springframework.web.multipart.MultipartFile;

public class Girl {
private Integer id;
private String image;
private MultipartFile file;
public MultipartFile getFile() {
	return file;
}
public void setFile(MultipartFile file) {
	this.file = file;
}
public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public String getImage() {
	return image;
}
public void setImage(String image) {
	this.image = image;
}

}
