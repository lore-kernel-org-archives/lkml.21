Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795021967;
	b=OxVsqAHdXaaVNg2V8+joQM5Wcom3CpVpIrYAamOTUZGQuY4f1yPfccq8/Q/7NlBMF4oe
	 TVhMqOSMvb3SOW4eKzeUzVCNt3h1NqiuwiQ+RpQvPT++nDRiW6eNNNhlTblbV7pOE6Fmy
	 NEUMbr2cY/Ogboci3k9tHAmEXFW/3PwoornUSmZckBvtUCs6J714Bo4JTLgiF7mzrtcGl
	 OM2jnztY4vVIJZp/ygLo8eKM3slifFCiIiyHjf4r19rCRO173oFDJEV9J11iafOmUMcLG
	 pX/R3qqfGQCQsCJdE52C2kLWmHFzjtjcuu/WE35c7QoZWS9F+FpyG53H4pcKrPmBuWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kj5IcdHjs/z1V+/LJdG1g61ItzctekOK1S6KD/iqV70=;
	b=iEcArg0fO/kh1KcLBRd3/BhdhWjMBk+1GRYSgn45T07vJHbY8zmDtm6pcYOvkH8p/13l
	 CUpipl/F3siTGxdRiqNP3cX42lVNuBpO8yJM8/A0yR+oQFbw7JdhMCi0Ycg+HZsGzhfXk
	 42utSSKB3HBQBdBvU4X0N9KhF2kW8JYv4XqU4RmFuKZiJA61RxHiHrkRFJBa3MjUlnLDy
	 cI/fylRSD6yzdIrdkSEqD2qctwIeNVxSurCG+2R2s9Zaef5UQhXRPm5eWeIUH72nI52rp
	 2HQdKuZ7nzYN1T79/ZONBsZl339JYeEELainyLenTG7v3cfP1joIvNWSjUXi2OkLTYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pnlnkisJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E339606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:12:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E339606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pnlnkisJ
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-55c7445cf85so332511cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:12:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795021965; cv=none;
        d=google.com; s=arc-20260327;
        b=e/uZ/L7g8v21mtYQkTeR3DYAMn29xNLE56ROf/ZNbFROTHO4qlZRB9HUx5oB1vY6QC
         niaB98Hi4lJ1pTy/nhSaayPMlTfa3g3XzT6TOSXHqB5YjhonV54LnbzvdVkBPz4OT2/P
         iW52dRorQZpYIntLutsuaT4pc5FK2p8TMIk6XaxRR2LNSZOzEs6eAHu3GP3gNiA1z7FN
         avEiPSkCPbPZ6mhg/SkrEthOFfsdkxZHFbucyca7GzX3mPJIxFdu+Cnys1uUNbrnVNcD
         gDmh1rlAdCV7A+WVoO14NYsAAFVkBUS0hZVeRqLMYMQkKXsq/7C9FOO8h1CUGFRlS9CZ
         vN0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kj5IcdHjs/z1V+/LJdG1g61ItzctekOK1S6KD/iqV70=;
        fh=1GFVQfw4mBeNKlw7BTtKzAAEGPfmzyJZeCLFbF7VFcs=;
        b=I2oH9ejl4tl2eICG2ay80XMywOjmWVfcaWZ/wQDnNvoLsIWCFlT29IrPMnFIYpW7Lg
         XvbxQm4yYHmSHmM8S9rsAgH0mXB+o9G/b7o0dEH+vi3qdmwW8icn5I36ToRgNy0F/uFt
         fRFASUtAGCKQXQE5kPhyNe+v1KsnIp4KYHMODj+ymhFuruZ8UHD10IaL9kQ6heSkr8TT
         GLTUIE7EZp+vKWUrqT7uFP65kvv59qPo0dlXzN7eHBCR6P8vORA4oq2+2xPq5Y8Mj7FY
         I5aWPscVNRU9D7McJ4q56gM3FYSG5FlomvYlt0+GBPxjcDpj1FaJ3BIZjYFK7XoSkrUT
         rYvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795021965; x=1795626765; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kj5IcdHjs/z1V+/LJdG1g61ItzctekOK1S6KD/iqV70=;
        b=pnlnkisJaQe3pZb7L4JVEaOoOfXN9/ibTszzKn+2/H0Po9J1Yufo1b5OW+l9+byQou
         ZnzHzXHZOh9T+fuLHicSvtW2O/QtzMZv46Aa+3t+It1ED2n0KgxACV2yS8EGJ9yr6ogp
         xffrTDbo47c1U9MYz+T56ZlIk0t6+mHAEHoVp/7i2+5uue6GLMyrvU/x6s/asGx1M7RE
         OZR44AxNfUkAo5iXrucFU+QWp4u+bqLswFikYTUbEGAxJyFZLL2ECjK+GUK6GY8m0rmM
         49fSEDBL5FvvAv0yRCMbRCIa0seb8BhE3m8JqPbnRX4Noq5uUqJeBT5VaizYM8xEW3Rl
         D4tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795021965; x=1795626765;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kj5IcdHjs/z1V+/LJdG1g61ItzctekOK1S6KD/iqV70=;
        b=oRVpAA4Ev8RufwkpZwkhPlyRUNDP+hkyLBXEzTcsKJm1N64tbKdaXTAwQZL1w5LHdF
         JzqtPJSm6t25aJDIVF4Zpj2PrN6AEzq1XZVCQ+iLFh4Eg7VY66WmVLzyZH9chyJQ26+A
         PfC66oB2lPedfFokNrC+fp5MMU5d4BlJUWK0dLKKOLMiWDhcNvi6XvIQfWqkYpo7opCH
         BqpSOX5YylJqN9n3MUXn4lYD0sv2mogNI3OB9NtMhLD1L5ilJ0VY351hMjAk6uuNdJkr
         yXdceDZhxb4aHvjKgQ3iQxaFUR8XPWW7X5RWrcB4J4FvIblzVgfig9HWCA/vHiIoDidY
         x4GQ==
X-Forwarded-Encrypted: i=1; AL+hErEmcC3WtUEP4hma6V6U1L8iewQHXC7WlJuhBIb0H/C1a+9KavjoGBRBuWHdfYlcpdvJuiXFxiYIlOUuBEY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ABOBlIigmEfjhTgqGWF8xX3c1dB2ptXyLuNiKA5e4xsrC8OTg
	P2oiVzv4GE8Ue5zFRz7u0tgXnjp8TgJfSsAHbLtwumw8jD4w6GdXmbp7+MfvngH5apzOdl9eSoA
	N6Xv/TS4otrMd3jkg2hfSHIGEpdeh2qEuwC6y8WDB
X-Gm-Gg: AYBFou1VXOK9+ldFUC01spmQAm2hakYM+OeB8S33YgTgmolgdBXjd7zc0lLq2m2Cc0y
	yfPgoo4K/kbpKobDY2VqhcwwKAqsdyOEH2zBWY+vWkqZ5BD2DiShbyCUKx4ChbHdvu7jANRTUCs
	lflmk3yAWqMgfWrdoiym49rEcnK9M1luJldaWk+RtmQ0Lj2aIEb3FfawQTSHPlWYDUSIj9X+adR
	mUsWOIBOAKMw6ixadaUJRlKND1txc86mXzugU35UXP3nrBSgonB7XZ/FtN7/k1AY4XpAYdIJ8Q3
	+QjINdoH0bQ9Da1JhOzWXp5pQlE2Vk/1tPMKd0iQvobqlLimt0Pz64lKSGs9HklNhRQXeIGAD4O
	0xwH24DWb1ddgUva361hcTlPVGaFmPZd4x/8J9BnD0KguAtYh1SPzyR2mRAEAWATOc10IcE77KB
	xOjA9j0UEWCeM=
X-Received: by 2002:a05:622a:1dc5:b0:55b:ce7e:e65 with SMTP id
 d75a77b69052e-55d5c29fda9mr23970181cf.12.1795021960454; Wed, 18 Nov 2026
 09:12:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108223913.3624571-1-irogers@google.com>
In-Reply-To: <20261108223913.3624571-1-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 18 Nov 2026 09:12:29 -0800
X-Gm-Features: Aa3M54qyzLQ2yGg7ApijI1zPo5xfsOEZjqndSHZFPBok7AO4SwuYd0EVkVosTyY
Message-ID: <CAP-5=fXEk-ommviDYeD6hMvsESJMHfajina4kjMw6NMuRfQmTg@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] Add __must_init and require explicit kobj_type::release
To: Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kees Cook <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 2:39=E2=80=AFPM Ian Rogers <irogers@google.com> wrot=
e:
>
> Clang supports the 'require_explicit_initialization' attribute on struct
> fields to enforce that the field is explicitly initialized when an
> aggregate object is constructed, emitting -Wuninitialized-explicit-init
> (enabled by default) if the field is omitted.
>
> Following discussion at the Linux Plumbers Conference [1], patch 1 adds
> the attribute to include/linux/compiler_attributes.h as __must_init. In
> v1 it was called __require_explicit_initialization. Kees picked up that
> patch with a first seq_file user [2], and in that thread Greg suggested
> the shorter __must_init spelling, which Kees and Miguel agreed to. As
> the attribute did not land in the v7.4 merge window, Kees asked that
> this series carry the renamed attribute.
>
> As Documentation/core-api/kobject.rst notes:
>   "One important point cannot be overstated: every kobject must have a
>   release() method, and the kobject must persist (in a consistent state)
>   until that method is called. If these constraints are not met, the
>   code is flawed."
>
> Annotating struct kobj_type::release caught struct kobj_type definitions
> across the tree that omitted .release:
> - Patches 2-8 fix struct kobj_type definitions where dynamically
>   allocated kobjects, ksets, or enclosing structures were either leaked
>   on kobject_put(), freed prematurely before kobject release, or missing
>   proper static initializers.
> - Patch 9 annotates struct kobj_type::release with __must_init and
>   explicitly sets .release =3D NULL (with explanatory comments prefixed
>   with "Pre-existing:") on the remaining legacy struct kobj_type
>   definitions whose kobjects are static, per-CPU, permanent firmware
>   structures, or embedded in devm- or parent-managed allocations.
>
> Danilo Krummrich offered to route the series as a whole through the
> driver-core tree [3]. Subsystem maintainer Acked-by tags are still
> needed (and would be much appreciated!) for the following three patches:
> - Patch 2: powerpc/secvar: Add missing kobject release callback to secvar=
_ktype
> - Patch 3: sh: sq: Add missing kobject release callback to ktype_percpu_e=
ntry
> - Patch 6: xen/sys-hypervisor: Add release callback to hyp_sysfs_kobj_typ=
e
>
> Note on tool use: An LLM coding assistant was used to help audit the
> compiler diagnostics across the tree, draft the fixes and changelog
> descriptions, and verify builds and review feedback.
>
> Changes in v3:
> - Rebased on v7.4-rc1.
> - Note in cover letter that patches 2 (powerpc/secvar), 3 (sh: sq), and
>   6 (xen/sys-hypervisor) are still awaiting subsystem Acked-by tags for
>   merging through the driver-core tree, and CC those maintainers on the
>   cover letter.
> - Patch 1: Add Reviewed-by from Kees Cook; clarify that LLVM issue
>   #232483 affects Clang versions prior to its upstream fix (pointed out
>   by Nathan Chancellor).
> - Patch 4 (cpufreq): Drop obsolete reference to cpufreq_governor_dbs in
>   the commit message per Zhongqiu Han; add Reviewed-by from Zhongqiu Han
>   and Acked-by from Rafael J. Wysocki and Viresh Kumar.
> - Patch 5 (dlm): Add Acked-by from Alexander Aring.
> - Patch 8 (drm/amdkfd): Add Reviewed-by from Felix Kuehling.
> - Patch 9 (kobject): Fix omapfb manager-sysfs.c and overlay-sysfs.c
>   comments to describe managers[] and overlays[] as dynamically
>   allocated rather than static and note the CONFIG_DEBUG_KOBJECT_RELEASE
>   hazard, fix a struct-vs-member wording nit in usnic_ib_sysfs.c, and
>   generalize the commit message note on CONFIG_DEBUG_KOBJECT_RELEASE
>   (reported by Sashiko).
>
> Changes in v2:
> - Rebased on v7.3-16928-g83f32c773255 (v7.4 merge window).
> - Patch 1: Rename __require_explicit_initialization to __must_init per
>   Greg Kroah-Hartman; document the Clang >=3D 20 requirement per Miguel
>   Ojeda; note the Clang gap for file-scope objects without an
>   initializer reported by Kees Cook; add tags from v1 and from Kees's
>   posting.
> - Move LLM assistance attribution from Assisted-by tags to this cover
>   letter per commit 1e035297ffda ("docs: remove Assisted-by
>   references").
> - Patch 4 (cpufreq): Use "cpufreq: governor:" prefix, drop Fixes tag,
>   fix typo, and remove the redundant runtime assignment in
>   cpufreq_dbs_governor_init() per Zhongqiu Han.
> - Dropped v1 patch 5 (ACPI: CPPC), already fixed upstream by
>   commit 27954e29d7de ("ACPI: CPPC: Release CPC descriptors through
>   kobject").
> - Patch 5 (dlm): Call kobject_del() before dlm_recoverd_stop() in
>   release_lockspace() and the new_lockspace() error path, and wait on a
>   new ls_kobj_done completion before freeing the lockspace or dropping
>   the module reference, avoiding races with delayed kobject release.
> - Dropped v1 patch 8 (s390/sclp_mem) per Sumanth Korikkar: the
>   /sys/firmware/memory/memoryX kobjects are permanent, so sclp_mem.c is
>   folded into patch 9 with .release =3D NULL.
> - Patch 7 (ubifs): Add Tested-by and Reviewed-by from Zhihao Cheng.
> - Patch 8 (drm/amdkfd): Check q->kobj.state_in_sysfs before
>   kobject_del() in kfd_procfs_del_queue().
> - Patch 9 (kobject): Cover sclp_mem.c and the new amdgpu_ualink.c
>   ualink_xcp_info_ktype, fix the overlay-sysfs.c comment, and prefix
>   legacy .release =3D NULL comments with "Pre-existing:".
> - Patch 9 (kobject): The ioat, kunpeng_hccs and omapfb display comments
>   now say that the existing teardown can use-after-free under
>   CONFIG_DEBUG_KOBJECT_RELEASE (reported by Sashiko). Fixing those
>   drivers is left to follow-up patches.
>
> v2: https://lore.kernel.org/all/20261027223847.652884-1-irogers@google.co=
m/
> v1: https://lore.kernel.org/all/20261013223946.1836757-1-irogers@google.c=
om/
> [1] https://lpc.events/event/20/contributions/2392/
> [2] https://lore.kernel.org/lkml/20261014225811.i.852-kees@kernel.org/
> [3] https://lore.kernel.org/all/DMLWX8NY1N1N.2OMQMQCIVRR18@kernel.org/
>
> Ian Rogers (9):
>   Compiler Attributes: Add __must_init macro
>   powerpc/secvar: Add missing kobject release callback to secvar_ktype
>   sh: sq: Add missing kobject release callback to ktype_percpu_entry
>   cpufreq: governor: Initialize kobj_type release callback statically
>   dlm: Free dlm_ls in kobject release callback
>   xen/sys-hypervisor: Add release callback to hyp_sysfs_kobj_type
>   ubifs: sysfs: Use kset_create_and_add() for ubifs_kset
>   drm/amdkfd: Free queue in procfs_queue_type kobject release callback
>   kobject: Require explicit initialization of struct kobj_type::release

Hi Danilo,

Just a quick heads-up that all three remaining subsystem ACKs have now
arrived on the v3 thread:
 - 2/9 (powerpc/secvar): Acked-by Madhavan Srinivasan, Reviewed-by
Srish Srinivasan
 - 3/9 (sh: sq): Acked-by John Paul Adrian Glaubitz
 - 6/9 (xen/sys-hypervisor): Reviewed-by Juergen Gross

v3 still applies cleanly to driver-core-next (and b4 picks up all the
tags). Sashiko did flag more accurate Fixes: SHAs on 5/9
(8a4cf500f1dd) and 7/9 (2e3cbf425804) =E2=80=94 happy to send a quick v4 wi=
th
those and the new tags folded in if you prefer, otherwise v3 is ready
as-is.

Thanks,
Ian

>  Documentation/conf.py                         |  1 +
>  arch/arm64/kernel/cpuinfo.c                   |  5 ++++
>  arch/powerpc/kernel/secvar-sysfs.c            |  6 +++++
>  arch/sh/kernel/cpu/sh4/sq.c                   |  6 +++++
>  drivers/acpi/sysfs.c                          |  2 ++
>  drivers/cpufreq/cpufreq_conservative.c        |  5 +++-
>  drivers/cpufreq/cpufreq_governor.c            |  4 +--
>  drivers/cpufreq/cpufreq_governor.h            |  1 +
>  drivers/cpufreq/cpufreq_ondemand.c            |  5 +++-
>  drivers/dma/ioat/sysfs.c                      |  7 +++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c    |  5 ++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c       | 10 +++++++
>  drivers/gpu/drm/amd/amdkfd/kfd_process.c      | 12 ++++++---
>  drivers/gpu/drm/amd/amdkfd/kfd_queue.c        |  5 +++-
>  drivers/infiniband/hw/hfi1/sysfs.c            |  5 ++++
>  drivers/infiniband/hw/usnic/usnic_ib_sysfs.c  |  5 ++++
>  drivers/parisc/pdc_stable.c                   |  5 ++++
>  drivers/power/supply/ab8500_fg.c              |  5 ++++
>  drivers/s390/char/sclp_mem.c                  |  2 ++
>  drivers/soc/hisilicon/kunpeng_hccs.c          | 21 +++++++++++++++
>  .../fbdev/omap2/omapfb/dss/display-sysfs.c    |  7 +++++
>  .../fbdev/omap2/omapfb/dss/manager-sysfs.c    |  8 ++++++
>  .../fbdev/omap2/omapfb/dss/overlay-sysfs.c    |  8 ++++++
>  drivers/xen/sys-hypervisor.c                  |  6 +++++
>  fs/dlm/dlm_internal.h                         |  1 +
>  fs/dlm/lockspace.c                            | 26 ++++++++++++++-----
>  fs/erofs/sysfs.c                              | 10 +++++++
>  fs/f2fs/sysfs.c                               | 15 +++++++++++
>  fs/ocfs2/cluster/masklog.c                    |  5 ++++
>  fs/ubifs/sysfs.c                              | 24 +++++------------
>  include/linux/compiler_attributes.h           | 12 +++++++++
>  include/linux/kobject.h                       |  2 +-
>  scripts/checkpatch.pl                         |  1 +
>  tools/lib/python/kdoc/xforms_lists.py         |  1 +
>  34 files changed, 211 insertions(+), 32 deletions(-)
>
>
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> --
> 2.56.0.455.g6c5a503b38-goog
>
