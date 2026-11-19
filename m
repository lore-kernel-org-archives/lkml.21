Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795081113;
	b=kDNL/MKl/83McNQw+KeT4Acneeogrw6rfX8ZXufA5ZbBeR7quKuCdGewkbgCIHkWGIbL
	 ZngzJnhl6jTMs5GlEQ8oR9e4VFmMGZfs21i8ZOkZUeewv2Y9HgO1afHhVMYDWdbVqPxbL
	 vpzJWye13duaxTN4Y7+LOQ4lZrfmxD+BrVOYrhPfyx6YtTo1IYBgoazCahMxK8I3YVVSM
	 nIEzNfvN5ffUIxdKSsbGMEARk02dVyFYdhXU+5NAv7hxijWFynN2a8fHcto1yEmgHIwIX
	 zSF2UmFAzfDjvxU+g/94IvPAdMxaGE5MqpXz/LElm5nD9zkZMThW+r8a/b9VuuZ6+0Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081113;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=s8nhpF/5t21tllE4kNr5hlFkBROVgPAv06E0/X8d27k=;
	b=Ac6e1EUoPRRtYOFNNPQzFLNX2bUOwJn8DfjD/cizyHWt2bS6t1xcoJFuu+DBuL41A7wa
	 A7XhYrftGuOU4qdP5OhE86krJpRm50soicWRQ95+zG4GpGZY2puZqNJMX2s9H/RxmXYLg
	 x1GBinq8bxh6qDmG7WcRoirQ83YcYREOXxawUBvxuacqeoZTA8mP6cnxnhxRr+Ot6lYWb
	 xduERXDB4lK4+TDfdzRlRI6Ws2qrYAB/mK3QmftOvJwg+U88b5z5bRo5Bf+QuXvPPN/eK
	 XPMPAyuuXS/FDFuMJcsU+3SRxMrkAd00skgF3rcGSsMy/I/yQPT9yjwojwOLXEDI5Kw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RhUbtoZF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.174
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5190606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:38:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5190606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RhUbtoZF
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-945e6d9ceeaso179372485a.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:38:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795081112; cv=none;
        d=google.com; s=arc-20260327;
        b=J8KX0+3XOkVt4jvmxki69gkqDSWV6OZepis63a1FExhwAr2aJLwjLx41ZrSvuPnfZQ
         w32Bv0lnHapFroFMF30QzzN3n1TNrDK2a8fJqw1BpIWsSAJSK4FpY8Ux3bkD6XuR/SUo
         pGMzp/+9kg45bwAZoUS/7Ke1hjpRKbeKktZIhqaCQJuE0CEIFKDHH2FujOwK8ln8Ohqr
         HDb3ZhlQ0lsERKrAPd3FthXhZBE2E+zVG0ZWAnlhB3zNk4Hkv5wNqLC1wEIe8g74Tigs
         QHWmoW/Cfsi5PUI3tnMAj+zapk4/L6QOIcr0ifyO9RVpxJLpsshGDjN8dg3t3d/NgLDm
         uLDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=s8nhpF/5t21tllE4kNr5hlFkBROVgPAv06E0/X8d27k=;
        fh=V4c4oyMs7byVfZKqQBBt+yXV/XyrOUgan/BuAsKpmnM=;
        b=L9ljMTtzNGu65ST3cjZR0RTinr6Lw81iJRYwz4IyoYzQZ/jEohVVqtTbkQdre2I+bH
         JE5BGH6g8866JvLQ7IoWAd/JOu4DjWISGQ95kNi5S43JotsuUrDuaDLCN5PRwd7xDO3n
         G+mIRYFqhmsO1TYsHf/JT3XS6NvU47QZ/e06Svw3k6gJzcBYzKHIlxbfTOIU6g1sjtAa
         EGB8xCdK5IOK7F1P9sFlLf0NhXa9xEJm+4anydwPjzs44+IPvIcBR3rqll9XcFzri3gI
         DTK3+L4lZi3XylLiQfJ3P9aBRk49spq40hprH/e7qLTjjznRSn2mjwE7KnB0K31BoPFg
         7Uyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795081112; x=1795685912; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s8nhpF/5t21tllE4kNr5hlFkBROVgPAv06E0/X8d27k=;
        b=RhUbtoZFnCx4f3nDvRvAhBnEbrdNbG6ReO09HJgNDE6J1s0dQDS6DmgGEthF0nnUDH
         +MT7B/6jWOHyCxuyVT5n5gthTGGacMJtr5xNy7n+9Pye2dSyDONfWAf7ocVDSRO9H0Ic
         0PqGWS1CP73icUv/g4sNSK61hip8/NkihkzcfSA52ycSvN/ZrZmefhubhbl7NXQqQE5z
         bwQEZcrlgFceL4vOAWmlXZBIgepATeGu18lDM7PdBr0ZB6NF4hCEHZLM2bIE0k3abtmp
         GAMm6a1SaUT/xMcIrmWo+B8ny+OMG6y788KBum85uAmlyFLf8gFrUFzkH8MICxvxHodm
         XsQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795081112; x=1795685912;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s8nhpF/5t21tllE4kNr5hlFkBROVgPAv06E0/X8d27k=;
        b=Tly3TyoDAF/0fYdNrC6iGNdFm5F0d06iHMIbp1vzh9xBsVG2lFX+8OHJqRTvWCl+ax
         5WinimBLkqz01FNXX+U0Pf8aCNAiwoxqs69rqn/niZX1eRF7GSNT9dq0x8V+R0b66xk7
         LsyiHhM2GDQlnCO/beCINsYzpPjuZ9OXUMXz/zs7M4SeuoQzYE4SgQJUjsGNnTuj4Cfw
         ocRxSneNNBOUwMzkTUhbzdOAtrJaMXIF18/OVnj/4BmNZnSq9BmU1TDCXr1Yhw+KxqRU
         2BXdlMJ9BhAS4m5Qv+FkCV+xlkky35AOJ6yhTgU7Ed0QwRuLLa3n8y5ZWkwpQ+KZbY9L
         LNDA==
X-Forwarded-Encrypted: i=1; AL+hErFY7nd8UcnFe5HwA4Oahv/uzt7a+R/ZxxlL7hGKZiLsJ+jDiB/iDuDdaOEZrAXexDvMoDY/3tXUbyK/NjQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9M2NLGQN0hk/n6unkIcEGy3Dj/R/G8WiLL4rjfRc4YmHzuCoQS
	fzqG6hd5qpG4+pv1Rv5opjaFAze+zBgryT5UPVS3xJ6tvF+0QJDWPVgACMS5MYaUPyjOr/QRZgl
	jE39lyZ1WhmtiXZkK8K1tdTzgliRHZnA=
X-Gm-Gg: AYBFou2kM3OsPg4HdvpxTvl9iEf6H4xQbyACVLtqtILwp1laxboxa6HV5PerB+xeRGd
	wFynMnWIJhg+YR/nVP91s8SGE7P1mVeIb7PJTGOSh4gULtZ/f57Y9U6myBn9WrvWTN4fsoSP8/u
	INUWjYiXKQzVmAjgMTptToFFcfIhWPTM+/DOs3/i59eQJW5QXA+hmxV4zG7K12Jn17NIbHG1wPa
	Uv5Dra7+qWu8M5si2xXKl33FkzkKAQdu95ePXzHCVy0Gqt2q1u38WouVUUrxZR863fhKqP+QyJN
	Pr7vHc2Y6VjKCn4AVSYrxuSt6fVjJZ9m8/33kSzprQnoSUHEEaKvDf/Vpe51C+/5IcBsb8d0NZU
	626P1emNLPXMkwf/n5xOVh59OJMV066W43cw6xhx7RolFn5mxPmASEEXgFJ5/e2nbBWjnKv8=
X-Received: by 2002:a05:620a:4809:b0:944:d79:c02 with SMTP id
 af79cd13be357-949994a8215mr964986285a.10.1795081111763; Thu, 19 Nov 2026
 01:38:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAAi4Z-d5eV8FM5sYJj1gqudWyioF++fG8P6uGX_LxbiKSXjekw@mail.gmail.com>
 <avyZM-6gM4amnQMT@lizhi-Precision-Tower-5810>
In-Reply-To: <avyZM-6gM4amnQMT@lizhi-Precision-Tower-5810>
From: Alex Guo <alexguo1023@gmail.com>
Date: Thu, 19 Nov 2026 17:38:20 +0800
X-Gm-Features: AclHuK9v7LJbhjVCrFOjeIf_qPnWAg5u9Sv5E5RixcPyL74qGSwBar9TYvQiOSA
Message-ID: <CAAi4Z-eE=16GBivyAz7=ucsD2eBxR3-qG2KebRvKGJUE=VkLHA@mail.gmail.com>
Subject: [PATCH v2] dmaengine: owl: Check IRQ lookup result
To: vkoul@kernel.org, afaerber@suse.de, mani@kernel.org
Cc: Frank.li@oss.nxp.com, Frank.Li@kernel.org, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

owl_dma_probe() passes the result of platform_get_irq() to
devm_request_irq() even when the lookup fails. The request can replace
the original error with -EINVAL.

Return the lookup error before requesting the DMA interrupt, so a
deferred probe can be retried.

Fixes: 47e20577c24d ("dmaengine: Add Actions Semi Owl family S900 DMA driver")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Alex Guo <alexguo1023@gmail.com>
---
Changes in v2:
- Drop the paragraph referring to the similar Tegra QSPI fix.
- Add Frank Li's Reviewed-by tag.

Build-tested the affected driver object with Clang 18 for arm64.
No hardware test was performed.

 drivers/dma/owl-dma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/owl-dma.c b/drivers/dma/owl-dma.c
index 31a6c6e01a75..daea82718229 100644
--- a/drivers/dma/owl-dma.c
+++ b/drivers/dma/owl-dma.c
@@ -1156,6 +1156,9 @@ static int owl_dma_probe(struct platform_device *pdev)
         * simplification.
         */
        od->irq = platform_get_irq(pdev, 0);
+       if (od->irq < 0)
+               return od->irq;
+
        ret = devm_request_irq(&pdev->dev, od->irq, owl_dma_interrupt, 0,
                               dev_name(&pdev->dev), od);
        if (ret) {
--
2.43.0

On Tue, 17 Nov 2026 13:13:07 -0500, Frank Li <Frank.li@oss.nxp.com> wrote:
> On Sun, Nov 15, 2026 at 02:45:05PM +0800, Alex Guo wrote:
> > owl_dma_probe() passes the result of platform_get_irq() to
> > devm_request_irq() even when the lookup fails. The request can replace
> > the original error with -EINVAL.
> >
> > Return the lookup error before requesting the DMA interrupt, so a
> > deferred probe can be retried.
> >
> > A similar issue was fixed in commit 47c3e06ed95a
> > ("spi: tegra210-quad: Fix missing IRQ check in tegra_qspi_probe").
> >
>
> Drop this paragraph.
>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> > Fixes: 47e20577c24d ("dmaengine: Add Actions Semi Owl family S900 DMA driver")
> > Signed-off-by: Alex Guo <alexguo1023@gmail.com>
> > ---
> > Build-tested the affected driver object with Clang 18 for arm64.
> > No hardware test was performed.
> >
> >  drivers/dma/owl-dma.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/dma/owl-dma.c b/drivers/dma/owl-dma.c
> > index 31a6c6e01a75..daea82718229 100644
> > --- a/drivers/dma/owl-dma.c
> > +++ b/drivers/dma/owl-dma.c
> > @@ -1156,6 +1156,9 @@ static int owl_dma_probe(struct platform_device *pdev)
> >          * simplification.
> >          */
> >         od->irq = platform_get_irq(pdev, 0);
> > +       if (od->irq < 0)
> > +               return od->irq;
> > +
> >         ret = devm_request_irq(&pdev->dev, od->irq, owl_dma_interrupt, 0,
> >                                dev_name(&pdev->dev), od);
> >         if (ret) {
> > --
> > 2.43.0
