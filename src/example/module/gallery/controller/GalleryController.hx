package example.module.gallery.controller;

import example.module.gallery.vo.PhotoVO;
import hex.control.controller.Controller;
import hex.control.controller.ICompletable;

/**
 * ...
 * @author Francis Bourre
 */
class GalleryController extends Controller implements IGalleryController
{
	@Class( "example.module.gallery.controller.LoadPhotosOrder" )
	public function loadPhotos() : ICompletable<Array<PhotoVO>> {}
}