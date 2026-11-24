Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795511924;
	b=gtY68K6wHxnb2z4/jM6ECOYg+oPSv7xauJiM1gTtyuyyCpTKJhlB551PdNYcQuFsiOHQ
	 DIkiprKX36Z/7NIIJsKPMBYvA6E/GkjDmdNUuKWoRS8Jg2Ho+SHAAt8I2XPAUFmYj9bkW
	 03hceUt3omaBdl1AzGTy54+T9rq0+tY9h0dt5iXNH3VJQz8AAOhit2Mck3kl1d8xV1dtH
	 lOhDmwvoIW9CDVlL5IS/M+bbW0tzFgHuM0vneKnN+yv2yKcBz4pt8gsu3x7pujIu+T8xC
	 sgjrnWktg68NHo0pCgd+UQ/EkJwlWCXFv2G4p99otLFWJi/2QSgR4UEBOF9DNZK2S+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795511924;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=TaIwWCMx9I6oV4SxjMTi3a+08EIvzGByLCSnN8rdvdA=;
	b=tSxkK41Zs9n+xcmHIaZzPxXK8zGBaPqNy3g0cI1roxJADdNS9SGEgoyF5pETxoIx2VF+
	 USSRnp1n8AGBVQK8f/4GGMSU+2kqcg/qd3J4cjxPO40yyaNVNJZ3uZJWHsXQGtCketmCv
	 HcR4XE/kp0I528Flv9d395XHoitcUXcm8mEZLpY0kwNU7cl+CZVET/Lkux3iYXhyQguhp
	 QPdiFDvJYWxgxCVuFXK7Vn4ziJOfDPToUFbeW9G7hxe/0VUaldL2C8K56+Hcyho1qMA/s
	 vCmWfZDYAfqXum2Guo9FxCkt47JA+p4mG4QQnAsRwbvGU05balE932lSX126yxxwn4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEF4606A327
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:18:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEEF4606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b37620eb73so5732096b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:18:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795511918; x=1796116718;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TaIwWCMx9I6oV4SxjMTi3a+08EIvzGByLCSnN8rdvdA=;
        b=rH83Ov4guSNXVO8A0TfZwd5KXE1zdAIFSDFt5pD0lMakyqgHY8LtYwFstta3nXE3CF
         T9IBgE/+a1g0/U0fxA62vJULem2+kye/++eTAQfXVtAgyfkXiu4p3ZJNFfzj0Jsm1P/f
         YwnKiRy5Dv1fwakZ5kZBS58SqyIkdxSdIbsDZf5LM+0IfPsSbbowcNdPmqoo3PYe2/2l
         go4j0sqkQnwHnCVv6Aquh3jjFpC3t0HXaziwgkOS+KFhrFTyPNoDGR6DEF/U3SyZgjkX
         rjxk7v6qcQ0kQTr3Ddmp7gMQ2oeKX98Z/kNz0OpLdawh2o+el9BWJCI+8l9/qnEP3lhT
         lzTw==
X-Forwarded-Encrypted: i=1; AL+hErFDF/x5CG/YoK7d/EOOEw+E3s0qoY1X9wmYS8XJAgL/MT30PQOqh+XsyQGrIcQa3pgZyqjWuz5SB4HRx8o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ioL2yYx1OibnhxnKmnH7mnQP8ZX0RQJ6faxWVMDySgcneynHh
	WnQvuKhuJxgcPcWHn4JEPrbQsawFgV3u7mUb16MCUyDQCTAf2rY+Fgz71fuPyZC+0fQXrzbyHRE
	QYDutKRG9tdkSt7hOfyluw/34udu5V9vqWdJS9Z4ebmHkw6onB3STW3AdYVw=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1310:b0:573:d802:fb0 with SMTP id
 5614622812f47-57a09504ab8mr14368983b6e.13.1795511918118; Tue, 24 Nov 2026
 01:18:38 -0800 (PST)
Date: Tue, 24 Nov 2026 01:18:38 -0800
In-Reply-To: <20261124091833.2275524-1-hanzhijian1991@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b05566e.58b41460.7037.0592.GAE@google.com>
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
