package org.inbloom.content.controller;
import org.inbloom.content.domain.Lang;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/langs")
@Controller
@RooWebScaffold(path = "langs", formBackingObject = Lang.class)
@RooWebJson(jsonObject = Lang.class)
public class LangController {

	@RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> createFromJson(@RequestBody String json) {
        Lang lang = Lang.fromJsonToLang(json);
        lang.persist();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        headers.add("Location", ServletUriComponentsBuilder.fromCurrentRequest().path("/").path(lang.getId().toString()).build().toString());
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
}
