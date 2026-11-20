Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795184326;
	b=Ab+44mLvR3mOsEcEvXN95FHDHU8bSOBJCLL5led8t+BGosH8wQdfNgf0gfkSiw+vzZIU
	 /C9H4TAh7WVDNqFSqXV0XNQjQdpNJXMSZ+KgRNx/+QBS5+5Wx4kZ4Gr5Q5ro6bNfI587/
	 4/a77CQEga6UJKsVrhT7JQxPa073PKOBLhFbKieiCD56FF8fBNNgpTWVzKZSrX2OnStCS
	 bMcP27GbUFtekiRWLywjB13hfVwkv77HNjaRGfwulyEtKvoxIcmq/VRZbRycm/0Pn4WY4
	 wr65Zi0DZdC4UjZgz6/YoSepmtM6D7R2qVyCKKADP8MGD5QVLqQDBJSTWwV4wcd862A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795184326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Qm85nREb7P0agHsSS2w3wnffVDPZdu6tF713NyJ40SQ=;
	b=urGFhIdZ6JBpXfbmx62ZX+KCmW0a5uPJsw0zzZYMeoO3gSnNtPw5oWVaSVI4P4+z7RUv
	 pEFU6HzTgwenFdwxDzspADa07wSOHHaACJYdlYspLsIrelvgivPspT+8QR/r8nVBJ7AN8
	 cbBKa2lL/6UFlyL+EXBd260pPPhoz4C1y99Uew4kp2UR+Zqu2ueZgW1ttDYPjQ+VhN4UH
	 QLFKiizZSe4LQBuareY/TTbxgxCRBgonWNtU4RlRTtoQTRo4o/vNRz30CVxB6zf5yBCjI
	 LP0am9mRytt0k3loDxbqLRe5kDfQvPUEcVJjptnQu3rmPNU1KxO/ri1PPwmVHVGwawg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S2Ub1fv4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9E0606A33E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:18:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F9E0606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S2Ub1fv4
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-677bc4704cbso1225205d50.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:18:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795184325; cv=none;
        d=google.com; s=arc-20260327;
        b=eXpWuO2VC8wVooXkgAswzCiimkiUgDRtqff4XuScwPMCls7G4qwWUhfT/o0kPZtVGp
         m+P0RvaS7lJ8mBT4+UOQAiK9Qnk4JO3NO4dxO9Yp6CT3NMehs2lYdu8pI79HK3amsVhE
         7q6W/MbpYt6qtGquRrD2CgkOKV6dJCOblprXV9f0Yf7bp4kSuo6PBtjQrUY74b+/Cb/h
         rIrlidijOIw315sOCCH09ymWkejjya0AiO4lRDddgRUSpkfWDWHxlvlK5aoBqreHEUHp
         BfwbT4VjJX3ODjhF8EgmuNL/eDFjIgRU+PuFGzpiFuMD2cY05O7PQeWiun45WroHtSVA
         wWVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Qm85nREb7P0agHsSS2w3wnffVDPZdu6tF713NyJ40SQ=;
        fh=XGXV/AJ5BrydkNwOh7+C7LNX7dNkGi1wNd5s3DTuytc=;
        b=IfJQ+DmxFEsGNMxRlSaJoxf6DupICd1uKi6BScZXxrfuUbrBBAV3gCvNPicilJqJ4X
         gLzEF0KV1KfIuEEPq6kqHiculzoEWHWcB+aCgVicWwWwIP7Elv2lc96+u7yInfBZQ7su
         vbVJaoiTOh9OrnZ84csaVSLtCRuEYLtNRyGHDUSWYGj5oKOgEkW8uisp5nQwnqdeoT2w
         7sVSedJKHmnXSgNaDszXeB+3olbpuPm8zXit5QE+43jUU1n4EqCEfV2CZtd0un3TipTX
         D1Ryq0vSZk13zc6TYcfXb/B36AE1ogxc/4CQZdZ6ScdI8TglmHehyvDpqYTEA55ESZQc
         CU5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795184325; x=1795789125; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qm85nREb7P0agHsSS2w3wnffVDPZdu6tF713NyJ40SQ=;
        b=S2Ub1fv4QIMwpCH6y9qCpBAh5iD4X4i6Hsbg/PjVIMAUTA4MFr+DZSYbq2SZE5N1gY
         952r7VvJsvDRJjvJ2iHlyZU40SjZG57KUrkjNWzyrxUV1fNPEIfnd4JREco+sVH7exGW
         ToAIwpfIW5nXUhdFUndHmxdWXSKATRRJ0vLlkaZtub7PrCASbKqD8nSHfbTX4rTEF9tc
         5lXCZtu9oRdFoNWMkZ7LWnqA2RFxF/b46sHofPW+2bZ4a1hOvMLIlXORlQlH0/1Ay+fR
         X+JMzkbkUALsrIacS9/V7KAFL/UNTvL1kV6lRZBgOcfWcxXleZVQYG9CjPSX3wRCJvWQ
         tAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795184325; x=1795789125;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Qm85nREb7P0agHsSS2w3wnffVDPZdu6tF713NyJ40SQ=;
        b=Ymzcf2hNrn7RSIazDDgTZOQ+AJujoPJrjF1xg2AgVNCsvMx3sCpu3P3XZQtT5B2il8
         emWpgYHevwjAcYrLVe2C9hv6z0+WJykIX0BBHPHags6s72AZE0Ll4KusGTh1akqVLgNk
         EYQiayOpzC29sIMpEXxbZfHnGPeSWCsJzDQQd6ufXCznIWLUyErfTM1SsUhqU/k/hRuM
         F5VcONugVM6IDUrjcZAivDWg6cUg3W0vZVbTn2wUP9fgWlsXNkKn0xZeAxYgeMxbc8N2
         lUZUhCtO+yBBPmShI2yiuiQd94ZURXXywpjYLTzZBwhY8V4gRaA2y1fXsVSKNhZjSbmJ
         KgPQ==
X-Forwarded-Encrypted: i=1; AL+hErEE7oO62fyqK6Cd2lK4UKK1GIShzIRo3OontKA9yeY6KPzrDxnYPoMXGzrUbURyJF/N3GjoYjEMQoDyeck=@vger.kernel.org
X-Gm-Message-State: APuU4Z8I1FxqWKA1r2hPkrZkytyzY68+kDIL3NZ1ph2MxWXIRVD8Jzu7
	pO75r8VZ7B039mPuxU3h0Q4tkXTHHJr2IWyd/8m48acC3e5pzEG6W09diifT83mcqykrLQxJ/nk
	mcR926CB5oVxHIjhxWNONdKkYAtHWz6Y=
X-Gm-Gg: AZFdTZeUSbv03v1EBNwaMgbyP4OiHfovUP8XSfqvWfQaAiXUD4UiDkQ2FQ6M0wO+gzc
	UtLUenDZTOzjJrH2g0hxq3lFxNCMLrjwbQv2imTcGIniaq2qXeZLDelpZcRY0BDh90rUSbzfXLg
	Ge+KcT+DXNFgCCseA5JW1gWhEl2lw7dxGRKMwhOrA8mnyhy1LGf5+UIbEYc5f8W4b8pAaPuhOWT
	c2URU5EfKJU7TgkY3VVjGSzcck6GRlzboEPoYmUJXfjmRQS7h5oZaXDwP+klAmN2J3t1L9p/eRw
	QLwkP7hg5LEf7aH1qk8OaKgzBysykYGNYEBBMluC9GvRI89au12C8/ajZpVC9rbCONcSSFIrSQm
	qQbhdJrwhHUXJAj0UUjMpaz7rEmpwicmXFZ2vJkl8kDh2JP0HZKxUuUviUdZPovoYVpn9BOxxGy
	Ss9MBeKIkPpcZF+IClCQ==
X-Received: by 2002:a05:690e:478f:20b0:67d:99fc:2e27 with SMTP id
 956f58d0204a3-67df43f3b0cmr804987d50.40.1795184325362; Fri, 20 Nov 2026
 06:18:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <bc42ae96-dc7e-4b6e-b9cc-64cde5dc51ce@yahoo.com> <e5b0e0b7-6c68-4b9d-ad52-f83bde5e32f8@yahoo.com>
In-Reply-To: <e5b0e0b7-6c68-4b9d-ad52-f83bde5e32f8@yahoo.com>
From: Gustavo Foletto Mora <gusfmora@gmail.com>
Date: Fri, 20 Nov 2026 11:18:33 -0300
X-Gm-Features: AclHuK_xpfbJPoEhoQpqqv5nViKMrJKk3pARB3vz01zc7O1qtz_EdUVXv0vSmLU
Message-ID: <CAK+kzgzb0CZZ9JR0Rs+hjK8+nDitMGhyzNZ3o23NSfwaeZ_osQ@mail.gmail.com>
Subject: Re: [PATCH net-next v12 08/13] net: dsa: realtek: rtl8365mb: refactor
 PVID handling
To: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org, 
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	alvin.sipraga@analog.com, kuncy7@gmail.com, fabianotassotti@gmail.com, 
	gabonpivovich@gmail.com, contact@c127.dev
Content-Type: text/plain; charset="UTF-8"

Tested on family D only (RTL8367S-VB, TP-Link EX511 v2), v12 as is: the
PVID paths reached through the family info behave as with v11, PVIDs set
and cleared on access ports, untagged and priority-tagged frames handled
per PVID, deleting another VLAN keeps the PVID. The family C
implementation is not exercised here.

Tested-by: Gustavo Foletto Mora <gusfmora@gmail.com>

Thanks,
Gustavo
