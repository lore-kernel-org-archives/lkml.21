Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795624012;
	b=PkEiDjXnIVEp3YEMjSDSNYounITdxT5gRqIpPxq+D7Nd0SnRJ+f3Mp88vREUpmLZyvTf
	 iPuxgYL+vKxrIUGQYgntmx+UCGAwXEz5OFkRSB+VpA2xHbldxSH6Lf3PcGkh4/uP4HcdQ
	 rDz6pDQHQKrUejVBF7l3iDmenSRVtMlrnDzCWZbeUOtoYnfNppZwf6feDnDvEEJdIH3m9
	 vCcpjHp/3gBTRANWUrx6ke8hjwqIIHDhBnnuiHuKf7cQpx43UQaoPutz5bdqs5QwPbaPi
	 PzmBtTS63N2zwjzPNHU+qRfSWiktkeuueE6Fj0BmdqP2PhQsjod2FmD0XGg/h29vwpw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624012;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eGPDDNK/Yei0sGWbDO0NMhfYUHaLt6AdHTFPFf4Fgzk=;
	b=j+6sPeR0Fq/8Kfof6+h6tBI9InsBioSLVv4Ong8YHLjIfpZ9/y7tGEcr/M991bCS6HYx
	 r7b5EeGm2+36Q3hd0DRFu/cUxBZKJaUyHgZAMedi9lCvTeHuodlmGp8sqoXn3CzY5zXna
	 3E5MFgN6MMBRKSKBw7IFuQVoDrKY3t/VqonHPUP/y00zrOdNZ2eyGObtMEltxG6wKpaLo
	 sapZbYtRPbYSnRenaMfCzfcOymuMpgiIj0KiQa3a9FQmmVhkJ1lDBb5UwqcCDIGZw17gG
	 4vcN2eOY+lY61x7nzuS08gF19Xb2R1Ggf5ODVQ2e7VZn51GK/wBjGMyE+fusQmYqHoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=F28NbPTq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACFA606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:26:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ACFA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=F28NbPTq
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c513a854320so114075366b.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:26:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795624010; cv=none;
        d=google.com; s=arc-20260327;
        b=KveDJ0RNQ79ZsNN7Fz6syppW1JAcwLfygoU0CurGebbPd6KV46I8VBwkrz83Xjc35g
         oLhAtviQlGc0Y2sG1KGVXGrsj4xa+rrJlipOcq7D8Q+5O7xSCbGws3UYkGHw6e05inwX
         lK8pXFCO/v772vamZi10cQAUOdpvHe291H6TUpXIGwR82Ykrv4ry535xVmmidsH8V86G
         D68I5FIGDWPXggF9Aob1mzgK+/zbUV9XUIAqtkCbp6tdgZY5qD6zCZGy3jPkEZci1fU5
         3QOBvjBkZVmaiMsmP3mqEA3hh467ga9mZJ2yKG5CTnUYN8EPd3hAeWoHnz3DczNq8OUM
         fxUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eGPDDNK/Yei0sGWbDO0NMhfYUHaLt6AdHTFPFf4Fgzk=;
        fh=6zv5zdR0WuBDzX8h/XffcDkc5+whdO5BD/iheG42pkk=;
        b=aa3bxYHNROjRnNqfJs7PNPS1xtTy6v9MOC2VM3m/d1Zp7Yb9ZIvzvXWusJHdIkEr2Y
         Jzd0z5rhUAgYpOe9E0G5IsE4eMBIQPxWuqWuiHV0VZxmkCgc0YFycL/VPDEfQIgSKVW2
         6CbDOdWC6wgjL2Z/EgWEQMwOvH4FHxqZvHIQrp5k5QAFh0KBgF+2eSOaf8UVSsVnVL/5
         xFF1Gk+7b3Mgf6+kI+d4F206w8UMe0gQahG/cfc9L0etpZgikoKDTKVQKXpnB4/LJ/1I
         Q7Qglf47hw4BLbZyClOtJ0wSxMcwzUZgYDbGmhJdTFCil7FW52HJnNo4pHUjvH/6rkQJ
         p1eQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795624010; x=1796228810; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eGPDDNK/Yei0sGWbDO0NMhfYUHaLt6AdHTFPFf4Fgzk=;
        b=F28NbPTqwGk82KPhgIePIr/yVOsd8ZHeuc85iIy6RgqeWSQA78A+fvRVL0VP8eV4RD
         BLvblPqF5rUcKYT79x/4q4ZbAhGRCeuXlbz3gpFAD1FBy9o3e+6cOzg6mUUs10uNCyro
         8OiKGsLKbtgdKHt7ivuqGhWolyvIM/7UFM8aKhMiEZt0Wh/fYJ3F3jHhPYPL5agYLRhW
         rv9NZ2LPoQXen1eEnZ9q6do6bNr7lS3bJv7dkBfk+NzrmowLxyq46HQrbWtc6xZ6k921
         Ic7eGS3lBiTUU0Acf287dz1dOVz+rnJ2DhqwiJeZlaYRWUBtyNtsb18H0YXAfrG47yGd
         LWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624010; x=1796228810;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eGPDDNK/Yei0sGWbDO0NMhfYUHaLt6AdHTFPFf4Fgzk=;
        b=zfDt/9Fib2BfvRtWvbevsi8uZi0WUZyWNgdQ1ajG1AVteuACj7HZHqakLnBhPgEICt
         FZ0P+V7hMGfmU1shQ9u+S5D7bukQnHLGeFoYp09RLvbxeRkbZ2zeHkgyG9BOP9V0lE0W
         6kKekVqdjbaC4fQEw3QCDO4uICpE6SghQep/b6uld+YWdGgNR/CcZSx9rM6HDQb9zVEk
         vFVQyqVQSBvYaebxhavlYeoXOadAdTfanTpgdBLZq2txqgSUjm8eb6k6dvvCnWsB1IXV
         Xzl/H2tv99Ql/LYckflnQq99q88jCmfZdmCDFOly7okao0v8/eWTkZcIwTjG6WRZxY3m
         2apQ==
X-Forwarded-Encrypted: i=1; AL+hErGHKdgzuIamjKTpJgVM9DrdOppUFw54kIomq+pjafwkhH6J2TB9gzSdLeO1WNVZW5cN+xNs1j4nxIVrDgs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Uq5VIvcaYGXnI9UY4j1Nhsdcx0127kIZJh2Hq0j/V8TMcZuxM
	bfSSKPAyLxZho6ZNEpjo8wOytbjRcJLRbKZVjV/9Xd5VNdOpuE4/x0Z0lG0xZc/S3gW5p8Sv0HE
	klbVGy92XSbTMcQehbFIYxF1TU9EN7EjNc4CZGrQx
X-Gm-Gg: AZFdTZduNhlcmnV3IgxByS44JAz1J2uUeWL65NO98eoJjMUbqqI1qhrlXydO5/cPGnR
	2VgqqY3aHO9fz/UyLnu4nESqTNzmMgU/OxHx9MMg51k7PKXeiN15cvsYzTwk5LWF4GcDiaTQq9Y
	JXUr3fmWq0QY9177ssS7W2Ei/8M7wqA47ZfL5p3NNSCV0ANvi1xZp9vsyvyY6MYa75NdSwaW+f9
	i4BmKPsV0YwgL9ewfMiRWR+Iojmyb1/nvhVOXUiAHD2DeW4Fqz3B+tfp4dE4SKa3vok5WvGU6d5
	vyT/ZKf7FXkdmBRFXBNf0pJkxBmweb30HGkVM7NoSVAkSEBJjfIWNbZtTFrfSz2QxVsgh3o4vdA
	bVssXiAmVfwO20VuKLzCcxqU0n/n7kBZSoVOpwsVHnX9zHOuT+1S63VxPRxjAzGjC10AxaXzXch
	B9/TlB1yFBhzkTHCTVpelKFGb/NMMmQ8t6kvV3S7+Zy7RVHjHUar8=
X-Received: by 2002:a17:906:3713:b0:c50:4d71:a85d with SMTP id
 a640c23a62f3a-c513aac5448mr1166580166b.32.1795624009440; Wed, 25 Nov 2026
 08:26:49 -0800 (PST)
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
 <CADrL8HXPKfUhRaVhVyV6CPoQ2apZx1FCpyqyPMr=p=Q_kF3HBA@mail.gmail.com> <0EFB24F3-D3F2-4B28-9684-68CCCC1E80B8@linux.dev>
In-Reply-To: <0EFB24F3-D3F2-4B28-9684-68CCCC1E80B8@linux.dev>
From: James Houghton <jthoughton@google.com>
Date: Wed, 25 Nov 2026 11:26:12 -0500
X-Gm-Features: Aa3M54qAHiURLXighOGPx7-HKZ5MkmT19-dDBj6zUM_QZzKzc5QW8DO7KfwSRns
Message-ID: <CADrL8HXM6Or4_7LM+D0XP9++4eENFt0J4ssShuXQxcmX8mAkoA@mail.gmail.com>
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

On Wed, Nov 25, 2026 at 6:24=E2=80=AFAM Muchun Song <muchun.song@linux.dev>=
 wrote:
>
>
>
> > On Nov 25, 2026, at 01:13, James Houghton <jthoughton@google.com> wrote=
:
> >
> > On Mon, Nov 23, 2026 at 3:50=E2=80=AFAM Muchun Song <muchun.song@linux.=
dev> wrote:
> >>
> >>> On Nov 23, 2026, at 02:44, James Houghton <jthoughton@google.com> wro=
te:
> >>> +/**
> >>> + * hugetlb_vmemmap_optimize_enabled - whether HVO is enabled
> >>> + *
> >>> + * This only reflects the hugetlb_free_vmemmap=3D kernel command lin=
e parameter
> >>> + * and the vm.hugetlb_optimize_vmemmap sysctl, not whether the archi=
tecture
> >>> + * supports HVO (see arch_support_vmemmap_remap()).
> >>> + *
> >>> + * The value is final once early parameters have been parsed only if=
 the
> >>> + * architecture selects CONFIG_ARCH_HUGETLB_VMEMMAP_OPTIMIZATION_SYS=
CTL_RO;
> >>> + * otherwise it may change at any time through the sysctl.
> >>> + *
> >>> + * Return: true if HVO is enabled.
> >>> + */
> >>
> >> I don't think hugetlb_vmemmap_optimize_enabled() has clear semantics.
> >>
> >> Its name suggests that it reports whether HVO is actually enabled and
> >> usable, but it only returns the policy bit set by Kconfig, the command
> >> line, or the sysctl. It may return true even when
> >> arch_support_vmemmap_remap() is false. This is particularly confusing
> >> because arm64 calls it while determining the capability on which
> >> arch_support_vmemmap_remap() itself depends. Therefore, the helper
> >> really reports whether HVO was requested, rather than whether it is
> >> enabled.
> >
> > I agree, the name is misleading.
> >
> >> Could we keep vmemmap_optimize_enabled private and let arm64 retain
> >> the boot-time setting locally instead? For example, arm64 can use a
> >> private hvo_enabled_at_boot variable with a
> >> core_param(hugetlb_free_vmemmap, ...) registration. The system
> >> capability is evaluated after core parameters have been parsed, and
> >> arm64 makes the HVO sysctl read-only, so the value remains stable for
> >> system capability and late CPU verification.
> >>
> >> What do you think?
> >>
> >> +static bool hvo_enabled_at_boot __ro_after_init =3D
> >> +       IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON);
> >> +core_param(hugetlb_free_vmemmap, hvo_enabled_at_boot, bool, 0);
> >> +
> >> static bool has_bbm_through_af(const struct arm64_cpu_capabilities *ca=
ps, int scope)
> >> {
> >>        /* The kernel only enables HW AF updates with CONFIG_ARM64_HW_A=
FDBM. */
> >> @@ -2055,7 +2059,8 @@ static bool has_bbm_through_af(const struct arm6=
4_cpu_capabilities *caps, int sc
> >>         * BBM-through-AF is only needed for HVO. If HVO is not in use,=
 don't
> >>         * penalize systems with mismatched support.
> >>         */
> >> -       if (!hugetlb_vmemmap_optimize_enabled()) {
> >> +       if (!IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP) ||
> >> +           !hvo_enabled_at_boot) {
> >>                /* Only valid if HVO cannot be enabled later via the sy=
sctl. */
> >>                BUILD_BUG_ON(!IS_ENABLED(CONFIG_ARCH_HUGETLB_VMEMMAP_OP=
TIMIZATION_SYSCTL_RO));
> >>                return false;
> >>
> >
> > This is a good suggestion, but let me explain why I don't think we
> > should do this:
> >
> > First of all, I'm changing the bbm_through_af capability from a
> > SYSTEM_FEATURE to an EARLY_LOCAL_CPU_FEATURE, which means that
> > has_bbm_through_af() will be evaluated before core_param()s are
> > parsed. I could change it back to a SYSTEM_FEATURE, but I would rather
> > not do that. (See [1]).
>
> Actually you can use early_param.

You're right that they won't conflict (today I learned).

> >
> > I also don't like duplicate parsing of the same command line argument.
> > I'm not sure if there is precedent for this, but I feel like it will
> > lead to confusion. (It is news to me that duplicate parsing like this
> > is valid, as long as they are not both core_param()? or
> > early_param()s, I think?)
>
> I checked the command-line parsing paths, and having more than one
> handler observe the same command-line option is supported. In
> particular, it is not restricted to handlers of different types.
>
> do_early_param() walks the entire .init.setup table and invokes every
> matching early_param() entry; it does not stop after the first match.
> There are several existing examples:
>
> - "kfence.sample_interval=3D" is parsed early by the arm64 and powerpc
>   MM code and is parsed again by the generic KFENCE module_param_cb().
>
> - "pci=3D" is registered with early_param() in both
>   arch/x86/kernel/acpi/boot.c and drivers/pci/pci.c.
>
> - "console=3D" is handled by an early_param() in
>   drivers/tty/serial/earlycon.c and by __setup() in
>   kernel/printk/printk.c.
>
> I agree that duplicate parsing should be used carefully, but these
> handlers would not be competing to own the same state. The generic HVO
> code does not need to expose its internal policy state solely for arm64
> capability detection. Arm64 only needs a local snapshot of whether HVO
> was requested at boot in order to decide whether the BBM-through-AF CPU
> capability is needed.

How HVO is requested could change in the future, right? Like if a new
command line option is added, for example. I (strongly) feel like it's
better to provide arm64 a way to properly determine if HVO has been
requested, rather than parsing the "hugetlb_free_vmemmap" option
itself and trying to keep mm and arm64's parsing logic in sync. Even
today, although the parsing logic is simple, duplicating is really not
ideal.

I feel like Will and Catalin will be opposed to having
`early_param(hugetlb_free_vmemmap)` in arm64 code, too.

Also, doing it this way, if an invalid value is set, we would see
"Malformed early option" twice instead of just once.

So let's just add that helper to expose whether or not HVO was
requested; I don't see anything wrong with that. Do you agree with
that?


>
>
> >
> > It would be much easier just to rename
> > hugetlb_vmemmap_optimize_enabled() to
> > hugetlb_vmemmap_optimize_requested() and properly document what it
> > returns. Does that sound good to you?
> >
> > [1] https://lore.kernel.org/linux-mm/CADrL8HUgo0zAHe7_eF1+hfTR6jBbZ=3DU=
KB1qPpMWpksvqbNHsyw@mail.gmail.com/
>
>
