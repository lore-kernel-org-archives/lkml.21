Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795511912;
	b=wqdzh38rKxz7/1Y3VOGB1MK5HPAeXxCa+VI6JPcFUwyloFDCyqsGBAm7VSdVLqq6pWlt
	 mzDL9VMiBld99ZMSBz1Er4Q3Kb8sJLL9W+HypQZNevBhjk1PbYFYyzrcPwfmIlMTydaXg
	 AQZQlpsRQjzF43p3M/DMQ+KXorX2488TaO5yCZvr/Z1eAIL/fZNAhvXPyeIpQUtn4yZ5P
	 M+WKSlu7nD1Y+eO/+9X7tqxv6bd2PgiHO2PelYF5c+GqXazkMZBsc1DmlZnoyDMC3PRJN
	 rGV0mU0P0wFSPa0ywV7DpI0Dtkdl4cfhrt2DSpA750ddQgMR5Kx749TKLYhqun5BSxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795511912;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=TaIwWCMx9I6oV4SxjMTi3a+08EIvzGByLCSnN8rdvdA=;
	b=u8KNjMH4cw+QpIYKr+5T3xZow6DbpiQoEjg6jHJby4//jOesccJI5TYIGusYpLEcajFg
	 Kmif2SmOXgK2tvuT1r9AVRDvQTkGpcc5nJUL6YUae+3NkJ0qIoh8waEx/zqLiOyjKuFiV
	 8HBoRoBVqDy9dzaHFAN9ebuwseSUhrVO8XRuhTuR774+ZkllqvPOsZNwZdqU9Z91p/opz
	 VY+dfw7+vy+R7d8nf8OzkV1ozcPBQhFulKzVwyC1TQ4nR+lj4UXfPL9TgBj7yjDT+kLDa
	 sZnpbJtV5E+xKgwRhD1dWLG3kz29eP0/pj41vcXwPubKe/9CkcvmRK5FLeYmgOlsT3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E84A606A686
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:18:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E84A606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4db3db8687fso5433313b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:18:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795511904; x=1796116704;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TaIwWCMx9I6oV4SxjMTi3a+08EIvzGByLCSnN8rdvdA=;
        b=zmh6Kn0GaH9FoBMeXF8BYzYTXSX1N3BJpPG3qv8gKRCbqnbKqbRP13QuZi5h/M29fB
         TFkMnuSBVoAlic8qhULLFqiIaNGsHKoJLx5JMY00wiYbKydqPpa8EHeliVQN8yNekD6I
         4YFoEVzxwqHtmBhuSgNvhwYgpar/i5NdkUF8NeW9exWqU/aTYUgrgfMKMCNNJcDB2fCX
         Hq/cVFf3z7RuB6kb95tOrrLEHGTvYPHypJcZY78nSwXnemVx/xwajCEbLYdUaITwF396
         Ir6voZzaeklkoU+evx4WvTXG+0gPh127oiuPAFqT8btmCpGr1fB/KHlGT7++iJrn55Ve
         I/zA==
X-Forwarded-Encrypted: i=1; AL+hErEauvFalFkkRvjscUpxQqwysT7wp0HL4TR2QT6j8ipHDR5ORyBcDIT49xjsB5tpAp1sAfNLjg3XlSDkP2o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qnv2JADa5UgOL7BW4s5qYr8PwlV/JzxbxNnOfHSApmC4yHEF8
	6rS9TRGFXWGmYfFqZz6aEMYGMk4uV2dzrV7Tj6SMmnYwWm4rMW7o4Uch70Li78xRPqQD5TsmNMr
	m3uFofPCs57x6DCR64j0nmoW4obBp5LUFS84k9Epk3D4aT/WaWBxWw17ejmU=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4fe1:b0:4fb:bfc2:1a64 with SMTP id
 5614622812f47-57a0b44cd17mr15925544b6e.31.1795511904114; Tue, 24 Nov 2026
 01:18:24 -0800 (PST)
Date: Tue, 24 Nov 2026 01:18:24 -0800
In-Reply-To: <20261124091819.2275412-1-hanzhijian1991@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b055660.a895ff1b.3d141e.00ca.GAE@google.com>
Subject: Re: [PATCH] usb: gadget: raw_gadget: fix ep0 request leak on unbind
From: syzbot <syzbot+d83b3c49738aea97c0e5@syzkaller.appspotmail.com>
To: hanzhijian1991@gmail.com
Cc: hanzhijian1991@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> From: Zhijian Han <hanzhijian1991@gmail.com>
>
> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

Patch testing via #syz test is temporarily disabled.
See https://github.com/google/syzkaller/issues/8122 for details.

>
> From 6d5331190d1c541e112aa26ea25f0744eecaaadf Mon Sep 17 00:00:00 2001
> From: Zhijian Han <hanzhijian1991@gmail.com>
> Date: Tue, 24 Nov 2026 17:18:01 +0800
> Subject: [PATCH] usb: gadget: raw_gadget: fix ep0 request leak on unbind
>
> gadget_bind() allocates an ep0 request and stores it in dev->req, but
> gadget_unbind() never releases it. The request is only freed by
> dev_free(), which runs when the last reference to the raw_gadget device
> is dropped. When the UDC is unbound and then bound again (e.g. via
> sysfs), gadget_bind() is called a second time and overwrites dev->req
> with a newly allocated request, leaking the old one.
>
> syzbot reproduces this by unbinding/rebinding the dummy_udc driver
> through sysfs while running a raw-gadget instance: each re-bind leaks
> a 128-byte dummy_hcd request.
>
> Free the request in gadget_unbind() instead, while the gadget and its
> ep0 are still valid. Dequeue the request first if an ep0 transfer is
> still in flight.
>
> Reported-by: syzbot+d83b3c49738aea97c0e5@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=d83b3c49738aea97c0e5
> Signed-off-by: Zhijian Han <hanzhijian1991@gmail.com>
> ---
>  drivers/usb/gadget/legacy/raw_gadget.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
> index 4febf8dac..aedc7a305 100644
> --- a/drivers/usb/gadget/legacy/raw_gadget.c
> +++ b/drivers/usb/gadget/legacy/raw_gadget.c
> @@ -328,8 +328,30 @@ static int gadget_bind(struct usb_gadget *gadget,
>  static void gadget_unbind(struct usb_gadget *gadget)
>  {
>  	struct raw_dev *dev = get_gadget_data(gadget);
> +	struct usb_request *req;
> +	unsigned long flags;
> +	bool queued;
>  
>  	set_gadget_data(gadget, NULL);
> +
> +	spin_lock_irqsave(&dev->lock, flags);
> +	req = dev->req;
> +	dev->req = NULL;
> +	queued = dev->ep0_urb_queued;
> +	spin_unlock_irqrestore(&dev->lock, flags);
> +
> +	/*
> +	 * Free the ep0 request allocated in gadget_bind(). If the UDC is
> +	 * re-bound to this driver, a new gadget_bind() call would otherwise
> +	 * overwrite dev->req and leak the previous request. Do it here,
> +	 * while the gadget and its ep0 are still valid.
> +	 */
> +	if (req) {
> +		if (queued)
> +			usb_ep_dequeue(gadget->ep0, req);
> +		usb_ep_free_request(gadget->ep0, req);
> +	}
> +
>  	/* Matches kref_get() in gadget_bind(). */
>  	kref_put(&dev->count, dev_free);
>  }
> -- 
> 2.43.0
>
