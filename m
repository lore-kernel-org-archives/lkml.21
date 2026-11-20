Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795163839;
	b=ue8DNX4vwHIpBv/YRBmkM2DL11YJHeQAHAwaaCWv0hDzUH6dUwXHowiAzCZburHiY+n4
	 QSYwN9JlI6E/kPu8IOA0/1c/T/yC7UUr0hFwMcujem7HQWLvsIzl/2/abEhCg40dDfav4
	 EdVlv824m9iLI32EsvhRzcRJmW2bsYOrh3dQw600vZrR1X4ivWz7DIjaunj2IhMvge5zJ
	 hcBu0iE3UutPUASKwK3q/+JgVOlfcb+/+CWEmcBVANgRyazRVIX0BwGOVCQ5rercd6tgS
	 H/RAm4fqlLI/vwE4cA9KnCdXM5pJl2yl22nLGkRmdBJWOzahHIRA39ocaJWR8TQ1qnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163839;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g/fHu7Nley/JjRttReoBdOyGfNrnA+dp2NZ1oWj3jhM=;
	b=un1CWeg+t88BDcWwAS2P5eNym78o5OKif2OFC0o1Oxgw3SSdHYqEtbF+8op95rCcyVNb
	 XyIua8KylkYIvyphWLhQfal8qUUPXK21WlaxyohmXjoSFd59xBsQfL7K7znpLlyXQlN2r
	 nKxozzK552PVpH1PpRbOIolP6Rn5wHcuzqbNZfWes5xC8K902AqBkCxbml8NsIMMUTkB3
	 NuxeRro/hMHCeGEIOB1HpnftBuBooDgjz8f4W6sL2ZuTaS0/uwD+EXWa8ldJHKJxmaWdX
	 9ITyThkQAqwtDKfhC/jKyv/HuVbkySov+qjv//GlXLPb+P7IFBAYhecKiUbackxeDJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MMBzzU1p;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EC5606A333
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61EC5606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MMBzzU1p
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2f01f296937so5131545ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795163838; x=1795768638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g/fHu7Nley/JjRttReoBdOyGfNrnA+dp2NZ1oWj3jhM=;
        b=MMBzzU1ptyoyq6zsyOP6nVX94qw1w/E3iaH/MXmFwXbKgU4DESzfqOE33mcwIozVCP
         NRnyKlCO9LcGbZgX7stkIeWUYqon8Dau79yCnyAP/48sRENzWzOPKr9wCyPeuGKQfhi9
         1DADM+f4IucDs2bcWE9Jmjk6h63zVQhhie1xKUOl2UNoy66ePEtmnxr0nSQqqg6rRo10
         tTTW7QLefJHfjAkfjNRM2yS1jgMZa7x58lOBWfvOSzQI5mOYV/szpqw1GC2jMgfYOi5V
         89Qq9Ml97mudCkqmuTNgo0KJ1a6NyIQbQyQJxUB6HvKUfXVu1VVlJzG31zsPpDOUxuHx
         PynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795163838; x=1795768638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g/fHu7Nley/JjRttReoBdOyGfNrnA+dp2NZ1oWj3jhM=;
        b=oKLXvrLRYvWz38fwAilTMe4I/dLMdF4P6wfvDabEX7LSJnqQV1TM3ypHdu4OgCnrcX
         xJ0s+jZpcPLkapYt/yhny4JGKrKcknVaVMhugoAjSZj+BkwhepiNEtyLvTquu7O7WbQ5
         W9qZC9b0pHtkdZ3UKMWfPoZJMvXviOppEIf1m0qmvh5D18TDG+8QconPlx1U01IiM27/
         4k2jPKdIWCF61Tjt308yFjSPxkmIBoELRFerl+CgAQiapXElsfJyvB/60QDk7BYZuwkc
         GGLMiTtduD/WrnkH+LC8CZE7nyWqBOqUlOM1vmm7LtBaJrYlYyJ6ixwo7w25mTJ2+A/u
         /PhQ==
X-Forwarded-Encrypted: i=1; AL+hErEuBJIS3IRESAj+KtTWMsXYW/JPx3wvGuIy74xKjxhxvDkQktJ1a/eGqCKLQ763F6eecLwK+k7efllD/xI=@vger.kernel.org
X-Gm-Message-State: APuU4Z99DwG81o/mgLyCuHfy1ZbSB+yjggEvr+WAHER3u5nfp7VfVPyn
	Lfl6ABnzuf9q6Gqv2LN8IHalVlLNDjz6AFk11cCc51TUSOLqpVHH48dl
X-Gm-Gg: AZFdTZf4qU/YS6l5VWOGLksZxGrn+F0Jf/lOhvgh6LvKuzH4m/8xwgbSOpHGYtmKGru
	AEgH0J1E5JzE4RDS9ILxVz+cKdKM3w9/mjhys3VO3jKzoeOmijpDRklOqhMsjg5QztV78FL+feC
	Qn5rEQho/RTbbBRjYymiF7r1t2dBcfyT0C69/Ll5iY107qlG6XcS77l1w4xTjmaF1iQ93l1YmUy
	4hRHzyi/WEP2rszyTJcz+Jv2RnuA+gsPn4OxDVxNRy8dxUpa2Y6v1E7A11fFwf3l4xwUW5jRbs6
	42EXReD9bjqGWVpDkkWCsK+vr4M+df3LZygEg3tXBP1Jx85BB0iTfp80+b2PfPiPrZXMcK2tuQy
	RQq6ScXYS+u0uoMbZAuLfR6E143kCQuEHDHaD/9NFHm0C5hJLjnHK+FJ1lgRW4HlEtXeKOK/V18
	/izbNVZkNx1y2WQ3cnuYWRCSQgnYj37x7VKuxAyyKHzJFGUXNEJvdi4nA3HudF727MkHi3LqQJs
	f2cwyZNzIF0NSHR3Fbd4+Y6cMsmXCj1rrBTOGbmX2jz8DYTZoLr/TWz96DXs5PgB2WYwgAoCBT4
	vaRjNhfBFBQXFIfBBOC1E/odWfatALzFlq+VBSv3a2+2qA==
X-Received: by 2002:a17:90b:3891:b0:3b4:127a:2bc2 with SMTP id 98e67ed59e1d1-3b41c8d9bfamr2140676a91.14.1795163838461;
        Fri, 20 Nov 2026 00:37:18 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b52dsm3590057a91.5.2026.11.20.00.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:37:18 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: vbabka@kernel.org,
	harry@kernel.org
Cc: urezki@gmail.com,
	paulmck@kernel.org,
	qiang.zhang@linux.dev,
	akpm@linux-foundation.org,
	hao.li@linux.dev,
	cl@gentwo.org,
	rientjes@google.com,
	roman.gushchin@linux.dev,
	linux-mm@kvack.org,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com,
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] mm/slab: don't queue the page cache work under krcp->lock
Date: Fri, 20 Nov 2026 16:37:07 +0800
Message-ID: <20261120083707.296481-2-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120083707.296481-1-zhanxusheng1024@gmail.com>
References: <20261120083707.296481-1-zhanxusheng1024@gmail.com>
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

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

Commit 56292e8609e3 ("rcu/tree: Defer kvfree_rcu() allocation to a
clean context") deferred page allocations to a workqueue. To avoid
deadlocks with the scheduler, it used hrtimer to queue the work instead
of queueing it directly.

Commit d0bfa8b3c411 ("kvfree_rcu: Release a page cache under memory
pressure") later added a backoff mechanism under memory pressure, but
did not consider that queue_delayed_work() with delay = 0 immediately
queues the work and introduced the deadlock commit 56292e8609e3 tried to
avoid.

run_page_cache_worker() runs under krcp->lock, from kvfree_call_rcu()
callers that may hold more, such as set_cpus_allowed_force() under
pi_lock, so it kicks the refill work from an hrtimer. Under memory
pressure it instead queues the work with a delay of
rcutree.rcu_delay_page_cache_fill_msec, which may be 0, and a zero delay
queues it at once, taking pool->lock under krcp->lock.

With the delay set to 0, calling kvfree_rcu() on vmalloc memory under
pi_lock after a drop_caches makes lockdep report:

  Chain exists of:
    &pool->lock --> &p->pi_lock --> krc.lock

A zero delay also defeats the backoff, which is there to defer the
refill under memory pressure.  Clamp the delay to [1:100000] ms, so that
queue_delayed_work() always arms a timer, and update the documented
range.

Fixes: d0bfa8b3c411 ("kvfree_rcu: Release a page cache under memory pressure")
Cc: stable@vger.kernel.org
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
v2: clamp the delay to [1:100000] ms instead of using the hrtimer for a
zero delay (Uladzislau).  The changelog is Harry's version from
slab/for-next-fixes, with the last paragraph rewritten.  The
Reviewed-by tags of Vlastimil and Hao on v1 are not carried over, as
the code changed.

Tested in a VM on v7.4-rc1 with lockdep: with
rcutree.rcu_delay_page_cache_fill_msec=0, patch 1 alone reports the
circular dependency above; with this patch the boot log says "Adjusting
rcutree.rcu_delay_page_cache_fill_msec to 1 ms." and lockdep stays
quiet.

v1: https://lore.kernel.org/all/20261028134647.3176080-1-zhanxusheng1024@gmail.com/

 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 mm/slab_common.c                                | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 0b3c140babd9..0d1d76a6af70 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5763,7 +5763,7 @@ Kernel parameters
 	rcutree.rcu_delay_page_cache_fill_msec= [KNL]
 			Set the page-cache refill delay (in milliseconds)
 			in response to low-memory conditions.  The range
-			of permitted values is in the range 0:100000.
+			of permitted values is in the range 1:100000.
 
 	rcutree.rcu_divisor= [KNL]
 			Set the shift-right count to use to compute
diff --git a/mm/slab_common.c b/mm/slab_common.c
index 41dea01a8c1f..6fb453118641 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -2262,12 +2262,12 @@ void __init kvfree_rcu_init(void)
 			WQ_UNBOUND | WQ_MEM_RECLAIM, 0);
 	WARN_ON(!rcu_reclaim_wq);
 
-	/* Clamp it to [0:100] seconds interval. */
-	if (rcu_delay_page_cache_fill_msec < 0 ||
+	/* Clamp it to [1:100000] milliseconds interval. */
+	if (rcu_delay_page_cache_fill_msec < 1 ||
 		rcu_delay_page_cache_fill_msec > 100 * MSEC_PER_SEC) {
 
 		rcu_delay_page_cache_fill_msec =
-			clamp(rcu_delay_page_cache_fill_msec, 0,
+			clamp(rcu_delay_page_cache_fill_msec, 1,
 				(int) (100 * MSEC_PER_SEC));
 
 		pr_info("Adjusting rcutree.rcu_delay_page_cache_fill_msec to %d ms.\n",
-- 
2.43.0

