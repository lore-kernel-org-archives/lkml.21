Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795579431;
	b=T9ubUtPqKiUlJ3hBY6yliq7EckgevQgQh063P71ERI1LhcWNtE5VNodE2i+IAkKzGbs2
	 FFESxFNQuAwGwKLIYA3WiAatvScWYzT3F6y0CiIOnERqYsG+92uA6E7SNQHsjk1pRTnI7
	 FeGWAtuKjj7oh3MEoTAGEVMKbrqTdbTTgwjcNxx8N1m+MIKBHngijrTn9g9ZlOfL7Begp
	 57+vH90uUX66ebvxntfewj8ADakumBoIQAZqh9evrbEiCkfmjh0LJZZU8thwmowf+WyLa
	 s4qLqVso7jgFDB9bsKs2WZrLPzeplpdy+UfsywnPVWIvJscmIC675mKmEELiAJGya6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795579431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Subject:From:To:Cc:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=FJpFlG2KhF/i7ZYFbAbjEhsaAMAjHqUu1cyD0w44kPw=;
	b=ACgN5ZOMBHTZwvQT+75y16O8vGqjV8dY9OegoCG9YD5jQ1gaZmouKAhD24pYkN2pfRtN
	 WO7SotVgG33NCSJ7uJAolBd1PZPzAQAWd8nfaAhsK2Dog7SAfoZt7oK6M6APBGfUmlGKo
	 wQTcyL0vodAlRbmeNmJJsQpxU1ogMd5RYPR2BWKW2e7helg8KgfJqTNCCakIF3m8dUeu2
	 RnJo+Xa6uadALRMdYlrnomsg+sSNzPNvHkcwEp3531/ButexkiWZ1tKgc4hdHAScb0oDE
	 cybzSCSl4w3s/YZV05sjwRnRZF+ZZ4UNp64+Iex8faovymHpcESAwC0oTa9uRlU11DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wFqd666p;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BA3606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:03:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64BA3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wFqd666p
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8b2382bf051so2919032b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795579431; x=1796184231; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FJpFlG2KhF/i7ZYFbAbjEhsaAMAjHqUu1cyD0w44kPw=;
        b=wFqd666pVxX8odUiX88E5A6dCczA8eVt0MMhu+kzFLlKgcLwRRoQZUe6BOtjZPlaA4
         RXYFOmjn73IVOFU2nbyHtvPYEaBfPAptUXVsrMLOUSQVg/7sc+ODLSo3rkKQXjuRieEO
         LIiktH6/5c0MvCvfeJe5hAsXg8/GZiatJafwfuFvrxe7iNjST2ScgA5dGaDonAtjK0R4
         0q2EofEMQp9uJLFIm2zsvLe8Ru5USzFSC8JdY8ClTwFfwwCgg2pLa61BA/TfhzWVA3MZ
         zJY09OACmu5FwvxzvVs+k9+TrCgcaMJwKVia8aQFp5SuRYuvVR5863cHWlVXXS/5VyXz
         KxOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795579431; x=1796184231;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FJpFlG2KhF/i7ZYFbAbjEhsaAMAjHqUu1cyD0w44kPw=;
        b=yWEpGfTCeyTaKIMRt02vC4OS+0Ij+d1CKM8CSnyVKged9JM2d0yYmZ37kE2Vx6+e+M
         tRdTOZF5JA7jxPcldRjqWNsDowGl1rlTwa6ayhcywdWEqmNkZlZpr1Ft71p1nw0988pe
         lXCVXwBtWeol/2wFCR0Ig8ylft/UDeADi1RPBUM/wo3y5MWzjphVfth9eCZhpjY+Lnw1
         OPzio9Qwb5RaSQBQSYe3t/AiyVran2FRndJh1zPJZINaQMsFZ+pbVFsqxYtZ/6Ubbj28
         ZFSgSIeZjdk2EBKk6/uchbYdxKwjjAYHSq0UQ+CPZ2nP3EQcnSWFK/nRZ+5k07rCxcm4
         Ls3g==
X-Forwarded-Encrypted: i=1; AL+hErF/87+fiPWRYPqyx65XEtewbh/0F28AGtfo9BqgyTz/LqDqRWzVK+c2Brzpv1FHjFd1QovqhV1u09ZabF4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+eEKgSaTWAVQWhCjlVcFo42jo5Oe9jAN8mOsa72BHNenWcf5r
	NyN1W3EznCDr8L0tB1owY940sjoIGBgRu9JmlZq9IULLcolTTHt4ebaU
X-Gm-Gg: AZFdTZfI7F0Jh3o+qfGAhQpj3o/v4KQ14zn9QBjEm0dapfPmAgTB8tycyJji10Wiona
	lsq9fxm4E5XJMQG/BiANH4mIuLuoEDbsHgItt2V7fOccG1J1l+CVo65HD7hbhi04N82rbRrRls9
	HIaCee/mu1Ji2sTjdnEwnATl2ECyf1gAgTWu+8AN2sxJhLVHPSNVaXXNC6MU0F5qBaAcPXMvog3
	TS2RWM9wvuE1i8GGICMSu17NNm7oxCSoVP54UmV3i8wYjSKipIje7z4Qm4g8dahN23pEubtFma0
	mdntwJQuxC39quElZBSFa80KgrgRxHI6GSAsJ+vyk1v2D/3J9QfW/wy1UBk1aGAJWX9H4wDxQiR
	ZU5ML0ZyXBcvLcvsnTErQZU0+T3LANwTNQIMbOBSH6ju78uLRq8oRxIgvPp9Rsly5Hw2JMphT9I
	TBwYa4wkKMWZ87p62DflQ1qjiqnMy0Anb+bHyiDw3VHuiSe3jZmmGMeQCs4vT+e+u4z4HUyvYJ/
	L6L3DV0lx7nba7O4QfALg5v1iVOYat4A4HIv+nPl+SM+R+9WGnbJs19HDpr3j5IaudvV9KSt+Ds
	N8UVrQje94CWLXhAC/eaNqxbaJjWvKi4fxR8DMhh0whuIitlFJgu3z4eUeciydriwSiQZQ9/pnV
	6PYsk6tsGcDFTC2l2/fvPmq+lZNYiHCHuow==
X-Received: by 2002:a17:90b:3a4f:b0:3ab:5758:3757 with SMTP id 98e67ed59e1d1-3b41c98bec2mr15855830a91.61.1795579430408;
        Tue, 24 Nov 2026 20:03:50 -0800 (PST)
Received: from localhost ([153.61.198.251])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b495035339sm12649812a91.0.2026.11.24.20.03.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 20:03:50 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Nov 2026 04:03:49 +0000
Message-Id: <DN3ZSA718QIA.11EAQE8I69WJ8@gmail.com>
Subject: Re: [PATCH bpf-next v1 1/4] bpf: Add call for selecting kmalloc or
 kmalloc_nolock at call time
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Harry Yoo" <harry@kernel.org>
Cc: "Emil Tsalapatis" <emil@etsalapatis.com>, <bpf@vger.kernel.org>,
 <andrii@kernel.org>, <eddyz87@gmail.com>, <memxor@gmail.com>,
 <daniel@iogearbox.net>, "Sebastian Andrzej Siewior"
 <bigeasy@linutronix.de>, "Clark Williams" <clrkwllms@kernel.org>, "Steven
 Rostedt" <rostedt@goodmis.org>, <linux-rt-devel@lists.linux.dev>,
 "Vlastimil Babka" <vbabka@kernel.org>, "Hao Li" <hao.li@linux.dev>, "Andrew
 Morton" <akpm@linux-foundation.org>, "Suren Baghdasaryan"
 <surenb@google.com>, "Michal Hocko" <mhocko@suse.com>, "Brendan Jackman"
 <brendan.jackman@linux.dev>, "Johannes Weiner" <hannes@cmpxchg.org>, "Zi
 Yan" <ziy@nvidia.com>, <linux-mm@kvack.org>, "David Hildenbrand"
 <david@kernel.org>, "Peter Zijlstra" <peterz@infradead.org>, "Ingo Molnar"
 <mingo@redhat.com>, "Will Deacon" <will@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Waiman Long" <longman@redhat.com>,
 <linux-kernel@vger.kernel.org>
In-Reply-To: <awWRZ9xCzWLnj_R6@thinkstation>
References: <20261124060357.11700-1-emil@etsalapatis.com> <20261124060357.11700-2-emil@etsalapatis.com> <DN38HGVL8JHQ.2ZVZQCKFXVA9T@gmail.com> <awWRZ9xCzWLnj_R6@thinkstation>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, Nov 24, 2026 at 05:59 AM Harry Yoo <harry@kernel.org> wrote:

>> +	/* The caller may hold a raw_spinlock_t. */
>> +	lock_map_acquire_try(&zone_nolock_map);
>> +	spin_lock_irqsave(&zone->lock, *flags);
>> +	lock_map_release(&zone_nolock_map);
>> +	return true;
>> +}
>
> I'm not sure this is a better solution unless this could be generalized
> or abstracted further.

Alright. Here is generalized one.

diff --git a/mm/internal.h b/mm/internal.h
index 85cf7be..1de6292 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1688,6 +1688,44 @@ static inline bool can_spin_trylock(void)
 	return true;
 }
 
+/*
+ * An IRQ handler can allocate at any point where IRQs are enabled, so a
+ * _nolock() caller can wait there for a lock that is IRQ-safe.
+ */
+static inline bool nolock_can_wait(void)
+{
+	return !IS_ENABLED(CONFIG_PREEMPT_RT) && !irqs_disabled() && !in_nmi();
+}
+
+/* @lock must always be held with IRQs disabled. */
+static inline bool spin_lock_nolock(spinlock_t *lock, unsigned long *flags)
+	__cond_acquires(true, lock)
+{
+	if (!nolock_can_wait())
+		return spin_trylock_irqsave(lock, *flags);
+
+	spin_lock_irqsave(lock, *flags);
+	return true;
+}
+
+/*
+ * The caller may hold a raw_spinlock_t. The map has to cover the critical
+ * sections of spin_lock_nolock() up to the unlock.
+ */
+extern struct lockdep_map nolock_wait_map;
+
+static inline void nolock_wait_begin(void)
+{
+	if (IS_ENABLED(CONFIG_PROVE_RAW_LOCK_NESTING) && nolock_can_wait())
+		lock_map_acquire_try(&nolock_wait_map);
+}
+
+static inline void nolock_wait_end(void)
+{
+	if (IS_ENABLED(CONFIG_PROVE_RAW_LOCK_NESTING) && nolock_can_wait())
+		lock_map_release(&nolock_wait_map);
+}
+
 /* char-mem.c */
 bool file_is_dev_zero(const struct file *file);
 
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 2fef409..f22ae49 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -2550,7 +2550,7 @@ static int rmqueue_bulk(struct zone *zone, unsigned int order,
 	int i;
 
 	if (unlikely(alloc_flags & ALLOC_NOLOCK)) {
-		if (!spin_trylock_irqsave(&zone->lock, flags))
+		if (!spin_lock_nolock(&zone->lock, &flags))
 			return 0;
 	} else {
 		spin_lock_irqsave(&zone->lock, flags);
@@ -3237,7 +3237,7 @@ struct page *rmqueue_buddy(struct zone *preferred_zone, struct zone *zone,
 	do {
 		page = NULL;
 		if (unlikely(alloc_flags & ALLOC_NOLOCK)) {
-			if (!spin_trylock_irqsave(&zone->lock, flags))
+			if (!spin_lock_nolock(&zone->lock, &flags))
 				return NULL;
 		} else {
 			spin_lock_irqsave(&zone->lock, flags);
@@ -8115,12 +8115,19 @@ static bool __free_unaccepted(struct page *page)
 
 #endif /* CONFIG_UNACCEPTED_MEMORY */
 
+DEFINE_WAIT_OVERRIDE_MAP(nolock_wait_map, LD_WAIT_CONFIG);
+
 struct page *alloc_frozen_pages_nolock_noprof(gfp_t gfp_flags, int nid, unsigned int order)
 {
+	struct page *page;
+
 	if (nid == NUMA_NO_NODE)
 		nid = numa_node_id();
 
-	return __alloc_frozen_pages_noprof(gfp_flags, order, nid, NULL, ALLOC_NOLOCK);
+	nolock_wait_begin();
+	page = __alloc_frozen_pages_noprof(gfp_flags, order, nid, NULL, ALLOC_NOLOCK);
+	nolock_wait_end();
+	return page;
 }
 /**
  * alloc_pages_nolock - opportunistic reentrant allocation from any context
diff --git a/mm/slub.c b/mm/slub.c
index 5c33d12..5bd00d1 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -3821,7 +3821,7 @@ static void *alloc_single_from_new_slab(struct kmem_cache *s, struct slab *slab,
 	n = get_node(s, slab_nid(slab));
 	if (allow_spin) {
 		spin_lock_irqsave(&n->list_lock, flags);
-	} else if (!spin_trylock_irqsave(&n->list_lock, flags)) {
+	} else if (!spin_lock_nolock(&n->list_lock, &flags)) {
 		/*
 		 * Unlucky, discard newly allocated slab.
 		 * The slab is not fully free, but it's fine as
@@ -3939,7 +3939,7 @@ static void *get_from_partial_node(struct kmem_cache *s,
 
 	if (alloc_flags_allow_spinning(ac->alloc_flags))
 		spin_lock_irqsave(&n->list_lock, flags);
-	else if (!spin_trylock_irqsave(&n->list_lock, flags))
+	else if (!spin_lock_nolock(&n->list_lock, &flags))
 		return NULL;
 	list_for_each_entry_safe(slab, slab2, &n->partial, slab_list) {
 
@@ -4543,7 +4543,7 @@ static unsigned int alloc_from_new_slab(struct kmem_cache *s, struct slab *slab,
 
 		if (allow_spin) {
 			spin_lock_irqsave(&n->list_lock, flags);
-		} else if (!spin_trylock_irqsave(&n->list_lock, flags)) {
+		} else if (!spin_lock_nolock(&n->list_lock, &flags)) {
 			/*
 			 * Unlucky, discard newly allocated slab.
 			 * The slab is not fully free, but it's fine as
@@ -5608,7 +5608,9 @@ retry:
 	 * kfence_alloc. Hence call ___slab_alloc() (at most twice)
 	 * and slab_post_alloc_hook() directly.
 	 */
+	nolock_wait_begin();
 	ret = ___slab_alloc(s, gfp_flags, node, ac);
+	nolock_wait_end();
 
 	/*
 	 * It's possible we failed due to trylock as we preempted someone with
