package example.module.gallery.model;

import example.module.gallery.vo.PhotoVO;
import hex.model.ModelDispatcher;

/**
 * ...
 * @author Andrei Bunulu
 */
class GalleryModelDispatcher extends ModelDispatcher<IGalleryModelListener> implements IGalleryModelListener
{
	public function new() 
	{
		super();
	}
	
	public function onPhotosLoaded( photos:Array<PhotoVO> ) : Void
	{
		//Method will be implemented @compile time by macro
	}
}