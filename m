Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795396694;
	b=gFy7jL0MD9OaDcFZYhORZmsCvyBWuTFFJ/NBjR6Fy/rEAVjsD5q678plHfiZAu7mc5Fk
	 HywNccHhD3SURl55zf7J7cjLw2u7i+016bwk09u6mjvXMB4mL0R7856lt3eTruRO8sb7K
	 1LUGj6+sr3YD/h+QPJhdLylfGin1y0KVJf9esM7CJN3bJZnxjMBXINeu8vRzlGx4H4Z4j
	 ZlhcRvwpPeqymUkczo3rfibLVl/NEEOTb1dB0UUnqOyfgg/rSahx1IKHDWjnA45ZEkaUh
	 UEBJ0yboUcBNaqCmA7vzsP9jdg6E3S0XKDN38zlEVuXycbLJS08Zkk7+bJ5nqsYL5gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795396694;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xtW2k1ILTZk6SZgInS9ZTOwHcWM7IUrJ3JhIcEADImc=;
	b=O0MaDhMk99PAr5VmJkNaR/lw3EwDsCY/lZ3mn7TOc1MtOgvsMG9CM402Ng/iMlf6OZz9
	 QdB8Hbc3KZRAR+pf5I14v4YggMopYrIyqngTbPdTI2EoY+T+ceFpI/g65TcS/RG24B+0H
	 an8sdi4cmWm/Df62h6359LoHQDWEaL5MUPUdKC4SFg//Ghe8ITf1skWH4l3WZnvjrpKLh
	 DdRI07+EZetoGB2IZW7uoQ2l7UmXw6htr9mxoF2bcJMYjMbhC4iHACcZ8lDfcjXZhCKA2
	 zsjuID9+G/Vy19FtygAVa6oO4N2GFIptkb3i3p0xsX6wXOlxoRWbXMu8Rl7haMufcGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mFuLSLXt;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A81A606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:18:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A81A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mFuLSLXt
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b49a6e8212so179140a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 17:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795396694; x=1796001494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xtW2k1ILTZk6SZgInS9ZTOwHcWM7IUrJ3JhIcEADImc=;
        b=mFuLSLXtsbG1j5GBjZAp2dz00pCISwAyPBLpBJZxuDDCE+673i7dcVkcarADldh5q0
         r6juszeA7rUoVaRPm88wToW9tXkRk8vyMM00ZQTO3t8z7KT/R12IZ0rMxOH4DXcE1RR8
         AgQ00DY6J3+VecuyeQ5TNBVJJZhuqib7k1zjK+MrI6KxyNdUTLgYTy9S4F48ds6H/wds
         c6NRzAhKmuN1fLXIvgUuYV2Dm3u/xz9JPfYloc/y8BuCSzTrAbPZEW57Ajaml1rK8T9/
         qB70xVK1krW1l3+paiT+pgZ7UO6czZc6XFSaNlNMAW5fIwLG8mR9f/+anMsS+ShhPFJZ
         DjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795396694; x=1796001494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xtW2k1ILTZk6SZgInS9ZTOwHcWM7IUrJ3JhIcEADImc=;
        b=n/BzLscnX6QFCMCa/2m69EgXSCCiRBELIAvsM/rPtooAo+ADIzprvR6UdXoOGfa2IC
         uPjVJ7M3cx85zHDtyb3IPFiy5pGqTV+xeDFx4Dd1itcU3YIqo23t4qcwnGZaScJm6RgK
         Ib6GZaUrhjRWOQwUmGBafoHScMBW+PGGOwlIo2ibfdWly/tXQ5gM6dsHqcka7Vvcz0/a
         YR0UtVPb+mfi35jVDiRcUXciBUzrHpK7N+BkNkutKU9eTrwNCJLRGpC9PNgRQ5tkeZ0b
         H1+G+rVW+g9KR5BqR9aivJ9qCEJ/0q/pGqvcry3hsh3eXwl+4wBTeISdK3BsD27xYv7N
         W98g==
X-Forwarded-Encrypted: i=1; AL+hErEJnkYMKe2NHgBrD7y7qtKjjddmDUY19ul+FSxJybjqe6rSJsILKCIBa3a3+JeEW/Rsnu3Ffnolca8ya6U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YNt8TYhZvSfzhlb+KnpHWzAV8Uy0y/bGUNwUxhMPSv2/ymFyK
	1RbiT2OjyEwlXIQHTUKZnkI/BTMpKwVDL2GWD9J/agdFuUqKmk0EgjV1
X-Gm-Gg: AZFdTZdFCPOYu6tLuPlhZSOo47b7Uy4nYKrkOigYxt6UFRVJ2a2HsEDvvmVfgTIoP2f
	565AVWCodWjOXEtsZuTaORUJMGgXi7kHvNZCL+Ub1t2GPWgPIWakUSPlnuvJlLCFXQh39o5/HgL
	GfRw4q6iJftRjcuqOpV18d7vbG2omuXt0Q+pgVbXrSrZLqou7QDqFFX1rPfePHQ1oSloU3wEc3a
	SIQb4jVCsTuSmcOkRGcKEr+2XFqTbWwFtk1GtW9SWJf0LnQU7dkH/uISiVft/8hwTSCAoX9eOuo
	k5kPoAmwElPUxzzS00bhQvyQ4xW7x2oG2UNZBQCIJcCDca6cmGrJGemVLjigGIZN5frOz1zcGvp
	A+LZbnU0gOu8Uj0dcgouuQNVmKFqDmxk6MEcnZ8WNhSPcgRG5o2EEETbcYuFOz7Q2zpsSCaGqer
	/Z/nbWIesWmSJC1NSkOSpT6udZOzQvUTGpxBnJauR75c+wIE0+7EePJzGt3caqknJQelqQ9IUVd
	tRSwu5c35POnD/itBWVpgdGACcXs/c3vQNtS/k03Oy785tTFPuD3x8EnZca/HijrTB5ZZswfq94
	fCazuKqUkUZBnaEQf+qk3RYumJ7kgoBappbo
X-Received: by 2002:a17:90a:e7d0:b0:3ac:b2e6:317d with SMTP id 98e67ed59e1d1-3b41c9e52f6mr9596827a91.35.1795396693715;
        Sun, 22 Nov 2026 17:18:13 -0800 (PST)
Received: from hanzj-mi.. ([157.185.136.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41abb1b66sm15587206a91.1.2026.11.22.17.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 17:18:13 -0800 (PST)
From: Zhijian Han <hanzhijian1991@gmail.com>
To: gregkh@linuxfoundation.org
Cc: andreyknvl@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+d83b3c49738aea97c0e5@syzkaller.appspotmail.com,
	Zhijian Han <hanzhijian1991@gmail.com>
Subject: Re: [PATCH 2/2] usb: gadget: raw_gadget: fix memory leak on connect event failure
Date: Mon, 23 Nov 2026 09:18:09 +0800
Message-ID: <20261123011809.1033045-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026112020-sesame-uncut-fc8b@gregkh>
References: <2026112020-sesame-uncut-fc8b@gregkh>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Nov 20, 2026 at 09:17:32PM +0800, Greg Kroah-Hartman wrote:
> On Sat, Aug 22, 2026 at 10:48:50AM +0800, hanzhijian wrote:
> > gadget_bind() allocates an ep0 request and stores it in dev->req. If
> > raw_queue_event() fails to queue the connect event, the function
> > returns without releasing the request, leaking it.
> >
> > Release the request before returning in that case.
> >
> > Reported-by: syzbot+d83b3c49738aea97c0e5@syzkaller.appspotmail.com
> > Link: https://syzkaller.appspot.com/bug?extid=d83b3c49738aea97c0e5
> > Signed-off-by: hanzhijian <hanzhijian1991@gmail.com>
>
> Full name please.

Apologies. Please use:

Signed-off-by: Zhijian Han <hanzhijian1991@gmail.com>

Best regards,
Zhijian Han
