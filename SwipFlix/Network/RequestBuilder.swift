//
//  RequestBuilder.swift
//  SwipFlix
//
//  Created by Nouraiz Taimour on 10/10/2024.
//

import Foundation

protocol RequestBuilder {
    func buildRequest(for endpoint: Endpoint) throws -> URLRequest
}
