Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795077665;
	b=2ZXhiLxz7vsq5EMY7zj+tYqyie0Tnw/hcAtOYIAt6Vw5gZ8KTmmfzrHC5F9TmdVck9t/
	 Brh8kvaMthC8aLYwke7dIC3Y4pyh4+nnk6OuY0M2kR2FZIFvZxtqUGPgRxVY6erzMpwzf
	 0WkSEgOzNkrhNzfcZZ/EdG/x3g6/pqzZD/+RPHYlVHe5mu/z/63M+gqIYBkEClyhOu3+H
	 ei4cs4B+u+lOQZXynvcm53WQwbYX1otIsmj0+AHIWgDeYfHCclbofx+Lwt0grO+81yqS9
	 Yu33oHr0pYQDjnU0CfWd07W6T4o4x9c55mFciFm/31vZAyE5Uc+17IC9PxROn4bPO9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795077665;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=MSIaEuELRiH+S3myamjUIMtorBRRO9sM9NWx4rnIGEo=;
	b=GNhIn4taX/TviNy/DcuitSA+h/9fCL5kQ2TFMLpoD1r+XU1sLM9bR3rXTQ/u/idrxowv
	 k/z9QTkU7WoaiDmOxbhVUhZR6Rst59INIQiG0Fa63ugMxuUP1Z7hRwrcBAuTmuOz+oXUD
	 rTtNTuePOhRS8y92ws5FYcMIGPWSmIXuOUdD9yNUPoO0BLtajaDo7ZIahd2sE6wtfDHLQ
	 cFt68RUfXucobd5vtw/TkcEVueX4euTC+xAUW51BOKmbzoiEBUhNGlmuXbLkL7njhNyHy
	 qHJPQCVvzhwu1tdGUaRuHSR2fO9LP3P+3/WCMVokJ3p73GSSyTJn0vE8xQygThyVtNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q4Wh0fuh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88D2606A338
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q4Wh0fuh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76E581F000D0
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795077665;
	bh=MSIaEuELRiH+S3myamjUIMtorBRRO9sM9NWx4rnIGEo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Q4Wh0fuhuzMIMViH3iDcjIJJwJV04+ugZYadwbnuzOHU49RbjcmwA20EoKFGxmvee
	 tpDPdBda69EPg6XXdDV7eVc3k4R5TL/rAZMmC4SuxoNb9S7EG6f2jzlY1Myk8LWOs4
	 ne55Y/J/N/eeFgUcJ1dnXWDJDj5VoqYyR4+DkT0x+Di75TWYiXJrUsTmGYWKCA7O+e
	 cXLjh4+CYt/WVCu5u4m1C+1/nNfIm2Pb+/JiaJqS7a9W5Dyk3EEVr6YKHXgfa2hSfg
	 /qOMYM8SakCL7nOXkolqhZdggxNjaI5YxU+mBy44D5GC+Xj7gv+Ro1hh49wwmLyBi1
	 ZRsm0DRB94gng==
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-717080a2d50so1693501eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:41:05 -0800 (PST)
X-Gm-Message-State: APuU4Z8VTIqKOumsAB6ncxS3m+CWZzaw6Nq6ST0yjAltAMrk1+9HH355
	Ls0glSzcJ6MN+Tq/ABahkVYxigikTD6G7hTjyb2hJKQ1v/NnqhhknWKIbUs7XoKKXHf8QqjwBiu
	HS6mTS9uBk3LMXypKWDgOlAGzJHdBT2E=
X-Received: by 2002:a05:6820:1629:b0:71a:e95a:34dd with SMTP id
 006d021491bc7-71b1861857cmr4385383eaf.78.1795077664746; Thu, 19 Nov 2026
 00:41:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119061751.222641-1-jiayuan.chen@linux.dev>
In-Reply-To: <20261119061751.222641-1-jiayuan.chen@linux.dev>
From: Eric Dumazet <edumazet@kernel.org>
Date: Thu, 19 Nov 2026 09:40:53 +0100
X-Gmail-Original-Message-ID: <CAL4Wiioj+Lg8=PyAqLVRLG+uhewDWjaDbk1F=a3woEB+BETkmw@mail.gmail.com>
X-Gm-Features: AclHuK84Tlqn_D5G8EbCdTmP6ADJEOzBwkNsjW_K1nwUiwhMO48xsSGQSKnvvjg
Message-ID: <CAL4Wiioj+Lg8=PyAqLVRLG+uhewDWjaDbk1F=a3woEB+BETkmw@mail.gmail.com>
Subject: Re: [PATCH nf] ipv4: fix conntrack defrag forwarding after ip_frag_reinit()
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: linux-kernel@vger.kernel.org, pablo@netfilter.org, fw@strlen.de, 
	David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Patrick McHardy <kaber@trash.net>, 
	Hannes Frederic Sowa <hannes@stressinduktion.org>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 19 nov. 2026 =C3=A0 07:18, Jiayuan Chen <jiayuan.chen@linux.dev> a =
=C3=A9crit :
>
> q.max_size and max_df_size are used by ip_frag_reasm() to set
> IPCB(skb)->frag_max_size and the DF bit of the reassembled packet.
>
> ip_frag_reinit() reuses the queue for a new datagram but does not
> reset them, so the new datagram inherits them from the old one.
>
> On a router with conntrack defrag, if the largest fragment of the old
> datagram had DF set and was larger than the egress MTU, a new datagram
> without DF gets DF set after reassembly and is rejected with
> ICMP_FRAG_NEEDED, even though all its fragments fit.
>
> Reset both fields.
>
> Fixes: 5f2d04f1f9b5 ("ipv4: fix path MTU discovery with connection tracki=
ng")
> Fixes: d6b915e29f4a ("ip_fragment: don't forward defragmented DF packet")
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>

This only touches net/ipv4/ip_fragment.c, so this should target
the net tree ([PATCH net]), not nf.

Reviewed-by: Eric Dumazet <edumazet@kernel.org>

Thanks.
