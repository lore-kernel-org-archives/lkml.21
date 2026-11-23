Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795465916;
	b=Kh+YVyH0dTeId2wXHkm14hUOC/05Tpjbx/WipF8mZGtwizXuucDS9LVh/amcJDsS+VYy
	 c3174Tmxwdx0VsPrAvpQM8+NQs8WYySrhaVbtaRuH4cFkFOe3COMIuOacdxWVW4JrQQHR
	 R11HOETIBaxKLaJ3dJ6du7Cjkt0HDCpGy+tavhQH6A38FtkVxev9JYctcAwys4k8WoHC8
	 HBQtFpdjl5ZkzWT5HQRrf8pP2QHS5uC0uUHF56eVhEcuo9gQaUQ9un9FNA5NQ9xIH5Fk4
	 GeHTgtHyK7MFFHrvlQBUJ8kodzVtNO3b2Po07LesdBzF2onedODTfLFSSd0UyXh5c6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795465916;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IJsNI40Oc4odODK4rCh9CibKGkLzE8LmGw7dcdr4rMY=;
	b=Z019bkLpQVAWBMv9iVCytjCXXjcG/Zft1PTo85ibJlY6lWerou4rqLyGvg9P3WL5B/jQ
	 QRBlJKLCkPt87cfsoQge6fi0DhXetx1jR+NIRmgF+w5FZLfBjYQPEoO/Jau6Ay3HTgCs9
	 yI3NHq5tix1nkbWjH4zccg+d+kzP9YXonuc/r0ykh0ahE0KzAQh1qDKEtwugHNONkz9Md
	 9iOU0TpnU6MxxI49gV+nFMkJWeaYQ9wxm8ERoxV7GkqS0nmMXvEs1nhP3k+wrG/Cj92cf
	 /8eZr2gDyRWAucviywW3GL0XgtKL3as2CYvsxT6VBTYgDGi/QIrZPx/QqRjUg5D3Sbg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JpR1jU1P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56235606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:31:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56235606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JpR1jU1P
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso4588735a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:31:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795465915; cv=none;
        d=google.com; s=arc-20260327;
        b=Ll8aSHx7C4QbW5+31TeME7tBLPHAqd9KJotgDJCR4Gh1OP2gQexGEiUhod3dSCjRab
         N0pZOz2Mh1/yeCR4rMlfyCRl6BtK14BDVOMPDcVA44GnvF4hDurFajGLVtK/VXZKp+2M
         RjrRgJTvpc1xxsJwhbqWt7wKtnhkNTGPW6iSLKvSyOVAAhwC3+FcpRSGvTaroiROXHVq
         cce4TLPdGusdaqvulG51xNEB8v38B3vevsJH6bDfxjQOEjNXy3zDOh9iQ6RQbTL5XnSL
         teLUW9A4uCDI1ZRlnsVZ653fxOab3M7QeDWHlQu+4TumHekK0yhnFw7hv8jAyXaenLYo
         Nomg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IJsNI40Oc4odODK4rCh9CibKGkLzE8LmGw7dcdr4rMY=;
        fh=ODLf89gl2ysmdRMuebnObzjMaM745cpDnu45yYxC6Gg=;
        b=PoPU/sZx2I4N9Fj89FAt+6QcsgK8EQ6u51WCJ8RQ77/4gOVd4Pdw6i72KnyXzR03dg
         qDY7b+le/K269yh+G1aQoOnyNGr82iMZwkvJODfv0UasjUdU4UCfLaowPyJOwEvZorVL
         vfjwRVScly8solbvtI4D5e+KUYHQEAmrHQgI1tA/wLE8BgJ/eXomB2ffU2qMgoLcPfXU
         WSYcO0zEHznwNslzHC0BPuSLumsuap9xKlOfxtumrCTupySzILHtM1v06y1fjg8Ys3h4
         NFfv7UkSRrRRNECvhcf15IZJWx5ZBZGUSj58E0L64uO4ft/lkAAGwM4dWcxdUqMN38Be
         xCRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795465915; x=1796070715; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IJsNI40Oc4odODK4rCh9CibKGkLzE8LmGw7dcdr4rMY=;
        b=JpR1jU1PR5iqP5SvNSDDjYgaub5g7NzuJic77z3o4RgvfV1SRlQTKB2MlcOYiAH3w5
         B9jf8B7zw6uh1AiimPGx64tojVZ+qJXms31TkK0XkE744FdSrGXnh0p1GLXfzdJM5gIJ
         etUPN1SP8Rfv6GUcx75Rr9gah5C8KQ8GnaW2wyPTB8JMr1QwqcvvJOHeYuyYnRs7Y2/v
         ob4keiPeBxpz7oi6Ws0Z/ArAyTwOQdYa3YkZKdAdC9t1XzbwkxNS2VbR8bZIH9mp7clJ
         QIeddLmTBHpUmRCAULMGVlPXWnD53EuGxbNrxRa1tel9LcDnUhC7MeTWIeCdHGW0fg7P
         r60g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795465915; x=1796070715;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IJsNI40Oc4odODK4rCh9CibKGkLzE8LmGw7dcdr4rMY=;
        b=pJbri/g3/jkVCetwNjFGGUkwInJKX4R1EO9KoQcGC0TfqOJB3xZmSEXBLZKxqi/0C1
         r4/dZLz/uQcKi4tWGeug+Fc+lnzMCuzshvIFH+6N4cfNiU3pdz4G6VmK5r6lHbmciu4n
         TEQLmnBCXctniTbktBejEnpoy7FoQvLeFu3OrpkQHltjP0PK/Iat8IIah1Ksr0Vo8qLQ
         UtWkiR42Bvg0kK8ooCvNHAxLCw8c6UJpKUpAZYxhq0RRuWHl61cuWXv5PRjyZVvxo/1w
         xkh7bJs7YgKyCG1qe+Tzqa1xkIJluAWowcQx5HMg05Gu1VjoJ1aqt/wygYXzCJ3gKW28
         mFlA==
X-Forwarded-Encrypted: i=1; AL+hErFp5oQiUgPoq2uoLBTiOsuaHl+B6u1ho+J2hQSP4d+muB+mHQUb6a4EPLvUjJA/YHijI7QVziklRT548go=@vger.kernel.org
X-Gm-Message-State: APuU4Z+njFGdQLMGesgBGSLIJa7vsO2X/OfewiOS+EjR6znGFqTunn8+
	FWQNPuuKZEFf9U88207B0y9HNwC/232Re+HFUuJl/Z+y9UN8h0LKPZSCXmNqKrk6uOhqnP+z2MC
	6lYyinOOlrLAaa0buxnjX2ebNHG/DMR636aKjCZGg
X-Gm-Gg: AZFdTZfJIdLc4jEZIj9/KWys5bX8Jb2gUx90RzUSKVgyVuNnaiGvYgS8y2EnCi8odfs
	WC7oiQEDqhDtXSvh9tr67JmDa2usfD7PPBcUFflEqhB5Q6mfQ6dYc0L2P63ZPJ8I4eSaQW9gt9S
	FFFAi5RfOYQrVKy0su4oBiP+hlPW3o52vFXKG8XcydwvZF6QPVRIY28Wp1B4825BTkcUjFDk4dH
	aX6PpxDdNooU3T/JAX2ZvyVTUnFjviNQnJxe+9Eb7DMBTABurwI2SCk+OtDyp6kEZaAw4VzsyA8
	MyRb6LHxafrlHSGn3z+6S1s6uu/FKakZOnPQg6j7xjLktnGLjAH24kfWs3VA6Q0iIPYCc6Z7kzz
	+JBKv4u/830qO9tFPes/pu5ARikbKYeKvQGZH11D8LLGsulkFZ8HuW5PIEF2OvYMvDQRO1uQJCZ
	328lsIk2pCSJed0H6fRwNz1t1x6JUvtt3uJRmLsBnDWOKPywagZn0=
X-Received: by 2002:a05:6402:2347:b0:6b7:d1a4:fe1b with SMTP id
 4fb4d7f45d1cf-6ba37ee380amr9483450a12.43.1795465914250; Mon, 23 Nov 2026
 12:31:54 -0800 (PST)
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
 <20261122184453.2668189-6-jthoughton@google.com> <C1CC6F31-4F75-41D8-89D8-CE43465FBB6C@linux.dev>
In-Reply-To: <C1CC6F31-4F75-41D8-89D8-CE43465FBB6C@linux.dev>
From: James Houghton <jthoughton@google.com>
Date: Mon, 23 Nov 2026 15:31:17 -0500
X-Gm-Features: Aa3M54rAEjsqVff0l9eelHjmiyUD7j4I6mswdsQtcR5CMMtlUyAnlGvfFa0vdJQ
Message-ID: <CADrL8HXemwtmL_URg-WNOzdw1YCVxP3HVxX67yd=pLRGAuFyVA@mail.gmail.com>
Subject: Re: [PATCH v3 05/19] hugetlb_vmemmap: Allow architectures to
 dynamically disallow HVO
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

On Sun, Nov 22, 2026 at 10:01=E2=80=AFPM Muchun Song <muchun.song@linux.dev=
> wrote:
>
>
>
> > On Nov 23, 2026, at 02:44, James Houghton <jthoughton@google.com> wrote=
:
> >
> > For arm64, only some platforms support HVO. Add an arch hook,
> > arch_support_vmemmap_remap(), to prevent HVO from taking effect if the
> > architecture lacks support. The hook is not HugeTLB-specific, so it can
> > also be used by other users of in-place vmemmap remapping (e.g. FS-DAX)=
.
> >
> > Check it in hugetlb_vmemmap_optimizable_size(), so that hstates are not
> > reported or treated as optimizable (e.g. by report_hugepages() and the
> > HugeTLB allocation and freeing paths) when the architecture does not
> > support HVO.
> >
> > It may be the case that arch_support_vmemmap_remap() returns false at
> > first but eventually returns true. This is the case on arm64, where
> > support depends on a system-wide CPU capability that is not yet known
> > when bootmem hugepages are allocated. Such architectures cannot pre-HVO
> > bootmem hugepages, so they must disable the section-based vmemmap
> > optimization in their vmemmap population path with
> > section_vmemmap_optimization_disable(). Their bootmem hugepages are the=
n
> > optimized when they are gathered instead.
> >
> > Signed-off-by: James Houghton <jthoughton@google.com>
> > ---
> > include/linux/pgtable.h | 15 +++++++++++++++
> > mm/hugetlb_vmemmap.h    |  2 ++
> > 2 files changed, 17 insertions(+)
> >
> > diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> > index ab33df268955..8cf44120e2ed 100644
> > --- a/include/linux/pgtable.h
> > +++ b/include/linux/pgtable.h
> > @@ -480,6 +480,21 @@ static inline int try_update_vmemmap_pte(unsigned =
long addr, pte_t *ptep,
> > }
> > #endif
> >
> > +#ifndef arch_support_vmemmap_remap
>
> We usually add a 's' to 'support'. Like arch_supports_vmemmap_remap.

Oh yeah, I'll fix that. Thanks, Muchun!

>
> > +/*
> > + * arch_support_vmemmap_remap - Whether in-use vmemmap mappings may be=
 remapped.
> > + *
> > + * Vmemmap optimizations, such as the HugeTLB vmemmap optimization (HV=
O),
> > + * remap vmemmap page table entries while they are in use. Architectur=
es that
> > + * can only do this on some systems may override this hook. It may ret=
urn false
>
> "Some systems" is not clear for me, How about rewrite this sentence with:
>
>   May override this hook based on architecture-specific runtime condition=
s.
>
> > + * early during boot and true later, once system-wide features are kno=
wn.
>
> I think the description should be general, so the last sentence I think s=
hould
> be removed.

I think it's important to clarify that the return value can transition
from false to true, but not from true to false.

Okay how about this:
   * Vmemmap optimizations, such as the HugeTLB vmemmap optimization (HVO),
   * remap vmemmap page table entries while they are in use. Architectures =
that
   * can only do this under certain runtime conditions may override
   * this hook. It may return false early during boot and true later. Once
   * it becomes true, it must not start returning false.

What do you think?

Thanks!


>
> Thanks,
> Muchun
>
> > + */
> > +static inline bool arch_support_vmemmap_remap(void)
> > +{
> > +     return IS_ENABLED(CONFIG_VMEMMAP_OPTIMIZATION);
> > +}
> > +#endif
> > +
> > #ifndef __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
> > extern int ptep_set_access_flags(struct vm_area_struct *vma,
> >                                unsigned long address, pte_t *ptep,
> > diff --git a/mm/hugetlb_vmemmap.h b/mm/hugetlb_vmemmap.h
> > index 8b28063d78cc..440477288d19 100644
> > --- a/mm/hugetlb_vmemmap.h
> > +++ b/mm/hugetlb_vmemmap.h
> > @@ -48,6 +48,8 @@ static inline unsigned int hugetlb_vmemmap_optimizabl=
e_size(const struct hstate
> >
> >       if (!is_power_of_2(sizeof(struct page)))
> >               return 0;
> > +     if (!arch_support_vmemmap_remap())
> > +             return 0;
> >       return size > 0 ? size : 0;
> > }
> > #else
> > --
> > 2.56.1.809.ga0b61035b5-goog
> >
>
