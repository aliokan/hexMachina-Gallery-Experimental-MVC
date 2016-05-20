package example;

import hex.compiler.parser.xml.XmlCompiler;
import hex.log.layout.LogProxyLayout;

/**
 * ...
 * @author duke
 */
@:expose("FlickrExample")
class FlickrExample
{
	static var self : FlickrExample;

	static public function main() : Void
	{trace("yo");
		#if debug
		var proxy : LogProxyLayout = new LogProxyLayout();
		#if js
		var controller = new hex.log.layout.LogLayoutHTMLView( proxy );
		proxy.addListener( new hex.log.layout.SimpleBrowserLayout( controller.consoleWrapperTaget ) );
		proxy.addListener( new hex.log.layout.JavaScriptConsoleLayout() );
		#elseif flash
		proxy.addListener( new hex.log.layout.TraceLayout() );
		#end
		
		self = new FlickrExample(); 
		#end
	}
	
	public function new()
	{
		XmlCompiler.readXmlFile( "example/configuration/context.xml" );
	}
}