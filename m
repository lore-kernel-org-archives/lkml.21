Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795420542;
	b=T/PTwkaMAaB5kKlsSPbAEP0i0GjCOaDaC6dgBIAKxdwnHaVzEg6rrMF04qLj87XAZj9u
	 w6YnClrDnYv0i4IzMCqh6r+hDZJQFJZwVrnZHITP3tVyHnX9uZhgZAegjEoLs69ZoTo99
	 AH+Yv0R9wXd0S+gOw9Yd/DuFxdY+/iZZRXhBJscdts/YtLhi8nqfl8sqf40QQ8zS5dPA9
	 7QSWfalVJeWEVBwL/TAp+jDZO7SJio0iJ4i1MOoQrzKX601Vdc8gH0y+gJrVbcNFR3u6z
	 wd/CyFBqW5ub/1ZX4xo++TMfNEa+cG+YdOTbfbeUAfqIY/EirTCproSapNFiX8k/K0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795420542;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=g1OJLAd7B+ngwjUpS8FrwuA0SCFmBnAon/YjAp5e5cs=;
	b=WqY8EBzhrTpQ0M/0/Dc0FA31GMiZg7Ea5gO4g+IWPE0iKXgH9msdXevpE4aYQYJJ9hVu
	 GaTuZYBsaMcbAkAxgVrOOohmJg3s3nQm9WyDo1e8OGWjgQwTjwkc5zFXGybXvaFV812K7
	 LKxMg4SITa4swpqoN1JfLKuDxXeS7McIhh3O/vJ71JzM557XbzWzZqQapd0AsO1pRyXH3
	 OhNZBeSI5pEAlQBuTWezEUKAek55B1bIzRi36tcA1nVA+ovLL0U8sAyijUsunHPDrVN8R
	 YkCGA5Pa6qkbF7S8LKLnVXw+5qaAzkTSuOkBIUdxOw3mg4gOPrZC44Q4Y5JFFg8y8sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038F0606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:55:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 038F0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4ea2c058e67so3293852b6e.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 23:55:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795420541; x=1796025341;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=g1OJLAd7B+ngwjUpS8FrwuA0SCFmBnAon/YjAp5e5cs=;
        b=mBokYRNNDxaBkYISBr1hz33K+te6Y9+jNqhAsK8wOdvZQy2ut85acQuP4kg/rF+giU
         TVN486JUy3ue3DUmPS4X0H0fNILtvg98AClsNV54pC9lHiu7a+Zijh7trxjRqBmCVnCb
         VIjhkObY4Wq8o2EyxTgqzQ5eojc9E2jDXhdotuVTblcBOfKWZNjp4rLkGPwfKh37zspM
         1Mwl4jR8AIf0VkBJFRCiI2a+v2xrBWSUhLda6UDRhdU6JAef24ULZsD1rg0jwWh7Ml1Q
         Ct7b9Qf6G/iP5PbTxBpAhSt39pch/GJiVEKxFp1Ezac3ddlmT9EFvfnOpGQxmXogl8/G
         D1QA==
X-Forwarded-Encrypted: i=1; AL+hErEP1HhRGxqPMTunkFMr2GKg1LXsDJn/4AEvuyCTzLKhIhhJ+SdcokUSo1OX4M38Et5W22ArU4vUUNYRQ+Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z++sWg3/Xiw7jUIYaoXOXcCLgLiubrL1VbGFiKFy2Qf1152PUvS
	fj7lYLVrdFdf9IoNqR3kecAfWvEWVXFJWshocJOQRWLYXz/mZNBPyujdg7x+me+l8jEWCFXziFc
	yvW3+9r08zF06LKJfPlbOILVs1/wJ0u4LbNfnk4R/7Ddn/2EgAWx+dHmINpQ=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:5147:b0:539:ad19:d0af with SMTP id
 5614622812f47-57a09c11044mr11176189b6e.11.1795420541066; Sun, 22 Nov 2026
 23:55:41 -0800 (PST)
Date: Sun, 22 Nov 2026 23:55:41 -0800
In-Reply-To: <14e3c0f8a63e4e094a8f3d1a5d145eab@dev.tdt.de>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b03f17d.44b41460.34b83f.0027.GAE@google.com>
Subject: Re: [syzbot] [x25?] inconsistent lock state in x25_kill_by_neigh (2)
From: syzbot <syzbot+300375dfd44665f063a6@syzkaller.appspotmail.com>
To: ms@dev.tdt.de
Cc: ms@dev.tdt.de, syzkaller-bugs@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git 

Patch testing via #syz test is temporarily disabled.
See https://github.com/google/syzkaller/issues/8122 for details.

> main
