package xyz.tour.newworld.mapper;

import java.util.List;

import xyz.tour.newworld.vo.FileInfoVO;

public interface FileInfoMapper {
	
	List<FileInfoVO> selectFileInfos();
	int insertFileInfo(FileInfoVO fileInfo);

}
