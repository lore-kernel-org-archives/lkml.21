Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795870472;
	b=5TavC95u46RIjBigdC+MQu/5gd6rF6efkwuXL1BO6dXMghu1B8UZvxsZMauWZttLnGEL
	 u7/+ayd0Lr6p7m9ArzfKwy93uDcRVbKlDZA9zHfs/aqYljMqIeISJJVbGM7Ic97oqufef
	 4VrbUxeEbXr5ZloeVPd8SLZaUCvHD8lJT7UMNtl+vez0sySox57a9BGfM0zO5HmuJu64j
	 JnRe5HSy2SyoGCMhwZ8SlTDZVVdAjmibUWNCtOvBlpTiG0f2nrHL1Ujgxyl8iWTcDezOx
	 GMm62zl2XmbJnP/ks5liDBG93rt/ByS1uGH73X6tbLL7Dvs6X7IT1LQHs6/lCdbJTCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795870472;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=gnF98RXlARFo9XyCDL2rqNyyuvHMMADxub4w4sqKGto=;
	b=qdJZYyYC0vH7QQ3wptv4LmTODKHZblEGbpZAT43PX7GSuAykmYuUPOOaNLVo0m1ysk9W
	 9qHJRVPxn9p+nxUynPpaRW/DTevE+OdfV/jNb+R5dX33EhyrcWAJnE+71uK3StNBpkYAC
	 9Jpu5Q4eWr7g/4CdEwE1mZ5TDGPCQoqjGVQr+ivQNf0c9p8JTBrUiWXJyd+YTHLdKV8dl
	 gJK7K5BblTGHKndTi8Zzb/t1wn9jxIIW2F8ROGNwJbo3SIrhbhfVUEy9gZtyYIzwmol9K
	 voPkn8hwGwNGBu6KzGhI2qgJWMY0h9D2B4N76McNXRVgomLc0R89IGWzP1TiCDmQWGw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=abtuH4Ky;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3726B606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 12:54:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3726B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=abtuH4Ky
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f045b921caso51096425ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 04:54:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795870471; cv=none;
        d=google.com; s=arc-20260327;
        b=fGl2My9jtWjRTiumETiPp1o1ZxsTSOrAQiGA2xx2sreW7AUpVQJl4OHFlYYqax8xsa
         bhhX7aKUI90aWbCeaHb4geO8HfMZPoWUpNQYlWzd/WczLIWrKtwSx9hM+7tw+30fWxNY
         XzK09EpehJA3JH+xVuZo5iQb9t6TCZkVKXPH34OV3YmolnNcol7m1AhftVjbH6jj5puk
         zi0pbIXm85PRWE4V1/DE/G3kEsQEJz10MdX6/B0Ee5qg+opuJzxmVE8sPpV4NHi8YaVa
         dCfXaLc4X1V22HpGdjt67+btKNKPx0f0FqYxhW7kWgQ6/gfu3Wz4Fc5XhVC2SoCLVSmX
         Iarg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gnF98RXlARFo9XyCDL2rqNyyuvHMMADxub4w4sqKGto=;
        fh=cCxPFqxFpdsAhJda/mqvKahqQNbKOvANjYsmIsvABWo=;
        b=GCgY3C+17jBtavgYFs3mtMTSwucCBW8HddDCUV+EuanCG9UVL2k+2p8klFGHTgOOAO
         6AHJQAl9X+XvNh3GGfTRk+JPJ89UyB3yo4Ib3loeJJyAgQa/sOMJXPlx9s3EJxiyRkPw
         I80eW9ROHYMGL95Jr0iBkQuYB+u3ruXGMazAWoDMLVO+Eq2AJclo2xp/eX0NspuCOA7K
         8BnME/u8LzOdSCXSwurJC/TV1Jt1AhUQpJGHoX0fPGoUJH9MhPvOn2qQTyGQ+r5U/41e
         XuYEOOuQmQUaYsalMSCRRIe9asJTqq2fFbaAhJUfIAhopDQcPV4Q2dl5k/76QT/dblkB
         tfxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795870471; x=1796475271; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gnF98RXlARFo9XyCDL2rqNyyuvHMMADxub4w4sqKGto=;
        b=abtuH4KyDBjFvSqA6VZ6BlJNrIWWliV0VzysS0H45HzvFp52iFmv2plSh/3+5HxodR
         0/FLI1uDF91TvF+ozU3kcjgs2TDl3RJMnE2W0kahomommooxyU71ZKb2FQC7KZiHKLQd
         nppcymj5poVj1rp5PxbBeiGakUuddebKWv0Dftz/Xpn1V8iLswot4d3hdYemmfKbskuS
         qmwhKrhKwAP72wwWgV4FFMtturEvGZrXz0GjTUIRpUsLrpQoGuRkGOFnNLzXGT/GjH/H
         oEK1AMXsBqIc2GsFXYdpeRUl9k3hU/FxXzATsod3AEuHVd2O5QXIPac+hUO0e4PWKvTr
         FRVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795870471; x=1796475271;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gnF98RXlARFo9XyCDL2rqNyyuvHMMADxub4w4sqKGto=;
        b=iffwq3nLbBv+l3qQCZeVw0ta6DjXY1Xx7qm4920z2lUFZOmwBs7bIQzKVNxG4nl4x+
         /5Zxu7wF2FZhUjtt/XQ7Mnbs3DEYcAw/PalCAey0tfwn7YBLbnS8tLcliMP+Dy4/QFct
         YzJDev9eod6ClcORgkyqWf5YKhp6VCUWoiXQhfskgsd3Z3C+yVxcSR87QjRzz3P/Y+yn
         m7sA8YWa+EB3BXHW63lFogz5wrBS8fSF+TQeKmZc7vVQOHYhD0JLc40/BL6LwN5F5HDG
         UlGDbz+YvglZqQhX6EJ8wOMcI+OMI+m5yjq4HkAjBkgNwnayJNZ3Yo8ySAs3TpKDIvYN
         tC8A==
X-Forwarded-Encrypted: i=1; AL+hErGwlCi9YWtueS4kcElxKDnAmQWpU/iK2pC+l8ioH6T+7VuLIf0bj6weV6gxuVuxPzuzN/w9mjPIGpHJpVE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/aIkDAE9GbEr3DAI0dN/fsIHNIUOTdzKeobGDM7wlCY6UjyF5
	k/0k/fZ7h8MpOAUgTj+KCa+CRQUJPvpYOFulNkXMXXMye1lmVl3/z7GlDJEfxuHT2S1Cykyapll
	YQEbmTWlu/XpwvSmt6Vkvm+FnHT+ivoo=
X-Gm-Gg: AZFdTZeRmZTrnLR3hdqyMTWe2Vq+JUbjj40cSnNllfxlFliHhdTGwqPPZJt5+UbR0jV
	8spguV6ejdKfl5+MsN6jd0vFvUafoLoNt5i9m4CDNdJs9tbm2GwAyCsCypCxsOFXKGa/R67q4mw
	CM0/v0ussXe8oezTR7IjmzLkKuNND30ZLpBGH9gy3phguD7YKlofs7WAFzXKP1gb09LS4jMUmYv
	Ubiato7L8HatxIdzK3pqh5e63XyiWTMJfFSRXJFL5mTKh5S1mizTinPrOdlmju0btPTRhIbz8ot
	pnPA7zZYbuTHlb6WOrtEgnC4tNQC5Z64aiDA0T0qBlcisQeFSD64HRkjBTY09h6L6h3D250jBeD
	ykGWOA6VT4P/Nb271KT5y1P1M33ucvi+kf3e0dm6jLAc1qut0m9nE8f0lps4bs9iBEUvpRX3FYf
	Q8acEbHwnoFIMiFjxJSH+NYAb6HfcFCA==
X-Received: by 2002:a17:902:ce0d:b0:2e9:3dd2:a8fe with SMTP id
 d9443c01a7336-2f03f1537bamr267270635ad.21.1795870471414; Sat, 28 Nov 2026
 04:54:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAAHj5qjM7BoGKD35gVCn_XCf6ec-LKq7-5_1YMewOYfskyATjQ@mail.gmail.com>
 <20261126080401.GA540848@shredder>
In-Reply-To: <20261126080401.GA540848@shredder>
From: Tom <tomasbortoli@gmail.com>
Date: Sat, 28 Nov 2026 13:54:20 +0100
X-Gm-Features: Aa3M54ria_od_EkqrWHlDNJ4pZq0kitwSRrAVL5yCqfJ9vqj3aerXEcud_9OaNc
Message-ID: <CAAHj5qj6fcr0td6uz=8yHnnmuuf2j0_1qdL5kto4O1eHT3XCmQ@mail.gmail.com>
Subject: Re: [PATCH net] udp: don't apply socketless ICMP PMTU/redirect
 updates on end hosts
To: Ido Schimmel <idosch@nvidia.com>
Cc: netdev <netdev@vger.kernel.org>, David Miller <davem@davemloft.net>, dsahern@kernel.org, 
	eric.dumazet@gmail.com, kuba@kernel.org, willemdebruijn.kernel@gmail.com, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello Ido,

> This is intentional. See commit 4c3499f79f8c ("ipv4: udp: Create
> exceptions before socket matching") and commit ac76cab50e89 ("ipv6: udp:
> Create exceptions before socket matching").

Thank you for the review and for pointing me to commits 4c3499f79f8c and
ac76cab50e89.

> If exceptions are only created when the quoted packet matches a socket,
> then an off-path attacker can probe the exception cache to discover the
> ephemeral port of a connected UDP socket. This patch reintroduces this
> side channel on every host with forwarding disabled and breaks
> tools/testing/selftests/net/exception_cache.sh.

How could an off-path attacker probe the FNHE cache to discover the
ephemeral port of a connected UDP socket?  Prior to ac76cab and
 ac76cab50e89.

Thanks.







Best regards,
Tomas


Il giorno gio 26 nov 2026 alle ore 09:04 Ido Schimmel
<idosch@nvidia.com> ha scritto:
>
> On Thu, Nov 26, 2026 at 01:31:05AM +0100, Tom wrote:
> > ICMP error messages are unauthenticated and quote an attacker-chosen
> > inner header.  udp_err_update_exception() (and its IPv6 twin
> > udpv6_err_update_exception()) process ICMP Destination Unreachable
> > messages with Code 4 (fragmentation needed, RFC 792) and ICMP Redirect
> > messages before any socket lookup, calling ipv4_update_pmtu() /
> > ipv4_redirect() with no socket and oif = 0.
>
> This is intentional. See commit 4c3499f79f8c ("ipv4: udp: Create
> exceptions before socket matching") and commit ac76cab50e89 ("ipv6: udp:
> Create exceptions before socket matching").
>
> If exceptions are only created when the quoted packet matches a socket,
> then an off-path attacker can probe the exception cache to discover the
> ephemeral port of a connected UDP socket. This patch reintroduces this
> side channel on every host with forwarding disabled and breaks
> tools/testing/selftests/net/exception_cache.sh.
>
> > The resulting change is stored in a route entry's PMTU, which every
> > user of that route shares; on a non-forwarding end host with one route
> > to the internet, the change affects the entire network namespace.
>
> The exception is created for the quoted destination address and only
> affects traffic towards it.
>
> [...]
>
> > values below net.ipv4.ip_rt_min_pmtu are clamped and locked (see
> > __ip_rt_update_pmtu()), so a locked 552-byte PMTU persists until a
> > route flush
>
> No. They expire after net.ipv4.route.mtu_expires like other exceptions.
>
> [...]
>
> > The in-kernel ICMP rate limit exempts fragmentation-needed errors from
> > its ratemask, so attacker-controlled entries can be refreshed
> > unthrottled.
>
> ?
>
> These rate limits are for locally generated ICMP packets, not received
> ones.
>
> >
> > TCP drops errors for packets that match no socket (tcp_v4_err(),
> > net/ipv4/tcp_ipv4.c); UDP should not be more trusting than TCP on end
> > hosts, where forwarded flows do not exist: an error that matches no
> > socket would then change no route state at all.
>
> The exception cache doesn't care about L4. ICMP errors that quote ICMP
> packets can already update the cache with no validation and the
> validation is minimal when the inner packet matches an unconnected UDP
> socket. This is all explained in the commits I mentioned.
>
> > Fix this by only performing socketless PMTU/redirect updates where they
> > are actually required -- for forwarded traffic on a router
> > (net.ipv4.ip_forward enabled on IPv4, net.ipv6.conf.all.forwarding on
> > IPv6).
>
> ICMP errors about forwarded traffic are sent to the originator of the
> quoted packet. The router forwards them and they never reach udp_err().
> The forwarding sysctl is irrelevant here.
