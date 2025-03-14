namespace ShopeeFoodClone.WebApi.Stores.Presentation.Controllers;

[Authorize(AuthenticationSchemes = "Bearer", Policy = "AdminOnly")]
[ApiController]
[Route("api/v{version:apiVersion}/categories")]
[ApiVersion(1)]
public class CategoriesApiController : ControllerBase
{
    private readonly ICategoryService _categoryService;
    private readonly ISubCategoryService _subCategoryService;
    private readonly ILogger<CategoriesApiController> _logger;
    private Response _response;

    public CategoriesApiController(ICategoryService categoryService, ISubCategoryService subCategoryService, ILogger<CategoriesApiController> logger)
    {
        _categoryService = categoryService;
        _subCategoryService = subCategoryService;
        _logger = logger;
        _response = new Response();
    }
    
    [AllowAnonymous]
    [HttpGet]
    public async Task<IActionResult> GetAll([FromQuery] int pageSize = 0, [FromQuery] int pageNumber = 1)
    {
        try
        {
            _logger.LogInformation("Getting the categories...");
            
            _response = await _categoryService.GetAllAsync(pageSize: pageSize, pageNumber: pageNumber);
            
            return Ok(_response);
        }
        catch (Exception ex)
        {
            _logger.LogError("Error(s) occurred: \n---\n{error}", ex);
            
            return BadRequest("Error(s) occurred when getting the categories!");
        }
    }
    
    [AllowAnonymous]
    [HttpGet("{cateId:guid}")]
    public async Task<IActionResult> GetById([FromRoute] Guid cateId)
    {
        try
        {
            _logger.LogInformation("Getting the category...");
            
            _response = await _categoryService.GetAsync(cateId);
            
            return Ok(_response);
        }
        catch (Exception ex)
        {
            _logger.LogError("Error(s) occurred: \n---\n{error}", ex);
            
            return BadRequest("Error(s) occurred when getting the category!");
        }
    }
    
    [AllowAnonymous]
    [HttpGet("{name}")]
    public async Task<IActionResult> GetByCodeName([FromRoute] string name)
    {
        try
        {
            _logger.LogInformation("Getting the category...");
            
            _response = await _categoryService.GetByCodeNameAsync(name);
            
            return Ok(_response);
        }
        catch (Exception ex)
        {
            _logger.LogError("Error(s) occurred: \n---\n{error}", ex);
            
            return BadRequest("Error(s) occurred when getting the category!");
        }
    }
    
    [HttpPost]
    public async Task<IActionResult> Create([FromBody] CategoryDto categoryDto)
    {
        try
        {
            _logger.LogInformation($"Creating category {categoryDto.Id}...");
            
            _response = await _categoryService.CreateAsync(categoryDto);
            
            return Ok(_response);
        }
        catch (Exception ex)
        {
            _logger.LogError("Error(s) occurred: \n---\n{error}", ex);
            
            return BadRequest("Error(s) occurred when creating the category!");
        }
    }
    
    [HttpPut]
    public async Task<IActionResult> Update([FromBody] CategoryDto category)
    {
        try
        {
            _logger.LogInformation($"Updating category {category.Id}...");
            
            _response = await _categoryService.UpdateAsync(category);
            
            return Ok(_response);
        }
        catch (Exception ex)
        {
            _logger.LogError("Error(s) occurred: \n---\n{error}", ex);
            
            return BadRequest("Error(s) occurred when updating the category!");
        }
    }
    
    [HttpDelete("{cateId:guid}")]
    public async Task<IActionResult> Delete([FromRoute] Guid cateId)
    {
        try
        {
            _logger.LogInformation($"Deleting category {cateId}...");
            
            _response = await _categoryService.RemoveAsync(cateId);
            
            return Ok(_response);
        }
        catch (Exception ex)
        {
            _logger.LogError("Error(s) occurred: \n---\n{error}", ex);
            
            return BadRequest("Error(s) occurred when deleting the category!");
        }
    }

    [AllowAnonymous]
    [HttpGet("{cateId:guid}/sub-categories")]
    public async Task<IActionResult> GetSubCategoriesByCategoryId([FromRoute] Guid cateId, [FromQuery] int pageSize = 12, [FromQuery] int pageNumber = 1)
    {
        try
        {
            _logger.LogInformation($"Getting sub-categories of category {cateId}...");

            _response = await _subCategoryService.GetAllAsync(cateId: cateId, pageSize: pageSize, pageNumber: pageNumber);
            
            return Ok(_response);
        }
        catch (Exception ex)
        {
            _logger.LogError("Error(s) occurred: \n---\n{error}", ex);
            
            return BadRequest("Error(s) occurred when getting the sub-categories!");
        }
    }
    
    [AllowAnonymous]
    [HttpGet("{cateName}/sub-categories")]
    public async Task<IActionResult> GetSubCategoriesByCategoryId([FromRoute] string cateName, [FromQuery] int pageSize = 12, [FromQuery] int pageNumber = 1)
    {
        try
        {
            _logger.LogInformation($"Getting sub-categories of category {cateName}...");

            _response = await _subCategoryService.GetAllByCodeNameAsync(cateName: cateName, pageSize: pageSize, pageNumber: pageNumber);
            
            return Ok(_response);
        }
        catch (Exception ex)
        {
            _logger.LogError("Error(s) occurred: \n---\n{error}", ex);
            
            return BadRequest("Error(s) occurred when getting the sub-categories!");
        }
    }
    
    [HttpGet("{cateId:guid}/sub-categories/{subCategoryId:guid}")]
    public async Task<IActionResult> GetSubCategory([FromRoute] Guid subCategoryId)
    {
        try
        {
            _logger.LogInformation($"Getting sub-category {subCategoryId}...");

            _response = await _subCategoryService.GetAsync(subCateId: subCategoryId);
            
            return Ok(_response);
        }
        catch (Exception ex)
        {
            _logger.LogError("Error(s) occurred: \n---\n{error}", ex);
            
            return BadRequest("Error(s) occurred when getting the sub-category!");
        }
    }
    
    [HttpPost("{cateId:guid}/sub-categories")]
    public async Task<IActionResult> CreateSubCategory([FromBody] CreateSubCategoryRequest request)
    {
        try
        {
            _logger.LogInformation($"Creating sub-category {request.SubCategoryDto.Id}...");

            _response = await _subCategoryService.CreateAsync(request);
            
            return Ok(_response);
        }
        catch (Exception ex)
        {
            _logger.LogError("Error(s) occurred: \n---\n{error}", ex);
            
            return BadRequest("Error(s) occurred when getting the sub-category!");
        }
    }
    
    [HttpPut("{cateId:guid}/sub-categories")]
    public async Task<IActionResult> CreateSubCategory([FromBody] SubCategoryDto subCategoryDto)
    {
        try
        {
            _logger.LogInformation($"Updating sub-category {subCategoryDto.Id}...");

            _response = await _subCategoryService.UpdateAsync(subCategoryDto);
            
            return Ok(_response);
        }
        catch (Exception ex)
        {
            _logger.LogError("Error(s) occurred: \n---\n{error}", ex);
            
            return BadRequest("Error(s) occurred when updating the sub-category!");
        }
    }
    
    [HttpDelete("{cateId:guid}/sub-categories/{subCategoryId:guid}")]
    public async Task<IActionResult> DeleteSubCategory([FromRoute] Guid subCategoryId)
    {
        try
        {
            _logger.LogInformation($"Deleting sub-category {subCategoryId}...");

            _response = await _subCategoryService.RemoveAsync(subCateId: subCategoryId);
            
            return Ok(_response);
        }
        catch (Exception ex)
        {
            _logger.LogError("Error(s) occurred: \n---\n{error}", ex);
            
            return BadRequest("Error(s) occurred when deleting the sub-category!");
        }
    }
}
