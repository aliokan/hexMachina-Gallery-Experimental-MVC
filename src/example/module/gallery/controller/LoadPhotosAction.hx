package example.module.gallery.controller;

import example.module.gallery.model.IGalleryModel;
import example.module.gallery.service.IGetPhotosService;
import example.module.gallery.vo.PhotoVO;
import hex.control.Request;
import hex.control.action.Action;
import hex.di.IInjectorContainer;
import hex.service.stateless.http.HTTPServiceConfiguration;
import hex.service.stateless.http.IHTTPService;
import hex.service.stateless.http.IHTTPServiceListener;

/**
 * ...
 * @author Francis Bourre
 */
class LoadPhotosAction extends Action<Array<PhotoVO>> implements IHTTPServiceListener<HTTPServiceConfiguration> implements IInjectorContainer
{
	@Inject
	public var photosService : IGetPhotosService;
	
	@Inject
	public var galleryModel : IGalleryModel;
	
	function new()
	{
		super();
	}
	
	public function execute( ?request : Request ) : Void 
	{
		this.getLogger().info( "LoadPhotosCommand execute" );
		photosService.addHTTPServiceListener( this );
		photosService.call();
	}
	
	public function onServiceComplete( service : IHTTPService<HTTPServiceConfiguration> ) : Void
	{
		this.getLogger().info( "onServiceComplete" );
		//this.galleryModel.setPhotos( photosService.getPhotos() );
		this._complete( photosService.getPhotos() );
	}
	
	public function onServiceFail( service : IHTTPService<HTTPServiceConfiguration> ) : Void
	{
		this.getLogger().error( "onServiceFail" );
	}
	public function onServiceCancel( service : IHTTPService<HTTPServiceConfiguration> ) : Void
	{
		this.getLogger().info( "onServiceCancel" );
	}
	public function onServiceTimeout( service : IHTTPService<HTTPServiceConfiguration> ) : Void
	{
		this.getLogger().error( "onServiceTimeout" );
	}	
}