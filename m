Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795384948;
	b=U31z3i1u+9EeSMIFqa94Ej1x3iZtrPTjyDqnO874CYTlfNIE4PGPMsgLpyU/3HDnCOcP
	 7w79WPjuX9tHpI9bZaIzeT2Phb19WKwNVn936q71wC+K3MfZQUk2DVm6h62HZwZDx2Hm8
	 hJdizv0d4ZKWcUes3zAXs7p26/jhsnqyY/Zv4qJxWUCcDMAXOgbSKYB7aauiKXRxVSJ11
	 tkqN4qjgFg08dT4RNdb2Qn/s9Tqgs5VDYbtu2nz9sesaJsu73RfKaU1TsVWrMoE9aVQqF
	 AnAjwwIiaQq9o3Y1KJBkg8Kfj6S23t7ZYm7FQunU+wEJ/LHdArt8iCJgWClp+9sjM9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795384948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=4UxiOydDwa3I67Iaoew4LDFIsocWQ9uqy+MKnlF8rqM=;
	b=Fu9XfQ5i2xNpMFLlT713ERWrRKLgZPlGT/xx9tU2a6pNOmsBPTHtdMlhSjoT6/FP77Ud
	 MW09jDs5fe9EF+t99umEoH5dDjq0qnhKeUhYHrH9sT/VuLYow9VxHNexDbWmKUnZGw2dK
	 AeBLSm7mTotYn3WwsmaJ23UHtAVaAGmcYxdZY594OFw5Ih22oM3rwYnP6pkK7h8h2w50b
	 rg4+EIa9pN6MZfv5nC3y899rLZVdSunwReyjLLKUHqWNcD5u6XmeDlAlUo49PHX31h1Ht
	 NH3ii4xOacqsdWDbMjSHFoHfVkWwSm9QYeQovwnOK4wwybc7CNFzvZ5z1t8Fci4Cvwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nzzwumsk;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88EB606A331
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E88EB606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nzzwumsk
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so22537635e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 14:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795384946; x=1795989746; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4UxiOydDwa3I67Iaoew4LDFIsocWQ9uqy+MKnlF8rqM=;
        b=nzzwumskbK3DA1kPojxI22aHsM2COpjXjLFnBJuYrFk/0c63YJwNaGpbrKmcnE74pT
         eAEJ/umE5HL/9r9XOiZen2xUSPR/A3boXva0K9D04xfZwoM4hPEBWzodL1yiKvgDV23H
         AlBRos+7VDWwK07OAvBHmlj8OlbUhF2uHl5hNmKOBf370uXiMhxyV6WiIS30kw3SeT9d
         n3VL2jNJlxmEXhs8XAE9M63xj+iJOX4uCWCMlXhpuhJA8Ssjvqqy8GT/HSlecQ+oEMRN
         UliV0idfmxBlSPPG2nkh0fPO2DvFq568oCdQZKyO5mNPQgJ2v5PwYThsuSHy0p69jSqb
         46mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795384946; x=1795989746;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4UxiOydDwa3I67Iaoew4LDFIsocWQ9uqy+MKnlF8rqM=;
        b=FVEwCXTzhsQBWJynaTqHtdqivvWT7k/3N6Y//5XSVci4gEuFzTa1gv68wE/4yX/anX
         BlLxVeQRQIl3bGHljiP/fNYlG+/DmDVdxyCnfMFW0iDS1Pnm/K2WuHwfoa4qvULralKQ
         r0tcG4gBljRZcMWQtODZKGikt4ZS33NaEG/tX2404Mjp8wgwEWjbrkpqLchpJFfq2yEA
         909c/Imqx8U2TG+x4OnAYKlv5twwOGweR0D6zJ1gWjN/UD7v5yYRGZn1O+hb98QyWGTA
         Nb1D1DDulWBbHgPx6Xfp23m1Env4HGdEwVtW38rGrg4bETfoyM1wqFAKZlhgMO05X/RT
         +W/Q==
X-Forwarded-Encrypted: i=1; AL+hErG2ccaps3ZypQLMkK+v6XCS8ZI/ejxCZitzQjW6mX5KVqWZ+cPwtu3dpBCcSwLhC8zSjarfEJq9zaVKYpE=@vger.kernel.org
X-Gm-Message-State: APuU4Z91zJNjGsUIjPnBQKxiE9vw6LxGYMZHCEuWhgjCfqCciylZQsMu
	h9dG8OelszgD+qZHBmt9Z7m2jYerJdGFnWSoZGtKVVSE6Dqi+o7GctIw
X-Gm-Gg: AZFdTZezR4RjoGbSxNKfvKrkdr+UxC2H43VyQ3Q+FiSr7Ti6K15Yth4xU0tY+OiCVOI
	tzkAKkAwnGLZQ2td0vDIzjjWpvAA6WQrg4dGZbbwXPr+oxJvraGHS+IKj933fcrdnOwnZGJKnPj
	U8SeMz4YsOwZPI0376Og1EiA6pFW3/O/KdFsjxglrdx8xjK0VETEG+28mIIs4wG0w5qIsIlb68Y
	ltbEsGLXEUVaglyuzgVrJfo2LEj9vg/IQxsivPyMy/vWX4sZA49ctOW6kH6TBC3Y9r9apfuYTjL
	juYF4LnsMSq1843C6YXf6I1fowGsLJUywVURs17AY50tK2M7oM4iwVprhm34Zue7xnW1y2feMMv
	XMdzv046Oks+44wnXU9vRlwbLwAEcE22xGOQQ/cozupTXrybX4+KN48ftTqkA4N7DSODAqT3n3Q
	9iSv5L+WxoTSzeD72lumXkPkbvkW6eQH/iYpmiTnEcBvWDpG3nokIGNGzuirMTnhBLGeYnpsNf9
	WDRK2M2M/H8jHqYV3/GztrsA3mv1NQ88w5nkmOO/RrWGU77rz/Shjz1wh1dmh1qzWPJBZf2luVk
	3dZwRlE6PSIxi+EhxMcS0IrhBEFX9K4SxZCZunMT
X-Received: by 2002:a05:600c:1c1c:b0:4a2:1364:252b with SMTP id 5b1f17b1804b1-4bb8892ac4amr217905975e9.35.1795384946093;
        Sun, 22 Nov 2026 14:02:26 -0800 (PST)
Received: from foxbook (bfh118.neoplus.adsl.tpnet.pl. [83.28.45.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf61e8sm19676778f8f.11.2026.11.22.14.02.25
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 22 Nov 2026 14:02:25 -0800 (PST)
Date: Sun, 22 Nov 2026 23:02:29 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Erik =?UTF-8?B?SMOla2Fuc3Nvbg==?= <erikhakan@gmail.com>
Cc: bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: steelseries: Add support for Arctis 7 (2018)
Message-ID: <20261122230229.1bdc3bd0.michal.pecio@gmail.com>
In-Reply-To: <Rv7nePC3RfOSidIKv_K-KQ@gmail.com>
References: <20261121121129.2a1d3013.michal.pecio@gmail.com>
	<Rv7nePC3RfOSidIKv_K-KQ@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 22 Nov 2026 19:32:53 +0100, Erik H=C3=A5kansson wrote:
> > URB status -75 is -EOVERFLOW: URB buffer too small for data returned
> > by the device or the device babbled (exceeded wMaxPacketSize). =20
>=20
> I can't reproduce this locally, neither with or without USB hub.
>=20
> But it seems someone else is reporting the same on Bazzite:
> https://github.com/ublue-os/bazzite/issues/6344
>=20
> It seems the hub itself reports that the port is disabled, both in
> this report and in the bazzite report:
>=20
> "Nov 19 20:47:58 [REDACTED HOSTNAME] kernel: usb 4-1-port4: disabled
> by hub (EMI?), re-enabling..."
>=20
> "Nov 15 16:05:59 [REDACTED HOSTNAME] kernel: usb usb1-port2: disabled
> by hub (EMI?), re-enabling..."

Per USB2 8.7.4 and 11.2.5, hubs are supposed to disable downstream
ports which are still receiving packet near the end of frame. So it
might be that the device (at some point) never terminates a packet
at all, or its packets are too long and occasionally reach EOF.

I suppose the latter could happen because the host schedules the
transfer near EOF believing that it will be shorter and complete
sooner. Scheduling may depend on host controller type and on other
periodic traffic to low/full-speed devices behind the same hub.

Or maybe you are missing some other detail. Just guessing.

Regards,
Michal
