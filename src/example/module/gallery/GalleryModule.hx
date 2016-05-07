package example.module.gallery;

import example.module.gallery.controller.GalleryController;
import example.module.gallery.controller.IGalleryController;
import example.module.gallery.model.GalleryModel;
import example.module.gallery.model.IGalleryModel;
import example.module.gallery.service.IGetPhotosService;
import example.module.gallery.view.GalleryViewHelper;
import hex.config.stateful.IStatefulConfig;
import hex.config.stateless.StatelessModuleConfig;
import hex.module.Module;
import hex.module.dependency.IRuntimeDependencies;
import hex.module.dependency.RuntimeDependencies;

/**
 * ...
 * @author Andrei Bunulu
 */
class GalleryModule extends Module implements IGalleryModule
{

	public function new( serviceConfig : IStatefulConfig ) 
	{
		super();

		this._addStatefulConfigs([serviceConfig]);
		this._addStatelessConfigClasses( [ GalleryModuleConfig ] );
		this.buildView();
		
		//this._dispatchPrivateMessage( GalleryModuleMessage.LOAD_PHOTOS ); 
	}
	
	override function _getRuntimeDependencies() : IRuntimeDependencies
	{
		var rd = new RuntimeDependencies();
		rd.addServiceDependencies( [ IGetPhotosService ] );
		return rd;
	}
	
	function buildView( ):Void
	{
		#if flash
			var container : flash.display.Sprite = new flash.display.Sprite();
			flash.Lib.current.addChild(container);
			this.buildViewHelper( GalleryViewHelper, new example.module.gallery.view.GalleryViewFlash(container) );
		#elseif js
			this.buildViewHelper( GalleryViewHelper, new example.module.gallery.view.GalleryViewJS(js.Browser.document.querySelector(".gallery")) );
		#else 
			#error  // will display an error "Not implemented on this platform"
		#end
	}
}

private class GalleryModuleConfig extends StatelessModuleConfig
{
	override public function configure() : Void
	{
		this.mapModel( IGalleryModel, GalleryModel );
		this.mapController( IGalleryController, GalleryController );
	}
}