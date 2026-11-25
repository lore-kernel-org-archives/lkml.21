Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795605504;
	b=wzwZ3nhc2G2HToNt4IT3P+sLAojU0V9wUboWnGBGa+EepyIzph0y0DdU52B3R1ZjnICS
	 egm9vYCl9VLSEqlwylyHCcR65J7sZXayupT77MKseUoA0F2AAlPuHZWW+DhQwSuYk8m5h
	 aexqGi9hSGfogDKPn9wjQGrANlZzk5AagN5ObS1MyKTy0i7U4qChu/w74vhWFLJJbP7E9
	 6ZBdHot5JCFopF1YdwFieij2LjG9abBSNjtK75fKhQiVYBA8/XQaJYA9SEqA1ASydx5aN
	 W/f2T8vdA6kGLHwr8+dk9b7zoTm1RrWXquLoXK06x+VCxOOc4ObZ1XNbMUh9EIBHdVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 In-Reply-To:References:MIME-Version:From:X-Google-Nh-Sender:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=aUuDBjF4fZ3y792JWpEiTnxw/iQ5Ii+xISV/HSd9qVI=;
	b=hDpajrs6pdcECaYAQdmEWDaGesBJHrXs7RsJwZt8CKH68tk5E9f0Janf3ouwr0s9Bs4g
	 OoUF9G409ON4e/AEz/zxvFLPTDc9g36NDAOUgvydNXM4lWR+TmS06h8jz95lvIqKdajgu
	 inyUcEMOShNA70b46jyFQ103ukudzcItsRRh6N+Wl4S3p7CmiwRKkkp5Xj8oll/B7A8MB
	 GldDQYFtX38uk1Jv71iYsFM2inrypiNstkuvfaDkV/kflp+jXjgZ/8Qaf521cL+aLnwRA
	 Pa+CQxmc/Hpyr4j0Nqsla4URzEvzowSU5SKL8UPL0SfD6V1WAAXa3QlEgz/2VbjmTaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z5N2Trz9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33FE606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:18:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C33FE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z5N2Trz9
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3acd523a802so49244371fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:18:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795605502; cv=none;
        d=google.com; s=arc-20260327;
        b=LzilgeQcwE8I13EEtnCUc2obvBGqHg1kW2FRXwlWswRag1+E3V84MjpMrCtGY6IYmH
         0vVhUcLvEcyACLIpv+yF8xv5ep1TC+bUhphz60uOUhD5H4JiJ9ri0C6qVWYIX7kepKIw
         NUqaNNFBPyFnLP6wR//VTw5VP7I60UdwBJh1zFbcH2Fc6HH9OY0vuEZtMntvvnrKSm24
         MFb7bQoubNvsoMe7yq4p/PGMbsJZYGOajDCIVBSPokU/wNrkAZzcVF+wl/tX1RoanNbf
         jHbhfb1lLJQLkQcqRLnOEnADGg74FmsgFoZceZu5BSkIc9k9wJ8JHt7QtxcApgd3hfJ3
         zxRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:references:in-reply-to:dkim-signature;
        bh=aUuDBjF4fZ3y792JWpEiTnxw/iQ5Ii+xISV/HSd9qVI=;
        fh=0yYL8VCmLzMFHgMQsEu2S0G4691lY+jsmexEWAwcrdQ=;
        b=BKzOz4L9hoN3mNTw2lxJuyitnUPX9rQSsm849ZLQHk25fOyRb8nwCeIcu4D9aLUhah
         J8hU7O+aqtpJ/JDu/1NaxcncT1e1eHLs6wvMqxKcqMdG3NJdyNaB8xlBTBHETmtsJSZH
         ZCiFpXDajLDbunir2kFuNdvv7QFAJznvGMMXoMgnI8s75ytBCp3q3wAah22CMYBisC85
         5tTTOCE0RBRyIfC1rpINygl5Ld/c4AEbQinpFQ5VmsfGY66uv6M925Yo8unvabc/WomE
         8E6+q6tLt3LD0/bzczpVNwEwjTrhTKy5orgYZUWIjEwBJoWSkqDWkka17EuZsWvQNML8
         mxvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605502; x=1796210302; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:references:in-reply-to:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aUuDBjF4fZ3y792JWpEiTnxw/iQ5Ii+xISV/HSd9qVI=;
        b=Z5N2Trz9OaW5p3cAAbOX9JMT5a7/xNE6KBeBB7bu1qazqaDzrYDfbu4MVXwS2jEjfj
         YGb2r/NDBc/2OfH3LZfGHiq+SGScj1o41KOX3vCgZo7KTiIptT04Ws0+nmk5vEoz8G/m
         XZ0l1kOi5Ww4vR2LBhfU+rfqAAIx1lNMn+suEgiR+dVZUITzuJfPMzvl6GVQUv3O/69i
         5dQjfp6Hoo4QQA9KFVG+Vo3JVk2nWBdWLRJNSsJHVAxnVrjIUDeqRuIdCTDj+M8Sxas3
         qupPM3cZcX0EfsrJ/wZF86TqnPgptqdOaZEhJyK1EvoF0gEfLxHaCpFgmCc3gP8AzKyI
         ZqiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605502; x=1796210302;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:references:in-reply-to:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aUuDBjF4fZ3y792JWpEiTnxw/iQ5Ii+xISV/HSd9qVI=;
        b=C/oitqFAw6lOtvmIJCqfczGq9JrJ7mqAvgD7zWyfa/nEg2gC7xkDE29kHMoRINYNBB
         4kmmXeYa0VR1PaMOdaXNg7dzz6EWeQcUOAL21ib8nZBs+RsCrW4kwhhnn5rUDLqzGqQK
         XP/jHLIe6Xe6LlI/7NaxLoopdvxbISJa4rCr78PPN5aSqoh19dh/JRpdzUFbEnl9ip6A
         SYqEN6Q3Zd2C0ulwdundYBoEiTeZ8SSIoC0mBoVmkBCmnnHe6kdEn497lyNjeX9cAZc0
         R1osIjOepew273RS56NBn6lrzf4ZMEQS5Q//2Eq51DFN7BHUcJizfuQ7ToqlKqwTXrXK
         ftNg==
X-Forwarded-Encrypted: i=1; AL+hErF5EWSWmYtMPjWJ2bQWXevAS9vxYJkKr+akn6SBgUvBf2uagnn0yxErwhbkSykWoSPpclG/KF/9j9X8khU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4UGHZVebiXJ0BduBakZv0IzrPXez6MJNk6fJVtozjmxl0KCAN
	vCFasdfzHMgpm5cFnlno+xlT56GGgyYavTwZtQjtmpp80674ukonN4iFP0WT49lQMHAa30hnBW6
	kqC7gAGDk2oBKqKbd7fIYBcvVWRmKmRA=
X-Gm-Gg: AZFdTZfK5GucwyMpVD4kHYTkhXwCS9HatbmN4zrqIvD/GJPCsy66uacWmgDmQaUbdSs
	y9AdQrQrEl+FRfvshYAwgQDO7Et29Q2MMEOAM6U/v9xGhz62fu/hNY4o4POLTctaTFn3v8QCwAO
	FZOfZhEs/suKwr2X0PEm7KcfGOs/cBX3ylasn7iXbOYdBsWYFzGqAbgaMw617/6vePrvDhOkPYC
	T0FFNk4wNCSDaassdaRuHl9lzsweEU6IZhdzEv0/jrOUSI3fvtNaq4esKM/Cn5MG9nOQsQ/7Xk5
	NqkrZBhrUccfRWqVk1Up2h/UWDHQo9SpAe0hLOeY/u9al4OUaK65RVj9W7RR1DDXcexl8hd9Jz9
	iENwYewNR3XIi/MLAGgknySdUuAhwuKSVxoZ64LEEA/pnJJjbt3F6rKCEk+0XgyHpk9c9DprhQ1
	rCIREnx7YXV2UmkNiNDl7H2osYBPc=
X-Received: by 2002:a05:651c:1a0a:b0:3ae:62ba:1eb with SMTP id
 38308e7fff4ca-3ae7fa43128mr58552731fa.22.1795605501623; Wed, 25 Nov 2026
 03:18:21 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 25 Nov 2026 05:18:20 -0600
In-Reply-To: <20261125073342.GL3898744@ragnatech.se>
References: <20261124095110.131258-1-shunsheng1218@gmail.com>
 <20261125030327.953450-1-shunsheng1218@gmail.com> <20261125030327.953450-3-shunsheng1218@gmail.com>
 <20261125073342.GL3898744@ragnatech.se>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: zhang san <shunsheng1218@gmail.com>
X-Google-Nh-Sender: AW_J_UpCVIodhkIqK-BapsyqbHTdE4ByeK1Vp3ycLC_CoU8RR4sD9sqDWn3naQJB3rzHn5yAy_szSuBdZ7MWZBqqOqUQeEOy98tV4eoKuXy7XCjKtkbLKCfZTO0q3Oegz6-c0UBAmgSS3nochUw4VL4KvZ7fi5i_IM--QFjBln0RxG7TgAJvgi4IdXVLhS9uN2DqYXVM9asfeyflk0NSX_so_xEsLEtv2g9U1eM9nPjW6jQn_A53RK2WVhDQ4yCygqxR
Date: Wed, 25 Nov 2026 05:18:20 -0600
X-Gm-Features: Aa3M54qfNGJJeA1uK2QHUImyTAAllwJfpJqcfABrJCEBi9leUt0MV6WNKDisRgQ
Message-ID: <nh-17d10cf4-3201-426c-b9a7-95bcba2df381@google.com>
Subject: Re: [PATCH v4 2/3] thermal: rcar_gen3: release the interrupt handlers
 from ->remove()
To: niklas.soderlund@ragnatech.se
Cc: rafael@kernel.org, daniel.lezcano@kernel.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

Fair enough, and sorry for wasting your review time. Dropping
RCAR_GEN3_THERMAL_MAX_IRQ and your earlier style feedback across revisions
was my fault.

I'm dropping patches 2/3 and 3/3 and won't send any further IRQ lifetime
changes here unless I've worked through the driver properly on my own.
I'll look at patch 1/3 separately on its own using your feedback.

Thanks,
Yaohan

On Wed, 25 Nov 2026 08:33:42 +0100, "Niklas S=C3=B6derlund"
<niklas.soderlund@ragnatech.se> wrote:
> Hi Yaohan,
>
> Thanks for your work.
>
> On 2026-11-25 11:03:26 +0800, Yaohan Li wrote:
> > The interrupt handlers are requested before the thermal zones, and
> > devres releases the managed resources in the reverse order, so the
> > handlers outlive the zones they report to. The handler walks every
> > sensor and calls thermal_zone_device_update() through tsc->zone, which
> > is not cleared when the zone is unregistered. Masking the interrupt
> > sources neither waits for a threaded handler that is already running
> > nor removes the action.
> >
> > Release the handlers from ->remove(), which runs before the runtime PM
> > reference is dropped and before devres unregisters the zones.
> > free_irq() also waits for a running handler, and after it returns the
> > handler cannot be invoked again.
> >
> > Record the interrupt numbers as they are requested, so that a partial
> > request is undone as well: if the second handler cannot be registered,
> > the first one is released and the driver falls back to polling, as
> > before.
> >
> > Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
> >
> > ---
> > Prepared against v7.4-rc1-1969-g666539eecdf4.
> >
> > Compile tested only: arm64, aarch64-linux-gnu-gcc 11.4,
> > CONFIG_ARCH_RENESAS and CONFIG_RCAR_GEN3_THERMAL.
> >
> > AI assistance: prepared with Claude (Anthropic) as a coding assistant; =
the
> > author reviewed the reasoning and takes responsibility for the content.
> > ---
> > drivers/thermal/renesas/rcar_gen3_thermal.c | 38 ++++++++++++++++++---
> > 1 file changed, 33 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/thermal/renesas/rcar_gen3_thermal.c b/drivers/ther=
mal/renesas/rcar_gen3_thermal.c
> > index a96f02d4a8ad..37348f4413b6 100644
> > --- a/drivers/thermal/renesas/rcar_gen3_thermal.c
> > +++ b/drivers/thermal/renesas/rcar_gen3_thermal.c
> > @@ -107,6 +107,8 @@ struct rcar_gen3_thermal_priv {
> > struct rcar_gen3_thermal_tsc *tscs[TSC_MAX_NUM];
> > struct thermal_zone_device_ops ops;
> > unsigned int num_tscs;
> > + int irqs[2];
>
> What happened to RCAR_GEN3_THERMAL_MAX_IRQ ?
>
> Please stop thorowing this code at an LLM it comes up with new code
> ignore past ideas.
>
> > + unsigned int num_irqs;
> > int ptat[3];
> > int tj_t;
> > const struct rcar_thermal_info *info;
> > @@ -466,9 +468,25 @@ static const struct of_device_id rcar_gen3_thermal=
_dt_ids[] =3D {
> > };
> > MODULE_DEVICE_TABLE(of, rcar_gen3_thermal_dt_ids);
> >
> > +static void rcar_gen3_thermal_free_irqs(struct device *dev,
> > + struct rcar_gen3_thermal_priv *priv)
> > +{
> > + while (priv->num_irqs)
>
> Please use a for loop not modifyig priv->num_irqs, this looks dangerous.
>
> > + devm_free_irq(dev, priv->irqs[--priv->num_irqs], priv);
> > +}
> > +
> > static void rcar_gen3_thermal_remove(struct platform_device *pdev)
> > {
> > + struct rcar_gen3_thermal_priv *priv =3D platform_get_drvdata(pdev);
> > struct device *dev =3D &pdev->dev;
> > + unsigned int i;
> > +
> > + for (i =3D 0; i < priv->num_tscs; i++) {
>
> Declare loop variable in for loop, where possible.
>
> > + rcar_gen3_thermal_write(priv->tscs[i], REG_GEN3_IRQEN, 0);
> > + rcar_gen3_thermal_write(priv->tscs[i], REG_GEN3_IRQMSK, 0);
> > + }
> > +
> > + rcar_gen3_thermal_free_irqs(dev, priv);
> >
> > pm_runtime_put(dev);
> > pm_runtime_disable(dev);
> > @@ -491,22 +509,32 @@ static int rcar_gen3_thermal_request_irqs(struct =
rcar_gen3_thermal_priv *priv,
> >
> > for (i =3D 0; i < 2; i++) {
> > irq =3D platform_get_irq_optional(pdev, i);
> > - if (irq < 0)
> > - return irq;
> > + if (irq < 0) {
> > + ret =3D irq;
> > + goto release;
> > + }
>
> This changes the behavior of the driver...
>
> Please stop using an LLM to code this. As you don't have hardware to
> test with throwing LLM spaghetti over the wall and see if it sticks is
> getting tedious. Please read, understand and write the code yourself as
> coding for gear you can't test is hard.
>
> I will not review another set of LLM slop, especially as the good parts
> like RCAR_GEN3_THERMAL_MAX_IRQ are dropped between revisions.
>
> Nacked-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>
>
> >
> > irqname =3D devm_kasprintf(dev, GFP_KERNEL, "%s:ch%d",
> > dev_name(dev), i);
> > - if (!irqname)
> > - return -ENOMEM;
> > + if (!irqname) {
> > + ret =3D -ENOMEM;
> > + goto release;
> > + }
> >
> > ret =3D devm_request_threaded_irq(dev, irq, NULL,
> > rcar_gen3_thermal_irq,
> > IRQF_ONESHOT, irqname, priv);
> > if (ret)
> > - return ret;
> > + goto release;
> > +
> > + priv->irqs[priv->num_irqs++] =3D irq;
> > }
> >
> > return 0;
> > +
> > +release:
> > + rcar_gen3_thermal_free_irqs(dev, priv);
> > + return ret;
> > }
> >
> > static int rcar_gen3_thermal_probe(struct platform_device *pdev)
> > --
> > 2.34.1
> >
>
> --
> Kind Regards,
> Niklas S=C3=B6derlund
