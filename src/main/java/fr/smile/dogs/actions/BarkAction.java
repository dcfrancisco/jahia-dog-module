/**
 * 
 */
package fr.smile.dogs.actions;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.jahia.bin.Action;
import org.jahia.bin.ActionResult;
import org.jahia.services.content.JCRSessionWrapper;
import org.jahia.services.render.RenderContext;
import org.jahia.services.render.Resource;
import org.jahia.services.render.URLResolver;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @author bayramov.m
 * Date 2015
 */
public class BarkAction extends Action {
	
	private static final Logger logger = LoggerFactory.getLogger(BarkAction.class);

	@Override
	public ActionResult doExecute(HttpServletRequest req,
			RenderContext renderContext, Resource resource,
			JCRSessionWrapper session, Map<String, List<String>> parameters,
			URLResolver urlResolver) throws Exception {
		
		logger.info("Woof Woof");
		return ActionResult.OK;
	}

}
