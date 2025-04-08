package dev.markodojkic.singiattend.proxy;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cloud.gateway.route.RouteLocator;
import org.springframework.cloud.gateway.route.builder.RouteLocatorBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.DependsOn;
import reactor.core.publisher.Mono;

import java.security.InvalidParameterException;

@Configuration
public class MultitenantRouteConfig {
    private static final Logger log = LoggerFactory.getLogger(MultitenantRouteConfig.class);
    private final TenantProperties tenantProperties;

    public MultitenantRouteConfig(TenantProperties tenantProperties) {
        this.tenantProperties = tenantProperties;
    }

    @Bean
    @DependsOn("tenantProperties")
    public RouteLocator route(RouteLocatorBuilder builder) {
        RouteLocatorBuilder.Builder routesBuilder = builder.routes();
        tenantProperties.getMultitenantInstances().forEach(tenantInstance -> {
            routesBuilder.route(predicateSpec -> predicateSpec.predicate(serverWebExchange -> serverWebExchange.getRequest().getHeaders().getFirst("X-Tenant-ID").equalsIgnoreCase(tenantInstance.headerIdentification())).and().path("/api/**").uri(tenantInstance.uri()));
        });

        routesBuilder.route("no-matching-tenant-route", predicateSpec -> predicateSpec.path("/api/**").filters(gatewayFilterSpec -> gatewayFilterSpec.filter((serverWebExchange, gatewayFilterChain) -> {
            String requestedRouteIdentification = serverWebExchange.getRequest().getHeaders().getFirst("X-Tenant-ID");
            log.error("No matching tenant route found for requested [" + requestedRouteIdentification + "]");
            return Mono.error(new InvalidParameterException("No matching tenant route found for requested [" + requestedRouteIdentification + "]"));
        })).uri("no://op"));

        return routesBuilder.build();
    }
}
