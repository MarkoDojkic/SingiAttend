package dev.markodojkic.singiattend.proxy;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import java.awt.*;
import java.util.List;

@Component("tenantProperties")
public class TenantProperties {
    @Value("${multitenancy.multitenantJSON}")
    private String multitenantJSONValue;
    private List<TenantInstance> tenantInstances;
    private final ObjectMapper objectMapper = new ObjectMapper();

    public record TenantInstance(String headerIdentification, String uri) {}

    @PostConstruct
    public void init() {
        if (StringUtils.hasLength(multitenantJSONValue)) {
            try {
                this.tenantInstances = objectMapper.readValue(multitenantJSONValue, new TypeReference<>() {
                });
            } catch (Exception e){
                throw new IllegalComponentStateException("Could not parse tenant instances from json: " + multitenantJSONValue);
            }
        }
    }

    public List<TenantInstance> getMultitenantInstances() {
        return tenantInstances;
    }
}
