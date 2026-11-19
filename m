Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795066518;
	b=RiJUcW5gBdSucoOTmSMAd2lccSQbfqmHecloHshHp0jaW9m0dV3dBl4eSgguuW3lW6kd
	 5YsCyPfpzYCEEwD1fx2n+tsW72aGBSIYpV8ylvPqhkhu2gXTitM3u7CT+83VY6MRzjk3t
	 18534CRop9Bfup4T6kgJ9iuTD6tj5TirBXSOK/d0d44n8o4eppeZxa1BzUJQ2r7UZPzPI
	 f0IpXPmDBhmJxRG3OtQcGlFFblYIEE4gZ/Oduuf1ZVlWZTXPYm5XPYgYw17YTYtiOVYk+
	 Y4RT6XS/Iz4dSwqAPSa9fhSAGSgDYJL6IqCVJWQVlOGG1ssHb8G1KqqXY/EGIygtbYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795066518;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=oSA9twBPbKzxpC9yFC1nd7ceP7zJ811GD8sMG8gtFe8=;
	b=vDNRpchotEDeylQgjOmTzF2+Iek8d3hKaAi+greS/4sHgsu1u1gNkaT6inZYMz/lWyPf
	 jNLPoloMxZ0OB1/CCr+PKjqyo3q0pIIq6GD0fBaWXPqWVyZGgllHLNXNn3kHPtfuSOtms
	 rUnsJ767mURwVjqXui1cd4xKTXc+Q460Vsk76wy7s9jktqrMfl1cRW8XlExbEtAZ5dIfa
	 SgSh98hlNY0EeSi8NKSHPMJpt4KxFBteGghZWwsgQXAFBftyTvMUa+mCg0+l5tlv/XsGs
	 LgQMICOwAGthDqK7f9e6lafB2abbTeTWUsnloHwvNgthpwjzNHtJWYRaazAZmdHYALg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=n3B7X119;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD35606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:35:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBD35606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=n3B7X119
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso463076a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795066517; x=1795671317; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oSA9twBPbKzxpC9yFC1nd7ceP7zJ811GD8sMG8gtFe8=;
        b=n3B7X119304Lmb0WoiA2oXzi52VRjMnHw5oLi783dUdR6HUHkItCRlEojD6g6tFx3w
         V+7pZM4vSiozIzrCJJOGfLxjt/xDHpCF7Skow7YYZhmBQfqyuL8JwWajlnMSOXdmkPbP
         mjylZutqwCkNp9xAtBFFHg96pRSGmSNRBAhgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795066517; x=1795671317;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oSA9twBPbKzxpC9yFC1nd7ceP7zJ811GD8sMG8gtFe8=;
        b=bHHHV6BGpmPh3huvRCNsQqNV5j8CW1gHx+mojpnOIggtKPC1Zr5QOvTuiT9yEby9Hl
         OqiqRduKZm/tKBZamx5mHncSy12TWg3irqF1ANwG4Q0b4Xb9yu2NFvtu36rVj3tnWWtN
         bn/v1R7Gv2mgEAngzj3DVF+nBQPwJPw/+9RydFoF9bRZ0+dOFxtz8yJGMouMxfH5Dy+a
         39X76DHL4rhc4uOw2EWeFzlCUycBX1an4Ct/olkmdcHx1GfMf24SBh4e1INjiHaUtNzA
         0iJm5bd78++JSl7o4820zkzwNNm+ikDAv/qz9zqldC/4Jmwi5wbN79jq2yIGp+GH0nr9
         zuCw==
X-Forwarded-Encrypted: i=1; AL+hErGHK7eh33LxS+p9kxax5GWuZ4QBTbSZ5h12nOBiV1sitZNbJ1slsoGkb4qI7k9mOYYwSEwiAtakp1AV30Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aNigkJPtQJuzaUKGLzI3Pg4bWYzkkh5rqXquAwQq+1jv13Pux
	nrLfKJ2Dhf75fVtW+ed/deMTSYSTuZWYU1TjmstQkksE/SeNXG1f5EKdYsmqGQgY7A==
X-Gm-Gg: AZFdTZfPzgHI8ADA88VuzmTUDWJAFxXKP8Ib/rwvWUoDQ7G5Ve33PzEX338GbSvkEuK
	R1OvACz7CNsJcuGvbD25dkriLoLqmLNhKzSjrKU6GnpT/eQfVzwkCaMBnVi76hROvCXxmUhSMwf
	Z+AEpvg/C2fm505SyK37n4sW5UlSFZv84QbA+3SnV6YyMmpCHXt25CVXLm21tmCByyp7SvVSrEx
	1aW9MUQeawwN2dyZqkM47vnoUq7y9xPz4Wl6RxDZKbvMXKSkMJA+oRxJgtmZhJlOAQRFgbwB5uz
	8QZjNvDeYtcAR8stXn6SQ9fW2/HdUNcvCp8gQmNDPyXoDqZtvFCS5sfIzKpULiBpuhIrHVk8QUx
	PO3Qb8OvExPofQo73p31bWgdkqaHA1lKAM3beT06U+H3Z+6IKeL2maOu6/hBCAB4xpw5ZEVpmEs
	xfa0yVkaklKkl3YT/dvFvRKXVZKUOjANa5EcWkiF60Mf/uqpekAaEIO0+Uv6ZmmR5AP7MrOsSQa
	IxGOyAqJxCuy/6nmKyjRHExgvnC4gYzdki+XwJbR4szXO14C9OPW8ZKnSyYDvqhjokvkIO1OMJ3
	Xi1G9l6T4Yx7YIqCfjrSvoB5MrWtH4b0GoYxTL5nKXueszFzy2d0/8j7XJ17A3pMNQBOnA==
X-Received: by 2002:a17:90b:4f4a:b0:3ac:84b8:c0d0 with SMTP id 98e67ed59e1d1-3b40a62dc20mr36559a91.47.1795066517234;
        Wed, 18 Nov 2026 21:35:17 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:9297:4989:4c44:dad6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde534aec9bsm1050833a12.22.2026.11.18.21.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 21:35:16 -0800 (PST)
Date: Thu, 19 Nov 2026 14:35:11 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Hongfeng Chen <chenhongfeng0212@gmail.com>
Cc: Nhat Pham <nphamcs@gmail.com>, 
	Hongfeng Chen <chenhongfeng0212@163.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Barry Song <baohua@kernel.org>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Jens Axboe <axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>, 
	Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Yosry Ahmed <yosry@kernel.org>, 
	Wenchao Hao <haowenchao@xiaomi.com>, Wenchao Hao <haowenchao22@gmail.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	Hongfeng Chen <hongfengchen@xiaomi.com>
Subject: Re: [RFC PATCH v4 0/2] mm/zsmalloc: defer object free to per-cpu
 batches
Message-ID: <av6JvaCh358eSMCw@google.com>
References: <20261016120927.3191690-1-hongfengchen@xiaomi.com>
 <20261023123736.1542117-1-chenhongfeng0212@163.com>
 <CAKEwX=M4jTnxmq6cj115Gw4u5jdY7Ex65jPtVTEopW70jGzfuQ@mail.gmail.com>
 <20261109105957.2577351-1-chenhongfeng0212@gmail.com>
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
In-Reply-To: <20261109105957.2577351-1-chenhongfeng0212@gmail.com>

Somehow your emails landed in the SPAM folder.

On (26/11/09 18:59), Hongfeng Chen wrote:
> On Fri, Oct 23, 2026 at 11:19 AM Nhat Pham <nphamcs@gmail.com> wrote:
> > Is there any more juice we can squeeze from zsmalloc in that case?
> >
> > It would be nice if you can perf zsmalloc freeing. And yeah, maybe we
> > can't optimize any further, but let's eliminate that first before we
> > rely on offloading.
> 
> Here is the perf breakdown of the free path:
> 
> zram:
> 
>   __swap_cluster_free_entries        90.28%
>     zram_slot_free_notify            86.01%
>       slot_free                      74.15%
>         zs_free                      56.01%
>           __free_frozen_pages        19.85%
>           kmem_cache_free            10.15%
>           _raw_spin_lock              5.53%
>           fix_fullness_group          3.31%
>           dec_zone_page_state         2.43%
>           obj_free                    2.17%
>           trylock_zspage              2.12%

We removed one of kmem_cache_free() from zs_free() [1].

[1] https://lore.kernel.org/linux-kernel/20261110054836.1515030-1-senozhatsky@chromium.org
