// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EducationalResourceLibrary {
    struct Resource {
        uint id;
        string title;
        string description;
        string url;
        string category;
        address contributor;
    }

    Resource[] public resources;
    uint public nextId;

    event ResourceAdded(uint id, string title, string category, address contributor);

    function addResource(
        string memory title,
        string memory description,
        string memory url,
        string memory category
    ) public {
        resources.push(Resource({
            id: nextId,
            title: title,
            description: description,
            url: url,
            category: category,
            contributor: msg.sender
        }));
        emit ResourceAdded(nextId, title, category, msg.sender);
        nextId++;
    }

    function getResources() public view returns (Resource[] memory) {
        return resources;
    }

    function getResourceById(uint id) public view returns (Resource memory) {
        require(id < resources.length, "Resource does not exist.");
        return resources[id];
    }
}
