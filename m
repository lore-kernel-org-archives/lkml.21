Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795782256;
	b=r9Icxwtzd4S4dKIDaRrPR+gTm8dAWLpD6o/lpqici7hHSyC/tdNcB3cqEgLtsI0SvrRx
	 3BQMgHeyJgCJ0xCMtteLYwmnIDhuXZbpTmKzSz4K+1gL0Gb2NyudPWqspfLDc/OF6jWjB
	 ZtOAJeBi8q81ZfjCIyoqT6q10dnIAOZgqRfidiBdFztlwq4/RZYGpgVtdkt4fyomSD5qF
	 FRowGs6eRrb7VXL4GJ8sLCzWNm32sJkOgbsSXnCRftwsearzzDHBpJp6t1UBFtwctM3bD
	 SlJvaWJPu8ED4h1yt3keIEgzhLyMxkhvr0bFxZy+0dgLQYfEfD4ibuSPCsWFub31F4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795782256;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=JhQeLHAOS781k5w4uun7J9WWIR0Qr+uoFEbbpSQQgl4=;
	b=zNarZqbyeSuOLWB5rtDOYPyvr5bwrBo/q9dqqDHhApoSRAJcxiT6gRynzhn/zauNcbm5
	 TTb8joy/SZypb7QIpu5a8k4YwaSijv4b7jDosYC+T+lpU+yFUIj9EoMfac1kG96yNQE4Z
	 kUrE0vDQiA28VN/qEEVBpK+0E4TTi3m2xjW6FsQrmpOr1qTW9CQpxzdxbFYmJtveddq9G
	 UmWljvXYdXg19dI3/V5obMFfaW/7YB5mebykqGHbzcy74FK3Gitrge4Ekd/I2qEvQya5k
	 KKPGw615ZSNn+2zynwroDXe0irVbVtHntvWRsZ0DrTcs0rpzMmE8vWTgeC0qH+RmaGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W4peUhgd;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80230606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:24:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80230606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W4peUhgd
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso3210539a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795782256; x=1796387056; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JhQeLHAOS781k5w4uun7J9WWIR0Qr+uoFEbbpSQQgl4=;
        b=W4peUhgdCXq8uSZ08sv1+MrEllNH39zooP4K54TnQQ1rCvAS8vODgJY5qwPUfrKwGA
         saBSJJu02Gw65B3zEEP/Y8H5pBpao4eF3I+g3XpfO7899o7SEdKTCV3ZNfR3HkhEDaON
         4u+awf6CRZvwVqz+p34LXV1its37HPEeNBM4moryvbSDcM0y6ShuiNb/L0xu7DoIDbk8
         HGNayX9Fs0wHgoccj6AAZCPqCLIRnoiiiw3sdhgt7iUlbJ3APTVc+cvdik/7ogFQytiM
         VDWLJvcJaYuGIEhlf6sHxbX9kDzPE2rpuVSwDAd1uLim64zLijV/65ZQ8otC2Vxspl4N
         sCzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795782256; x=1796387056;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JhQeLHAOS781k5w4uun7J9WWIR0Qr+uoFEbbpSQQgl4=;
        b=XUDHH8i94qHgVgEP7tHf1glujLp3DbIPc04nDqbdEuyrd9HXeUXu0Ka175PaXrQp1I
         Ac+3xTk6V7+qVOuTq/QPlqVtE70JcTzMPaHSDnc0YmSaGMCBIFbmLAdzJ8Y3x9WRpGzP
         sGByBjjA6GtnGG3FSEw4Cb1UPsw9mOzfdF+g7MtLASr6RGNSjxmt9Yq+4q0J461NJN/6
         xsHkJe3DjS7OG0DXuYAK81JudyPb3tjBUUw9QubdAj3Q/7NgaZJO0tPC7RpjbqkXoMSY
         QB9r2WBzBJj6HQdqSYsrqZANCkq2ZYXZ88xjvzY+CUEXf0i5MYbgcg9wa2PyBvBrLoxY
         6+Rw==
X-Forwarded-Encrypted: i=1; AL+hErGu5qJJQ/uOTRKr5qfsTl3iibGM2o9LYfoId77OS+qMW4g0zPeCQJveOOpn/yJrggZxT8UWSt47KzVd4qA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/X2NICmb6ZCpC+lrBF9ordDqRHl2T0d1XmbQwFhHP1b3WK7KAj
	mS7gacB0Mqdb6kMAK3kgG2wIq1Qycl5xE6+CZS3+QHDgaPzTMsVPTM1A
X-Gm-Gg: AZFdTZd5ZW7TCgnkqRv3KHz6pVQ6h4z8Kl7waxjw9hTX1T1l26x/mcKxK6TJoh3B1+D
	X5CdgM7qoWcfiAXoKESDEdAoh0fwdJm0Csgx5IzPR8RDEFl4pghwLLsKABOPgL37FPvQ9UTU6cQ
	scujD10Cz95W1aKpXgqZPC/GvlZ0ddgZ/C6DQNE9Xk9/q9ETP2Hr93SRFyM+N125LoEgZP9EqB0
	vXUIWtsBtwgTZlDHlo30V/Rajmm5OtyUBLmLD0ijygJiIYwqBbayL+GFj4TzPYqGc2vGLlj7IkD
	QYPi632x65a38uHNP1FLocapmliGW/PwuVhjfIi5/1AqnN7EazFS82BIvfyhdP7q/mO2qwvx1RQ
	TGXhJs3erR+Yz+Cu2vurhN4mXr28rF4+87wgJHDRa7tuJY+QKZxFCpoSJ4pnbyFxqs9dPvVk2Ej
	VA25pgIzbjnsYaQIzdF3uvbnU2mRcgL83XrmpoOBIejIpdqHtMmkofbAD+l4fHDWbe2zoqb5L6l
	CXnR9z2tuIIidXb4SiKYllpZgfCXO2FjNXU2iRB0jCReSg5cNWK9luUOA3dnXvuRp0Kws5+Nx2C
	OvivfVyaiHwVuiboNDhSeuj5waube0YFiJOLhkvvZTCXBvt9g4CMIh7/pBdCsjx8GTLlyoeT
X-Received: by 2002:a17:90b:390b:b0:3b3:b858:cc92 with SMTP id 98e67ed59e1d1-3b41c97ac6bmr23397370a91.63.1795782255781;
        Fri, 27 Nov 2026 04:24:15 -0800 (PST)
Received: from Fantast-WT.localdomain ([120.229.37.123])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41aab4729sm37581203a91.0.2026.11.27.04.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:24:15 -0800 (PST)
Date: Fri, 27 Nov 2026 20:24:12 +0800
From: Teng Wu <gigadevice2025@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, vigneshr@ti.com, richard@nod.at,
	linux-kernel@vger.kernel.org, teng.wu@gigadevice.com,
	weijie.huang@gigadevice.com
Subject: Re: [PATCH] mtd: rawnand: Skip timing mode readback check for
 GigaDevice NAND
Message-ID: <awl2bMa2cqHZWfD-@Fantast-WT.localdomain>
References: <awWLzWDg-m9VBZVr@Fantast-WT.localdomain>
 <87qzgas5yv.fsf@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87qzgas5yv.fsf@bootlin.com>

On Tue, Nov 24, 2026 at 02:40:24PM +0100, Miquel Raynal wrote:
> Hi,
> 
> >  	if (request != tmode_param[0]) {
> > +		/*
> > +		* GigaDevice raw NAND chips (manufacturer ID 0xC8) support
> > +		* the timing modes advertised in their ONFI parameter page.
> > +		* Skip the strict ack check; keep it for other vendors.
> > +		*/
> > +		if (chip->id.data[0] == 0xC8) {
> > +			goto update_interface_config;
> > +		}
> > +
> 
> There is a vendor driver, you shall use it rather than polluting the
> core with vendor specific fixups. Check what
> macronix_nand_fix_broken_get_timings() does for example.
> 
> Thanks,
> Miquèl

Thank you for your review.

I agree that vendor-specific workarounds do not belong in nand_base.c. 
Adding a dedicated nand_gigadevice.c would be a substantial piece of 
work and is outside the scope of this effort.I understand if this patch
is rejected, and I will drop it for now. 

That said, if there is a significant future need to add nand_gigadevice.c,
we will refer back to the changes in this patch.
