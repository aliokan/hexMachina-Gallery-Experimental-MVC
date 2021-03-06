package example.module.gallery.view;

import example.module.gallery.controller.IGalleryController;
import example.module.gallery.model.IGalleryModelListener;
import example.module.gallery.model.IGalleryModelRO;
import example.module.gallery.vo.PhotoVO;
import hex.view.viewhelper.ViewHelper;

/**
 * ...
 * @author Andrei Bunulu
 */
class GalleryViewHelper extends ViewHelper<IGalleryView> implements IGalleryModelListener
{
	@Inject
	var _model : IGalleryModelRO;
	
	@Inject
	var _controller : IGalleryController;
	
	public function new() 
	{
		super();
		
	}
	
	override function _initialize() : Void 
	{
		super._initialize();
		
		this._model.addListener( this );
		this._controller.loadPhotos().onComplete( this.onPhotosLoaded );
	}
	
	public function onPhotosLoaded( photos : Array<PhotoVO> ) : Void
	{
		this.getLogger().info( "onPhotosLoaded" );
		this._view.setPhotos( photos );
	}
}