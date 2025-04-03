package com.myTraining.core.models;

import javax.inject.Inject;
import org.apache.sling.api.resource.Resource;
import com.adobe.cq.export.json.ExporterConstants;
import org.apache.sling.models.annotations.Default;
import org.apache.sling.models.annotations.DefaultInjectionStrategy;
import org.apache.sling.models.annotations.Model;
import org.apache.sling.models.annotations.Exporter;

@Model(adaptables = Resource.class, defaultInjectionStrategy = DefaultInjectionStrategy.OPTIONAL)
@Exporter(name = ExporterConstants.SLING_MODEL_EXPORTER_NAME, extensions = ExporterConstants.SLING_MODEL_EXTENSION)
public class ContactMeModel {

    @Inject
    @Default(values = "suhail@gmail.com")
    private String email;

    @Inject
    @Default(values = "https://in.linkedin.com/")
    private String linkedin;

    @Inject
    @Default(values = "https://x.com/?lang=en-in")
    private String twitter;

    @Inject
    @Default(values = "https://www.instagram.com/")
    private String instagram;

    public String getEmail() { return email; }
    public String getLinkedin() { return linkedin; }
    public String getTwitter() { return twitter; }
    public String getInstagram() { return instagram; }
}
