Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795119613;
	b=wFY0+9D4k7WkO0yI9AVjcQ24pSZmIX4Ahcs3cTRGR4rfq/O3AG504JUg65ITxU6CPkkC
	 63/gdHaAH2EY/rNTYgKM52cvOvp2mUP5bTRdkYtue7NXowy/Sx0Sbl9ya+y2f6waUWDkc
	 QFDn2JRCU8NfOsOjjjqSQItKRjdD/Vdyn+Q06qdwV83eP75h/h5yUsvUrcEm81ZNhfjzL
	 k9ZzAtwoFdTnjIEA050EAomBKiGKB7O1Cp9cmqZjavo46e5XHTpVEtDaPKXqbZP4fQDWt
	 EVTH+eD3sSb5RLFHS49tSIehNQ8htiSAP087Swb/WhFsTfZbcvc+HlKkAZMtVSgLnkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795119613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=oUxQWUg0cFfOfFkOLUnILAxBRHkeTjUzpnJn7oclOAs=;
	b=XTQ0DIK0o/aSjzhFALIPb0dITS3Y3JpwB2rZa5fiVR49rlh0++LmZSws/+R8fPmk7H2y
	 6iMatB6J1Dd2zyo7GCNcOFVbfhA4PEjpj8JmNMaBWf6XLqnj0C/3KGzI9BOdQZQu+Tioz
	 8jczWRSyVpaZMnLv4+yvH/NAeer36NDjNRVz/WUlILAOSWAUEC+2+MHx3q7KZIFRJVqc+
	 ZMuqtckOiNLj4jxknS1kDNl+mAfAeozltOB9YL7XUVX6zjgcyVBRC2HHir07yuaqjzzYM
	 PZVfFVeIvfk/LJx8qaEmghhY01BCDqGjYi9d1rDUaLkpg5B0nFbku5EzqBVOjy2ifTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sRmY0MrQ;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A385E606E4C1
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:20:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A385E606E4C1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sRmY0MrQ
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4b467581b98so1572755e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795119611; x=1795724411; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oUxQWUg0cFfOfFkOLUnILAxBRHkeTjUzpnJn7oclOAs=;
        b=sRmY0MrQcatai13CSp3tCaVymT1Jdx9sG8+PxtJ6vo2v8nOZIgAZr5TMPPHpfiIlo5
         YeuoYsv0bU3CF7cOwhMYGcnJjSdp9bSZnYfiOmii7KSkZaPayIh7i0ubLMe0y/GmTkSl
         UWVRD2/OFS/frqPDCs2oplroD1XKkvFyDNKbMg0NCq1oppThffMV+wUT8ciuERJVLFgz
         SFsPQiffpYXeuwpMZpV27b772hz62Y5powU21nIF3Lch5bw1KmX6DICLJs3U7srUMiEJ
         sTNZPXkPO5oIaA+KlBEbc8bXwD14HR56QIl7P7TplxCLtnEplNpl7O4fCynYkrsTGU0E
         wjLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795119611; x=1795724411;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oUxQWUg0cFfOfFkOLUnILAxBRHkeTjUzpnJn7oclOAs=;
        b=RDbQkxxA/Az762PRcEuvihU4Y0Cs0Y3+/73dyX7oudasM7lEAkV78EqQZHDkKQoJ3d
         n52emNheW83wtaHRi5EvoJj4/YXpdvzaZASm+srxcciAEF1WxDmSonRM4v1tXz4uHwGS
         KC3bWxNEaDpFdvL4SEASuCN+9finW2MR0vaojkGtRPYTrsS+7XhEAkPHCRk/A3d8i3VO
         tudFNJIH+leM+MHPw8SEUa+mfx5f+um92buYuHILaRhs6eP/tMfNqrbjQkAAGjDPjsL1
         wYo3O54uAtiGAknwKakdO3FJOkRcBG3BTKG23yoCa7r9XtuILyK32peu49zQI5Fv6h2g
         rYNQ==
X-Forwarded-Encrypted: i=1; AL+hErFi/YdOlBPQ0wkb2v+KH/yYlHYHsKHkeRXthZ8zBZ94DEKOGB8zi4acbZlh5KS5rz+LpNKYruveQQ5EOPo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/t33YpisaH0ZaNZrpHI5r3+JFIfpdNEzDyNEnQQYPRYIh8rKD1
	Y1l+zrTAmI+ib/jDab0R8Lw5m71ZUhZvmLrZEkH2suDxbCVcvUtqWiUm
X-Gm-Gg: AYBFou3hx54puaP5DUebsv8g+I6ovytcr1qS7QY8X6xbnKOR1NKVqN2rV8PO/gC71gm
	Jo9wZH4B2FHAFV1BKZ5gIB1DBhfNdtz6GXLLUkkVnWYjZSVQzsnBBzaIZmM3KLakCwcjNowZ/kc
	fHULQGqPu/ouRNevyBANWA9JjyMR7dTt1pMSIOnCWU8jam99/k5dVxA1eE01x2ZIIhXto/nsSiX
	dOLGo5EQEzmXQOMX5xiVsLrjbiB+uPKCRpfBoBb3b/kN8N6AaL+nkpw2upmuWQku4lCemdxq2fz
	GNCt/RDF2N/7EOBayRTfmGKvhv51A8pJUx5IpYu2BKryEcVY9oijlYJGYvx5ktwSux31CxzsS0p
	+gfKC1XjoqS41vxgnpw13bgAmYA/BHntxyltE4yDMZ5fqjUx6OBGdlrNfoLF9fETlmUxHwUbO3t
	ZWxY03iaI5RS6OoKqNc4oXxp+lOtNIMKFcLXjL8CDy3l+HOiM8kRbPHQ8GUOV0QaM2OuJh4ncJb
	q1QUQu8i42kLYNrkb9onBu0QtKa7wdiurZMOHr6VeAh/d6NaehQIt72nX9OdEmW/sna/yTbNQkA
	G8sE1FQiRtr3acZQMjxYxLkxUu3+xz6RdBmRxVwaOC9EidGlXrF0JDwsLwLIG7mdElKYybSt
X-Received: by 2002:a05:600c:64c8:b0:4a0:1c0e:b057 with SMTP id 5b1f17b1804b1-4bb887e2380mr14648215e9.4.1795119610866;
        Thu, 19 Nov 2026 12:20:10 -0800 (PST)
Received: from smtpclient.apple ([77.83.249.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm94509405e9.4.2026.11.19.12.20.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 12:20:10 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v7 2/4] media: rockchip: Add JPEG decoder driver
From: Sergei Khomenkov <shomenkow@gmail.com>
In-Reply-To: <85353f59-52a0-446d-ace3-65e2d03d0d0b@pengutronix.de>
Date: Thu, 19 Nov 2026 22:19:57 +0200
Cc: Lucas Sinn <lucas.sinn@wolfvision.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <92CE2271-6485-4B33-AF75-480F9BD56980@gmail.com>
References: <20261022-rockchip-jpegdec-v7-0-3fd7dd55f408@pengutronix.de>
 <20261022-rockchip-jpegdec-v7-2-3fd7dd55f408@pengutronix.de>
 <596F6C9E-4A5D-4AE8-8D26-7A7247050D7D@gmail.com>
 <85353f59-52a0-446d-ace3-65e2d03d0d0b@pengutronix.de>
To: Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: Apple Mail (2.3901.200.71.1.16)

Hi Sascha,

On 2026-11-18 14:27, Sascha Hauer wrote:
> I haven't been affected by this issue lately, but saw it when the series
> was still based on the hantro driver. Yes, I'll change to 3 bytes per
> pixel next round and make that the floor of sizeimage. Would be nice to
> have a proper solution for this rather than either wasting tons of
> memory or risk having too small buffers.

Thanks. A correction to my last mail: 3 bytes per pixel is not a worst
case for 4:2:0, despite what tj3JPEGBufSize() suggests. Since then I
built 4:2:0 test patterns that push the quality 100 scan as far as I
could: libjpeg-turbo writes 3.35 bytes per pixel of scan data, byte
stuffing included, for one of them (640x480), and the Hantro H1
encoder on the RK3026 3.14. At quality 99 the largest I found was 3.08
(libjpeg-turbo) and 2.88 (H1). The patterns, 96x48 and 640x480 JPEGs,
the same frames as raw NV12 and a short script that makes them at any
size, are at https://homenkow.ru/kernel/vpu/

With the Annex K Huffman tables and 8-bit samples, a baseline 4:2:0
scan is at most about 3.3 bytes per pixel before byte stuffing and 4.9
after it, at quality 100 (lower qualities are smaller). Other tables
give a higher bound, and APPn/COM segments add any amount on top, so
for a decoder any fixed factor is a trade-off.

So 3 bytes per pixel covers what the H1 wrote up to quality 99 and most
of its quality 100 frames, but libjpeg-turbo goes over it from quality
99 up. If that trade-off is fine for you, I have no objection; I only
would not call it the worst case in the commit message or a comment.

Sergei
