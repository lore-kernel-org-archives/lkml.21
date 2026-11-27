Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769384;
	b=LIQujyE4Ed1/cwm7Vk0k8lrGddyYVKARBaOC+4HV1p96rgD2GWjUaWbDmVML8arY/iHO
	 Znv1XIEKhcZB7oz9NSUOOYVOUUmYRd7mjbcz+u76nd3IEdl0GGx2L8Kz5wxDDy3zV6Ngl
	 jjmEv7tYMFlFDxprDUXtvzF6rcmzN4k+f/Inqqpj1PA0I2AZpBGq96333BX7BUY9n1IPS
	 ivVWIUF5V2vGlGRu0N5dyKo+xHCfVPs178yun+5SMlRIlMxqnvCMQL03oUy2oe1d+7wSt
	 hcWuIuHLfg5TaQAC9cyzCKsgvFvgGNA4ksGjJ0bqnwB+5nlykqP8lXUdVEhvqxEXNcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=l5H/fPkMrIgjbqbAa16bsfhUN41gPrGnMmr6FVXi4LA=;
	b=gzeGTXurTzYoB+GGL+RqcBfQyUp8XYMN2TH38kF8u3vNwPXqtpYVOzQBYD6gHJEWp4jk
	 54/ew0hHdSBp0k6FSmlWFHlXX8vLDlN487V5iue5AlSq6vcKAuLVcwKj4ctLnrvEu/Go7
	 JbmoqcMWnzO9Ayu12u/bIXmg3Lfn2mCvUpEqYdaYHtdGufWrWAjNXK8uEk8rfdmhlH95t
	 FaIp7PlY0XPlK62heo2i2hvlTFCamM10ig7LnJW3fD1IT0k4C53ARiCGO4RTDPD0NGbIH
	 1CEp3/jbC+x0RxLe4PHvsOFlH8CAnX6B8R2edPUEYOZOCtwTmwf+xW9i/wX5j8EvgTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=lMtduL23;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E96C606A6B5
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:49:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E96C606A6B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=lMtduL23
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso4917762f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795769383; x=1796374183; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l5H/fPkMrIgjbqbAa16bsfhUN41gPrGnMmr6FVXi4LA=;
        b=lMtduL23oty35ecI++RAvCDDqiwnc4Ak+6dpQwXYAlrNx/WsKXzEzr5BaFbdfWGv0o
         MIdxQNlD99ZB3a8pdZlPzsq/4KUpCXSeNscu1C8qklmN3X0MyZyu4smG76KD/bG+zgKN
         a5t5Os6EnPqekAKT3BU784FH51GJONaBlPWvdb5hG5vVq62a5HRLgpmnLGMi6YcnoS7y
         qvGHwnA/+1VBekixkj+vGN89hIxMcptLrPhwi9kCSzPZ5+eJkd3ljI+vBaZ2ii5tpxFc
         LEwVTIzesRkK1aagdCm3Sz9dhOlgaNyOYbdqFMjJ/Rv5/L3luL0uNMhbxT/KTNBR5HLm
         K2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769383; x=1796374183;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l5H/fPkMrIgjbqbAa16bsfhUN41gPrGnMmr6FVXi4LA=;
        b=xCrbS35AS88D6upck22rFkX+RNoBqZW0fzUw9wE6ZI2o0zSjUs7JDM9wuoMkepki+z
         dQAlH1GjnBO1cDu7MzMuVjLx5XK6lakSeRtqV2kiSeNN9Jdi8uJRLkaRN4LhIRdGEWSX
         IVyPvEQZ6qX/KFlkbg1UtLyhIqR8jxxoRIdSZj+BKnQdGCBayX9EF8koZIwvLGnvrPf0
         AsDtx4IvH5RjPfU77EB8g8NytcMr7PoZeyrmegqhgqXZfD5pUQR9yl3PELRF1g8VnE9n
         FurXTuF2EjMzUJQRv/zWrK4bzJjoKewrlxq/Kmt/AqjxjWyq3SHCUg53+gay7Y9bsfF4
         uBWQ==
X-Gm-Message-State: APuU4Z8rHro6KAtkwD/n/PrS8IPToZjnOFpqeRQigMSbaKNabL1CcS/J
	zm9EMAG0J05JGN4EvP1dMPmvsN2/DKp5clU8V8BlGz825ryi5uQG7SDTF7OSHqrOEm0=
X-Gm-Gg: AZFdTZcug4bKfCfEvyKHxngRn67KH31uhzSjbPKhhgKSJPKBpqYiLrwO0rEKg6mItwq
	ahuIcshwIofnJMa098gtxhJ+Im2myahzV3nDAimRr3U0rOvRIthqSRaS+0P1g5RDaBj7dfgqOGD
	BcQ189pZfJBZphiVUt7ZsOVJ/k4UPKoDokmobTNUNjEkQVxCCBIlAT+RoyOfR/NNEpgV8lzXhf8
	pUhn8zhp0XeGxnQbdseag+CY2JDLDHX3eHSNYcA4ong7sLLEiUcLSPBcpkQ7PmBLb+n8VtjI4JC
	t0jnTOYtNLZLgH9n7a8rYn78Nmm9O3/FbXN9HkVOJj9C7pGgC8MflMhevmp4teSPMQlX7Bb8Uu+
	UbjPktfJq9SgmkyFw+FvwIwVKoVgGAzy7TzvVgQR/jCsvfSaoie6Z1KJ9uXPRtdHqsDRioHaCbo
	wMybtfcfkxDBRORCt46/UK3ZE+yWU4WQXrNQlSm7jPGWOynN7BY9aWdz621m0TtkBBacm/L6hHF
	wUtqOYIS1wOJyjQyLvlMrkCJ9aMWe3VFpgWXESDPrJaoHOQBehnUuyT7iXQ6cVsdjso2wciRSkR
	ZdzKXtqWRiDnlx7uqkFwbo8yXF/VBsVMkMw6dAnbEOV6LqAx1feVwMFfo7YGN+f3xKFPuWpBZiP
	YsVTYOfGAE6C1Vguc
X-Received: by 2002:a05:600d:18:b0:4bb:abe2:bbce with SMTP id 5b1f17b1804b1-4bbabe2bcc5mr70018825e9.29.1795769382993;
        Fri, 27 Nov 2026 00:49:42 -0800 (PST)
Received: from localhost (p200300f65f19a90496f529fbcf0b312d.dip0.t-ipconnect.de. [2003:f6:5f19:a904:96f5:29fb:cf0b:312d])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb884b7515sm923694825e9.13.2026.11.27.00.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:49:42 -0800 (PST)
Date: Fri, 27 Nov 2026 09:49:40 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Shiv Prakash Gupta <shivprakash.gupta@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	linux@roeck-us.net, wim@linux-watchdog.org, vikash.bansal@nxp.com, 
	priyanka.jain@nxp.com, lakshay.piplani@nxp.com
Subject: Re: [PATCH v5 2/4] rtc: pcf8525: Add NXP PCF8525 RTC driver
Message-ID: <awlDvq6KT4HxGNDA@monoceros>
References: <20261126071124.2383368-1-shivprakash.gupta@nxp.com>
 <20261126071124.2383368-3-shivprakash.gupta@nxp.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gv5nh37x244s5vos"
Content-Disposition: inline
In-Reply-To: <20261126071124.2383368-3-shivprakash.gupta@nxp.com>


--gv5nh37x244s5vos
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v5 2/4] rtc: pcf8525: Add NXP PCF8525 RTC driver
MIME-Version: 1.0

Hello,

On Thu, Nov 26, 2026 at 12:41:22PM +0530, Shiv Prakash Gupta wrote:
> +#include <linux/i2c.h>
> [...]
> +#include <linux/mod_devicetable.h>

Please rely on <linux/i2c.h> to provide i2c_device_id and of_device_id
and drop the include for <linux/mod_devicetable.h>. The latter pulls in
several headers transitively that are not needed and that thus create
unneeded build dependencies for your driver.

Best regards
Uwe

--gv5nh37x244s5vos
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsJRCEACgkQj4D7WH0S
/k4y8Af/YPMv6+VfabvAg6sjAP1iYCrA9X9sWU9HEzF33ikGj2zaSOQAbmelYcKU
MkYOqadm4ftAn3wh1m+RGl1mnfy1GNluJIXTI9zNZYGx1pj3U8dJqh1/XL74jj8A
xgaOrHFNOPOBUNkjSWBYaj0jo6IcppLUcPbLI6QT0lkZsww+UNLIAAdTGy3bKvJQ
zQELEUsrss+cgFYfjeZ40PKOh/wFEqPemnatDmeoUoMCItb7iPp3LZX0szasTHR0
Y0MOy7nJemFgnBUeFliuIZMWsjW0gTCXFOfwAA/AU9iZ6LoYjQ13w1baDZLxOSsA
hwUFXsoIF6f/koYvawaOx3iNSkWDag==
=uvjs
-----END PGP SIGNATURE-----

--gv5nh37x244s5vos--
