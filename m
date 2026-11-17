Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794953649;
	b=FhUHHvlhi/KQA50isP6OzhxbjobsV4f7ijOHVLdztuOc5ntrGM81YhqgjllJKSDPHLMg
	 2JeLjtXtMzAiQah8cQw7Vy5yfGJPsbS87DPwrCjbU4hhKBg7pmb0xuivnGWT3rhs9gv/f
	 8p3/tu9WRn65ReSsddlRi9n3W4WXr0mEt4Bq1UpFpvp7xZyXqx5UH5Gge7y1FQs3E+7AV
	 rpr+CmcSx2UU34uqAPUmemNPMMTH1YnOwdxMDSpCFJk4oJ1bNPCEAswEqe7mFMnDMzM5G
	 +f0PKaz0pcqJBKzWqSe/mtZZ/hJFD4webwWv+hCy9Hibqb/xZRI2dZRTYXVjvDCELAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kpd7hhfRhWWBKoEgTCNhAfk8GLYDUaewjNnHM0/FSkA=;
	b=svO3JkyGajhS3bnelDaVt90ruRVjr3IU4lReENK7OQ1u9/unW68JJVkATRCKS7VvxEez
	 4WNq7n4Vb65hQRNYDXf8JynQKRaF5FdAIO7pNXSyUDVP+n4a47rfataGCxdLBjHcoLfS3
	 RHSfwfiOdvrHEmybM05iwPGhYp2fq6+IuiCaeT5IydT3czOLiMuZi/Cg2laTrETsW7o+O
	 HlWd14sn4EZp7hAGlxLGIPGRXaGbmY6GAz5sawWgX9TIXifxdMwb1G6jrLSP48K7/zHvE
	 og7rrO8UhkR8DkPBx4qc5zVZiHBx4qcqMuvybRDNMJfENsoNi4Ob2kiiwFX/IFD+06A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OkK7Oync;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.177
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D54606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:14:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61D54606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OkK7Oync
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-571c36e48d4so66405b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:14:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794953648; cv=none;
        d=google.com; s=arc-20260327;
        b=UfIAfeSw5b/vYc8mEp1y5eivXjmjWBnBwPpRE2XDqcnM7thKbrk3frjROXrOprIpX1
         98pI5pO061wHjhVpGD7wOilz8NETv+z+YMhBvHCVBgfJnl4GBCXfBoha/+qc8ww/j7iF
         I9m5mSPjfoBmdd6ODSfxBWvpvbbhscbWiWMHh1JSYEz66eFxc98UiEN+BAMVsIe5Rqv9
         nF/ANLG7NVM3fd3Xdop0vPpfvkKKCLU88BHRawoPB9tA4mZZKxgAxtlcVWSNJM16xzJs
         rb5NNeyd9OUo/lJ3Oud1fEIFk09lNhY2YyWmtRIwGlQIJIfT8olkKhG2KQjJOFGTN9wT
         FhAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kpd7hhfRhWWBKoEgTCNhAfk8GLYDUaewjNnHM0/FSkA=;
        fh=pXkvS9H6S1WoherHWX5vXI1SkQ8Qmz9fyNfc+Wnf6Fg=;
        b=GRSLO7h6JBTe60plq+RurA5MngthT8nQejDvOrDQJBjuVTqOKbH0IxU9+Ve3zCzlSe
         rKakZP7jKkAkSrJyFdI3gV9Ql3QKVZwI1sF1psQhEWB7SUCb3iyYtn6UjAlMhrKJ0VER
         ftA7Yc47vG0k3radxmD+DULgh2VHSe11ysnRVcC1jZ5LK/qVl360vP+abwQinYGKdz0C
         eplHpT7hQpcohp09Y8+K1gBi5uJYMgDm/+SofCaDBO8E01BdNa8ZeWn3g98O20+LPq2C
         I2JMbnxzcTBjw8OzNRMkFJ7avFs2kJtuvJU0pc1Ou2ZT+YP8XVXtTliBa1/I0MZwxBvU
         VG2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794953648; x=1795558448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kpd7hhfRhWWBKoEgTCNhAfk8GLYDUaewjNnHM0/FSkA=;
        b=OkK7Oync/0FMR4WGnKttZfm6jO4gY2WpTAuxMTPGGdgi9bYq6J7iIKBa8VpjHUZyO5
         usHhSBmnLWPAXbr7C6Vs10jTLGe6cLQb/ULbjlEAznvTd3S2iUX0UJGNeMWMRtYpl/h+
         +UKeSOLB1H37XnEWzPOp8L5VoUrnAYZz7NqroLlKzaTsWgueA4mg4DEkCra+oakCnwc0
         6hh6uNVuy6hTVxPJNh14dfbCGZxnBU4W8QoTST6MBNSaIvKmXb4ZjqGqzStDARn1ahUj
         6qzHVNjAWI8eUgCJkrSPt7USJefKcGjAegppKzl2HvuzY61fEW4j06rjTP+69RcQFWLF
         yZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794953648; x=1795558448;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kpd7hhfRhWWBKoEgTCNhAfk8GLYDUaewjNnHM0/FSkA=;
        b=gYLBLmQBlbQGZrqQxjq5d0vrA8fs4c7r8fGtn6Eo10FZSouJ63Y09ka+ct6nq28b4H
         rU/ExsGyH7YOt0uQtdMa5WofU4d4KMHpeOUBAKTRrHFMjK0IX1mtfEfrTJSEJA6pfAyh
         RZzEXI5dS/k6nyrBstNPJKSzn3mmPbnU9P6CA+F4ZAxze9UAH3BE7LlzPhAutAEKTy4e
         aYYCHnoUaL0pwWXYlgaQS4tlKIQ4XSUWAYelO8bd52L8D7n6VV85xqBukzjFaDysTtYR
         Eejsxa+ShuOfd7ijcsUAq3E8bAmGXMq+jHFth/FSiHg8scz4zRcyVzxroS+neX9iSan4
         8VMA==
X-Forwarded-Encrypted: i=1; AL+hErHU5o8O9cY4By4ASuZvC5Pclj4NA8lpuID09eE0V2TIGoJM8h0C8yvzmR4kv2fPJVgHuJhT1BspW0du3Do=@vger.kernel.org
X-Gm-Message-State: APuU4Z81lzc7BEkpd2g546DqmR0UI4mRihmsoFx0+nGJggZrKNTiPGlT
	WGeLaN01Qvh7vZCwfpX/7e5MzPNvVjwHcbZUjhS3vQQkvmIXZUPNdLgRgiJTI71QV7hCnOPsHHA
	UQfk2iN7MNTXB5S8yQswXgQIyGuqCYnSDato0leC6
X-Gm-Gg: AYBFou07BnrAXUg+snyOQrCgkP+AlQEChuH7lAt/gQt40I5fuFZn/EIsb4Kiow+IAXB
	RBJfiRNgCqFOLzk3olZtmZ2e4LDfy1j7yIjvV+sGqr9AdhzsBEPACH8fDrCnlRdTEE3lJHJ3wni
	McZG4H65cOOE0AdDSdq0RNfgEsO25q+C7Wqjgo5tGgWOSxuck95ui7AfGIilmqRyLGdb+zWUruV
	grgmay9WOqU+ZgqL24F72MCIDuCGfjUgvb4GniADyFq9Y43RerUYqNqSZ3VJBjVURCZPMW1kibg
	bIa/NmMbyzotDKwfSHdje2tVfecu+NiEsja5gKTQQtnYRuReQeHrGotdYzufe7GYUleRYFqFCXg
	m2/2aIDkGhVX120YQjRbORzXq7EnbXRFRNdzYanhlRhJ+PYyELHDssPhdXN9uCWiFkag=
X-Received: by 2002:a05:6808:30a9:b0:4b9:a88b:888b with SMTP id
 5614622812f47-5774162054dmr1516905b6e.33.1794953647357; Tue, 17 Nov 2026
 14:14:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112031629.396819-1-mrungta@google.com> <20261112031629.396819-2-mrungta@google.com>
 <sashiko-outbox-210280@kernel.org>
In-Reply-To: <sashiko-outbox-210280@kernel.org>
From: Mayank Rungta <mrungta@google.com>
Date: Tue, 17 Nov 2026 14:13:55 -0800
X-Gm-Features: AclHuK-gfyGRgfHP6b95c4djqnr6JWB02JWcunq_dlapBgDtO9GdRA_nY1E9eCw
Message-ID: <CABz7rdC2Q1qtUdhiXDpEydbhCnSaNSuS5jzcUK+cZFdNZmULgw@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] genirq: Synchronize in-flight handlers during NMI teardown
To: sashiko-reviews@lists.linux.dev, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: linux-watchdog@vger.kernel.org, Marc Zyngier <maz@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, "Kirill A . Shutemov" <kas@kernel.org>, 
	Douglas Anderson <dianders@chromium.org>, Mayank Rungta <mrungta@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sashiko has found one potential issue:

> [Severity: Medium]
> Can __synchronize_nmi() return while handle_fasteoi_nmi() is still runnin=
g
> on another CPU because it checks desc->nmi_active before querying
> IRQCHIP_STATE_ACTIVE?
>
> Unlike regular IRQ flow handlers, which acquire desc->lock before setting
> IRQD_IRQ_INPROGRESS and calling chip->irq_eoi(), handle_fasteoi_nmi() run=
s
> without desc->lock.  On the NMI CPU, hardware acknowledge sets
> IRQCHIP_STATE_ACTIVE first, then handle_fasteoi_nmi() increments
> desc->nmi_active, then chip->irq_eoi() clears IRQCHIP_STATE_ACTIVE, and
> finally desc->nmi_active is decremented:
>
> CPU0 (NMI)                        CPU1
> <NMI acknowledged in hw>
>   (IRQCHIP_STATE_ACTIVE =3D true)
>                                   __synchronize_nmi()
>                                     inprogress =3D
>                                       atomic_read_acquire(&desc->nmi_acti=
ve);
>                                       -> 0
>   handle_fasteoi_nmi()
>     atomic_inc(&desc->nmi_active)
>     action->handler(...)
>     chip->irq_eoi()
>       (IRQCHIP_STATE_ACTIVE =3D false)
>                                     __irq_get_irqchip_state(...,
>                                       IRQCHIP_STATE_ACTIVE, &inprogress);
>                                       -> false
>                                   /* __synchronize_nmi() returns */
>                                   __cleanup_nmi()
>                                     irq_nmi_teardown()
>     atomic_dec(&desc->nmi_active)  <-- NMI handler still in flight
>
> Querying IRQCHIP_STATE_ACTIVE before reading desc->nmi_active (or
> re-checking desc->nmi_active after observing IRQCHIP_STATE_ACTIVE is
> false) would prevent missing the handover between hardware-active and
> software-active states.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112031629.39=
6819-1-mrungta@google.com?part=3D1

The observation is valid in theory, though practically benign for
disable_nmi() and free_nmi():

In that window, IRQD_IRQ_DISABLED is already set by __irq_disable() or
irq_shutdown() before __synchronize_nmi() is called. If
__synchronize_nmi() reads desc->nmi_active =3D=3D 0 after
smp_mb__after_spinlock(), then the NMI CPU's
atomic_inc(&desc->nmi_active) occurred after IRQD_IRQ_DISABLED was
set, so handle_fasteoi_nmi() is guaranteed to observe
irqd_irq_disabled() =3D=3D true and skip action->handler().

By the time __synchronize_nmi() reads IRQCHIP_STATE_ACTIVE as false,
chip->irq_eoi() has also completed, leaving only
atomic_dec(&desc->nmi_active) in handle_fasteoi_nmi(). The IRQ mapping
is not torn down in disable_nmi() or free_nmi(), and even if it were
torn down immediately after free_nmi(), free_desc() frees struct
irq_desc via call_rcu(&desc->rcu, delayed_free_desc), which cannot
complete until the NMI CPU exits NMI context (nmi_enter() /
ct_nmi_enter()), so no use-after-free can occur.

Human review feedback on v4 as-is would still be very much
appreciated. I plan to hold off on spinning a v5 just for this and
will swap the check order in __synchronize_nmi() alongside any
maintainer feedback.
