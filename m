Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611351;
	b=dL4uExr8DsQ50jAQiHfCTIq6Zey54j4UmO/ch7MVC6kt/hTrGgpZ8LlS+PB8bIyyEbWz
	 Ec1YZda7PEwNbFrCEZ/VoI1T4Rf9QHeH7nqq2UbEUy/SsIDKuYIUEseeXaFeQbBpCk9bf
	 V71jySxPOpIh5Spj8XUMXUCGohJRxSeazWXRpsND2vRZWCv44tcfSLb/LiRCvsTvrQCZ2
	 yUveMJ+Uz1B3uyQo2ithsFqFLw9S3YvTjjJ8o+AbTdUabRvvxO04XiDo6QH2paZ6fc0Xt
	 85dOyUOgBtz0j1nigosxTgmI5pUjR38lwsjEoimOklgMA+OtZGHk/Sug2qUPIaKpv+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611351;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:X-Last-TLS-Session-Version;
	bh=Zz8pRVPj1m/x6K4VKaV8LSIz7Bt1hMO6SMJiNKydZSY=;
	b=OcczCGvrar6ouVjkzCnZUrM36uiyn9i3NFWtfa6Du74HSQrmcIelZ5Eg3zWQE8zyyqHl
	 0eUR0/BKWCMDbkASb2U8hV8uo89yh3XUZ14k4WFmZHRGQ/gRX0n67jABJ/NAaSVRZnR2B
	 zkizmRIfb7R5tvnlAaXrg0cdh8GTbhZUWLNU4R5gRJy5va3FsqGvmBwsXZyEd+f7vimuW
	 d83yLTJ21Un2Yh00bcUps6uY8ni/FApucAs/s8LTjoy3895bbIK3OOU26rfCt6Wn6dP5y
	 6gurgpe+PSn/fbjldvsNdjnVlzG6Hez2YRAP/IiUG39Go5iNYI8Bt8AFc1QqYjNZYeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=aT2Zur7O;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CB1606A33E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:55:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9CB1606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=aT2Zur7O
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 03B93C62219;
	Wed, 25 Nov 2026 12:55:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1CE5260480;
	Wed, 25 Nov 2026 12:55:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7D2D011E6962C;
	Wed, 25 Nov 2026 13:55:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795611344; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=Zz8pRVPj1m/x6K4VKaV8LSIz7Bt1hMO6SMJiNKydZSY=;
	b=aT2Zur7O4lBtxYQYfwKuAvhcn1SgPWKsRujduPByUAXeP7cKx2bXz2rl25hJECg1c9PDCg
	n+jnwNyzkzWLHec2eToEEeqCDvglMfIN/J4VrrSIh2DV23apCc23WBose8SXWZLvxawhzk
	q1oqb+8JaZkeC+qb3qv4XrxIpbkU2yZYAjnZFeDfjeeU3ILUhMgjxa9RGYLB1q1JbFtmjx
	ZJiEPwJ0CxcMHQ9qSIqTuGtfys4S3K9M5OCrb9NMvOwGopqc5yNWLPguFsnVzHr24EwDTR
	lha/uisEzrpIH7afHam8627TMN68SCVDBmGNl6O1Dl/2pJEZcttHFpXiIMcMZA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ping Li <leeonion.muyu@gmail.com>
Cc: richard@nod.at,  vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  stable@vger.kernel.org
Subject: Re: [PATCH v5 3/3] mtd: rawnand: r852: declare NAND_USES_DMA
In-Reply-To: <20261125122135.44696-4-leeonion.muyu@gmail.com> (Ping Li's
	message of "Wed, 25 Nov 2026 20:21:35 +0800")
References: <20261125115108.4147741-1-leeonion.muyu@gmail.com>
	<20261125122135.44696-1-leeonion.muyu@gmail.com>
	<20261125122135.44696-4-leeonion.muyu@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 25 Nov 2026 13:55:41 +0100
Message-ID: <87cxrtyss2.fsf@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3

On 25/11/2026 at 20:21:35 +08, Ping Li <leeonion.muyu@gmail.com> wrote:

> r852_do_dma() feeds the buffers provided by the NAND core straight
> to dma_map_single(), which is only valid for linear-map addresses,
> but the driver never declares NAND_USES_DMA.  Because of this,
> nand_base cannot know the controller DMAs these buffers and never
> bounces non-linear-map ones.  Such buffers are not hypothetical:
> mtdblock's write cache is vmalloc'ed and UBIFS passes vmalloc'ed
> LPT buffers.
>
> Declare NAND_USES_DMA so that nand_base bounces non-linear-map
> buffers through chip->data_buf, and advertise the hardware's
> 512-byte alignment requirement through chip->buf_align so that
> misaligned linear buffers are bounced as well, like the other
> DMA-capable controllers do.  Both only apply when the controller
> actually uses DMA: the PIO fallback path does not care about
> buffer addresses being linear-map or 512-byte aligned.
>
> Fixes: 67e054e919248 ("mtd: nand: Add driver for Ricoh xD/SmartMedia reader")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
> ---
>  drivers/mtd/nand/raw/r852.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
> index 92c47d351c27..c5a3622cddf6 100644
> --- a/drivers/mtd/nand/raw/r852.c
> +++ b/drivers/mtd/nand/raw/r852.c
> @@ -640,6 +640,11 @@ static int r852_register_nand_device(struct r852_device *dev)
>  	if (dev->readonly)
>  		dev->chip->options |= NAND_ROM;
>  
> +	if (dev->dma_usable) {
> +		dev->chip->options |= NAND_USES_DMA;
> +		dev->chip->buf_align = R852_DMA_LEN;
> +	}

Wasn't in this driver a bounce buffering operation that is no longer needed?
