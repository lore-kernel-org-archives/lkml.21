Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441930;
	b=g8yQqLeLHI8ONF3GNToquGTiU+sMyTU5MP6iZaeUEJZqwdiuOJiOtI6sv0Y6giIHYZIK
	 NLCkUALCPxJKEWLZ9HQ8as9uHSROiNIJnx5Qa498Ti8YQn5sK81thkWt5nJKNqsTfWrQn
	 B0OWWiZJyPqYvB0JtCW6erwOsWeswsXI3GtY10g8/js/Zt26TPjBIdlwdYT+yqEiTu2k7
	 tc0K8bjaX+maHgqhDc9WwIj1rnc79MBH9eKPzU8SHcn71N/A0h4ANgtCqKV/gKPhviN+U
	 XOEJ8x2OWQubGu0zdbARGR7lyGfBeWD0mIoru8fqP3apt267jhK16IoD9bGjdQLEfqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YerUGZZjqZVHCBmjQM6BOEpwknjYpbKDzKBkgZmInLA=;
	b=vh0oHGGNX0wQtSAcdENJR3j9OvY75EGnXnw+w9dhwreMzAbPRJ4GA/rKaYogzukb7BtN
	 xOPdHcTlvQLW/RpavHSX91B387fT4rjx/8H4JH7R2dmJei2WPtOUQIA4R+JkWPmRd5Yau
	 WIXh19d+im5bnFm4dZPoPEa+UCxJm7AnVMZI1H4v8eBptg9KDCgJBtGvCvihbXb2Rk5Xu
	 wyHOTJU5oMZjDBUTgu4A2dyFi630vXwYDaAuHtT6dDZusr8lt2oaBSClmTMf20OiKwhPC
	 C+FmnrAYIeLgAjLg78CLO5xMoSQkc40Qq80AMHzneTgG/ryV/ntE61nBgyi3aYKNc6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=T81WJwhw;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DC1606A68B
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:52:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69DC1606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=T81WJwhw
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so42442005e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1795441928; x=1796046728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YerUGZZjqZVHCBmjQM6BOEpwknjYpbKDzKBkgZmInLA=;
        b=T81WJwhwDvlGjmYEnO3aa1uYNz/fV+gZH2xj3UIFHkaA7mMkGm1hY0HfG2cANLTyyp
         Xv8bQMoVeFPMdv1SQCQ5dd3Z2ecnT+K1e6DtUkUTtUGXpwJ6eZRxW1koMQWuZkZH/i8m
         wC01m2rHnxzYNNLIZy3BJ0jXnYwQ19SMkkJse6f0rfwagH+2Lmo+3sD9VSEI2+dU3BOJ
         8SHMoMpbONZEEIN3A22hGJ23+ULInVbliXpgA75+dIOe10vmzJ6P62T+tRUv5iTKmaH7
         0mhoxvgS1u9KFWQIVgzWFO1W5+H85Zs96Qu1qWg04Yi1xsMPpVMpyDkDuNp4xCIul1Y0
         THVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441928; x=1796046728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YerUGZZjqZVHCBmjQM6BOEpwknjYpbKDzKBkgZmInLA=;
        b=ZDzIvLsdOqhv9IkMSxqh5YYmsLoe7/EGS/BooUtrN/rwus9tBIaI2/5AZmRVCd0KMX
         gHsMxK4CepgTUd+FbKTELf44Qv07d7LsH6NBDI69/Kt6KvtrHNpRhXkRFPs7ZlyNppX6
         etmFh9t2rhxUr5Bgz3H01k6kS3AKiyJmAlyM+JHrq1fupZ1KdceDNyH9LXOfSUelUAHT
         9sDUmbPsv2vUO9tR6blmYAoiM20rK0qf6mFhd0ERtUEAL7DA0j7dSYOI6p5cF2fFwu1Y
         TR147ZH2aT+8jNwkmGmtvhyMILTH33ISq7BE1G3fODKmlpGjy7PGqbNZPza4L0IHPpQs
         BJKA==
X-Forwarded-Encrypted: i=1; AL+hErFd4oSRrj/LIEwa0My8WJlOBFNii03vBZ7685rU3w+7z1UfHC7MB1hnBESliECwG5GaHCA+wIhSxYNJOb0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Q9YrupZR3u+NWXy6pHe3kz0a1vltQnQrgPcK+nflRnrwz2tWu
	PsFWBsCd1E9feB7m7cq/Yx7HhK4ig/q9l6ctXJD0vxFz/tUYPTVifnaSNh3BXKam4SA=
X-Gm-Gg: AZFdTZdkccI2vd5dvwSMmQZG+da5fMCK3hQZnaU4XD8x0qqxD2hCvvwTEADkUCzqVzg
	utpHdpuLk25I8MmtKj/nnbKeXhl6MQKQUHdWZYTUAb2HHwrY2sUbsSHf7ebbcktjJne/IMLFcIQ
	2557WcuJFl5ucuTk/n/TLmwQJXaTYLrlAKrSCyHvs3KDHhAMv/JwjkA3QgC60zDdR6KuwVP1IuZ
	RpeKqfyrkRMTVl7JEZcUXgMK+YcPDOr3xS1PIZegHr5IRGvrTbe5pvkGAj7EjyCjZE+SfzoFhhe
	DmoVSX1fzlb2KhUeq/bsdDDEe6kqPjeah+SIJAhC4u5e8PdjJv+WaoXvBdp1S9pQhFbKzOmmse2
	q6BsC2knvktKDftWYO74F+sWVg69/gQSz9Rt0BCiCT+LwRPQYH88VX2+WMaRLLstKZPSoaJesMw
	+uWl+8oO2Pr7SrOL5GaRB84F9ibGEf6iwvz271kwfIdMFm2zY9v+OO5H810+jk2oubZxwZo6qi3
	FA/BBC6bzC92AWXxnRczjagJZQOcjULKdnherZm9o7A+R+0vS7kpsl4ne1nI5sMhmPSThgxbGZz
	tkmSueiSM0X6rNrYEs5yNVrHElQhJC2PSpdUqXaFlV3am0iwdMD3pD99KvggRseGu2OCOihyAeA
	dt4MdXXbkQMMK58jTnwBfk7e7JT2Pkz6R2j9bpMJ5qYhzu9c9MJc=
X-Received: by 2002:a05:600c:1d09:b0:4bb:66fd:ad68 with SMTP id 5b1f17b1804b1-4bb888160cdmr251315095e9.14.1795441927506;
        Mon, 23 Nov 2026 05:52:07 -0800 (PST)
Received: from raven.intern.cm-ag (p200300dc6f1b7800023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f1b:7800:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906817ccsm169279215e9.5.2026.11.23.05.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:52:07 -0800 (PST)
From: Max Kellermann <max.kellermann@ionos.com>
To: akpm@linux-foundation.org,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	hannes@cmpxchg.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH v4 3/5] mm/mglru: cache the last memcg node, make tail insertion constant time
Date: Mon, 23 Nov 2026 14:51:58 +0100
Message-ID: <20261123135200.4086519-4-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123135200.4086519-1-max.kellermann@ionos.com>
References: <20261123135200.4086519-1-max.kellermann@ionos.com>
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

Rotating or onlining a memcg currently uses hlist_nulls_add_tail_rcu()
which walks the destination bin to find its tail while holding
`memcg_lru.lock` with interrupts disabled.  With thousands of cgroups,
this takes a long time and causes severe lock contention.

Cache a pointer to each bin's last node, making tail insertion O(1).
This requires remembering the bin number (but the new struct field
occupies a hole, so it does not grow).

In a micro benchmark that creates 1500 cgroups and repeatedly writes
`1024M swappiness=0` to `memory.reclaim` in 8 threads, the request
rate increases by a factor of 9.5 and the average duration of each
write request is reduced by 89%.

All writes return EAGAIN in both runs; the benchmark measures the cost
of reclaim attempts that cannot meet their requested target, not
reclaimed throughput.

Fixes: e4dde56cd208 ("mm: multi-gen LRU: per-node lru_gen_folio lists")
Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
Reviewed-by: Barry Song <baohua@kernel.org>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 include/linux/mmzone.h |  4 ++++
 mm/vmscan.c            | 26 ++++++++++++++++++++++++--
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 6a2ad0cff795..b2ded8f97eaf 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -570,6 +570,8 @@ struct lru_gen_folio {
 	u8 gen;
 	/* the list segment this lru_gen_folio belongs to */
 	u8 seg;
+	/* the memcg bin, protected by memcg_lru.lock */
+	u8 bin;
 	/* per-node lru_gen_folio list for global reclaim */
 	struct hlist_nulls_node list;
 };
@@ -661,6 +663,8 @@ struct lru_gen_memcg {
 	unsigned long nr_memcgs[MEMCG_NR_GENS];
 	/* per-node lru_gen_folio list for global reclaim */
 	struct hlist_nulls_head	fifo[MEMCG_NR_GENS][MEMCG_NR_BINS];
+	/* last entry in each bin, or NULL if empty */
+	struct hlist_nulls_node *tail[MEMCG_NR_GENS][MEMCG_NR_BINS];
 	/* protects the above */
 	spinlock_t lock;
 };
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 1d63647e3710..91f31b65f9f6 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4434,18 +4434,38 @@ static void lru_gen_add_memcg(struct lru_gen_memcg *memcg_lru,
 			      int gen, int bin)
 {
 	struct hlist_nulls_head *head = &memcg_lru->fifo[gen][bin];
+	struct hlist_nulls_node *last = memcg_lru->tail[gen][bin];
 
 	lockdep_assert_held(&memcg_lru->lock);
 
-	hlist_nulls_add_tail_rcu(&lrugen->list, head);
+	VM_WARN_ON_ONCE((!last) != hlist_nulls_empty(head));
+
+	lrugen->bin = bin;
+
+	if (!last)
+		hlist_nulls_add_head_rcu(&lrugen->list, head);
+	else
+		hlist_nulls_add_behind_last_rcu(&lrugen->list, last);
+
+	memcg_lru->tail[gen][bin] = &lrugen->list;
 }
 
 static void lru_gen_del_memcg(struct lru_gen_memcg *memcg_lru,
 			      struct lru_gen_folio *lrugen,
 			      int gen)
 {
+	const int bin = lrugen->bin;
+	struct hlist_nulls_head *head = &memcg_lru->fifo[gen][bin];
+
 	lockdep_assert_held(&memcg_lru->lock);
 
+	/* pprev points to head->first for the only entry, otherwise prev->next. */
+	if (memcg_lru->tail[gen][bin] == &lrugen->list)
+		memcg_lru->tail[gen][bin] = lrugen->list.pprev == &head->first
+			? NULL
+			: container_of(lrugen->list.pprev, struct hlist_nulls_node, next);
+
+	/* Keep next intact for readers that still hold this entry. */
 	hlist_nulls_del_init_rcu(&lrugen->list);
 }
 
@@ -6106,8 +6126,10 @@ void lru_gen_init_pgdat(struct pglist_data *pgdat)
 	spin_lock_init(&pgdat->memcg_lru.lock);
 
 	for (i = 0; i < MEMCG_NR_GENS; i++) {
-		for (j = 0; j < MEMCG_NR_BINS; j++)
+		for (j = 0; j < MEMCG_NR_BINS; j++) {
 			INIT_HLIST_NULLS_HEAD(&pgdat->memcg_lru.fifo[i][j], i);
+			pgdat->memcg_lru.tail[i][j] = NULL;
+		}
 	}
 }
 
-- 
2.53.0

