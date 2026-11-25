Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.253
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606544;
	b=CgtowTgPrA+V7n9LMesOQIhXQlsFJ1y2HYKDJB/NAZwez8wKSje3NXZotWb+eo2cQq54
	 Z98UrhXqintI7pJHL/aR4jDuSfcRPgKhWbbQlXOP35RrLoLTsngiHFkCnvdWoH8vdFZLd
	 VbCCZGfaBCuWLGBwzW0CsDAzbYxp5HEeO52f9xZlMr8Ly1bl8zvLwZ/HRu1ZAjrdLWUm0
	 kGo+7N5Db1pg5yb7VelbUBqLa4pM4ji7WP+h6La21bS/2I3NZVRgulSQ0czK3RJyAMSDm
	 cxWKw9RzOXWO5OkKkmxCsiZqN1q96sFR7oy+2KziFTA+a8q6svMRZbgjK/sG0zFWvEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606544;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=IYZQR2NWRm2aqXIEbQebL6wCc5yHIbEePswxQJEyMnU=;
	b=0+lE50WnbNIobZNiFOuNFG/MeMowPe/G50zs4CNwMACCe1plQlFd0363MqSt0fg4I55C
	 /MVu9cMz7UcZVyDPYahlM2fLy3AGKBdq9TuxRPYK5l1VdhJYbaIxo3azy0IWcBM3lnj4D
	 IcXxUDcpnWU8NvZrhuHMAIrqrzt3hl8t8QN1KMTEwK1DEXqehIcjEzSYlwt0bJLKrrvy2
	 44A6P7QOB0PUrKfQO8udyKNvXIUjDwFt1ezBMu1Kn5heKb+mubftuU/+D+CHFpBcyZJ/8
	 4C/nNhkVWqXl147YgLR9jv60EIX4zSREgY8pIi6pp5pRDU/GVyYsbjzozJuBcGNMvSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LwAxmjWC;
	arc=none smtp.remote-ip=95.215.58.253
Received: from mta1.migadu.com (out-253.mta1.migadu.com [95.215.58.253])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FEC606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:35:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47FEC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LwAxmjWC
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=hyYSlPLEjHqHiuxc1EWVJHk/NKxvpHyxjjsLCf7xOrs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795606541; v=1; x=1796211341;
 b=LwAxmjWCu4z6VIUOybmhXd8R1IwJJJPysWeaGc4XNKu/zkAfAaLOFPDaQaWDusOsuf6EYUIu
 4f2PnxrMw1i59vJMLmKisq1uTiUuoSj9N9xKZ+8dXmKJ+zULN3ZVQ2K+Gwg7ovDvNzIUxJEyC0r
 C9xCMVaIG3CS3hqRo40atMiY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 236edbe9e403cc2d;
	Wed, 25 Nov 2026 11:35:32 +0000
X-Mizu-Trace-ID: 236edbe9e403cc2d
X-Migadu-Flow: FLOW_OUT
From: "Hui Zhu" <hui.zhu@linux.dev>
To: "Andrew Morton" <akpm@linux-foundation.org>,
	"Kairui Song" <kasong@tencent.com>,
	"Qi Zheng" <qi.zheng@linux.dev>,
	"Shakeel Butt" <shakeel.butt@linux.dev>,
	"Barry Song" <baohua@kernel.org>,
	"Axel Rasmussen" <axelrasmussen@google.com>,
	"Yuanchu Xie" <yuanchu@google.com>,
	"Wei Xu" <weixugc@google.com>,
	"Baoquan He" <baoquan.he@linux.dev>,
	"Baolin Wang" <baolin.wang@linux.alibaba.com>,
	"Johannes Weiner" <hannes@cmpxchg.org>,
	"David Hildenbrand" <david@kernel.org>,
	"Michal Hocko" <mhocko@kernel.org>,
	"Lorenzo Stoakes" <ljs@kernel.org>,
	"Harry Yoo" <harry@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: Hui Zhu <zhuhui@kylinos.cn>,
	stable@vger.kernel.org
Subject: [PATCH v3] mm: mglru: reset the mm iteration cursor in try_to_inc_max_seq_nowalk()
Date: Wed, 25 Nov 2026 19:35:18 +0800
Message-ID: <20261125113518.1207280-1-hui.zhu@linux.dev>
X-Mailer: git-send-email 2.53.0
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

From: Hui Zhu <zhuhui@kylinos.cn>

try_to_inc_max_seq_nowalk() advances mm_state->seq without walking the
mm_list, but unlike iterate_mm_list_nowalk() it leaves head and tail
alone. If it races with an ongoing page table walk, the cursor is left in
the middle of the fifo.

The next walker reads that as "this generation already started": it skips
reset_bloom_filter() and resumes after the cursor. The mm it visits are
the ones the aborted walk never reached, so they have no bits in the
filter being read and walk_pmd_range() descends into none of their PMDs.
Those mm miss a generation of accessed-bit harvesting, so their aging is
less accurate and hot folios can be under-promoted. Eviction can still
detect their references via rmap and lru_gen_look_around(), so this
weakens aging rather than guaranteeing reclaim and refault.

Reset head and tail with the seq increment, as iterate_mm_list_nowalk()
does. It is safe: get_next_mm() holds an mmgrab() reference and a
concurrent walker bails out at "walk->seq <= mm_state->seq" before
touching head again.

Only reachable from memcg_reparent_objcgs() -> max_lru_gen_memcg(); not a
memory safety issue, since lru_gen_del_mm() repoints head and tail under
mm_list->lock.

Fixes: f304652609ea ("mm: vmscan: prepare for reparenting MGLRU folios")
Cc: stable@vger.kernel.org
Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
Reviewed-by: Baoquan He <baoquan.he@linux.dev>
---
Changelog:
v3:
Reword the impact as weakened aging rather than guaranteed refault,
noting the rmap/lru_gen_look_around() fallback (Barry Song).
v2:
Drop the helper and keep the fix open-coded (Baoquan He).

 mm/vmscan.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 6a1af9b92349..3601e58f2a69 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4694,6 +4694,8 @@ static void try_to_inc_max_seq_nowalk(struct mem_cgroup *memcg,
 		spin_lock(&mm_list->lock);
 		VM_WARN_ON_ONCE(mm_state->seq + 1 < max_seq);
 		if (max_seq > mm_state->seq) {
+			mm_state->head = NULL;
+			mm_state->tail = NULL;
 			WRITE_ONCE(mm_state->seq, mm_state->seq + 1);
 			success = true;
 		}
-- 
2.53.0

