Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795511915;
	b=yeffHT7nq2zIuqO1CCcaWo184w6sf9+pW8FDM4KmoSO0ql0SgivCjFXa5TVL+fRuKCKR
	 5O6NsV8Vd674ka5CE16VZWIFSYxfWyd5rqU6P7prEzEEpxaOv/VzOYkYJgQNaYFXJ73mo
	 bcQsaEQdba2F2jM/DHoFOLKyE8xqxgRiK/g+yjZbmskuzllsQenrMbFKxnAiDivRZNlMJ
	 nnoWTRGnH+pYL/9DzRad2IftT7gPrWKPlQyjoYy0gRnPtxtOR8XxRFYIpbmmJsxDya8u4
	 1ihKQ7TkBYZsFtvCIyMqul+DXrrfY+ggGXXMLyIV7094Vt+UbCUgFg3rDp00A4domqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795511915;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=TaIwWCMx9I6oV4SxjMTi3a+08EIvzGByLCSnN8rdvdA=;
	b=mTUyJ2FaDAbcuuTDQxV98K3vH84N+78UPTJkKUXM5U3DAHCWVns63k/ANWpgOV+W2S79
	 MTMiTE1bLIys97jAxZZ3gFpPIDpvsEhENtdaJYj3VqrnKKehm3/8VL9C7uDmCJmFVc1SG
	 HzFiAu48DGQ7tw5yjmbaAcg4lNgk7g6WV8nW4gCqgPKZgjTW8+xYT5NE88yCqt1hCOBTj
	 bpgKhUkXS3FacbOGI0UD49VGiyDA4E7p94gUgUHlSWZgZh6/Vn1ah+H8JN5+bkJKVJn/T
	 +3Jg01Kmi9hdxlERlLKrGmBzEYs5Zj0eMgL59UZayv4VGZjXt6Rgyk9/OMuSHhFz3/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57278606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:18:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57278606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-5713cd0fb42so6333454b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:18:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795511910; x=1796116710;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TaIwWCMx9I6oV4SxjMTi3a+08EIvzGByLCSnN8rdvdA=;
        b=n6n6kHIVMe4e+5d5HBVN8WNwEli+nl2boqQSw5Zc+tBQRQDHmJx5wwDxF0zwHXqqOR
         Zfv9kjqJ0QXxwRRDBBAG/PjX1mQ+ezHUi+va6N6KKIk16BudJnSIk3TA98ZDciF2s+4s
         pMfv1YZwtWemjtFqnrlbfGCxJRRCm2pClBKJc9CFsUhS2hSyM0SkwMtKGHQs+HRR8tar
         DvKYSWohqjgmnwTVhmfS+e600aRoJ/Q41pQlvW5O1aqe7dFKrSI/GCM822qkb9Q4r6LD
         Fxa4j6y7Us5MZjd2rtDB5OeMb/dl4F4k52Tknb2t2yb3Xp+hoPGWVQhX7fxM5pnqrp9/
         33Jg==
X-Forwarded-Encrypted: i=1; AL+hErHSOvrj+DvuAwRPE3yfn/dkJS2R68ZqUrGcVdg62u0K5A15/cXzMx+2GEHvcquU51PJe6QWrVMk8267ZnY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+U9aJxNvOqDatq1cJfzBShu0aFva2HIFPZ9yEhV9sKYKaGluKZ
	W4JlB9btiuHJWaxJ4NuO1xuet5zR42hi3qiZZiruf04W8U75Z65Xgv8Id4KtsTtWisEKyC7Zcyo
	yphFe2cGOoNYmGibdN+X4Ol63y9NEQK39nTEos9PntEZxkCAWeAjQ105umxo=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1711:b0:573:8745:a98a with SMTP id
 5614622812f47-579789ced5amr11430888b6e.1.1795511910410; Tue, 24 Nov 2026
 01:18:30 -0800 (PST)
Date: Tue, 24 Nov 2026 01:18:30 -0800
In-Reply-To: <20261124091825.2275478-1-hanzhijian1991@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b055666.71deaa98.2984e6.0016.GAE@google.com>
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
