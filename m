Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795557150;
	b=gfvq9xwgIY97sgbKMQ38rp+x1bcO2+scSD14tSxzFzxy2C6MbHeenNCd/oqk+BDmTKRY
	 hwEJTpVDBatUzC6FzZ1/aogKLg1GNI8e9Udy+wL4ueRTf+XLMEbIXfktTOLWxrBNJl3M0
	 dwKOnLW5C+4/BitWdBRFW7du/yw1uPSX7Jb4dGoEI1V2dPwqscYCZK1B48yH1OKsHmh/r
	 pxoEiGiOPai/QyIYHEGWRVaJ6BkV8nKvbm4Ef8CBoJ5E4SCJYHvW6yVl5holRoFnxs+dQ
	 hPBfXZcSDKk8yQvDyJiqRtVRyQ+RBBlLNCnVR3OtxO7xq9DcAeXEzeYmmkgS4Z5646g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Lf1Y3VuyPwvovOGVJHv+EhVFPSKZjC4cG/I119XVXRE=;
	b=zMVIarwvbTE1zPYIFUiIoXTXmH4TFXo5nqwm4d/mbHMKyy7QKjLbDcmmpqSnKAQTdIoW
	 5HJyeYxXLM4HNJpv1MKu1nD1xaOe/uADbS6zEZkz0HGwgdEalJc8/rk61vaRVnBxDH8zt
	 qNpBeFRssv1jVKQLujj96GJXMSevIOD7i8egMpxUy6IW7P6wSOUH3H76IgaFQ9X+SsDbM
	 cUsgcOY/RBaIHEvyQ3sQfkHBHTHAdTVexkNSL72V2Bmh1JHzrlW49K+ScnQkR4lGrtdut
	 bAz+uQnYLWW4F5YEaSTT7zN2yyzSz7IbpCu3kcE+FMRG2G97DtHPWWnk4IZDyOP/8bg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b="J4wgzj/q";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71CA606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:52:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A71CA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=J4wgzj/q
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b4d6981c67so32528467b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:52:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795557149; cv=none;
        d=google.com; s=arc-20260327;
        b=ioGPwoNYLH67OSv0WMqzBGdQu+Q2YWQtCvv+V3ogS4W/sb3Ji5NeH1uVvcyFCqXKMR
         8GrXhCfiHReViVUAi8m6r9VvS0uuv9SUQxbBmqvnOmtjJZamIjI+mNQ875zMHaGj8bZB
         8w0QOm5iA5/D2AA1FzbT3OWra6hNR2fATYROogQv7GXozTeDsOfqLFnJM2BjXezoBK3G
         gnqaj6AlYsi/GJ/p7Qw8iqjhBrG89rYgPSpW92mwy4vzeUsXV4Mrul4ZZxe99y4jkgKX
         LegUpAOBn3E5RXjkmFMGFkeRSTV1ji2ARJ2ua7PYE2DfQIdnUbP9I2wn4d2mxATEPm2U
         ak9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lf1Y3VuyPwvovOGVJHv+EhVFPSKZjC4cG/I119XVXRE=;
        fh=qLa7LBYrfQX81CZeupkwZXKYVC3EAi25a5z9BcuTjTM=;
        b=BqV/99K9miWrcZWFYYzU4fnz7/YEnVpXFqoQliED/JZHVt8glLnCywIvVCVWTkxaPV
         /rU6mSMMHF2J7DSSLsF5EqlJCyPfvNki33qWaSVp8GQgA0fMMNit3WvPHHaeMes+tg/1
         IxAxrW26Mmp4qEmx2U3Dc4Fe4SY8tdO3oXQw7ncd9PowNsEkcj5kQof9/G7RboAMio6u
         tBnRYJrNbiyfXgEui4qoLhGE/BZHzCbfLSpqi/ZqE1DhXCJyGg9hrG3Qxcq2a5czNgav
         Mz289ggftecHyMnGXc2z89rmURUlFjVW7C8/3J1bJHD5CUhglw5c0MVwJMFrs5M5jV+1
         knRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795557149; x=1796161949; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lf1Y3VuyPwvovOGVJHv+EhVFPSKZjC4cG/I119XVXRE=;
        b=J4wgzj/qUW8Te4tO+gJNuLHr8BgOSxIUEX95ONeC8vg1THoFDBuISwGqmHI9WndL7O
         ndUID7KHmeVBejDHTI4rs9Th0sTjRGOq7JZKOKGXOqcWwrG0VA9Jx1Y3ul4n1YXNROVp
         aA8gW/c19c3mgim/pLAvr+u5KeJ8AnsOO/OT7W6WFl3KRFiYKgHN8wVurPb5bpkXcRyh
         5jcXcpXhTk5ZIeAsP/tLcHmbvf9t0bypqi7VYnjWSQf8/LrHWP/8KvipCr31O1QlC4BI
         LSEEhZo6+y2x6dW8Dp/30D/7GTlnVoajqHXdbCpWPgx+OJXULngjCSg0k6ptM1KVIpxI
         6EDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557149; x=1796161949;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lf1Y3VuyPwvovOGVJHv+EhVFPSKZjC4cG/I119XVXRE=;
        b=AUNdgXAeSV9YUjDW4vsnk6dkQB5PLW7bQOLhI4SoXbH4IgKaAJAOLT4QAZUQ8CVBpI
         Mr3SR1cd5Ggy0D80tnDNqqQEl+MuJRHQDc1TmZ1F89C8kKuck1FtMzNhkG30coYtoJju
         PZCWA25RKwBDgM8MO4IEKqJfkhNfSVROnwuGSHMgK1tDwXDuTb1h6CMD4yz9u9CNZ9IR
         SBMTrEcBFHv5HuIal3LpVBnHCIqGoKPL8Wg0yEuTXOcGUg67mvHcRFvDL+5XLGDMEjYa
         MsG6GaQpocGWeUHq6Ku4WKk8f0LdD1A7OXvlov3zl2R/3+1e1l3ZRcgFeDlPl39qnwIs
         fbSQ==
X-Forwarded-Encrypted: i=1; AL+hErHp0A5ZYOd3ZmJq/j93z4788digbpjnO1rVVVEmvF+ED6Ur+51VMWG2Dzn9Rxa7q3/jCwvzSiEz/eVI8rY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9L4xRBnLdYtVJ+wDsL7GOEYa6vlgJAOcQ1JWuptqgvC1E80Hdq
	nHCJzkFNvNhAHn6kyWgJQ86s9xIfkoa89BaABHdMKjgUW+sk0qNJWNiK3zgTPKj2D4LNkIwmyeE
	9Ik19Zr2gvVat5tGtPho0jlxvvWpJeCM=
X-Gm-Gg: AZFdTZcbRz53WR9HJ2whYFKuOVE50Vw1qK47ZqsyFKv1VIT61lRk5OH4kLHLg46J8Tc
	Vd8j6GyBfiXAJfwhXjmxVduFFTlrsbQuYboNQk9WxFst3JXBh7I1bNzccp1IxCHSCnrDcrFf3DE
	aALeuGfvx43FeedN9ouVr2lI9SLMZNDhmnQOvLFcOaFghaArgzmqTa6oEr6I4qpP+heegxkO8rC
	U5SZr77RhdWqXzKEYLVVcLUiLiWilmPVB2cuTIoYWxD2zb4VhGZVtyctrStBu0WsDp6AweNCKUr
	Bi1Uhh62MMI+5eHBdZ4jXwGoH1v8qbzQbzdvPEPVSx4yqdntratCvQUz51lnEaSAANa/s8vm8sl
	zk/XnvTI0naYz1XWpZhGgTgjQ3OU5zz+aWznNrjnVfSYKSQF/Endqee3hIN4TRDyaxq0xNA==
X-Received: by 2002:a05:690c:6d87:b0:88f:ccf7:25d9 with SMTP id
 00721157ae682-8b520504b49mr86018497b3.60.1795557148692; Tue, 24 Nov 2026
 13:52:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-g12a-mux-data-path-v2-1-fc56db5973af@iav.lv>
 <CAFBinCALe-8oB5Mwpyx-B_7dKJ-WZcMCjycHv=xH+JasRBOaPw@mail.gmail.com> <20261124-re-martin-g12a-mux-t7@iav.lv>
In-Reply-To: <20261124-re-martin-g12a-mux-t7@iav.lv>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Nov 2026 22:52:18 +0100
X-Gm-Features: Aa3M54pdaFD27QxQGunyvXHUItWwaVO9EDUyn4_5FJjuusCb-0isvsezb1c1rbA
Message-ID: <CAFBinCB3auaxcJ4wV+Q-KS4hBKfacrPpu_X9BAVBirAuMNbDvw@mail.gmail.com>
Subject: Re: [PATCH net v2] net: mdio: mux-meson-g12a: keep the MAC data path
 when switching MDIO
To: Igor Velkov <iav@iav.lv>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Lucas Tanure <tanure@linux.com>, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Igor,

On Tue, Nov 24, 2026 at 10:31=E2=80=AFPM Igor Velkov <iav@iav.lv> wrote:
>
> Hi Martin,
>
> On Tue, Nov 24, 2026 at 9:50 PM Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
> > I have just reviewed Lucas patch [0] which adds Ethernet support for th=
e T7 SoC.
> > He kept the internal MDIO mux path disabled by default, so boards
> > using it will have to enable it.
> > Have you tested that approach as well? If not: it would be great if
> > you could investigate the pros/cons of your approach vs. Lucas'
> > approach.
>
> Not on hardware. By the code it works: mdio-mux registers only the
> available child buses, and the g12a driver writes CNTL2 only from
> switch_fn. With int_mdio disabled the internal bus never exists, so
> CNTL2 only ever gets the external setting.
>
> But that avoids the bug rather than fixes it. The MDIO source and the
> data path are separate CNTL2 bits; the driver switched them together.
> Disabling int_mdio only keeps that path from running, and only on
> boards whose DT does it. The G12A/G12B/SM1/S4/C3 dtsi enable int_mdio,
> and ten boards use the internal PHY relying on that. Changing the
> default touches all of them, and existing DTBs keep the bug.
>
> The driver change removes the coupling: the data path follows the PHY
> the MAC attaches, with any DTB. For a new SoC like T7, int_mdio
> disabled in the dtsi is ordinary DT practice, and the two combine. If
> one has to pick, the driver change: it fixes the cause.
All of this sounds reasonable.
What caught my eye is that the code now reads strange: we have a mux
that we're following for half of the register values while another
part is fixed at probe time.

I don't know stmmac, phylib nor mdio-mux-meson-g12a enough to point
out an alternative solution.
So until someone comes up with a better plan you're patch and
description is the best we have.
