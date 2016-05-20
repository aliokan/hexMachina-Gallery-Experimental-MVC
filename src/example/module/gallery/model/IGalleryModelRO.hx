package example.module.gallery.model;

import example.module.gallery.model.IGalleryModelListener;
import example.module.gallery.vo.PhotoVO;
import hex.model.IModelRO;

/**
 * @author Andrei Bunulu
 */
interface IGalleryModelRO extends IModelRO<IGalleryModelListener>
{
	function getPhotos() : Array<PhotoVO>;
}