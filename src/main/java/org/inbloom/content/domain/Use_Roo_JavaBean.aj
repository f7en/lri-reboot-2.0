// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.inbloom.content.domain;

import java.util.Set;
import org.inbloom.content.domain.Resource;
import org.inbloom.content.domain.Use;

privileged aspect Use_Roo_JavaBean {
    
    public String Use.getName() {
        return this.name;
    }
    
    public void Use.setName(String name) {
        this.name = name;
    }
    
    public Set<Resource> Use.getResource() {
        return this.resource;
    }
    
    public void Use.setResource(Set<Resource> resource) {
        this.resource = resource;
    }
    
}
