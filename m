Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795540420;
	b=colTyA+MOa14Bdh4BEav80bFBZmyF/kGMFPfTu32REU4ABMMlkFTQ5RGxcPjlHR4Pph+
	 6+DrhFBFHBAfxPawVuICGsR9N3GbttUz1kCKVJXgmDkHKlgJ5WHSf0/V4uaRskAfdSc+n
	 hrkteosb3vxTNLeJjW8k3UfuLg9ctW4/D0ZXYgoCmgsmU0gAafBBHehWvV7SVKGVJViaZ
	 0WyqXF7BLM0Ev6GpD1msFFX979uTZomLtH+6MW45aQWME9pkS4WY7v2bpgk74IF8jcl2h
	 Eu+TynpOW9JOdWWR+i4j5RYgJbw9hfQBBCOMYtkH4omLDpLZU4MhuyD7Jr23Xi4WiyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540420;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tdBRQuRPxwEZd2+vFYBwLL5uePULho2FVfb2iukzoGg=;
	b=wpZE0Ao1j2nDRk2AQlVxFdoLgTT4TQ2uJIu4cS4JEudxyI59xxuUh8RRkhtjvANZRlYH
	 kDGMroiqZJgFL0MzDtsH3YN2c7YGaMj+5e2yBRcMJH59khHHrAf5qaL54GrijJTQeQAFE
	 l8Kf/MqmpOnTt+AFeQVBfSpfvrn3IdaUWHGwAGjP4qefZHyBqjvM1LkXHC2Zo7d2yrkw7
	 cn3YLRgNSUTp/ugk6z4K5T/DY/bdODsjF/IuK4h72hQPC94Ym5aOtWatYSkAyrHpYnVuF
	 PKs+pgk2i0L+Li83UG2YxnkQ1Er+qktPyAvdmgpOEbulTjsZYSLD+BEP04Kul1B1FrQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="e/nCERr/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585F5606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:13:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 585F5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e/nCERr/
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c5198302d38so118870466b.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:13:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795540419; cv=none;
        d=google.com; s=arc-20260327;
        b=S7/pZnTiqlGYIH9N24KwQVUIww/33KHBPJ1nqzrzkCcS/qOr+VnpPvZgd0TIZ9Yhdw
         lsAMq/BGkwPZf8gtDEQcNNKNGIPI8UI/4uZw/kZwYrqOCX1PvusLnSmiyTJ6aDpenUkG
         0szTcNBXw9l388P0fq4bu+BmgvIWLIaozdPi/Pu5QwznNjkoU4c5cLNsFJgYyK+FMzmz
         MlrphrKladmegXrNEvO3f2lJspsUZTGQ8qiOI1G7jOJIvZYDSblWcjxE99NCMnB+eWfl
         zOngJuVDFQHFRSa9OAi21o5UXr4nYyBs994H+yxqHcTqTjVBOjL2wMI8zzPLkC4CLMAw
         ccAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tdBRQuRPxwEZd2+vFYBwLL5uePULho2FVfb2iukzoGg=;
        fh=fEfYWrno6wv2gDT5nyTboAHc9b3M56IGeWjws4alxWE=;
        b=OJwxXr+A3+4tE+RBnDABbvJNEDT2nuieMtdjC9HgP4VB5SJIiiCzvSUCgcPDryYUW6
         9lbHeiIh0upB91o9Xrtv1uxFR7YUTEZKbHlFlcQRfsldOt3pZ3S4RBi7MR+WPF0hOhoq
         bLtfYJdUyDxGzTE09RapP6vbWwwzyCwhGFnm2UfZruCkqlB2cX1UYACr9s4wY2DCJ/LO
         54gw1z7/qkZd0woEXZA+C9ggV8ndVpmreMXruwKJ08qr5kRRQTcOra4v0T8/olhx8K7P
         RL7jC3OGKuR3iyGhOSSZ6Drtn3G96bKmlAxUxis2y72iXK0Kj/kQSH+mvVHAQ4bgGYEe
         bSYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795540419; x=1796145219; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tdBRQuRPxwEZd2+vFYBwLL5uePULho2FVfb2iukzoGg=;
        b=e/nCERr/YRUtOJeRKPd+BQQMwPxO5ct6IaL5AHx852Q2+rkR2gWkXC7M0GoFTjNFmp
         zTc2WniZF8DM9tAVuPYlxdV/OttRn2iMY/AzAp+fZjBpaPPUs8mVs+r9+mSPKzSb7LXn
         7pEfQPihN1xcOGpTOsBb2NJ9GHB/QYxdoMKcXWEDBrlaUk4CF6DVTj5YbMFAoRpv9jLU
         nZNbINa258sCeb6kOiHRBHueX0BppGU0cFv+0s92qvV02/DkuI0CrjHzJ7oKpZvO+kAX
         +fxMcoUsO2ITrpkoMZqKJVmOVL3Df9LHh822XMweC+M3Qr8ptD63oiXa3CPMGaOFk6Qb
         XPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795540419; x=1796145219;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tdBRQuRPxwEZd2+vFYBwLL5uePULho2FVfb2iukzoGg=;
        b=WJhuTSI/gFPTUKXXSnBhQ+OWG3SDPMC7Vh58d3SFpWURJo2e9MO2iMWtfjvKLdg8Js
         FxU5TBry8nSpuKZZ0k2SGQlyXkgKFuAha0M5bhrXdr+JT7+W3VkiR/yV75422e21+Qea
         DRQUuliVw4QeaAOtj1aadxkSFW+tiBqSz1dcXp7SyWDgJDy0T6n7X3a1bGoawU5OVsJu
         v59FWLO+Q20tqa+H0meslJNKKpOk73uD40wGbzEOduWW2++KUysJ2iD4LhS6ACMIjnJ4
         FyTVx/BsHwIwb9ddT+9CH5uyHMuAvwivTHNth8qLCX3w5pzM/xfzuYBNqdAGxc1tMU1D
         T1+A==
X-Forwarded-Encrypted: i=1; AL+hErFIFFtNTVrHIF4YOZRjKWJJChbOGeHlNFbJMOaysBhP4tnMcpXM1Tuoq110NCmAxNxnFn8VsSN4VU6fMxI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9h3aF7lWBoZUpjkWuTasx/gEySMh/z0ruox5uxbS6IO7WgDZ6W
	jUveUXFSOHWkwqHdaUk+99A7TzPlXunoxvkjekr72wweg6b/uQvrDmFh66KkYh0n6sShM+ByuPs
	ODoyJdbdlVoWKG1ew0lkToRaamSxzrMAVQ04mXEvt
X-Gm-Gg: AZFdTZcViCPMRwf/pjHamZs652VP7xWqEClt8XdmOmrzcELuZgrYfJR/XcROBSDQQyz
	6FrTSWMurAU5ZYVGEnPv6NaZdqZoKRcnskqCXa7lAb+tOxPiODXNDO+7DPAA3imqnpdatNoJTgC
	yCAddQ55tdRu0BtgUavRpoNCK3YigDB5xyZsateABGY+vviuZZ6fmeiW3NkjlPRKrbwRQsAbm/j
	jJDFpfUKEWM05VVtMWfj9Lno49EdNc8E16B7GLFei3zQ5fPfVsJAgBmIOpTVGAxNJquhcjxguLM
	2Wo3YvQ2RAlOuKNdhogix4YncgLJlyutZwuTYDf6XIYhRv7AzUIBKx5qgHPOGVf2ZziGiFZ3QKq
	3fTAcl14jRGmkkYd3GkvLlbFpSpgT3FGHnN2mEhJZbM1n6JS0+WMranoyga+xouAZRyVqA4lQwB
	vuduz9OXi9ahb7lfUtSTkoBklNEV5fwBENSRfo7mjId8R6WgNzdw9oBRih7kRRd4tjDx0B06JFo
	w==
X-Received: by 2002:a17:907:6eab:b0:c29:f5d8:9c78 with SMTP id
 a640c23a62f3a-c513aab17ebmr1287834866b.39.1795540418086; Tue, 24 Nov 2026
 09:13:38 -0800 (PST)
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
 <20261122184453.2668189-9-jthoughton@google.com> <9487E341-5F59-4245-BE0E-EFDD413E45D2@linux.dev>
In-Reply-To: <9487E341-5F59-4245-BE0E-EFDD413E45D2@linux.dev>
From: James Houghton <jthoughton@google.com>
Date: Tue, 24 Nov 2026 12:13:00 -0500
X-Gm-Features: Aa3M54p8XNdyqhw8NgJKcdhzlhzDFTnyhToFP0C3oUsuY3ie39XtBoe2DJRFnVg
Message-ID: <CADrL8HXPKfUhRaVhVyV6CPoQ2apZx1FCpyqyPMr=p=Q_kF3HBA@mail.gmail.com>
Subject: Re: [PATCH v3 08/19] hugetlb_vmemmap: Expose whether HVO is enabled
 to architecture code
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

On Mon, Nov 23, 2026 at 3:50=E2=80=AFAM Muchun Song <muchun.song@linux.dev>=
 wrote:
>
> > On Nov 23, 2026, at 02:44, James Houghton <jthoughton@google.com> wrote=
:
> >
> > Architectures that select
> > CONFIG_ARCH_HUGETLB_VMEMMAP_OPTIMIZATION_SYSCTL_RO may configure the
> > system at boot depending on whether HVO is enabled, e.g. arm64 may
> > require all CPUs to support hardware access flag updates only if HVO is
> > enabled.
> >
> > Add hugetlb_vmemmap_optimize_enabled() so that they can check. It is
> > declared before <asm/hugetlb.h> is included, so that it can also be use=
d
> > from inline helpers there.
> >
> > It only reflects the hugetlb_free_vmemmap=3D kernel command line parame=
ter
> > (and the sysctl, when writable), not whether the architecture supports
> > HVO.
> >
> > Signed-off-by: James Houghton <jthoughton@google.com>
> > ---
> > include/linux/hugetlb.h |  9 +++++++++
> > mm/hugetlb_vmemmap.c    | 18 ++++++++++++++++++
> > 2 files changed, 27 insertions(+)
> >
> > diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> > index 0d5414392d87..b2a6441bcd84 100644
> > --- a/include/linux/hugetlb.h
> > +++ b/include/linux/hugetlb.h
> > @@ -22,6 +22,15 @@ struct node;
> >
> > void free_huge_folio(struct folio *folio);
> >
> > +#ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
> > +bool hugetlb_vmemmap_optimize_enabled(void);
> > +#else
> > +static inline bool hugetlb_vmemmap_optimize_enabled(void)
> > +{
> > +     return false;
> > +}
> > +#endif
> > +
> > #ifdef CONFIG_HUGETLB_PAGE
> >
> > #include <linux/pagemap.h>
> > diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> > index 142f2975846b..fb6da64bd80d 100644
> > --- a/mm/hugetlb_vmemmap.c
> > +++ b/mm/hugetlb_vmemmap.c
> > @@ -452,6 +452,24 @@ static int __init hugetlb_vmemmap_optimize_param(c=
har *buf)
> > }
> > early_param("hugetlb_free_vmemmap", hugetlb_vmemmap_optimize_param);
> >
> > +/**
> > + * hugetlb_vmemmap_optimize_enabled - whether HVO is enabled
> > + *
> > + * This only reflects the hugetlb_free_vmemmap=3D kernel command line =
parameter
> > + * and the vm.hugetlb_optimize_vmemmap sysctl, not whether the archite=
cture
> > + * supports HVO (see arch_support_vmemmap_remap()).
> > + *
> > + * The value is final once early parameters have been parsed only if t=
he
> > + * architecture selects CONFIG_ARCH_HUGETLB_VMEMMAP_OPTIMIZATION_SYSCT=
L_RO;
> > + * otherwise it may change at any time through the sysctl.
> > + *
> > + * Return: true if HVO is enabled.
> > + */
>
> I don't think hugetlb_vmemmap_optimize_enabled() has clear semantics.
>
> Its name suggests that it reports whether HVO is actually enabled and
> usable, but it only returns the policy bit set by Kconfig, the command
> line, or the sysctl. It may return true even when
> arch_support_vmemmap_remap() is false. This is particularly confusing
> because arm64 calls it while determining the capability on which
> arch_support_vmemmap_remap() itself depends. Therefore, the helper
> really reports whether HVO was requested, rather than whether it is
> enabled.

I agree, the name is misleading.

> Could we keep vmemmap_optimize_enabled private and let arm64 retain
> the boot-time setting locally instead? For example, arm64 can use a
> private hvo_enabled_at_boot variable with a
> core_param(hugetlb_free_vmemmap, ...) registration. The system
> capability is evaluated after core parameters have been parsed, and
> arm64 makes the HVO sysctl read-only, so the value remains stable for
> system capability and late CPU verification.
>
> What do you think?
>
> +static bool hvo_enabled_at_boot __ro_after_init =3D
> +       IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON);
> +core_param(hugetlb_free_vmemmap, hvo_enabled_at_boot, bool, 0);
> +
>  static bool has_bbm_through_af(const struct arm64_cpu_capabilities *caps=
, int scope)
>  {
>         /* The kernel only enables HW AF updates with CONFIG_ARM64_HW_AFD=
BM. */
> @@ -2055,7 +2059,8 @@ static bool has_bbm_through_af(const struct arm64_c=
pu_capabilities *caps, int sc
>          * BBM-through-AF is only needed for HVO. If HVO is not in use, d=
on't
>          * penalize systems with mismatched support.
>          */
> -       if (!hugetlb_vmemmap_optimize_enabled()) {
> +       if (!IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP) ||
> +           !hvo_enabled_at_boot) {
>                 /* Only valid if HVO cannot be enabled later via the sysc=
tl. */
>                 BUILD_BUG_ON(!IS_ENABLED(CONFIG_ARCH_HUGETLB_VMEMMAP_OPTI=
MIZATION_SYSCTL_RO));
>                 return false;
>

This is a good suggestion, but let me explain why I don't think we
should do this:

First of all, I'm changing the bbm_through_af capability from a
SYSTEM_FEATURE to an EARLY_LOCAL_CPU_FEATURE, which means that
has_bbm_through_af() will be evaluated before core_param()s are
parsed. I could change it back to a SYSTEM_FEATURE, but I would rather
not do that. (See [1]).

I also don't like duplicate parsing of the same command line argument.
I'm not sure if there is precedent for this, but I feel like it will
lead to confusion. (It is news to me that duplicate parsing like this
is valid, as long as they are not both core_param()? or
early_param()s, I think?)

It would be much easier just to rename
hugetlb_vmemmap_optimize_enabled() to
hugetlb_vmemmap_optimize_requested() and properly document what it
returns. Does that sound good to you?

[1] https://lore.kernel.org/linux-mm/CADrL8HUgo0zAHe7_eF1+hfTR6jBbZ=3DUKB1q=
PpMWpksvqbNHsyw@mail.gmail.com/
