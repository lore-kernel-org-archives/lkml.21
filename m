Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795744932;
	b=bkz2f9q4lSoMt8ff+jnK+v5Js0ydlKn/xjZSBTOGLcReip3CJbzt66MH6fMS3OR7NgEP
	 bUet6mST3us4mH5XqkYtGStC/7NRqv3693CZ2WVAIk/YqSedwvwEz4G+f994h7EHkttXl
	 Z1O9QsiTKZHuttTa1CISSJDyoBi1/SYS9UyTzPmW+WTBCOuTfsiu+DDonMGlpmeDeQbJI
	 B9NbnRwaflsmMuOy1AC3kinHxonhiPmnod10azHUzEYJdUt0f4rRcD1ovYZECB+0ANQyC
	 Ntg8TfyyewS3gto+JCb13oQDcJtt9qlZZkgHZ0OPFimKGY1DaWqINfnkdpGg9i0Uh4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795744932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CD6edFGqmU8n4mTR3UtP0gostgp/pYDUUVhaESpICv4=;
	b=saG2LvMI93H8vlGxKNGt5bD85nhS95Np7nnnFwlBrk6nkqLYRRvOUo0GmJrCb7TOGf6N
	 seW6pHqVW2FZHfoqVd9t0PEHl1wuuOZi78DHY1TYRAMxHJHuPIEHB2kyi+b0mY8E4cA8j
	 fRjpcwJOYOa1E2yVq8SJkfNe/H6634L7nxflfPECOn0+j7E8nIJB4AaqIzPFgP9Xqlfkj
	 1OUey1CJVkmRmB/QrA054+/HqjpslEdQsES4YfAjWAfzLSXZ5Fdn2Ld1Vzae8wlMfuJOh
	 DlBEW34Pco1eu8ukTJv59hHFy60bS2otEyX+s4jGN7+eJCiqu129JgdPXZdRACV8JZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QQCg0JXt;
	arc=fail smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C033606A323
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:02:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C033606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QQCg0JXt
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c5118deebcfso1129390466b.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:02:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795744929; cv=none;
        d=google.com; s=arc-20260327;
        b=ruOS6rB8yx/T7j3EVE+iPyhUJV7e+p30stKxrI0W8zVA/WGEHB981ZpaP+A7rJWRbI
         6y2/V7ykFpcR8X2CrwDOIhRbWGHi8b+A4vzYYLA2cb/HWKUbV9i8p6/d3urlYaJCHdGE
         LMjWmBRim2M/2uf9ymyAEdxEgS9zwolkRCG4Yg2SVm1ORkvLF5hr3SHGI7G+GpZz4eRE
         nKA4MnNleMad3w+9K/A30QcjIMAWFY/yTerkY1GDM7Z4AUDgQIN7HzMvjk42LUHeYfQu
         Jv4OZ/2XwCsQ9iT1txxPJydoO4RfA0IZqEeVmq/B3fZtRhN01Ob4oTQclDX7xzffjW4e
         yMiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CD6edFGqmU8n4mTR3UtP0gostgp/pYDUUVhaESpICv4=;
        fh=mD+CyWQQuob1SQpmWNoEzZl/tHj4vYs2CZ5EDfliH6U=;
        b=omEW+Hw+6j9xKqcmbmACn8Kqx6axj1enuFmhiLWlIuoWkFkJ74nL4NrIbuzb9dBG0e
         uRfq73KWldUryFll91BG338k4jDQPh26nW4zannqCOvfZMADp8Bhw1VugBV/+x41TsPw
         zHqfbLCC4R9tjbT5xouHyhYUszb0vFEPGY9x/ngz+oReD5+iaH9mbOE+dIBNBOcGN0h3
         rbiGiy3Zx2Q2s2Wi9cedjRL1AR/Mram9jBCn8M++q9mUGf+bTeQdeKW0iXzUSotz96Wq
         txzq84H3nwNUqIxOQOuah4wvRt89bV74yyINODboDfGCWzbiaPmSk0y55g0efLrDzuZE
         JwXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795744929; x=1796349729; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CD6edFGqmU8n4mTR3UtP0gostgp/pYDUUVhaESpICv4=;
        b=QQCg0JXtU00HNsKgrqBi/W6XM3rMJrEM23W8vU0xV55dHIIMt5tdHI6YpWDrlqcmLW
         5+KiF1uMwxpd7s+5Sv8gvW/5nlypKIFlMi6XDN/n5aAaPbrhH8QGA06sMHNPogDDhHv7
         LVFO0+oZKZNM596R4PEWa0f56b7UlhG+1beqgzpMOqn5D+nNiWB4EN1KipEg2fgEgDz9
         sTp1aozLeNudjWgDRnrPWT4tdmdLNzcXs909noAkj1DaTMBfQR5JlP/JhlGECOwCsxQt
         rmI1FVvq39OUazqhvdkJ88wmW5jDK3EYrJ3p2Yn6ZdeGul++YWWV5ZX0qk3HZp0nyu/K
         57kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795744929; x=1796349729;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CD6edFGqmU8n4mTR3UtP0gostgp/pYDUUVhaESpICv4=;
        b=vymMVlp7OozaUuqXHCIMIik2MVkrvYPDJ+HQuJaWRF+GbLmE+Ahle6AAb8bFbvfITd
         WcQ4w80A+foSTXnva7TU+MkghjSPs0gYmcDK0spnmUiRhQCwNs31D//u3BCIuNEZZiY2
         V456dmcq4vrhHnFBrQsCHH/APeMbUK7M2mI0AZEIRpyzs0MXZI2i/l7ojddOA+iNgx7o
         eKoLMro+D7aEmyof83I3XFakoX5Ndfx0gYSXIR/HB8oo+KO4Dc2jyO9l8z8LjYq+9b8J
         AZVgKUsUGynrXynArh1IdKXKmAlt1urTbVxoLGLvbn7V1nMCb1Oqnqe/8zhpaAFTpPyU
         pkOg==
X-Forwarded-Encrypted: i=1; AL+hErHsPLyY852cPITVN8omfb9RtZsJrpLPylBC0sQsFoy/Kpw3lOkhTD9gX3lzkVEDfaDEmIiybL6QNVXFrbE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/88jtY706wR+oNGeh2ygR8QaG0S2frxqswuhIYWQXx9+lJzrBy
	arwpAfc45QKrRF/bZph2Ny2TNezYuzpeVI/YANvZ7jLNp+KnOQvXKSZVLbO6MvjPysSp0uvOtlM
	BzMr7X5yPTdgR+wPgylChJmiz3lU6sRA=
X-Gm-Gg: AZFdTZcvDr8HdFvteEJZkj+rhfvmYYP9FtDUYKZCWa44QTpZ4bg5EayHhy6CTI6rmNd
	AwefzZKTwLNtby3WRAn2SvsHf3Tt3zqKAokCGlWzcKxu2Mmio3+u0IX+VDgc9Q331puwKnDNU/Z
	E80G1VkXR6rCBSi3A3dCuWe0zasy2dFhHW/8Y9savUyOJKCmPoqx/hKyxbQSuuB5LRusfKIapuO
	hcRDGSNSME/cVu0W9/o/2SatkKKRD+4URmasiwXO+PhqUGL6c1GB+i8hUoba+CYYHX23qlGg6TI
	0GXXH/SaJ53IyUDTfh7acD4Qu4k7J6zsSfACe/p/E+eqVhaC5oECx7Kk/ZrgEGsSGLpmDQnUsAE
	6wfkS7rNgQAji874GqZzVEdHkDiWasWbS68b+5bn6e6F2f+yRyUmMrh2qGGodA5Fc4IqsTA==
X-Received: by 2002:a17:906:ad1:b0:c2d:d408:5d9c with SMTP id
 a640c23a62f3a-c513ac9c0d9mr1294611566b.48.1795744929390; Thu, 26 Nov 2026
 18:02:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124-mglru-fg-v6-0-8ffea39934a6@tencent.com>
 <20261124-mglru-fg-v6-8-8ffea39934a6@tencent.com> <e85a2666-9722-420b-9a60-9d4251fc3d4c@kernel.org>
 <awa30hwg6x82REoo@KASONG-MC4> <8ec3f3e2-5d3a-4bed-a571-88f7ba473b00@linux.dev>
In-Reply-To: <8ec3f3e2-5d3a-4bed-a571-88f7ba473b00@linux.dev>
From: Kairui Song <ryncsn@gmail.com>
Date: Fri, 27 Nov 2026 10:01:32 +0800
X-Gm-Features: Aa3M54rPWlNF1ipPnICVor68aKhcFmTtxDUbh6IGLENPtyVP2_2XjRG7xOmJZ1o
Message-ID: <CAMgjq7Ayu9H85wurRAUdmXEPWYi9BdLJW13BhK+LMYoBX_7fuw@mail.gmail.com>
Subject: Re: [PATCH v6 08/18] mm/mglru: make folio lru referenced times count
 a generic API
To: Ridong Chen <ridong.chen@linux.dev>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, linux-mm@kvack.org, 
	Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Muchun Song <muchun.song@linux.dev>, Qi Zheng <qi.zheng@linux.dev>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Chris Li <chrisl@kernel.org>, 
	Baoquan He <baoquan.he@linux.dev>, Nico Pache <nico.pache@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
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
	Tal Zussman <tz2294@columbia.edu>, Xiang Liu <liuxiang.277@bytedance.com>, 
	Ehab Ababneh <ehab.ababneh@intel.com>, Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>, 
	Lian Wang <lianux.mm@gmail.com>, Joanne Koong <joannelkoong@gmail.com>, 
	Kunwu Chan <kunwu.chan@gmail.com>, Hui Zhu <hui.zhu@linux.dev>, 
	Maxim Muzafarov <maxmuzaf@gmail.com>, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	damon@lists.linux.dev, linux-doc@vger.kernel.org, Tianyi Chen <hi@tychen.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2026 at 9:48=E2=80=AFAM Ridong Chen <ridong.chen@linux.dev>=
 wrote:
>
>
>
> On 11/25/2026 8:36 PM, Kairui Song wrote:
> >> On 11/23/26 19:53, Kairui Song via B4 Relay wrote:
> >>> From: Kairui Song<kasong@tencent.com>
> >>>
> >>> Pure code shuffle, no behavior change.
> >>>
> >>> Make the folio LRU refs helpers available regardless of CONFIG_LRU_GE=
N.
> >>> Without MGLRU the extra bits are never set, so they are inert. Move t=
he
> >>> lru_gen_* helpers into the CONFIG_LRU_GEN section.  This prepares for
> >>> unifying the API for checking folio referenced and workingset status.
> >>>
> >>> folio_migrate_lru_refs() now migrates the complete refs count,
> >>> including PG_workingset (bit 1 of the encoding), bitwise identical to
> >>> the direct copy dropped from folio_migrate_flags().
> >>>
> >>> lru_set_refs_flags() skips the nonexistent mask bits when
> >>> LRU_REFS_WIDTH collapses to 0, preserving the two independent flags f=
or
> >>> !CONFIG_LRU_GEN builds.
> >>>
> >>> Tested-by: Zhao Zhenzhuo<zhaozhengzhuo@uniontech.com>
> >>> Reviewed-by: Kunwu Chan<kunwu.chan@gmail.com>
> >>> Tested-by: Andrew Morton<akpm@linux-foundation.org>
> >>> Signed-off-by: Kairui Song<kasong@tencent.com>
> >>> ---
> >>>   include/linux/mm_inline.h | 55 ++++++++++++++++++++++++------------=
-----------
> >> I'm starting to feel like all of these mglru/reclaim thingies should g=
o into a
> >> dedicated helper.
> > Hi David
> >
> > I saw your comment on other patches too, about the header mm_inline.h,
> > about ~690 / 860 lines of code in it is for MGLRU / CLRU only. The
> > rest ~200 are for VMA / TLB / MMU.
> >
> >> Can you do that as a prio cleanup in this series, so we don't have to =
mess with
> >> mm_inline.h in later patches anymore?
> > Perhaps we can instead move the non LRU helpers in it?
> > These helpers:
> >
> >    - anon_vma_name_get
> >    - anon_vma_name_put
> >    - anon_vma_name_reuse
> >    - dup_anon_vma_name
> >    - free_anon_vma_name
> >    - anon_vma_name_eq
> >    - pfnmap_track_ctx_release
> >    - init_tlb_flush_pending
> >    - inc_tlb_flush_pending
> >    - dec_tlb_flush_pending
> >    - mm_tlb_flush_pending
> >    - mm_tlb_flush_nested
> >    - copy_pte_marker
> >    - num_pages_contiguous
> >
> > All other helper in mm_inline.h are for LRU. So we rename mm_inline.h
> > to mm_lru.h?
>
> Moving the VMA/TLB helpers out looks good to me as a first step.
>
> For the LRU part, there is already mm/vmscan.h, added by "mm/vmscan:
> move struct scan_control to a dedicated header" in mm-new. Most LRU
> helpers are only used inside mm/, e.g. lruvec_add_folio(),
> lruvec_add_folio_tail(), lru_gen_add_folio() and the refs encoding
> helpers, so they could move there instead of staying in a public
> header. Barry also suggested moving lruvec_add_folio() and friends
> to mm/vmscan.h in another thread.
>
> A few are used outside mm/ and need to stay public:
> folio_lru_list() in include/trace/events/pagemap.h, and
> folio_test_workingset() in fs/btrfs and fs/erofs after patch 16. So
> maybe keep a small public header for those, and move the rest to
> mm/vmscan.h, or to a separate mm/mglru.h if it gets too large, as
> David mentioned.
>
> I can help with the mm/vmscan.h part if that works for you.

Good idea! Maybe you can send a series to do that which I'll rebase on
top of. Feel free to take the first renaming patch too since they
should all be zero-feature-change :-D

But please help keep some helpers in a public helper so when we are
able to get rid of folio_*_referenced and folio_*_workingset, there
wron't be some strange header inclusion issues. FS users quite often
need to call them, especially the folio refs related ones.

Meanwhile I hope we won't take too long to get FG merged because users
with swappiness 200 could experience serious regressions with the
recent swappiness change, and there are already several long standing
/ recent regression that are waiting to be solved by FG :/

(Considering MGLRU even used to try to completely ignore anon reclaim
at swappiness 200 about a year ago, maybe that isn't too much of a
problem, but it's still a problem).
