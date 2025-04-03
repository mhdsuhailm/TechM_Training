package com.myTraining.core.models;

import org.apache.sling.api.resource.Resource;
import org.apache.sling.models.annotations.DefaultInjectionStrategy;
import org.apache.sling.models.annotations.Model;
import org.apache.sling.models.annotations.injectorspecific.ValueMapValue;
import javax.inject.Inject;
import java.util.List;

@Model(adaptables = Resource.class, defaultInjectionStrategy = DefaultInjectionStrategy.OPTIONAL)
public class HeaderModel {

    @Inject
    private String logoPath;

    @Inject
    private List<String> menuItems;

    @Inject
    private String newsDropdownItems;

    public String getLogoPath() {
        return logoPath;
    }

    public List<String> getMenuItems() {
        return menuItems;
    }

    public String getNewsDropdownItems() {
        return newsDropdownItems;
    }
}
