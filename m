Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795426526;
	b=XoSBT1aI2bwPLXGBNy3wXQX8QArF7qeJ7w/g2IzS2brh7mcVcif0k9HnPTp+4I3hiNfT
	 OmBZ8pEABUx6Abg9CRAXvCMY2D8/9/lmvZh333hD5EoFxTqsFYFQuSK3sm3DA+/qCgCnq
	 cCIDt4OEuiv/vfs/grLvqda9GTHNd7cUUF8GyPBpIFhbtCLr41H+BoLAg0cUxPsEkA7A4
	 BVoIICO3aEz2+DVFGGUStwIjnszucuUIcgmJKUtJNeCmZqh7nGzeBKXhWmt9uKMpltVej
	 Ps9OlO26BfWoa4imK9uiEQMKCBH2V45CpB0oaTOXrXbzbeWBnDsyfQXOhv6gD3H8eLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426526;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YSCst1Q1N2oXZJM30s4MwHTcN+gIG7I1Yy44MulzNBg=;
	b=tZy/sz2ANjMxnH0sOCoLE/8wFxeR48OzCAJVr+2hw6/ISi/hG+ojyd7PGqAaiQcUZ/dq
	 98h7M/gyG2h3B3gELHPZfZOGzu7vs/glVxZGMTxt26T9oO/YQMFzrLIMXJSYGMuBbS74V
	 PArMKiJAYHYolV+SzroYaia8DcURnyMvMIGHOwf+Zf3opisRmV89a2Cq/eY38s4866S5o
	 F5mDWScZ0i3VobLaOCc1wK9Z8W6zYF/4wXNtWUot4/VuU0n8Vpv7EgVy+hNIvw4VQy9AT
	 dCM6FLHL8I9Mz59D14S6K1J4ULaMVfM8eIHkAZjAVvAj8zadTGwdkrj6I0ZNNXFa9XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eOGDAIQs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0C2606A682
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eOGDAIQs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00C8F1F01561
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795426526;
	bh=YSCst1Q1N2oXZJM30s4MwHTcN+gIG7I1Yy44MulzNBg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=eOGDAIQsBxuXWg/xMFZ8ps/8xyu86C1vuUmBmKZsFdzuC9+WgUAcgTZ9ZoZYOdHGa
	 JUxG6L5q1GBw5NfiSzucZFCLqogd7Koyd+uc88gUCPddXxN1PslmjeskXE7oHYRE6c
	 1mjze7FArpGDspL8mKhjXPTwNs8Hl/JNw/6ktt5t4eDE0DEqAuIU0bcEdyQmjAv38J
	 y8Gxyj5yzBnrloFlWfQVhBWSCjltqskzEta+6O8TN2kNElEtM9AFYHNUzcpPw6TxZ3
	 TPNrA8IMlV/xuXhNzbS4DRwBmIpnFciiSklAK5P7VV6cLVyMyhRSTVm/dGjUnGy383
	 beEaIRzot0pEw==
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-717080a2d50so3034951eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:35:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEXnBaudsJ9sXLLS4SvO1cE9nnSTaNyWXmDU0vTGG+IDDpRoy3cTTh41lNfnbBkX7mSRyQfjvtWsbKB3/8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9A1ZpDDlev3qVTtH4cNJCZvlTGHH+dMI0Eo8b88bOVBJAB3vQr
	1lj6etFJs3CoFW7e7+Vc9RZTP/7AdDwnOZ2THg/cLL3ZD1DZ0GN7aZFTJEH4+icwM/3qkkDp6tT
	BYLUClm3Lfox1sY2si328MNd6UpH2jAI=
X-Received: by 2002:a05:6820:f016:b0:71a:f065:6179 with SMTP id
 006d021491bc7-71b39036693mr8533445eaf.0.1795426525148; Mon, 23 Nov 2026
 01:35:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123034047.56745-1-dennylin0707@gmail.com>
In-Reply-To: <20261123034047.56745-1-dennylin0707@gmail.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Mon, 23 Nov 2026 10:35:14 +0100
X-Gmail-Original-Message-ID: <CAL4WiiovxhEi8G4W9F7faF9COPTaUcjo_1VF2ObJpbUB0i1ibw@mail.gmail.com>
X-Gm-Features: Aa3M54qGv8m9FUEFf183zxyfsISWMH4tBcTTNJxZbS6d1d9E0oMYtFvyu7Y4NZo
Message-ID: <CAL4WiiovxhEi8G4W9F7faF9COPTaUcjo_1VF2ObJpbUB0i1ibw@mail.gmail.com>
Subject: Re: [PATCH v2 net] net/tcp-ao: fix reset key lookup for IPv4 segments
 on IPv6 listeners
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: ncardwell@google.com, kuniyu@google.com, davem@davemloft.net, 
	dsahern@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	0x7f454c46@gmail.com, fruggeri@arista.com, noureddine@arista.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 23 nov. 2026 =C3=A0 04:41, Hungyu Lin <dennylin0707@gmail.com> a =
=C3=A9crit :
>
> tcp_ao_prepare_reset() looks up the key for a reset that is sent on
> behalf of a listener by the address of the peer. It takes that address
> from the IPv6 header whenever the listener is an AF_INET6 socket, also
> when the segment is an IPv4 one that arrived on a dual-stack listener.
> The address is then read from the middle of the IPv4 header, the key of
> the peer is not found and the reset is not sent.
>
> The v4-mapped check that follows does not help: it looks at
> sk->sk_v6_daddr, which is the unspecified address for a listener, and
> it runs after the address has been picked.
>
> Take the family and the address from the protocol of the segment
> instead of the family of the socket.
>
> Fixes: 06b22ef29591 ("net/tcp: Wire TCP-AO to request sockets")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
> v2:
>  - Take the family from skb->protocol only, do not read sk->sk_family
>    (Kuniyuki).
> v1: https://lore.kernel.org/all/20261117215554.68071-1-dennylin0707@gmail=
.com/
>

Reviewed-by: Eric Dumazet <edumazet@kernel.org>

Please reply to the netdev-bot question: how was this found, and did
you trigger it at runtime or is it from code inspection only?

A follow-up for net-next adding a v4-mapped peer on a dual-stack
listener case to tools/testing/selftests/net/tcp_ao/rst.c would be
nice.

Thanks.
