//
//  Response.swift
//  Mobillium-case
//
//  Created by yasinkbas on 22.07.2020.
//

import Foundation

protocol Response { }

struct ErrorResponse: Response {
    let title: String
    let content: String
}

struct SuccessResponse: Response {}
