// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.inbloom.content.controller;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.inbloom.content.controller.AudienceController;
import org.inbloom.content.domain.Audience;
import org.inbloom.content.domain.Resource;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect AudienceController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String AudienceController.create(@Valid Audience audience, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, audience);
            return "audiences/create";
        }
        uiModel.asMap().clear();
        audience.persist();
        return "redirect:/audiences/" + encodeUrlPathSegment(audience.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String AudienceController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Audience());
        return "audiences/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String AudienceController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("audience", Audience.findAudience(id));
        uiModel.addAttribute("itemId", id);
        return "audiences/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String AudienceController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("audiences", Audience.findAudienceEntries(firstResult, sizeNo));
            float nrOfPages = (float) Audience.countAudiences() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("audiences", Audience.findAllAudiences());
        }
        return "audiences/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String AudienceController.update(@Valid Audience audience, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, audience);
            return "audiences/update";
        }
        uiModel.asMap().clear();
        audience.merge();
        return "redirect:/audiences/" + encodeUrlPathSegment(audience.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String AudienceController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Audience.findAudience(id));
        return "audiences/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String AudienceController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Audience audience = Audience.findAudience(id);
        audience.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/audiences";
    }
    
    void AudienceController.populateEditForm(Model uiModel, Audience audience) {
        uiModel.addAttribute("audience", audience);
        uiModel.addAttribute("resources", Resource.findAllResources());
    }
    
    String AudienceController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
