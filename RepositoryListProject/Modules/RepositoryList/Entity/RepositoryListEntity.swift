//
//  RepositoryListEntity.swift
//  RepositoryListProject
//
//  Created by bisma on 24/08/2024.
//

import Foundation
struct RepositoryList : Codable {
    let total_count : Int?
    let incomplete_results : Bool?
    let items : [Repositories]?
    
    enum CodingKeys: String, CodingKey{
        case total_count = "total_count"
        case incomplete_results = "incomplete_results"
        case items  = "items"
    }
}



struct License : Codable {
    let key : String?
    let name : String?
    let spdx_id : String?
    let url : String?
    let node_id : String?
    
    enum CodingKeys: String, CodingKey {
        
        case key = "key"
        case name = "name"
        case spdx_id = "spdx_id"
        case url = "url"
        case node_id = "node_id"
    }
}

struct Owner : Codable {
    let login : String?
    let id : Int?
    let node_id : String?
    let avatar_url : String?
    let gravatar_id : String?
    let url : String?
    let html_url : String?
    let followers_url : String?
    let following_url : String?
    let gists_url : String?
    let starred_url : String?
    let subscriptions_url : String?
    let organizations_url : String?
    let repos_url : String?
    let events_url : String?
    let received_events_url : String?
    let type : String?
    let site_admin : Bool?
    
    enum CodingKeys: String, CodingKey {
        
        case login = "login"
        case id = "id"
        case node_id = "node_id"
        case avatar_url = "avatar_url"
        case gravatar_id = "gravatar_id"
        case url = "url"
        case html_url = "html_url"
        case followers_url = "followers_url"
        case following_url = "following_url"
        case gists_url = "gists_url"
        case starred_url = "starred_url"
        case subscriptions_url = "subscriptions_url"
        case organizations_url = "organizations_url"
        case repos_url = "repos_url"
        case events_url = "events_url"
        case received_events_url = "received_events_url"
        case type = "type"
        case site_admin = "site_admin"
    }
}

struct Repositories : Codable {
    let id : Int?
    let node_id : String?
    let name : String?
    let full_name : String?
    let privatee : Bool?
    let owner : Owner?
    let html_url : String?
    let description : String?
    let fork : Bool?
    let url : String?
    let forks_url : String?
    let keys_urls_url : String?
    let collaborators_url : String?
    let teams_url : String?
    let hooks_url : String?
    let issue_events_url : String?
    let events_url : String?
    let assignees_url : String?
    let branches_url : String?
    let tags_url : String?
    let blobs_url : String?
    let git_tags_url : String?
    let git_refs_url : String?
    let trees_url : String?
    let statuses_url : String?
    let languages_url : String?
    let stargazers_url : String?
    let contributors_url : String?
    let subscribers_url : String?
    let subscription_url : String?
    let commits_url : String?
    let git_commits_url : String?
    let comments_url : String?
    let issue_comment_url : String?
    let contents_url : String?
    let compare_url : String?
    let merges_url : String?
    let archive_url : String?
    let downloads_url : String?
    let issues_url : String?
    let pulls_url : String?
    let milestones_url : String?
    let notifications_url : String?
    let labels_url : String?
    let releases_url : String?
    let deployments_url : String?
    let created_at : String?
    let updated_at : String?
    let pushed_at : String?
    let git_url : String?
    let ssh_url : String?
    let clone_url : String?
    let svn_url : String?
    let homepage : String?
    let size : Int?
    let stargazers_count : Int?
    let watchers_count : Int?
    let language : String?
    let has_issues : Bool?
    let has_projects : Bool?
    let has_downloads : Bool?
    let has_wiki : Bool?
    let has_pages : Bool?
    let has_discussions : Bool?
    let forks_count : Int?
    let mirror_url : String?
    let archived : Bool?
    let disabled : Bool?
    let open_issues_count : Int?
    let license : License?
    let allow_forking : Bool?
    let is_template : Bool?
    let web_commit_signoff_required : Bool?
    let topics : [String]?
    let visibility : String?
    let forks : Int?
    let open_issues : Int?
    let watchers : Int?
    let default_branch : String?
    let score : Int?
   
    
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case node_id = "node_id"
        case name = "name"
        case full_name = "full_name"
        case privatee = "private"
        case owner = "owner"
        case html_url = "html_url"
        case description = "description"
        case fork = "fork"
        case url = "url"
        case forks_url = "forks_url"
        case keys_urls_url = "keys_url"
        case collaborators_url = "collaborators_url"
        case teams_url = "teams_url"
        case hooks_url = "hooks_url"
        case issue_events_url = "issue_events_url"
        case events_url = "events_url"
        case assignees_url = "assignees_url"
        case branches_url = "branches_url"
        case tags_url = "tags_url"
        case blobs_url = "blobs_url"
        case git_tags_url = "git_tags_url"
        case git_refs_url = "git_refs_url"
        case trees_url = "trees_url"
        case statuses_url = "statuses_url"
        case languages_url = "languages_url"
        case stargazers_url = "stargazers_url"
        case contributors_url = "contributors_url"
        case subscribers_url = "subscribers_url"
        case subscription_url = "subscription_url"
        case commits_url = "commits_url"
        case git_commits_url = "git_commits_url"
        case comments_url = "comments_url"
        case issue_comment_url = "issue_comment_url"
        case contents_url = "contents_url"
        case compare_url = "compare_url"
        case merges_url = "merges_url"
        case archive_url = "archive_url"
        case downloads_url = "downloads_url"
        case issues_url = "issues_url"
        case pulls_url = "pulls_url"
        case milestones_url = "milestones_url"
        case notifications_url = "notifications_url"
        case labels_url = "labels_url"
        case releases_url = "releases_url"
        case deployments_url = "deployments_url"
        case created_at = "created_at"
        case updated_at = "updated_at"
        case pushed_at = "pushed_at"
        case git_url = "git_url"
        case ssh_url = "ssh_url"
        case clone_url = "clone_url"
        case svn_url = "svn_url"
        case homepage = "homepage"
        case size = "size"
        case stargazers_count = "stargazers_count"
        case watchers_count = "watchers_count"
        case language = "language"
        case has_issues = "has_issues"
        case has_projects = "has_projects"
        case has_downloads = "has_downloads"
        case has_wiki = "has_wiki"
        case has_pages = "has_pages"
        case has_discussions = "has_discussions"
        case forks_count = "forks_count"
        case mirror_url = "mirror_url"
        case archived = "archived"
        case disabled = "disabled"
        case open_issues_count = "open_issues_count"
        case license = "license"
        case allow_forking = "allow_forking"
        case is_template = "is_template"
        case web_commit_signoff_required = "web_commit_signoff_required"
        case topics = "topics"
        case visibility = "visibility"
        case forks = "forks"
        case open_issues = "open_issues"
        case watchers = "watchers"
        case default_branch = "default_branch"
        case score = "score"

    }
}
