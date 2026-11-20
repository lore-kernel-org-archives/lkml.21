Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795139080;
	b=4L2OjfaRQdi18cxp0EnQsJ9zyY7cCaKXeVGQ8TWznIW9MLB3kJaxh19VzmoQS9oxAnTp
	 f2dK2ygIIb6kxc91UY17qDX2KAfJtnDJ0mhk2TjHIsA6xAIkRuDVlRpC3eXPOeBvAzE/E
	 VVeCvXPK8j/VODajrWhPQ4LHgHCNzmxjeUIvVXp/uh7ISfQ2GpGYBbq8P+igi4X3K5PQQ
	 DCpyJsN22KOHgrxqDmueFMHXgQYucpvEzRjAapOIE9zZ+p1eWSWgfXbt4dlpejwnQodAo
	 8C24c++2CM/ym/RCiaj/0A5tFImh5OqKHp9R/H+sRSEXV9eXk6+DmAh6WLnxlGUKSwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795139080;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=jaTemiemWt/IbS6IRMeW1LosBwcuSLA0MnPohXWgKzg=;
	b=eOK8J8/1VEg2eQ+RcsM+2Yfsi/5mvxlxyKOVjC2tbOY3tgUErlyL0QqMxktkMGGHpVPd
	 bjaKZEISegpO0YBWJaK8ck7IsxpIxdwyMlXiKenr7z8y0RamUrguAPM3+vKNoKokZGj+V
	 aWiZq7wtCEYViD+JmtW55y+AWISeTbQubvl2IBfwvyBmaX+mxh76mkgr9lNJTLWrZ90xT
	 zoJqSxmOS1hPJ9xPjouEoBBk33FPuqy4P1m+X+QgDbhXbJKulJZkE1NQq4nQJXDKUBeSj
	 BdFLj66dVC+Fo5yiGAKj+6KGQ45IgSzYCEN05nPoQhkfq9LqshGGKS6lZi4NDhHzz7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Dd+BDwPq;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB848606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:44:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB848606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Dd+BDwPq
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2efef1516b5so1982805ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795139079; x=1795743879; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jaTemiemWt/IbS6IRMeW1LosBwcuSLA0MnPohXWgKzg=;
        b=Dd+BDwPqbIgR4ya3hCngtZjcDoEKk5m2YHJPkCbALrqdsCOleSad/oryqy3Zjf0YzM
         8NyFz6smG9C1lWban+2plE8UUNEKwZJp2NjZbMjStUtWIdfB1pp3Dni1IbEPHUUrGO5o
         wYz5sLGefZ315Fs7fB7Z4FISkunINvIB5+WBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795139079; x=1795743879;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jaTemiemWt/IbS6IRMeW1LosBwcuSLA0MnPohXWgKzg=;
        b=cLwZhnpagHx9UoWQSJkAHzdGXRacC6I0t5QwASXI4whJaXEJJ7nn15J9czxTtxPzdd
         EYh+1h9RAmpMB1Kf/mfUcOrq2mgoq2Wle2ACRrMAmCC8MNYcjBdoflP3tRDe5CErP5Oz
         4Qc8BvmQueyhidfYfLibYqXC4+NPG41U1fHAPMHsNEgFTqc1HXW/1rLugT1Y9JA9g+5P
         H1V+vNHzTIFoTTgxkNvsRCyuTc9PqUz+1SjD6ArPZVd3BThYSXXPZpo2tB0F9nkFiR/I
         v1WiDTJxrznhJxfJ6Tljy3Dd6V9bRu56j8p4Wu9Xz5i2mFmfM+wcXXBluEVAtmwfTco9
         7IjQ==
X-Forwarded-Encrypted: i=1; AL+hErE14V81ot0Qo0ySJbHpv5KZLL54dVzmp717sP7fFy0tZU8YodazucmhNRoz9iqosRNURtEvZdPK/sMSPs4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+quYgtaX9mvcD73SV3fdmWlv89onRsiAMdmAyuIl36ulZ7Nulp
	ZRLT5bRM87vVI3vhGgh5jsC7sIM1NktT19Y+dLyg/H8aRRlN5m7si54dC0HRajITAQ==
X-Gm-Gg: AZFdTZe179s8tx9WuV7KvuVRIhL7uU0v//A6ajBgUNVgIwPe3Pk2qQ+iULMJ10EIjkk
	ldyDQUsm7J9A6DtdL8O/HltxQWUbbsRBo143rbxvWU0zR+dLVUidW/LsuBveH9Oq0RjSwt8d0Tl
	+YRl+srmA6+7dCNw/4Jz9DWkhPHLX+OnTVTqHKkvaB8eVT9N8gZ/YErWBItS33a5tqhFG1dWjOC
	b7rqwQ9i5CeW0YqYlmp6HbXy7H6lNwC/batqs10/5imCXsSkOIKlsF30yWVUcgGoSDEQA9YPUhX
	WaxBsDxK7WaIqVdMzII8qsJLSwMtZLOIhsatfNCzoJiEJtlnBrCv/1bPY6xGE9p45WNPbwrAZPm
	uwy3ENpR7w0cYoxPIh0s8e+lPl0gIKuiLQ8QiSK0xbpqG0KuZMMzAXric9GDXiRHYf3tnJOMl8m
	afdI8x6kGOOhIXOLnJgOhg76MOgybR2DozMV3i33W4T/r11bmqxk5PIKXwtalH9jpy8qoNxfj14
	SVxjViVgpEg1BYcTLm+TQ8OecaiZPnjxK0tJG560LemmFKudJ6CX7wlJd1usDVOS9ouEgNF9OEL
	KFXDRZ8oNGIjTzaI5CXIvd90Q7EDgSBhAXM0EMki2gZG8ePvlQVVChaXEe9ru3JhLRZAVBbmKDz
	kg9mykLU/9yulLUA=
X-Received: by 2002:a17:903:2f87:b0:2ef:df75:337b with SMTP id d9443c01a7336-2f03f246f17mr17438555ad.48.1795139079121;
        Thu, 19 Nov 2026 17:44:39 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:d5a5:46fe:fd42:7b73])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84294sm6793145ad.9.2026.11.19.17.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 17:44:38 -0800 (PST)
Date: Fri, 20 Nov 2026 10:44:31 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Hongfeng Chen <chenhongfeng0212@gmail.com>, 
	Nhat Pham <nphamcs@gmail.com>, Hongfeng Chen <chenhongfeng0212@163.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Barry Song <baohua@kernel.org>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Jens Axboe <axboe@kernel.dk>, 
	Johannes Weiner <hannes@cmpxchg.org>, Minchan Kim <minchan@kernel.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Yosry Ahmed <yosry@kernel.org>, 
	Wenchao Hao <haowenchao@xiaomi.com>, Wenchao Hao <haowenchao22@gmail.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	Hongfeng Chen <hongfengchen@xiaomi.com>
Subject: Re: [RFC PATCH v4 0/2] mm/zsmalloc: defer object free to per-cpu
 batches
Message-ID: <av-ltJooUJ0lqvqa@google.com>
References: <20261016120927.3191690-1-hongfengchen@xiaomi.com>
 <20261023123736.1542117-1-chenhongfeng0212@163.com>
 <CAKEwX=M4jTnxmq6cj115Gw4u5jdY7Ex65jPtVTEopW70jGzfuQ@mail.gmail.com>
 <20261109105957.2577351-1-chenhongfeng0212@gmail.com>
 <av6JvaCh358eSMCw@google.com>
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
In-Reply-To: <av6JvaCh358eSMCw@google.com>

On (26/11/19 14:35), Sergey Senozhatsky wrote:
> On (26/11/09 18:59), Hongfeng Chen wrote:
> > On Fri, Oct 23, 2026 at 11:19 AM Nhat Pham <nphamcs@gmail.com> wrote:
> > > Is there any more juice we can squeeze from zsmalloc in that case?
> > >
> > > It would be nice if you can perf zsmalloc freeing. And yeah, maybe we
> > > can't optimize any further, but let's eliminate that first before we
> > > rely on offloading.
> > 
> > Here is the perf breakdown of the free path:
> > 
> > zram:
> > 
> >   __swap_cluster_free_entries        90.28%
> >     zram_slot_free_notify            86.01%
> >       slot_free                      74.15%
> >         zs_free                      56.01%
> >           __free_frozen_pages        19.85%
> >           kmem_cache_free            10.15%
> >           _raw_spin_lock              5.53%
> >           fix_fullness_group          3.31%
> >           dec_zone_page_state         2.43%
> >           obj_free                    2.17%
> >           trylock_zspage              2.12%
> 
> We removed one of kmem_cache_free() from zs_free() [1].
> 
> [1] https://lore.kernel.org/linux-kernel/20261110054836.1515030-1-senozhatsky@chromium.org

I suppose we can batch some operations in zs_free(), something like
this:

---

 mm/zsmalloc.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 4a6ec43f418b..e0083962e4d3 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -43,6 +43,7 @@
 #include <linux/debugfs.h>
 #include <linux/zsmalloc.h>
 #include <linux/fs.h>
+#include <linux/folio_batch.h>
 #include <linux/workqueue.h>
 #include "zpdesc.h"
 
@@ -891,21 +892,39 @@ static int trylock_zspage(struct zspage *zspage)
 static inline void __free_zspage_lockless(struct zspage *zspage)
 {
 	struct zpdesc *zpdesc, *next;
+	struct folio_batch fbatch;
+	struct zone *zone = NULL;
+	int nr = 0;
 
 	VM_BUG_ON(get_zspage_inuse(zspage));
 	VM_BUG_ON(zspage->fullness != ZS_INUSE_RATIO_0);
+	BUILD_BUG_ON(ZS_MAX_PAGES_PER_ZSPAGE > FOLIO_BATCH_SIZE);
 
+	folio_batch_init(&fbatch);
 	next = zpdesc = get_first_zpdesc(zspage);
 	do {
 		VM_BUG_ON_PAGE(!zpdesc_is_locked(zpdesc), zpdesc_page(zpdesc));
 		next = get_next_zpdesc(zpdesc);
 		reset_zpdesc(zpdesc);
 		zpdesc_unlock(zpdesc);
-		zpdesc_dec_zone_page_state(zpdesc);
-		zpdesc_put(zpdesc);
+
+		/* NR_ZSPAGES is per zone: one update per run of same-zone pages */
+		if (zpdesc_zone(zpdesc) != zone) {
+			if (nr)
+				mod_zone_page_state(zone, NR_ZSPAGES, -nr);
+			zone = zpdesc_zone(zpdesc);
+			nr = 0;
+		}
+		nr++;
+
+		/* Free all pages of the zspage in one go, see folios_put() */
+		folio_batch_add(&fbatch, zpdesc_folio(zpdesc));
 		zpdesc = next;
 	} while (zpdesc != NULL);
 
+	mod_zone_page_state(zone, NR_ZSPAGES, -nr);
+	folios_put(&fbatch);
+
 	cache_free_zspage(zspage);
 }
 
-- 
2.56.1.750.gf70dc682cf-goog

