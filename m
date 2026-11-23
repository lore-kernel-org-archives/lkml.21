Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425421;
	b=AyjR3SsnnosZ1drzumVTk08ME5CELeK5++HdfSiZN/hnVR4WlCgcylKEpwpaTyLSpWvD
	 sQWx1ZevF3BsGqtHUD0Po/gqJxZBbtAdWoj+w1GasAnRGyHoCKCcnJuH9kap+nCDnT5T7
	 /ngMo1EqI91Pmj+xxSDYSjpNzF7cKwsRh+a/CpVlzYSTkxC+Zr+5HozzYlPafWdrtGk3z
	 3PQk8RTEBRsgbQVuX+atq3dgQsluY9wGt+8jvg6ojVwXK2kmb4Fv3wbzkXKnOEO16fFZd
	 W9T5CBEU8sqriiVZGA23e4FlZdXpEzUxEJK8Y7dLg/OMQh7qUNJiuzKy3egYsIvAYhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425421;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=KntknVNj068zKgAq+zdLaDv094kaGVDF9/OJXVQRtwA=;
	b=5fNvyDCovjC7qwIb8IFzQLi7J57NVZclDAQbkOCiSqrT6wBgVSB4lWzYy1IhXR7qgfVi
	 n5bQ228d6VoKJSfjeowjX3AK8f4N1cvaphIA8Bxu0YzN6o5xU9Dl7bEWI+wzQqrjpJA1Y
	 RMOuG1OE2JTMN4dsfywqHTLJlNlG6QjBrj3e5tjb/wpHdlif0hwq2jB/zB65coemjX7eN
	 QS5bTv6vV0zmOoUtCFyWqgLYVcEfb53V2U6/uE2o/Bh1vSKTe5rGl7cOwPQUwymdOWB+O
	 4c7U3LUEVvF7IeEp/ubvlzx8yiWVSTbv0/KNEfq4uNmJr0CXRzanMY6VaIHwNJHAflw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=SujOSC3b;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682D8606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:17:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 682D8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=SujOSC3b
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4a9be758734so1788686f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795425419; x=1796030219; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KntknVNj068zKgAq+zdLaDv094kaGVDF9/OJXVQRtwA=;
        b=SujOSC3bJ6T5qZYnGcOUlGfGb/XPzEz/mcEywcTIoGYC/v/096w5zQui8EIrk/p2Cv
         cKCrDJV3hNKyi4Q+XaH1MbeqOl2FjAJPbqvclju5ti9weuviulXhw7yJ6g9cD8SnB+EY
         NiRHE6rL1xTY7zHCjnfM8vjPsa+ffWVQI+MXLuMxh6zoIGTMDPrOFTgpO0ErILuJt+pE
         Eq2bhuFgPdWjpQq+YtoYvEh8QCknNuwPr/4YslboIRW6Tb6Q0WlwOiizJDnAwN30eCzO
         yJ09eoWNrpIrDwPh1vIqEcRloBzHouFWuo6mGf1X0BK+tC7e3DB6KWGRuwLm+GgwrSnW
         o16Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425419; x=1796030219;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KntknVNj068zKgAq+zdLaDv094kaGVDF9/OJXVQRtwA=;
        b=O/YDBzxRe7tEXcLki8qQlrkXQfb3AzapLvVR4jd9vQpjSRQJm2DlfE8VhQKtY8Tgg3
         hh8wIfU0Jzy1lUqRZ1abfKe8Z3vlneKa+DyfPSP8RKPVNkm/UrwodlGG1YekKaHFDYna
         thEI6dCwDSHXWi5kzzI4H0TMxcYmfe2jPTzOSrmNaF8EyFwXnT4lriKrqwh5zFE6Bf66
         nRlkZPvOrVV2GCStyXMeUsBns3wrKLM4Cznvy4Ly/Ac4yz6zsIgdnFrvUcot8O4f3hhO
         dmks/MhYjh6cqQtMb1yC9xb1uC3xCrHO8rPEErL4bFjbB8lr1eD3gyo2mHfsPCeeGoEz
         cDtQ==
X-Forwarded-Encrypted: i=1; AL+hErFbrwNY7CpdM2FgInWm3hoeEClT5qguzhLajTZ5Dqy944gisNr68FcrctMrb7ZIZwfH7nJ/ZsNxkd/H6NM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/G2T+LrptqZfaBv8Z8BUF2adE6YuzQOtHdIXpMC/66dpX/9Ewq
	+9mqOkdwiwr/cIUrUkFaqaO5l0OrJB1OiLynF7QFharJILCHYl7iRtr5N0ULnKLNuUw=
X-Gm-Gg: AZFdTZckDdzDZLwFhJzqaelLTEp3YnBn5ZpBzaJntI/UPBYobMbGgI5yA+igUnvT7vx
	Lfn8XFcRKchxfgt/m6O7CLhqd7G7/LR+8MBvVQ3TlTGuKtjcxb/QrkHZa42v1yFAL/6/YMaFuIf
	4LRSvO/2tJ4Hbs6B5Wlfq6+TjCe9vlWeIp0JhEZ+yHLowONUGxB3kJGv8kOKakCP06zkVJGcmtm
	oGVEGYwSEPXyRXSuKhwGFM7GFfLaae4RulnEOfICbSAL9Q4qGLCcLoKLsXu7LTYXJ9fzc1g3tih
	gjmeUdZ4v+l+bts61LBcSzztsau7Pe8Ks9ksMijgJWBsICZivQ7SVmoZIIUaaV6gm8BpVm3pOCU
	lkt3CgWSsDNTrYvtrq0lG+j4QVsO8sUGN56qZnP8hHjo6vQYjZv38TWbNZxQiCqwmuKD7eJE1rw
	UVHnG5wnKQwAUsyocMBv0bWOoH+UhOoT985MZLtJxbfg7QjtoVbCPao+9lgoLrzWem+LniWtdfX
	uR7SFMtfLjT3Ke/ngdy94jNztHDSF+cAIUDtQjI1XzCaPSEmCVWdu//2FpnQg/NQvtLitewDKLT
	O7O/4KeG0CWs3uHYUdkoFh7Vk+/ny2pQ1aGL7aMe4S15qhe72L/fBmgYV6x8oO3bb0jgwSThwHA
	4Ef/qN5YMWx9BkayHbD8dY9QjEJyOSTjlGAxGMg==
X-Received: by 2002:a5d:64c9:0:b0:4a7:69c3:94d5 with SMTP id ffacd0b85a97d-4abb0e469cfmr20062459f8f.28.1795425418389;
        Mon, 23 Nov 2026 01:16:58 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab69bf61e8sm22313933f8f.11.2026.11.23.01.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:16:57 -0800 (PST)
Date: Mon, 23 Nov 2026 10:16:56 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: yogo.0917.sabu@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-mmc@vger.kernel.org, linux-doc@vger.kernel.org, 
	soc@lists.linux.dev
Subject: Re: [PATCH RFC v2 08/13] Input: add polled SiRF AT550 resistive
 touchscreen driver
Message-ID: <awQEP9bHA0RPfRUA@monoceros>
References: <20261121-at550-rfc-v1-v2-0-b0309d0789b2@gmail.com>
 <20261121-at550-rfc-v1-v2-8-b0309d0789b2@gmail.com>
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
	protocol="application/pgp-signature"; boundary="o4xfpqjjox3khpoi"
Content-Disposition: inline
In-Reply-To: <20261121-at550-rfc-v1-v2-8-b0309d0789b2@gmail.com>


--o4xfpqjjox3khpoi
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH RFC v2 08/13] Input: add polled SiRF AT550 resistive
 touchscreen driver
MIME-Version: 1.0

Hello,

On Sat, Nov 21, 2026 at 09:43:18PM +0900, Yuugo Yoneda via B4 Relay wrote:
> diff --git a/drivers/input/touchscreen/at550-ts.c b/drivers/input/touchscreen/at550-ts.c
> new file mode 100644
> index 000000000..89c2d2701
> --- /dev/null
> +++ b/drivers/input/touchscreen/at550-ts.c
> @@ -0,0 +1,124 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* SiRF AT550 coordinate acquisition. Layout cross-checked with AT551 draft. */
> +#include <linux/bits.h>
> +#include <linux/input.h>
> +#include <linux/input/touchscreen.h>
> +#include <linux/io.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>

<linux/platform_device.h> already provides of_device_id without the
implied dependencies you get by including <linux/mod_devicetable.h>. So
please drop the latter.

Best regards
Uwe

--o4xfpqjjox3khpoi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsEBIYACgkQj4D7WH0S
/k6Mogf+I4t6gj7ob8tkta5kHm+YP96+f6rsROw+nYQ5NXBDBTwdaHgtuxTw/3u3
9TSFi59BI6mt1CJkV2ldOhel8Do0lFyFlVyx1+tlaLGNAjrt3f8m2IWJcvQU4hQK
qCxr790Ac2+n+6M13QHVHO8E7+V5Kxu109uuNUNUWIsrjawNdIUx+lqOywM9o/JT
s7dUkwPF41vgxb8gPn3Hr9uAImmkTspc70TUfxqNtGVNmQlizkBCtSCoABv5QCdW
mXZx4sl+NJUJpqZ/jj0ehbdZ1DT8xVBRF1ZDrDU0AdqO6EAWVEnOx3tb5+7JsaKI
HSj3Bm7869/tgf+jXQ3QF1Uu7I1vmA==
=UpFb
-----END PGP SIGNATURE-----

--o4xfpqjjox3khpoi--
