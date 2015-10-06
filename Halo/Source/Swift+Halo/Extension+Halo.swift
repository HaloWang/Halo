
import Foundation

public extension RangeReplaceableCollectionType {
	
//	mutating func insert(newElement: Self.Generator.Element, atIndex i: Self.Index)
	
	func halo_insert(newElement: Self.Generator.Element, atIndex i: Self.Index) -> Self {
		var newCollection = self
		newCollection.insert(newElement, atIndex: i)
		return newCollection
	}
	
	func halo_appendFirst(x: Self.Generator.Element?) -> Self {
		var newCollection = self
		if x != nil {
			newCollection.insert(x!, atIndex: self.startIndex)
		}
		return newCollection
	}
	
//	mutating func append(x: Self.Generator.Element)
	
	func halo_append(x: Self.Generator.Element?) -> Self {
		var newCollection = self
		if x != nil {
			newCollection.append(x!)
		}
		return self
	}
}

public extension CollectionType {
	
}