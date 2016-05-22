package example.module.gallery.model;

import example.module.gallery.vo.PhotoVO;

/**
 * @author Andrei Bunulu
 */
interface IGalleryModelListener
{
	function onPhotosLoaded( photos:Array<PhotoVO> ) : Void;
}