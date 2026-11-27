Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795757050;
	b=EtLgZw07ZapO+ub7LLWBnmdbehTZZCCWiwqDyBcd9LN1C+pqILR1mtqu9F5DZKmNzIQ7
	 NJ/YHgZxNpurTa9Ss+aQmuUhRc84w83ZIPlolhswO79GPcCIY6KunKoK2UrEQkU+NQh2X
	 sCsjDW/qJ7kEKM89Yh9VIkXGJIuCchflrmObJhs6LJ/Wns0sxaqqf5DCmFa0NNE2GgiM2
	 2VM1pAVaYJuWfMXaoxSIINO0O10+Q1L2lqPfPCQL9qkE8mNlX0Fist2aPm7mP4uKa9zBI
	 xc6qo7SqORuLl/QBUmbzEpyTiUox3MUtyLKwHkVXhPk8yyp0ToSYfLpV6aemKLW5vlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795757050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VunIWhlXjqQbEeGcoAeOGcWx/ibG4ikraJURdAYqSgo=;
	b=zHXVUrEuHYbXED3JJepJaHSQFzrL8HXZ8TMTXL5ErHzsrCsNADqfcUBAE+WPFNn7bWgK
	 WCO07kqjXqgJlkuQIOFyoGVZVBv4/F120y5VdTtTuyyOrnZudNcJSSXAl7S9oyQ0oGd5i
	 tZE5w3ZW3T6X5MS3esTRVjUxPXPZpshzTnVGgo2/bcsNCBtgVzd7GNQWvRaxiBPBAvvVn
	 MQu6OYe/TNEp+0XyXEx6QFL0HOR7SIJQQXZB9lOnYcaQCtnx3TiEvkDKyqmllIDOwNdDw
	 rr6a6F7F9HSebA8HB01LnZc6M3Q0rC6vI8a7QU0diUtYW+TckFZqX6twCcvRhBhyD2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OW7OZpHq;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1DA606A323
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:24:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC1DA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OW7OZpHq
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-170135e43c7so11963778c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795757049; x=1796361849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VunIWhlXjqQbEeGcoAeOGcWx/ibG4ikraJURdAYqSgo=;
        b=OW7OZpHq6pLeZ26SCI1axidR8ugMY3pm9kGLkjx/1OUX/nA+OpiM03FMnJfX5TYfwD
         2Da6+vtIkUGBdiNgN1dCSO22IbNK1AG0A8EygW5bQu8bcyPqiiHaKXHi0CdsIhKxtlRI
         ODG2AhVEjfkqcheF1QTm4cfU/DNzbrpM1mguWXPRsvSJUHy+03kYSBL8+XcVLJ2iXzoS
         6WxbED/OAT0JjWsu1FVHVP2GXo5jggSbW8dhoqhCdJYRkmXj0Y8WO9oUA0PwKXiSugyr
         JyOkBGnDoC8I64TWwFvRWlBMJL932qEvZgf6b/eHi2RRAZkKLMDKmxnuAyq1+/9ggQ58
         tt9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795757049; x=1796361849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VunIWhlXjqQbEeGcoAeOGcWx/ibG4ikraJURdAYqSgo=;
        b=LgdP/zkVLyoBXkICujE6V+JzDCJh28lbPvgTRiaaZSFEO5R3RDABHkBpsoL6Broo3R
         zNX6jKzj2Bv7njX8xnUdySuWdgRpnILZhZimUR9aJ+WeZtI8BBAWLNhkeLXvjPlEt9UN
         n5oQFBxOMlWPeBheDWhYlR8J5DlcCFamTSJBCbG3keM6ywynYxmV7Z0SDGMB7VwtT13k
         Dsdwn1BqBuwCfoLpfnFVawyZ/sJ54//ZktcirTKnVdTXTijb1WNRwAj62PiZqzY+XGpG
         THWeqcHHVsQIfbWFw2qCmkrFqbq6eOrrWS4+CtMmHJyuyNh8fTz0IQUUkNFx0rwSlYh2
         t3wA==
X-Forwarded-Encrypted: i=1; AL+hErGA2Eq9+czgzNGS/T+iqHr9VB+9EqgjfX2MEfhRRf5hrUSToEAjYWp2KfsZToYrLXt2a3t7RiC+hITklSI=@vger.kernel.org
X-Gm-Message-State: APuU4Z85tRX0zdQHzGCvrPTCyzNSiAMcRnB8M60wMXmoTvH/nmXptMXB
	tO3mYzWGDk4a00fHAlnb2hHCJpgP+gV5Jy7zPj0vnhN7fGwiBfdS0kNO
X-Gm-Gg: AZFdTZdH8b2xcaIxTw1r29ZUT+E9LBDFihWvNnCs/AS3ArAxW/ks+GAYigR4LNBjbHS
	byjFnOybOzMRlgWemAwBA8DkkM9Q+xavquSQRXNLrVGHZBA/b5WbTsi8LMeqauhEvbdHPy8ZyON
	Ym7H33sEi4lEvUZU23VUXAl3sHIAWTz7Hf491PWHYV9g9O4egjfDjhq/w4mpQpUv2/YgagqIe95
	UrvW01/odK6NYKjnNCgO8ljpg0p2UHWyHrmt0Y3LVMNd1oRwfzwhu6Q5IfPFuc91kPMfNw7wc7/
	Ck5zGwVQmvDnXOgqH3Xdj5G94nFqCz62R5VijG1mp/H9mKVpZ7K1bVPc/ym8p0CdcvfZF2+AwcA
	gkpDX+kpSC9A3gdZvHQCApLxffzJEj0PVtjfGSvD28hjwswBc2IX1WtwYqvyxV6uXj/hM9Nj9Cu
	rvENv9KHZv42+E6y4V3sgf0m/yaiL0f4+T47JNYaiRyaU+OVb5f2aF+DF32Ob95J679zf7jnZ4D
	DAPWF8FF4vf8TPBhGO5PnMZe2huHHY7U+h1yZvBwyxyCTVxnqismG1OvebwLfWepToRj960EBRA
	CAXhUHPA5Ue/qyXyhFJEfcjlX+So
X-Received: by 2002:a05:7023:a8b:b0:1b3:af3a:e784 with SMTP id a92af1059eb24-1b5568fe775mr26335922c88.32.1795757048934;
        Thu, 26 Nov 2026 21:24:08 -0800 (PST)
Received: from ubuntu.. ([2405:201:8026:213e:d3da:eb46:936a:228a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386d605c894sm14736480eec.2.2026.11.26.21.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 21:24:08 -0800 (PST)
From: mdshahid03@gmail.com
To: maddy@linux.ibm.com
Cc: mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	ritesh.list@gmail.com,
	sshegde@linux.ibm.com,
	kjain@linux.ibm.com,
	atrajeev@linux.ibm.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH v2] powerpc/perf: vpa-dtl: fix resource leak on allocation failure
Date: Fri, 27 Nov 2026 10:53:45 +0530
Message-ID: <20261127052345.23361-1-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Mohammad Shahid <mdshahid03@gmail.com>

vpa_dtl_event_init() allocates the DTL buffer while holding
dtl_global_lock. Move the allocation before acquiring the spinlock
to avoid performing memory allocation while holding a spinlock.

Since the buffer is allocated before acquiring dtl_access_lock
allocation failure can be returned directly without releasing the
semaphore.

Free the allocated buffer if acquiring dtl_access_lock fails.

Fixes: 4708fba19ade ("powerpc/vpa_dtl: Add interface to expose vpa dtl counters via perf")
Suggested-by: Athira Rajeev <atrajeev@linux.ibm.com>

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 arch/powerpc/perf/vpa-dtl.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/perf/vpa-dtl.c b/arch/powerpc/perf/vpa-dtl.c
index 20eafeaffa6b..57bc5773949f 100644
--- a/arch/powerpc/perf/vpa-dtl.c
+++ b/arch/powerpc/perf/vpa-dtl.c
@@ -338,7 +338,7 @@ static int vpa_dtl_mem_alloc(int cpu)
 	if (!dtl_cache)
 		return -ENOMEM;
 
-	buf = kmem_cache_alloc_node(dtl_cache, GFP_KERNEL | GFP_ATOMIC, cpu_to_node(cpu));
+	buf = kmem_cache_alloc_node(dtl_cache, GFP_KERNEL, cpu_to_node(cpu));
 	if (!buf) {
 		pr_warn("buffer allocation failed for cpu %d\n", cpu);
 		return -ENOMEM;
@@ -350,6 +350,7 @@ static int vpa_dtl_mem_alloc(int cpu)
 static int vpa_dtl_event_init(struct perf_event *event)
 {
 	struct hw_perf_event *hwc = &event->hw;
+	struct vpa_dtl *dtl = &per_cpu(vpa_dtl_cpu, event->cpu);
 
 	/* test the event attr type for PMU enumeration */
 	if (event->attr.type != event->pmu->type)
@@ -377,6 +378,10 @@ static int vpa_dtl_event_init(struct perf_event *event)
 		return -EINVAL;
 	}
 
+	/* Allocate before taking the global spinlock */
+	if (vpa_dtl_mem_alloc(event->cpu))
+		return -ENOMEM;
+
 	spin_lock(&dtl_global_lock);
 
 	/*
@@ -391,15 +396,11 @@ static int vpa_dtl_event_init(struct perf_event *event)
 	 */
 	if (dtl_global_refc == 0 && !down_write_trylock(&dtl_access_lock)) {
 		spin_unlock(&dtl_global_lock);
-		return -EBUSY;
-	}
+		/* Release the buffer allocated above */
+		kmem_cache_free(dtl_cache, dtl->buf);
+		dtl->buf = NULL;
 
-	/* Allocate dtl buffer memory */
-	if (vpa_dtl_mem_alloc(event->cpu)) {
-		if (dtl_global_refc == 0)
-			up_write(&dtl_access_lock);
-		spin_unlock(&dtl_global_lock);
-		return -ENOMEM;
+		return -EBUSY;
 	}
 
 	/*
-- 
2.43.0

