Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795292018;
	b=kL0owb26UhoTM2ZPI4eq5LZjcddRvkSWc3vHYGLzXrh+2F+zf61p0N4474iSB7P3uM71
	 4iLj9uKjtzqEpuZ4xcbCg0NJLB26NH9XxUmRF2AGQT6G/6nqd2At2y5uMKaro765luUNB
	 wmiis2MqKM4fZadS+bE/gB8Ofujul/gYUyT+Ph5umPoPZ1nqyAZV9n9rVzRXLltp1XJxw
	 5woVy/acL1yeFWmiJm8YmyVDo93P1lZNdWtoFwKUDFPrjhp6fSgMqpTi2t+I9lMWaBP0d
	 YVD30eTZ80H03xtmgFatJiJEpDL2WjdJszI4sVX8RDJgI6dDVr4FgumdnmN4umztVoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795292018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=LtZDpCvLJ0VvtED3yvRJczLNhRGhJEw9NB2kLqULBmg=;
	b=LouKDWySzzc3NMtNzceH0Pyhn9fDbrRPX+uL3V9oZYlAoeTBu51eDnRWWdKmgF7t7F1u
	 P2TF5xyL0ykmhy3bYGyAOCAr7JQxVx3PT7UA7Bi+YOU9rT4zaA9FFlOS7P9kX//9ATBOy
	 wVHmEQElK1qzwxzV7+HydLbUaTvYA3stURVZcVvKSUt9RL2LpoNuIolOktwpRcHnSqcdS
	 aFdmMdZDCHvKAqQ/PnTplB+KNOKax0txGbWsujkyhLabYr7H9FrKeloJhmj4Y2Cqmko/D
	 1r/YnnqnNolTx1LlN4MVYwUwCTE0/0pRXVPfXPBBpDJqIWxzjbQQOhzNILWWMcEbALg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SyKoletg;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD48606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 20:13:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBD48606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SyKoletg
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso870674a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 12:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795292017; x=1795896817; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LtZDpCvLJ0VvtED3yvRJczLNhRGhJEw9NB2kLqULBmg=;
        b=SyKoletgjjjVyRpNHJLuOuD8rrmsr9nr1u7FImFvA5DOj1lcPvFvf69t0GFBFO3hRM
         46mdUjMj12QED3jxWtJpi6B3ZkzvpJMphpSUIyKzHpa3JeL+zLXbyvXFH7Hs9hNjYVlk
         1OUEm0zVKxhQqNfzQkl8AI86DwEUNyKQiTluOoV7Op/03AJwPI/5lNarL38hIgI3Qj4a
         OIbYGkYqRZy6Be07EdbGcqJVHJGCz5LOPzcO7t7VQ64slFU71TGbC2Ha/j+TVYguQts7
         hgCX8vwQkL9KdSsbozdSKtVGQtH2JOC+m3uK1bTL5U4sRcP3wqNufrGAJZeqaHCm3jYI
         8L1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795292017; x=1795896817;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LtZDpCvLJ0VvtED3yvRJczLNhRGhJEw9NB2kLqULBmg=;
        b=Dq4lz0doyIgL66Ypy9/CUrz/gFrPVCRxroIRxMRPm5e7Amuc/LHrZodt6dGEtD4vR9
         0pMMYYGWbVFskuc7G7wUIq+alo8NJf21HCaosGhB85apRUKPduPyUGbUFe6DW7J2uV4J
         8Notc4YviOHxYH5OtsphdUdcqBvx0jdFRTxubuH/SlMgGXu4ZKfqG//pxqI6CoszLaeJ
         4qqhXUhaaH7aFHS8UvCr29+eG8ZE4hCusYe08G0srEsdOliiD2PMFHeR+X8I4Gl208d8
         Xybl3wvFBRF+foTuKaa06EdvS2EhPIllOeYnhB/mk8OjWnph5pOnqYLsEoR0DicY3HqW
         qGvw==
X-Forwarded-Encrypted: i=1; AL+hErHZJBFYsuS2xdVR2GJssqTZ1z+OiMg8PS36UADU8+8DauXZ4dlWUlXlHSLLlmv7BdV/p/I0LMekIO/q4dY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JVjsGgmpzMCR+1RzADApbMHiwIuSdQDYIkFDGwUXnEfqvWMUK
	CqoOOqv5Eu5hciCRu6+/Vi8Uas05pPGDqy8nZhr1n/W0cf5eeRxDnc+R
X-Gm-Gg: AZFdTZenKZryE0D59LmN+n5uXCTPXFOnENo9Lzo/WdVb51/edH0IFUmJhXXtq6fqv/S
	7h98PjDXKjVDewkDb+YZnlt5h3NY2NGKOH+SqL9irvsdtEjKXx3dCyatQl/NT+EsqtMSbbWfEwv
	LxZcNuuFxk2Mk6MQFu/7PNNbr8Tm7iyoHFyDizHDlh7CQVaTPwlbd13AtNUmJFCrTcov8VZriTE
	c/AkZUXcFwONUejjagZAkdnuPAqtKZ/vpEi1opwJ2lTSS55u4SzBGs4dG44cPYg7ftzkZkWDx46
	/I0c+shSjC2jFLScOWSDJViDDtJRuG1hlK/avn6zTZznT7sBgBJss0sYY4lsMD17X56nqnSshbX
	zqOUQ0nHnQsY/H968LCmPw1iGmAn4JfYpSovFJZTB3Z7t8G3RnRRV38IpCj3p53nrrZYNJRWXC0
	k2uFclUntn3jrLNlXUxeWBO6myp9czkePxq5r5+AqthCW+ezpNzMtyiMKHAK/r8eH6RSZtTTp3/
	vDySNmtZEyQ+ZSgKJcqxfaeycJY2NFsJH+fuP54zA2OMYqWrD++WmxVltiqSzu6EmGpS9bHckVf
	yWZ9UucokgU+hhzhxQc1ZDnu2rDN9Eq4XZ91BnxB800z6ZJBYQOPDNebrDlXaqlclXHPVw==
X-Received: by 2002:a17:90b:5346:b0:3b0:9976:c1c6 with SMTP id 98e67ed59e1d1-3b41c9bbe00mr6148779a91.66.1795292017156;
        Sat, 21 Nov 2026 12:13:37 -0800 (PST)
Received: from KASONG-MC4 ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b6fc28asm2771809a91.1.2026.11.21.12.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 12:13:35 -0800 (PST)
Date: Sun, 22 Nov 2026 04:13:19 +0800
From: Kairui Song <ryncsn@gmail.com>
To: KunWu Chan <kunwu.chan@gmail.com>
Cc: kasong@tencent.com, linux-mm@kvack.org, 
	Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Muchun Song <muchun.song@linux.dev>, Qi Zheng <qi.zheng@linux.dev>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Chris Li <chrisl@kernel.org>, Baoquan He <baoquan.he@linux.dev>, 
	Nico Pache <nico.pache@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Nhat Pham <nphamcs@gmail.com>, 
	Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>, Gregory Price <gourry@gourry.net>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>, 
	Hugh Dickins <hughd@google.com>, SJ Park <sj@kernel.org>, David Rientjes <rientjes@google.com>, 
	Yu Zhao <yuzhao@google.com>, Vernon Yang <vernon2gm@gmail.com>, 
	Zicheng Wang <wangzicheng@honor.com>, Chen Ridong <chenridong@xiaomi.com>, 
	Tal Zussman <tz2294@columbia.edu>, Xiang Liu <liuxiang.277@bytedance.com>, 
	Ehab Ababneh <ehab.ababneh@intel.com>, Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>, 
	Lian Wang <lianux.mm@gmail.com>, Joanne Koong <joannelkoong@gmail.com>, 
	Hui Zhu <hui.zhu@linux.dev>, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	damon@lists.linux.dev, linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 17/17] mm/mglru: make folio_test_workingset() work
 based on folio LRU refs
Message-ID: <awFbU_VGf0hotbyR@KASONG-MC4>
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com>
 <20261119-mglru-fg-v5-17-9eee2fe97a2d@tencent.com>
 <CAN_Opa9APLNic4cnohrtZ4-HcdoNvSFvnAKiC6nn+C=thbTAAA@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAN_Opa9APLNic4cnohrtZ4-HcdoNvSFvnAKiC6nn+C=thbTAAA@mail.gmail.com>

On Fri, Nov 20, 2026 at 05:53:36PM +0800, KunWu Chan wrote:
> On Thu, Nov 19, 2026 at 5:04 AM Kairui Song via B4 Relay
> <devnull+kasong.tencent.com@kernel.org> wrote:
> >
> > From: Kairui Song <kasong@tencent.com>
> >
> > folio_test_workingset() currently tests the PG_workingset bit, which
> > is only the second lowest access bit of the folio LRU refs count now.
> > Folios with refs 4 or 5 carry it in the LRU_REFS_MASK field
> > and no longer have PG_workingset set, so the bit test misses them.
> >
> > folio_set_workingset() currently sets the PG_workingset bit with a
> > plain set_bit(), which also over-promotes folios at a higher refs
> > count: e.g. a folio at refs 4 is bumped to refs 6, advancing it
> > toward LRU_REFS_MAX and an earlier generation promotion.
> >
> > Move the test into mm_inline.h as an inline helper based on
> > folio_lru_refs(), checking refs >= LRU_REFS_WORKINGSET.  The set
> > stays a plain PG_workingset bit operation reserved for the
> > classical LRU: under MGLRU the refs count is maintained by
> > folio_inc_lru_refs(), and now triggers a debug WARN when called
> > while MGLRU is fully on (the switching window is exempt, as the
> > classical paths legitimately run alongside MGLRU then).  The one
> > PageWorkingset() user in erofs is converted to the folio helper.
> >
> > Under the classical LRU the refs count is not maintained, so the
> > test is equivalent to the PG_workingset bit test, which is the old
> > behavior.
> >
> > Tested-by: Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>
> > Signed-off-by: Kairui Song <kasong@tencent.com>
> > ---

...

> > +/*
> > + * For the classical LRU only: with MGLRU the PG_workingset bit is
> > + * part of the folio refs count maintained by folio_inc_lru_refs(),
> > + * and a raw set would corrupt it.  The switching window is exempt
> > + * because the classical paths legitimately run alongside MGLRU then.
> > + */
> > +static __always_inline void folio_set_workingset(struct folio *folio)
> > +{
> > +       VM_WARN_ON_ONCE(lru_gen_enabled() && !lru_gen_switching());
> 
> Could shrink_active_list() still hit this WARN after the switch
> to MGLRU completes? It can reschedule after isolating folios and
> reach this setter after lru_switch is cleared.

Hi Kunwu, thanks for the very careful review!

Right I thought a lot about it after your reply, first your concern
is right, thanks! I should just remove and replace this WARN with
something else.

And in theory, we should only call this for isolated folio (for CLRU
it means a folio moving out of active workingset, isolation is always
the first step), so this helper is fine - except, for the MADV cold
case, it will call it on for a on-list folio, and will could skew
the counter and if it raced with switching. Switching is so painful
I hope we can get rid of it soon :/

But, good thing is it's easy to fix, we just need (part of this belong
to another patch, a trimmed diff just for reference):

diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
index 4f65867446dc..c936d1fadfbd 100644
--- a/include/linux/mm_inline.h
+++ b/include/linux/mm_inline.h
@@ -261,8 +262,9 @@ static inline void __folio_set_lru_refs(struct folio *folio, unsigned int refs)
 
 	do {
 		new_flags = old_flags;
-		VM_WARN_ON_ONCE(lru_get_gen_flags(old_flags) != -1);
 		lru_set_refs_flags(&new_flags, refs);
+		if (lru_get_gen_flags(old_flags) != -1)
+			break;
 		if (new_flags == old_flags)
 			break;
 	} while (!try_cmpxchg(folio_flags(folio, 0), &old_flags, new_flags));
@@ -569,16 +571,16 @@ static inline void folio_clear_lru_refs(struct folio *folio)
  */
 static __always_inline void folio_set_workingset(struct folio *folio)
 {
-	VM_WARN_ON_ONCE(lru_gen_enabled() && !lru_gen_switching());
-	set_bit(PG_workingset, folio_flags(folio, FOLIO_HEAD_PAGE));
+	unsigned long flags;
+
+	flags = set_mask_bits(folio_flags(folio, 0), BIT(PG_workingset),
+			      BIT(PG_workingset));
+	VM_WARN_ON_ONCE(lru_get_gen_flags(flags) != -1);
 }
 
 static __always_inline
diff --git a/mm/madvise.c b/mm/madvise.c
index bbbb729ed647..a73d89a2ecca 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -374,11 +374,12 @@ static void madvise_cold_prep_folio(struct folio *folio)
 	 * as a workingset refault, and the referenced bit always needs to
 	 * be cleared even for inactive folios. For MGLRU, MADV_COLD clears
 	 * refs in folio_deactivate(); MADV_PAGEOUT handles refs after isolation.
 	 */
 	if (!lru_gen_enabled()) {
 		folio_clear_lru_refs(folio);
 		if (folio_test_active(folio))
-			folio_set_workingset(folio);
+			__folio_set_lru_refs(folio, LRU_REFS_WORKINGSET);
 	}
 }
