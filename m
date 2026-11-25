Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795584591;
	b=Fs0UVUpX9wsaQfQIdNXcArHd7dAL/5KmXY+tFQNJ8OUARVw8fnRY0dui+ugVu/TqZG1Z
	 j9navrCwvI4mlcR6IBdYJP3BUs8GFrfUtIJEt8iuZsG2ufglyOdVFUtL+ZRa6mXRuBcSL
	 kVimuYtTqau9qH40GZu1Y5qYpftXEJFS4zyv3yRveS6rI4ihVKG7ndQGKY0StplLJenGM
	 GUjCAxiXg54F3bE4ojMoN7RoLiZv5OlgHsE6UlV9q6+bUDCmW5r7HUNeap9Qy+JAi1Ze3
	 xyQAdjiL90OWHBCtCc1YOcC3olOkwFRyrbk6rgQXN9EgPI7FoQun9k7o2ANzW1KDPyQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795584591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=z31507qutrSHsDuMlMYuZrOSlqTz0X7hfxnmDVf3XDU=;
	b=UvgfnrtCUdxtwq5OfytHkWPgJedS3MQ1OSduvPnhILiM4asZ1g/jn9Zwj4SqeOUyOPFr
	 zConE7gGbBFJwmFG5RY730kLMhH6MXCCfYdfrzo9XU85ZuiHLwFnT83dyo9JllygE7Te/
	 IJX8x6F26OOETsiurntTLymY7WjUc9ZKiT+Ld8GLkZxAawKRnxAXhwzk3psAVAelK6YZa
	 ztT/Hg0dWgMehWt4w5MxZfJm2v2tMogfYP9Wdeu+Fauoq3zTEX8lHPn5vtCVWfeeiachq
	 JQuacn34kE1bvPMy/YGFiVDWesvJzHRzpFqfRZ8BIxrk8Ihz1N/nB12Vv9LRx8S9mzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Vu1ZMuzN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.45
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5134B606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5134B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Vu1ZMuzN
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7d2d95c5d81so3704992137.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:29:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795584590; cv=none;
        d=google.com; s=arc-20260327;
        b=mRekshK6rZr/6RGDYqCUuLSLRakpqVZSprPZ6FU3eW8ka5whmvIJkbEMgth3Q2Vzyc
         bxkz05B61K9b4/4bzd2TXpewgGx7oAOge0QOmXzHPKP95m2XfPsd4AsppM/BKJvWI8SP
         5J+Y6dR5gTywicjrNGcHOyy9mrELPntOKvmR5IhAm2pSUUjTbp5Zvzp6CVwxbFdJBMmF
         qrAJ4Sm6e6Gl0pGQAjLZCZ0oTAyekfy9lbtGmp00l4nn1hBQD61kosaXwOpQjFFzMzN4
         WE/QiWs4upKcD+HpKswjrYypmQrEcYnQC9MkG0gzfY3UfbF1CSZLgdZVROkLgB+ZO/xj
         4I6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z31507qutrSHsDuMlMYuZrOSlqTz0X7hfxnmDVf3XDU=;
        fh=JvmAOxeyw3/l9ZIOQDCQtBHKfMJvId/+9WT8XGYMXKQ=;
        b=GPshk3/yIMbI09n4T+iYozYsh12xWmXS5DZo1PtJ+vLVrgnG371drV8ODkcgiUKpsj
         PwEvOOXHD5YQtl2NTXu+ZmtEfnsRaMAzCd0mh6pG+KNm5h2R72ITuf9iGzyVlJq3Rsk0
         95sojBtCv398KJ5GmdJktNlvcmunX+NFvw0MCXilALQ3aWHSWt1GET6ugF3OxtFe2RJe
         wV/aFxwcY9tjNlIJM2drR/rmM6ZcnMhGA5yl1ZwevVUil/efDiH+xgaHlvSojbJr/+jR
         amr6koxPA4MxYp0oTbG8EeqWLCAwqsbatnJT97RxxWuV8NWVgMsEHxU+JvBsjQebvqIK
         OrvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795584590; x=1796189390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z31507qutrSHsDuMlMYuZrOSlqTz0X7hfxnmDVf3XDU=;
        b=Vu1ZMuzNjD/jmZHcDQuYuXLVaA8JKz5bT+Q+Iv6B/Wj/gNGG5S7G3BAFrKYj/DbVvw
         u41eU3ziEv0qrdbe6M7e3glHTKrvbxBUhEXkALZ1rmakvwJ1zzwmhqJvXx2jCLpwki3H
         /5UWWQVCCk5ssGKumQYeB0XhMpG2D8V76OdhjE42DUT00b8d0y49pp078JtqUgC49+RE
         50PuIRhnGNmQphEph6bhlRGClu7Uy2H04a7FtgxS7P3iBs9FzLLPKJ/rTpYN8nPGogtl
         6ZeVyILHiUVnvZC8obTw3Txg0JJcbUfVRAIWhYJ7B6071xn3f169NY4lN3RS/8J3vPxU
         /46w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795584590; x=1796189390;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z31507qutrSHsDuMlMYuZrOSlqTz0X7hfxnmDVf3XDU=;
        b=FYLDazLo2F0T0SX8xjv21klqZYLJeStD6QMVQ3HIkH25abmYaP5a3rBw+g6R8KjYwx
         KrLKHx+CCyhsjEqlU0gjl9PnCuQ38rssArbg5iyy3BchJ2lyJAZrsAcOGcOQkH5u7OoS
         fFO/2/uRl+caeB5dBz9AI+XZJ9i6yxX90Fj/vN+0B7Iw9IUdV9gGucLXgET6am/W76m1
         NQ6SVC8KW7Tvh5omGhKB0fNYu3cpIL98zOrDJE3mB31jAnvAQobo0UVSf/5v6BE/Gw6z
         zDL8miBpR9oC8ij/FnhrANmKBju8yCnzeOECTwcSuavHlhSb+V6BDA0KLeow0zaSnkzi
         G1LA==
X-Forwarded-Encrypted: i=1; AL+hErHqXkqMDEK+6CKAcgi/6rE2C3WcXjrYK8/ae3uYNPREbE9nbtGzl/v04Mg4Vx6VcFUV9Tv9U4FRjhWakXU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rTvGRRK34zuIarsm0LQGEasUjMsSudXXuTpFlp32YDYanz43b
	KKCwgPIuQurp5voM5tZwpP4yGsS0z8XAwz21as88cjhuD7/uDismtORwSAFR1kpDwE0LP7lvyR1
	SfwifnVROfShK45womUhQfngl08sLbYR/PMKeZhxq
X-Gm-Gg: AZFdTZe1i7MO9yuKjQX7euohQpJiFCKc1p5wAaDihRyRu6o3oWJy278nJyTC+epmpF5
	DTFNqcuAkQfQ9bF+T39BJ5hlH52BovICtFeMsPs2Pi1UfkmznhK5nSEnHhhkDHvr6fTBvKy+Hh9
	LkOa9u6tV/C+OBiO2CpOhGrjobmNxVrmuVyWfCLe/thhl8rN17dIS09UMOedTWvN5QKcI/dlMtT
	HmtTOlg9WX6r3DMvd2BewRY6kNnYBi+CpPGSdfFViohq/h4JfcM+Se03ybgs0u+OKz5HTP6VS7Z
	dQxjVG6TW42og3TgDwd6Z31oWeJkF6jp2MZaaB3h3VdgOUxVBoaO9YTVICSbusmusIXP3Jv3eOo
	D9py8DJamj9NWNFWQjKxrWDbZ+FpiSHtBJdgIuyLuN8FSr6Kjnvue96aAGkSYIug/8zZ44+92wO
	+jgB26paRSzuVHF53VUQ1rnGmczTfpsIGgExE2cN+bMB0Ojq/L7gp3yxJ1JzKH3oW/Juixnhwo
X-Received: by 2002:a05:6102:4488:b0:7cb:bb7b:77e4 with SMTP id
 ada2fe7eead31-7d7393b30c6mr5630777137.3.1795584589058; Tue, 24 Nov 2026
 21:29:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118101913.3135869-3-amitamishra@google.com> <20261123154945.3083888-1-praan@google.com>
In-Reply-To: <20261123154945.3083888-1-praan@google.com>
From: Amita Mishra <amitamishra@google.com>
Date: Wed, 25 Nov 2026 10:59:36 +0530
X-Gm-Features: Aa3M54pSWQSSH-CwFoe9S0jqnWcBEelhF7YQ6aGMTLjqJveDGr8T5HV3QQARPWM
Message-ID: <CANLJkh0O=_hYhjv1QJKVfoLFp75RCgKRGHuKh2ubDA8EUExGsw@mail.gmail.com>
Subject: Re: [PATCH 2/2] perf/smmuv3: Add runtime PM support
To: Pranjal Shrivastava <praan@google.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mark.rutland@arm.com, robh@kernel.org, 
	robin.murphy@arm.com, will@kernel.org, iommu@lists.linux.dev, 
	smostafa@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Pranjal,

Thanks for the thorough review and for adding iommu@lists.linux.dev -- I'll
make sure to include it on v2.

On Mon, Nov 23, 2026 at 03:49:45PM +0000, Pranjal Shrivastava wrote:
> On Wed, Nov 18, 2026 at 10:19:13AM +0000, Amita Mishra wrote:
> > On SoCs where an SMMUv3 PMCG resides in a switchable power domain,
> > probing the PMCG attaches and powers on the domain, but without runtime
> > PM support the domain remains permanently powered on even when no perf
> > events are active.
>
> I'm interested to know which PMCGs are these? Upstream arm-smmu-v3
> doesn't have runtime PM yet, thus, a PMCG that shares its SMMU's power
> domain gains nothing from this today: the SMMU keeps the domain on anyway
>
> With my arm-smmu-v3 runtime PM series [1], the SMMU lets go of the domain
> once it has no active clients, and then a PMCG without runtime PM would b=
e
> the one keeping it on, the two series seem to fit together. For TBU PMCGs
> in a subsystem's domain this matters either way.
>
> I'm wondering if you have PMCGs in power-domains that are neither tied to
> the SMMU power-domain and nor it's clients' power-domain?
> (That'd be a bit odd but possible).

They are the two cases you mentioned -- TBU PMCGs residing in switchable
subsystem/client power domains (which already use runtime PM today), and
TCU PMCGs sharing the SMMU power domain (which pair with your arm-smmu-v3
runtime PM series). There isn't a separate third power domain.

> Which makes me question whether the PMCG needs runtime PM at all. It's
> a profiling tool, and I'd be surprised if production devices that use
> runtime PM keep PMCG events open. Without events nothing needs the PMCG
> powered, so all this buys is not pinning the domain while the driver is
> probed but unused..
>
> Do you probe the PMCGs on production devices? If they're only used for
> profiling and not in-field, not loading the driver there (or leaving the
> node disabled) avoids the problem without runtime PM in the driver.

Yes -- the same SoC DT and kernel image are used across production and
profiling/debug builds, and we want PMCGs available on demand for profiling
without maintaining separate DTs or manually toggling drivers/nodes. Today,
simply having the node enabled and probed pins the attached subsystem/SMMU
power domain on permanently even when no perf events are ever opened, which
causes power regressions on idle devices.

On holding the runtime PM reference for the lifetime of an event
(event_init -> destroy): fair point about disabled events and the observer
effect on TBU TLB/config-cache misses while profiling. Because perf's
->add()/->start()/->pmu_enable() callbacks run in atomic context, taking th=
e
reference in ->event_init() and dropping it in ->destroy() (similar to
drivers/gpu/drm/xe/xe_pmu.c) was the cleanest way to keep the PMCG powered
whenever events exist while allowing idle systems with no open events to
power-gate.

> > @@ -975,15 +1040,45 @@ static void smmu_pmu_remove(struct platform_devi=
ce *pdev)
> >
> >      perf_pmu_unregister(&smmu_pmu->pmu);
> >      cpuhp_state_remove_instance_nocalls(cpuhp_state_num, &smmu_pmu->no=
de);
> > +    if (pdev->dev.pm_domain)
> > +        pm_runtime_disable(&pdev->dev);
> >  }
>
> Events hold a module reference and bind/unbind is suppressed, so this
> only runs with no events, i.e. normally with the PMCG runtime-suspended.
> devres then frees the IRQ: free_irq() -> msi_domain_deactivate() ->
> smmu_pmu_write_msi_msg() writes to the unpowered PMCG, since the PM
> domain is only detached after devres in device_unbind_cleanup().
[...]
> > +static int smmu_pmu_runtime_resume(struct device *dev)
> > +{
> > +    struct smmu_pmu *smmu_pmu =3D dev_get_drvdata(dev);
> > +
> > +    smmu_pmu_reset(smmu_pmu);
> > +    return 0;
> > +}
>
> Sashiko flagged this too: after a power-off the IRQ configuration is
> gone, and smmu_pmu_reset() doesn't put it back.
[...]
> This is the same problem I had to solve for the SMMU in [1]: patches
> 7-8 make the genirq/msi core cache the message in
> irq_chip_write_msi_msg() and add msi_device_domain_restore_msi_msgs(),
> and arm_smmu_resume_msis() in patch 9 clears the IRQ_CFG0 registers and
> then calls it (a no-op for wired IRQs).

Agreed on both MSI issues -- I'll fix them in v2. Since
msi_device_domain_restore_msi_msgs() isn't in mainline yet, would you
prefer that v2 stays standalone by caching the single msi_msg locally in
struct smmu_pmu (clearing SMMU_PMCG_IRQ_CFG0 and restoring on resume, and
skipping MMIO in smmu_pmu_write_msi_msg() while suspended), or should this
wait/build on top of your genirq/msi patches from [1]?

> Minor: an autosuspend delay would avoid powering the domain on and off
> for every event open/close.

Sounds good, I can add autosuspend support in v2 as well.

Regards,
Amita


On Mon, Nov 23, 2026 at 9:19=E2=80=AFPM Pranjal Shrivastava <praan@google.c=
om> wrote:
>
> On Wed, Nov 18, 2026 at 10:19:13AM +0000, Amita Mishra wrote:
>
> Hi Amita,
>
> +iommu@lists.linux.dev
> Please CC the iommu list as well.
>
> > On SoCs where an SMMUv3 PMCG resides in a switchable power domain,
> > probing the PMCG attaches and powers on the domain, but without runtime
> > PM support the domain remains permanently powered on even when no perf
> > events are active.
>
> I'm interested to know which PMCGs are these? Upstream arm-smmu-v3
> doesn't have runtime PM yet, thus, a PMCG that shares its SMMU's power
> domain gains nothing from this today: the SMMU keeps the domain on anyway
>
> With my arm-smmu-v3 runtime PM series [1], the SMMU lets go of the domain
> once it has no active clients, and then a PMCG without runtime PM would b=
e
> the one keeping it on, the two series seem to fit together. For TBU PMCGs
> in a subsystem's domain this matters either way.
>
> I'm wondering if you have PMCGs in power-domains that are neither tied to
> the SMMU power-domain and nor it's clients' power-domain?
> (That'd be a bit odd but possible).
>
> [...]
>
> > +    /* The same condition smmu_pmu_probe() enables runtime PM on. */
> > +    if (dev->pm_domain) {
> > +        int ret =3D pm_runtime_resume_and_get(dev);
> > +
> > +        if (ret < 0)
> > +            return ret;
> > +        event->destroy =3D smmu_pmu_event_destroy;
> >      }
>
> This keeps the domain powered for as long as the event exists, even
> while it is disabled or not scheduled. I'd be surprised if the
> production devices that use runtime PM keep a PMCG event open requiring
> this?
>
> For a PMCG in the SMMU's domain, with [1] that means a perf event keeps
> the domain on while the SMMU itself is suspended (SMMUEN=3D0, GBPA=3DAbor=
t).
> The SMMU only suspends once all its clients are idle, so apart from
> cycles there's nothing meaningful to count.
>
> For a TBU PMCG, it keeps the subsystem's domain powered, which changes
> what's being measured: the TBU's TLBs and config caches survive what
> would otherwise be power-offs, so tlb_miss and config_cache_miss can
> under-report compared to the unmonitored system.
>
> Which makes me question whether the PMCG needs runtime PM at all. It's
> a profiling tool, and I'd be surprised if production devices that use
> runtime PM keep PMCG events open. Without events nothing needs the PMCG
> powered, so all this buys is not pinning the domain while the driver is
> probed but unused..
>
> Do you probe the PMCGs on production devices? If they're only used for
> profiling and not in-field, not loading the driver there (or leaving the
> node disabled) avoids the problem without runtime PM in the driver.
>
> If we do need it, a couple of issues with the implementation below:
>
> [...]
>
> > @@ -975,15 +1040,45 @@ static void smmu_pmu_remove(struct platform_devi=
ce *pdev)
> >
> >      perf_pmu_unregister(&smmu_pmu->pmu);
> >      cpuhp_state_remove_instance_nocalls(cpuhp_state_num, &smmu_pmu->no=
de);
> > +    if (pdev->dev.pm_domain)
> > +        pm_runtime_disable(&pdev->dev);
> >  }
>
> Events hold a module reference and bind/unbind is suppressed, so this
> only runs with no events, i.e. normally with the PMCG runtime-suspended.
> devres then frees the IRQ: free_irq() -> msi_domain_deactivate() ->
> smmu_pmu_write_msi_msg() writes to the unpowered PMCG, since the PM
> domain is only detached after devres in device_unbind_cleanup(). Wired
> interrupts are fine, and the CPU hotplug path Sashiko mentioned
> shouldn't rewrite the message with a GICv3 ITS parent, so in practice
> this is MSIs plus module unload.
>
> With the MSI message cached by the core (see below),
> smmu_pmu_write_msi_msg() could simply skip the MMIO while the PMCG is
> suspended and leave it to resume. Note it would have to check
> pm_runtime_status_suspended(), since runtime PM is already disabled by
> the time devres runs. Alternatively, keep the PMCG resumed across the
> devres teardown.
>
> [...]
>
> > +static int smmu_pmu_runtime_resume(struct device *dev)
> > +{
> > +    struct smmu_pmu *smmu_pmu =3D dev_get_drvdata(dev);
> > +
> > +    smmu_pmu_reset(smmu_pmu);
> > +    return 0;
> > +}
>
> Sashiko flagged this too: after a power-off the IRQ configuration is
> gone, and smmu_pmu_reset() doesn't put it back. With MSIs, overflow
> interrupts stop arriving and counters wrap unnoticed. With a wired
> interrupt on an MSI-capable PMCG, IRQ_CFG0 comes back UNKNOWN, so an
> overflow can send an MSI write to a garbage address, which is exactly
> why probe clears it.
>
> This is the same problem I had to solve for the SMMU in [1]: patches
> 7-8 make the genirq/msi core cache the message in
> irq_chip_write_msi_msg() and add msi_device_domain_restore_msi_msgs(),
> and arm_smmu_resume_msis() in patch 9 clears the IRQ_CFG0 registers and
> then calls it (a no-op for wired IRQs). The PMCG resume needs the same:
>
>     writeq_relaxed(0, smmu_pmu->reg_base + SMMU_PMCG_IRQ_CFG0);
>     msi_device_domain_restore_msi_msgs(dev, MSI_DEFAULT_DOMAIN);
>
> Minor: an autosuspend delay would avoid powering the domain on and off
> for every event open/close.
>
> Thanks,
> Praan
>
> [1] https://lore.kernel.org/all/20260929034510.2023173-1-praan@google.com=
/
