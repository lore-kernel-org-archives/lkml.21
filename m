Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795122912;
	b=wHgtkOVFkVnLv+84p7zwRKhmLNYmX2I6M1ZmS3qKzyEJ7lNdNcLsoF1Dyvxd915FemYD
	 jIuwgcLhAnTv6YzJjEN9d9CkItqE/Bea+6zVIsOj6g6t7Mcel+FOPQI8MY4hiQkNCJaxn
	 1vOOg9JIDCIfhe1jVXXiMdIttgoxup+j2XmXOztJX3tbdQFoHnFfcvoqJOY+xY7yJHK5w
	 x5wyFIZGDMZ3JFI1tpym3XN/VbZbvyvpzVT6vFrF7osDAtdNoqf85EsJGPdfcMde6DemT
	 5t2VPSEtNGMUlXy9RqyY9lKe+mKRBxMDpGgLGw68s0kJSWrY4ik1xm3Pt008XuvyC5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795122912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=L2RyQcOZXF1NiXE7RHnhrWrwU4nZkf2kDZOAz8z7ouw=;
	b=i21qVON3feBZuPxLWLVqRnyF7IN3wL7Uw5SBOujSiw8eeb/7984BuyGCNoPsiMkPoRd9
	 b59K6tGklgTyo32L+4HTzHlvH7nLPlJZHulBd+P1cXlXv21U3KGCOhxf6t+lgygQRbKli
	 qyAATr6yAACP8Hv8ZHRZ4BoiC90Exb2/wb6aJakgLyYMa6zoQZu6yZnRIaWDv225C5hEm
	 gSTBb2Cd4IG1+o7v0dopwl3w5CA3nuuqoEYmNYb3c1Bea3SZQOVjOKh5Hky87V5ew0hjd
	 2vujtf3KANkzq9vptdqLcpWIMQ+8ZCL0gMOoQlrOa0s9mueV7Lf6/Huzj3dTmHNamyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YVWDHW7i;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789C960A2611
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:15:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 789C960A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YVWDHW7i
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-536717a4d83so1862351cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795122911; x=1795727711; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L2RyQcOZXF1NiXE7RHnhrWrwU4nZkf2kDZOAz8z7ouw=;
        b=YVWDHW7iCruiAOVwlcK6OzpMh2PB/0sv9z5Xf+JAVkcE/WMJg0GwVnSHXpXzus1PE5
         qUqRwEWgmFfXRut2f35BaM7a7fSfFj11mOFC8fTBL8hWjCNj8MyVjih7g+nx/+yosVyI
         VumBeS6oyLOhGSovEzCCCMnix/7RFsuYgn6zqOKKiBevPMpgW52zYEsTWfYviM/0/K+R
         94V996npreb830xbhrb/gmJJ/AtFIb0TINW2R/RCgGwbZif1sCDEzDk5xa5CHm/BqhLd
         CEs6Bp9PGpvlkI3zdqgR3FSqd9OOEnATMzUufQgSKTOiMotPJQPiHXAgQbp8PKffiD4a
         JoDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795122911; x=1795727711;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L2RyQcOZXF1NiXE7RHnhrWrwU4nZkf2kDZOAz8z7ouw=;
        b=tOWN9DsQvlTfmiAyS2dJhxycnfFI0RgQvyIYv19+YsAyNG7M4Qv4zN/3Feo95RzNwv
         Yit/BItUl/Kodd4dzwnyt110Lw6vl3VW8SgLHr3xUSYUH6nsIaRUvcnDB0sNUSuWqTfo
         1pFaS/Wbtdw+8i/S1+/SbloOZ3GWU1cWhwdYxOXK6/ExeOdjgRfrv+Y4woiaBI8Rp003
         mPVl1MG/36VSilo9SBetev1EC6qRdacPbZArRGdp/OzenE+7J46XgqF86BzBoSi12DqB
         tuo/hcDEWr0VvRZo7Rmn2DEsD8rgWmjf1krWNdGWON+V4Z/SDA+Opd54RJgUrA9repyt
         XsEA==
X-Forwarded-Encrypted: i=1; AL+hErGN84UyW7wjcMxM1IrPWKTu8aJFlU2iz5HCKMoEFQjQl94WpPHP58cZH3nfzWIV1kF7gqCDJAV+ojHRd+8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qRhwrFULmfhYwjnyWS2k0yMc9y83HaGNrXaIuZQj/ctD+h/rx
	Wf61KnDdPeDLbZN+rBo0T3WqIVUlk36IKpCjB8QjLvYcYHMZ18pJk8wl
X-Gm-Gg: AYBFou1P447Uh+NjGROZ8baoXJqHSiJZEk7C55x5seL6Eh83i+mvZp92xm9rWsX3wa8
	N0sj3jVpebA+3rvtxbXgHJ6BEDt46WJVYN0EoQMrbg6Abbvy2gCinzLJeprVyTf+Q1dC7ty/u1R
	LgKQqSloJkJb0buGSasEspF7Ihu2nuUQaBDIClgFLJ0vStjA/b6NPwnIiIHfVD2UKlL8S2cp/ye
	drEUyPuBW8lvuzGBxpdOnPd9qmNEu/GBlHDfFLo4wXNUzQ443utQPFYXkS3AzpaE/6x+pyHn3su
	pvyskbnTcwA4fK3A9gs+sgCnTNgfRycchalBsNu2ThmgdJ498mmdMEdqZ1fsrcNdgTrgYROLKRa
	INo7cQ0kMx35x09G9a2PIkAitu11ED6xhWvojQt2OsuOyJWjPKAZ3IeOwd3VEgJ2iBNMC8jwL92
	ErSKKBFgd4gp/tReUWtfCSjwMdJfXJPOtPyI6fLypar+er+TPq0KlDn1cljX9ztA5o+/xeNQXFP
	ctDrBOL2ILHiFNIzxkO1c1n1x9NTapbXWOx5tVU9LNqL4c68qACsyCrrFxLc1DbwQJN6vmu9/1i
	Bm+3pniso9TUVm1KdKJmiirJhXbUVi/x0CUhlFrk9APAkwbNJqZCFr+NxR5wrlpFc0u4CzBjR4p
	pyR/gl1QHinWq60kDZh2sOfUXIdMhqBGyBf/wjvk5HpszZW+2x+jYdOutzJN2nrzT
X-Received: by 2002:a05:622a:178f:b0:531:172f:79e7 with SMTP id d75a77b69052e-55d76a6595bmr21615331cf.39.1795122911021;
        Thu, 19 Nov 2026 13:15:11 -0800 (PST)
Received: from gmail.com (15.60.86.34.bc.googleusercontent.com. [34.86.60.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788116c9sm5401731cf.4.2026.11.19.13.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 13:15:10 -0800 (PST)
Date: Thu, 19 Nov 2026 16:15:10 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Junyoung Jang <graypanda.inzag@gmail.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Jason Wang <jasowangio@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>, 
 Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, 
 Gwanhyun Lee <gwanhyunlee@gmail.com>, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
Message-ID: <willemdebruijn.kernel.138e4ccd85cc3@gmail.com>
In-Reply-To: <20261119144241.360238-5-graypanda.inzag@gmail.com>
References: <20261119144241.360238-1-graypanda.inzag@gmail.com>
 <20261119144241.360238-5-graypanda.inzag@gmail.com>
Subject: Re: [PATCH net v3 4/4] selftests: net: check padded vnet hdr_len in
 tun and tap
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Junyoung Jang wrote:
> Add tun and macvtap write tests with a 512-byte virtio header and a
> 14-byte Ethernet frame. A hdr_len of 256 must fail with -EINVAL
> because it exceeds the post-padding payload. A zero hdr_len must
> continue to accept the same valid frame.
> 
> These tests exercise the common header parser through both drivers.
> On the unpatched kernel, each oversized hdr_len test accepts the
> packet instead of rejecting it.
> 
> In x86-64 QEMU, the patched kernel passed all 105 tun and five tap
> selftests, including the new cases.
> 
> Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>
