package com.gam.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.gam.dto.ProcessDTO;
import com.gam.dto.ProductDTO;
import com.gam.dto.RecipeDTO;
import com.gam.mapper.ProcessMapper;

@Service
public class ProcessService {
	private ProcessMapper mapper;

	public ProcessService(ProcessMapper mapper) {
		super();
		this.mapper = mapper;
	}

	public List<ProcessDTO> selectAllPro() {
		return mapper.selectAllPro();
	}

	public ProcessDTO selectProcess(String pro_no) {
		return mapper.selectProcess(pro_no);
	}

	public int updateProcess(ProcessDTO processDTO) {
		return mapper.updateProcess(processDTO);
	}

	public int deleteProcess(String pro_no) {
		return mapper.deleteProcess(pro_no);
	}

	public int insertProcess(ProcessDTO processDTO) {
		return mapper.insertProcess(processDTO);
	}

	public List<RecipeDTO> selectAllRec() {
		return mapper.selectAllRec();
	}

	public RecipeDTO selectRecipe(String re_no) {
		return mapper.selectRecipe(re_no);
	}

	public RecipeDTO selectRecipe1(String re_no) {
		return mapper.selectRecipe1(re_no);
	}

	public RecipeDTO selectRecipe2(String re_no) {
		return mapper.selectRecipe2(re_no);
	}

	public int deleteRecipe(String re_no) {
		return mapper.deleteRecipe(re_no);
	}

	public List<ProductDTO> selectAllProduct() {
		return mapper.selectAllProduct();
	}

	public int insertRecipe(RecipeDTO recipeDTO) {
		return mapper.insertRecipe(recipeDTO);
	}
	
}
