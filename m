Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703449;
	b=hrpX1VbValr6uJET4KtKOxdcu8r6UPWxUb4iLQwcYEBWn+DPsWkzK2aIHJVxF7klaWCc
	 oXd5jS0Nw1skSvc2/w9CZWwKEE7QK6Z4ZA9+aMbUnJQgFqsnrpm0pNWW4VlNm9WfTRUBP
	 lGx7voQvjscQfCveqJPcPx5lYdCChTcgqAwBWvsT5Tym2+PYmyciz6286WdWCI0X+oACj
	 x/AkKk16YGXt4qWotE32lZMWABuFEcFzXB6Cn/QuxYzOiXbW+j0dILz6PUOA47hPMp4dQ
	 YVy9OwPo4L+utxrvNT99ZlWzv4Z44SNDEv1sX6i7Ct/Oj5U+w1U77tgCa/e7l03aH1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703449;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ABzoEq0m6vsFJk565MhCiGTGEviQ8pU/lDbym6z/Ado=;
	b=Qbty6oJF/e/p3u/pylUE9fces9YxLcY9nkEYAUz1nbKvkLxSjNOvIKjx2docnFHl9pkF
	 30scAAyIz5vRBQVqnVOwD9923WULzQMwUnd1yGu7vnUBiK6JeklMK544vq8wvSPE6sLxa
	 QY+kTWSBmq50ygog82l0UOek9EH01UIga+0Y0sFopAlHu3yVqD7bt99fc3HmcR7rjpcKr
	 vSRH5vOVWe56Y9li49QJ9yXQozvDlGHuglSA4rSHKdXHbHJ+YPtrkyu5oJ41EdKbHqmx7
	 hLVtvqTmwpbtM0kIEzXFm/AMOPnQTehmtjFOXE+Aaselgs5GFQ9Br6YsmeVegmEAbOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FTLZu6P+;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF98606A69D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FF98606A69D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FTLZu6P+
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bba60271d7so17040355e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795703437; x=1796308237; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ABzoEq0m6vsFJk565MhCiGTGEviQ8pU/lDbym6z/Ado=;
        b=FTLZu6P+3j1KJHT73x9+c1vsPjYURn8Nckh7vU0GQHWO1jaJhr6TFSl0c50PMuyBpg
         DDoM3P0wJtT2QwoXHut4wdwKVyYR7ihk5CGcFhlVrI4iSzxtkk4UzyLTMMly6Vo1mfGg
         0C8751Wmes4UioGJd7HlcYxtRdf/QizDwoM1ogvczZDOtrGu0D0iZNxYzNtkNsu/z/M6
         zmWMCuZc9QtluNZdkUUWybelri/Ch0FTtXNiVeYzPt0nkUWrIEIz5ZrzyVhivmV7OY50
         LgqYpjQkVwp66gQQcqpVB9s67aG+8rfvozx91WlNLCPhji09Ufx9Q3jd+/RSsrKJrHIL
         VCUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703437; x=1796308237;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ABzoEq0m6vsFJk565MhCiGTGEviQ8pU/lDbym6z/Ado=;
        b=YKx7FXO7Kv7BE4h21qrhq1SMA6GaJK/nEHkfe6nqR40Q5H7jgVY8qLTyZu0yCPkvAU
         4rxew6naBE+7KxJGC/b1JOB6/HXGy7uAEH4xofSWbIMtHCFSWTlKT1psTu9v1Cq4Amq/
         Yb8k/ECd1VnCDp9VgWiikStyGKP4RZc99nv8ahbeNAG45iWcuhTJABO+u6U6LSBUE/ai
         tfdzHG4TpzWy9SXpjpmkQ6+Upul/EhVDwm23mLDGn7qHM4gzUWZGwQLbugxsNDsexO1Y
         W066j7FYAHsUGwmPq3kobL/sbkG59QxewMC30Bahu6OC60BC+4mcUrrQalczmrfdN+7S
         Wx9g==
X-Forwarded-Encrypted: i=1; AL+hErGxk8cEMCmvzAXYJdMGH2gKgxTMpGTuPOwt/O1ljd75Yc/fKs+BNV+EfjfSh1bWBFf8wko4a1XQO9ajj9o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Uo4VklA8i3z1PtVufU0MbH7vtZP8nklxcpUKvuc70Fh1dgbTn
	Flp5iRIOFpvymQuRZLdgu/NnFpSuyifAQYtDTIqhOjQfpPmxtAdpIpGRZARWkfIinFM=
X-Gm-Gg: AZFdTZcknnnlW2EDc48cjuAltEWKZFvvn2iCNk/iIY1OTZcWXbp7QAW48MCzBmjw61d
	7UzX8RQP9sWKzjctdC7p17QtOeCP5zJnrhQLLYNvojAZ3EiC2I6xuTTPke7/mvsW6AJmAmLMfXp
	HoEVpoGFIgxsmbOFk9cITH8R+20B5Lc1HX3Sd9VI40z45x9rkYk8hnSEl2xnZza6BYEIQ4DC2ab
	ZBDFUd5NYlax8vb2tRLTo0IJLnHs6m4fTWm/xQ7pBTT0wwv68spts0nEZGs2jjby371zOqWeO8u
	s24jzCB3w5cKkia9rD6gVfDsQUhGzQEn3tu5JiTcGRiZO/J77H9oYVewJyoSL9JYn1fmq0kam8J
	5jrexFrS5nLeIPgRea0So7u6mwZqr1QV0gDojj+8VGwr6tHjGNV27zQbq5HjRhTx8Qj9XcioE86
	rSUpHOYU+9FfCy2bT5ZmOBxw1l4ZFpFSkjKJ2mSAm5i2PpQ0vjddh63Q2RQtUOM20JT73wza3p2
	YtbPblCmlL5EIhG+QiFwwIocmPcGbZGaL/JnnFq4bVQ+EphVbBP+uCQO1MfKPt3EA+dk5GrIBXz
	lu0J2BtfTKBqKITBAmOyAfAjimNR
X-Received: by 2002:a05:600c:64c7:b0:4bb:68c4:2044 with SMTP id 5b1f17b1804b1-4bb887fe725mr403770795e9.11.1795703436933;
        Thu, 26 Nov 2026 06:30:36 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm340532965e9.0.2026.11.26.06.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:30:36 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 26 Nov 2026 15:34:36 +0100
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
Subject: Re: [PATCH v3 04/28] dmaengine: bcm2835: Support dma flags for
 multi-beat burst
Message-ID: <awhDfF1HNkPPgRbR@apocalypse>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-5-andrea.porta@suse.com>
 <awXluqyLWzdl_Ade@lizhi-Precision-Tower-5810>
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
In-Reply-To: <awXluqyLWzdl_Ade@lizhi-Precision-Tower-5810>

Hi Frank,

On 14:30 Tue 24 Nov     , Frank Li wrote:
> On Mon, Nov 23, 2026 at 03:56:42PM +0100, Andrea della Porta wrote:
> > From: Dom Cobley <popcornmix@gmail.com>
> >
> > Add a control bit to enable a multi-beat burst on a DMA.
> > This improves DMA performance and is required for HDMI audio.
> >
> > Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  drivers/dma/bcm2835-dma.c | 16 ++++++++++++----
> >  1 file changed, 12 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> > index 118ba2f71dc8..063e1b2aabe3 100644
> > --- a/drivers/dma/bcm2835-dma.c
> > +++ b/drivers/dma/bcm2835-dma.c
> > @@ -137,6 +137,7 @@ struct bcm2835_desc {
> >  #define BCM2835_DMA_S_DREQ	BIT(10) /* enable SREQ for source */
> >  #define BCM2835_DMA_S_IGNORE	BIT(11) /* ignore source reads - read 0 */
> >  #define BCM2835_DMA_BURST_LENGTH(x) (((x) & 15) << 12)
> > +#define BCM2835_DMA_GET_BURST_LENGTH(x) (((x) >> 12) & 15)
> 
> Use FIELD_GET()

Ack.

Thanks,
Andrea

> 
> Frank
> 
