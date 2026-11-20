Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160917;
	b=MITkew/3neaWUe6qZvlrp7c2RSFbaPJRu/tFOZmaJkeBxyl2nB4Yq0YRhU/4nTWYU4mm
	 suhJr9MpBAV8+FL4ne6YPRSmueXlkZIo1ixdWmvDZY/C5gCZa+jNDcpaji5fMEMaDhv1R
	 dIPdDUclYC5sL/13+1Ew5rPjEF7Nd55EFXldL6dk2MdlBHQIHw6rx5h+0YykR8T2xuOJn
	 LPodeZihbjZkFzuEgdJ7pGDPMPi2JsC1cqf4dAOfIVMCj0rwgNJrNFANkN5Bj+60v9gQv
	 nAkIXcoIM9G0lr2ekx2api6eyYploJPYH7gYKfZo/eEz2A+BaK7X+OZfRb5k+2cS/eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160917;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=87RNaaNfdLcFk4ZTuxhuFbTHIbFpjHDXzWzIK6yaLPw=;
	b=dDC+ZGNr5vbL/bpeVX7yuk+4FIzSmWaPzlfQx8a7A4KephQmzjvejmnakGFnVZqGtGu/
	 PzdNwVmnUkolTDJcnT9zyWw1mQYOjjl1sSj/uhIiN45tCulLf/ma3grDGmn1TjpYXINaE
	 z/dG5W/LPoPqOgJbjGKySltZfcjxEBb6MJc0DXlGHtEV/QvtExCywm4skQMk7nEYwIfD6
	 lXy4PdUDOaAhwoCVv36rcoL5o8KuxYs79yOt5ECd7Qs0mZzcjxFuZT4LDvh/PwLOCyzUy
	 zdXWco13J5uW+CmP9agZaoT4YcJfXIZS1jic0tvTejobaL+BkHJd7YTj6vPTzcVdn2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=iOQAV6V5;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0D7606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:48:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA0D7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=iOQAV6V5
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso329475a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795160916; x=1795765716; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=87RNaaNfdLcFk4ZTuxhuFbTHIbFpjHDXzWzIK6yaLPw=;
        b=iOQAV6V57g9K0YlldSj9LmecEMMwpyS9SeJNol1ZGRWm+UQ/liCICKdu6zJSw7jcJL
         S7AEd5UVaCeJHqmBUBWRc8DNbtmuaPlXYpHyrpDBmuHVj2zfQ6NMErcrVdAQUkSXOdhf
         nbjHfwyaZNEorYNr4+k5x0647N0HDy+dSaeSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160916; x=1795765716;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=87RNaaNfdLcFk4ZTuxhuFbTHIbFpjHDXzWzIK6yaLPw=;
        b=RQbDs3bI+Rtfn7Hcq0OnPXKJJdSJs2ZZJst9XBt5vXyemi5s4mhvLaPUNRSGJ6v6wz
         mWCot6RRVhURKN/LK1Tlq/mrWq/pjmecY1nBaMlyf5lKZUpA2FUzK7n9LkHqj6WDMJaQ
         9IAIcw0VNO6nWqrdNvf93fgkb3wtj2WhfPvX3ArdC673wC9jBH/fO+6RvQd5SyzRyUqL
         rwIqITqOMsLyxde5JKTMmdfiHCpWF74HelpSiJn8TbEGOMfk/xnv0KS4cX/PUQh6EFKJ
         FhjygmLcBOBi7eGkRqdxQB9Xqw9eP9OoRlAptq8T3+TrDQ/jgUJzsRh1xR76/PkotDss
         6zpw==
X-Forwarded-Encrypted: i=1; AL+hErF8c1auKOH8xrc+ZxsEMQcTyggAqxuomtUdPn4GKRjzaBucCK/l54f7Ddh4VDBQE34POM0g9xf2RW2/nZw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7HnMy1Q2iE2mXUv7hdAbEp36MyrcaM29kL47ErxAK3wnPqG4F
	Lps454qsRIA3ENvbW07UF/vydVpq2u1N1JUNqdHR8knPzEHzIHgWtdYp8S1BEIxffA==
X-Gm-Gg: AZFdTZenuy6EDYuPEdkqGbuZJEh6hRisELXeKfxuuelVXa5UePcUdkP47WyUoU9qAF7
	5ak6XHICkoz8Xz0f4TawvdXE+dQq6kAhf73GwCeeP/KqGRzAo881fAlEIEGHfcaeA/pIlosB4ra
	gtMiEE1cmudIBkBpZAFwtFrumf7JpOEY5DzbTDUQuWBHPGF4dYxFm0FqMJVRTlFWIr3oNIqrYyc
	4HIPFLF+RtSH0LTgJPyCN5mN55z7+k0ldsxyj1wqbfdQdTJ55LglF70TMUNYBEDaAwzQ1NgJX5K
	nKV/NU/KiVNaqNiU+usMq3UxorGZgcHsj1IX0BICfo2wrmNrdAJ11qExaSEZjvJFUS61bpx8W2w
	MLv8g2dj/gbAoSnautg0jTBn4wKwgNfsN3A3grLR/6ZBd2V86b9BQUqlPpT9aNRj9Qq2bkNe4eK
	jis2SLhvow6P4foeWXvYmDilxFi31BNLMOQkCi9n3uDpfTy12Srd1bO4ebh8EhL9P1jNxjRYcYy
	h0xa0Ulv0iFGsJAYNd80NPZBTowH2gQmeElxOuAiUfPAtQ67xN8HUCGa9cCYniRf/z/DGkAj/It
	Os31YpnoofD4dkJTWYDQZDdTZBLhDXte/KcmlycngdUG8c0DXC/v5/Bvu447KC+qQV6JVw==
X-Received: by 2002:a17:90b:4a4f:b0:3ac:8af9:4a6a with SMTP id 98e67ed59e1d1-3b41c93c3b7mr2039531a91.42.1795160916074;
        Thu, 19 Nov 2026 23:48:36 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:d5a5:46fe:fd42:7b73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b420000deesm1063037a91.0.2026.11.19.23.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:48:35 -0800 (PST)
Date: Fri, 20 Nov 2026 16:48:30 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Hongfeng Chen <chenhongfeng0212@gmail.com>, 
	Nhat Pham <nphamcs@gmail.com>
Cc: Hongfeng Chen <chenhongfeng0212@163.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Barry Song <baohua@kernel.org>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Jens Axboe <axboe@kernel.dk>, 
	Johannes Weiner <hannes@cmpxchg.org>, Minchan Kim <minchan@kernel.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Yosry Ahmed <yosry@kernel.org>, 
	Wenchao Hao <haowenchao@xiaomi.com>, Wenchao Hao <haowenchao22@gmail.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	Hongfeng Chen <hongfengchen@xiaomi.com>, Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [RFC PATCH v4 0/2] mm/zsmalloc: defer object free to per-cpu
 batches
Message-ID: <av_4KLI35RzCQ7zC@google.com>
References: <20261016120927.3191690-1-hongfengchen@xiaomi.com>
 <20261023123736.1542117-1-chenhongfeng0212@163.com>
 <CAKEwX=M4jTnxmq6cj115Gw4u5jdY7Ex65jPtVTEopW70jGzfuQ@mail.gmail.com>
 <20261109105957.2577351-1-chenhongfeng0212@gmail.com>
 <av6JvaCh358eSMCw@google.com>
 <av-ltJooUJ0lqvqa@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <av-ltJooUJ0lqvqa@google.com>

On (26/11/20 10:44), Sergey Senozhatsky wrote:
> On (26/11/19 14:35), Sergey Senozhatsky wrote:
> > On (26/11/09 18:59), Hongfeng Chen wrote:
> > > On Fri, Oct 23, 2026 at 11:19 AM Nhat Pham <nphamcs@gmail.com> wrote:
> > > > Is there any more juice we can squeeze from zsmalloc in that case?
> > > >
> > > > It would be nice if you can perf zsmalloc freeing. And yeah, maybe we
> > > > can't optimize any further, but let's eliminate that first before we
> > > > rely on offloading.
> > > 
> > > Here is the perf breakdown of the free path:
> > > 
> > > zram:
> > > 
> > >   __swap_cluster_free_entries        90.28%
> > >     zram_slot_free_notify            86.01%
> > >       slot_free                      74.15%
> > >         zs_free                      56.01%
> > >           __free_frozen_pages        19.85%
> > >           kmem_cache_free            10.15%
> > >           _raw_spin_lock              5.53%
> > >           fix_fullness_group          3.31%
> > >           dec_zone_page_state         2.43%
> > >           obj_free                    2.17%
> > >           trylock_zspage              2.12%
> > 
> > We removed one of kmem_cache_free() from zs_free() [1].
> > 
> > [1] https://lore.kernel.org/linux-kernel/20261110054836.1515030-1-senozhatsky@chromium.org
> 
> I suppose we can batch some operations in zs_free(), something like
> this:

A slightly reworked patch below - handle incompressible and pow-of-two
zspages separately (w/o batching), because those are 1-page zspages,
nothing to batch.

---
 mm/zsmalloc.c | 52 +++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 46 insertions(+), 6 deletions(-)

diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index f571b3c9e9ca..9dcd1549c2fb 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -37,6 +37,7 @@
 #include <linux/debugfs.h>
 #include <linux/zsmalloc.h>
 #include <linux/fs.h>
+#include <linux/folio_batch.h>
 #include <linux/workqueue.h>
 #include "zpdesc.h"
 
@@ -866,6 +867,44 @@ static int trylock_zspage(struct zspage *zspage)
 	return 0;
 }
 
+/*
+ * Free the pages of a multi-page zspage in one go, see folios_put().
+ * Not inlined, so that the folio_batch is only set up (and, with
+ * CONFIG_INIT_STACK_ALL_ZERO, zero-filled) when there is something
+ * to batch.
+ */
+static noinline void free_page_chain(struct zpdesc *zpdesc)
+{
+	struct zone *zone = zpdesc_zone(zpdesc);
+	struct folio_batch fbatch;
+	int nr = 0;
+
+	static_assert(ZS_MAX_PAGES_PER_ZSPAGE <= FOLIO_BATCH_SIZE);
+
+	folio_batch_init(&fbatch);
+	do {
+		struct zpdesc *next = get_next_zpdesc(zpdesc);
+
+		VM_BUG_ON_PAGE(!zpdesc_is_locked(zpdesc), zpdesc_page(zpdesc));
+		reset_zpdesc(zpdesc);
+		zpdesc_unlock(zpdesc);
+
+		/* NR_ZSPAGES is per zone: one update per same-zone run */
+		if (unlikely(zpdesc_zone(zpdesc) != zone)) {
+			mod_zone_page_state(zone, NR_ZSPAGES, -nr);
+			zone = zpdesc_zone(zpdesc);
+			nr = 0;
+		}
+		nr++;
+
+		folio_batch_add(&fbatch, zpdesc_folio(zpdesc));
+		zpdesc = next;
+	} while (zpdesc);
+
+	mod_zone_page_state(zone, NR_ZSPAGES, -nr);
+	folios_put(&fbatch);
+}
+
 /*
  * Three free helpers, kept apart here:
  *
@@ -884,21 +923,22 @@ static int trylock_zspage(struct zspage *zspage)
  */
 static inline void __free_zspage_lockless(struct zspage *zspage)
 {
-	struct zpdesc *zpdesc, *next;
+	struct zpdesc *zpdesc;
 
 	VM_BUG_ON(get_zspage_inuse(zspage));
 	VM_BUG_ON(zspage->fullness != ZS_INUSE_RATIO_0);
 
-	next = zpdesc = get_first_zpdesc(zspage);
-	do {
+	zpdesc = get_first_zpdesc(zspage);
+	if (get_next_zpdesc(zpdesc)) {
+		free_page_chain(zpdesc);
+	} else {
+		/* Single-page zspage, e.g. a huge object: nothing to batch */
 		VM_BUG_ON_PAGE(!zpdesc_is_locked(zpdesc), zpdesc_page(zpdesc));
-		next = get_next_zpdesc(zpdesc);
 		reset_zpdesc(zpdesc);
 		zpdesc_unlock(zpdesc);
 		zpdesc_dec_zone_page_state(zpdesc);
 		zpdesc_put(zpdesc);
-		zpdesc = next;
-	} while (zpdesc != NULL);
+	}
 
 	cache_free_zspage(zspage);
 }
-- 
2.56.1.750.gf70dc682cf-goog

