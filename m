Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795397438;
	b=uQl88qlpfi2cf88P5yLBI0GxSlF1U9XziNLzc/bfeDLBPe65gIxOnSOBSanB3EruZ5YU
	 D30uNYudYNOHMaxAUINYKw61wT96TYdQHPVsp+xG0sDRZb4Ystk2PqRAGxQ4U7pY9sq/7
	 ncp7yRghpAI9lbQs1c6PeFoCUt1E3Dw9dliT3ir3zxSFd8ex/1q/vqmxMGJSNTj03aiJ5
	 gh886XuQQZtbjKD7yWYbSNrmyoGAwPonslIJKJxfOFfeQr7dnTlSYKAlqUgkzlTGhiArb
	 MWG7rIrWFIZWH4cz5w1ZVtSztUKTJEOZ4w6tnsCxzbQrCYH8XK6/FbZLKbGxLS5IdAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795397438;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PHYlamw7fybYjzeLc3iuK4CS+fPI6wiuuTA9v+wgAMM=;
	b=R3ac4IapktxcTkkdZA/auLxfC6oXWupN0thL+Zp+d0oIXZE+YgjdPE3g46Hx/dsp6isu
	 MM5nVNNVxskKsOxwZAAMNsV1tTjlslbbAHtLD4c9w2djs9IstexJ5GVwPJ1KzetT1Qkar
	 fbsGwTqyF5v+R8ghfaOMkKTBP0Nt2QSmVgB0fD5mEaXLG2LLTx3BQ1mdMkkeZSYrNA6jh
	 Y1PzwX9KHE4EJyDgDAiH0RhrF8AxjapqEodtRaE7yXBwY1Bs98C/NuErN00kOTJiJ/d/X
	 C/jZiYzuhPUAmeGv9UXpkRZJH8sitORBsl+57aQLI2d4ClNX1318R0RKtCm9EA3Dp/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PMOdzkga;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A118D606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:30:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A118D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PMOdzkga
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso32951675e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 17:30:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795397436; cv=none;
        d=google.com; s=arc-20260327;
        b=ryQoCFF/n/5Ivqff6qDTPMqXLxlFo9Z46/dtRAsfezf3mqtg+8UVTibvZMMEvkAJsM
         DlfyC1I7uMWsAJToxw9e5PbbY901kjrVTUkhaguVZRpfbAgOZz+rTyXdzgatXynjbYEH
         60f0y61QwfL+ew1vmaNIapTLduOx5YIuIaa5mZL2esQmIcxJCrQWHodP34ME5jJC3LXA
         QVQA+PC3S3eOAXKVP7gsvG7yU0WLRhn5v8Q4q/kP5v/XzaDjE9sWbQSs6Ng/YYzlodJb
         rI8gMaxLUW8CXonqpVhNmfZohMAo+EEA1fc2CBHKMYe0rbYCJR7eB6aG/T2rf6pIQCIe
         Wkwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PHYlamw7fybYjzeLc3iuK4CS+fPI6wiuuTA9v+wgAMM=;
        fh=yiVkFjAxtNKmHiisdGpb7lneqF/V/96xicZJUwHHV/c=;
        b=LdA0ZvpeqcDrhsQeJDrge0zZ/U8k+hQB+UgYVFrTyZhui/ezXopMBdb2CSSs115LNd
         S5BbrKhvp7yhd+0Pp8j7k1jHeQQWaVKyGBrNombV9bHul02qdS0RYW5gMFjQ3jiqf86/
         mPvQXHaC8iMsOX8GR3R3nKpdI/Gchn9XQrzTgj10eC3ZSv18YpL/SexsFf9K/HOAfhkg
         qmC/qFhxaShYApx05beVnEnaazYUNq8xzdoLE8DWlT2glC0Q9uhPstxaYV/x8TYLD0O7
         V9QlAvn9cUMguFFdAd8iGTAGsil7aKXEZEZ5kSQTRzPHRbOR3FlcyxBYz5Q26z6mImDY
         w08w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795397436; x=1796002236; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PHYlamw7fybYjzeLc3iuK4CS+fPI6wiuuTA9v+wgAMM=;
        b=PMOdzkgauSkSu06keInAVbQ1hpbuUbZlTieYOQocRbk2trdC3tbSifWCXpDjQmM5y2
         zTQHo01mJ9VTN/ldIe8a+icbQRaz3c11r9X6o3eJZAWX9yfaDWNMZ/SZZg9foXo+7wYB
         UvWlqTVjYL7uSYFjgTQPjciQfrw1tjn4ArrwFKviG6XrhJrYDszJhmBG3z0epuV8kpax
         PlzK6Wmg8BijSlDvgBM2ViDG8XehWTTJPzc6/4FJG8MYO2J7148gCIrGT4k7KaKPUvXI
         sqr3i+pKrj95bXE3VQCkbyw4dXFA5quyDBFerr9bW3TYzEzZfLeE8GJsVnv/Bbq6WYr0
         ZrkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795397436; x=1796002236;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PHYlamw7fybYjzeLc3iuK4CS+fPI6wiuuTA9v+wgAMM=;
        b=JPkU0EhstYe3If77cDOa6USbH0qn2Qw5Oc5uSVSJcqAyNCVLVzgobdNWpj489GG6FF
         mmgu+xwUqw5lr5aTQvburvoNI63EzCDtdIsTDEc4peXqet3DI9hsXPPJbhhvBftxSLPi
         vaVE6QSEEgigUdavLk/UiVbIqAN9nVaLWS6p0I/Qb2JzYnmcVZuapY7XLF6vFux8tYwx
         LM5HaLGSyYTJFxRSw36i822DScUBazFdwD8b1xTCuLxv2oi8Bq1uqy7vjDIFTYIr0gG3
         JnU5Syb5fJJQiIfoCLHPITFHpnuOP5U/CFtsKzfVoF9Z5s5E/d43hPS8wPQnU5EQKVh8
         53mA==
X-Forwarded-Encrypted: i=1; AL+hErFcoF3Oncc9pXJEmAmNMZOlV57FnZG/XreoY+QL9xl0nvouddPedGhGkb3/0WGPCa1ijIojOXwTyssgrUI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9l08pP+lVEi6WQCUolfii5PoOy3iaC8LgNxB/xkzNS82ejWem
	Yo0dH7FXkp/Gz/oOn5VVa1bOo3Idu3Zy++Wf40FDkWdYBMGnwvDZuxdgVi51jByjh/ViyWN0buY
	3RZU8ywqOsZgz89/ViibA2oA57eF+zUw=
X-Gm-Gg: AZFdTZdR3ebNc3AZVFtW8Cnqdb8dWfTXPSQ6uK2PPlYaFW8ZToL7+H/YWexYd7b4uid
	2GFUiPCVwZaeEGJg8jVmob+p9s7B7Fo4zG+oYoA9q0nAqGxssMyluHoj9WMk3JPkj7Gx2coGwoo
	y6wdBnL27m9guSg6oImGb1kOhoUSQ6vo2sOL4P1uVIB7l5nguRbtP/bpJcWq6REW4l42gZR/dWu
	t7GVJkn36kI5ZjgmzeGjPmpCcT47riK6vNpHW6g0DbnvSuF2JP+xQhvI2kEI+iWckHfVuSpe/0F
	i7nvFe7uYZvkmqj6fa/mSyattve045RvHI9Dshu0aptIJ8OnoF0+d8N4BkFwHfyYd9ps2BOLJU9
	Mf0rzKT2+xcp2a3NHFLBq8WLr7sbVkJGepwdT10lYulsxnIzjXCzOqf1ZsyazdkcG2GAS2gU5CD
	SgiL+fyoaRylq0ikfaQk6kF8SfXsZ4W3QcDGicu8BpcPYomK5gx3WO4WPlT0B+PcWIP/SQKDLn4
	Q==
X-Received: by 2002:a05:600c:5395:b0:4b1:4017:c4f4 with SMTP id
 5b1f17b1804b1-4bb8880ca2fmr202326895e9.20.1795397435229; Sun, 22 Nov 2026
 17:30:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com>
 <20261119-mglru-fg-v5-17-9eee2fe97a2d@tencent.com> <CAN_Opa9APLNic4cnohrtZ4-HcdoNvSFvnAKiC6nn+C=thbTAAA@mail.gmail.com>
 <awFbU_VGf0hotbyR@KASONG-MC4>
In-Reply-To: <awFbU_VGf0hotbyR@KASONG-MC4>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Mon, 23 Nov 2026 09:30:23 +0800
X-Gm-Features: Aa3M54otUxeoT9sHoHYTq2p_UuIGttJQaGd17GdUT_OXTaZ8k51r48Rl1cQl1ww
Message-ID: <CAN_Opa9ppGsKPhh1jmveYDCwHgZtv0Tm38FB2WoAjTtOPMmpmw@mail.gmail.com>
Subject: Re: [PATCH v5 17/17] mm/mglru: make folio_test_workingset() work
 based on folio LRU refs
To: Kairui Song <ryncsn@gmail.com>
Cc: kasong@tencent.com, linux-mm@kvack.org, 
	Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Muchun Song <muchun.song@linux.dev>, Qi Zheng <qi.zheng@linux.dev>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Chris Li <chrisl@kernel.org>, 
	Baoquan He <baoquan.he@linux.dev>, Nico Pache <nico.pache@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Nhat Pham <nphamcs@gmail.com>, 
	Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>, 
	Gregory Price <gourry@gourry.net>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>, Hugh Dickins <hughd@google.com>, 
	SJ Park <sj@kernel.org>, David Rientjes <rientjes@google.com>, Yu Zhao <yuzhao@google.com>, 
	Vernon Yang <vernon2gm@gmail.com>, Zicheng Wang <wangzicheng@honor.com>, 
	Chen Ridong <chenridong@xiaomi.com>, Tal Zussman <tz2294@columbia.edu>, 
	Xiang Liu <liuxiang.277@bytedance.com>, Ehab Ababneh <ehab.ababneh@intel.com>, 
	Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>, Lian Wang <lianux.mm@gmail.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Hui Zhu <hui.zhu@linux.dev>, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, damon@lists.linux.dev, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 4:13=E2=80=AFAM Kairui Song <ryncsn@gmail.com> wrot=
e:
>
> On Fri, Nov 20, 2026 at 05:53:36PM +0800, KunWu Chan wrote:
> > On Thu, Nov 19, 2026 at 5:04=E2=80=AFAM Kairui Song via B4 Relay
> > <devnull+kasong.tencent.com@kernel.org> wrote:
> > >
> > > From: Kairui Song <kasong@tencent.com>
> > >
> > > folio_test_workingset() currently tests the PG_workingset bit, which
> > > is only the second lowest access bit of the folio LRU refs count now.
> > > Folios with refs 4 or 5 carry it in the LRU_REFS_MASK field
> > > and no longer have PG_workingset set, so the bit test misses them.
> > >
> > > folio_set_workingset() currently sets the PG_workingset bit with a
> > > plain set_bit(), which also over-promotes folios at a higher refs
> > > count: e.g. a folio at refs 4 is bumped to refs 6, advancing it
> > > toward LRU_REFS_MAX and an earlier generation promotion.
> > >
> > > Move the test into mm_inline.h as an inline helper based on
> > > folio_lru_refs(), checking refs >=3D LRU_REFS_WORKINGSET.  The set
> > > stays a plain PG_workingset bit operation reserved for the
> > > classical LRU: under MGLRU the refs count is maintained by
> > > folio_inc_lru_refs(), and now triggers a debug WARN when called
> > > while MGLRU is fully on (the switching window is exempt, as the
> > > classical paths legitimately run alongside MGLRU then).  The one
> > > PageWorkingset() user in erofs is converted to the folio helper.
> > >
> > > Under the classical LRU the refs count is not maintained, so the
> > > test is equivalent to the PG_workingset bit test, which is the old
> > > behavior.
> > >
> > > Tested-by: Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>
> > > Signed-off-by: Kairui Song <kasong@tencent.com>
> > > ---
>
> ...
>
> > > +/*
> > > + * For the classical LRU only: with MGLRU the PG_workingset bit is
> > > + * part of the folio refs count maintained by folio_inc_lru_refs(),
> > > + * and a raw set would corrupt it.  The switching window is exempt
> > > + * because the classical paths legitimately run alongside MGLRU then=
.
> > > + */
> > > +static __always_inline void folio_set_workingset(struct folio *folio=
)
> > > +{
> > > +       VM_WARN_ON_ONCE(lru_gen_enabled() && !lru_gen_switching());
> >
> > Could shrink_active_list() still hit this WARN after the switch
> > to MGLRU completes? It can reschedule after isolating folios and
> > reach this setter after lru_switch is cleared.
>
> Hi Kunwu, thanks for the very careful review!
>
> Right I thought a lot about it after your reply, first your concern
> is right, thanks! I should just remove and replace this WARN with
> something else.
>
> And in theory, we should only call this for isolated folio (for CLRU
> it means a folio moving out of active workingset, isolation is always
> the first step), so this helper is fine - except, for the MADV cold
> case, it will call it on for a on-list folio, and will could skew
> the counter and if it raced with switching. Switching is so painful
> I hope we can get rid of it soon :/
>
> But, good thing is it's easy to fix, we just need (part of this belong
> to another patch, a trimmed diff just for reference):
>
> diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> index 4f65867446dc..c936d1fadfbd 100644
> --- a/include/linux/mm_inline.h
> +++ b/include/linux/mm_inline.h
> @@ -261,8 +262,9 @@ static inline void __folio_set_lru_refs(struct folio =
*folio, unsigned int refs)
>
>         do {
>                 new_flags =3D old_flags;
> -               VM_WARN_ON_ONCE(lru_get_gen_flags(old_flags) !=3D -1);
>                 lru_set_refs_flags(&new_flags, refs);
> +               if (lru_get_gen_flags(old_flags) !=3D -1)
> +                       break;
>                 if (new_flags =3D=3D old_flags)
>                         break;
>         } while (!try_cmpxchg(folio_flags(folio, 0), &old_flags, new_flag=
s));
> @@ -569,16 +571,16 @@ static inline void folio_clear_lru_refs(struct foli=
o *folio)
>   */
>  static __always_inline void folio_set_workingset(struct folio *folio)
>  {
> -       VM_WARN_ON_ONCE(lru_gen_enabled() && !lru_gen_switching());
> -       set_bit(PG_workingset, folio_flags(folio, FOLIO_HEAD_PAGE));
> +       unsigned long flags;
> +
> +       flags =3D set_mask_bits(folio_flags(folio, 0), BIT(PG_workingset)=
,
> +                             BIT(PG_workingset));
> +       VM_WARN_ON_ONCE(lru_get_gen_flags(flags) !=3D -1);
>  }
>
>  static __always_inline
> diff --git a/mm/madvise.c b/mm/madvise.c
> index bbbb729ed647..a73d89a2ecca 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -374,11 +374,12 @@ static void madvise_cold_prep_folio(struct folio *f=
olio)
>          * as a workingset refault, and the referenced bit always needs t=
o
>          * be cleared even for inactive folios. For MGLRU, MADV_COLD clea=
rs
>          * refs in folio_deactivate(); MADV_PAGEOUT handles refs after is=
olation.
>          */
>         if (!lru_gen_enabled()) {
>                 folio_clear_lru_refs(folio);
>                 if (folio_test_active(folio))
> -                       folio_set_workingset(folio);
> +                       __folio_set_lru_refs(folio, LRU_REFS_WORKINGSET);
>         }
>  }

Thanks, Kairui. That covers the shrink_active_list() case I was
worried about. With these changes folded into v5, feel free to
add my tag to 17/17.

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
