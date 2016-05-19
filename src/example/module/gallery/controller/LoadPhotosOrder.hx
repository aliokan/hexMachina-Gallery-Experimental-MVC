package example.module.gallery.controller;

import example.module.gallery.service.IGetPhotosService;
import example.module.gallery.vo.PhotoVO;
import hex.control.order.Order;
import hex.di.IInjectorContainer;

/**
 * ...
 * @author Francis Bourre
 */
class LoadPhotosOrder extends Order<Array<PhotoVO>> implements IInjectorContainer
{
	@Inject
	public var photosService : IGetPhotosService;

	public function execute() : Void 
	{
		photosService.getPhotos().onComplete( this._complete ).onFail( this._fail );
	}
}