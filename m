Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795158044;
	b=Cnz56Dxj5ymWpD8lRcw6tMppqTFcwk0Rk9Br0fvGFw058CBXKZIaz+rzeBX2q3nxr/1n
	 S3TffIM654EQA5thIxAMX/XQMAChdnDoad73bsANh9tUWnlk2OznADiCwGfL1/qAtuZwp
	 pjAOY5Zp638v4leC3SvKCQlWtoH4ZginJYMwBW54ehAWUW+y+brGHTEJsa7mfpHbaSvRa
	 xsCwWVjfu8GAkULi9npRwb2cvJzoFz7bibbmdnKEA9fNiBpwlgwh8PCjUg1I/E/OU0vIM
	 eyMW7Eeiif2qmHkxfi5P2+Av5cK2RsC4x9gECrPu3ARNWrgH7hwxEaWeAKpp94rm03g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795158044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=hX95mcjQTa/LIj5MH/7eOalSZrQGrb1tQtrKrDQJf2Y=;
	b=VFRz1vNarQ+Qn/7YgORj2hwCh9lJ/Kf3DgHrgkwZ3sEAmk5La1ce3P83jXRnp18Msdqr
	 8Dwnz2R0jrNkUQ0kEiapmJWi2mha+gDPmangR8yd4hz8+ZpmIMjr/jWEqzmzARQr8sYJm
	 4aG8Kj80v10u4cf8DGHoVPhqGCjAULI+7ABmyeVqREvfOYAe1gvkqWzn7h9qlqR9RXnnW
	 Ph8dGHDgwD1S9o2SSwg2Xvy/kcvUqySN18KVlDQ3axOVaPyRY/AvWHDOTlF5F+uIo6Ldv
	 E8A/eqH8vF0LFh8dNu9kPxKYb7nkyrpPRV2DJ2mbzEw/iDWDWX9sCTSBZhIjavjcftA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zn1EEfLC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB47460A2601
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:00:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB47460A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zn1EEfLC
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c09dbe96b1so7129e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:00:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795158042; cv=none;
        d=google.com; s=arc-20260327;
        b=odyLG7XNZRRsH8/n1FTlK5qCkQRgdF+B7CtULyBrggkJOJZQnpzmhBBmok9yVfFy5P
         yHYE2twqFC6NJh7yoHZ5KY6RcyNFCnXwo18P9A92XFcc/sMcTjxpW5/F8HgLjBguTBMz
         /VUhQwjNre6myljadRBNUv/aCqMwr4ZiMb4m+6bizDSwfMIBi5Dkksk/SvnTblTg4ZpO
         zvXzkFwUo3MicGSV5DJoaQ6pi2sTqYm/W+xAAoRnWytY2ep5/JzevNPxA+trixC6ruKF
         iL8PY5cVM5Fl+MRITBVbj681BRpzxoyL6F+VNwD3mkEChwEGbINALMGxRkPSezeL81hN
         m5xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hX95mcjQTa/LIj5MH/7eOalSZrQGrb1tQtrKrDQJf2Y=;
        fh=Tvu/L3lQhc3RLU/ZsvbSC8fVxuc0+vsfChEuV9htT9g=;
        b=jrQyy5HRbHUD9j1TEKqItqNwVbxhBQgZbH+IWgsNZkMLbDp9zL/psuUThCskNi8cXe
         5qN1BXHfgkAw3cJPtb3fs1wPccBbiOcRAOLNQL0TPYR7SnNN82AmHtMPCFwFgjS8SC7z
         t2oQgDfI7Vt5IdGQUtQda6noHnraRqbUtTpTuAe6wv8uFjx8uHgJSmfp2WHq/owQaEQ8
         rVNL+3MhlkcpqLKJt4UXQnod1BBbnvHlFbh1R2W4JTWUCwBnWDxwwNcFXDyCoXP4QjV9
         V7obP6o95XmD5mZDXMOPA7YZcHXgaem4DwWnnZaaJ2ZaWc7HOPWatP0Ch8jLM4boCdYB
         xZqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795158042; x=1795762842; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hX95mcjQTa/LIj5MH/7eOalSZrQGrb1tQtrKrDQJf2Y=;
        b=Zn1EEfLC3m3kPC+umVVBpJBCFAIwZj/Km0qZuXA53QHJT6ImEy8JE6Xa54cz7x3AQJ
         MlYsajf2OChfPJgxNKGinzo7G31EKb3GeQrcWn/hQmiXjQ29hoA0IWqTl49E78a2CY3V
         SNvDrM19qwPCLldUJT+Ubpby2gbNos4cN41dAsRVJKvqryLmiyyyZbcIIuqgzncbQz/s
         k3RzQzQCQKyfroyJ3o8O+5YDdPsMTYXavamoyCsA2yf+wyalK1RCttWSiyplHIcqOKCs
         CJB2wIchdSDfaEJeIPU6D6OEW3XjiWnQqss+miCAWdW3uA8DBgDLTAGk1Xcumlbyjnjo
         3b0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795158042; x=1795762842;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hX95mcjQTa/LIj5MH/7eOalSZrQGrb1tQtrKrDQJf2Y=;
        b=1I4dgDZHkxKMtOiDHkXAzC5YMsU4QMUzw+iICQHyJaZ99OV8mHJTzaBM540FgHMilj
         kyEQEPj8YzsjzaqzwMkhUC2/9DQb46UKKIQdxTREQzu1QRypkTKvZdZOmWOngPTeQAxb
         zd3BoCg+4/wjLf1Yhoq2Hdooz95T0QSObChe2lgRC94z7To2CWsU4CfkrKgcpipTxORF
         ba3jEQ005dr2w+ZNHng5F93EqaK4KU5uGiBEuwX8Fh8LG4qqbfN00zia3ziJPYMVANKe
         SiCawDTz9bWFM0Bm4zm0ejJ+G5UevbcIUa9H3zaAHfMjILsOhEhaVTzvU/xOYx+5Ms9o
         oYmw==
X-Forwarded-Encrypted: i=1; AL+hErHmd0o+Z9EbWkIzYx8NVSE/+AaQOuQdTO/4AEPrEYRp7Psuz49fVPql2MeJJbS/fDYkk7t4yrsB021ivnM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jpw7cnWmRmntnA3qUQRvx1SfD3emC294BL1YxTmabypD9KAVD
	L5OWGlsAnk+yfU1Ib5dOT2r1WnJJqAX6Ri6QUxGzBzXSRzi66O5Iwp8aH7vCcr2EFPFFiplsEji
	OZllpsNo05N21y/ouZr09txg+vG5xCrQ=
X-Gm-Gg: AZFdTZexgYGGn1k9yFMAY0PDlkHFHVhfzNOsjI674e12rNbE1YXl2X9DDtYvflyfe2c
	bhvc83yDQM8Qzmd5qGClTFcxt/SrkZazI1/MhZ6Jx08xGPVERpmYal8kvGBujYasEFjqG914g5T
	9pFtFSfgrOstox48cFDhWmPs1rn6j9fHrUg2MURSUDUmnXQEMQHLEj4Sy8p6kRTixLw1fcprBxU
	2xdCzXdR+Xg79r6hufkJiE+I/3eKMPpzkdxuIXW233YysMrUYnmCjMUqgENJTShicnlhUouFBBS
	ER23jByfoLjZxvIOPhbfVqo7m3NQUKcdCFBN+GyD53MluCdLppVOgfi4gWm0pDM8RvJlU74pPae
	wQck+43WR9MpfyjpoZv6T9zeRM/GoQo6bA38SbHOzB2E6EH5vkphUCLIVrOSW6nsiCKAdU3Y=
X-Received: by 2002:ac2:5692:0:b0:5c0:ca1:46c6 with SMTP id
 2adb3069b0e04-5c1bc7b71b0mr788664e87.4.1795158041586; Thu, 19 Nov 2026
 23:00:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-watchdog-reboot-keepalive-v1-1-c5902d959796@gmail.com> <b11f910f-c687-4d11-8a39-879e9db82cc4@roeck-us.net>
In-Reply-To: <b11f910f-c687-4d11-8a39-879e9db82cc4@roeck-us.net>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Thu, 19 Nov 2026 23:00:30 -0800
X-Gm-Features: Aa3M54pzX3CB86K7Yr9LDSIkgZF5zLBiqn38AJwWsDjpbNhuep4mRSlRPeGttX8
Message-ID: <CAEy9hNX9+pLn7bCXvxYjKeV3Xrg5nh9w6zprdQYXuyyO=5bYuA@mail.gmail.com>
Subject: Re: [PATCH RFC] watchdog: core: Ignore userspace keepalives once the
 system goes down
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Primoz Fiser <primoz.fiser@norik.com>
Content-Type: text/plain; charset="UTF-8"

On 11/19/26 09:10, Guenter Roeck wrote:
> I don't know what problem you are actually trying to solve, but in
> its current form this is a NACK.

Thank you for your review!
The case was a driver that oopsed in probe while holding its
device lock: device_shutdown() then blocked forever during "systemctl
reboot -ff" while systemd kept pinging. I take the point that a slow
shutdown must not turn into a reset, so I'll drop this.
