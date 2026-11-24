Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795541526;
	b=KlKxdLeL1qFxcRFkLid3FQkavFvzykS/5rtHLIqQKlqo0jyMm9Y1RBRslTjzZLE3w8SA
	 xi7VUqizre0rNWvYDxwLvdFmCzwv+M37j3qVj02hhtoEGrDIWXNQPsP9G5hy72gNhwDUQ
	 6ub4iEuETAdPw8zYwtgQTa4S71OuUK0Wg4mYu3TLbAMsXGU/ewqdELgg6Exa2bIQikS/H
	 pAEE8pY+Ihu6X7q4U9VV08WMGtOL05HNZIreauZNrbmWccZkws8hJk4LrkPLUoo7Vx1vo
	 Bg58Q/q5DuEpmPjOiOW0HIjLkFAVb+jl90u4nyx9k0jm/SB+enpCEcKCAJOwsAs7/2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541526;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7opp9hPoTKTPhk0yMQ4YWgEN212V/vxQj64/fQGJyZQ=;
	b=XeYZH3JRdiX+wfEMJWIIrfzKg+yoLKhba0ziEA/9haZqY7hZ/E8yZaPpbtu7P2O2CH0E
	 Z1ZpmqYKnqGH+FlrwRGNM0zO84ZuZ4HSdM1p7ixAYYzdtGQE85jA/SIpMf7mRjmCA9kXJ
	 QoNLI7U4JwcmJ+2I6JAgL+cis05dORXjkxLyivKOe0O3ZuSz9q/ZO6KyadVik/tQwNCJn
	 Z2ttXbNwGqJE6EDidOmeR36/3WK716jlHvJKmc/DDBiv5I1lyPV1jn+175AXtaOtKkEZp
	 kwi/XHdrNl4Grs1ijSVMaYJClUw4hibyHQ1ASiKT+f+pPatr7dJdDZsn4ezy6Ho6Msg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=m9HIH3+d;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378EE606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:32:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 378EE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=m9HIH3+d
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c51373ae637so726818466b.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:32:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795541524; cv=none;
        d=google.com; s=arc-20260327;
        b=fZXqC+TdQtASWSjwYrYFNHt+vJ+/HlkJMv2t63u7ZkRL6oGFNpt75Jc0R4wLHBt/+a
         121Fx2n9Zah6YCgVeqdeXiw9q7KYUZRw8qFqMoqVJVJjFceLx0VItmQ3DhIcYrdCrLxG
         Lx1DnzPO4Ps8o4GUKApNra8KAo3V0WC6yLnZbbnGSfoFK2gTZzDrlXQUsuTmwm1KPqCE
         gw1fBY8gLauFIHRT27sAqp5nYlC9BC9zKzEGE8hywsPalcwP/4cpS9Y2zpBkApOXorWO
         xnhpySBKrLdty5qW0ma7+nYkqkn2U+C8mHNuzpSg/gFO/7GwgBLvXNv5+K3B8tZ/A73I
         wZTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7opp9hPoTKTPhk0yMQ4YWgEN212V/vxQj64/fQGJyZQ=;
        fh=PtW6zQhZYO0rjal+8Wvy2ZMlVTzjnUsYvKkRdNIhL/k=;
        b=pGdxxuyoWKQUglAdpPqITWeo/3mWU1U2eskQj5bRtJXHclBzP8kHHSoHuZvHdEUrSy
         xgCOLg3EM8RNl6RKhKMDI5pkHEJ6uoUX4C4J0GxS9ZiyddMLmbrut8ZJqY3j8qlSQnjp
         R/wUvSD4u+4BgGT6dPQKOUdaWJM7QSx4NNvnEtV8LLovGrKK2EQO5n4Ttla95c3qFnt9
         vsToVffS5LZ9b80QN3S4lmMVanGhZM8jJgyXQIxx8Aefxs8B28ziQ2Mf8L/Q1e4KTUjo
         L9+26hR/19jofKhR2PC3CPETbUSSo568afFMXu2cL3HzkB5+Cc9p8FLkXafBRDL2nuQz
         P/jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795541524; x=1796146324; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7opp9hPoTKTPhk0yMQ4YWgEN212V/vxQj64/fQGJyZQ=;
        b=m9HIH3+d2rdIxOarepdc2PmH9s23EL1YUfArRA3Y/MSXCBckQ47Zs5t6XgWAb8SvGy
         2x+V5qFqsh5OGphgHkC59CZbP55ocgDqjtSlCGx3wHiVGXHCvvsY3FjIKhCMQ07GgNrB
         5KFSKgub4qxNzDe2gPVS+WnTztK46eRSfqAkvLqP10DPZPzPe4bFuY1r2UOI0emwoPuF
         ZcU4IgdYkaOZQWLi/eUOypVa8uh/s8aZv2x9x/uIPg8LK57CxPdkihqgJVmS10Ig0dVl
         jDTER/1dRDdXB9A1aJ+AAU2xajWZPfsO2nBS5paH2qv4B2+gRMqxx1U9a2Ipm+uIsegO
         /plw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541524; x=1796146324;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7opp9hPoTKTPhk0yMQ4YWgEN212V/vxQj64/fQGJyZQ=;
        b=Pveu60hL363PczFPy92+vPDuUfEOINpQ/JT72F0X/r9rtkuRX/3D077ndn8x7tfFPF
         E1ONq2cfczI67jMSLF+Qg6qK7O6Y5IYZ7mg+2B4XIuZ5inppl7DtZ+Bn4/RYoyu5wEqM
         CayUbSXvhGrJJu5O96IZyxqnDk1pxTtQH4RSIF3HqLDfg95qajwLt6bYcuGV+xH1SD2/
         6yCRsUQGayp22szTJHxxrhpCN5XgS9yzWu4bFQNh5kcRkaWr0HCoSQK6KqkGqa6yJ7TE
         nkGVOblc9wlwQ9VnqsmhIVQ9qQMlhAj9cRLS/xPzrnwrLq1cqqg96WCugq/IwXP+kyHu
         /C6g==
X-Forwarded-Encrypted: i=1; AL+hErF/k+bk+FLGR2LhT1SeeWYzHAsa/9dXxGjwfukjFSYPDyuEbrFR0be/BpX+30Z8IVXwkF/hAL6yLoz3lRk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ce8ULFKxtH6qP7KY0tYLb4wN77xzqnGgVOGhribH2GQ/R8n1p
	22iBeXGZ5ZiPRqSGcUYPL3su7YbgFCs9C9eI/rPp/3FxmRVYjsym8NH3mrJWYItFJKnalJaQJex
	9HsDyHRTiHZn69raMSJ1R3RtmH2D8C6L5pljbrc0/
X-Gm-Gg: AZFdTZfxoRBA93erdHNyHCgO88tqUGxcNvon2GqRLPg8lvteKEAyROH7zefu3IIIitX
	fRBt/2CSZDoemyTsGOEaJLKEep2724WMPYqpKIhCOtb2Ppb7yM/ElZeojQ5EXMz9Q++9iomCmPS
	Jhos3CVLEq63NcbwafHUhePS7Vp0TjrBDBhoUYKow45paScrw2e/FC+mq+1ihUsoQNTnL7Ozc2G
	0Zg1vitGqApphb9ggJKoC2bIsT+3y03C/dwl4ldjd/vb42N+75mA9Ek4I0ksmv1GvF7PZ3S1Mfk
	8IIZzlpbC+FCXUgS8t2e48NulaMEbOVOnZTQJ7LDkHy/CT0T5bz0puYEGaHcA7bhzkelmIqLq84
	lOPW3nraCqNPXd6g7lL7/c0fYsCZZaTDR3k3RF2j0GKM1jNFfmS5KsQ9ie1TNUwwFrnV4cR6gKY
	nZ4yj/GxOWJA+m2CXl/KJthZGxgi3iOoH39y3bcF3xtui5+MKd324=
X-Received: by 2002:a17:907:f447:b0:c51:3b74:9d07 with SMTP id
 a640c23a62f3a-c513b74a25fmr1285241866b.18.1795541523747; Tue, 24 Nov 2026
 09:32:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122184453.2668189-1-jthoughton@google.com>
 <20261122184453.2668189-13-jthoughton@google.com> <64639588-CB39-4980-A9E3-8423AB0DF268@linux.dev>
In-Reply-To: <64639588-CB39-4980-A9E3-8423AB0DF268@linux.dev>
From: James Houghton <jthoughton@google.com>
Date: Tue, 24 Nov 2026 12:31:26 -0500
X-Gm-Features: Aa3M54pJowFxRXx8hUGNB1puE_T2twV36WACIQPmhuWjpD5RyPK2KGuMrESCLFo
Message-ID: <CADrL8HW6FuyzV+cbdV7n6-=3fPzAz0fPuEEoa6e6sc42uz=-fA@mail.gmail.com>
Subject: Re: [PATCH v3 12/19] arm64: Support hugetlb vmemmap optimization
To: Muchun Song <muchun.song@linux.dev>
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Oscar Salvador <osalvador@suse.de>, Andrew Morton <akpm@linux-foundation.org>, 
	Kefeng Wang <wangkefeng.wang@huawei.com>, Nikos Nikoleris <nikos.nikoleris@arm.com>, 
	Linu Cherian <linu.cherian@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	David Hildenbrand <david@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>, 
	Frank van der Linden <fvdl@google.com>, David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 10:26=E2=80=AFPM Muchun Song <muchun.song@linux.dev=
> wrote:
>
> > On Nov 23, 2026, at 02:44, James Houghton <jthoughton@google.com> wrote=
:
> >
> > Support HVO if HW AF and BBML3 are supported. These are the required
> > features for the vmemmap to be modified in place.
> >
> > On arm64 systems that do not have the required hardware features to
> > support HVO, the HVO sysctl will not appear, and any attempts to enable
> > HVO (either via the command line or via
> > CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON=3Dy) will have no effec=
t.
> >
> > Because HVO support is only known after the vmemmap has been populated,
> > disable the section-based vmemmap optimization in vmemmap_populate(), a=
s
> > LoongArch and powerpc do. Boot-time HugeTLB folios are then optimized
> > when they are gathered.
> >
> > Signed-off-by: James Houghton <jthoughton@google.com>
> > ---
> > arch/arm64/Kconfig               | 1 +
> > arch/arm64/include/asm/pgtable.h | 6 ++++++
> > arch/arm64/mm/mmu.c              | 9 +++++++++
> > mm/hugetlb_vmemmap.c             | 4 ++++
> > 4 files changed, 20 insertions(+)
> >
> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > index 4cce60c2de66..b13618f0ace5 100644
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -95,6 +95,7 @@ config ARM64
> >       select ARCH_WANT_FRAME_POINTERS
> >       select ARCH_WANT_HUGE_PMD_SHARE if ARM64_4K_PAGES || (ARM64_16K_P=
AGES && !ARM64_VA_BITS_36)
> >       select ARCH_WANT_LD_ORPHAN_WARN
> > +     select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP if ARM64_HW_AFDBM
> >       select ARCH_WANTS_EXECMEM_LATE
> >       select ARCH_WANTS_NO_INSTR
> >       select ARCH_WANTS_THP_SWAP if ARM64_4K_PAGES
> > diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/=
pgtable.h
> > index 7421c0a048ff..5dadaac54bef 100644
> > --- a/arch/arm64/include/asm/pgtable.h
> > +++ b/arch/arm64/include/asm/pgtable.h
> > @@ -1931,6 +1931,12 @@ static inline void clear_young_dirty_ptes(struct=
 vm_area_struct *vma,
> >
> > #endif /* CONFIG_ARM64_CONTPTE */
> >
> > +#define arch_support_vmemmap_remap arch_support_vmemmap_remap
> > +static inline bool arch_support_vmemmap_remap(void)
> > +{
> > +     return system_supports_bbm_through_af();
> > +}
> > +
> > static inline int try_update_vmemmap_pte(unsigned long addr, pte_t *pte=
p,
> >                                        const pte_t pte)
> > {
> > diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> > index a61464cf7367..bc3eea16004c 100644
> > --- a/arch/arm64/mm/mmu.c
> > +++ b/arch/arm64/mm/mmu.c
> > @@ -30,6 +30,7 @@
> > #include <linux/mm_inline.h>
> > #include <linux/pagewalk.h>
> > #include <linux/stop_machine.h>
> > +#include <linux/vmemmap-optimization.h>
> >
> > #include <asm/barrier.h>
> > #include <asm/cputype.h>
> > @@ -1843,6 +1844,14 @@ int __meminit vmemmap_populate(unsigned long sta=
rt, unsigned long end, int node,
> >       /* [start, end] should be within one section */
> >       WARN_ON_ONCE(end - start > PAGES_PER_SECTION * sizeof(struct page=
));
> >
> > +     /*
> > +      * Whether HVO is supported is only known once the system-wide CP=
U
> > +      * features have been finalized, which is after the vmemmap has b=
een
> > +      * populated, so the section-based vmemmap optimization (pre-HVO)=
 is
>
> It's better to avoid the term of "pre-HVO", It's an obsolete term. All in=
frastructure
> of it are removed now.

Will fix, sorry about that.

> > +      * not supported. Boot-time HugeTLB folios are optimized later in=
stead.
> > +      */
> > +     section_vmemmap_optimization_disable(start, end);
> > +
> >       if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES) ||
> >           (end - start < PAGES_PER_SECTION * sizeof(struct page)))
> >               return vmemmap_populate_basepages(start, end, node, altma=
p);
> > diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> > index fb6da64bd80d..a01377c37c96 100644
> > --- a/mm/hugetlb_vmemmap.c
> > +++ b/mm/hugetlb_vmemmap.c
> > @@ -79,6 +79,10 @@ static int vmemmap_split_pmd(pmd_t *pmd, struct page=
 *head, unsigned long start,
> >
> >               /* Make pte visible before pmd. See comment in pmd_instal=
l(). */
> >               smp_wmb();
> > +             /*
> > +              * On arm64, this requires BBML3. Its support has already=
 been
> > +              * checked.
> > +              */
>
> Please don't add an architecture specific comment here. That is something=
 architecture
> itself needs to consider.

Okay, I'll drop it. I've updated the changelog for this patch to
indicate the BBML3 requirement so that we don't lose this subtlety.
