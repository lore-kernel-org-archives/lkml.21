Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795162888;
	b=iNKPIn/vC8IJbZvRBT2iRcpMqX9SKs3mBgba2Gj5jzmWwR0sbSWvKPZU08SMaK2hUF4h
	 3Fwf+U6hkX8XunMr7wwP17l7EbqiFVW+bl08kbgkM4rHHd0jdkGL+7rWFnwj902LaN+c/
	 DpDB7OuI/WIs1Sxht/9z9NTThei4/Yw8me5TgN0VStPpGMVildueA1SK7An8I3eSUNDa4
	 K7XgANSQDElQW9BOeffAFyG7HACAgNuZIEXJiriU4Si29ahXOC7yMBSVqNNxd3Lh3IUaY
	 21w4cNLS7j7TvLUuxmg8eJXaG8pkyuTVFR+yUFjFN1M0FcgQ5y/XMpkTY4xaSxz0sSg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=uOP5aWJGRtaVMkdWmgxTwssrKgIM3MZe/XfpLaSpJSg=;
	b=HvFl/LrOE9OBGMPCP3cjK5J0DCNAXZMnVhmuxvUmuX+UyRdnnvIriqFec2kSQwthq3xp
	 NamBPlYdjJTi9+tc/x54bagknlEqiDMvC+Mu8myBPQFTJunGXbDG2bRuxkDFzpFKc1mN4
	 rSUk8UrqfzuWEEB+04dzpobiKxlvrBEX6lZlRj2pS7WzNVsN+u+IWrfb6boE+PdfWSc4D
	 Q4xj6zy2Nhom+GUFR89qBI3kCjHDq7AT6kGqAmgc5pd2eve3ir5w9n/4ynHHVXCLe3tyu
	 ByqzWK9AJxcB61VxsUTJIYtdRE7c910nsg8U0FFl9IYRQ/CCz1iB74BQ9MMdMUIprnQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hpMvuF7a;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42216606A339
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:21:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42216606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hpMvuF7a
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b596afb4c5so678441a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:21:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795162883; cv=none;
        d=google.com; s=arc-20260327;
        b=TBQpPHNr7wUL8WwmG70SX6O8y/+iqnd65ADllqAC9wwaTYxJurga876MjnMuHtq3Pp
         BLvbP9SQ8hx1Rv7GD3ooUVe+12Ffi6h5PntCbIUlQwIX+1GS+gAtqKCrf0Qvtg3uO9Hb
         xlxaDl/46s71m9BDEG8NlaSTzL+CszrEeXMIsq8uTDJxmNRF4lAeJJT8Q64L6UmjK4Vo
         gnKxM7dBP4WWW1Q34AilBIt9vK6a04CPgHzlLfTbKBRauiZsT92h1FOw7IuI/6DPSiNE
         v3ukMQiQPxWjVIPnvJbVxIkLc0ErJ1gwpdgi09IZz0Ew6aAgLyJUQ4WhciRHDR79l/D0
         PDCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uOP5aWJGRtaVMkdWmgxTwssrKgIM3MZe/XfpLaSpJSg=;
        fh=6GR6M9LOzvGhe6ClAHtha1F7839PKziT+dl4bUo/3X0=;
        b=a2gMah1IvRcjvrMg6c4S2nzAgNApY1bd7z2/2mLe6bKVFmB37u5OV41q8pOLCyVZnG
         b365kPP2iI2mKQB9tH0ZK26104xZ7K69nIfLiBOy7SDjOQnJWe2rn/6TRg3id2+Dz0Td
         Q+szip9etOid3r1ZecMU6+XSYiNfZzoXHaabtX6fY23kZyQUsucfihL82jvBouRVAbbr
         OdmUFRBE6kDB+HFllEpcygTHNTvwvj8iBknehvC0i6f4wG2/er/Zj8C2OcsUJdajwvQS
         xGPkuSSpyOryHQ88zvpZKAj/qVYWJ+tOulVpbt6rP1mhoioMIGoYBiFEFiOOIstywR4z
         scwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795162883; x=1795767683; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uOP5aWJGRtaVMkdWmgxTwssrKgIM3MZe/XfpLaSpJSg=;
        b=hpMvuF7atQx5u/yCb3O+48tdu/pjRN681S7BaZGK1eaMeX0QKtN8tQ24Hkl4rjLYu3
         pkqLXW9ef+K8YJouQyaDlo7kmbPW/svFd47P4jhMu/XS7xAa/ngYdlnmC9wcRy5rBB7p
         Y3MjEzlDTDKOtOZ0p5S2UTl/SrNoZsPjK/sx5cSpSarua64saf9skOc9zh4cIyyHAkkl
         xkIBI8oHLQxNJDPb0SaHhHNnEpx8EhNqtdlSHVzD8lClpoENGPdJH7by3WfOwqjjycs6
         Ulk4wE2dD2QKXo7Q6P0gGEopVb5fRz/nbkVW88Z42MjOVO8sf0pR3tYtonISKnVcl7We
         7ldQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795162883; x=1795767683;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uOP5aWJGRtaVMkdWmgxTwssrKgIM3MZe/XfpLaSpJSg=;
        b=SVHnKBp9PDSp9wF4i0Rup1pn1TCCg/UTCNAKmtU1aElnauC3rB18km/KXSGeELseTc
         LBXcKbSjpJ9dy6+aRuSpf2rZfKb+rPHyW6n3xjOsSpsfSAe7BIRfiag/fVdAF9XDdbOD
         hFHm6QJhPWbfB428daRnl+Lx/LIZPU1yINieQ+vkYgGJPJbCHPHoeLlVUGfHkgG77r0l
         fCeq+HF7OSJJ4kidOwHF1Mnh0uI578zyg4S8eb9XAZk26HGghKaE3EJeb98sTaTgoUUb
         4wMWRNuSlpXcerpYIkLINzAP3mEedevmOoASYBayOvo0DSJJJ6Ndrzim9c7K+clOPPF2
         Bkbg==
X-Forwarded-Encrypted: i=1; AL+hErE3WOpCp0GbNKF2zXZYi3L45+ssqFo5fetvlZPa1hmzdiFMf2lC/h+AzIQsl4fJ5qh9oYLz/lW4tSPY37c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ThWhR41+MXrOY6nfuoG3hgwH65P5mTAZpbi7/rMZ4/jiLLY7c
	2vinr64HiUktmvGn30LGjGvx5llr7H6dtBV2Z+I9/kRBfpp6pb7KdgX1GuQh8oa4m95lEXcL1nh
	zmTcAP9+i4jNenrqhsokFhPeaun95MA8=
X-Gm-Gg: AZFdTZdC5FIhfwq/09Z82ShGgNP+R+sje3LCtAoDqGaP6DMIkOTIYe2gVqytRKEYE2i
	Al1F0PkvOJRDPeirubI2J4kvKoTUZVJOxomB+H760xjYzA+UmxZ6GY/iRDBFFa9sAoYLEux/trp
	NJnlt4S++EMncbQQUtvd0y5yHR+jfAmpGVZQH6SyWu1aTEjNDdNA9uDjjcoEXQYlYavgYPot57H
	1taoHwXK6FOk7AvYQZGR3jgCLTdQfLMEpnR6R9M+QzUbP1XrP/+R9C9+Hzr2JQia5CFvmgf2O0R
	vCGgV7t5BssRI7l7HdszprQzTekh6lXse323xZ4QuhYOnw2JktkP9Og1sC3hgHmN9Jgi+5ZP2dZ
	AHztY7tSiVoAIn+QMPXtFItP+FNPBEbGDUnLRihadz5TJZT65/GyZSIbHe8nRzYw=
X-Received: by 2002:a05:6402:46d1:b0:6b6:efc4:9ebf with SMTP id
 4fb4d7f45d1cf-6ba37ac75b5mr1331883a12.0.1795162882855; Fri, 20 Nov 2026
 00:21:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com> <20261119-mglru-fg-v5-10-9eee2fe97a2d@tencent.com>
In-Reply-To: <20261119-mglru-fg-v5-10-9eee2fe97a2d@tencent.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 20 Nov 2026 16:21:10 +0800
X-Gm-Features: Aa3M54pHysxbWD9vjPcsTe4RDZA-59shgtAMQxrcEcwNDlcrEAHTKKIWInyzYBE
Message-ID: <CAN_Opa-Nn_ps+x6gWkERRDWBXxt3Gqnwvfw_4rURaCdPiyTc2w@mail.gmail.com>
Subject: Re: [PATCH v5 10/17] mm/mglru, smaps: convert to LRU refs based
 operations for MGLRU
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
> PG_referenced is only the lowest bit of the folio LRU refs count
> (LRU_REFS_FLAGS) now, and MGLRU never kept it stable: promotion used to
> clear it, and now it toggles as the count grows. But with the LRU
> referenced count as a stable API now, we can use two helpers to provide
> in-kernel users a stable and sane reading of the referenced status of
> an LRU managed folio.
>
> Add folio_check_lru_refs() and folio_clear_lru_refs(), which use the refs
> count when MGLRU is enabled and PG_referenced otherwise, and switch the
> smaps paths over to them. The lru_gen_enabled() test stays inside the
> helpers, so its static key is not splattered over the few call sites.
>
> Convert smaps as the first user of them. MGLRU now reports every folio
> with a nonzero count, so the reading no longer flickers and clearing no
> longer results in an ambiguous status.
>
> The classical LRU case is unchanged.
>
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>  fs/proc/task_mmu.c        |  6 +++---
>  include/linux/mm_inline.h | 31 +++++++++++++++++++++++++++++++
>  2 files changed, 34 insertions(+), 3 deletions(-)
>
> diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> index 22361607020d..f76a37d052b1 100644
> --- a/fs/proc/task_mmu.c
> +++ b/fs/proc/task_mmu.c
> @@ -889,7 +889,7 @@ static void smaps_account(struct mem_size_stats *mss,=
 struct page *page,
>
>         mss->resident +=3D size;
>         /* Accumulate the size in pages that have been accessed. */
> -       if (young || folio_test_young(folio) || folio_test_referenced(fol=
io))
> +       if (young || folio_test_young(folio) || folio_check_lru_refs(foli=
o))
>                 mss->referenced +=3D size;
>
>         /*
> @@ -1686,7 +1686,7 @@ static int clear_refs_pte_range(pmd_t *pmd, unsigne=
d long addr,
>                 /* Clear accessed and referenced bits. */
>                 pmdp_test_and_clear_young(vma, addr, pmd);
>                 folio_test_clear_young(folio);
> -               folio_clear_referenced(folio);
> +               folio_clear_lru_refs(folio);
>  out:
>                 spin_unlock(ptl);
>                 return 0;
> @@ -1715,7 +1715,7 @@ static int clear_refs_pte_range(pmd_t *pmd, unsigne=
d long addr,
>                 /* Clear accessed and referenced bits. */
>                 ptep_test_and_clear_young(vma, addr, pte);
>                 folio_test_clear_young(folio);
> -               folio_clear_referenced(folio);
> +               folio_clear_lru_refs(folio);
>         }
>         pte_unmap_unlock(pte - 1, ptl);
>         cond_resched();
> diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> index 3323a3c7336b..14aab2b1ed08 100644
> --- a/include/linux/mm_inline.h
> +++ b/include/linux/mm_inline.h
> @@ -508,6 +508,37 @@ static __always_inline void folio_inc_lru_refs_fast(=
struct folio *folio)
>         } while (!try_cmpxchg(folio_flags(folio, 0), &old_flags, new_flag=
s));
>  }
>
> +/**
> + * folio_check_lru_refs - Test if an LRU managed folio has been referenc=
ed.
> + * @folio: The folio to test.
> + *
> + * Returns true if the MGLRU refs count is nonzero, or PG_referenced is =
set,
> + * which is also correct for the non-MGLRU case. Kept as a separate help=
er,
> + * to avoid splattering the lru_gen_enabled() static key.
> + */
> +static inline bool folio_check_lru_refs(const struct folio *folio)
> +{
> +       if (lru_gen_enabled())
> +               return folio_lru_refs(folio) > 0;
> +       return folio_test_referenced(folio);
> +}
> +
> +/**
> + * folio_clear_lru_refs - Clear the referenced state of an LRU managed f=
olio.
> + * @folio: The folio to clear.
> + *
> + * Reset the MGLRU refs count to zero, or clear PG_referenced, leaving
> + * PG_workingset alone for the non-MGLRU case. Kept as a separate helper
> + * just like folio_check_lru_refs().
> + */
> +static inline void folio_clear_lru_refs(struct folio *folio)
> +{
> +       if (lru_gen_enabled())
> +               folio_set_lru_refs(folio, 0);
> +       else
> +               folio_clear_referenced(folio);
> +}
> +
>  static __always_inline
>  void lruvec_add_folio(struct lruvec *lruvec, struct folio *folio)
>  {
>
> --
> 2.56.1
>
>

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>

Thanks,
Kunwu
