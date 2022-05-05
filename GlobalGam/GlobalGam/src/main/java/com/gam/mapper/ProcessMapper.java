package com.gam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gam.dto.ProcessDTO;
import com.gam.dto.ProductDTO;
import com.gam.dto.RecipeDTO;

@Mapper
public interface ProcessMapper {

	List<ProcessDTO> selectAllPro();

	ProcessDTO selectProcess(String pro_no);

	int updateProcess(ProcessDTO processDTO);

	int deleteProcess(String pro_no);

	int insertProcess(ProcessDTO processDTO);

	List<RecipeDTO> selectAllRec();

	RecipeDTO selectRecipe(String re_no);

	RecipeDTO selectRecipe1(String re_no);

	RecipeDTO selectRecipe2(String re_no);

	int deleteRecipe(String re_no);

	List<ProductDTO> selectAllProduct();

	int insertRecipe(RecipeDTO recipeDTO);
	
}
