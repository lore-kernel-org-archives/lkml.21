Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703957;
	b=T/cwELWPfxxRjYrsNwN4QDLHMHVvjfRUDKcB4gpGod0IYr4TNtEFWvGG5Ecqj5WKdRZ6
	 /5u+N/vof+RgJbg/GYCZrUProVdHu8+Q/oJM2nW2zsqWj3I2VsgJXOUsggYzY1/ggXQzZ
	 oNrLQE5RCj2MI36C9cKe3GDPMcF4vsQMC4Z86/YykDgv0BBTbwtXFL9SdMsSv4X3KFLfb
	 ITVT2IS+PCo6hvRhDy2n0XvrYzjA1SaQ1cBH6bAJ84AIFLM0rE2hX4HZsSwH+SPB8x8GP
	 yT5q9P7/lHMuIMlmnssh3J524VT3ytc+G9cZu2JHBvXPMOnMvkBXgmxRrHZT+tQR39Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=NpCp8gTUV7b7urT+XT+vwa1wDWyVOE1SIMBZubybyy8=;
	b=TPgmvgFBUlCZlUQvygpILaBzQr+dbZv96fIjSf8BKf9lrjq6BOU2e9UBBB6KKDvisyTj
	 h2h9ZSJsUwzCCRTWTfdTArOT407A3eYW6YRf9gsDfO3FQi9qqdbUe6h0L1wjy11N9/sbU
	 xmkSIFj33953CrhxuNP4nJfhrAO1rTme1FMsChxZUgziM9YrCHTTpfa2e0M+4wUPaAg1L
	 NoD3Fa2OIvuFfZ5KGXNhUsLJ1wQOAoC1kY61Wn5LnjUV8SKZmgl3ZKvvXKkLe1TlXOF/p
	 bC4vQPcZIc/pw6ZPOcv9OwZ/8FrdaJRv76WqSviZazHrhJNwP0azezVi8mWfNZOTK6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="DxDZK/jy";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFBA606A334
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:39:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CFBA606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DxDZK/jy
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so58739535e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795703955; x=1796308755; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NpCp8gTUV7b7urT+XT+vwa1wDWyVOE1SIMBZubybyy8=;
        b=DxDZK/jyi9VtiHb0cvgE58g9Zl0do5MkmhZxfg9HKejt3c1xlfARiOTzb7plD1PB4N
         amkbczFI1s1d78cXWITqNkqIm5d8kK0LSLher2MRfjuYpCSUQ0hZRsAOfLh+6XJJrPdS
         RVHW2e6bPkr0P4HwLVdE5v/bmwylFwFMy0mvSggD6kGWaD6jtQf3LbVdfZA/kzMv9r/y
         pBRm1NvnFydhwmd8MZowSVVqGse/OwP9R2OOg9GE2TH/N5UZnlG9w0inDe6z5y73XXWz
         tTU6LbmXcWw6yR8h4ER69y3B9fvsoWBoY8XnMrRAicRb+c7BPiwcl+5RbjYsj54NVRQn
         JH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703955; x=1796308755;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NpCp8gTUV7b7urT+XT+vwa1wDWyVOE1SIMBZubybyy8=;
        b=NPohFYfIFHt9IuR4Ka43AFIiZC6pxrCoZf/TX7egpOnIokWdMOIjKX6FKKYb6oIJ61
         qOtrDZIRYM1MxOrxlsVQPeY0ScT22dcoIZ8RneUp3j0Cf6J8DA07rHqLkuPdFmYrKtBC
         HO7p8ky3d929hME69/R2cLD9usqmuI99AhKegHYal3wppzSeBqCtU9RtWpVZn37sy5oV
         +vE/JvmF1LdiFkWVPoT1d2uV1mlbeXsb6XogAhOkRVf5t/oCtKioNV/atUYm48QRwb4C
         dsptuKRdQGAIkiKGXTGlmnUJLbWV729WX8LIzsUKcZZE1NPcA/saTgOBlhUzX2ks73Sk
         e19Q==
X-Forwarded-Encrypted: i=1; AL+hErF7omW4svwuD0q0c7/Z5rgGMBLi2dHRrSolux5DN1IBcsFsTDGkcz90W6He1lpZ3t1rRzZFqs6YYt7sbFk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mLkF1XuV7O8UzjlLzkH4w+yKdWv0SA5Y1ej2JspgXGGIREdM5
	oWkKKpJ3aj+1yddZxG9aY7eB0oKuUE5odmKU5ZhnHJj9/XxZKOB59nKSWDgGfVBhOAI=
X-Gm-Gg: AZFdTZccOOKPSZ+/1sT+z23E/MqiRe1JkdbOofk4fBba35Kp0THwNttsE/Q3GeM1wCG
	oin3d4/rGIR16kEdGV8jsK4bH0HuhaamSKeQthOgTkgB3mewCNeYOiu5JSNN4h0MbtQFGJF75K7
	iJ71GGNPpLY09c+wi4yJVavxW9bQGnWAUYfpvgaLWyZMWslcqt1h+lZ41H4HFnCmECnpa8SbFjj
	0NkAiuHCGSgVxqR1tUlZvWRgT+9eUJHBSu59rao51mV3qBfcHaNpQ/oeUgX2q0cVBRHBACYlnri
	oeHl4LS3Jkaa+WdRKKzbV6cRWwsAAVJ4O6yGoip7tASSpoSb667Wy2qC1tqjL57ba9WrIjuSF0N
	9u/rlNxi0aN19ccSln5ZmhFm/dHR/C1fPYxRTtqwaoVa/9ZwuxRynhYg9D4tvLqQoqiV0oJ1qFZ
	PbdAOsLf+BMAsJ2S0MI/4TsrsEEBbNK/41KfAvo51SBBM1bdwR7COr+3FdBptekmKZwFxcIVYC3
	/3jNr3wyT6TkzFXAqLhDchTMNgrhq0rbiGBuY1qJZ7fdUJ1bpPPQFixVUVxBjx94k8FkzcIR2pZ
	L54JDrs070aeOoDmi3p5DsnAgTXE
X-Received: by 2002:a05:600c:154c:b0:4bb:6a78:7c42 with SMTP id 5b1f17b1804b1-4bb887c3428mr428700785e9.1.1795703954785;
        Thu, 26 Nov 2026 06:39:14 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm712460975e9.11.2026.11.26.06.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:39:14 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 26 Nov 2026 15:43:14 +0100
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 07/28] dmaengine: bcm2835: Support common
 dma-channel-mask
Message-ID: <awhFghuBMy8IzMSs@apocalypse>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-8-andrea.porta@suse.com>
 <awXoAqQhSWa95FH9@lizhi-Precision-Tower-5810>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awXoAqQhSWa95FH9@lizhi-Precision-Tower-5810>

Hi Frank,

On 14:39 Tue 24 Nov     , Frank Li wrote:
> On Mon, Nov 23, 2026 at 03:56:45PM +0100, Andrea della Porta wrote:
> > Nowadays there is a generic property for dma-channel-mask in the DMA
> > controller binding. So prefer this one instead of the old vendor specific
> > one. Print a warning in case the old one is used. Btw use the result of
> > of_property_read_u32() as return code in error case.
> >
> > Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  drivers/dma/bcm2835-dma.c | 19 +++++++++++++------
> >  1 file changed, 13 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> > index 51e3a40dbaec..1087157fb242 100644
> > --- a/drivers/dma/bcm2835-dma.c
> > +++ b/drivers/dma/bcm2835-dma.c
> > @@ -991,12 +991,19 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
> >  	}
> >
> >  	/* Request DMA channel mask from device tree */
> > -	if (of_property_read_u32(pdev->dev.of_node,
> > -				 "brcm,dma-channel-mask",
> > -				 &chans_available)) {
> > -		dev_err(&pdev->dev, "Failed to get channel mask\n");
> > -		rc = -EINVAL;
> > -		goto err_no_dma;
> > +	rc = of_property_read_u32(pdev->dev.of_node, "dma-channel-mask",
> > +				  &chans_available);
> > +
> > +	if (rc) {
> > +		/* Try deprecated property */
> > +		if (of_property_read_u32(pdev->dev.of_node,
> > +					 "brcm,dma-channel-mask",
> > +					 &chans_available)) {
> > +			dev_err(&pdev->dev, "Failed to get channel mask\n");
> > +			goto err_no_dma;
> > +		}
> > +
> > +		dev_warn(&pdev->dev, "Please update DT blob\n");
> 
> "Please update DT by replace brcm,dma-channel-mask with dma-channel-mask\n"

Ack.

Cheers,
Andrea

> 
> Frank
> >  	}
> >
> >  	/* get irqs for each channel that we support */
> > --
> > 2.51.0
> >
