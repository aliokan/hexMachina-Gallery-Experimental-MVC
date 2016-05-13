package example.module.gallery.controller;

import example.module.gallery.vo.PhotoVO;
import hex.control.controller.IController;
import hex.control.controller.ICompletable;

/**
 * @author Francis Bourre
 */
interface IGalleryController extends IController
{
	function loadPhotos() : ICompletable<Array<PhotoVO>>;
}