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
	@CommandClass( "example.module.gallery.controller.LoadPhotosAction" )
	public function loadPhotos() : ICompletable<Array<PhotoVO>> {}
}