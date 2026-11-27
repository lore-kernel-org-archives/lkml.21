Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795782437;
	b=uBrIwiKdvKd4ePgs/rVoZ5/uzPoioYsMaU1I0ATXP+EbvJD/VzmJ2MjvtxcTgYoHfbgf
	 z5w2NeKAkI14i1u1pmHp+xea+JPQMhsm0wQY/eM2DfYYc4Zd62I9sblK76SersdkwF1HG
	 bVgQTjx6biUG4ZRehATU1cyOZEdPHcFp8NSyIHH14YdJYGFy+jZ/r+kPvhW96SdfPgDJE
	 s68DRaOTsdBrlOc4yIsra69yg+7zOjFMZ7RVIpK57moud/pFQySNAoQa1ro2lx6LW0oOW
	 9uqCeOOrMz4XP1AWyuj14kw03aFdZSPrCcj6tLCGItvUGIn11sTQD5jAoPB+zIJrfTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795782437;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=xP3AX9z/qSFgWuu0g11r9oN9g4Vo2+Ez77ENP8nsuB4=;
	b=IgdMO+nKj//N20EVsPTFfYNRfiwX55hhLm26jYVS6hsszxAzZR8PvxlVk0INhabfS7mZ
	 MSLjKXvTWsA7KfhUoSc+s2ckZKfsZYC371RZzuXvLasFH+NoABPhYHsZZGXMR50TPoHpZ
	 i8RfgZRmJ8X39HwRJZhfS47kvIF180bkFVXV/7MZcdgBhr9ylcEXKpvL1lVi3WaNrF2Vw
	 poUnMPv94AS4H3L45Y1RWBKBIQ1IoZk4fkBSusgqEkUUbzVL91lqdQovpk7nro7QqWqmj
	 kGMTT9H3McoKvzlCRmpp4+8UD6slV4v5GyTAtUwYVpWw3o8jJLKqPDIeSOOpD3DZ4Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="POOL/TkY";
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE1C606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:27:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FE1C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=POOL/TkY
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cded48a6a1fso21577a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795782437; x=1796387237; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xP3AX9z/qSFgWuu0g11r9oN9g4Vo2+Ez77ENP8nsuB4=;
        b=POOL/TkYXPTwBamyAtrCjCoPApN+MFPHjjvaPvvzYJIRsucphDC1TVl4Dc8z0AiJDB
         s1HD1r9tl3lVSu6u33JcFISj+cTfdY81wbMdkjqmhu0twOq3q3LDFq6WkTS4cX/Hiu4h
         aQsys154JURXjOfu1zaUeIpVYt3UIGUqVq3h8JWcPN+EshasOyHX6s69lAUPkmYveOFM
         p3ZNdQ4VIi1EQv2fkvCA83GJL8oDL5ld1d/M3z6gNzF/RySg/pGOnUTN5+Tr5JF2lpgp
         EtgLfJcgmUk7SDRSD98dMITMDlIVoeIlZywz9/EdAWJbTPZjQ+C4+jOZLeLIDkFzDgX0
         GfrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795782437; x=1796387237;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xP3AX9z/qSFgWuu0g11r9oN9g4Vo2+Ez77ENP8nsuB4=;
        b=I/2UmiK1VOX+156Y5OKVSsWTsBfWYmlR1zSHAvtGfDe5w4YrZ+uHij5nB4mzBDqbRb
         4ZO+JHa3CknRFKiV/Ff0OLyc1anUgxIMKBIAj3+gmtrcF8ZiW5qOWhIYXwrO8YF2m9be
         Ugh1TkKMHK44Xhdk21awwRpHVXOEm8Fy07cESbZx0shqoo9KTWr4ProBHl0kRaTqSw59
         UCR0Aenht3yoRECdjKThEstYglvEgmsoZ0osxiychQBu5I4l7WfAfJgTkBZvYcEoxyO/
         XNVIWiI1JI4qm38t/j4Os6vi1jxDSOIT2sX0M+Ft505/GMXL0f/+69YMw2ISL7nKwG7t
         8Wzw==
X-Forwarded-Encrypted: i=1; AL+hErFnOmjZAKrGkz06yP+zEbQxb4YFB8TsJ0MWsU4fd2DFyB5yj3ETvc2aCgBZ7rqk0+5DBg7EIR+Wxv2K5vY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FJBYZjdtwJ3sEwXV2AY+sbLqx2L2FrCpPcq6J6wXdHf5djHDr
	W9Q+QhNbascpd5VbyVXcbnZjAKpx7f2tSAVQ25aKuUFRp27hwVjXKgPn9BQ6ofUNKuR3VlV3
X-Gm-Gg: AZFdTZdregfimuf7RXhtoitCJtJV9nN0gVAteazdJ7EACrcgpZxiINVHqoSOQgXUz+F
	109hKJnbhmm8Qbm7ZRxPh3TSt7lks8j1xvpV/xpB5mO++Y4tEL0qy64OWRTxc4eF3aw1ZM5FpJ/
	dkArlwM+NFXLsbV2GPY9qLp5KyUrs0UwbeYLZv80oNBBUE5svbc8dH8peI4/DUC8hBcS43oP0x1
	/UqmqvsvFReICoLmXNSpfCQptf7Ug3A7Pv2ccAo/AgdblXln7C+jS/L/tXx5nzYNJEVXbwMFUrQ
	MxNmTCaUMJaLDNOIwwX8vXZRY5+bPXwZcyYpf/R9Qp3RptwpQPWwUAp2VOICxZKMS7MZmrQvZWI
	gZeSyGR/zFElhecUBq64lL1tT4+8l4HvMMIB1JF3tszFLPn596gMNAU3FA524RpZO64wmlmNvJc
	ZzY8Oa5yNL6cz+OdxyVZmDcPzwfsIBtQyfC+Gx6YbojCXMwTpJ6q5TyEj/naBJIfEev+TNj6HmA
	FSZCX9VMP5CkhzNYhHp76ER3qY37dzPs6bFNPdXtqQDGwbSmsUm2qjODNG1MUM1AUtQyY/kMNl6
	8VsJ4quKpirpnEaX8v4UJyfIHgFCm7iMr2wIiWNt80l2VbElmQ8/uhskfYcPITATTWY=
X-Received: by 2002:aa7:9e43:0:b0:8a0:92ec:5f1c with SMTP id d2e1a72fcca58-8c87654841bmr25686023b3a.0.1795782436179;
        Fri, 27 Nov 2026 04:27:16 -0800 (PST)
Received: from o6.lan ([2602:fce1:44f:115e::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87334890csm12600941b3a.33.2026.11.27.04.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:27:15 -0800 (PST)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
Date: Fri, 27 Nov 2026 20:27:02 +0800
Subject: [PATCH] mm/vmpressure: exclude costly-order reclaim from socket
 pressure accounting
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
Message-Id: <20261127-socket_pressure-v1-1-1d3a60c1dbb7@gmail.com>
X-B4-Tracking: v=1; b=H4sIABV3CWsC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyNz3eL85OzUkviCotTi4tKiVF0jS+Mki5TU5DQD0xQloC6gRFpmBdj
 E6FgIv7g0KSs1uQRkjFJtLQC60CNacwAAAA==
X-Change-ID: 20261127-socket_pressure-293b8decf05d
To: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Andrew Morton <akpm@linux-foundation.org>, 
 Barry Song <baohua@kernel.org>, "JP Kobryn (Meta)" <jp.kobryn@linux.dev>, 
 Johannes Weiner <hannes@cmpxchg.org>, Jakub Kicinski <kuba@kernel.org>, 
 Rik van Riel <riel@surriel.com>
Cc: Shakeel Butt <shakeel.butt@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Xueyuan Chen <xueyuan.chen21@gmail.com>
X-Mailer: b4 0.16.0

vmpressure() accumulates reclaim statistics but only checks the order
of the last sample when closing a window. As a result, costly-order
reclaim can still trigger socket pressure indirectly or discard
accumulated low-order reclaim statistics.

Skip costly-order reclaim before updating the counters.

Fixes: f2a950170f7a ("mm/vmpressure: skip socket pressure for costly order reclaim")
Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 mm/vmpressure.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/mm/vmpressure.c b/mm/vmpressure.c
index 3de99fef3928..9828a67206ef 100644
--- a/mm/vmpressure.c
+++ b/mm/vmpressure.c
@@ -156,6 +156,14 @@ void vmpressure(gfp_t gfp, int order, struct mem_cgroup *memcg, bool tree,
 		if (!memcg || mem_cgroup_is_root(memcg))
 			return;
 
+		/*
+		 * Costly-order reclaim relies on compaction, so its efficiency
+		 * is a poor signal for socket pressure. Exclude these samples
+		 * before they can affect the window.
+		 */
+		if (order > PAGE_ALLOC_COSTLY_ORDER)
+			return;
+
 		spin_lock(&vmpr->sr_lock);
 		scanned = vmpr->scanned += scanned;
 		reclaimed = vmpr->reclaimed += reclaimed;
@@ -168,15 +176,7 @@ void vmpressure(gfp_t gfp, int order, struct mem_cgroup *memcg, bool tree,
 
 		level = vmpressure_calc_level(scanned, reclaimed);
 
-		/*
-		 * Once we go above COSTLY_ORDER, reclaim relies heavily on
-		 * compaction to make progress. Reclaim efficiency was never a
-		 * great proxy for pressure to begin with, but it's outright
-		 * misleading with these high orders. Don't throttle sockets
-		 * because somebody is attempting something crazy like an order-7
-		 * and predictably struggling.
-		 */
-		if (level > VMPRESSURE_LOW && order <= PAGE_ALLOC_COSTLY_ORDER) {
+		if (level > VMPRESSURE_LOW) {
 			/*
 			 * Let the socket buffer allocator know that
 			 * we are having trouble reclaiming LRU pages.

---
base-commit: b95f8bb86713c860ce8536d22a988b949b884d5f

--  
Best regards,
Xueyuan

