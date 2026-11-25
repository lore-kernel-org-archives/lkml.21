Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795596611;
	b=fvDshsQFoNpZc5sHWTi+pGDkpwEvTf0VX6d9VyF2E+NigTvABQ06ZSqWaUUNtwU1Tpe0
	 DpFTVnMOpEtGco2uSmnWfFaHKS+gF7Zmp0DYV9+qzfAh4vPttaykhhyoY2gRUoSYWEbDC
	 Li7psvJqGXkx4hGagY5dtp7uT9sv8LTB3hL3fPlZX5Jw59OzTB97bfpqJD1p5uLlUQu7F
	 earKB2fXGcwdg6ups0qEAmWKiuBhSXipGhPqCAL2n7K4Tgs5cFNf5+J+AJ/7jAYWb7yw7
	 ZCF8wBYfc0swUk28eDHiugc4YJClIZZiNa52GQ0K+5Vu4c0IDFKe6c1eN5IXKFKjwaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=huaeUnA8VNpUuIejnx/kUAs+Y2K0T8LOpxzNwKLu1uU=;
	b=ahexR1FnEu9wNs2MovQpVGEDgKsURYJA7NdyFZrTRZMzi6a50dCzBN62zn9E0dM5qxMM
	 0r8lZtQaqrJSrAuBJ41pqfCHnlyUGhcCUz5NY1BpgoGKGZ6rLRPPTL4HB/yJmrh+oylO9
	 nZ9xAeZ9KB/FQVrXNm+QhLN7k3GJWh3530gQ4FJAo5IHzK7cOy5iXzPYXYp09tGoWXgdQ
	 JrM8GwQ1tIn0T6VnHbKX1snszAWTCuWgTyeR7q9rwDfkXyrD/PiL9Wr7RXIL5ke8OBcto
	 QhuvBdyD/N1n5qq9dZZUezQ69pNW4rPKxqLrfUr3hUPWXhYPFKkWdXeIsQgFJ4qGUuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RbtwmHkm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408D4606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:50:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 408D4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RbtwmHkm
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-921276742e3so51423226d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:50:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795596610; cv=none;
        d=google.com; s=arc-20260327;
        b=UMoptxNOtt/9S0ysR76L8YBwD2Cq5wnfUAMlupzUyO2WgVYc9y5ozbHpPfd/lFdhMx
         IecQldP+DZDebuRejPOj/D5yuwO2nKIu4RVYcABjoBj3pLkwrn8vTg2rnc258KEomcOC
         wF3u4J4naBxFe6SNmkRUCPRESq85KzXX6f8Nct9j0LaL6T34a0yJPb8tX4WF69lzHi2K
         XIjOtfoy/NikK+JEOAzToxO21tHwrk0NhtbJAfid6jyE+/KmGitrqusS5nWALx2zlD9R
         vjZRp6f+ZeEtxwSW+DU9WVf/DCyRrjYli9APyg2zXTDz0YEHI+CKXnqZsmXFS01Ysam4
         C04w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=huaeUnA8VNpUuIejnx/kUAs+Y2K0T8LOpxzNwKLu1uU=;
        fh=x6dAqbAGjRXMrSKknBbZDNVw72eQUrGMD8HdGK/7MDc=;
        b=oXhQ2GHvRYoCsfRBVL/X5ol4PjvATAaZv3FmcIaDoR2OZV4pd9e1xrQDSh4zVSHZgJ
         ZQjzwRpAEV/TA1TG6uvuTKPB4kzDjb1OhqmVSR9MtbCGnLKZv9QBM2gLDIltoP6itVef
         eC0jjGFleMePVfjt2OK5BFV5AptiIb3XmbEocRk5/zdBnZNL8mQMCJ1kzcJ9Y6LADoU/
         e/amzorjdWy/3WbdWyvy57w28/57nQtX9F9I+r4kqq5FrSXMVO4EzpHoRAJKCQJsj85C
         9hhtSSXNIec5uq+lQSMZxQ4zS/TM+G4EipMMcLGi/QVz+U2eQIiW27oS1/njEm+xCM+S
         E/uQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795596610; x=1796201410; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=huaeUnA8VNpUuIejnx/kUAs+Y2K0T8LOpxzNwKLu1uU=;
        b=RbtwmHkmTsmyfAKcggWTMLdqqFGXsdOC8ivNLMZIaAPMC3V6ywVQvsZHoChnnOrRiB
         PxuxVADtPCpMvJYzzZU1L9Rc6VtKzsbSfyOkeTr1WlmBPb20jjFMQWk5y6RRbohAc7x3
         egyx+hfvsVVkTLVMIHtIghL9uixOzwITELfYOW92sQW+1L3Ju8PFpxggXW2r52UqVNHa
         t53saIRH+nsFBQbb7P5vxjrxAcClz7vRbGXC0vHx+VtBR64EHNkg3xBWBQADpzECB/kQ
         aSHi1G/RgKC/ebvGnjslsvtlI728NGwzRjWMbsrH3FhbdN+1pBXehaOdFiRDpzxatWlB
         AJEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596610; x=1796201410;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=huaeUnA8VNpUuIejnx/kUAs+Y2K0T8LOpxzNwKLu1uU=;
        b=PkILh4Nb2Nm7JQ6QBIMvGbsw0k/e1tabcd1mAGrR74alXOx6FOgCpClT+Vne2K8vf/
         SpLAXq4QoskJJ6RZ7sZaFn5HJYhVgz5ev7b4RGGe6FM2XEs+hnFVeDJzrz+f1Lwddi+1
         RoxI0UOBn+f4ilz05L1JYu505JwOj9iCYLpJqKrGsT1Y5Jh/HFPXJ5LKaM6lUBhRHlLA
         YuloU4aSz/Rd303Focwsi3YLMcQnmXir/afgZW0LcUfvz8p/dNsiO6JBJUbCq9udsGe6
         to2Fg/Cdqo4SYThBzRKR7i5O6BK5Wbi8r5h01OWTHbKhNQI6R3Ktbje1dUKFUZ1u59pK
         TbPA==
X-Forwarded-Encrypted: i=1; AL+hErGrtVuuBLVlwt7Y/NMLiAM6/Qb1HYJAKkdNysdsxNxw6D+uDfhnQLCf7dD6pa0j3vc6xNDhRBZZa4pFNcA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8r8M81lutwQQrA8ZqK0Y+gyCPQsJx19dlfK8BWfgwZtETNCE6e
	FAuY31owWp/qeBju4WrtshCWT+01NFJ6SHnp6nunnleUEYDgNqC+1sItiz6yone/778NPUzYbdy
	Ly9gUuleQEHCz78LI0wTEnpeVV0TuVrw=
X-Gm-Gg: AZFdTZf5PHNghQxne8N+/Xy0o2r98AVonJ3xU2sL5NISQ6KA7/sfglBVEzTS3CEQeah
	Or9Evuf/mETShPSGwtOnZZelKOErcMpqOMdJr1nwedtkcYUya03OlUA/+cDiOppcnzS0kz0o7Yq
	9oov4C7DPpnjS3P+tmAnp4ncxYD1vyvpcaWH7nWYnnuqHewIZfJ9CCn+eUNoUkrqhDykX5F2dyb
	XDXQB0aU1Q43IUqYtOSsEyBEn96yJVUVAW0QEOoRbsKAGDpILoyUBpdzTt0IQ3b3pletujmNe6t
	PYCIqbUGG+X/nlCB4nPGUHeEy7zcXc6UpEMumuh60guVKdjpzN3Un4gjX/oaKjO9CI3MHq0JbyK
	VpDI/vlKbQbxv/GZnyRv9IzNjAXGb0KNk0uXi9+IyiTQxLUdk71ntfvlldQ8=
X-Received: by 2002:a05:6214:124c:b0:921:161a:b17e with SMTP id
 6a1803df08f44-9213498856dmr319005746d6.3.1795596610191; Wed, 25 Nov 2026
 00:50:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <7732873.EvYhyI6sBW@fw-rgant> <20261125075716.2262174-1-zxyan0222@gmail.com>
 <d515df02-0cb7-4641-a6ed-d73f2220f5c5@bootlin.com>
In-Reply-To: <d515df02-0cb7-4641-a6ed-d73f2220f5c5@bootlin.com>
From: zhu xin <zxyan0222@gmail.com>
Date: Wed, 25 Nov 2026 16:49:58 +0800
X-Gm-Features: Aa3M54qogCRfGRjMdhXVV7JZ70rq5pMVX6XB8mYHty8P7davZNgqCbSK2atTVWU
Message-ID: <CAP7veTJnJEmqAr4pfzSwLPNHCFc=yuzzAbkeLEvAMjZf71-dcQ@mail.gmail.com>
Subject: Re: [RFC PATCH] net: stmmac: Fix the problem about interrupt storm
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: romain.gantois@bootlin.com, cathycai0714@gmail.com, avifishman70@gmail.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, alexandre.torgue@foss.st.com, 
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

On Wed, Nov 25, 2026 at 4:10=E2=80=AFPM Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
> Hi,
>
> On 11/25/26 08:57, Zxyan Zhu wrote:
> > Hello Romain, Cathy, Avi,
> >
> > We hit exactly the interrupt-storm scenario you discussed, on a local b=
oard
> > running a PREEMPT_RT kernel, and I'd like to ask whether this series is
> > still being worked on.
> >
> > Our setup and trigger:
> > - stmmac with dwxgmac2 (xgmac) and dwmac4 (gmac) MACs, kernel 6.18.34+
> >   with PREEMPT_RT and panic_on_rcu_stall.
> > - Trigger: fault-injection of an uncorrectable MAC safety error, which
> >   makes stmmac_global_err() schedule stmmac_reset_subtask(), i.e.
> >   dev_close()/dev_open().
> >
> > Symptom:
> > About 30 seconds after the injected error the board panics with an RCU
> > stall (rcu_preempt detected stalls, rcuc starved).
> >
> > Root cause (confirmed on-board):
> > - The main level-triggered IRQ storms at roughly 820k irqs/sec during t=
he
> >   reset window (irq count jumps from ~220k to ~23M in ~28s).
> > - stmmac_interrupt() returns IRQ_HANDLED without clearing any status wh=
ile
> >   STMMAC_DOWN is set -- exactly the "unconditionally returning without
> >   clearing any interrupt flags" behaviour you flagged as dangerous.
> > - The level IRQ stays asserted -> infinite storm -> starves rcuc -> RCU
> >   grace period never converges -> panic.
> >
> > This matches Romain's point: the unconditional early-return in the
> > STMMAC_DOWN state is the actual storm source, not the TMOUTEN/safety
> > watchdog.
>
> Taking a step back, I wonder if the right move is not to just get rid
> of STMMAC_DOWN entirely.
>
> It seems to me that it does not protect stuff that much, reading the
> different sites in the code where it's used... It just seems to cause
> more problems than it solves. All of them work without STMMAC_DOWN
> if I'm not mistaken.
>
> It's even misleading, as it's only set during a reset from the service
> reset subtask, while most of the callsites seem to assume this really
> means 'interface is down'.
>
> I think this is the better lead to follow there.


Thanks for the feedback. Agreed -- removing STMMAC_DOWN entirely is indeed
a cleaner fix than the interrupt-masking approach.

We'll try going in that direction, and report back if we make progress or
run into questions.

Best regards,
Zxyan Zhu


>
> Maxime
>
> >
> > Fix we validated:
> > disable_irq(priv->dev->irq) right after set_bit(STMMAC_DOWN, &priv->sta=
te)
> > in stmmac_reset_subtask(), before dev_close(). This masks the level IRQ
> > during the synchronize_net() window.
> >
> > Results: irq count peaks at ~724 instead of ~23M.
> >
> > Questions:
> > 1. Is anyone still working on this series, or should we revive Cathy's =
RFC
> >    with the evidence above?
> > 2. Would a patch along the lines of "disable_irq around the STMMAC_DOWN
> >    window" be acceptable, or do you prefer the more general approach yo=
u
> >    suggested -- wrapping the STMMAC_DOWN set/clear in a handler that al=
so
> >    disables all interrupts?
> >
> > Best regards,
> > Zxyan Zhu
>
