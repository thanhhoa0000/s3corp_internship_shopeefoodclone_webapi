namespace ShopeeFoodClone.WebApi.Users.Presentation.Controllers;

[Authorize(AuthenticationSchemes = "Bearer", Policy = "AdminOnly")]
[ApiController]
[Route("api/v{version:apiVersion}/roles")]
[ApiVersion(1)]
public class RolesApiController : ControllerBase
{
    private readonly IRoleManagementService _service;
    private readonly ILogger<RolesApiController> _logger;
    private Response _response;

    public RolesApiController(IRoleManagementService service, ILogger<RolesApiController> logger)
    {
        _service = service;
        _logger = logger;
        _response = new Response();
    }
    
    [HttpGet]
    public async Task<IActionResult> GetAll([FromQuery] int pageSize = 10, [FromQuery] int pageNumber = 1)
    {
        try
        {
            var request = new GetRolesRequest()
            {
                PageSize = pageSize,
                PageNumber = pageNumber
            };
            
            _logger.LogInformation("Getting the roles...");
            
            _response = await _service.GetAllAsync(request);
            
            return Ok(_response);
        }
        catch (Exception ex)
        {
            _logger.LogError("Error(s) occurred: \n---\n{error}", ex);
            
            return BadRequest("Error(s) occurred when getting the roles!");
        }
    }

    [HttpGet("{roleId:guid}")]
    public async Task<IActionResult> GetById([FromRoute] Guid roleId)
    {
        try
        {
            _logger.LogInformation("Getting the user...");
            
            _response = await _service.GetAsync(roleId);
            
            if (_response.Message.Contains("not found"))
            {
                return NotFound("Role not found!");
            }
            
            return Ok(_response);
        }
        catch (Exception ex)
        {
            _logger.LogError("Error(s) occurred: \n---\n{error}", ex);
            
            return BadRequest("Error(s) occurred when getting the role!");
        }
    }

    [HttpPost]
    public async Task<IActionResult> Create([FromBody] string roleName)
    {
        try
        {
            _logger.LogInformation($"Creating role {roleName}");
            
            _response = await _service.CreateAsync(roleName);

            return Created();
        }
        catch (Exception ex)
        {
            _logger.LogError("Error(s) occurred: \n---\n{error}", ex);
            
            return BadRequest("Error(s) occurred when creating the role!");
        }
    }

    [HttpPut]
    public async Task<IActionResult> Update([FromBody] AppRoleDto roleDto)
    {
        try
        {
            _logger.LogInformation($"Updating role {roleDto.NormalizedName}");
            
            _response = await _service.UpdateAsync(roleDto);
            
            if (_response.Message.Contains("not found"))
            {
                return NotFound("Role not found!");
            }

            return NoContent();
        }
        catch (Exception ex)
        {
            _logger.LogError("Error(s) occurred: \n---\n{error}", ex);
            
            return BadRequest("Error(s) occurred when updating the role!");
        }
    }

    [HttpDelete("{roleId:guid}")]
    public async Task<IActionResult> Delete([FromRoute] Guid roleId)
    {
        try
        {
            _logger.LogInformation($"Deleting user {roleId}");
            
            _response = await _service.RemoveAsync(roleId);
            
            if (_response.Message.Contains("not found"))
            {
                return NotFound("Role not found!");
            }

            return NoContent();
        }
        catch (Exception ex)
        {
            _logger.LogError("Error(s) occurred: \n---\n{error}", ex);
            
            return BadRequest("Error(s) occurred when deleting the role!");
        }
    }
}
