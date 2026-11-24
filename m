Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795540255;
	b=JS9Mu6Spw/m53rl7eJ/MIgK1jm5nHUP7Vu9FO70NpQNg45OMsxHuXqBDwp9Knt1xDztz
	 0C65ILEYYy0teeiV/VdHGggwnhylBPHlbMYlz76Uk/nKiHsAjlFt9U1X4a/YO5m1540PS
	 alBGqBrlNqoebcGR2s7Rvxa8Zszn7k9jKF5Hr4M1vy0pRmfV1Rh2PfuLVs4FjDk1/6WTO
	 HhlWaAhadr05DG7laP1bpFcgdMBVFHDWSXn5/+I4nxNJH8naLM6wKOHIHOQpppb79ydXy
	 eIMh4IIyJ7zByW5DxWV/P1z3lLU8Ex6mugdn67umjlmiotzsXTZyJBOFqXGGVHS3Yww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YD659iZbhB9OAfnpI+8tlGtmEiCdl2kb0qCNC7Yp8ls=;
	b=aBH8XZ9T+zdQan4NhtGeYvuMCXXpwnmcIfwA+/eUu2OFWpDN8ZesN9lAkQuKAPpf3J4W
	 4BujZ5vhAn7Z0lXSoMRYfkkwt3129zz54ATKFivMueImQylpabbe6zm08q6TbKfDOzG+h
	 GbZhWtQn19Dd6XmSnNDBkMZ5k5EvrL5yi6PSm8WNniD2XRhOwAR6WA5uev8UXBIfpancW
	 J8KZ/oCqnHTQkLB0AcOrGJyA1mS0JEHtcoAOs5/hztzgmU60FlHH+WzXHitHt/SLYdTXu
	 RWoE4Qyc1i0/LtGKkT7b6thQW9+FNlEn90RqgwFWFqsGrLzNPB9AL4b53QdzjOio8Aw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=XGZP1B9e;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4B1606E172
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA4B1606E172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=XGZP1B9e
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdb75699c7cso1837971a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:10:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795540254; cv=none;
        d=google.com; s=arc-20260327;
        b=oMsoGxU7ztFNLBl40xMTK7qUkfuW1Qoasg/bn4mI5/2I7knConGl4Fra8IbV+EsBye
         ycoDAurIXIOEkZaAvNbOgdi7yWsqNQjALytKikbUsXCH02EXUreUQbg7hsjroV1iEhtq
         T5o5tFw57o9kPubjzhEwwPFkpZEn08yLcKHy9xilCtE/C53emFO2zz5sXY2l/1hlj0BF
         QlaJ3/RYtDknX3VDIbWVshKiXdyhzdJqAZvriayMRsJriY9npGK2NDqAOqqP/plLXxzE
         GtZyTg04FTAgXOjNHhxxauvbbcZLyFQyKvndCSHWamYTKRr3mwpWwOQ6yaPG3vhz+vos
         s8ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YD659iZbhB9OAfnpI+8tlGtmEiCdl2kb0qCNC7Yp8ls=;
        fh=eKD4aBJna7xvKtEQ2NnctORx5l2bAJWXbp1EukUZ4AE=;
        b=a/ixe9hma8FPu0AZwnoi11YEj3gYbdgVAzovVvRMfXYTsDInOItek+o/Nibv/Sd/U1
         U1Kx0L0r0Q4Mc2DqR0Y+Fv6Ipbqwob9UxKcxS7NkfuAkEXXySXBWxER30C2Oy3ZTw2JR
         iBUeurFefJ1E19gXnlGgkpiakwpLARlGUPHXkpx4YvmxMZOF+sUFSzV2zzp8xT1/+8T2
         S0dvk7PX2WTr/O6pl9xUEQicE2s4ss/BxJcZ+FhqfzwIn7DqLZSP+1lSxg+ZJ2TNQqrT
         AUaqNMRUZrsLvaTHHP7+cAp7jHJe0/KplrSiGFIlU3hIfFkMkSw2AW0hBySFaT5GcgYt
         7QaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1795540254; x=1796145054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YD659iZbhB9OAfnpI+8tlGtmEiCdl2kb0qCNC7Yp8ls=;
        b=XGZP1B9ebdkS8ePIk89ZuzQ1iCcHMbjCNYVdkW1Ikavfb7BfPm2cIFvIY/wrKRe72B
         sgtUsrG0y94ks58sAPWoPUZbaXTVzgig7BodyAWi6buZ0/NCmjX8E7Xfnq/JXDVG1uOG
         gZmhWdPv5Y4dY390ZwAB3s+ccss4ZSLw2/FwNYsfSGt8q4qrX7ZMBdKbJIYEOW8LtS7z
         Npr7U/WjzZAIMnhBXhD2TiYX3sPVYyxAi7D7cu4ltg1q/lUVnLTeEwduU2vlu+2Pccuk
         wuolouFPHsPqHmaPGaztToyeO/jvTkDu6eHV/VvaKPn2hibcKXvDCckQQZ30iZidEfwA
         ic6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795540254; x=1796145054;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YD659iZbhB9OAfnpI+8tlGtmEiCdl2kb0qCNC7Yp8ls=;
        b=WCapCdK5vj42Jvcb0BmKdAFw2rAGmzDVPi/PG2u9zIfuoJVlqLCugD0tcY7s1hs06f
         uU87QLMHJ29mw8GHNLstuQoxt/m845z2q9rufRBwzc8J5tRNL6oL6cI+L1WAMs93kfPo
         QmDVAswf/l//acEmLmaUzscY6W2zb+xILyQdxTIZyiaQ1cGi5CQYEFnW1Jz8j8CV2gl0
         8S3YFA57viyBZykJoSiuzlog0sc5l1adkEZUt0yZJML9cihTZ1Zyt4OSB/5G2lakjiDn
         GF51W1D3w69SeHA6brbkJH/Vn+7lpbmHiNSYbNtwCcTGFeceN2fVGrT9mIiMl7FgCuBh
         JeQw==
X-Forwarded-Encrypted: i=1; AL+hErHIobT30qB81WiCbSrMigsqrcbgNapNMBEdGNkv28YRFzWxH4ylX1wDSCawEmwJ3Ort6ftBI7fmM4DyjZ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Fcd4H19poYB+6RFSKCcXufDfKxMTP0XaE6Wm9K7gNRoS875B2
	7gDVtjWgAFRkUACZFZ2B7H2H1vPhphWboIijSLKi1Ey31VB10FGpTDzRdgEOD4NvIWOR6k1WKDt
	1P+nde/mHPUXxR28NrG6tKId9w9QMp+RF0mHy2A4g
X-Gm-Gg: AZFdTZfphgAH2Mqs71xCfrh/rWqJEboXDSavrWKjBQjRePAEBA1DerdKv29VIOaOXYu
	p2zpreIb7adv/KORZl+ZuoxEu6wzjAlYs+HL6MmhN2OapKFJUBjcRn5ez3AHtdl9HyzJwgPHlHV
	0D44+yLiPrZjJ+P9kVx9MBw1vWMY8UDMqt8lZPKMyiqxgPjbf8FkBuF3sMSP7QixWgrx2J5py8r
	fq34pNXbI7kWtE8zDZ9JOEpZeLqP6UEWrVWuE/N9Za2/0o19J8Fri9HbzGgadrffXkV0/SA8dEb
	Fk8mK8+JOoXKzzmmEvDdr7QGctCjqYsETVB8ujZfE9XFjjp+MgBG0cfPjKa1LVmW5ATIewBkZ49
	KU3EXe6v31fxY+ZyQBqAfinn7Wc8ntqn2I7RUNjCMFDk3dSsATEDF4JWFOslz7pRaHP3x
X-Received: by 2002:a17:90b:50:b0:3b0:9e2c:9b5f with SMTP id
 98e67ed59e1d1-3b41c7b6044mr14858398a91.2.1795540253878; Tue, 24 Nov 2026
 09:10:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-x25-v1-1-4432d3892f8b@gmail.com> <c70bad57add6ff8cd52125c698f3f54a@dev.tdt.de>
In-Reply-To: <c70bad57add6ff8cd52125c698f3f54a@dev.tdt.de>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 24 Nov 2026 12:10:41 -0500
X-Gm-Features: Aa3M54pQl1423xvicd2W8eKUxg-iwZ3pBcyz1tFldZ8tVNfr4v2hJioLBtMFymY
Message-ID: <CAHC9VhTLg2FLNf3sLe3+A=q5Mo4gKs+gB7zi5sQT1jizsOPuNQ@mail.gmail.com>
Subject: Re: [PATCH net] net/x25: inherit the listening socket's security
 label on accept
To: Martin Schiller <ms@dev.tdt.de>
Cc: shyckless@gmail.com, davem@davemloft.net, kuba@kernel.org, 
	edumazet@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org, 
	linux-x25@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, stevewong@hust.edu.cn, 
	kaixuan.li@ntu.edu.sg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 11:44=E2=80=AFAM Martin Schiller <ms@dev.tdt.de> wr=
ote:
>
> On Mon, 23 Nov 2026 01:31:20 +0100, Suyuan Wang wrote:
> > x25_make_new() creates the socket that accept() returns by copying
> > fields from the listening socket, but it never clones the listening
> > socket's LSM security state -- there is no security_sk_clone(osk, sk).
>
> Thanks!
>
> Acked-by: Martin Schiller <ms@dev.tdt.de>

My apologies, but I'm about as X.25 ignorant as possible, so a quick
question: the x25_make_new() function is called by
x25_rx_call_request(), which as far as I can tell is on pretty
analogous to an accept() operation, is that correct?

If that's the case (x25_rx_call_request() acting similar to accept()),
cloning the listening socket's LSM data makes sense, but if it's
something else we may want to leave the new socket as-is, labeled by
the process performing the operation.

--=20
paul-moore.com
