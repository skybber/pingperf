package org.hotswap.test.jaxrs.ping.boundary;

import javax.inject.Inject;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.hotswap.test.jaxrs.ping.control.Statistics;

@Path("ping")
public class PingResource {

    @Inject
    private Statistics statistics;

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public Response getStatistic() {
        statistics.updateStatistic(0);
        return Response.ok().build();
    }
}