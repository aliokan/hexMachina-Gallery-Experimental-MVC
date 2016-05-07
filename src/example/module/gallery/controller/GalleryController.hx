package example.module.gallery.controller;

import hex.control.controller.Controller;
import hex.control.controller.IObservable;

/**
 * ...
 * @author Francis Bourre
 */
class GalleryController extends Controller implements IGalleryController
{
	@CommandClass( "example.module.gallery.controller.LoadPhotosCommand" )
	public function loadPhotos() : IObservable {}
}