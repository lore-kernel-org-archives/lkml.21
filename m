Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596919;
	b=4tG1QtILieDZ+oepdhiC0ON/I9pYu3KlLO5BxjQEzuxLrPwoVgjNagHTI4d5KVLNjEeu
	 Bcd5hGJBFRk2JruE4YMNe063iLaEWYMM0jDD0hWqCNV56rA6aKBLQc/w0nEPtSLAjo/LQ
	 0bXJ7NovmrlLPhBoxztIquQFKm7bIZkExaOgFj5qIdSv66Ceq/mhfCiSSIIKJFzkooez3
	 ta9we9trGeUVEVZHOCg609QTMvIn5uRReyUlkm09y2YPD0ukQPMIoP0vxBTnGXYehZkcc
	 tj4SAvHEbZbWoeFnYcUywW69pVvet+5N4w9zdKeEtX3tbX2ZS/a2KSsy/VHND5WO1jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596919;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=ltkcJXou2Sk6MxEHxOTGoZvucs99rnFqVFhzyx4fQeU=;
	b=48H0XHF5rbFZFOwu0rAC8ZtP+Yg4w8cSKFND5TEyZXgzCMdXlPq0AivmnKDtPH7TFCXc
	 tLaa35M1wEJOL2SIis+5OlehXQjmioy06knG9QfATnyPznTi/pFGVlxy6BKwDK6UP5D9e
	 wlES4J3nn/P8MQoijAL+afHjKsbRVXZJS8RaSTY5Fo3CMXEduv/tGtJjKP0FUiqyxDm/1
	 KApX4KWo91++Oit45I2Do59Puz+uSCgfNOBxFndQKgPHJfDuED6igP/r1wjUxgAKhtPNR
	 6p0ka27knYiAv+DnVBfkG9b2sAB4t/ujjNEYlEHmJiVVKdTh6mFHORHRat5pHKU/fkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="WhUJ/GcR";
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2DB606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:55:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C2DB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=WhUJ/GcR
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6A3EAC2F4C8
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:55:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 99E0260480;
	Wed, 25 Nov 2026 08:55:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BBB3A11E68022;
	Wed, 25 Nov 2026 09:55:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795596916; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ltkcJXou2Sk6MxEHxOTGoZvucs99rnFqVFhzyx4fQeU=;
	b=WhUJ/GcRVLR49m8UGrh3NO45/FZkFiqSZwvkLmHB4/Fzu50+lSCW6OShejxSp8aV7b++J/
	EJGJUSuXkZRbt6S3zGiOhMs5mY6bt9xqN/XFAygmdtI54dL1rtO8JSl/7ewmjKLX/kH9T2
	2UlDTVOLYPrDXDWYF6d6IzP25zEL52x7V5VDMcwcIfrFMOco6FaxA8LmoB3QcGcSPooqHA
	y+HjEuE6kEyUjUy3ql+keeLqXw1t2RLWR1XP/3kFPkV6WGF3+jO/84EWjkyrKblX8XDiFx
	s154sJ9IAK+0Crg4TLc50d4ZT+Pp8iL5xgW1RViC9kAqq0yugvmK7GkGmR1QGA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ping Li <leeonion.muyu@gmail.com>
Cc: richard@nod.at,  vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] mtd: rawnand: r852: bounce non-linear-map buffers
In-Reply-To: <20261123070440.3060882-4-leeonion.muyu@gmail.com> (Ping Li's
	message of "Mon, 23 Nov 2026 15:04:40 +0800")
References: <20261123055020.1995251-1-ping.li@horizon.auto>
	<20261123070440.3060882-1-leeonion.muyu@gmail.com>
	<20261123070440.3060882-4-leeonion.muyu@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 25 Nov 2026 09:55:13 +0100
Message-ID: <875wxl1ea6.fsf@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 23/11/2026 at 15:04:40 +08, Ping Li <leeonion.muyu@gmail.com> wrote:

> r852_do_dma() only bounces buffers that are not R852_DMA_LEN
> aligned.  An aligned vmalloc'd buffer passes this check and gets
> fed to dma_map_single(), which is only valid for linear-map
> addresses.  Such buffers are not hypothetical: mtdblock's write
> cache is vmalloc'ed, and UBIFS passes vmalloc'ed LPT buffers.
>
> Extend the bounce condition with a virt_addr_valid() check so
> that non-linear-map buffers go through the existing internal
> bounce buffer instead.
>
> Fixes: 67e054e919248 ("mtd: nand: Add driver for Ricoh xD/SmartMedia read=
er")
> Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
> ---
>  drivers/mtd/nand/raw/r852.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
> index 92c47d351c27..4dbfc053fb21 100644
> --- a/drivers/mtd/nand/raw/r852.c
> +++ b/drivers/mtd/nand/raw/r852.c
> @@ -188,8 +188,8 @@ static void r852_do_dma(struct r852_device *dev, uint=
8_t *buf, int do_read)
>  	  from device, for writes first fill the buffer  from memory*/
>  	dev->dma_state =3D do_read ? DMA_INTERNAL : DMA_MEMORY;
>=20=20
> -	/* if incoming buffer is not page aligned, we should do bounce */
> -	if ((unsigned long)buf & (R852_DMA_LEN-1))
> +	/* if incoming buffer is not usable for DMA, we should do bounce */
> +	if (!virt_addr_valid(buf) || (unsigned long)buf & (R852_DMA_LEN
> - 1))

Why do we need a local bounce if the core can do it with NAND_USES_DMA?

Also please add Cc: stable to these three patches.

Thanks,
Miqu=C3=A8l
