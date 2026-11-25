Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795600138;
	b=Wo3/efjJrfxclOIFWFy8C8DNJsoTZFET7qQ+WvqCjPmeHS8FhZSgPkq37f+1i8ScBT5Y
	 1Q42TRjyy0KYIrSjoiaT9PTsYQ1pb3fNk7QNAN8vAiReX2Xj7yrRuooXqpXYLtmKQeJWR
	 9tjAn7jLILzBvYhZIkAYec32xks8u76LfQ7CU5dcsG2sLOgiQfTWeDoldnaefBgkmxVUe
	 dxhgdmRny3YlEfjf7EUKwUhfldeSteiD3vn2ergrt37UlaSNpip0MzRCu8igKEmjqarlr
	 xquUMOPRRU2uE1SOWqqDUL2goZ1qpSwQj4fSHFtyKIpKDHG4HqYhDCHUR78bWMuMLEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600138;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:X-Last-TLS-Session-Version;
	bh=hSrZ7TU1SA/f7pgNCA+lRSXARyll9PDrfkSwUDqb5bQ=;
	b=1vEDXWFL+3cdN3cAj5UVCbV+cfdIp18rZC5cKdhMITbsApeG/YP8nHPc7VnJq+oOOKtQ
	 7NFzoZ5rHQF1LDPCXAy0KeIG4404iNivao58yyzMliTFTXkX50E/6ar7ypS/oPAPli3+r
	 +ujIS9XMNSu5oGOLCYuswDJgI9eEFk1trmGJX+EnLZ/OTHRYEhJ23zbasDA+j7tl2F0Mu
	 2LvcxgKDa2FdpPMJU93ibnGFlHKm+l30cTJ8BFrtbapz+5qh2PykUUMhyw33gZtjmZNEb
	 ZjAlwLgX5JBNjv/ZSJQKvSbfuQJhRgyOTrv8V7lXtR6/ntDFgnj1DSq1mqQMfDcaF6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=TOy6dma9;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E22606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:48:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50E22606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=TOy6dma9
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A7074C2F4E0;
	Wed, 25 Nov 2026 09:48:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CDBA860480;
	Wed, 25 Nov 2026 09:48:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0511711E68BFA;
	Wed, 25 Nov 2026 10:48:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795600128; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=hSrZ7TU1SA/f7pgNCA+lRSXARyll9PDrfkSwUDqb5bQ=;
	b=TOy6dma9VN72lEIA2mOsMYgGMAErfdIoRSZWSmuR3sNQ/r++AKHH05xX7wZHyXoTzYrP0d
	MJgyYXafYAVyeXfaszWG3DVaRCGADyJJ+4TLGN6ruQ85uytHsqBsKcwLYeTxGBG3VAOsZL
	LS6Xi9SMbtpuqisidOW7XHsETfWUbdIhgHf4bS9/y5e1+DgUY9TYE5o21jFdhrSfDT7M13
	Wvbupi7nG4/gHDEBgd8w1CIMPdIi/DNe1K8Wl6JVfEDweAcvti+VkCjnPPcOZm0b86y8WY
	mELRLcph9h+AgI5+T0RBPy5C2rL4s4x0GkJaRRRzNsMzevrdT+evzz8ty6xB3w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ping Li <leeonion.muyu@gmail.com>
Cc: richard@nod.at,  vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  stable@vger.kernel.org
Subject: Re: [PATCH v3 3/3] mtd: rawnand: r852: declare NAND_USES_DMA
In-Reply-To: <20261125092538.1938516-4-leeonion.muyu@gmail.com> (Ping Li's
	message of "Wed, 25 Nov 2026 17:25:38 +0800")
References: <20261123070440.3060882-1-leeonion.muyu@gmail.com>
	<20261125092538.1938516-1-leeonion.muyu@gmail.com>
	<20261125092538.1938516-4-leeonion.muyu@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 25 Nov 2026 10:48:45 +0100
Message-ID: <87o6bdz1fm.fsf@bootlin.com>
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


> +	/*
> +	 * r852_do_dma() feeds the buffers provided by the NAND core
> +	 * straight to dma_map_single(), so ask nand_base to bounce
> +	 * non-linear-map buffers.  The local bounce in r852_do_dma()
> +	 * is still needed for the hardware's 512-byte alignment
> +	 * requirement, which the core condition (chip->buf_align,
> +	 * default 1) does not cover.

Can't we change the default for this chip then?

Please drop this comment after fixing that, it is not useful, this is
information that should belong in the commit log.

> +	 */
> +	dev->chip->options |= NAND_USES_DMA;
> +
>  	r852_engine_enable(dev);
>  
>  	if (sm_register_device(mtd, dev->sm))
