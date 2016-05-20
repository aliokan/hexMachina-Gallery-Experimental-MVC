package example.module.gallery.view;

import example.module.gallery.vo.PhotoVO;
import hex.view.IView;

/**
 * @author Andrei Bunulu
 */
interface IGalleryView extends IView
{
	function setPhotos( photos : Array<PhotoVO> ) : Void;
}