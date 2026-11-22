Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795319919;
	b=S5FiSZDjr8DGIeLikcj7BPwoOHEq38hzytzyEyiMwZULGE9Iaq2kDYAcVQ2TehVlZrZz
	 Gm/jfnOcRJZOy8SUdPT6iKUiB8wlBy0/0oU4rZJ0zMEx8UeGM1Qvibz2aCUtDUmz465ts
	 tC2DwVX9XvN9g9Oa0wuvzh7FOQApC65NZAtPpx2nsnyqXKPE+MF9EPVxnjrG1BlKxJAj/
	 kJkQI4Ppyquv16N7u4grfmtyWNOxWMAy5UAKlb9yO+UYi1mgspEPrKom4xgV80V2Sr7qa
	 xgsOmRAj7qQCoIDtYZfH4wucBmb5GY31sQP1VF1verCk9bPKDy463DSegKoPwyiTzOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795319919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=U6lDo04XbaVHnGHBXBgBBEvTruBmRJrwphZdUWl/Gp8=;
	b=YslaSLuwKKvuRVnXWDcF1/U1QXau8bQtg4nuNr11rLMMHtE0Kc/ygD3lMWA68iLDAwg1
	 lv2g7dZAQsD/oDl7X885WhJtzX5sBGwY90Q6KcApAamkmQiXTpWAu75dZWrsrYu0rZ2M0
	 RtPtpUWMSHLvH4OjBxnVhua2U03YPxy4q27LptjrZF0gT541A41T0Z7c26m813XWz4s6m
	 bidJdy9B5Tlbh8DCeYXb9u2bRAd92Sog+O9LuK3sIj6l5YGrPITBkCYLw6rwcs2wpBm+u
	 WMtsxRDg9D7pMYj2/Wi4+j+jP1q/Yvu8i3v5VDLYmxfrQsn3PHoh+2dcg9nvjwl8/Fg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mQ9RvumY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52980606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 03:58:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52980606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mQ9RvumY
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-54492d8a988so217241cf.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 19:58:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795319918; cv=none;
        d=google.com; s=arc-20260327;
        b=GdboKDPqA6SXGArLK3iOK9enUM3msws5LrKqduztbPnJvsXfUa780v7wJM/tKMc6Uc
         vcTZ/WyqEQMGbL0HbyRKjniGrNAqKbvzjMPjXgangaIohWob+jxGuWQ794J8jBLuk/j7
         3A2s3Tx9qb4vXn/1N5jnValnQpGdUNlVwKlcWm6WbwNtkH64N5SZ1+mvok8w4rP+ynwK
         g0LGFepd+7JX8Sm8MYsMki4aDvJdLBRVAhWHaOJ2dvFIHXfeqQgfnNjWsyYk49g3T9IE
         rKfFBKv28P4v0xkxEFSlLbMH94+zyrqVyv5NEFnAl2/xqeqLk82KCbGTZxOApZ5A+cFW
         a7ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U6lDo04XbaVHnGHBXBgBBEvTruBmRJrwphZdUWl/Gp8=;
        fh=NV7oEkl5mmpC3/qer6BlUI1q11RWahOLW4n/7fuTyQI=;
        b=emrrWTAj4Wq8zH+uUsINHmMcg5CEDP6cA3hMtcqS5EgwsX6wMl4Gx/l6ew40cmiuX1
         khc08lP56XHv1KaFYrc3GCqcNmr4OTa8AiX0k1eTQ4MXzDfdmfLCjHtwnqujv60/usHH
         EdQ0xZThbI+e03uwo+JGQwFcdLyVKeLZhdp3YHAv6Ue38eu1PO5Y2v8w0u2CZCAKvxNV
         SdKKVGS2flEvr0uVMFoOlcETqPgHjK+a2i4A3ZaC7J+3ZHxT1p5WSS5/41QekHe8348b
         1HNu8IqSgjnOxwR4A0wiINPLEQvUliFjjhglfJsem2a21ND8qzaHLOjZPZkhMe63PjGD
         xKow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795319918; x=1795924718; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U6lDo04XbaVHnGHBXBgBBEvTruBmRJrwphZdUWl/Gp8=;
        b=mQ9RvumYF/Rikv1b5e2gYOaEJU/5I3fdg2+COA2uuuIqTkdJoJqH+45X74S+hCXA9d
         E68ycSV+EQV3k4i4uAhzx93PNAygXyS8GlI50cy6VTqg9U4UpSQD0fO9WkTnlyXNIgcx
         foAucXl1xcyCQded6H4uEZmUtENKjfkuS6mIxJiMiJA7YPaWkoluZnj0WJl7rlpDbxWN
         1aEPFxt/zdaKPGlB3PttJol1Rexo7H90BazZc9pkZvpedpfyGvwPfStzPQtNJek+m1rV
         ZeF76ShtcWiz8L8wKG1bKhnA62F8TfQorCeOVbVho3sz6JUAh9dCKRDzlgv2PVdlaCpt
         eIww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795319918; x=1795924718;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U6lDo04XbaVHnGHBXBgBBEvTruBmRJrwphZdUWl/Gp8=;
        b=RVTUqcK0az+II7FnPNNNlvVTCn/ATzWk8xD1A2sa79I1O55JI0oHOSSG2/+lluotSm
         MXLi7H48C5mzwSRFL3FIxED3AXfufmU0iwpAOisEcDfTVmZI8wLVwGLsPc+f9WBCpiOa
         nz7P+jP4P11NA1qc2q0rCHbpn4vPVGjV8XxkFensOC003Z1ChTWFIrpCQW697SucYv3k
         nt6CINEj3UULF+/ssulBnJ1YzBmr451DnbRXv7mU0j3gsO3YzNKuaYG3kAQ0lkjMzz09
         u4DtFtP0JAt2q/Ugyjv6wR/eoqvhG77vcWu37FC2Gquw5/GEJQc2+orhzYKDIvIjds0r
         8V4A==
X-Forwarded-Encrypted: i=1; AL+hErGohhMdH+DQl0eeFtzrImL+rqXboxWHDuj6YIYXyvEstCbRGjVmMbseeP/qd8B8+YKBTbYL9H/7SpjvFRM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Neo2lwLm5YxVoAz+bdMGcLawoihPHqTG4XSlvGEaIFUrRVaK6
	HQvixGQ/kI11KXc3JaoLTWWKael7eAMvNjx726U5CyG90vjDSBn5oWINxFBlggg6yPRYNtW90fi
	sgBLUk1uNHL0JlVvHnNDSaMl8EvNmLvzE/fBT0A0y
X-Gm-Gg: AZFdTZewhU83D8kOUw9UDMktNGv7wlJLo7zd7WbiXS0llnuAvKnxO+gS1upvxc41c/y
	rQRaJfSF6f/VJ8wy11ayWg04KJSNY8v0ya7VBUN+FrKIgorBvyzBUOKXKU060Dt2ABS5kMjUYGk
	kteKXvwEs1TUo3VOncl/zqpONi1XtJu7p1Deu8mPRoR5ohmBFzXEDLwjWZRsto4JDJpP09ji+Ed
	eOl2tttAXbZJTU3epEShIVj7DohO6TWjYxKZJ1lajeEvWpg2DJpJ/fsO+Q+jdB/4glCwQ+zO2Az
	oOSBDokttedXeqkvQwretU1oIZ+7Tf9RSrBA9V0j6fngP2zIJfxxAmpllDadMkMFrO3BLzLyYe1
	4hdomEP53iU6VYd3ChgvXRtH7p9I87q+4/D1CpCpE3kP9xdlbhLBFJxNMeHRiXalNt0MWM+g=
X-Received: by 2002:a05:622a:4010:b0:532:9220:a9ae with SMTP id
 d75a77b69052e-55d8818abdbmr18248231cf.6.1795319917430; Sat, 21 Nov 2026
 19:58:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116071325.263682-1-hao.ge@linux.dev> <20261116071325.263682-8-hao.ge@linux.dev>
In-Reply-To: <20261116071325.263682-8-hao.ge@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sat, 21 Nov 2026 19:58:26 -0800
X-Gm-Features: Aa3M54oUVu1y1QdsMhiWrEo5U1kKt_0hi7a4znXOHdNoNhlvmsvMEXTR-bBBo9A
Message-ID: <CAJuCfpFvA5oqop2tovy33fKydx7n8Sm=X-hE0sJxpcR1gg5hMA@mail.gmail.com>
Subject: Re: [PATCH v5 07/11] mm/vmalloc: undo what __vmap_pages_range_noflush()
 mapped on failure
To: Hao Ge <hao.ge@linux.dev>
Cc: Uladzislau Rezki <urezki@gmail.com>, Dev Jain <dev.jain@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Alexander Potapenko <glider@google.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 11:14=E2=80=AFPM Hao Ge <hao.ge@linux.dev> wrote:
>
> __vmap_pages_range_noflush() maps a struct page array and may fail
> half way. The ptes installed so far stay behind, so a retry of the
> same range, the __GFP_NOFAIL loop in __vmalloc_area_node() or the
> module tags populate, trips the WARN_ON(!pte_none()) in
> vmap_pages_pte_range() and fails with -EBUSY.
>
> vmap_pages_range_noflush_walk() now reports how many pages it
> installed through its running index into the pages array, and
> __vmap_pages_range_noflush() undoes [addr, addr + mapped_pages *
> PAGE_SIZE) on failure. vmap_pages_pte_range() fails with -EBUSY
> instead of installing over a pte that is already set, so the ptes
> below that point are all ours, while a pte above it can only have
> been put there by somebody else, for example when the caller's range
> overlaps an existing mapping. Going further would clear ptes that
> are not ours.
>
> This path can run with a non-blocking gfp mask, the undo passes
> gfpflags_allow_blocking() as can_resched.
>
> Suggested-by: Suren Baghdasaryan <surenb@google.com>
> Suggested-by: Uladzislau Rezki <urezki@gmail.com>
> Signed-off-by: Hao Ge <hao.ge@linux.dev>
> ---
>  mm/kmsan/hooks.c  |  4 ++--
>  mm/kmsan/shadow.c |  4 ++--
>  mm/vmalloc.c      | 36 +++++++++++++++++++++++++++++-------
>  mm/vmalloc.h      |  3 ++-
>  4 files changed, 35 insertions(+), 12 deletions(-)
>
> diff --git a/mm/kmsan/hooks.c b/mm/kmsan/hooks.c
> index 69008b085658..d830a4e649f1 100644
> --- a/mm/kmsan/hooks.c
> +++ b/mm/kmsan/hooks.c
> @@ -208,7 +208,7 @@ int kmsan_ioremap_page_range(unsigned long start, uns=
igned long end,
>                 mapped =3D __vmap_pages_range_noflush(
>                         vmalloc_shadow(start + off),
>                         vmalloc_shadow(start + off + PAGE_SIZE), prot, &s=
hadow,
> -                       PAGE_SHIFT);
> +                       PAGE_SHIFT, gfp_mask);
>                 if (mapped) {
>                         err =3D mapped;
>                         goto ret;
> @@ -218,7 +218,7 @@ int kmsan_ioremap_page_range(unsigned long start, uns=
igned long end,
>                 mapped =3D __vmap_pages_range_noflush(
>                         vmalloc_origin(start + off),
>                         vmalloc_origin(start + off + PAGE_SIZE), prot, &o=
rigin,
> -                       PAGE_SHIFT);
> +                       PAGE_SHIFT, gfp_mask);
>                 if (mapped) {
>                         err =3D mapped;
>                         goto ret;
> diff --git a/mm/kmsan/shadow.c b/mm/kmsan/shadow.c
> index 212449db34a1..452760a333e4 100644
> --- a/mm/kmsan/shadow.c
> +++ b/mm/kmsan/shadow.c
> @@ -247,7 +247,7 @@ int kmsan_vmap_pages_range_noflush(unsigned long star=
t, unsigned long end,
>         origin_end =3D vmalloc_meta((void *)end, KMSAN_META_ORIGIN);
>         kmsan_enter_runtime();
>         mapped =3D __vmap_pages_range_noflush(shadow_start, shadow_end, p=
rot,
> -                                           s_pages, page_shift);
> +                                           s_pages, page_shift, gfp_mask=
);
>         kmsan_leave_runtime();
>         if (mapped) {
>                 err =3D mapped;
> @@ -255,7 +255,7 @@ int kmsan_vmap_pages_range_noflush(unsigned long star=
t, unsigned long end,
>         }
>         kmsan_enter_runtime();
>         mapped =3D __vmap_pages_range_noflush(origin_start, origin_end, p=
rot,
> -                                           o_pages, page_shift);
> +                                           o_pages, page_shift, gfp_mask=
);
>         kmsan_leave_runtime();
>         if (mapped) {
>                 /* Undo the shadow mapping set up above. */
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 5c1eacc2a0ac..4f3c320a4849 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -725,7 +725,8 @@ static int vmap_pages_p4d_range(pgd_t *pgd, unsigned =
long addr,
>   * may have contiguous chunks, as hinted by @shift.
>   */
>  static int vmap_pages_range_noflush_walk(unsigned long addr, unsigned lo=
ng end,
> -               pgprot_t prot, struct page **pages, unsigned int shift)
> +               pgprot_t prot, struct page **pages, unsigned int shift,
> +               unsigned int *mapped_pages)
>  {
>         unsigned long start =3D addr;
>         pgd_t *pgd;
> @@ -748,6 +749,7 @@ static int vmap_pages_range_noflush_walk(unsigned lon=
g addr, unsigned long end,
>         if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
>                 arch_sync_kernel_mappings(start, end);
>
> +       *mapped_pages =3D nr;
>         return err;
>  }
>
> @@ -758,18 +760,36 @@ static int vmap_pages_range_noflush_walk(unsigned l=
ong addr, unsigned long end,
>   * The caller is responsible for calling flush_cache_vmap() after this
>   * function returns successfully and before the addresses are accessed.
>   *
> + * On failure the PTEs installed by this call are torn down before
> + * returning, so a retry sees a clean range; PTEs that were already
> + * there when the walk failed are left alone. When @gfp_mask cannot
> + * block, the teardown skips cond_resched(), it may run in atomic
> + * context.
> + *
>   * This is an internal function only. Do not use outside mm/.
>   */
>  int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
> -               pgprot_t prot, struct page **pages, unsigned int page_shi=
ft)
> +               pgprot_t prot, struct page **pages, unsigned int page_shi=
ft,
> +               gfp_t gfp_mask)
>  {
> +       int err;
> +       unsigned int mapped_pages =3D 0;
> +
>         if (WARN_ON_ONCE(page_shift < PAGE_SHIFT))
>                 return -EINVAL;
>
>         if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC))
>                 page_shift =3D PAGE_SHIFT;
>
> -       return vmap_pages_range_noflush_walk(addr, end, prot, pages, page=
_shift);
> +       err =3D vmap_pages_range_noflush_walk(addr, end, prot, pages, pag=
e_shift,
> +                                           &mapped_pages);
> +
> +       /* Undo the PTEs installed before the failure. */
> +       if (err && mapped_pages)
> +               __vunmap_range_noflush(addr, addr + (mapped_pages * PAGE_=
SIZE),
> +                                      gfpflags_allow_blocking(gfp_mask))=
;
> +
> +       return err;
>  }
>
>  int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
> @@ -781,7 +801,8 @@ int vmap_pages_range_noflush(unsigned long addr, unsi=
gned long end,
>
>         if (ret)
>                 return ret;
> -       return __vmap_pages_range_noflush(addr, end, prot, pages, page_sh=
ift);
> +       return __vmap_pages_range_noflush(addr, end, prot, pages, page_sh=
ift,
> +                                         gfp_mask);
>  }
>
>  static int __vmap_pages_range(unsigned long addr, unsigned long end,
> @@ -3715,7 +3736,7 @@ static int vmap_pages_range_batched(unsigned long a=
ddr, unsigned long end,
>                 pgprot_t prot, struct page **pages)
>  {
>         const unsigned int nr_pages =3D (end - addr) >> PAGE_SHIFT;
> -       unsigned int prev_shift =3D 0, batch_idx =3D 0;
> +       unsigned int prev_shift =3D 0, batch_idx =3D 0, nr_mapped;
>         unsigned long batch_start =3D addr, batch_end =3D addr;
>         int err;
>
> @@ -3734,7 +3755,8 @@ static int vmap_pages_range_batched(unsigned long a=
ddr, unsigned long end,
>
>                 if (shift !=3D prev_shift) {
>                         err =3D vmap_pages_range_noflush_walk(batch_start=
, batch_end,
> -                                       prot, pages + batch_idx, prev_shi=
ft);
> +                                       prot, pages + batch_idx, prev_shi=
ft,
> +                                       &nr_mapped);
>                         if (err)
>                                 goto out;
>                         prev_shift =3D shift;
> @@ -3756,7 +3778,7 @@ static int vmap_pages_range_batched(unsigned long a=
ddr, unsigned long end,
>         /* Remaining */
>         if (batch_start < end)
>                 err =3D vmap_pages_range_noflush_walk(batch_start, end, p=
rot,
> -                               pages + batch_idx, prev_shift);
> +                               pages + batch_idx, prev_shift, &nr_mapped=
);
>
>  out:
>         if (!err)

So, you are recording nr_mapped but not undoing
vmap_pages_range_batched() partial mappings yet. You do that in patch
#9. It's weird to fix one place but leave the other one until later. I
would suggest merging patches 7 and 9 to have a complete fix.

> diff --git a/mm/vmalloc.h b/mm/vmalloc.h
> index 4ec114a75f04..9ea28845f713 100644
> --- a/mm/vmalloc.h
> +++ b/mm/vmalloc.h
> @@ -40,7 +40,8 @@ void clear_vm_uninitialized_flag(struct vm_struct *vm);
>
>  int __must_check __vmap_pages_range_noflush(unsigned long addr,
>                 unsigned long end, pgprot_t prot,
> -               struct page **pages, unsigned int page_shift);
> +               struct page **pages, unsigned int page_shift,
> +               gfp_t gfp_mask);
>
>  void vunmap_range_noflush(unsigned long start, unsigned long end);
>
> --
> 2.25.1
>
