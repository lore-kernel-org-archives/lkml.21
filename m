Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441928;
	b=ANjEAOd+2Y3jNenC3PB8C9G3ySbcDF4S6zjyBr6ix1xaiBO+t3IZBuO+FOSy2iplmneu
	 +ZY/m8m8h4UsKw3AjNrW1fbFVwme8b3qcfvwS5Z9JpgZRLVvQV8bNS8ibv7C+V34L23jQ
	 P9y/HanfDptkIzqtYzWsDN5xc7Um8fIaZ99UuyVhYOpQPVOjgxleJoNVlH1brtVRuvxeH
	 YfRZBq43ikxHz8rmhvNXmuoas7y8eqHjMuidLwNIw6HizCBpy8OqQOBROHOdqFCkFFCab
	 AjHp1gSLEC2UaI82HJt34iNDug8da9vNHpmYVF06Al3EE+W4BZNLeYZHT7wsdXprLVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hN4yemycesflqKXqm8D59iST16TmA2LaImFy+AHGkgk=;
	b=juF2FuWRjLnE2JhOWbFHQE6FUQFCTxNGGGXFUnaLgLCLQ4xsYGYoFv/YODsHdiSjw+Sw
	 qpBwWi7SS01bjVuTNIZA4OpWLhq5xdaNtvf1jVUtVJkSKvwAGiGgo6CL0HlBcK8o4P7IA
	 +oPzs98hMgM5vRSvn5b5awTD0EqG9WLzjdYWV0HIeaPpAKLnBqjOlb0EMG+hki2bwAJaG
	 HVQS95BQ0U4ElWK0vbstRuuCLo3NltmCFBQgC2S3L/6B7QkYt9Onud/zg2oa2cyddix82
	 dFLNp/fNeMVYNeJeUOFj++Vi7UURP+aFWi6/iMVituipPWcrtbX9T2tNQCiQjDlMkqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=MsJZrLgr;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B46606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:52:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19B46606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=MsJZrLgr
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49d05d51553so23827825e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1795441926; x=1796046726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hN4yemycesflqKXqm8D59iST16TmA2LaImFy+AHGkgk=;
        b=MsJZrLgriwHBvCUgyx/HgJGaeMlf7GUlavPKqYfxDvpMwi5T4KdqIzXwTIkjN8luX4
         nPhNKfG7dGMCWtVwGpncivYKnt/64emIqSqMyIGpPxpGHGp5KqyC8uO32Vwyfk4+BAHO
         UXKN9yEeCggTFxDf7593gsu9s35kDeLm6g6JkaTyFEKKYRxkHGp88q5M/DdVy/R3mkil
         AiEmeUZOEss/TnEe3CtdobJF9Nm875lsGObmhuQj/Q5aMFHDtWbAd2+EoUCTpHlFYCie
         IVj/860Askd9FFi0wcg8DkBmnd4xLIvPqPwk45SV/Owyo0uzRepFR4TdGTtqD+2dgeVi
         gCiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441926; x=1796046726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hN4yemycesflqKXqm8D59iST16TmA2LaImFy+AHGkgk=;
        b=cMBsqEYwl4U6KPvJQJVR38FxRuzSS+5XOCkw2Qi6QuO9QQaaNMfe2tgK5obYBvr3Rm
         XeZprrT0Yl8eU5AFeMcljiR4CTwF1jSRf3Plrt8RuhkBd+Zewk/7gDtlUIj4UaROP5+o
         +9HJPsbFBF4oEkUEFvQBYH5hX+tmQHg2ItcRV2g5eZOvie2hJdmEAWUAnT9EeAhLGlBx
         LQKGt3Ljr27jHu/APx6PyauxpFWGHJQN3xxA3Img1LaBZ3DiMwJxxtS3ifa7sAnCBUb4
         COawm/87eRtCy1k1AGCoYF0Ly/6MERKRbp+6FEq3pj83G4ULPRLU1pkiCUDBtQR4Pa9y
         ehtg==
X-Forwarded-Encrypted: i=1; AL+hErFidAGSDzkPjNhU9rqvBsrz7ZmaLih4UEE4FsjYiggGMBm/KHo1lH0e4Sex62NTMDwrLyyHPRItr9cazLg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+14IOD3uuDeURDvOP8sdDVSbmRKX9YI+dc7zdqMzkCV7Kk6KX3
	qVnI5z6i4GVlpMF9de4dstBNVmiNNhOYTDOyoIwE8FVOGB5MrWysMKDHjViECJ/H/NY=
X-Gm-Gg: AZFdTZcEexDfaQgqCEBvqssRbWW/tXkhl+2WhkiChIK7fCxWJh699EVlToRt2P4hzqs
	PnwGNlXxYwLlzuf6NrtQguHQdDs/b4WpePhsKc8ImCzyelEb/Ts2dlr0yisElF7XJcctCLP3d5m
	5zxrJxf6yewttUEalZYXF7tKD8chBc/dtHSCh/AkTcHaHNYvHTcB5k91tKUUMulZ1FuBxn8Bu17
	MvzucwLZXwzFVgL0o0Kbhijs2pFc6aeAa5l2xJL36IhvVdfQkTFYXsyMmwDOQH8Ui1LReCE7RT0
	NrUj5QOX4EEfOhLHBYBBwoC9CjId8W1zn164TOPHBbbXLi98yGi0X/2b2jehSFKI1IIEdcE7SBC
	O7SV1kCa9rvxE3JtZ+3XGiUCXwIIXW/YJqv4A+QjrPzo+e5jojOq6EtnJS+gSgZsa2l1tJ5+B7r
	grHpTwJSvrtDcOHyTfgkF7d4YsRHCFXoJKrmDJxSDbzEtO0JcqoY8XBkZ/mTFn2CM1uHVNTBIpo
	bg80wUdFE/hwEfFfXLImtMrzkVT7Sb5iq5arSzghEL3QKT5gZrsRpm3qCW4yr4Gmiscj8MoW3xA
	I7BHl19iZYKsyVfVSaaokF6gyPt3kuPBkSiYG4g6PYHVRdj/sJpntwvzXFAlAurKFhbMyuLGYWV
	szACqeQ1O8AY1MpdxH2dPVmWCkVdwUeY=
X-Received: by 2002:a05:600c:3b9e:b0:4a1:cf60:dcc3 with SMTP id 5b1f17b1804b1-4bb88820687mr277263185e9.29.1795441926279;
        Mon, 23 Nov 2026 05:52:06 -0800 (PST)
Received: from raven.intern.cm-ag (p200300dc6f1b7800023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f1b:7800:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906817ccsm169279215e9.5.2026.11.23.05.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:52:06 -0800 (PST)
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
Subject: [PATCH v4 2/5] mm/vmscan: move code to lru_gen_{add,del}_memcg()
Date: Mon, 23 Nov 2026 14:51:57 +0100
Message-ID: <20261123135200.4086519-3-max.kellermann@ionos.com>
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

Preparation for the following patch that adds tail caching.

For simplicity, hlist_nulls_del_init_rcu() is now always used, which
is also valid during rotation, because the entry is immediately
reinserted under `memcg_lru.lock`.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 mm/vmscan.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index bc7579d47f9b..1d63647e3710 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4429,6 +4429,26 @@ enum {
 	MEMCG_LRU_YOUNG,
 };
 
+static void lru_gen_add_memcg(struct lru_gen_memcg *memcg_lru,
+			      struct lru_gen_folio *lrugen,
+			      int gen, int bin)
+{
+	struct hlist_nulls_head *head = &memcg_lru->fifo[gen][bin];
+
+	lockdep_assert_held(&memcg_lru->lock);
+
+	hlist_nulls_add_tail_rcu(&lrugen->list, head);
+}
+
+static void lru_gen_del_memcg(struct lru_gen_memcg *memcg_lru,
+			      struct lru_gen_folio *lrugen,
+			      int gen)
+{
+	lockdep_assert_held(&memcg_lru->lock);
+
+	hlist_nulls_del_init_rcu(&lrugen->list);
+}
+
 static void lru_gen_rotate_memcg(struct lruvec *lruvec, int op)
 {
 	int seg;
@@ -4455,8 +4475,8 @@ static void lru_gen_rotate_memcg(struct lruvec *lruvec, int op)
 	WRITE_ONCE(lruvec->lrugen.seg, seg);
 	WRITE_ONCE(lruvec->lrugen.gen, new);
 
-	hlist_nulls_del_rcu(&lruvec->lrugen.list);
-	hlist_nulls_add_tail_rcu(&lruvec->lrugen.list, &pgdat->memcg_lru.fifo[new][bin]);
+	lru_gen_del_memcg(&pgdat->memcg_lru, &lruvec->lrugen, old);
+	lru_gen_add_memcg(&pgdat->memcg_lru, &lruvec->lrugen, new, bin);
 
 	pgdat->memcg_lru.nr_memcgs[old]--;
 	pgdat->memcg_lru.nr_memcgs[new]++;
@@ -4487,7 +4507,7 @@ void lru_gen_online_memcg(struct mem_cgroup *memcg)
 
 		lruvec->lrugen.gen = gen;
 
-		hlist_nulls_add_tail_rcu(&lruvec->lrugen.list, &pgdat->memcg_lru.fifo[gen][bin]);
+		lru_gen_add_memcg(&pgdat->memcg_lru, &lruvec->lrugen, gen, bin);
 		pgdat->memcg_lru.nr_memcgs[gen]++;
 
 		spin_unlock_irq(&pgdat->memcg_lru.lock);
@@ -4510,7 +4530,7 @@ void lru_gen_release_memcg(struct mem_cgroup *memcg)
 
 		gen = lruvec->lrugen.gen;
 
-		hlist_nulls_del_init_rcu(&lruvec->lrugen.list);
+		lru_gen_del_memcg(&pgdat->memcg_lru, &lruvec->lrugen, gen);
 		pgdat->memcg_lru.nr_memcgs[gen]--;
 
 		if (!pgdat->memcg_lru.nr_memcgs[gen] && gen == get_memcg_gen(pgdat->memcg_lru.seq))
-- 
2.53.0

