Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795163761;
	b=JbdfXWSOnAuRFwjrN2YFh9Rxxn2C6uYapokjDSr7YiGnXW1/9b/EcMrc/FZVzpyoRlhs
	 2nKu5LIk/ea1NEarF91yA1rM/H3NATT5Q7nkYpbo66RlXXpcM/K39S3ouuxPaR5ejoFSB
	 KYd2aiwO12CNOLyGqjBXg95d5MlkZJYYkGnIs6ue452mADksmXG3ebpsnTrBNefz2WdHi
	 a5OrfFFJtGIlW4uQhENbTX1R3x0A1bl6e/g0hBCf/6cvZEDlcaM+jSsN28jD4uv3WTzf8
	 sOcLr8jWOo4dLpwy1AjRfiopKkwISSE4x3OqUV10tb9kmoVpkgb+JF7bPg0noNGRDWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DSuUtXGnjpMqHENNRIfD4nz00o+v1iSCypFww/wg4kA=;
	b=HSgVHYKyqJcn1MVwgcXrEL6eMtHbKO2bOegTEWqRqLq2rb1fTUbl6t4reH2f9TKMGBH1
	 CXV252zuBLtli/d18e2133w8qYc3JUIQTOcPRocdsDxwZnw4ldqqwcjC5S7mFNJc5qoEV
	 VRXC1PoBujfWXE0QNY+BKSSjArUh7ZBgiPLherofe/NjAzwDdDIfuewhkiqpi4NcWv2/L
	 uEy+ixlOBXj0Uv58G6LyhU/NYnT5acA8n43lEx5dvB1DnnWImQRcgwkZTmXk52HYV+oNm
	 D4zzCOB7EfLAWMmajq5HpDwomMpFHbslOwiYyk25x1/EECMYahIXmZf4sZDnNdlwLtA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HnIvXDKy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD48D606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD48D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HnIvXDKy
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b8a2518f7cso737495a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:36:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795163759; cv=none;
        d=google.com; s=arc-20260327;
        b=efinFCM2wSLnh9eaGNLxUg4NTDF6dZVzMrQXIYsngDPDcAbA4KemzlLZlrseykSbUq
         jZh5mSlSmlniqBdM7F+7jE9yewyXIAVFz6L4Z77Zwtgu+XZwCTHz+wCMLmqW+Fr4NTN+
         8VnlfFJyQPvtILvtQPsGyEx+L/B2JAe0jhTvz3eK4paZuJ1x1rbf+zZxV7CcpnY0cChu
         dM5J6iy9ax0xv26mYh2GysQE1p/tmvaPMxiXebYNT0lDchnqFlXcQYcXBlNqXigKLiKq
         n4FsLo2JR1WSJ1KshJyHMnVo/axk6sHDxRohdNY3q9y6gbSZUvg+j26a3LBp185su1Hv
         M/hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DSuUtXGnjpMqHENNRIfD4nz00o+v1iSCypFww/wg4kA=;
        fh=g0wHtPn9seQJQ/cCaCatRuWAJaBBqM9dS4ukkhuHtCA=;
        b=EfDQXfTBdf/J31gvLctcEpr7/Ifv3c/ty3LnVLD6ODGtZQd7pLeojAaQp/+FcWpbyA
         pbR2A/M4jAxRPHp5U8l+Z8iPzfB/VefgAPrJg22GEsffZdK+pXGnuIU40Rx4eT3zcJ5l
         wlTVahFiHPhIIWiz5yksPTrWcl9kwtBAA8JI45YPc36adJCMAvx8OYSafM9BASf35P2f
         7kQFvw0TguynTTacgCv7zfN/Spdp7O7hVL4Q+/yHk4Gg5vra2yEevddfoquK1eX5Imcf
         VGRJEUQkFzT+nyp3Fz1YtpPO4qPydE54QjUApQDWEnJF2IwCT57emDHWFwhlGwtH2U8a
         uGRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795163759; x=1795768559; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DSuUtXGnjpMqHENNRIfD4nz00o+v1iSCypFww/wg4kA=;
        b=HnIvXDKyzH4JiePmNccI5gCzaP0sZv16UqMoTav9WMqv1SSDqPACZ7kJfHNCoD5ear
         jK7cJN7E42L5M4IrQDHprzQZ393zAttFTXlCdoBuUnzCBKj50B4+u75KBIkmEhdC4YFE
         4OyC0lk7Z16Bfg5PodWjYD8mZ+xUTRHfmVWZt37I/y8fRu1EQSfUWi11K9gyHnchHtrJ
         7XhMWozeO8QeG10mLJblq1tgQz9Wa/zJolBY4rdI2lZ/ZZ8wZRjwS+fY8F5UY4mCEeb3
         0sDk6t/6942QJJCdKopHs0KBmRiGQrs0j28UPiLPzFb3tfykx0Ht/4lWb9Hbvg39ylrW
         0COQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795163759; x=1795768559;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DSuUtXGnjpMqHENNRIfD4nz00o+v1iSCypFww/wg4kA=;
        b=VwPZvXQjk8s2o89+JhFlPQ7S0lXs+URvpVhcZViQNAQJXKTnDQCY+HrPFCvGkM468g
         IXfZLfGeV69vPvSWlhn6YQ3oUr2cKcqtWpGInwfrDezVHP/nohDbGcasSvyJA46blp53
         CiAx0IZC0PtmDVP869o+w8dxdQc0ZL6U3KHTsG9ZZaCzv2Nx95wtVMNZ0rJzcsZt45nu
         Rt3SCa+TTjz6FYdu4din0PMym9wPj8vpLFCbYXTWN684kGtCs/lJA4QH7/CqUSN/ENQM
         JWza1Q3Y6CTAUEYt8pICuJ6S78DNACobSxxqi1n52p2OSHrtpYTLWtOkyK+p0n2ZJh/g
         aYvg==
X-Forwarded-Encrypted: i=1; AL+hErE0dEXqfzIs4oq9l1iUelWVgF3ToagOeRbjyvdrvlQ+zDuCZy8OaMODg7hC7rxSXIBVJT37WTPeEiFHsj8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9aEr23Tf3rQdMGvqRMLwUkYdsUdeA05PuPZwHa7kDOjYgteeFT
	lFU5lJaJVS6SzoYcEXjA0D4RbwqTOX1iYXOoLmyRPo5JDzkC5Wnk+UNVQQ1P+nx8XF8nbMC7nkD
	lEXM7SPdqK0bRlQLzeA0oGxKWaP6uQIs=
X-Gm-Gg: AZFdTZc+qMxMHCA94ONh67D5Xf3d2luM9zUVbIQ5UvpmkJH0tv8VDQDPQdmPD+x09d+
	GTzJIC9w50m4xC0Vqp4ktu7OLtUWVQR4nuqZrVWTqCTPBfoknqrueYUKe2Rlf3FxCw8KcvS9DpS
	3oJa2ghd1whMJtT9Dwysj/AgbD1t+79/OoLsmqufekOQPQwa+cgYuFDr61xfgUfwFjCGRHrwv1K
	f7ff/DZC/oSThnAcQZstBPfIhrvi5FMMTnIN0u6VrC1uFqVt5cXdQ9PuG8RTTQMGYZg5l7CKwfB
	MZS1Kw0CbjIsopo8L+Ynz+6gmYt9IT/L2imAnZvPLEW6h2wyKyHB5HKMJVD7X/Ph8sgkgU5w//L
	pvOUC1TbdOSNIC83mssOQMeGdRR/7BXM4DLGlRYx100JjpEoA3q0sZGQ4yG+e6Scm5Q==
X-Received: by 2002:a05:6402:454d:b0:6b6:fec8:d0a8 with SMTP id
 4fb4d7f45d1cf-6ba37ece7b4mr1180315a12.43.1795163758738; Fri, 20 Nov 2026
 00:35:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com> <20261119-mglru-fg-v5-13-9eee2fe97a2d@tencent.com>
In-Reply-To: <20261119-mglru-fg-v5-13-9eee2fe97a2d@tencent.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 20 Nov 2026 16:35:45 +0800
X-Gm-Features: AclHuK-_GFG5PkAWFBgYarA_ZH8s5VuYTvaSRhCd3qxcRhatbnu155-OV8JZlEE
Message-ID: <CAN_Opa9WKYNXyuJDixgbCzW-yWYXuoBTujSA_SWeQLzQzp_26w@mail.gmail.com>
Subject: Re: [PATCH v5 13/17] mm/madvise: adapt for LRU refs based operations
 for MGLRU
To: kasong@tencent.com
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Muchun Song <muchun.song@linux.dev>, 
	Qi Zheng <qi.zheng@linux.dev>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Chris Li <chrisl@kernel.org>, Baoquan He <baoquan.he@linux.dev>, 
	Nico Pache <nico.pache@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Barry Song <baohua@kernel.org>, 
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
	Kairui Song <ryncsn@gmail.com>, Xiang Liu <liuxiang.277@bytedance.com>, 
	Ehab Ababneh <ehab.ababneh@intel.com>, Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>, 
	Lian Wang <lianux.mm@gmail.com>, Joanne Koong <joannelkoong@gmail.com>, 
	Hui Zhu <hui.zhu@linux.dev>, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	damon@lists.linux.dev, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 5:03=E2=80=AFAM Kairui Song via B4 Relay
<devnull+kasong.tencent.com@kernel.org> wrote:
>
> From: Kairui Song <kasong@tencent.com>
>
> For the active/inactive LRU, madvise clears PG_referenced so that one mor=
e
> access is not enough to reactivate a folio, and keeps PG_workingset on a
> folio demoted out of the active list so its refault is still accounted as
> a workingset refault (PSI).
>
> MGLRU keeps that history in the folio's refs count instead, which now
> lives in PG_referenced, PG_workingset and LRU_REFS_MASK, so writing to
> those bits directly corrupts the count. The two hints want different
> things:
>
> - MADV_COLD resets the count in folio_deactivate(), which also requests
>   deactivation.
> - MADV_PAGEOUT clears non-workingset refs and caps the rest at
>   LRU_REFS_WORKINGSET after isolation, before handing the folio to
>   reclaim_pages(). The hint marks the folio as cold, so the
>   eviction shadow records the capped count and does not inflate the
>   eviction/refault counters of the hot tiers that drive aging, while
>   folios at or above the workingset threshold keep their PSI
>   classification.
>
> PG_young is cleared for both LRUs as before, so the referenced walk does
> not count stale history as a recent access.
>
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>  mm/madvise.c | 54 ++++++++++++++++++++++++++++++++++++++++--------------
>  1 file changed, 40 insertions(+), 14 deletions(-)
>
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 2d54cb9863ea..7486c492f437 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -360,6 +360,42 @@ static inline int madvise_folio_pte_batch(unsigned l=
ong addr, unsigned long end,
>                                      FPB_MERGE_YOUNG_DIRTY);
>  }
>
> +static void madvise_cold_prep_folio(struct folio *folio)
> +{
> +       /*
> +        * VM couldn't reclaim the folio unless we clear PG_young.
> +        * As a side effect, idle-page tracking loses recent referenced h=
istory.
> +        */
> +       folio_test_clear_young(folio);
> +
> +       /*
> +        * For the active/inactive LRU, a folio demoted out of the active
> +        * list should have PG_workingset so its refault is still account=
ed
> +        * as a workingset refault, and the referenced bit always needs t=
o
> +        * be cleared even for inactive folios. For MGLRU, MADV_COLD clea=
rs
> +        * refs in folio_deactivate(); MADV_PAGEOUT handles refs after is=
olation.
> +        */
> +       if (!lru_gen_enabled()) {
> +               folio_clear_referenced(folio);
> +               if (folio_test_active(folio))
> +                       folio_set_workingset(folio);
> +       }
> +}
> +
> +static void madvise_pageout_prep_folio(struct folio *folio)
> +{
> +       unsigned int refs =3D folio_lru_refs(folio);
> +
> +       /*
> +        * For MGLRU, clear refs below LRU_REFS_WORKINGSET and cap
> +        * the rest at it: MADV suggests the folio is cold, so the evicti=
on shadow
> +        * should not record its hotness in the high tier counters, but
> +        * the workingset classification is preserved for PSI.
> +        */
> +       if (lru_gen_enabled())
> +               folio_set_lru_refs(folio, refs >=3D LRU_REFS_WORKINGSET ?=
 LRU_REFS_WORKINGSET : 0);
> +}
> +
>  static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
>                                 unsigned long addr, unsigned long end,
>                                 struct mm_walk *walk)
> @@ -434,12 +470,10 @@ static int madvise_cold_or_pageout_pte_range(pmd_t =
*pmd,
>                         tlb_remove_pmd_tlb_entry(tlb, pmd, addr);
>                 }
>
> -               folio_clear_referenced(folio);
> -               folio_test_clear_young(folio);
> -               if (folio_test_active(folio))
> -                       folio_set_workingset(folio);
> +               madvise_cold_prep_folio(folio);
>                 if (pageout) {
>                         if (folio_isolate_lru(folio)) {
> +                               madvise_pageout_prep_folio(folio);
>                                 if (folio_test_unevictable(folio))
>                                         folio_putback_lru(folio);
>                                 else
> @@ -544,18 +578,10 @@ static int madvise_cold_or_pageout_pte_range(pmd_t =
*pmd,
>                         tlb_remove_tlb_entries(tlb, pte, nr, addr);
>                 }
>
> -               /*
> -                * We are deactivating a folio for accelerating reclaimin=
g.
> -                * VM couldn't reclaim the folio unless we clear PG_young=
.
> -                * As a side effect, it makes confuse idle-page tracking
> -                * because they will miss recent referenced history.
> -                */
> -               folio_clear_referenced(folio);
> -               folio_test_clear_young(folio);
> -               if (folio_test_active(folio))
> -                       folio_set_workingset(folio);
> +               madvise_cold_prep_folio(folio);
>                 if (pageout) {
>                         if (folio_isolate_lru(folio)) {
> +                               madvise_pageout_prep_folio(folio);
>                                 if (folio_test_unevictable(folio))
>                                         folio_putback_lru(folio);
>                                 else
>
> --
> 2.56.1
>
>

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>

Thanks,
Kunwu
