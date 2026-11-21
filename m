Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795264113;
	b=kX5W+P47Te8Wyn6xw9+5qFaQ3dybrQgkgP8m5YqL6o2OgtList30c3LPGg4MO6ZG4ik2
	 ghe8RctGj/l076X7u3wiYQNwQyQfT5fZA6zQ3HXABGO20MnVy+7VBd+bRamLqezL+6+Fo
	 Jilwrkjp5s0sQkBgDamR8Unde0M1NeOofjHiD+xaa8eFi/3jioNe+oXdqavHbFnHUfkfU
	 Yarc++0F6bosWRcs8u1AKLaUROIK1y5L9LBcyxRVg3DBHt6k+SSy9oitiiaKMgCbcWbB4
	 B0SP9EQFLDPUl3AdrPi5J/EJnENgwaj6pH+A1XN3Qq6KRuJQGuYb/x7MCZxC7P7CYnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795264113;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rFdayxRtJl/NSoob2VtOJz54UfnrykTn3RP7oeZONZ0=;
	b=Bm/ldCoLKjjz5lbvkQe+lfAf0oOnTeIly7xUWmMnqJqE2gc558VW0WNOXwOQ6dHhTwT8
	 emdEnFnh0f05NQymXKD1Y7vlYOIDeOu9X7755TLT6KzIkB6SfKDn3KljVonC2FNVO1GDe
	 n4Qq5xtZK3YKi0PMn4S6lT2kTVfOsJLR+SzTNDs+HVHP8e5A8YF6D9S0e8r3H23DCuQSs
	 e43ZRvYSZgo8DnGE/E4Zvw0VsTTw/Q34thimPtQCUI8cjoj5iv3ANwdaxWVDh06S0D+jF
	 2kuwvtM35ERwrKh9fe48eM7tD3q5albY9fx/i2zhjsk6utu5jA+Yny6sHtgk9lTkTAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=POtic4UK;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459D8606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 12:28:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 459D8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=POtic4UK
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso3845066eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 04:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795264112; x=1795868912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rFdayxRtJl/NSoob2VtOJz54UfnrykTn3RP7oeZONZ0=;
        b=POtic4UKlRWck6bMKXB4dPlX62Zqdy04A10cDjVNVvW1kXXnIRPpMdK5egZ2FxEWoU
         Agp1GAhGEGLcqpsjmSemUp3j41GKISZhwukkNNp6/GBvlnfCaL0Ay9JWuvPwOChXohIC
         ZVrK8sNir0ES/79YmuLRMjk8Qs4LENsEcuuEQM+TWp+bxdIxSlO2NFEexbZ598RSvbi+
         26O2KmqJ2G8yywcKpHT1jeUak43YxxstMLVLZTBQJ/DqYUKawpd19HQWwDXoCsWSem8K
         BYqwzj0G+BKWnw6VU+wqjUneIdVCuWU4LZ1LPPwvBa+q01CsTAjevnJyvFMXS0hNXvQZ
         v6VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795264112; x=1795868912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rFdayxRtJl/NSoob2VtOJz54UfnrykTn3RP7oeZONZ0=;
        b=joEYUxr10s3T/sRz3YM/PgetHNt1TjZ6YBLYLVTfvBsbENSVeuXFGZ2CIcG9cnSq0f
         nYnfQP11I6ej4V7Fuxy7AgQeCoMw+nAgcLh6D8pFfHKpP9N/lw+L6xDp8l5hR4bJ0ua8
         EMLxf7zOZvz8qFxSlzcSElC7YCgF4xPmKPUVhsvfN0xFyZLqrnKcwPImgYgzbRpGQi3O
         M5dklGL2vFTn9ym0xgZmdWGG7+cR0OGvEXKaY1HV5MOwEaITDeNMpJd16GboIltbCgZS
         AzVRo1Xj8HjChEzMstytWTLaiQJym2gCIkxKIqGuWmyXcKd+SSeZd0xePIsIZ2U8ofxo
         t65g==
X-Forwarded-Encrypted: i=1; AL+hErHJQA6+D09ZOwdbzK4fVl7SyJX5jFw9Od0yBCy6/6XQ74NFkAPp7QiHFePasv3Wl+2Dd3M2xpKYRCniN7U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EGqUqi5c2B7YyQigTni21Z4G4iigLjDB8mxg7ThsxdQ5RNAyU
	IaJ4515YKJMQ9t0oT6qW7ibD26U0D0Q7Ba99/0cBBUB7QgYUPsXyfBWEUxPNNz1G
X-Gm-Gg: AZFdTZchuNTH5tnlV+L+M3zVFUCqmFiQ1RB/VsvnsLE140kpzJW6dJ3nRReNJUPiIFI
	TLjwsEAJksSuCHWt6A2hzJzJlbwwm6oREgrtFmnf0hKeOQ8/UesM/dCW5SM4b/4yzLVU+bFEcYx
	BOlIueXBAAXfIcrsyNlJ3aUn/vy2U9YiUCt5TAeqPh30fxUaDebiWYaFGAXsARosi7ZbLc+TSMF
	Hwb7VyHYAPypkJhKduzKjcEs0qUXqcZX+tDaec8HyZLsFxJ4MxyKqRCJPkveQnOigG8Xptfl9fq
	nHeFXn5KO3aTwesR8IMyjISoYQCAWnBS4NVCO4fE/sRZsYwz3djdHSbip40lHKeVM0+/S7kxwFW
	8HZ6bvHDeeYjbbKuxTZ5iNEm7DTIYWDg3pr0GD1wHQuRL1vr5MILHkFVMDtFTdPRx0k5zA9LCqf
	WEmXgYtuHwomFlqFKAj2InDX30RGbXjELRCjWcUBdsgPYtQOkM1Tbot1TfBP5gUjDSyeWJXqyCC
	gBmDCaeSuoEORgq5j2CxvssNxysGaI/OLBeFLTzPXsF6M/AnZ/FAzMRWH5icFunVRjhzSj+CcWV
	vQNyGEbY8uhCq8dLw5SlGlwytU2ni2wRrD0rReo6mlnXSZQCkqnuV+fTY/4=
X-Received: by 2002:a05:7300:c695:b0:37f:73f9:aee7 with SMTP id 5a478bee46e88-3856c9a6408mr6641670eec.5.1795264112075;
        Sat, 21 Nov 2026 04:28:32 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:8549:3fe7:526f:af9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm18941986eec.27.2026.11.21.04.28.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 21 Nov 2026 04:28:31 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Woudstra <ericwouds@gmail.com>,
	=?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>,
	"Lucien . Jheng" <lucienzx159@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2] net: phy: air_en8811h: check PBUS register read errors
Date: Sat, 21 Nov 2026 20:27:58 +0800
Message-ID: <20261121122758.7136-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <439bfedb-fc9f-4e41-a87d-f5e6a3b7950c@lunn.ch>
References: <20261120062001.38233-1-enderaoelyther@gmail.com> <439bfedb-fc9f-4e41-a87d-f5e6a3b7950c@lunn.ch>
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

On Fri, Nov 20, 2026 at 02:15:00PM +0100, Andrew Lunn wrote:
> >  		/* We do not know what errors this check is supposed
> >  		 * catch or what to do about a failure. So print the
> >  		 * result and continue like the vendor driver does.
> >  		 */
> >  		if (pbus_value & AN8811HB_CRC_ST) {
> > -			air_phy_buckpbus_reg_read(phydev, mon3, &pbus_value);
> > +			ret = air_phy_buckpbus_reg_read(phydev, mon3,
> > +							&pbus_value);
> > +			if (ret < 0)
> > +				return ret;
>
> Please could you explain your understanding how this change and the
> comment go together? You did read the comment didn't you?

Yes, I did.

The failure mentioned in the comment is a firmware CRC mismatch
(AN8811HB_CRC_CHECK_PASS clear in mon3 once AN8811HB_CRC_ST is set in
mon2). That behavior is unchanged: when reading mon3 succeeds, a CRC
FAIL is only logged via phydev_dbg(), AN8811HB_CRC_RD_EN is cleared,
and firmware loading continues.

The added check handles a PBUS/MDIO register read failure instead. If
air_phy_buckpbus_reg_read() returns an error, pbus_value is not updated
and still holds the mon2 status word, so phydev_dbg() would report PASS
or FAIL decoded from the wrong register.

an8811hb_check_crc() already propagates PBUS errors from the
air_phy_buckpbus_reg_modify() calls at the start and end of the check
(and returns -ENODEV on timeout), so propagating errors from the three
PBUS reads in between keeps bus-error handling consistent.

If the comment now looks misleading right above the mon3 read check, I
can move it down above phydev_dbg() in a v3.

Thanks,
Zhao
