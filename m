Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032335;
	b=ODftiIivIJkgW9ZrYHsUQORCby/Y1JwyiIOtJ/YcST+oeYMVNVFQrstSZTyqIYidK1Up
	 dAGEOsN1gq/zBkq9v6xKQ1Oufj/eGXhD5jwxkeOLpc0FLGLUyDEf3sGS/eXdxDo8wUPaV
	 KbRIjpm6aN4zsX7N1ApBEoTDoAG7JrigVHWTFB0dxvIPkeU9G4wgCxEvtDSpx0IEf/Gce
	 nsc3KpGglhP4VV1Neg5wtEbLxEZ4OPOINs6RtYoJr/URS5TJpcfEm15V9IFhUvDlNiodv
	 YhplIhBpVvb7HzcFPftdTUo0eWFJBAh3t9AUOPRQ1gho9T0RZNZbyKfjI5ZO02hHlsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vm6X4RXhkwTGS0rODxxBI99H8aOAkurBTqwazIDQj1E=;
	b=tNK2/gqBoVw84E2z4Yg0dXTuOHLP3X1qkfr3nfPyUfAdWi7u1N6V+un6BDQmaHUQQ3Dk
	 Xawt6yvp54XKAOFOXZ1sFbKlVvcAMTEYBuxqCeanNDjP9qBzrPptRpl3IZZVsio2jn31z
	 9/uUsLg4mHnPBvoTnbnIAc84KXX6Rc8Twc/wcEvNGcHmurLGFED9lWcwrJeX1ky8Y36Y5
	 kUwNzrYRaCDADOJAhJejK/gTtSjif5pjzlKgr3iGpfEOWafgzX2llYSlJED3OJDEw18Ee
	 UbQ7w9n2f6vV5hAP3wzOiR6kL7cMrd3jNJhm6Vj078EDdVu/7Bn1WMjHzlM8FY4xf/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q1FMbmrY;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BDA606A330
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:05:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8BDA606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q1FMbmrY
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-382ecd5cf2cso210899eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795032334; x=1795637134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vm6X4RXhkwTGS0rODxxBI99H8aOAkurBTqwazIDQj1E=;
        b=Q1FMbmrYQQM0s+ITTtFVk2rDTCxKhZq0tHSCa2oNwKmMIhrmem7HiE4QVyRnT/aIyH
         DXfy3kpwMUJOIhMYIMy+ACBusVXxNb97WjPXy3ICtPgpymxbpK0/ogDILwffmlNlyHZq
         eFMxQxRZ8XFVEd972N+qeDY4Nq9JbbPp24pcGo4fctMzvMj5hnnox2rz/WUOKIrG/GQ8
         UYxRNzI8UIo14siV2QhWPTiAVnItrl2hCUZZrDkDRCyr2ZECEJjSWeooQOiNiQ3w61/C
         ryWjtdjI+8N6tzj8SewjK/TnGSE2EQeqN+0w39ywVYFJPV1JPjAA1lMfVffOxP9LKXSr
         VMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032334; x=1795637134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vm6X4RXhkwTGS0rODxxBI99H8aOAkurBTqwazIDQj1E=;
        b=cKG9BnMQa+c5+azE9LXBLm0fRIRGsvsDnxzIXjyDmKwuKGvNaMHG73BMYFw1n6vQg8
         dZoP84Rb6TqBoTbC2zvh5dw5faQFspOs8Ja2nau1SasNVfrQEPP1rjeNV7uE4Gtskdwo
         uIzsQk91TwIzz5SmPYHIetFKRhQjE9jUjilvztIHmAOoLHLCeoFVU60u55Gp9nlUcXhy
         wfXv7Ml9RkHU9kLZbzuRD05oZGes1haqYjzuZIoMggWHIsa27hbRteVrRfIeveyTskJd
         OlMyHnBOSlznTg0XpzzOHuEaihwPYbHlDsaqFuP3q7vmG8MyCpCUZg0phhtkPjzUGBwi
         YCjg==
X-Forwarded-Encrypted: i=1; AL+hErGoYrs1MhcrEJT4b4XsfmcAeYnTztgTocz8sAOef4s/8IoxH5tufZnue6wP5H+CRRrLVnLtuVKp0Yzto0s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jU9NV5dGt0SuahCRQ5AYDZbTx5Jj07WL7SFx/9ZhEvbY04UGl
	zJECifoXzyx5ka2o+3kmgwqyay9gCA5Ujz8UJAP537VP1shcpWRggnva
X-Gm-Gg: AZFdTZeK0NMXDRFv60XxrgD77zA8EwUj52yPxKmFiQ2PwWKr/U5ZHAHAyy12g71OAFf
	OVVUOkG74CRk3wQc/Pykitya3ypAMpC5z+rr6LlHnixjpY53yrBFNSvfbpAk2ySh8cbsP+n//md
	cOHttKVReIdJtxkJ8eqgiKUshLsbJ7rBB4M2SbbN+0bt0+07RpXKX4DitytmAK4iDSLNf8EKunz
	V2fIPYCnN9oOCb9MYvM0BBHe4tS4ykTJ0KUl7jmbniiEr2l72qro9+4u4nmzVxdD4odLSZ0K3fZ
	Vz2F0NkGAz3xZonPRyDoEUmep62188gV90PG1qTlrkuTJZhA8nKUXnmkpDzeI020i6Usuetia3f
	jOCQWPNiZeYiCvPWDO6+zssl6OzZnxLugFRKYfUVN16j6mu8l/WpqjUq86eijxX+imfjS6hj+hu
	UOTDX7wowzu3RuT9UzlIv/015oybLr/aUJccEQgtFLNsbPVN7lEOaYdeZODgpsvqqmXvH8gTRRt
	CK6M0Zl8cBZ7uYnKRQqAogEQOSI19JE2H85L1t98w4T6DaEt3VoiQKArfoJAZaYgQqGiL4ngUaO
	eyToXoPHeB9tGKmmQMMlTBppSsgM8jchTG4SLbQFIsiYwpZV57DTLB6nsD7fqeMFNx1oN4/DIuR
	iviiQBGIiXvgZMVQHo1Ph//kp7/Hj
X-Received: by 2002:a05:7300:ae97:b0:382:2ae3:b1d0 with SMTP id 5a478bee46e88-383ee2228b7mr420599eec.13.1795032333782;
        Wed, 18 Nov 2026 12:05:33 -0800 (PST)
Received: from Mac.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a75d401fsm9683206eec.20.2026.11.18.12.05.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 12:05:33 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: andi.shyti@kernel.org,
	andrew+netdev@lunn.ch,
	corbet@lwn.net,
	davem@davemloft.net,
	edumazet@kernel.org,
	horms@kernel.org,
	jiri@resnulli.us,
	kuba@kernel.org,
	linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	rdunlap@infradead.org,
	richardcochran@gmail.com,
	skhan@linuxfoundation.org,
	vadim.fedorenko@linux.dev
Subject: Re: [PATCH net-next v3 2/3] i2c: xiic: add KUnit coverage for register access modes
Date: Wed, 18 Nov 2026 12:05:30 -0800
Message-ID: <20261118-timecard-common-301f823ddd-r2-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179502617695.3136.6995182814188526026@kernel.org>
References: <20261116-wiwi-v3-87afa10a8-2-ahmadexp@gmail.com> <179502617695.3136.6995182814188526026@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Agreed. RAM cannot distinguish a byte read from a truncated word read
returning the same value. I have stated that explicitly in the Kconfig
help and test comment, and retained the direct-x86-64 restriction.

All four KUnit cases pass in x86-64 QEMU. Separately, the source-derived
accessor fixture records which I/O accessor was called, including its
width and address. Removing the forced-word read branch makes that
fixture fail. This is software accessor coverage, not a measurement of
PCIe transaction widths, and I have not added runtime indirection to the
driver just for testing.
