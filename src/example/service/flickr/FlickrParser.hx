package example.service.flickr;

import example.module.gallery.vo.PhotoVO;
import hex.data.IParser;

/**
 * ...
 * @author Andrei Bunulu
 */
class FlickrParser implements IParser<Array<PhotoVO>>
{
	public function new() 
	{
		
	}
	
	public function parse( serializedContent : Dynamic, target : Dynamic = null ) : Array<PhotoVO> 
	{
		var jsonString : String = serializedContent;
		jsonString = jsonString.substr(14);
		jsonString = jsonString.substr(0, -1);
		var json = haxe.Json.parse( jsonString );

		for ( n in Reflect.fields( json.photos.photo ) )
		{
			var photo = Reflect.field( json.photos.photo, n );
			var url = "https://farm" + photo.farm + ".staticflickr.com/" + photo.server + "/" + photo.id + "_" + photo.secret + "_b.jpg";
			photosList.push( new PhotoVO(url, photo.title) );
		}
		
		return photosList;
	}
}