//
//  Post.swift
//  social
//
//  Created by Subhankar Dee Raj on 18/06/17.
//  Copyright © 2017 Subhankar. All rights reserved.
//

import Foundation

class Post {
    private var _caption: String!
    private var _imageUrl: String!
    private var _likes: Int!
    private var _postKey: String!
    

    var imageUrl: String {
        return _imageUrl
    }

    var likes: Int {
        if let unWrappedLikes = self._likes{
            return unWrappedLikes
        }
        else{
            return 0
        }
    }
    
    var postKey: String {
        return _postKey
    }
    
    var caption: String {
        if let unWrappedCaption = self._caption{
            return unWrappedCaption
        }
        else{
            return ""
        }
    }
    
    
    init(caption: String, imageUrl: String, likes: Int) {
        self._caption = caption
        self._imageUrl = caption
        self._likes = likes
    }
    
    init(postKey: String, postData: Dictionary<String, AnyObject>) {
        self._postKey = postKey
        
        if let caption = postData["caption"] as? String {
            self._caption = caption
        }
        
        if let imageUrl = postData["imageUrl"] as? String {
            self._imageUrl = imageUrl
        }
        
        if let likes = postData["likes"] as? Int {
            self._likes = likes
        }
    }
    
}
