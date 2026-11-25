Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795607454;
	b=iDroD1x+4f1wrzwWrJaU0TgeWAddBVWvCE+wQOJv8a5xLirpAQ4v8sFgz3SxjREgIddo
	 ND5Gn+0T9GgKj97jQWgKk/A3GRT8RYlET6UpcfbkmyHXRbsYigH1XQpZ9TlOUxQzeGGyI
	 /oQvpYeL5pbBVx2WjHpwBYOtaVMyA3jk5Wlt9CKi4IFskAdr+su29MZBZSaxik++lMaS0
	 2OA2zlqjrDX9Chdnlfuv/trMTigD/jcAEE5fil4BVLXOWsK5BWZfXvbDqvTLHBUpZccut
	 XIChCdS2cwNabwC682/WJqh4ZAx7YjW3Tytw/NRZjK0wS/tzd7+Auz+cPrnBHj4TFhg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607454;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AK/FrytH2tf+B+57Lq9wnH5wu00oxO/OQC1ZXkryskE=;
	b=p6m9NVnmXMpguZcSO/Lx0vXJgUJhAsar3oYu/FVqw80p9WOyGDcYfuXjp9wlk3I9m9xa
	 n1lH/dbeVmcPypfvz/zlCkVC1hIm3eYN1Oz7yRHYZhMVKU7361lvxvCKbxHmqFFzDclBt
	 inGgaooELoXKvUpq9yRzS2sBLvzvaYQo5i+Zt208K0jA66LWyG8tu+D33FekqqvSfx2F5
	 I803OLryswflAa4yNRkgJ1rVFL/9BU7KAO5b9Mvy/43xy8oIQUhrikXruv2BJRi9v4hUt
	 y2jioQuewttAl04VhyHqMdkTspzuhB64cpD7Phji+0wje9vJosNrINzzINacmE11uvw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cCKrplZv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B38F606A33E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B38F606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cCKrplZv
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c516a192844so514697966b.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:50:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795607452; cv=none;
        d=google.com; s=arc-20260327;
        b=oPGu6dQ1KUBPh5rQbB80dc93iH8mR9jgkvrOwNKpKWQQIzY+kRN70Dma+sXvUhWqI8
         zC9qYHydJI5+n1M8oBC30YQk75q8NeFjk4v0Me2PaSVE0hnuoP/kA00kIHcjy1Se/AED
         Mp+2wKhHCrvicZKvNtGAzn8QugQnt7BLD8zOMw6cEdDc0/RZn7/FRlqTwKxsu7s2khA5
         IQ5A2m6XBapADblxgqcE8uweUaZ7aTzWO9MTe3TNFwui39YHWzH+GLtx0YAjmFLcUEUT
         xoeTt81eoSiihn9wCdw46rWO4DuE+rx3VxFS/nSLQKqX2nNdtGNVAam9QYHGsHLntmAQ
         ij6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AK/FrytH2tf+B+57Lq9wnH5wu00oxO/OQC1ZXkryskE=;
        fh=uE3wx9bE1nVchJHOh5aezt09VmNanik/Ge3lXiI2Guo=;
        b=WmBGaEgW2VqwgzX0dUOG2CYjfjtW1m5Q7GgZVtL3EMZj5mNcR7Qrvbjn+iVa0PyNWu
         T5E69d1TrFXtpRHFMosF8XwzOps1QYmPRe+q0TZlBXHKtWVf/8Edy9o3EroetPUI/QRC
         skLklryB2pHphMO01rDjexPICvXWqF1JsoPylibUU47oEnaKySKciKAfyZsh7B2S9L1O
         soWejNIL+CHjT/G4jDf+VaKqVXaqshXiwxSocIY9T+FCdJ/LCCjXn0BG8w/LkRblgINW
         NQMDz19M0S3CTcPWTEOzEGyxb6l5ZSd9mWQ5WjhylvdtbyfLM8e+xpEaXOwKe5eaeP/5
         7qsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795607452; x=1796212252; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AK/FrytH2tf+B+57Lq9wnH5wu00oxO/OQC1ZXkryskE=;
        b=cCKrplZvKmTmChiU/HWkkzSUlDXxoFNlvdQW5t4JT7LvZaH0zotWEszT5kKBJmcN0m
         vPomZV2tFWvlHcSrTbIAZuo5IG+DDIIhkqdzaluUlsEaQbjEEHWkEha+8MbbvKJfHpNJ
         bXl3xKAlMN3VvWpQbWEtysh7LbJqy03KCAvbBb4/lPCY56uKVSlnQ/rDAF0EPCdFR7da
         whyxBm9WY9e0pNEXmVJmY3HAxKfEu64s8CS2jmMBv4BH0cWdBkWz2XGF5xzGEM5kJXEv
         Equ5HQ0aYS3C+qnGSq1ascS5uzpxPVUWCGsWcVKOYAfoIori+vEAGi22Mpu0Ajet8D72
         wlgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607452; x=1796212252;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AK/FrytH2tf+B+57Lq9wnH5wu00oxO/OQC1ZXkryskE=;
        b=SP5st4RfApfAR9iUlk60keKYUrlgA3FO+EZzTqRtVIyWiDld3+QzX58AI/jHw7bpgo
         6zRWQ9dulvdNMPIC9A9J9NAuuiJNuS2XymY7g3SgO0K4e7/yqK7RvH1fZCFi4NfZ0VRH
         HF/JqIsufxZllqpaERdCuz/XpMqOrYNQ0GrIhXqEuK8kRFxgA2BsF52nVkVOodxO4uTc
         boNsvJz8Ri0+DwlLBNUXijwYKA4r32AUpU57XUErAxvcuEAsi1MpdH7ugQteG2EuqzEJ
         LMh0Dd/LAvMBDm/Ov7I/kqbyJV+SIjhQu6rsq9hRO6PwLHUiCAgSnKrwtFJXr0l9/vqH
         KTTQ==
X-Forwarded-Encrypted: i=1; AL+hErGY2qHLV/A442aEgroI/gzs/e5J+dZIMOnPv4QJStvfOeafAmo0TP+1sSedxeJLtvLW6yBPKwB1QCmCqIE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8GUjG8dXCnMuQ421rZjj0JOEtKxxeLPpz+LFDXcNOjHlCA430
	fYuSuSjK4wp5+8cXZKXCGNUEuoCrTOYu/Tr3KYfrp6aLw1882j/7d08cjb6HZuM9Afv9CwCrVHR
	kmjvecHayIq5EtsDBD0bqLR5cqbZY+Ig=
X-Gm-Gg: AZFdTZdHNPm7mIV0L9xHukYpvfEn40g4O1PB6/HD5CG8UbqK3p1Ynp99quhptV4PYk+
	tuv+gHDFjYcJ4+3SeKwbylv4zb1Euw/zzj08Ts8wvuY4dkElLPPCWeXuZqz1DWomNmw+WKonKsG
	5OZ1ajqCm5htcFQThpcDQYz58/kXgqQE/CbQtWpQBeeuOfF2AIr0iljl9BCPTAGmqwp4Zk3ZKRs
	UboJY0HQ1lLcGhSfKyomH0v4n3g5APsKrCK3FaJoWkORluQUc3wDnXEabqMod+oDdAUcx5k9Juk
	phckL8yrgoAKd1pM0r1++Bh1FPo3oceSFUAPnrZ8X4x5LxqHHh2zwBNz4prvIXqQScFiLw7plP7
	bzZm+PVxx9bebLsRZoEl2X3bGBxOMhYVwuZgvlLg=
X-Received: by 2002:a17:907:ba01:b0:c50:521f:13de with SMTP id
 a640c23a62f3a-c513a897601mr1361763166b.35.1795607451572; Wed, 25 Nov 2026
 03:50:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124094914.2993988-1-a.shimko.dev@gmail.com>
 <20261124094914.2993988-4-a.shimko.dev@gmail.com> <977f8fec-4cae-4003-b878-a7eb5aeee48c@lunn.ch>
In-Reply-To: <977f8fec-4cae-4003-b878-a7eb5aeee48c@lunn.ch>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Wed, 25 Nov 2026 14:50:39 +0300
X-Gm-Features: Aa3M54oKEgG2JL9N45FOQuqjvfRbhcjaW8XTghdzQJCbxKeIwx-6DyB-aMwShTI
Message-ID: <CAOPX746TNm7m6d6G-WyUzDptEVRJR0AuUzKa_Hg=P7s8CchhHw@mail.gmail.com>
Subject: Re: [PATCH net-next v5 3/3] net: phy: dap8211r: add PHY LED control support
To: Andrew Lunn <andrew@lunn.ch>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, maxime.chevallier@bootlin.com, 
	pavel@ucw.cz, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-leds@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Wed, Nov 25, 2026 at 12:47=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote=
:
>
> On Tue, Nov 24, 2026 at 12:49:12PM +0300, Artem Shimko wrote:
> > Add support for hardware-controlled LEDs and brightness on the DAP8211R
> > PHY. The chip exposes three LEDs that can be programmed to react to lin=
k,
> > speed, duplex, and TX/RX activity or be driven via the force mode.
> >
> > Add the dap8211r_write_ext() helper to access extended registers via th=
e
> > PHY indirect access registers, and implement callbacks for:
> > led_brightness_set(), led_hw_is_supported(), led_hw_control_set(),
> > led_hw_control_get().
> >
> > Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>

Thank you for the review!

Sashiko AI flagged a Medium issue in dap8211r_led_hw_control_get():
the function returns 0 even when LED_x_CON holds a state that cannot
be expressed as rules (TX/RX without ACT_BLINK, or ACT_BLINK without
TX/RX). I'd like to send a v6 that adds:

if (!!(led_mode & DAP8211R_LED_ACT_BLINK) !=3D
   !!(led_mode & (DAP8211R_LED_RX | DAP8211R_LED_TX)))
return -EOPNOTSUPP;

May i keep your Reviewed-by tag on
v6, given that this is a small, targeted fix?

--
Best regards,
artem
