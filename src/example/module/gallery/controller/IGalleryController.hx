package example.module.gallery.controller;

import hex.control.controller.IController;
import hex.control.controller.IObservable;

/**
 * @author Francis Bourre
 */
interface IGalleryController extends IController
{
	function loadPhotos() : IObservable;
}