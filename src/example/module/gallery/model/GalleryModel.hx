package example.module.gallery.model;

import example.module.gallery.model.IGalleryModelListener;
import example.module.gallery.vo.PhotoVO;
import hex.model.Model;
import hex.model.ModelDispatcher;

/**
 * ...
 * @author Andrei Bunulu
 */
class GalleryModel extends Model<GalleryModelDispatcher, IGalleryModelListener> implements IGalleryModel
{
	var _photos : Array<PhotoVO>;
	
	public function new() 
	{
		super();
	}
	
	public function setPhotos( photos : Array<PhotoVO> ) : Void 
	{
		this._photos = photos;
		this.dispatcher.onPhotosLoaded( this._photos );
	}
	
	public function getPhotos() : Array<PhotoVO> 
	{
		return this._photos;
	}
}

private class GalleryModelDispatcher extends ModelDispatcher<IGalleryModelListener> implements IGalleryModelListener
{
	public function new() 
	{
		super();
	}
	
	public function onPhotosLoaded( photos : Array<PhotoVO> ) : Void
	{
		//Method will be implemented @compile time by macro
	}
}