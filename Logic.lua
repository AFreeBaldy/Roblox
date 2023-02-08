local Logic = {}

function Logic.GetDictionaryLength(dictionary)
	local count = 0
	for _ in pairs(dictionary) do
		count = count + 1
	end
	return count
end




-- A Universal function for Depth First Search
function Logic.FindRandomPathOnGrid(root, target, isValidPath, getNeighbors)
	local stack = {root}
	local visitedNodes = {}
	local paths = {}
	paths[root] = {root}

	while #stack > 0 do
		local current = stack[#stack]
		table.remove(stack, #stack)
		visitedNodes[current] = true	
		if current == target then return paths[current] end
		
		
		local neighbors = getNeighbors(current)
		while #neighbors > 0 do
			local index = math.random(1, #neighbors)
			local neighbor = neighbors[index]
			table.remove(neighbors, index)
			
			if visitedNodes[neighbor] == nil and isValidPath(neighbor) then
				table.insert(stack, neighbor)
				paths[neighbor] = table.clone(paths[current])
				table.insert(paths[neighbor], neighbor)
			end
		end
	end
	return nil
end

return Logic
