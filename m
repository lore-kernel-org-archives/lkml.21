Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795484287;
	b=wWfvFv1HR8dZ4Mm+xCYlz/542aWlat7rDx8M6q7WVFL3VtqtmZVeivQliNYt9eDRQD9N
	 UPamnvp2NupVI/+vBPZni1hbSsCnM/j3T1StrLd+sRlC3+Yz7443UIL2vWIE6x/KFotyb
	 meQpC1rrGMQlWSrdZWgfEenpFvOd6AJldTIXrFJ7O1XLi0HYgN272MKQhWqXyJkA37SFv
	 bZMebtpnyuFHUe1/JzXo3QQUwtFavMhf23r6uBByQDaU1xXh7jmu/V0s1gchZ7HSpbK1c
	 Yu0iyp1/Cy02gZZwexytqM8VCv/iOgZBXPdquCkHYH9/kqxblNyWFthkjWepRFRboVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795484287;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=CeBZ+wB4osLNJC9vxHHe7mdPF1D6RlCzCGZmdvMDBkY=;
	b=C85UzxEyamDTH7SAszydotPDn4c7lG9eczUtvg09AXS0/CrugcJmrzOzwD3ULXBTLTCi
	 fSSg19NUUgK3x4Sz6Mzq97L8bb2oVJ67bCsYBY6CcPw/At3cRtl4N1t4YRIqdV2kCxI3J
	 gKzkzbqGVEkDbXAjHhTTqkgA3gGB6+Ggcpd+CO9YRYReKzYcbJMZT+1UJusIujKRQBNAh
	 hLcsIm+uphNHT/M5xbyC5Ce6RJmcHfjqWKtj6OZsIUElaSxLZO0nuqU13d/g/cBewiyRv
	 d+anjoFZpggxQN2sKXOPd5H3n8B8Jk3cQnT5yIMiRPRO8cK9TPB5ju3x7ccvF0+GITw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZzpexupX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A1A606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:38:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38A1A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZzpexupX
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c5188e17487so159947666b.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:38:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795484285; cv=none;
        d=google.com; s=arc-20260327;
        b=m36qiHZMYAkGoatLgxFqF7M8/dHZJN6OD0lbr72hGqVFaFJTzIv3mO/050tEAkzKfe
         zxw9iW29Y876wDV+18jtpd1Ri49DWa98ab61pKPqmNnMyGP9EnbHPPVIgMU1U7lDWmEb
         GiqhMmzv6LBrc8fxluZk9sgi0NV2FKPDM15gzLFpF2W2JgUQhNpq0NgoScUGy0xk6Yfo
         SFQrm75859bvCCQ/Kii64gswrmDgvmWHfyWGIY03CBL/EWXfJFqhXE5X27A29BVeh1kr
         yPzOnIcVj940RdDytTYjsB+9Bi9CERRYAJL9ymM+3PyeHja9bK3aUzTynqOQ/ZgDt41U
         H2gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CeBZ+wB4osLNJC9vxHHe7mdPF1D6RlCzCGZmdvMDBkY=;
        fh=HUsefRPrrSnlJLVlspeoebu5tn+pveXfWTx0Af1xu6M=;
        b=Na1SqAuJAvS8HFhuJqUBel/mqgQbPI0GOK8NM+LwOWNxWl0aqnoQazck1qgLO1jLFD
         7Dy2hlJucxukZQszTMaNv0FSFx+1pUynaomQE762lMkpV7/nsF0q97buOTddasXb/C67
         3dKwHL+nTfry5DOm06alVFqHKOoIqWg5bzIvkXKTb22m0wUnUsBXXRmr3g21+NlniyVa
         2b6xxmmFuaJ8k8XtD4sZ0p3CJTtHRw1oke04mZKyR72SEYpUrd/n1xIujFdAOVykODHK
         Z35RXt+qTiw5TLa7sxcf8XSweHILfPHpFTdqHY0AMB9kQ9ryUrk33YdFh2GZG9ZFshgm
         3mKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795484285; x=1796089085; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CeBZ+wB4osLNJC9vxHHe7mdPF1D6RlCzCGZmdvMDBkY=;
        b=ZzpexupXNdSMdJcbsGzEAl2ynnn1WqZ8YCPaIIpBdWXNJr6VOnrYrLu0RLtAiNpqSd
         TV7EEKD1Ev2i+u5k9Hd2Sd0hwyP7OjWA48PGYYlgIC3YgW+HU446L72VieDpHRGF20qp
         XlcSqtiNYMHlVImQ9SfwlXds+4e2gFsQbRKX/mlw0PZOKA6/0c7Rgo1wEy8uBIozcOgb
         V21xTABJbjVrNd2cmN2mB8OEAbmmmj9S/TRWA2gzQ6o2i4XQB8GIig/HAJqCTIiT8/Os
         LwGsegnHZW63Q5T3tY26MBQWJ6eie5UqO7cj6S1rc1++9eeVPCIfi6rYHwMMEoD9Fdma
         b2Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795484285; x=1796089085;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CeBZ+wB4osLNJC9vxHHe7mdPF1D6RlCzCGZmdvMDBkY=;
        b=Anu+LPuNk8qkPeYxl0isBrwQvLFb34SnT6aepFx0oPgZ1w2qBdO65+JICokN/ymNQe
         eySzhwGlOM1eYKUbxBjzqSpTjw0Ey32xQXon6lnF/UsT2sM3WkHvVuF/a9tn3wE0tR5L
         8fS/dRbbKnujNkt3ktcMnaH1TLztDVZpoXQ2wckT9b9xeWDewwyK46zL5JGFimGg+Bcb
         49PwcRY1UuNm7NCgDv0TgQcGGJBBqWUyGCtrSkgFjsd8kgJRJt6n2kLeGKttkYmuT+9x
         fda5AlcxO+MNuuqPkZ508sZyYXH+xRlHDTnHIEEhlLrlSqVzJZgiI4q/gpoqcsvpa21/
         ZYpg==
X-Forwarded-Encrypted: i=1; AL+hErGHOIgw0YGS0msSIo5w2/foGlASrCcTYgXkuXBj78EOv9RXiK0J3GyriqgpjD1Zpa5eM+yAop8hxutK/Es=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FK2d1zN1Fiop7B4VJjjIBn1LRSQC2hXWXICjwFLupAwpHx699
	cTh1a4TyRAytbtMWpf1CVOG9xss1GcukzmxNmpD7zWqciksFB//XT1sXloc1Pv+3F6HPu70CdCi
	WlPe8lVfjndeed/ZRetFaM2A6PnnNRLQ=
X-Gm-Gg: AZFdTZdIlv1IUIoGvGJw2vDqgKVryNp9vlpAreDlestRGwAT+BFi/bM+yQ5qog2ROZd
	eYvwLkw5Ecc7kgaPzpntdXdRiFaHyOg7JR22yfH/egPOuqsumG0c8iu7DSnNdg6n2eb8Ph7zaG9
	ErhUcyeP55IOm9TU1f8yPe2fuiE8P75bLhYegdRXXsFb+BN/Pn4HlOHxhguV+/qTUz8Nhfa+DB1
	Yg2gxrNarcCQbISwaYYovbPl13bpy9i41jwC0GaOcHV0xqUKdhwRXwkdaqqzT4rtLn3C2POd9es
	dCaG1lmVtgtJTZWR9NOkF+t/3EDS0oTgjn+G/CcQk57DBQ9BycgEuoY0eBsdA3BVWpZuCAK1fb+
	TIJ9iCd5xfP2A7KFPv+vWQNW+riObO/dMxKKkDnEBQE8E9FHIBtu4VNcMHFaSdBO6WqAy5yKJ3K
	zM0BvM2R6Tn9ORuI8DszGtoCT5lYyM1DnVRjnS69O0PVI2l7DZa1dC9LYBFuOexmQ+V2AUsCzDn
	06mSHOk/Go34z9Chpk83LMs8ahtMRLeU7S2yiW+jVmyAjIIGaZ0VqvaUD2O
X-Received: by 2002:a17:907:3e89:b0:c51:3bfa:8d3b with SMTP id
 a640c23a62f3a-c513bfa8f32mr1086885566b.37.1795484285405; Mon, 23 Nov 2026
 17:38:05 -0800 (PST)
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
From: Dmitry Safonov <0x7f454c46@gmail.com>
Date: Tue, 24 Nov 2026 01:37:54 +0000
X-Gm-Features: Aa3M54qHippd-OgCM6-bCpivi302Ub78TymwXFLdPF0aHrFSViGlxdqBunnR_j0
Message-ID: <CAJwJo6a8ERv3ua02u4hU++zENBUFftDX4KrabX91Py0LGPF9Kw@mail.gmail.com>
Subject: Re: [PATCH v2 net] net/tcp-ao: fix reset key lookup for IPv4 segments
 on IPv6 listeners
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: edumazet@kernel.org, ncardwell@google.com, kuniyu@google.com, 
	davem@davemloft.net, dsahern@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, fruggeri@arista.com, noureddine@arista.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Nov 2026 at 03:41, Hungyu Lin <dennylin0707@gmail.com> wrote:
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

Acked-by: Dmitry Safonov <0x7f454c46@gmail.com>

Thanks! IPv4 on dual-stack sockets historically got less test
coverage, unfortunately. Eric's proposal to cover it with selftests in
net-next would be ideal, unsure how easy it would be to add not only
IPv6- and IPv4-centered tests, but also the mixed ones.

Thanks,
             Dmitry
