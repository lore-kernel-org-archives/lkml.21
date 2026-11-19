Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795073935;
	b=Qz7LCwwLvvHn273+XqHO57rvbUfC4hRJ6LDGBZD9okPTFKMAv1o0GEuhDPOBrv9Xddaj
	 yjVMHOWQa5Ut2kYzKsKQDE3LyMGz9GISC/iVEZP8OKrkZz+NRpvliRrEiP9WEuGgon2eR
	 aCJvdD+MlW9wYrSK5pFbePV2JrDg4CqysTQl51LeRTB6iUwnGhJC/LHahf8BaixcidcKz
	 6lx1T5JZREj2ZEh3SxS/mGG0GCmqbOjHFYKLHPt4cfo0K6dsc1t4ZcBUFrr3Nm0Q9V5IT
	 juwQmhO9NssR5X7LjnXxDCRnl2fb3lHIpgXLoosUbgqEbHryQBO2JvgMlFDd6pXRNWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795073935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=FwcHmJgjwO7Wx8jngr2JVYKZYHOEfqrD8BdaI3p/Vp8=;
	b=DJsfeA/YMiJ1wFDHcj/NHRqETHmhfAhzggvamKyTUeRAW/1OycDeeEkNe17m7QktINsn
	 gJ3yfdOrmtYKYIY1HOBc9/46MkMKZaE7RVIoihoDTR91mW6mRz9TbxcFAN4orjzVAwo7G
	 RSMeMKh1vvh15JFiz/QD4TOgvmre7zStHLjbtfo3pgy91KGlFphdDYynJIJKIOC0BPlp9
	 VrLNzLkaHLSPpDVX1Jmfi75CAF+3ssFdJU57piqS2jfqofB4bxvarlzrjViZWI1ovRGFd
	 872pggxWD9PyamdBCGfQadHBF4eZTAwjZlxZoeuAUVvZwpTg/l7wNTXK12SO/Y/ehxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hVQ20Kqv;
	arc=none smtp.remote-ip=209.85.210.199
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DF2606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:38:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42DF2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hVQ20Kqv
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b60129a46eso2700474b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795073935; x=1795678735; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FwcHmJgjwO7Wx8jngr2JVYKZYHOEfqrD8BdaI3p/Vp8=;
        b=hVQ20Kqv6v+JLij33D+FsamJTZdgY3XvFx+3H0lAV6O1JV+GbTZzZew5KD3Aspaar1
         4csbMngNkYtdC5NN3YrMCUA9MTjMdV1cOLf151Ajndx1zZD9qLGvRYWMsMUmoL2lEKdy
         zIjDMzDuz3YZZVsQwYIwSazGZD61u7iuyg8Z652Ly4L9at9uD8KQ/h4z+/blg7Pg0JT2
         UHLECkIKM1KXoMrKc+0xVMeq9x2B/2XDeiRjDED0RF+21QJ91RAIN61WeuGFbjUHQY8D
         +/xAN4i5Yu/jjtrRkZ/BYTPoI02J2vY83yB4VccsSOETuf8rDwqoGtjrbxDVRUGKMvpz
         GOBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795073935; x=1795678735;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FwcHmJgjwO7Wx8jngr2JVYKZYHOEfqrD8BdaI3p/Vp8=;
        b=Oe12DHZH+9NGNcv+H8qO8H6mqoJwwPYpPfgsGsNS0x3qutwLurC9m5gzuzYpJvJUI0
         SJxi299YLsl8FSHA1y0f6p+cgFZnnT6cMnsULtIFMbfxX40sPjaOOSZ2tB3riLbUT54s
         haHfxDdZgTrpGW+2MXqZU9WOcI7Kq3CRZzNrnKO2VL1PTPlNA4qKWOMMxhisDfIzdc32
         vQ2a09JFHKSwXBnc0uIghA5LraBDiceOjMBJKf7Af6//Yo16AZ8bJj9txt9kYp7G4/S2
         8ASDdyg2qbmHe97T/ufYF/Lslrxy3UcgkayvTPRjIdvIDvyMBtE5VvsN0DXaPvCk6yOk
         WIDw==
X-Forwarded-Encrypted: i=1; AL+hErHLcfLNYIULKGznTvr8cFlG4r6zvBAijtkix0iCha756qLITC+JEejP8CiynOVPD2g39SSDKDrWa01xt4k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ngTghaOEb90i9R3nYZilW7xdf6yJmQZKhB65be3zgGs71L9qe
	ai7V1Mxqrs7OiMwCQVqp45HZjBZx3aagf4zjMd19SS8rSI+BOWLX5eSkcbRatzcEh50Mi4KYPoC
	uZmi+jw==
X-Received: from pglc33.prod.google.com ([2002:a63:d21:0:b0:cc7:ec41:d571])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:4321:b0:3eb:aeb4:2c2c
 with SMTP id adf61e73a8af0-3fe86fcee52mr6114463637.4.1795073934482; Wed, 18
 Nov 2026 23:38:54 -0800 (PST)
Date: Thu, 19 Nov 2026 07:38:54 +0000
In-Reply-To: <20261116200854.3799498-1-antonio@mandelbit.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261116200854.3799498-1-antonio@mandelbit.com>
Message-ID: <av6nhGkOn3XlAA1i@google.com>
Subject: Re: [PATCH net-next] net: use inet_rcv_saddr_any() in udp_tunnel and ping
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Antonio Quartulli <antonio@mandelbit.com>
Cc: netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>, 
	Ido Schimmel <idosch@nvidia.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Neal Cardwell <ncardwell@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, 16 Nov 2026 21:08:53 +0100, Antonio Quartulli wrote:
> udp_tunnel_core.c carries its own copy of inet_rcv_saddr_any(),
> sk_saddr_any(), as it can be built as a module while
> inet_rcv_saddr_any() is not exported, and ping_bind() open-codes the
> same check for its AF_INET and AF_INET6 sockets.
> 
> Make inet_rcv_saddr_any() a static inline in <net/addrconf.h>, where it
> is already declared, and use it in both places.
> 
> Suggested-by: Kuniyuki Iwashima <kuniyu@google.com>
> Link: https://lore.kernel.org/netdev/avVVzxL3pVZc6yQ5@google.com/
> Signed-off-by: Antonio Quartulli <antonio@mandelbit.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
