Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794947514;
	b=WTXkZyMYvI89jiqLmw1+0TUrfCnSSmi19/lTwnvY6qZGV6oAo4SvBpPytgOSI3bMNYE3
	 0IJbz0F9SSfjvzB/QQBFPiVjjhI9wnIkWB6HuSc9hCemxiSsWPJQvaI99FPmvI4BJzjYQ
	 EiVw0BqQOtMNz5FutnNNi45mKk082SdcmuEoJ10mqUrvvna0mgCqJCcWi0CZHM2qupLlk
	 GstQrwwSQpS24V/1bpQf2kDomZtTUMjPy9MEtYO7wYShIsHrxnBDYnNRx9IgBu+ZqlTzf
	 kDZNB7kEctI+/RvKCDjWlJMb8nLtamfl4Sz+3EbD/nsupAlAF+VKbGxFj+9P8LmtQDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794947514;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=WNCSWS2QqSRGlwzVEz08kpdvfR9MhOjRdFeTc6DNji4=;
	b=Zl61YzpIxjEeFD/kxrx2cq0dqAAIj4Tui2id4GurqB0PfmHZ2kswm0qz+fw1hiIEQxql
	 05uAvhIp5j94fqPXecAjP/FF08unqP+H86iAA/eRFgPtHElwrS0qIB3nZ4EQSgb0nLLZe
	 AxEv/LUtyF7zRxwcp5ICfnG4sGVHlDePiuJojFnnbLt5SSC/imUx3PVeDL+KQv7CvFhmA
	 Zaff6O9iT8newj1GKo1yYH5qtKTMM+vG6G4s8zIKq8TgNubmCNO5GOj+9GjJ0KGXD+P5c
	 F8OZ5QL1vwxEVyzhXK7ePVyyfOqKA7pBIpxWVuPN0TVrecDspUHEOl1w9YEH3CCK1ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=Dbol2SdG;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=bVGMY0QC;
	arc=none smtp.remote-ip=103.168.172.149
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137B8606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 137B8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=Dbol2SdG;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=bVGMY0QC
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id C3B39EC086C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:31:52 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 17 Nov 2026 15:31:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794947505;
	 x=1795033905; bh=WNCSWS2QqSRGlwzVEz08kpdvfR9MhOjRdFeTc6DNji4=; b=
	Dbol2SdGFaQqyJvSWzqITR78ej/yMViPnTN2XjqlTVliD9QfLdixQKnSTHDXqlYS
	M4u0/CK+AgvflLiH1RrLGTP0EFlOZZ7GkEjaZXDs//ZTaX2HKDpU54nrkJ76KJ0a
	xieMdyhtRy3bMHZvFg4UI98VuQdad3ODeyKVwXt0lE1BmgoZjc4Qr55kkGqoTy3V
	+f81Ju1XRmWbZCloDZxOrEaQx1Ji8fnYSZQyXXqdFjg/Fd87nWcFCFl64ZtF6tS4
	lskeHxsVuPoFjXdDj3XA9g3I65DjO3g2kxbQYKWUPHye0LfQg4dN2mdf8GlZUp7H
	GFtflzN48+y1i611iZ9pWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794947505; x=
	1795033905; bh=WNCSWS2QqSRGlwzVEz08kpdvfR9MhOjRdFeTc6DNji4=; b=b
	VGMY0QC0lXkN5yQusQJVXqhsMz504eRl+FSaCCvEl97uJ50hKrjtk+RcBO7isl7D
	0uBlbee6DOZ4jIDan8Pe+nFVeTinBlTwxAfF6oMYadOgzeSydL5TkG4FLGghdAe1
	OKkmEV3XyYnV8xO5SBeZKt9utccfqI8iFx4bviZoZlVReYc2g0j+NvoX8T5ofpxc
	U7wJkGpHLjjr0htmWdQsKZ+w76lcm4OLvHFGd/nyE59+1lPoX8pXtZdAurZBnML7
	v7XyUvxATdzd92gj+TqnUSDwrdormPcNaJueOPfTJrr/S6IRmnVpJg58Gqy39Vb7
	GSzDOHRxumhpWOiC8nQRg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794947505; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:eaYULdJZJYr8tDLIl9eQcUSVXfIb32fFCpd0xvveQwNqN5e
	bR4N3AiQjS/926UcTuYLuVNoeAhOHD9eB9O9TGEgYLy4HRvRDP6iofPSlrp7uWlu
	2mo6BlY5nS83JXSl8tvyiQB9S0EIyARHv3oCKxzmgV2ExpbPFtN1OYlmLEF5SUIz
	eOSCeDqx0Dms2y5SFVvE+cRgT8vT/FWk9Klbep1vWVMxaizZooWAbsXXAAKOskIW
	kT+of5KdGYtff3zWNyPDy38hGNJOUQxWld3OqwQeQHJlVPkypqho2spNUZvKhsck
	D95cHgfxxSSCh8TbRoOgEQxUhp2yHBjQon2EeSw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:zJWjr0w3M4uzGv9DdYuVvMqjqpmxQkLd0PUp2ChdHmI=:vZCoE7GaeTovUmbb2627WNVcsxxfg/5P5Qa1/f2QtCE=;
X-ME-Sender: <xms:qLn8aut4kjEAIfTtKKGxWZ-hOtsuMwsTOhijyO33M9k9UKBvkJ3KrA>
    <xme:qLn8auRxM9JaWI4XD6aBn5D1w8i4TbEQ2EYZAdg0eMDTC9q5lUsJdP4vc2TJMxiEQ
    np57Qgx8bLSz5xmHV1VBb4wNtq47SnhKqeytP34DJquf81c3umxSpXw>
X-ME-Proxy-Cause: dmFkZTE0A9w+3y8XwzwOBv43d1AyuvTsAuiT2g9ykEpGMhc4nsxzzX3B8PJFomtHSZZeJc
    khIJgbJuHtU9xdjTsYeF5AXolyWV5KGMp9OKVwv2bn2IqVZu7pck7dzVgDsNODPu/fYpXZ
    7uxRkJFwomneQH3/FI2o5QtPAi44mXLePCFmHonK0zt//dinU7VfLSsSXgawZdyPn7661+
    i7voJF6rON6TNeF7q5UlaDGyevhhFa+nSKaUSQDucAlHDx1eyj5zJKhT2TdQiQZUXDYztO
    qGo8yJQ4p8fFy91xPsR5hIT9665FM2i+AMxAzzRv3uTvyG6AyBZMzeTKRL8beMlpe8wYec
    c5gEu7wMJiwFSQgxSkq00VMWhPeYj2a4/w8vEUCHah8AN9E9QQGLuJt2urg0N2xauE0yml
    EfcYJxucixIhJdhmWNWV60pm3jpW9O6tks+upGWdkZSf1MzW1d9LXmDdz3y/3J9m64zkLG
    5l3s2hPtKKAXa1R4FitA82h8NntynpgA9yDpZ7k6t+nMTZQyqdBGrje+s+xZXaw1UGk9ui
    9dXxor9pmO0y0/InEJ0/EDauA/mqqgCGUprQcneXLupOODBhkSj4NYx7z/mnN8RGAZx5IY
    v0Epg7JXoLeVLrJnKt3svcxoO3RPEvq7yOlSDkiwMcz36I8iJ6YQKcGNOQyw
X-ME-Proxy: <xmx:q7n8aqZnNZcsaMYeJ2yFSowbOe4V2-N8k8R0e7nCg0QB19jqpK7k2w>
    <xmx:q7n8ar6Dar06zmf9UnCsiJQbAtuy1ytgj5EtoAgKNGXai26oW9YEEg>
    <xmx:q7n8arzn2gVJyrol89XFf5bwE_SXKmj5Dhxz9hM4jLRj5HQZZ4DfvA>
    <xmx:q7n8asreHaW_kWMSvYJe38Vq-6KfxzK7gnmxCe_ItZ8I9R8UtCxw4g>
    <xmx:sbn8amEc_gSAE9Qm7EyRNWFkieIAKR3fEH60_gODcmjaP1lzRgeaVRVk>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id C443D32A0099; Tue, 17 Nov 2026 15:31:36 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AXxIX-uOARoc
Date: Tue, 17 Nov 2026 21:31:16 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Gregory Price" <gourry@gourry.net>, "Lorenzo Stoakes" <ljs@kernel.org>
Cc: "Arnd Bergmann" <arnd@kernel.org>,
 "David Hildenbrand (Red Hat)" <david@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>, larips <larips950@gmail.com>,
 stable@vger.kernel.org, "Zi Yan" <ziy@nvidia.com>,
 "Joshua Hahn" <joshua.hahnjy@gmail.com>, "Rakie Kim" <rakie.kim@sk.com>,
 "Ying Huang" <ying.huang@linux.alibaba.com>,
 "Brendan Jackman" <brendan.jackman@linux.dev>,
 "Johannes Weiner" <hannes@cmpxchg.org>, "Jackie Liu" <liuyun01@kylinos.cn>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Message-Id: <9e7805c3-d41b-4d5e-ac67-8474a5671d86@app.fastmail.com>
In-Reply-To: <179494557732.482102.7719202079181127037.b4-reply@b4>
References: <20261117142628.3931151-1-arnd@kernel.org>
 <avxnIQTcFni9G4IN@gremlin>
 <541a67af-3b45-4d5d-ac4b-c741850f92e1@app.fastmail.com>
 <avx0Ci5uPW_hF0Jk@pazuzu>
 <179494557732.482102.7719202079181127037.b4-reply@b4>
Subject: Re: [PATCH] mm/mempolicy: fix copy_nodes_to_user() for odd inputs
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Nov 17, 2026, at 20:59, Gregory Price (Meta) wrote:
> What about the following:
>
> --- 1/2 mm/mempolicy: convert maxnode to a bit count in copy_nodes_to_user()
>
> Converts maxnode to a bit count on entry to copy_nodes_to_user() and 
> get_nodes(), fixing the compat KASAN stack over-read and stack leak. 
> Fixes e130242dc351, Cc stable.
>
>
> Subject: [PATCH 1/2] mm/mempolicy: convert maxnode to a bit count in
>  copy_nodes_to_user()
>
> Whenever maxnode - 1 is a multiple of 32, compat_put_bitmap() reads one

'multiple of 64' I think

> more compat_ulong_t from the kernel nodemask than the caller asked for,
> and writes it past the end of the caller's bitmap.
>
> When the kernel nodemask ends there, that read goes past the on-stack
> nodemask_t in kernel_get_mempolicy(), and its low 32 bits are copied
> to userspace.
>
> With CONFIG_NODES_SHIFT=6, 64 possible nodes and a 32-bit caller
> passing maxnode=65:
>
>   BUG: KASAN: stack-out-of-bounds in compat_put_bitmap+0x122/0x130
>   Read of size 8 at addr ffff8880150d7ec0 by task mpoltest/241
>    compat_put_bitmap+0x122/0x130
>    copy_nodes_to_user+0x14a/0x250
>    __ia32_sys_get_mempolicy+0x1b0/0x2b0
>
> Convert maxnode to a bit count once, on entry, and use only that in the
> rest of copy_nodes_to_user(), so the compat path gets the same size as
> the native one. Do the same in get_nodes().
>
> Fixes: e130242dc351 ("mm: simplify compat numa syscalls")

I like the renaming as a cleanup, though it does make it a little
harder to backport to stable kernels from context changes, maybe
it's better to do do the minimal fix first.

>  mm/mempolicy.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> index 390a31a99b4ff..cddca1db3d9a1 100644
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
> @@ -1725,8 +1725,10 @@ static int copy_nodes_to_user(unsigned long 
> __user *mask, unsigned long maxnode,
>  	unsigned int nbytes = BITS_TO_LONGS(nr_node_ids) * sizeof(long);
>  	bool compat = in_compat_syscall();
> 
> -	if (compat)
> +	if (compat) {
> +		copy = ALIGN(nbits, BITS_PER_COMPAT_LONG) / 8;
>  		nbytes = BITS_TO_COMPAT_LONGS(nr_node_ids) * sizeof(compat_long_t);
> +	}

It fixes the bug, but I'd drop the nbytes= assignment here, as it
has no benefit: The only configurations where nbytes actually gets
a different value is for NODES_SHIFT<6, but as the on-stack
bitmask is still a 64-bit word here, the only difference is whether
the extra zeroes come from memset() or compat_put_bitmap().

I assume that when I introduced this bug, I simply confused which of
the two variables needed to be adjusted.

      Arnd
