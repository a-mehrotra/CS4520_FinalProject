//
//  TimelineTableViewController.swift
//  FinalProject_CS4520
//
//  Created by John Rodrigues on 6/23/23.
//

import Foundation
import UIKit

extension TimelineViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewTimeline" , for: indexPath) as! TimelineTableViewCell
        
        let formatDate = DateFormatter()
        formatDate.dateFormat = "yyyy-MM-dd HH:mm:ss"
    
        let formattedDate = formatDate.string(from: postsArray[indexPath.row].dateTime.dateValue())
        
        cell.labelUsername.text = postsArray[indexPath.row].username
        cell.labelDate.text = formattedDate
        cell.labelCaption.text = postsArray[indexPath.row].caption
        cell.locationButton.setTitle(postsArray[indexPath.row].location, for: .normal)
        cell.commentsButton.setTitle("14 comments", for: .normal)
        cell.likesButton.setTitle("10 likes", for: .normal)
        return cell
    }
}
