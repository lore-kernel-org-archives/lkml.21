Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795420102;
	b=aGgUvZrJ6tTsoaqTwycjJoqIEhIyL0zqgk7QApYoqSc87uryAzoQlVcALWlQDKAVhqUY
	 AfuyTO/ANDXm2txbEBCvcFJrStmxUI7PeBHKo/oh2qhQeZWgT/jtZcfw+V7jMjnoYnlE4
	 Un6OQkT66bIszwgMTNgtIkhg11VYfaSk1ya55D5Z0IqDFtPYC7fzBvsh0E1ideZUChGhw
	 6fwxHulC9Khq2GvHb0FSfvpnpPPXyTC8RuOE2JaoCqTM3y7taSqLZ61cwLkgAnhIbYfGq
	 NPGZrlw8BixCM9fOxoAakok60M6lxS3t1tULpTm0aPL2gQ288subWlbH8MrmPE/GoHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795420102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=I2Cf4kH4n47u3hSqnTQ/vRo5IDUIuI4jeAwVy/w8ZNA=;
	b=csoJBXVzs5nAFE2+JCYKSvhQ459DmtuB6/QGaGk3axcDEz4MeaD/+6BVSn44ZzrnLdtw
	 C7NwDA0wH38IR3jUfobFtjdxq5OYOBw3g098qz41nJWiuuZJbMTICp5Qy+tx2C4jqSJjI
	 +0a+I9Evle1WX8C6xlff6CtlFO79k+h5MYFQcWlfWTwSkGf6M7ftI6VGlZTiPgBw1GyJT
	 LijtiF/V3/XAifxdF/+pxA1WAkVpMMIWTy2aWJYzsDr9aX5ei7DpgAqx7IPbO4rUFvUeY
	 zx1kd7DqHargInM2O/ZRiaDKl2vwMjzxwjmTiYk1zDjVZlkwZrwkvopqmTNv0thgb4Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CCaGBThk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEED6606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEED6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CCaGBThk
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b547d6c07bso3670859a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 23:48:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795420100; cv=none;
        d=google.com; s=arc-20260327;
        b=kivYoTEzcVtgfGSNbYA0KOkWUT7hRZ+z35cC+O7mktbGAuD89q9wjFaNN0CRUpbJDQ
         VXPs0IHezJO2PXOpoH4nS15YZTRlvngLobPnYphgopdPXGn0uKztc0Tj+c/uCH2CmAHo
         NvUbgSf0ducYPWvGG9ldKM6vrNni9OcFVDCpLX87c11HPOmLMQLS0SeP9olIkE6GZ3MP
         7+OsD+QkNDCET+nnpyj837hRtsI+/xoNrYoSRtU8WG2m399eoCoam/7NnlwaXqWi6BUX
         89P/j3C1IU1G0EsiTAi9UsiOi8wGehXtsPYZPveVgA5Rk4c38BZfEL9I1jZUmzjQl51e
         XZKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=I2Cf4kH4n47u3hSqnTQ/vRo5IDUIuI4jeAwVy/w8ZNA=;
        fh=cwvc1YWhREjGzkesSOi2cx36+RiMSb0wPERqnAof0K0=;
        b=CYmWDkBZiqEkTPgtLn34Px/jnvtTEGmpZZ/jjTEVniNG8q8yUUdBNFpdGDyZpNFC6E
         Zq8LD1lvrYWuoHmRLuKtBa4APbqa4M1nhS7ACqDDaWCjKE3D+NKDXpXOFIMYKjIxxiWZ
         yzUks+JRuczC0jsTBSNwmQ4t8vdPvVKYpVPQI7rd7mpSLHJv/NaX6Mqm781A1+Lw/LCX
         mE4R4NezpAw/jncrPdOUhxiZSrxyqFCySxDMvy/Gkv0TTD+j3BgYocJOt7xjuXIdszCL
         rIDtDkgxZj3D2racc/wuLfRUCInL/5L5agSGAXaAxqFGA0+1N3BU1aO5MbjU+0h4I8uD
         o8yA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795420100; x=1796024900; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I2Cf4kH4n47u3hSqnTQ/vRo5IDUIuI4jeAwVy/w8ZNA=;
        b=CCaGBThktjHeLCRIxIdVabOKULqLZuMDcIgNSGMEGDYimObV5fvYmIRzr7KDYgLrcK
         FZ6qA7Z8Qh6CV0uplPaE0lKqmw+XcSm8HNnMAAOf7K8WfqkeznytBrLY2mpuV/Gz9DzP
         wVZKBAvPus01A0h/vCECc4oFwbawtEr0KiVDzsRTu7iO/doOlmLnHrpeEvEVlOzMkWQc
         +tKqy6Ozby9vGCBnCdt17Fzk6wZqj+GHcRyOQoyFFTe4BpSdm9LCR/Qav9a4c8xHw21l
         WtDyRaM5SxXbAakr0qWojz01BMU0IrCZ/JUSbRxOgJSnMp5Bpf3TZ5KMT22nty647RBq
         V50g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795420100; x=1796024900;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=I2Cf4kH4n47u3hSqnTQ/vRo5IDUIuI4jeAwVy/w8ZNA=;
        b=IvuquG1tCUHvsAtV1UAgFgccOQTewQWJNMXLmoloVqSQMZsGoJeUd4bDbXx/EUrVAD
         XAns+OP3Z+1AiuH7nEniwSaLsMBr9dDR+cIZlzLRMlxgsI8z9WCZv0LD+xj1t23gJZmF
         YC48ptubVJ2sg4Qjs8EreboLHPoNGa6UoYL0ATouOfCO5wzlcgB+d2fNEDHiItGrtheG
         Cc+JGs4snTeYzd0pKJC6j/nxPpyZqZKIZ3ynHeXDDHldVAHajrNroVMLwZFzG527L20H
         y4cqdhgvBUl0cHbljPzGuw+t66RuDvH9Qj4c4iekxL+oe4w1ia+shYCPf8j9GcERHUt1
         +y4A==
X-Forwarded-Encrypted: i=1; AL+hErE5w91wXqBAADrKh+Tqz4M369CV7q0C6WUAdXXfKCPzm10/bXWf+yabWBfZKjI2buhwix8otvvQbs73SAo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9s2c0cdjLvWbz5oSBLgG1iIG9wGmn+TUVNbhOS5vL1fq+4/jPQ
	sGZY5QJywsSacjU5yfNLv1f/RK/xaX860qx1nO5TdVxmKcjil4jcZNnM6e7o5Kn3J/kH34KBQx1
	nmhi9Uqbp/UQ47UkKhsPnuOxxvEvIKhLYbf1+qc+H6g==
X-Gm-Gg: AZFdTZeZotl7lOg0Q7GIzVzCVMdGUYGnPJz4w6EK9lJ8NvAg63QWIZ3ZKaB7nS7kTB5
	3C+ABfDHAUs4/9KnADYm7VWnLPiCnUJoGdrAnyvuMM7MeWseHgHlGRC6kY21Y4R8YDWLHpT23Ak
	SRCcP+WsxqYuRxzhZNxCmtj8eRiCrY9Tm8IucvuI3HB9QXESBMByYAuW1MCMsRx+JyRvJJ6G2Qb
	i3yqUEjCAaA7Bsm6Pc9X/9f/KWfX4h3tL4sKJRAXjXtMDWBwZZg0IZz47XT34+nCOeb52OEEkw+
	sStLS8DWVI8yy4Ep9P+OiYvXg31ytsHN7XT9LloUzNkV4nBM5N0Q03bXwiPoyY7T/NnKa4+lPP6
	bhR3G/LmSEE3D6qxceaU28j+1yrhudpBf6RFyWCBQajpEObu2OHwLLvdf5I1Tu9G5TNvRRw==
X-Received: by 2002:a05:6402:501d:b0:6ba:659c:8ca3 with SMTP id
 4fb4d7f45d1cf-6ba659c8fb1mr4802319a12.10.1795420100021; Sun, 22 Nov 2026
 23:48:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <202611230853.e2e6401-lkp@intel.com> <awPjsi/FiElpwjM+@chenyu-dev> <207b8999-73f3-4173-8a2e-8e9ee3b1a767@amd.com>
In-Reply-To: <207b8999-73f3-4173-8a2e-8e9ee3b1a767@amd.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 23 Nov 2026 08:48:08 +0100
X-Gm-Features: Aa3M54rBBtBzw-zOTG2JSlVAzgNUBxFbCOrVn9CdlCkvmNblosyIYhZQNb699Eo
Message-ID: <CAKfTPtCiENFwCzFnsA-p8+zDSh9riv5G-ZsiEU80+4QhrpYt=A@mail.gmail.com>
Subject: Re: [linus:master] [sched/fair] 486c3d06b9: stress-ng.switch.ops_per_sec
 33.3% regression
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Chen Yu <yu.c.chen@intel.com>, kernel test robot <yi1.lai@intel.com>, 
	Peter Zijlstra <peterz@infradead.org>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, aubrey.li@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Nov 2026 at 08:16, K Prateek Nayak <kprateek.nayak@amd.com> wrote:
>
> Hello Chenyu,
>
> On 11/23/2026 12:26 PM, Chen Yu wrote:
> > I fed this to AI and asked it to reproduced it on a server, later AI told me:
> > -     int h_nr_runnable = 0;
> > +     int h_nr_runnable = 1;
> > was missing in dequeue_hierarchy() from https://lore.kernel.org/all/20261112083447.25603-1-kprateek.nayak@amd.com/
> > when merging into 486c3d06b902
> >
> > From 850d8788c72d6ae459034b85584cd5ea01df920e Mon Sep 17 00:00:00 2001
> > From: Chen Yu <yu.c.chen@intel.com>
> > Date: Mon, 23 Nov 2026 14:27:20 +0800
> > Subject: [PATCH] sched/fair: Fix h_nr_runnable leak in dequeue_hierarchy()
> >
> > commit 486c3d06b902 ("sched/fair: Avoid transient double
> > accounting for delayed tasks") changed the default of h_nr_runnable in
> > dequeue_hierarchy() from 0 to 1 and only cleared it for an already
> > delayed entity:
> >
> >       int h_nr_runnable = 1;
> >       ...
> >       /* Already accounted via set_delayed(). */
> >       if (se->sched_delayed)
> >               h_nr_runnable = 0;
> >
> > The adjust of h_nr_runnable to 1 was lost when merging into vanilla,
> > h_nr_runnable is now 0 for every dequeue, which breaks logic consuming
> > h_nr_runnable.
> >
> > Bring back the adjustment for h_nr_runnable.
> >
> > [1] https://lore.kernel.org/all/20261112083447.25603-1-kprateek.nayak@amd.com/
> >
> > Fixes: 486c3d06b902 ("sched/fair: Avoid transient double accounting for delayed tasks")
> > Reported-by: kernel test robot <yi1.lai@intel.com>
> > Closes: https://lore.kernel.org/oe-lkp/202611230853.e2e6401-lkp@intel.com
> > Signed-off-by: Chen Yu <yu.c.chen@intel.com>

There is a similar patch on the mailing list at
https://lore.kernel.org/all/20261123001213.7609-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

> > ---
> >  kernel/sched/fair.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index da0d9e19c457..8a55571b9719 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -8242,7 +8242,7 @@ static void dequeue_hierarchy(struct task_struct *p, int flags)
> >  {
> >       struct sched_entity *se = &p->se;
> >       bool task_throttled = flags & DEQUEUE_THROTTLE;
> > -     int h_nr_runnable = 0;
> > +     int h_nr_runnable = 1;
>
> Sorry for not spotting that earlier on the tip! Feel free to include:
>
> Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>
>
> >       int h_nr_idle = task_has_idle_policy(p);
> >       bool dequeue = true;
> >
>
> --
> Thanks and Regards,
> Prateek
>
