/**
 * 
 */
package fr.smile.dogs.render.filter;

import org.jahia.services.render.RenderContext;
import org.jahia.services.render.Resource;
import org.jahia.services.render.filter.AbstractFilter;
import org.jahia.services.render.filter.RenderChain;

import java.util.LinkedList;

/**
 * @author bayramov.m
 * Created: Jan 26, 2015
 */
public class LastViewedFilter extends AbstractFilter {

    private static final int maxElements = 50;

    // Nothing to do for execute and finalize methods

    public String prepare(RenderContext renderContext, Resource resource, RenderChain chain) throws Exception {

        LinkedList<String> latestViewed;
        latestViewed = (LinkedList<String>)renderContext.getRequest().getSession().getAttribute("latestViewedDogs");

        if (latestViewed == null) {
            latestViewed = new LinkedList<String>();
        }

        String nodePath = resource.getNode().getPath();
        int i = latestViewed.indexOf(nodePath);
        if (i >= 0) {
            latestViewed.remove(i);
        }

        latestViewed.addFirst(nodePath);
        if (latestViewed.size() > maxElements) {
            latestViewed.removeLast();
        }

        renderContext.getRequest().getSession().setAttribute("latestViewedDogs", latestViewed);
        return null;
    }

}
