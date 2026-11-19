Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795108299;
	b=CE+xFjG3gUlPudYSlwoF/VOQrAZjMYvrieEJG5h1p0ZyxuhHFf830hdTxMzcZiyjp+mp
	 aQdV0Uh31uIJ01C+EWrxqlaEhlzuNCjlSViVV+iCU1yP53DKsJJWL1FD3MsB4Kg368ZXE
	 QD0IkpVJ++Avcb/4XCIrO6j2SSF1O7DcmOTLi48To3b/hYqX4xqC2lzIeFdkbtEDYTtUo
	 I+ha6UbQBfBXJUvybpWJsK0nnQoxx+9SoOwp59L0bMxIM38tbklT86OqvSyV/pNLLLFGf
	 ptVlxRjIcA7rz8DkJESuQvqpIAmH3JEl5DssybHeyTug+t0HtouCyRYCq9GW6uYtdBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108299;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sqIPd5DY6cvzI0wHVUNxzg3U7XqrHfIiCMJ9n559ao8=;
	b=FSZjEfq6hstdTaNo3sd6C7/W1QeJ7T4w84xUmE54KG74KKsgvgliWJgWSxbw6VCvOFS4
	 xbF+fh78uzvq8rL6tN5u7v6pa/GplnpgWS735OaD34j0S862hItZBpeocJ7H2br7VUqL8
	 Miw4BEtu90Vp+GTUJ0Bn5zQDIf7e077UxMt0E+gjglHPtHteDy/ewr0eurut7LRnXCzhA
	 IIZgj7imRsH1i+GkQT5lRGAjz+jvRWN3+qLSauisExfxy8zo/Xftjt2SxIHHMPb1qjqOs
	 gFpELyplX4lr1oqfoD4VA/roCMge6I68Qna1EO8+goCiiJcOXQelA0xVQ071ymk6DKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dNgqk2uG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.49
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D11606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:11:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00D11606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dNgqk2uG
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-992f6d8cb51so589867241.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:11:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795108298; cv=none;
        d=google.com; s=arc-20260327;
        b=B9T8RdsW+CvkDWKpwnKPWx2zgMhkY/gApsDImg7HTWPZLL5RczMW2Do82MUxJcFTWA
         MiZLyW+7EDSdot0rxmyHBfdmfUCzIkBC1wVxHy+qy0PEBi1l2g/n70g7RrXWJZYm+MTG
         RApgEgSz2tQz0nJX3DCWL/Ru9r7ORDqgaGu3uu9k8FBnPhaAXUEERbfsSQ+0TlbLE7W3
         Cgy+AUyJA42AOo/+jwVk9boCNQLg2kvbmw656brcP7lZsenCF3jstp7OKHoDbQxznY32
         GORS4tOWByxfQmWihpiCrSkIuuv4Lit+VHysUVdnlSOT4JYnPXVkk/E6vgsxYrB7ul5y
         vWNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sqIPd5DY6cvzI0wHVUNxzg3U7XqrHfIiCMJ9n559ao8=;
        fh=nG1Xp4yWbx0+foVcGvwdq0ivgJdJ8Z5dQzMMvCMoIcw=;
        b=Rsjv+hmUvTGOm1NxYCATlANG/dTQuPGfl8ssXFMljzxoL7nHAmE6YAs7l8lLLgWoW/
         R+z2dV1AeEzD4GTIv5474xzFG6TFTSchTn6QZV/Hypg6l9KYGXkvDW89NIt0nOwmN5TJ
         vcA8VmcEgowyHSrRwNkfB2VfGa6TMDx+Q3V1eYtn4DJ3zf8IUjlzhA0QEXEtm9rPTTlN
         frJAzXFGhRGckYuBxepRmyEn6KcRj+FoegSAINL5Zz/DtFe/NnzhzfjNzS9Z+ueivSgM
         EJijJoCagopShHUb/WKrieyFBe1R526T0VO3yHnhDoRS6Sv3jY2yan8EYZyvVlEegAG2
         oayQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795108298; x=1795713098; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sqIPd5DY6cvzI0wHVUNxzg3U7XqrHfIiCMJ9n559ao8=;
        b=dNgqk2uGou3vK3cbbStn1YAV75GGjCG15EF2drSlKqU3KU74FUP9NFDvmiracDmxSW
         v210n8+zs2amX38IdPjsUTQhxV3aWl52EDXHDLNPffvmWPtbYKbG/NlY7jZM9+Lq5yjT
         S+pe7NpLxAJmCv5zIl6JzxTu9i5M2ymu4nw1enKuuTtYTZghoM3CdVTyFRBp1Jq7dlyD
         sxkIHeBYtC0N8UJTyGDSaboNIrl0JSGr6L8wZz/ns2P6ONQun2zzhOBkqeWpQA05sJQ8
         apQc4OyO/Q7N5maIfZAK0OgKGowU258Rr+adHwRJVB2sRgFeWDcahud7Mq/ltfdRiMzi
         4oNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108298; x=1795713098;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sqIPd5DY6cvzI0wHVUNxzg3U7XqrHfIiCMJ9n559ao8=;
        b=CN/LzlFV8MW+h5Nv1EvdCrekKGh36iRggb2C4A8C4AeeOEMrp1+ZPvPnoPXoLFRLqX
         7+qfLwzHVxzUTb6JFYl5L+jrsz5PuykFoT+1pSrBkUcDlQd++zfmv+EQ/wRr1U4l9nAq
         UcCadfZz9wt5uJ4LiBL1zBoyXLzcB2NPDl7gvVGJwyxmao7eo4awMKBm9Myq6WwMokC/
         CFNaYoFLKKpgqIVPI67/Cr5tCt2RrFt4fob+RNS9IRIQNHV/zPHd2/rnCzwbQQsijM2e
         UpG0WOfHVJTpdIE880NCc2O+V3cpvszAesMGJjPrxHPaj09I5Al5hcmLZQLeDrpaKqnj
         eO6g==
X-Forwarded-Encrypted: i=1; AL+hErHX9cCl83BERgWjl4gBSaGbsezCnBqM52Za+XNQ1QC4EYOgx4pqpUzjsSEf6AyZt6Lh9GJXnpClIWb8ZhM=@vger.kernel.org
X-Gm-Message-State: APuU4Z964XlDy7BeNvKCmDwOY1Nh+EO6DUU6abOphxhxkfMR2XR5sa/U
	WC9SOWEGkrpd78KClFWXj2tWr/hFh2DUFYTcvtPfeVbYHNVAioNr/Lo1UpT7nLvTEerp2fXoqav
	o33960lpFygxwqVc29uZEU2+CYyn7Il8=
X-Gm-Gg: AYBFou3s48wyKw/ZwVGnBgXzj/vCiQB0UzE0fVOd4JyY16mCx7cVEgE9pWUTw38FEQm
	VzKnE8DDiiqet/mCECw0zBfw2ryQMaZs+A3++y8gsVbsV+8Hm8dhT47+FMH2b2q6FO5tb+MxD0O
	4pm2NxezUD6dzP31tvMCk1hSNerS+bgSzar5hpAnOXSXIUAru7WAN+p260oIcvxH8Bv9UexxuSS
	pBThJV6ywwJis5KaGeWA61zjsIePBPWt/yx/rH37RCiCgC/nq4zVj0SV6wbeCmXqifJ12wuc8Iz
	Ko49kfcjRAKXthMyCJs5NUZAhjYtSzBfaQoFdWsrJLjAdEN6DxwqxPRMQR/+k8rqhibOXdp9czM
	P6MKl5YD5UrUtt1IqaZ7BhLGYZp4eEtrYe2PH9izTbkyLMhlqwB3NNmM8OTE1QRPe/uvvXDKFZQ
	/0kgSLaKz3SF94i+Ideg0I8B/HPSm0RTp5om0BdRkm+BDFdc8Rzv5mc22Rta1xkNgJ+SU6KQgcH
	eMPxFFbIk8jxvxqcgnlNxLzq3gUtA==
X-Received: by 2002:a05:6102:6055:b0:7cc:95ed:3147 with SMTP id
 ada2fe7eead31-7d739689235mr3741137.34.1795108297754; Thu, 19 Nov 2026
 09:11:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-0-f8e7fe60594c@gmail.com>
 <20261119-submit-dw-axi-dma-stop-pause-v1-v8-9-f8e7fe60594c@gmail.com> <av8o6KrTcLH1JEvZ@SMW015318>
In-Reply-To: <av8o6KrTcLH1JEvZ@SMW015318>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 10:11:26 -0700
X-Gm-Features: Aa3M54rVCoEdjoDkasLiiRwOgxIZnUftjPp1s1qrmQMLobuok4OE41zOjQfzpG0
Message-ID: <CADvTj4piX2fARdtXgqM38GkVunL_i51_CASENmnkf2bvddUJiA@mail.gmail.com>
Subject: Re: [PATCH v8 9/9] dmaengine: dw-axi-dmac: guard shared IRQs across
 the controller lifetime
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Sergey Khimich <serghox@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Sia Jee Heng <jee.heng.sia@intel.com>, 
	Baruch Siach <baruch@tkos.co.il>, Mitch Barnett <mitch@accuratesound.ca>, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 9:51=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Thu, Nov 19, 2026 at 09:01:04AM -0700, James Hilliard wrote:
> > An interrupt from another device on the shared line can run the handler
> > before the DMA channel devices exist or while the register clocks are
> > off. Checking the runtime PM status in the handler is not sufficient:
> > the controller can already signal an interrupt in the resume callback,
> > before the PM core marks the device active.
> >
> > Mask the controller and clear stale channel status before requesting
> > the IRQs. Keep the global mask in place until DMA registration returns.
> > A transfer that completes during registration leaves its channel status
> > pending and is serviced when the controller interrupts are enabled.
> >
> > Serialize the hardware mask and handler readiness under a chip lock.
> > Mask the source before withdrawing the handler and prevent a handler
> > already processing channels from re-enabling it on exit. Drain each IRQ
> > before disabling the clocks. This also covers forced system suspend and
> > lets removal leave an already suspended controller powered down.
> >
> > Fixes: 1fe20f1b8454 ("dmaengine: Introduce DW AXI DMAC driver")
> > Closes: https://lore.kernel.org/r/sashiko-outbox-216269@kernel.org/
> > Link: https://lore.kernel.org/r/sashiko-outbox-219846@kernel.org/
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 119 ++++++++++++++++-=
--------
> >  drivers/dma/dw-axi-dmac/dw-axi-dmac.h          |   3 +
> >  2 files changed, 81 insertions(+), 41 deletions(-)
> >
> > diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/d=
ma/dw-axi-dmac/dw-axi-dmac-platform.c
> > index 531705f8f89b..eab3c31f77df 100644
> > --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> > +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> > @@ -277,6 +277,7 @@ static void axi_dma_hw_init(struct axi_dma_chip *ch=
ip)
> >       for (i =3D 0; i < chip->dw->hdata->nr_channels; i++) {
> >               axi_chan_irq_disable(&chip->dw->chan[i], DWAXIDMAC_IRQ_AL=
L);
> >               axi_chan_disable(&chip->dw->chan[i]);
> > +             axi_chan_irq_clear(&chip->dw->chan[i], DWAXIDMAC_IRQ_ALL)=
;
> >       }
> >       ret =3D dma_set_mask_and_coherent(chip->dev, DMA_BIT_MASK(64));
> >       if (ret)
> > @@ -1167,8 +1168,11 @@ static irqreturn_t dw_axi_dma_interrupt(int irq,=
 void *dev_id)
> >
> >       u32 status, i;
> >
> > -     /* Disable DMAC interrupts. We'll enable them after processing ch=
annels */
> > -     axi_dma_irq_disable(chip);
> > +     scoped_guard(spinlock_irqsave, &chip->irq_lock) {
> > +             if (!chip->irq_ready)
>
> Does pm_runtime_get_if_active() can resolve your problem?

Not by itself. During probe the device is already runtime-active
before DMAengine registration finishes. A PM reference can succeed
there even though the handler must not service channels yet. On
runtime resume the reverse is possible: the controller can raise an
interrupt before the PM core marks the device active.

The other place irq_ready matters is on exit from the handler. If
removal has masked the controller while the handler was processing a
channel, the handler must leave it masked. Checking irq_ready under
the same lock as the mask update makes that ordering explicit.

>
> Frank
>
> > +                     return IRQ_NONE;
> > +             axi_dma_irq_disable(chip);
> > +     }
> >
> >       /* Poll, clear and process every channel interrupt status */
> >       for (i =3D 0; i < dw->hdata->nr_channels; i++) {
> > @@ -1189,8 +1193,10 @@ static irqreturn_t dw_axi_dma_interrupt(int irq,=
 void *dev_id)
> >               spin_unlock_irqrestore(&chan->vc.lock, flags);
> >       }
> >
> > -     /* Re-enable interrupts */
> > -     axi_dma_irq_enable(chip);
> > +     scoped_guard(spinlock_irqsave, &chip->irq_lock) {
> > +             if (chip->irq_ready)
> > +                     axi_dma_irq_enable(chip);
> > +     }
> >
> >       return IRQ_HANDLED;
> >  }
> > @@ -1378,17 +1384,39 @@ static int dma_chan_resume(struct dma_chan *dch=
an)
> >       return ret;
> >  }
> >
> > -static int axi_dma_suspend(struct axi_dma_chip *chip)
> > +static void axi_dma_start_irqs(struct axi_dma_chip *chip)
> >  {
> > -     axi_dma_irq_disable(chip);
> > -     axi_dma_disable(chip);
> > +     guard(spinlock_irqsave)(&chip->irq_lock);
> >
> > -     clk_bulk_disable_unprepare(ARRAY_SIZE(chip->clks), chip->clks);
> > +     chip->irq_ready =3D true;
> > +     axi_dma_irq_enable(chip);
> > +}
> >
> > -     return 0;
> > +static bool axi_dma_quiesce_irqs(struct axi_dma_chip *chip)
> > +{
> > +     scoped_guard(spinlock_irqsave, &chip->irq_lock) {
> > +             if (!chip->irq_ready)
> > +                     return false;
> > +             axi_dma_irq_disable(chip);
> > +             /* Flush the mask before withdrawing the handler. */
> > +             axi_dma_ioread32(chip, DMAC_CFG);
> > +             chip->irq_ready =3D false;
> > +     }
> > +
> > +     for (unsigned int i =3D 0; i < DMAC_MAX_CHANNELS; i++)
> > +             if (chip->irq[i] > 0)
> > +                     synchronize_irq(chip->irq[i]);
> > +
> > +     return true;
> > +}
> > +
> > +static void axi_dma_power_off(struct axi_dma_chip *chip)
> > +{
> > +     axi_dma_disable(chip);
> > +     clk_bulk_disable_unprepare(ARRAY_SIZE(chip->clks), chip->clks);
> >  }
> >
> > -static int axi_dma_resume(struct axi_dma_chip *chip)
> > +static int axi_dma_power_on(struct axi_dma_chip *chip)
> >  {
> >       int ret;
> >
> > @@ -1396,8 +1424,8 @@ static int axi_dma_resume(struct axi_dma_chip *ch=
ip)
> >       if (ret < 0)
> >               return ret;
> >
> > +     axi_dma_irq_disable(chip);
> >       axi_dma_enable(chip);
> > -     axi_dma_irq_enable(chip);
> >
> >       return 0;
> >  }
> > @@ -1406,14 +1434,23 @@ static int __maybe_unused axi_dma_runtime_suspe=
nd(struct device *dev)
> >  {
> >       struct axi_dma_chip *chip =3D dev_get_drvdata(dev);
> >
> > -     return axi_dma_suspend(chip);
> > +     if (axi_dma_quiesce_irqs(chip))
> > +             axi_dma_power_off(chip);
> > +
> > +     return 0;
> >  }
> >
> >  static int __maybe_unused axi_dma_runtime_resume(struct device *dev)
> >  {
> >       struct axi_dma_chip *chip =3D dev_get_drvdata(dev);
> > +     int ret;
> >
> > -     return axi_dma_resume(chip);
> > +     ret =3D axi_dma_power_on(chip);
> > +     if (ret)
> > +             return ret;
> > +
> > +     axi_dma_start_irqs(chip);
> > +     return 0;
> >  }
> >
> >  static struct dma_chan *dw_axi_dma_of_xlate(struct of_phandle_args *dm=
a_spec,
> > @@ -1560,6 +1597,7 @@ static int dw_probe(struct platform_device *pdev)
> >       chip->dw =3D dw;
> >       chip->dev =3D &pdev->dev;
> >       chip->dw->hdata =3D hdata;
> > +     spin_lock_init(&chip->irq_lock);
> >
> >       chip->regs =3D devm_platform_ioremap_resource(pdev, 0);
> >       if (IS_ERR(chip->regs))
> > @@ -1614,10 +1652,6 @@ static int dw_probe(struct platform_device *pdev=
)
> >               vchan_init(&chan->vc, &dw->dma);
> >       }
> >
> > -     ret =3D axi_req_irqs(pdev, chip);
> > -     if (ret)
> > -             return ret;
> > -
> >       /* Set capabilities */
> >       dma_cap_set(DMA_MEMCPY, dw->dma.cap_mask);
> >       dma_cap_set(DMA_SLAVE, dw->dma.cap_mask);
> > @@ -1656,26 +1690,30 @@ static int dw_probe(struct platform_device *pde=
v)
> >       dma_set_max_seg_size(&pdev->dev, MAX_BLOCK_SIZE);
> >       platform_set_drvdata(pdev, chip);
> >
> > -     pm_runtime_enable(chip->dev);
> > -
> > -     /*
> > -      * We can't just call pm_runtime_get here instead of
> > -      * pm_runtime_get_noresume + axi_dma_resume because we need
> > -      * driver to work also without Runtime PM.
> > -      */
> > +     /* Power up explicitly so probe also works without runtime PM. */
> >       pm_runtime_get_noresume(chip->dev);
> > -     ret =3D axi_dma_resume(chip);
> > +     ret =3D axi_dma_power_on(chip);
> >       if (ret < 0)
> > -             goto err_pm_disable;
> > +             goto err_pm_put;
> >
> >       axi_dma_hw_init(chip);
> >
> > -     pm_runtime_put(chip->dev);
> > +     ret =3D axi_req_irqs(pdev, chip);
> > +     if (ret)
> > +             goto err_power_off;
> > +
> > +     ret =3D pm_runtime_set_active(chip->dev);
> > +     if (ret)
> > +             goto err_power_off;
> > +     pm_runtime_enable(chip->dev);
> >
> >       ret =3D dmaenginem_async_device_register(&dw->dma);
> >       if (ret)
> >               goto err_pm_disable;
> >
> > +     axi_dma_start_irqs(chip);
> > +     pm_runtime_put(chip->dev);
> > +
> >       /* Register with OF helpers for DMA lookups */
> >       ret =3D of_dma_controller_register(pdev->dev.of_node,
> >                                        dw_axi_dma_of_xlate, dw);
> > @@ -1690,6 +1728,11 @@ static int dw_probe(struct platform_device *pdev=
)
> >
> >  err_pm_disable:
> >       pm_runtime_disable(chip->dev);
> > +err_power_off:
> > +     axi_dma_power_off(chip);
> > +     pm_runtime_set_suspended(chip->dev);
> > +err_pm_put:
> > +     pm_runtime_put_noidle(chip->dev);
> >
> >       return ret;
> >  }
> > @@ -1700,22 +1743,16 @@ static void dw_remove(struct platform_device *p=
dev)
> >       struct dw_axi_dma *dw =3D chip->dw;
> >       struct axi_dma_chan *chan, *_chan;
> >       u32 i;
> > -     int ret;
> > -
> > -     /* Enable clk before accessing to registers */
> > -     ret =3D clk_bulk_prepare_enable(ARRAY_SIZE(chip->clks), chip->clk=
s);
> > -     if (ret)
> > -             dev_warn(chip->dev, "failed to enable clocks before remov=
e: %d\n",
> > -                      ret);
> > -     axi_dma_irq_disable(chip);
> > -     for (i =3D 0; i < dw->hdata->nr_channels; i++) {
> > -             axi_chan_disable(&chip->dw->chan[i]);
> > -             axi_chan_irq_disable(&chip->dw->chan[i], DWAXIDMAC_IRQ_AL=
L);
> > -     }
> > -     axi_dma_disable(chip);
> >
> >       pm_runtime_disable(chip->dev);
> > -     axi_dma_suspend(chip);
> > +     if (axi_dma_quiesce_irqs(chip)) {
> > +             for (i =3D 0; i < dw->hdata->nr_channels; i++) {
> > +                     axi_chan_disable(&dw->chan[i]);
> > +                     axi_chan_irq_disable(&dw->chan[i], DWAXIDMAC_IRQ_=
ALL);
> > +             }
> > +             axi_dma_power_off(chip);
> > +     }
> > +     pm_runtime_set_suspended(chip->dev);
> >
> >       for (i =3D 0; i < DMAC_MAX_CHANNELS; i++)
> >               if (chip->irq[i] > 0)
> > diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h b/drivers/dma/dw-axi=
-dmac/dw-axi-dmac.h
> > index b18c9880711a..80e4632c0d55 100644
> > --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
> > +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
> > @@ -14,6 +14,7 @@
> >  #include <linux/clk.h>
> >  #include <linux/device.h>
> >  #include <linux/dmaengine.h>
> > +#include <linux/spinlock.h>
> >  #include <linux/types.h>
> >
> >  #include "../virt-dma.h"
> > @@ -70,6 +71,8 @@ struct dw_axi_dma {
> >  struct axi_dma_chip {
> >       struct device           *dev;
> >       int                     irq[DMAC_MAX_CHANNELS];
> > +     spinlock_t              irq_lock; /* Protects irq_ready and the g=
lobal IRQ mask. */
> > +     bool                    irq_ready;
> >       void __iomem            *regs;
> >       void __iomem            *apb_regs;
> >       struct clk_bulk_data    clks[2];
> >
> > --
> > 2.53.0
> >
