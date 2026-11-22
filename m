Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.215
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795315692;
	b=x0VpjsMEyaiTE+bAOybN7yvAkzREhPviFvXtelrx57ULb2d0mihDts3cyUUbJ3v3xn54
	 6RzJh3DoUinl6KspQVvqQOEWQAIHxolgAZO6jeuJukQEGV/vgkTRTEXMD3GhGPJ0zJ1id
	 5ujaT0q/CsJ7Ik1sgEyFBFHe13Exmwq55HeR0njool4VdkZt7LvI716g5f+N7SCZjuwtV
	 NJxSCadjTnVOihC3kacZwNZJOZT0baxeAywK7DqMEy/0FBZeu09s4Cf0fBTnGTbm4vueh
	 d/6gj5KnDULW9OcO87vAnnT8i9/TUMi3C7VkQqgy5sbH0OoaHJWTMnpW1drHhLWC5Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795315692;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kAE5NOdIS0At3Jh5k02AXwppwZhtnhWNnu4TdJThSWc=;
	b=XNkze3ipbeBXOCl1Gtrl8fJ9qC1InXbpaT98AYcEArvcw6SsAiOg9je/aVTf0L1ZHhAl
	 micsqNTieYSMOhBRHoDNUwf+jpppglyaf5dLvMjhJQJ88R+P/JF2qsIgSsKZN9nmA95wO
	 6Yq+9PyRZIEGmxkPj8WJD5H0sg/rCS9PNhf//SB3Pdw8Tbime63SZHi0Q/eNh7j8zAVou
	 ebAVgRj3YJVPc+rFCsuTEXU+Hxj1tqjNBXNlImC6/3BUVKiThtC7Fu+YiSMvjvciDF+AH
	 yL7H6rJl6/G7glpQ8ahzVZ6+pMincnoNlRHVPX4wtjO0IT+DwiVWAwKsROt9tjbXnzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IVKicsEJ;
	arc=none smtp.remote-ip=91.218.175.215
Received: from mta0.migadu.com (out-215.mta0.migadu.com [91.218.175.215])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A273E606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 02:48:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A273E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IVKicsEJ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rf+KgpXOB1eGgKM+XYvnpxenhFFTGz2oUtU9DXBh1Sk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795315689; v=1; x=1795920489;
 b=IVKicsEJXNAKfxno/Kp7uAN9lKaGVXM31V/OlAcTkNUiqcInsY9HcohqbaruKBNUi59YoWv6
 zIOyfH+lX2pgNiAwJAGNPhTPpqhisrnSDlyGT1D3S1ZquOINWJW5B00/nY10cB+fXoN0GrAuF50
 swEwHjvAR5ChboOv1dFubP9o=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0558d52f41647cbc;
	Sun, 22 Nov 2026 02:48:09 +0000
X-Mizu-Trace-ID: 0558d52f41647cbc
X-Migadu-Flow: FLOW_OUT
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Tejun Heo <tj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>,
	Michal Koutny <mkoutny@suse.com>,
	Christian Brauner <brauner@kernel.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Jan Kara <jack@suse.cz>,
	Matthew Wilcox <willy@infradead.org>,
	David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <nico.pache@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Kiryl Shutsemau <kas@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Meta kernel team <kernel-team@meta.com>,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 5/7] mm/khugepaged: handle memory.high overage in MADV_COLLAPSE
Date: Sat, 21 Nov 2026 18:47:35 -0800
Message-ID: <20261122024737.2741569-6-shakeel.butt@linux.dev>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261122024737.2741569-1-shakeel.butt@linux.dev>
References: <20261122024737.2741569-1-shakeel.butt@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MADV_COLLAPSE doesn't limit empty PTEs, so it can turn a PMD range with
one resident page into a 2MiB THP. Over a large sparse range, one
madvise() call can charge far more than the range used before. Today
the charge path throttles it for memory.high.

A later patch stops enforcing memory.high in the charge path, where
the task may hold locks other tasks need. Handle the overage right
after each collapse that dropped mmap_lock instead:
collapse_single_pmd() drops it to allocate and charge the THP. This
also covers the last PMD of each call, so madvise() over many small
VMAs, or a process_madvise() vector of small ranges, is throttled too.

process_madvise() on another process charges that process's cgroup.
If the caller is in that cgroup or below it, the caller handles the
overage here. Otherwise high_work reclaims it and no task is
throttled, as before.

Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
---
 mm/khugepaged.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 2dc4245814df..1ede7d30853d 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -3306,6 +3306,14 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
 
 		result = collapse_single_pmd(addr, vma, &mmap_unlocked, cc);
 
+		/*
+		 * collapse_single_pmd() drops mmap_lock to allocate and charge
+		 * a THP. Handle memory.high overage before taking it again,
+		 * including after the last PMD.
+		 */
+		if (mmap_unlocked)
+			mem_cgroup_over_high_throttle(GFP_KERNEL);
+
 		switch (result) {
 		case SCAN_SUCCEED:
 		case SCAN_PMD_MAPPED:
-- 
2.53.1-Meta

