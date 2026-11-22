Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795369463;
	b=g2YE47APwvrkR4Qp5yQywR9G1D67vbp/I/u3f8Or7dW28K+wIzyv9xMZnTaFsmbfTGUy
	 yybYkH9qX2i2xSSfb/UIAfCUo1yPwk62Kpn7vdjgaAtAhtRuwcYDhvQKYmnBVVZJ1tO6V
	 wGj03CciYmgST5DyZ1Libq8RAnuSCFiJROIWvkIU5bHH0Yz66SvBdwVGYicWHvjeSgeqq
	 kJtywh7TxxDwbMd6/6OL1gHz6shVqs/R3lX80/76j8CNpIvTI0JWv16EsaScfZng6l1FJ
	 Uhd8FX1JwBdOU8DgjbL0fqsl/XOXgjxkuHc3jEFd8Ack9ZRgyoL5Ujp0RaUgxLwRFOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795369463;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=XDb7KfRP9TYLu9vE5S7fXj6v0XT0n+jmez9K+fH+2F0=;
	b=kEDWpoiGH9WQbuGoRDitxR0honxpmi/P5BVsf0kBp2w7nKmK/sYbfucKBK1mERMjXQmS
	 0u2RT7AGeRVEQXU+EKoiW3ilOQ5naO1xS1w/r8NVsdpIRU1RK9Ch4DZlOceFwZb1H9MMn
	 4lN4/TZ53Ui100w/mgQio/dOBm0/y4xZQGslwqQdNWXry1xsJ3e3mU9BZMo1JJtOtLaGQ
	 Ix5P3CMbfzV6JOl8Vn6qRwvB9MMsO5cP08EuVzIVJsQ7o8uDtW41f1ww2pvQvrmEUK5yx
	 ZhAI/kUpteMfS4uRGgVa1JY7fD+FJ+TXmIR6kkp11xufD/tD2+AUma1AinuoGF53JHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54296606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 17:44:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54296606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4cc89e86e9eso3253002b6e.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 09:44:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795369462; x=1795974262;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XDb7KfRP9TYLu9vE5S7fXj6v0XT0n+jmez9K+fH+2F0=;
        b=BPNyUpYp1Ixle4wuOQoGxKG2oAZ+ZfbeKaoPTnRgE2fnEzUG+d1iAvrrtfgU2RV36R
         pfRaZDSigZQ2ORVKsLVBe8/UcWWk2iAegD5yD0opib4VkI9ri+nvOMWMPvjglSPZMKnG
         Sbs/gMDjn0EXVZA2rqSK6sKsSgf35lKGjJ25vzd1BKPK/Qci8GIXxorfhZt3jeNdu72o
         3zhdmXAbEr/Ryaq1ZFS49yNNXVxdfbGxBdlCjFeHzgMbWCHUhdMIMQfIqaBi54wQPPUU
         p0BRpI/wn7vVtAoINSLzcFMa7+BrUeRD7B3qXUJ7aUG+3aCtZOgvOOkXv3wkAQ5KpaL0
         /lzg==
X-Forwarded-Encrypted: i=1; AL+hErEBZxYdqX0J3R4lp0N/vnqe6Tnhvalm3FbLZ0fSnZfKDCgLFufJaGdA0zgwqK6ArTMy1OWssgLWdaPQtEY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kCA7jnploZjNmfND3+xsHKzbBJxI9Nmqbu3cYJyaDiLTyyPyS
	3AWYSz92S8qgE1Ejx1TYwdWaf20oBivv7ZLZFHPxNMOAhb6bTfQnXf67zo7Jgt43dtxPsv3XJM4
	pQqJwmfu7IwEUpkbevfOwNaW0TInGbbv/fOKPuW9SJ2ZxBTiC8tuiQCv54hk=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c16a:b0:53f:4cb6:cda8 with SMTP id
 5614622812f47-57a0a20ac09mr10364102b6e.23.1795369462306; Sun, 22 Nov 2026
 09:44:22 -0800 (PST)
Date: Sun, 22 Nov 2026 09:44:22 -0800
In-Reply-To: <20261122174409.2818-1-arbabhaider649@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b0329f6.a481e175.27cf24.000f.GAE@google.com>
Subject: Re: [syzbot] divide error in alauda_transport
From: syzbot <syzbot+dc208a8cf8d37cf3e5ac@syzkaller.appspotmail.com>
To: arbabhaider649@gmail.com
Cc: arbabhaider649@gmail.com, syzkaller-bugs@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> #syz test

Patch testing via #syz test is temporarily disabled.
See https://github.com/google/syzkaller/issues/8122 for details.

>
> diff --git a/drivers/usb/storage/alauda.c b/drivers/usb/storage/alauda.c
> index 5e7f99ba8..5493f25a7 100644
> --- a/drivers/usb/storage/alauda.c
> +++ b/drivers/usb/storage/alauda.c
> @@ -96,6 +96,8 @@ struct alauda_media_info {
>  
>  	u16 **lba_to_pba;		/* logical to physical block map */
>  	u16 **pba_to_lba;		/* physical to logical block map */
> +
> +	bool media_initialized;
>  };
>  
>  struct alauda_info {
> @@ -105,8 +107,6 @@ struct alauda_info {
>  	unsigned char sense_key;
>  	unsigned long sense_asc;	/* additional sense code */
>  	unsigned long sense_ascq;	/* additional sense code qualifier */
> -
> -	bool media_initialized;
>  };
>  
>  #define short_pack(lsb,msb) ( ((u16)(lsb)) | ( ((u16)(msb))<<8 ) )
> @@ -471,6 +471,7 @@ static int alauda_check_media(struct us_data *us)
>  		|| ((status[1] & 0x01) == 0)) {
>  		usb_stor_dbg(us, "No media, or door open\n");
>  		alauda_free_maps(&MEDIA_INFO(us));
> +		MEDIA_INFO(us).media_initialized = false;
>  		info->sense_key = 0x02;
>  		info->sense_asc = 0x3A;
>  		info->sense_ascq = 0x00;
> @@ -478,12 +479,13 @@ static int alauda_check_media(struct us_data *us)
>  	}
>  
>  	/* Check for media change */
> -	if (status[0] & 0x08 || !info->media_initialized) {
> +	if (status[0] & 0x08 || !MEDIA_INFO(us).media_initialized) {
>  		usb_stor_dbg(us, "Media change detected\n");
>  		alauda_free_maps(&MEDIA_INFO(us));
> +		MEDIA_INFO(us).media_initialized = false;
>  		rc = alauda_init_media(us);
>  		if (rc == USB_STOR_TRANSPORT_GOOD)
> -			info->media_initialized = true;
> +			MEDIA_INFO(us).media_initialized = true;
>  		info->sense_key = UNIT_ATTENTION;
>  		info->sense_asc = 0x28;
>  		info->sense_ascq = 0x00;
