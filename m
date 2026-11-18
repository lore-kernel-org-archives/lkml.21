Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795041956;
	b=1lWEv/4i87Pmxmu2CBDqQn00+4ZLIe+rgaexheGmnqU76BScnSbKRBvKKkBEUSkWDao/
	 iXucUxgFICx7CvQg0Q+La8/lK5gzlKkvF71CS0Vw40R77rpHLmBEslIiWt64kuSuSaP4o
	 rPc9cvWq9NlTMx5E7kkJ3KUWcMeEUI+Ly7H7OOYht0KZYEfUwU4I/Na0KKu2JTc2Hihmd
	 D/q4UXQa0wsYQ1kAREeRzCgXkBsUiFheUsul3OvO2HyC22ygH7ckBvUMoSwlaHMw9PxFS
	 UeXUAfhdm1GQZng6qWVJv1cRl1jMGTi1X7j+UPv0zZnVD+kfBEwfxTmQaHbQnrWxTjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795041956;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=nlxflGN2P4bdLJLhBshlbVu7vfLlT4P5XJep01GeEKU=;
	b=wbo4BV9HiHSq6h5YZnUlOsRcsnnMl0IE96l3MDGw2mO9BAMrp1mTQoka0kKdpARDR3Cm
	 wDm6bFWDwGGc65tVtsqnzsBrvFB1Z0ktGuhDFNbIMuG7FXzBKL2SHx1vNYELDeJwSBYIi
	 /M1pJ8JZXjK8tB9aZO5a4nUfaEsNkOhnDm8n5s220hnI34abjvFYr7Lwpn0BmFoH2de5w
	 2IfCp7Z9K7OVV73i8aJU7GKBNLDUTU6honeyRJ/dN8PL782McPfQqecR72Ozv1YyYmI3M
	 GnEW2i3Csfkr5uoOtJTYTPSCPb+Xsof933XhEMAwgvUNcgJwUa/hj6h0NH4iYj4JDkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nLrH8uEk;
	arc=none smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6486606A33B
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 22:45:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6486606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nLrH8uEk
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-55d03bfd477so16334431cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795041954; x=1795646754; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nlxflGN2P4bdLJLhBshlbVu7vfLlT4P5XJep01GeEKU=;
        b=nLrH8uEkm+gHs351X2lhHHDZV8l//way/DxHSO9CK8eQ446ifZ7wOy3mUG7gcdFyNL
         8ZXMzeSwhyj2Ok7A0Hfh0ljx6owI5NLTR8hDo2UD0QVKbGZYdinUS0p1ysPwr/2U/+to
         8JQ16WjPfe4uDOR1+2e+dNrrsGa55auzWdZYlwnC14WQEMp+Jbes5u6TUDWBZ7JDQYZ4
         C5py3OJ9zhyaiWQrwJLFGbSkWXVZCovtG3V4RQ9KA/39ARFFh80i9wFenzne5mh4OdZS
         9bBhg3+zECx5PZTNdPJLz0g04inxC7/58TaWhMzCIm2rD+JDRFjUII0L4QybM8Ifn5R0
         GYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795041954; x=1795646754;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nlxflGN2P4bdLJLhBshlbVu7vfLlT4P5XJep01GeEKU=;
        b=nvvU2dGsDhqvqwBfKvWJflY9YFVGVQimA6TxtUYKttxbwROIG7YqYKTL2FeypWBkoL
         9wupcw1WrZZKvP6BNR5QgmiMcNi5GYrrDuSxyqHZkXsHr8jjhR2RRJncg4lB9zBEsjUP
         rW5BJKWMJCFpVKqTeu3r1M0/MtMka6EjpLhelpMBCXSafKZYVOl48wU301SPDiM52hwP
         RcGDzI9ZbLwewXslJr6h19a1gnfMYA2kAEwnaWBIURMrnAU/bem/oI8Wjdx+aqDJ/HUY
         JS7LLQhi+7se5AAy02UIcPj7yZBfJxQilnQdFlpprMt4Hj1EFt30BdNtbBP14q+KR4IY
         fBEg==
X-Forwarded-Encrypted: i=1; AL+hErF3eLoDs/x3YDJSbsPNoG6PoVcgzqst1R8VOxXI2HhxuhtXMu2RG8fU0toRHAUjVut1dwUFphjFDUR4v7E=@vger.kernel.org
X-Gm-Message-State: APuU4Z83ZU1DaxG3221e3HEa0OFHbvu0csJ312FMXz4e3PpK5WZA2Pr3
	Q5hYFE4B+5+p64cbX9iLB1pFJ0V6+wPiYjpHkJVk9oz1jkBDZIfSVLO3
X-Gm-Gg: AYBFou2n96eKMa6R8WCvoRPrED8rVW+XPSClSE0v3YQk4IQJcalmn2c65bwrhNHDvZX
	DOfSTWgWYy1aMLsJUcJaRqVpQOQwf1uaPlEi+xgwQKotqC0rzHZZkQJOpwu9O+scPPpEGyVvIbD
	puZ+bSYlIWqyA036HFJ49L+q58ldI7RdWd58ll2Kgagz5iQaKczQw1ulY6smraGLyLUaAut5Ox3
	j7KB9lffwBUw2JQhHy1hIL883oBP7fRegh7qzIOZZtAEwhRayCMSPFJdnGNZjZDco3XjaGanz87
	62kU5vWkHgx/PROH5YfVH6V8ecr9WNa2I3gZp+iqf5qvQ2dKkOSvBKmD12D0Yhyn4c/L8Vq/1Qe
	AwyVTigJD5nCLoNlr1UVqRx+f09egy87TBARPykZa2TsB+QRAAjiYBNiWwawkTP2Gv/zZcsgcBC
	lcoFY+SeQDjnbJxE323/vEVJN3JOXU11bu/dd+pa0X9lruplUJ+mTA+V82+pt7qchKHc853s45I
	cSfbdeWpZ+gG1eKaTUAm4aRilf7K9IvHAcFns42DCi+/JDm9cbT7bqSP0rM/6GInMBqXxgl6i4y
	ZKnipBJ8YN2U1c4LF4egZH13ZTiNM8+DrNL+QIuN4x1t9wnUcjZ5yZhdk2MexosXh906I11goqf
	cBFetSfdEpwCgk9kbB8hlURClNF3zagWCQvZi9wkDA3vSyA5hh21xhs11NkbV+GU2Ebklpud4+P
	vBtpxtq+Qn
X-Received: by 2002:a05:622a:2589:b0:55d:3540:5da1 with SMTP id d75a77b69052e-55d5a543552mr62410941cf.19.1795041954499;
        Wed, 18 Nov 2026 14:45:54 -0800 (PST)
Received: from gmail.com (15.60.86.34.bc.googleusercontent.com. [34.86.60.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66c52318sm10266441cf.29.2026.11.18.14.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 14:45:53 -0800 (PST)
Date: Wed, 18 Nov 2026 17:45:52 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Daniil Tatianin <d-tatianin@yandex-team.ru>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>
Cc: Daniil Tatianin <d-tatianin@yandex-team.ru>, 
 Simon Horman <horms@kernel.org>, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Message-ID: <willemdebruijn.kernel.3b356fe59c775@gmail.com>
In-Reply-To: <20261117085951.681985-1-d-tatianin@yandex-team.ru>
References: <20261117085951.681985-1-d-tatianin@yandex-team.ru>
Subject: Re: [PATCH net-next] net/packet: don't direct reclaim for contiguous
 ring blocks
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Daniil Tatianin wrote:
> alloc_one_pg_vec_page() first asks the page allocator for a physically
> contiguous block and falls back to vmalloc if that fails.  The first
> attempt uses __GFP_NORETRY, but that still allows one round of direct
> compaction and reclaim before giving up.  Under fragmentation every
> block of a ring pays for that round, so setting up a ring can stall the
> caller for seconds even though vmalloc would have worked right away.
> 
> On hosts that run tcpdump periodically we saw ring setup (8 order-6
> blocks) stall for up to 1.4 s per block and 3.5 s per ring.

Is this still the case with recent commit 0e05a469c294 ("mm/page_alloc:
avoid direct reclaim and compaction for costly __GFP_NORETRY allocations")?

> The contiguous block is only an optimization.  User space maps the ring
> page by page either way.  So make the first attempt without direct
> reclaim, as kvmalloc() already does since commit 46459154f997
> ("mm: kvmalloc: make kmalloc fast path real fast path").  kswapd is
> still woken.  The last resort attempt after a failed vmalloc keeps
> direct reclaim.  Order-0 blocks are left alone, the vmalloc fallback
> would reclaim for them anyway.
> 
> Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
> ---
>  net/packet/af_packet.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
> index 8250e6a791f6..38f35a4f9d49 100644
> --- a/net/packet/af_packet.c
> +++ b/net/packet/af_packet.c
> @@ -4493,8 +4493,16 @@ static char *alloc_one_pg_vec_page(unsigned long order)
>  	char *buffer;
>  	gfp_t gfp_flags = GFP_KERNEL_ACCOUNT | __GFP_COMP |
>  			  __GFP_ZERO | __GFP_NOWARN | __GFP_NORETRY;
> +	gfp_t first_gfp_flags = gfp_flags;
>  
> -	buffer = (char *) __get_free_pages(gfp_flags, order);
> +	/*
> +	 * A contiguous block is only an optimization because vmalloc works
> +	 * too. Do not stall in reclaim or compaction to get one.
> +	 */
> +	if (order)
> +		first_gfp_flags &= ~__GFP_DIRECT_RECLAIM;
> +
> +	buffer = (char *) __get_free_pages(first_gfp_flags, order);
>  	if (buffer)
>  		return buffer;
>  
> 
> base-commit: 073d54dc3ccc8c8109c56e4d984d1ad616554463


