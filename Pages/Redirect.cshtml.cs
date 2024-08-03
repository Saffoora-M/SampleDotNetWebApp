using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Runtime.InteropServices;

namespace dotnetcoresample.Pages;

public class RedirectModel : PageModel
{

    public string OSVersion { get { return RuntimeInformation.OSDescription; }  }
    
    private readonly ILogger<RedirectModel> _logger;

    public RedirectModel(ILogger<RedirectModel> logger)
    {
        _logger = logger;
    }

    public void OnGet()
    {        
    }
}