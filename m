Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795087152;
	b=HecgSEXT9yDFVh/6S9GMds+N2l010seRxfRJQkJj5RvOBlvEhCIrFkrtyZ6qLwzIiEqx
	 CmasB5sQ53Ig0pPh8KqOA1RQU8aRjHiCQiGVZf4IkD01ROmn5Q/zNHF4CSEVGp3EbDSfj
	 WTzR76IALfyhzE70RUlo6zMjXsZ3IghQKLYn53l4JYmxK8ae12AOjpzPgWyu0MR8jwEHs
	 dEXQGLKLWwGA0VeZdKQ+8J8DwCrLcI7f2o5/7dVKhOjH3AqtnhTMwdIkOXBKBTezZyakK
	 QpNvIke1SYRzbe8SdO6P/x8Cb8H5Hfhwb5AXn5rrpq1KlcgixS9MuutuaTJhX5V82mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087152;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=QXCxhCIleutXBUxzuaglIQL7kD3eVOH4wn3LnKcIbkw=;
	b=VKFrjM7NM/qEgBrLWCrxHneZCLWw9/sqyAmFcHbClTxVAi8eqccI1lALEwIpRyZFiv7t
	 +e5eT5OPRI7OqMikxaBnUkQKoJamsHXc2panEEhoeXNKgink3f2SlPPuhAFnIuDgBlk14
	 U1wV/wOTh8jcCwBD9+hLD1KjwVkhhW1xlMFLXyMkobkIAhN6lZxypO5HHqoYgzzAVugva
	 4Lk6F6Ku3HY2sFdDuT0I02FwyOZv17wmca5cwnAd6LtdiT73vL8dGoSx4oB9A/DmhUnjj
	 DxntfDTn6q3RPnASi8UozyJjX2BjEfykc4WxVb0zebJcaj/gk6s/F6Nsb99PpvUTWkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eIo1i7Do;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685D0606A331
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eIo1i7Do
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 016E31F000C4;
	Thu, 19 Nov 2026 11:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795087152;
	bh=QXCxhCIleutXBUxzuaglIQL7kD3eVOH4wn3LnKcIbkw=;
	h=From:Date:Subject:To:Cc;
	b=eIo1i7Do1xvfth7udZfgi5PNF/F0gXToNXLydb8EZqiuUieD5ZLR78jQgm7G3Vm4R
	 XGvZ4RWtCNA4BZvFLNo1pDS78EggAbg/tU/pjk9YR1ddX62in5utB1Db/FpuP6jl/f
	 YYdKCCuSY/jDBSIjNkMmUN/SFvVNTMpSQ43+4FH+w1pvxeCw5FqslTLNbZsfhTOY94
	 GGirhlNA2wZW5Z/WvZ9P/0Te3s2oyewF8zdI/Tg6xjL5PC9FpLgdESe5ofunXQcGCC
	 +PFNQmiLVum29mqxFo3+h4yYWkmekn8sdNWKMCIOXkCxd6Bvr148s8f72/xGYhcGXh
	 bSpYIGFum1Q8g==
From: "David Hildenbrand (Arm)" <david@kernel.org>
Date: Thu, 19 Nov 2026 12:19:06 +0100
Subject: [PATCH] mm/mm_init: don't subtract managed CMA pages twice
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
Message-Id: <20261119-cma_managed-v1-1-385751505e24@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/yXMTQrCMBAG0KsM37oBJ7b+5CoiMk3HOkJjSWwRS
 u8u1uXbvAVFs2lBoAVZZyv2SgjEFSE+JPXqrEMg+J0/MPPZxUFugyTptXO+qVn0dNyzKCrCmPV
 un227XP8uU/vU+P4VWNcv2+wFvG8AAAA=
X-Change-ID: 20261119-cma_managed-2541ae8731ae
To: Mike Rapoport <rppt@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Oscar Salvador <osalvador@suse.de>, Muchun Song <muchun.song@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Chris Mason <mason@kernel.org>, 
 "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2012; i=david@kernel.org;
 h=from:subject:message-id; bh=6Ma9f4cQInBSteSr/WNtmNWvwrG6rrVXvnRyZnjUzyc=;
 b=owGbwMvMwCF2/OVpCdfQ3ZWMp9WSGLL+3dadeEyfO2bbM57gWsfwh75Tjj2WdHWsZN50gD36Q
 PdXpzeGHaUsDGIcDLJiiixBwfcNXr5cV1vtxscMM4eVCWQIAxenAEyk4iTDP8tUq8jtby5VFy+I
 f3DFvF+UX/LmhQmV0rrFumXblheu6GNkmNk8yeOS4IebLHW5XxTeFidLLH5Uuf9W5z89rSSz15y
 SfAA=
X-Developer-Key: i=david@kernel.org; a=openpgp;
 fpr=1BD9CAAD735C4C3A460DFCCA4DDE10F700FF835A

From: Chris Mason <mason@kernel.org>

With hugetlb_cma_only, the "reserved" value in the "Memory:" boot message
can be wrong (small or underflowed).

When mem_init_print_info() calculates the reserved memory, it assumes that
no CMA pages are managed yet. However, some CMA pages from hugetlb might
already be managed at that point, so we end up subtracting them twice.

Fix it by only subtracting CMA pages that are not managed yet.

This has very low urgency, as it only affects a boot message.

Fixes: b1b7c045e808 ("mm/hugetlb: initialize gigantic bootmem hugepage struct pages earlier")
Signed-off-by: Chris Mason <mason@kernel.org>
[ david: improve description and comment ]
Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
This should go through the memblock tree.
---
 mm/mm_init.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 27a50ecd5c20e..26033afa9bc05 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -2608,6 +2608,12 @@ static void __init mem_init_print_info(void)
 {
 	unsigned long physpages, codesize, datasize, rosize, bss_size;
 	unsigned long init_code_size, init_data_size;
+	unsigned long unmanaged_cma = totalcma_pages;
+	struct zone *zone;
+
+	/* Some CMA pages might already be managed. */
+	for_each_populated_zone(zone)
+		unmanaged_cma -= zone_cma_pages(zone);
 
 	physpages = get_num_physpages();
 	codesize = _etext - _stext;
@@ -2647,7 +2653,7 @@ static void __init mem_init_print_info(void)
 		K(nr_free_pages()), K(physpages),
 		codesize / SZ_1K, datasize / SZ_1K, rosize / SZ_1K,
 		(init_data_size + init_code_size) / SZ_1K, bss_size / SZ_1K,
-		K(physpages - totalram_pages() - totalcma_pages),
+		K(physpages - totalram_pages() - unmanaged_cma),
 		K(totalcma_pages)
 #ifdef	CONFIG_HIGHMEM
 		, K(totalhigh_pages())

---
base-commit: d9a27fa1050902a6e38bdb780b0277cbf1dfa5a5
change-id: 20261119-cma_managed-2541ae8731ae

Best regards,
--  
David Hildenbrand (Arm) <david@kernel.org>

