//
//  Median Two Sorted Arrays.swift
//  NeetCode
//
//  Created by Francisco on 6/6/26.
//

class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let B = nums1.count > nums2.count ? nums1 : nums2 // larger array
        let A = nums1.count > nums2.count ? nums2 : nums1 // smaller array
        let total = A.count + B.count
        let midCount = (total) / 2
        
        var left = 0
        var right = A.count
        while left <= right {
            let mid = (left + right) / 2
            let midB = midCount - mid
            
            let ALeft  = mid > 0 ? A[mid - 1] : Int.min
            let ARight = mid < A.count ? A[mid] : Int.max
            let BLeft  = midB > 0 ? B[midB - 1] : Int.min
            let BRight = midB < B.count ? B[midB] : Int.max
                                 
            if ALeft <= BRight && BLeft <= ARight {
                if total % 2 != 0 {
                    return Double(min(ARight, BRight))
                }
                return Double(min(ARight, BRight) + max(ALeft, BLeft)) / 2
            } else if ALeft > BRight {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return 0.0
    }
}

// Time: O(log(min(n, m)))
// Space: O(1)
