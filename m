Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795852940;
	b=JWJ6U4K73vYPw7rraUCUptA/BGxI4WQK/gKVBuUNqqrPXy7Wv0KzSA99oN2+rti3eEL+
	 qsuY+3RATUcrKV06p+zQ0cU+mONqJUVh/JCFDEmopwofdR2UTy46Cw2dq+tzs49w/FULm
	 NN3M9pdG5Ey/s1wu1RMXRf7QYbOPgKI2CgfhjC9o2AkSlSA5Yggd/Y+k5bH8GgCOfGZRp
	 2le/OQtrKnfO7VwyF4Y22t8q3K9kWquJNXzADZKH09fz9qHMz+ATaAnoN9VJ/tIm3DNO5
	 T1jMiNEdqO/7vZ1rZYlJ3NaZkLL9gYAwqcPNX4FfwZ1HMYB4txFrz1N/p83V9/vxKdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795852940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=uvYCv8hY4UfHhfetpozuse+xYZWS5m8FKY73N24xD70=;
	b=4q0Ioc4+5d9HnjKuH0PBK1ZZIt6OMEC9802rEeH4eu8Mirb7RTJArBfDrhxyuIdH1U53
	 oOXCJ99q+HJB9hAfx9V9K4fSn0e/Qj2YgXLC7SfDrzOjiMr1lwgRxb+mB1EBWpxTIwL38
	 DslC5TQVsRmxYo1PCWETuy7umsl+l42tB5zmR6/hN2IVrqo58bzhLsYsM6WIsFtgPfT2Z
	 zXvzWclC/Nri9gZt5IM0+eWpM4+0ZQN9yVvpoJkJOguXE4OoaeQIOSk67zlNKact5DRfn
	 gbCubh/H6gFVem87xqly3xTdilaEK5PEYHJZ42Vtrv1DBSB5+bmRuzYN18q/GjtA1LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LdeAbaCm;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682E5606A324
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 08:02:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 682E5606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LdeAbaCm
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so54231995e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 00:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795852939; x=1796457739; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uvYCv8hY4UfHhfetpozuse+xYZWS5m8FKY73N24xD70=;
        b=LdeAbaCmG6aGvR2nb8gxW5A8NUpC5be/ax/tgsLkZ3JfclnVHSCztMsXwwaOxtfCbs
         Whn6R4Xgag5vvedOlLOOqZIFnO8p/ma9v3ewdMLMmUyJbXJcCYsbNL5BU8NrNcJm0+oO
         eSwAcSAwqLPgE02R/6QTtbzMaR7x4ACNhuLU3ilAUFgQLJwW15oDv2Zj8CLXGoYhlgUI
         KPtuMWxjbplrMNqe/O/GPbWscg6EDpj7foYgYY/edB2p0i/glCFuhZ0rShexO1TvOxJ0
         V83OwMTYNND+twHG115GRwZtJlnojvLS57hCFDQamb/4om6vZZDhNJMq1HEeB6yzOL4r
         qeEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795852939; x=1796457739;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uvYCv8hY4UfHhfetpozuse+xYZWS5m8FKY73N24xD70=;
        b=Cj8bZEYdI15hwsTMrL02JIFtsMOmaykoBBrVEaD53ibDAwmXbjdCzrE36gRMazgGXZ
         xLVm453lgrQLJELOOR7OkxRmibKA6q0XI4sIEEUpAamSWY/bwma165QAPP1/WIeTtalN
         nmy3yxSBlV23tfN54rUQCS+4UP38cVyEFs+GvYUGc1ELUvrZhKAggy3wj7XWNV1cYEYI
         HhmQz31LQjcuYHtwsvFNFQ41+ib+7uf7NfaDEqcodJXX6fHNraDGa70wvZsHJymU6xr8
         CHEyp8X4CwS8Vstf4QsTvzNivftjNFblL2Dsb6UPLpOboJe0GlSWH5GyEAvq8xOd9UO+
         mzDg==
X-Forwarded-Encrypted: i=1; AL+hErG7savS7Q8sA1OM1+I5gJvr0/ZPBzQL28g4w0Y3gTvj3CDePnuDogeHyYya8gNWNaTZjXSJB7mkcDXe2GE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+x8hEnGsJitrH/Vefl8bb7JW7i7vhIG8bhoI6EoocuSCL6EQne
	BYSyaO3O/JKKY3NYIOZAfzzSkS7xcTOb+F9zgVe+qGFZ9/M97p/B79Qur9a029EkN8U=
X-Gm-Gg: AZFdTZcnLWDc+nZVzkKlnPaiB06EHFYRaxT4W6lcghuYgGa1xgft2CXSBXQPWRFl1gY
	TXd093zinPtQ7sbTFvmLidNJK2E0TDIkuIHFXnsWBNXX9SSZou8JPN8rQi1Bln1VJ8Z/hFtP2ef
	JLMTpNZVCIvSQoIx+BOakptIV5B21gNeF2YCCpbo6gIVCXZLIQW4XYFY0g36Xf1lPKe84/aF2E9
	R0Yh50SxMxVxWzsm0AQmacjYlYruJih8Lxu5TnRubd+TkOr8VRlFpEBhW9ogRA19p/zPNjm7xkl
	EvQA0Ok9XmDcqM4ayIVhTYbVX9Y24GUL/OaAjvaNKD2UrdEdX/OW7yDNReppbodiNGxksG+ooVM
	VzcUoTCm91LibfXxrSIul2dWlIdq2gk1tZov6hIQmQVrAQtzSTLlun7r+TwLyUl/PCpBiun4p3P
	RvoTdWxZlIjk72tz8XkqV+/EZkWDRv074d5FmV+FcA4z7kORgH7giXdXWaDPYIJRpLqdbkgCCPP
	Ify9YkBzpRdhaCoHbS1xgOIGkF7bE60cKZL/ezAqPtOBqk8P61DcDIrNbQqzKczyRqFIVxo19lT
	EF5UsT+YJEBhqL9MAnf4+SkmaW1Mv1uLd+U/1SRGrd0S3a0VXRFx7/971ZiTQszJcBGV+cMXdYk
	=
X-Received: by 2002:a05:600c:5303:b0:4ba:4928:8aec with SMTP id 5b1f17b1804b1-4bb88807d7cmr505581765e9.9.1795852938637;
        Sat, 28 Nov 2026 00:02:18 -0800 (PST)
Received: from localhost (ip-005-146-085-079.um05.pools.vodafone-ip.de. [5.146.85.79])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab69bf680fsm59330195f8f.14.2026.11.28.00.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 00:02:17 -0800 (PST)
Date: Sat, 28 Nov 2026 09:02:17 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alastair D'Silva <alastair@d-silva.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Mathias Nyman <mathias.nyman@intel.com>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-usb@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/11] phy: allwinner: Add Allwinner A733 USB 2.0 PHY
 driver
Message-ID: <awqKD6EufgpjsjP8@monoceros>
References: <20261127073231.1776847-1-alastair@d-silva.org>
 <20261127073231.1776847-7-alastair@d-silva.org>
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
	protocol="application/pgp-signature"; boundary="6xgu3d2pgo3fouvi"
Content-Disposition: inline
In-Reply-To: <20261127073231.1776847-7-alastair@d-silva.org>


--6xgu3d2pgo3fouvi
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 06/11] phy: allwinner: Add Allwinner A733 USB 2.0 PHY
 driver
MIME-Version: 1.0

On Fri, Nov 27, 2026 at 06:32:26PM +1100, Alastair D'Silva wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

<linux/platform_device.h> provides of_device_id already without the
unneeded build dependencies that <linux/mod_devicetable.h> comes with.
So please drop <linux/mod_devicetable.h>.

There is no need to Cc: me for the next revisions of your series.

Best regards
Uwe

--6xgu3d2pgo3fouvi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsKioUACgkQj4D7WH0S
/k7jYAf/QI/UwQ7qh2BbAqLJFatOOEv5i4Gi+vBVMqy7v16wMvrk3u7U4/ECqS/O
C2/R+NZfyAK6CTe/5t37K/v9LeyvsEN4IbMSK3b5rwXFErl5KgfUZIBdgbD/1BJJ
UP2X0g6ABsQZ5fNkNJXk8nerljU4Pxf7OUuWsz42+HHHKiq9AcZwAZgrS/TttgCN
xeKamMt2XFYPMdjOhAhO57r/l3qPChmlWbT2bDdzM4i9nTyLBXrDRghnJWItoaN4
puwi4x03yymrmDrp7IH2TYfNTOy/Lcc0OcjvpqxxhIG18CeOOMBMdMXQofE0HdQ6
Htyr2kbi6xiqECUEVFTnuPE7uy+hvw==
=iKhd
-----END PGP SIGNATURE-----

--6xgu3d2pgo3fouvi--
