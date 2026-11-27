Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795744075;
	b=0DKpaqH34t4QwB4DL5DQRlG9Jiz4mk0vYsTh1lOhj/92/Y1Y4NTlCQ2FTO8PF489eWRf
	 cjnlBfEAz5aTFyB7OjzxlX0KPM2mpQsLetOvcoPBS78YwFILvMQhEkAVblDPBCuxDWzTL
	 n3lkCx8YbEMyyqE+JsZshbxLVEDs36Y71E4MlHBbqiRY8VaU8fXMga9T09JSlEUpm6nzu
	 YKTr/2k+3Lm/WDTcwQGI+3P6lfXV24NrhI6i4kmLlHvmM2jsn1nCkJXr6eqFmhRHKEPzV
	 YM9AOcLczljIzUsvqWyDGok6ClWH1VqS2O5EsNp5FzxNBlENXgSrJsfbvRB2gE0gfUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795744075;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=9rpdsm/VQNjI+QZyvQZysG3z/mkS8qpvjAF0HDQXOiw=;
	b=z899IUhYb5LKjaxOMaQKZRhJroR4xue5R3iC3+TERz9Edw/n7t3iZCtlI1vHmGaxzPIY
	 Of/XpBgsNyLRVtlXSQNrjIl215d3wDqurz+O7ex6VD++NabTGBzHLA9dzhGFBxmvzNiaQ
	 176W2YY/Eu6BbFFAKQpLuhpQLhyVDcO0anYYkWV9oSWoM0lbG7n61hPLL3NhxYja6VOIl
	 33M/vy8B6b0daimysgiiUcG3njvl51OxFklSmcXEbRMzW0Txjmw8viq5cYOam9Ee5B0jk
	 PPdne8YVMgJ/N4Z04cPbAcq1/ZWwJoxU/x9Nw261O7pm2hzgIsnSaRcPyJhlkT+IuMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andrii.net;
	spf=pass smtp.mailfrom=andrii.net;
	dkim=pass header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=W9umYR6B;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A5C606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14A5C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andrii.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andrii.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=W9umYR6B
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b3a914e4c8so4298572a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=andrii.net; s=gmail-2025; t=1795744074; x=1796348874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9rpdsm/VQNjI+QZyvQZysG3z/mkS8qpvjAF0HDQXOiw=;
        b=W9umYR6Bu05MAqt8vQxTPaZuHIj8L7nkoqY7roaXz/KTOuU0vid4imCewE5ztw/rXx
         h4KetozT0hoS7sXnuW/fq85mVt9zpfR6JRkVpxBfKZkcRQlrHikdfsoDem8IJnaM2Cj4
         9cwe8pDu65JPoWmf0uzO1mhZztzErO6vjL9Wzp+Aj76Z945LQaXM0fNNY02GCDcU07YP
         OuVlLLTbQtV2Z4OO5pwSCXDAwml/8Gr44oxlyeR3eoes0VA6EFJ8wE/XMGz6oap/ipfF
         1uDzFiDy+c8Txk+tjbKX9kIFMgYRczn2nrzTPthOc0yICs2VWsF8YdjxqI1A235TPWks
         KeoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795744074; x=1796348874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9rpdsm/VQNjI+QZyvQZysG3z/mkS8qpvjAF0HDQXOiw=;
        b=pt834LMMzYuQdKTt2144SjeEUs8OqS/JSpuRSnvqqS+3A/JbYEJsn0HAKZDoRrAG29
         OlemBJOqeT/mEtUeCMXA2P3nmC8SfmFIItyZ/osxWbimEflMa9zjkLFYOd9S9ifcOiNA
         f+AnS1/iyi6QETAzJbcnlcLlAV1UMXNWKAujQyxfUCL41SXLe9FYYj6Io/juYzqHtekv
         S6aPVj+DRlylCNKhqT9fT4iDCeYRpUWvEJarmBrdMw6mpVprS0L2rDaQ91izHCoj2y/Q
         B+PPotPF2mk1MTo/e84u+vFKDK/7CFzGZey9ChWGNrJZOfHFgaTdHsqAFGfY449QaHeV
         efJw==
X-Forwarded-Encrypted: i=1; AL+hErGHW7fsnP5ILLdIgolvBkAAxSsQLj9IUZapfpz5Ks5tHEqu8xyHk17E8Cfgd4XIVuzjVOT64k4A11mmHuI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+U56+Frqc70cFOp7P8wRnmDtNUwAY1VIXLpFX0XkRHRBqdUBwJ
	65G4K56aBvbtSLlGSTHMHnkSihaDtR+cjKJZCdV9kq1QH86mkIUq7SiKbGFTtkB04RWrdL8/upC
	saC5etTzeFhSvUxJGN0tX8j0bRhTfQPtt219T8GiHiBTDUsnueWEk
X-Gm-Gg: AZFdTZcWrfc0192R7bqwBy0V3S4eV40J5pP0KDpFSgdKm+3FVGWjB/7Or9NEo3UWHGq
	eFIhONB70r8emZ1sCRv56zgVT90q5xAbHNNally7qb0mLOa1ezgKhAuUHM5WS2iIflhRWEScQij
	M9MoGLwpG3sXxTTA44bCmCi3PkRa924ZJ2sxu8ahmuNuo2azcb/YafWJszNrxxmpy9/r1pN1mLW
	yBy62kknN/7iSRx8OhaJBcV6EK1mWlofc/EW+cNoEQrUqZL59Qd93zhKjgmZTbXlo3DAXrmI/f8
	5I3eA3huRB5H/a0Qz4+gHZh0GOo5tKodeD0ntHHViCywZSIfJ7C2msvUgXUawU905KFV2ep0NTe
	d6zec9rmhXn+35M8GsTiZ+sRYGrs=
X-Received: by 2002:a17:90b:288e:b0:3b3:ab75:c94f with SMTP id 98e67ed59e1d1-3b41c92a098mr21400073a91.31.1795744074328;
        Thu, 26 Nov 2026 17:47:54 -0800 (PST)
Received: from andrii.ai (mac.hestia.andrii.net. [2602:f337:ed:4865:7374:6961:204d:6163])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b4062a77f5sm16585106a91.6.2026.11.26.17.47.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 17:47:54 -0800 (PST)
X-Relaying-Domain: andrii.net
From: Andrii Tereshchenko <opensource@andrii.net>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Christian Hopps <chopps@labn.net>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	security@kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH ipsec 1/2] xfrm: iptfs: don't modify the shared info of cloned skbs on output
Date: Thu, 26 Nov 2026 17:47:51 -0800
Message-ID: <5ea528c8-ec02-4f2d-bc59-50700be8216a@mid.andrii.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <179531150722.3135.5639628464200463791@kernel.org>
References: <c1e999b5-15ee-468d-81c5-530a560e84df@mid.andrii.net> <179531150722.3135.5639628464200463791@kernel.org>
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

On Sun, 22 Nov 2026, Sashiko AI review wrote:
> [Severity: High]
> Does this guard hold the "they are never appended" rule from the comment
> above? It only tests skb_cloned(skb). It also runs after
> iptfs_first_skb(), which may already have uncloned the head.

Yes, this is a real gap. A head that is not cloned can still share its
frag_list members: after skb_checksum_help() as you describe, after
pskb_copy(), and after skb_cow() of a clone. v2 tests skb_has_frag_list()
instead of skb_cloned(): a first skb with a frag_list is sent on its own,
aggregation stops at a following skb that has one, and
iptfs_rehome_fraglist() is removed. That also covers a deferred skb2 that
becomes the next first skb.

I drove your route directly in a test VM: a cloned CHECKSUM_PARTIAL skb
with a frag_list sent into an IP-TFS SA, then a small packet behind it.
With v1 the original's frag_list was written into every time; with v2
never.

> [Severity: Low]
> The commit message says: "ESP copies a cloned head anyway, so this
> moves that copy earlier and does not add one." That is not true...

Agreed, with aggregation ESP can reallocate the head again. v2's
changelog no longer says it.

v2 follows as a new thread.

Andrii Tereshchenko

pw-bot: cr
