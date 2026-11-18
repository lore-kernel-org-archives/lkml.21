Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996187;
	b=Xe0NORTMxRvpdHxfJ/YhhBlwPLxCNY99iZgnweWd0Rf8IL9F2RRtQ2ffaCOnrnXFSY0h
	 DzSVCHD2M2K/N2twQyv9cyh7tdj1ZMN6uJMTohdlb5fvs8AF8NHRuPEQF8cbEvHVN178F
	 geQz278gWeZNcSsUD5yGQHar43SNOXwjLtTZwx3x8d3G/0kjJ9N9bL2wCg3hNqPwK58/y
	 P1I69Gmm0rJ/Jd9yC3PnWdvDboovmLnfQs2d7x3RVz+Dde06g75skgJH9SP3z+6u1YkIJ
	 42Atbl0besYNIQ9cfOA4qSX84JtiRKp7WCihL2u8Qz+/HmExut95Jwwl1iE9GcEsKVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996187;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Z0El5ud21hvo9zkOQkpb06wEE6/0ipRpI83CeEG4nzE=;
	b=K4iS2MItuDdjQuHKryLgri9GrVLF9X5nV6ldR1WbZ7Dn6goy/yqRnWnU3FBkH/BBWkh4
	 E6Ts3oHcRwsCFxwb16EIFkENiNsowXtrkYpRWRfoL79BPH7mYyQy0jTtTCdT+RcDNEwlT
	 121rJYEriJUKLDrGR6OePm0SqU9nNrAXHrOVviW6ow7uMcayuNERbBkCBwqk9U8MWcYUv
	 8AVrYfwjSbMI50XUk7gV1d2/UjST46mVrYzDApQqnRhuC/hga5rd+0TcZ1fpuE5n5b95X
	 iyFi72Ds5kolCD+3BrqvrMUn0mrJ77rw3zNfEG7pHLSlRjQGUHzs1TERvLmQIv+lzyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AarKLyam;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CA5606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AarKLyam
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E3631F000C4;
	Wed, 18 Nov 2026 10:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794996186;
	bh=Z0El5ud21hvo9zkOQkpb06wEE6/0ipRpI83CeEG4nzE=;
	h=From:Date:Subject:To:Cc;
	b=AarKLyamz6h/SnGWiV/CtG5grW3wHr33Xq8qhuemIbmwM3uNzUUzdkxUiiwOIQqsq
	 LklnrdydfIr+01eZOkMXVUDBFxMOfLBEyhpdBacHcdVy3TX3jNGmCO/Ah7rdoM6K5t
	 lFygxMM0JrJWVzXvkDoKsQ9z4SWmrhtDUhI+JCznZD1yuWHR5LwF/EKxMDE5/Lm++k
	 +luS4FZeqk9DkWGVf8JTzR0Fv188xVcr3RfbWH1fAUMjtYFOdgfCo58KvvOsU5TAYG
	 6hOK74Wxv0WjBUujadXoj6fhVGQh9128hpwjKafVukssWaPWP4EBwY0clZwx1butO9
	 Uk5if/PsqyaCQ==
From: "David Hildenbrand (Arm)" <david@kernel.org>
Date: Wed, 18 Nov 2026 11:03:00 +0100
Subject: [PATCH] mm/userfaultfd: reject DAX mappings
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-dax_uffd-v1-1-d776cca1ae17@kernel.org>
X-B4-Tracking: v=1; b=H4sIANN3/WoC/yXMQQqAIBCF4avErBMcFyZdJSJKx5oWFVohRHfPa
 vnB/94FkQJThLq4INDJkdclA8sC7NQvIwl22aCk0ohohOtTd3jvhPSDstqhlaaCnG+BPKfvqml
 /x2OYye7vHu77ATZX1sxsAAAA
X-Change-ID: 20261118-dax_uffd-0fb2c6d1c087
To: Andrew Morton <akpm@linux-foundation.org>, 
 Mike Rapoport <rppt@kernel.org>, Peter Xu <peterx@redhat.com>, 
 Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Chris Mason <mason@kernel.org>, Jingyi Sun <1045704958@qq.com>, 
 "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1948; i=david@kernel.org;
 h=from:subject:message-id; bh=L99WB27VpnqQcZGVfFWLDDBDfUeAgBjYMyJA4p7jg7M=;
 b=owGbwMvMwCF2/OVpCdfQ3ZWMp9WSGLL+ll/7bbC447R6+s+7cn12UyVdvQq+zXkZk+fCJ/c48
 VRtC8v/jlIWBjEOBlkxRZag4PsGL1+uq61242OGmcPKBDKEgYtTACay2JqR4aJ9BcOWxXPP782b
 pj9N7mqg//VTBvkz3h0XuG5z+YZWfwjDP1PPDcfPK+nbFjdUOxouuXmiXMhiosXtPDFL0arE/aG
 aXAA=
X-Developer-Key: i=david@kernel.org; a=openpgp;
 fpr=1BD9CAAD735C4C3A460DFCCA4DDE10F700FF835A

UFFD_FEATURE_WP_ASYNC made DAX mappings eligible for userfaultfd
write-protection, but the DAX fault paths have never fully supported it.

DAX faults use vmf_insert_mixed() and vmf_insert_mixed_mkwrite(), which
treats any non-empty PTE, including uffd-wp markers, as an existing mapping.
A read fault on an uffd-wp marker therefore returns VM_FAULT_NOPAGE without
replacing the marker, causing the fault to repeat indefinitely.

PAGEMAP_SCAN can also write-protect a DAX PMD, but the huge DAX write-fault
path can make it writable without clearing its uffd-wp bit, breaking async
write tracking.

Device DAX mappings requiring huge-page alignment and cannot serve PTE
faults after UFFDIO_WRITEPROTECT has split their huge mappings.

So let's just disallow DAX mappings in vma_can_userfault() entirely,
making UFFDIO_REGISTER fail with EINVAL.

Fixes: d61ea1cb0095 ("userfaultfd: UFFD_FEATURE_WP_ASYNC")
Reported-by: Chris Mason <mason@kernel.org>
Reported-by: Jingyi Sun <1045704958@qq.com>
Closes: https://lore.kernel.org/all/tencent_1874C71D4177A1624528043E008DB1A5EF05@qq.com
Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 mm/userfaultfd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index 169f681f9849b..6656233d5dcc7 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -2131,6 +2131,9 @@ static bool vma_can_userfault(struct vm_area_struct *vma, vm_flags_t vm_flags,
 	/* Only mm-backed memory can have its faults handled by userspace. */
 	if (!vma_is_mm_backed(vma))
 		return false;
+	/* DAX fault handlers do not support uffd-wp. */
+	if (vma_is_dax(vma))
+		return false;
 	/* Core mm may discard droppable memory at any time. */
 	if (vma_test_single_mask(vma, VMA_DROPPABLE))
 		return false;

---

base-commit: fa4ad798f6f681031775266044ba1b0cf3c670bd

change-id: 20261118-dax_uffd-0fb2c6d1c087

--

Cheers,

David

