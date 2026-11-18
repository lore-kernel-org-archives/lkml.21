Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992595;
	b=tW+3WcgWhZed+Z86fyDfafkxclwkrrbr4ty2crnL3zFLRJauQBSeQsyYgnZ5WvuKSXEw
	 gMca2SUYyH77cbMjCGZVK9Au+cVsrGLZMcaXyTmu+zY3AQC7LQKhVNGkvLlQSeq8umNor
	 JwkuXSRbDLW2bgwX/cdAPtP5B3x83dMgRxeUZ1VJepJCTTzfxM8Pzzh3JDZHi8ZSWDj8O
	 hU2YE+k3caqd4MZyowPilSZ+rssAS9ybsC4bVP5Us67H3KFWIeGL6bGhZWJDfA5Kc4yye
	 Q+VxKenzaIyIWNIfWhZ1O6bA/+B7gKyG/ie0R/s2/7rHN08XrxqDRb0/j1DnIKaZa8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=95twHbzeA00heL+oAogGUGCTEC8PNHef6y6dTCesOqY=;
	b=jrtq+oSdApHzQvbVMtnCW+T2R1uP05fg8lvAV1eZo/tE/s8885qN+OYwH48BOeUIfiIg
	 VyHBRs/5Ww+6UNIOaPoOJWmC/7ZRrTpLREsLxXV6LDTQxoyGDLyChqTTB7s/+b2jVpIKk
	 FcG3262f5So1o2RDAqCiqph+exmKYeuJGLnhAFHsbqfvipbkQaXcYgMsLbO0YvUAJ4m3I
	 bKF6C6WLCz2PU5A+I5w12Xh2UUBLmZvLdCoOfehpjRXIyWtNpLcrRx+mzGS6uOo2UherM
	 OXwUN7fcFRByKJEUC61sDEKdycUiyg4Mx5wJBwKWsV2jEMUyXOvlg9ZvIppnREXoJBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gIYhQdm5;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E7D606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:03:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03E7D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gIYhQdm5
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so7085255e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794992593; x=1795597393; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=95twHbzeA00heL+oAogGUGCTEC8PNHef6y6dTCesOqY=;
        b=gIYhQdm5jlpUq/yxvwg5/4fv4Inn9b6ElHas6OrHW2dQ9nML9Aerc0CK6vYZNpPRAf
         IjIviFYpHS8cWqlztSNyURiNwp0MTqV7qb6aazxzroDhHe52ZGHWY/2zYjB4SmO/XZjm
         zRUNjuhdHZd+G8bIf0dAMEmdgibehAmmMtM3YUnG4Oc8soL/1S5p/Dpv+HKGU24xSXCT
         ocFYhOBp8J/V3E6ifQlrPNe7yYXV5rjUoeHZLJRukmdwqraE/StvTHQbCSL+S03FbRRs
         8wmcnH45a+hdI/Zsi50GgMCECpl1CJ0+yJVoSN7GFVg5JTJH/xgrEDksHcyNa3hvVqtB
         wD0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794992593; x=1795597393;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=95twHbzeA00heL+oAogGUGCTEC8PNHef6y6dTCesOqY=;
        b=2R0A4Nvpakt8f4K4jNbqa3smVqmKYeCbkCQCx1eJtf49Qb0Cm2zWR1DCxmVcIFgd1r
         DIFL94GOZB3zGr89Nn0Yp6+w8kDPThiI9E5QZT+ywj/2Ld1cCaXZQNnCJjrj6y+KAfrk
         /UF3azdQCTg+ozKNNNVVqYmZLHAHfvy3HXyNWteBZQWeXk1ITd1uxkPRL+Q115lqL23n
         Zp4rrsN8wh8/2+aWUrqOA4xWz7kaYYb62WlLqIzBotXKJIn2ROoJzonLJJX76P0cLmHH
         eKA+biiX5xQAQrlTjq+ldMD2HQwxvgPZion/SuxNat+VUiHo3+sRjPygloqumvFI77iN
         LeqQ==
X-Forwarded-Encrypted: i=1; AL+hErHEX20SKGK0yvc+V+aRaJQ2aOGfe54NC6IgfR2Sh5UrveV+K+TPXfylhFhVdE47gNKRTl1/z84Z8pdKkII=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nJdpHKLtfrwjgUQzGyszI4soNhSKsgFg7Ih0Ank4uPLs6bmoz
	6KL/wbk+MeDC3Moim7YdJ1S325DW+AylJkJgTCl8IVpv3bIK3a9gXTnj
X-Gm-Gg: AYBFou2wJqygDIjIKhvnfrqoJuFdeVVhC9CjZ1rLaR3okfdzIiONt9dQXMXaBSj/1zN
	1rgOUII8cGIlL05bj+MlcOC0fYLUb607zW+ypvujRjSmQH3D+LEejIyIxTuVV/UJ7OMyMvS9EQ9
	MQpJEFqfCMcWDx8jNS2qtPAXdAaTW/fkORcD/qRqkKQ+gtvah5yrgYc2SJhdgKYvVLFph4XpsdG
	M1LH9D4RlZWVOLnIRZYGsJa+hOu7B+rMO9xHnsdoMQDLzjdJNnmiiEY91WXwJqV43UFkYaQvrvs
	c99fIa7C3Oa6EdEvRYVnFr+5mp+18UDAhlHVJJ/H4/K+qDldzAy0ie6N5vpdZmQyYjV2XGDHqce
	KoAwB3F15GUgZWVYvxNw2nX3335kb4BlyjXWcVIzMRCccRDbrYL1vQZ5/Muffw3CVl7QHreUM00
	Cc91oqbp3m8iIuE6jJJCOe+T/TzBrkHRW1oXionqC3ioVZcr25Zs05nQMmM0rWdEHDrc1Mrs8QG
	T/xy5Kt96dEENEmhgfxBX7gLcjiPa+6/9/yhjWdYs6O9t698aWmRsklxGdRuf79eGPbhJXOKQxI
	Ub0VIHvN09zNtWaXai392h2fQ9p/Ram6DdBHUxt7BIKPSgIDDp8u6RppvDmhtyD7GidlHqD6cuP
	MBA1eQT9iUIB0DD00ldgHmoH3e/RkLR7plFgG2QbPknPOdwwEyeOmXYr3DT5wvGwq2YFSyUhNpf
	hbZHQpHZUmbdc7
X-Received: by 2002:a05:600c:4fc5:b0:4a2:392:9de2 with SMTP id 5b1f17b1804b1-4bb7da3ad9fmr32336225e9.28.1794992592998;
        Wed, 18 Nov 2026 01:03:12 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2b979bsm50596605e9.11.2026.11.18.01.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:03:12 -0800 (PST)
Date: Wed, 18 Nov 2026 12:03:06 +0300
From: Dan Carpenter <error27@gmail.com>
To: DelaySystem@tubot.lat
Cc: slongerbeam@gmail.com, mchehab@kernel.org, linux-kernel@vger.kernel.org,
	p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
	imx@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: imx: ic-prpencvf: add FORMAT_TRY
 frame interval support
Message-ID: <av1pyqEEPqwG8gz5@stanley.mountain>
References: <20261117-batch1-m2-prpencvf-try-v2-1-dd331ab13137@tubot.lat>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117-batch1-m2-prpencvf-try-v2-1-dd331ab13137@tubot.lat>

On Tue, Nov 17, 2026 at 04:06:10PM -0800, Maximo Manriquez Lizarraga via B4 Relay wrote:
> From: Maximo Manriquez Lizarraga <DelaySystem@tubot.lat>
> 
> Implement frame interval handling for V4L2_SUBDEV_FORMAT_TRY
> by storing and retrieving per-pad intervals from the subdev state,
> following the same pattern the driver already uses for TRY formats:
> ACTIVE intervals stay in priv->frame_interval while TRY intervals live
> in the subdev state.  Add a PRPENCVF-specific init_state callback to
> initialize TRY intervals from the active default, and move default
> interval initialization to prp_init(), which runs before any state can
> be initialized.
> 

AI is great at writing monkey see, monkey do commits but it sucks at
writing commit messages.

What difference does this make in terms of the users?

regards,
dan carpenter

