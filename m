Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441930;
	b=d7RLcgA4zcrxpiHkbpsH0Q6V0fF2ljTeWK1zXRbQbA8eIH2b+tNpRV8MyTWUeMOe4RMB
	 L1yPCMAV4e92lWzN2jvdlfUh44qDCi/TKrjKa4npVOHkxtd7jO7GXFVt0e12vFK1DtGgM
	 9JKMMoRx8JqR9IWMLFg5jHsBQEmW/1y/5uHWlIZxV3xHMr6CvUA4IL3D1A+Up1NWy13ic
	 ch3uW92zZJo5fQD4q1vBPgVwKZYcEqCd4N2wXNpolMHQVmS8FFj6Jk/Y7msIeW9xXNXN/
	 Tj7vNXAv6Qlu5xDyWbnIL2wL1T/6Yo/a0SseGKHdpvqNbiwKt8nCTuga3Cm6tcXWRHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EG/Oikx8PiqldF2Yo+sswkzJPWoRKLQTCOHC1uaRhQA=;
	b=lyHfKOGjAauGSWi9tmJ2ZTclm+sw/bSI+z/Q86gq8Zbc2WlzR0L3MlfWGrTcm3bblSPH
	 zgVO11k/c805QonWSVqmfHTgMw+V8ndlnpGoflh0UR/xLqWGBNRfTGit9LLXqyvsOv2NZ
	 b4baqOWUKDt+q4g3lYIYCpj0i0aYOdS2uEihTO8XZexIFUeFneK5l7r7HwSR8d7B4C6+n
	 XJbeQlY7+Qy9E3N4so9Gkkfr/PXanfcxukMzpfN6aYBF6Ml3pBqRHVUNTCKRtdTWxXI7m
	 OMViWm5Ncc600iiO5ZHOi0zCNWMZT3wE7mdhEaYuS3pHWiuwyhVxvm6rYrl4kQM1joA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=jLpeNRkT;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CF6606A696
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:52:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50CF6606A696
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=jLpeNRkT
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so25983135e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1795441929; x=1796046729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EG/Oikx8PiqldF2Yo+sswkzJPWoRKLQTCOHC1uaRhQA=;
        b=jLpeNRkT1LwniF5bH3yOxk7DtL8lOQmvku8nN0q7N0mifyQykHKamb6z105uRDnt5F
         Wef3GIuag9BKlJ7P6l8SL/f/UiY/iObB5XgelgfUlLjC7fvLI455U7snG4h5u6EF7cYe
         ONjx9rx2l0XXvV0IOZKrJViKXc9VVekxIq6UwEV/iedEtMjV7+Cl3ARnQq7pDvliku1f
         v2z22ilJR0SgO4FU/XLc2Fn324Rdd0di++9+hJBJNAtehv5qv2ww4zztMy3DYSxHGfKj
         aHhVidgVKwX3JslII7w27ZJ66sEnGJwYX60jEgupafJWIF/7h0epAKYRte+nAnzWB8Gx
         aByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441929; x=1796046729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EG/Oikx8PiqldF2Yo+sswkzJPWoRKLQTCOHC1uaRhQA=;
        b=PrIXqnTj/Lzpe/HuwWOdVZP+B0WhL9VyTClpa93ZXeokOOH5IwQpuuecuq0Ap8VV6y
         E4WbgXokJ/c0pz8+jmrf+UN9AqkTRZdXhuBeUd/5MQFiS4gx2kvd0bv06uaqHz2sQiRQ
         akMC8KsXAEyinete98aTHhLP7iPivcAsm4L+1j1ZRL14x2f1dKt6KqieP+lGJ538/JY4
         EsZLnPx5c7khcWRzRqoQqfDltlfAnbh/bk67wOQ1tALu5eonsKa5aihzbYbRL7cqiBPs
         S2+KRM1b1QX+xJKYvZE1e3RN1VN2E+Vgk0f38LtBYGoRr5PjiqnmR4ugvX5mFJlx31/r
         ljow==
X-Forwarded-Encrypted: i=1; AL+hErFxRJWiebcKAEXJAeF+8WmZyE7/FEAhjS4iUxdeuKgw8fERQTU1aqXKib78rIxUcM2j3xtxjwluKExgAbs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kT84nfhb4VcQV9ht97IrkSq8ioiyM1aaNr4RBxOfROdeh+d10
	qDvXQtzjIVgBRS0WGIv3VfwYBOcq+dxMaOg0bfWMW80Eymm2xmLO4L0hICgw+rZ1jhc=
X-Gm-Gg: AZFdTZeGBgqMwgCMQ1n57zAnrChWOtjuSfa25cplcXQ2e1eAiY8FRLNi2bVhqF/hZ5V
	sny0bqrDyFb5wUhAGLqcHl6P5mSuAPUST3tfCnNOJW/FKR1V6zl5Q3tOn0UG/zPL1blkzTR4csI
	gL4ZzSpMZhTLtJA9lrRfuW11XJB3ikwxui+I28z2XqIj/PMsgT68p+wibR/FhpjQWMjNnsM17Gd
	lvjUYwvDRa3YfikRWFhjZHnIK3ryfmYI0hDDdB4Qn12bEBWFpikmcT6vEVhTt7+WUXjEkE2gI11
	M7clcLHisc8WTzx8SHdZYB/SgnhlSj9kR/txKhLa76ylxMB8C4LS/z9930nCt25y4ATgMytDjIB
	DmFw0mppBqNfIxyBnUwBNLQaVxOAtQs4t3CimXxrTKC0pXKE14v0j9x52P1AOJZC/UHtQxROquX
	AH8h4haK77KeVWSNKO5+SThZHZtwJFkLNgSgtVrILDXT+wPEen+co2OUgTmXNBhoqgWTRUxO8K5
	Xx1ha/N69iIlGqCT3xtCA9AuUxVxMnNtQEpYuznLIfU7gdkqhHGEncE8qgiWKKk4W7zqRLUz6eN
	fL0n+ukRudHsVFkkjESs975/kgT8NeQchcGypHa4ctC2taxlCtqNnOujgSb5q31WvUQzueMa/Et
	zw6ufRMOXQsM6EpoCUSxc/CW6ni7E/cU=
X-Received: by 2002:a05:600c:4e87:b0:4a3:59c9:a758 with SMTP id 5b1f17b1804b1-4bb88922c81mr242428605e9.32.1795441928731;
        Mon, 23 Nov 2026 05:52:08 -0800 (PST)
Received: from raven.intern.cm-ag (p200300dc6f1b7800023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f1b:7800:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906817ccsm169279215e9.5.2026.11.23.05.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:52:08 -0800 (PST)
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
Subject: [PATCH v4 4/5] mm/mglru: avoid redundant rotations of young memcgs
Date: Mon, 23 Nov 2026 14:51:59 +0100
Message-ID: <20261123135200.4086519-5-max.kellermann@ionos.com>
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

Concurrent reclaimers can request promotion after another reclaimer
has already moved a memcg into the young generation.  Requeueing it
into a random bin again adds list mutations without advancing the
old-generation scan.

Therefore, skip `MEMCG_LRU_YOUNG` when the memcg is already in the
default segment of the current young generation.

In my micro benchmark, this increases the request rate by 36% and
reduces the average duration of each write request by 27%.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 mm/vmscan.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 91f31b65f9f6..b9715acf2f22 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4492,6 +4492,14 @@ static void lru_gen_rotate_memcg(struct lruvec *lruvec, int op)
 	else
 		VM_WARN_ON_ONCE(true);
 
+	if (op == MEMCG_LRU_YOUNG && old == new && lruvec->lrugen.seg == seg)
+		/*
+		 * This memcg is already in the young generation and
+		 * reshuffling it again cannot help the scan of the
+		 * old generation.
+		 */
+		goto unlock;
+
 	WRITE_ONCE(lruvec->lrugen.seg, seg);
 	WRITE_ONCE(lruvec->lrugen.gen, new);
 
@@ -4504,6 +4512,7 @@ static void lru_gen_rotate_memcg(struct lruvec *lruvec, int op)
 	if (!pgdat->memcg_lru.nr_memcgs[old] && old == get_memcg_gen(pgdat->memcg_lru.seq))
 		WRITE_ONCE(pgdat->memcg_lru.seq, pgdat->memcg_lru.seq + 1);
 
+unlock:
 	spin_unlock_irqrestore(&pgdat->memcg_lru.lock, flags);
 }
 
-- 
2.53.0

