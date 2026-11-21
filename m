Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795294502;
	b=njVh7HmYsAoYgGS+PCzzRr+W/w/wxA137GDO/c276d5kVd86bR2z2DADuIdAKTS1E6az
	 JtsfgrB55Q3M/ItQ4JbhGE+HqjygDQS5i4TK3spd9mARF3WEWOZSoPYPhuD5fyNrvFaXj
	 jNd0XhkS5MIEiqrD/lxvPuUKt8Ckrn0QeXIg9FtX4d4fUudQfqjyu4KSn9RG+MTbZpxWe
	 kQyJPKLbTpUYWu8Dl1erUKTzCVJW6iJ1uQMvaqrQHXD9yIotq6kwU53i+gY3FDyTwKiXU
	 3MPHCH5Ep0/fI+EErmpqwEhyXTWpibFZrHYgIRkmYdtdHKoFgXMGLcvX+LgpgciTVPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795294502;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=KsAe0DhYdt/3g87gB1LeApXPRoWIhM10pQ46a9pN3C4=;
	b=ORoGZKdN7J5L6aMoSs1BpIAOjpXPM2+24UkZK/irbrzcKebhh7IXl5dCQbxFY1HQoZpD
	 KVjN8RnK4N+LktgnmwJqemPSa7EawWT7gd9P9TBLPgroptphwPEsJ5C6N+UAqKXQHPVls
	 fN6mf339An5MsTbJq88gJFNXY2nZ2hCiNGf4/iE1GlVePMAWwv4VGKSEr1Oubs0/5w1Yr
	 L9dBPOuOOJjS81Ng6sHdeVF+gJE9S9NbjAWcDavBW9Kth4lIwuduO7sDGLRFAJmz1ApWL
	 99u/3tXjAtu2npkFW+FJ4zzlpBwK6/OAjzAUNc+3CQ2JAN/ctkQhdMimzrtaY4heJpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=XshW6s1k;
	arc=none smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55944606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 20:55:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55944606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=XshW6s1k
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-9213f004a14so20511376d6.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 12:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1795294500; x=1795899300; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KsAe0DhYdt/3g87gB1LeApXPRoWIhM10pQ46a9pN3C4=;
        b=XshW6s1k7WQmR+2O2DWZ4GneGxkUS/SJGW0cSDG3Q4YBBbLNsjXA757q/8fabmUPpi
         nqQJd4MuMDODQrW65W/CqW0K3c/tyhZybm5R0QhPdCYll3lXGhMrmFwLqWOvgoE9Ssx/
         oERjx9P24ajqlRpwagkS21qqjRVFUD+jMPLHXaxxGi+s2oCEhjPbv1emGdzUKM3HovV6
         i86/SjI3vTAH8YvB+PH4Qs7VwnxIsP97xogmec5nk91r9ljnstyYsIZy4EyMz+gjBbLn
         2tJkpD6xNjxor97q+4e5hI3uaZAjaVndHg6nfOm7lZs7GO5q+PsYxY9vRfaeEpK50eNf
         xiuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795294500; x=1795899300;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KsAe0DhYdt/3g87gB1LeApXPRoWIhM10pQ46a9pN3C4=;
        b=hv7Wmntb7cJw3B3ZOb/L4wrO3whwPku4PD5EGD4iGwiU/IDp17xx09CnLxokpXnRfu
         Goo0akTzx9lphM2wAfp5P6bt96zPj2+ynP4e08lBNUM2KNBuZTTwL+xjuUgfBJHn2gxI
         8oUz43DTzO4Qr2MMpLJmTXRdfrBI5InW+zy2Rxs6V3/IhLPZZGGAcQ04jRrRJyp8/QQA
         lV4TpQYtiUpxJ9HD3sd2Es6khbdk+Fdcwj6TJWHqFcU/ru5IR7CBc7eigNGGCGADFtPs
         D95FqUgk3UL3ooIXIV2g8Il1HcEjGZb3m3m1TEjet3ACtYC82r8DGC1mZJ/4uvtBKcxs
         8utQ==
X-Forwarded-Encrypted: i=1; AL+hErHsM14bsl82ZE0IH8+qBK7S9vvfpAeEI0iBsG6bCVi4dB1LoTtl5JPWv5OV0WWgl9aodQsaEYKxme42V2g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yVAlVbhx6Vxp2a2vcH5CEbAmRvh/Ifj4sOmsNmJyD/M+U+3gK
	NqeUq2FQbxGAdlqPrQeK90fFg+bJ09CpXz9I02toYNHwOH6tMlXX66ht18qy16XsXg==
X-Gm-Gg: AZFdTZcaxj46gU5u+gOneWYsdOhSNzOXXXDz5qhmIADompFdEuRYCy+i1DfDE40Fk2V
	3E52YI+7hdgy/FREbudbowJ+scEG4qeX5r7t53zFD2EbhTYtBCZpyIBIF16PxSW65zfTtSzJi82
	1OgFdaqr+QyPy5woirHbS2BS0SbHDMk2vEX09swEY9+VXHYn+y/ztkpzJCawfnCeyDRIznR6M9k
	cNeA5kIL/EKXzHyM3O+btvvRyefs6s63tOqc7pIhyMfe7EqcjK+ueIBY/Gs31DE7cCj42Ej4Cz2
	EqJW2w4zqUxonBlyrxywgcnJjYUYZsharT8dcwPlSm9EFtAvcJ5KZtRR0oz5Yxk/UWUEmxGNWvw
	BbH7wpZyEa6vgcD1db4dqzSHOrrKUExNmXdIo1IHu8QqXUj4Qk744kfbIP15PB7tqqBlUx7/htn
	J8hCvdZUSQ9/ieES7V28IAom3gMH5IzGSWK2GKmOCDRGY9uKFCV3g4Y4pdG7ahgoMWxWl41qrZD
	1gTWhAsSAd8CRQniwoTG0Tuo6lPBcd7d4D6z/os97aeImj6cZJKHVlEvPJyY5omuBaxN5KyqKgw
	ZDFsheONTQlWJGmbsiyBu/a9syJlyw==
X-Received: by 2002:a05:6214:4018:b0:921:3369:a766 with SMTP id 6a1803df08f44-92134a90270mr122441186d6.37.1795294500229;
        Sat, 21 Nov 2026 12:55:00 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d00:161a::d398])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921347a0b6bsm60909116d6.1.2026.11.21.12.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 12:54:59 -0800 (PST)
Date: Sat, 21 Nov 2026 15:54:57 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Arbab Haider <arbabhaider649@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shichao Lai <shichaorai@gmail.com>, linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org,
	syzbot+dc208a8cf8d37cf3e5ac@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] usb-storage: alauda: track media_initialized per port
Message-ID: <5d2e1310-88db-427e-ace0-c2a0590560b1@rowland.harvard.edu>
References: <20261121171956.1455-1-arbabhaider649@gmail.com>
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
In-Reply-To: <20261121171956.1455-1-arbabhaider649@gmail.com>

On Sat, Nov 21, 2026 at 10:19:56PM +0500, Arbab Haider wrote:
> Commit 16637fea001a ("usb-storage: alauda: Check whether the media is
> initialized") added a media_initialized flag to struct alauda_info to
> prevent divide-by-zero errors when alauda_init_media() has not succeeded.
> 
> However, Alauda devices expose two LUNs (us->max_lun = 1) backed by
> info->port[0] (xD) and info->port[1] (SmartMedia). Storing
> media_initialized in struct alauda_info shares it across both ports: once
> port 0 initializes, media_initialized becomes true, allowing port 1 to
> skip alauda_init_media() when its media-change bit is clear and divide by
> port[1].uzonesize == 0 in alauda_read_data() or alauda_write_lba():
> 
>   Oops: divide error: 0000 [#1] SMP KASAN NOPTI
>   RIP: 0010:alauda_read_data drivers/usb/storage/alauda.c:953 [inline]
>   RIP: 0010:alauda_transport+0xe5a/0x35c0 drivers/usb/storage/alauda.c:1187
> 
> Additionally, alauda_check_media() never cleared media_initialized when
> media was removed or before re-initializing on media change, leaving it
> true if a subsequent re-initialization failed.
> 
> Move media_initialized into struct alauda_media_info so each port tracks
> its own initialization state, and clear it when media is absent or before
> re-initializing on media change.
> 
> Reported-by: syzbot+dc208a8cf8d37cf3e5ac@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=dc208a8cf8d37cf3e5ac
> Fixes: 16637fea001a ("usb-storage: alauda: Check whether the media is initialized")
> Cc: stable@vger.kernel.org
> Signed-off-by: Arbab Haider <arbabhaider649@gmail.com>
> ---

Has this patch been tested?

Alan Stern
