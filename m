Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081334;
	b=XitI9woxyrND7JlO3L9h/o/3Gtd8yX+Nk0j/xKUsFmexAE0g79bapHrbIef/AYxdNWfq
	 pxvlYbZ9KIReNNiF9ydpJK9VcQ2uMqBj8aix/2PFh580dSPx+fC1NO56aDoqSEqjdoGxY
	 qgewgwfgcKEHVoiz4CGPW5k3E9tsigjtHQMYWAmBGdWH7+t+16JKXC8Pnp9jGCNml82h9
	 qJbSjmfZ612GPlODT2b4bojWodVwRjNnBaHhzVkVbsao1HHY8YUDZ9qqQiwOzUbBKurjm
	 WPH2ARz+OTCey8KWKVMbn93ZY1FsxwCytsU0mZZerIdRnDXlwIgzOTarpzuFDdf59Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081334;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/D99FBui+IgQqOoHfHSwVVVX3NUjUeNBW0CsxCpgIqU=;
	b=4S7cUTZjQlSSD2BkGtMg/Ff9WvRS/D21QFINuLP2XUhSfgi2OQlvIC/DTllC9cpO7vKx
	 xfBX0SJj9h708Hf0OsAt236smzMa8BSZjpIkXVbRfaktldexGggkwvD0NMtY4b8dNVxIH
	 K1UOgpu6BAkxoh0Hku5paUG1BjHAGGjXI9KkHNOQnUsoRm7t/UjrtoOJOIlKtc2fneUJI
	 apFGxHgUQ/ZSBFLuQhk3u0cn3hGP30D/vKbbsMmcFOYQ5OXdJyWrOC7bKVLvAYaf1kQSs
	 R5t74sHz68wldd4uvoi/i9N5kLN8OzXGL+x2Yd+nPwlLQsMwgwg9O2d+/C+R54Ud91g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F4BsR25t;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C67606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F4BsR25t
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 843BB1F000CC
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795081334;
	bh=/D99FBui+IgQqOoHfHSwVVVX3NUjUeNBW0CsxCpgIqU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=F4BsR25t6ndbvM9exfF0bEMuftHRlwcSDHVSo2rd2FTlWColie6vq6odA4QZkkF7m
	 mXF2hYrJPmOa0o9d/RXB/K+kMrpE/kS8ts6n+ul2WCIPln7Y6pPpAHuVbDI1pJpN0a
	 trd4P0gCEBSsDNGhD3cxT4OjZUQviP+YgtXmegY6zS46dzR9u6QTK1go4/ISzETnNq
	 N8CQ6G3H90INQUZJRSIYtikAobWhvl4pLfl4eDU2gj4CV6XyzWmv0nmCAlW7YIBTQu
	 AXH33GFiF34LuDC7v5wxsr5JjFauSvVFAgXoryigThRQdnNiDOPBcX58y/ttPq02h+
	 C9uEHAfvHJYPg==
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-71ac9e15640so1127407eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:42:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGv3R4yKWKgb3jGbhkeMESTPT2Hzftdr/97fTQZKZrzMnB4kTRgyMrhcIReG5cMSgzMav9kLZFCLjGmN6w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9K0HF7vZvRiIsQ45WZI4QX7WRSiKCNHnumh+8KvROHFkzsDlVU
	9/eQJzEJWw7kqDG1A+kahjjIDIDRMY00TjcaO40kTtvnPEUnbFbThYiI9K0y0fB3aKqfSqi7h5T
	i1WAE7xsP9oTh7NtJ+EmHayVT7n6RIak=
X-Received: by 2002:a05:6820:2409:b0:70b:af3d:2b75 with SMTP id
 006d021491bc7-71b187c106dmr3548649eaf.65.1795081333803; Thu, 19 Nov 2026
 01:42:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118235055.1225115-1-vladimir.oltean@nxp.com>
In-Reply-To: <20261118235055.1225115-1-vladimir.oltean@nxp.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Thu, 19 Nov 2026 10:42:02 +0100
X-Gmail-Original-Message-ID: <CAL4Wiiq3k-FtqtX-w5WEcTBAee9ukmbMMWL36vx0VNL0KPpPzg@mail.gmail.com>
X-Gm-Features: AclHuK8OdpBInB5Oa2_kN1teNvgvUNzWkFon8eg7MKr-np2dztkIK38gr9QBzf8
Message-ID: <CAL4Wiiq3k-FtqtX-w5WEcTBAee9ukmbMMWL36vx0VNL0KPpPzg@mail.gmail.com>
Subject: Re: [PATCH v2 net 0/4] ENETC GSO fixes
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Claudiu Manoil <claudiu.manoil@nxp.com>, Wei Fang <wei.fang@nxp.com>, 
	Clark Wang <xiaoning.wang@nxp.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 19 nov. 2026 =C3=A0 00:51, Vladimir Oltean
<vladimir.oltean@nxp.com> a =C3=A9crit :
>
> Sashiko derailed me from "[PATCH v5 net 0/4] Fix short frame
> transmission in enetc":
> https://lore.kernel.org/netdev/20261021145314.1435049-1-vladimir.oltean@n=
xp.com/
>
> which also touches the driver GSO code path, so I'm making a detour
> to fix 3 unrelated issues there (which I could all reproduce using
> LLM-produced programs).
>
> The main highlight of this series is the introduction of
> .ndo_features_check() for enetc, which runs for every transmitted skb.
> Each patch makes its implementation more and more complex (and I'm not
> done...).
>
> These patches all assume that at .ndo_features_check() time,
> skb_shinfo(skb)->gso_segs is set properly. There might be issues there,
> see commit 67b0cca9ba88 ("net: validate xmit skbs in generic_xdp_tx()")
> which fixes one case which led to gso_segs reaching the driver while
> being zero. For some reason it was merged to net-next though.
>
> Running a bidirectional eno0 <-> swp0 forwarding of raw IPv4 64B packets
> (no GRO or GSO) on LS1028A-QDS rather than some micro-benchmark,
> I am not seeing a noticeable performance degradation. It is in the
> noise margin.
> Before: 7440 Kpps ingress, 586 Kpps egress
> After: 7440 Kpps ingress, 588 Kpps egress

Reviewed-by: Eric Dumazet <edumazet@kernel.org>

Thanks.
