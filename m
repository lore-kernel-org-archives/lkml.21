Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795503930;
	b=OWgz8GNZ10b24du68G4cuVYyLix5nJH0skfyc93MLbA1Z3FYI0wZez6OQo8x2OYe7q+4
	 WVwaMl7yffEDHNAjxyLTdK4nWu3adfMwxEczdXyy3pyoPa3WFC7SeP8PVMh6PtGhT/5hM
	 5RBuOo+6Fe0VoG8P0gYY5tGCXd/9Z3jYb7r8X/nyCH3YWRVIS83D6Ix0CFS4BA/Q4y2ec
	 ZUj8H4U3I1K1DajtcTX3JkFZ36mCkXOdsDdhuUGDzjqbAyZsGseq2BSuT6VG9+PIAVZCZ
	 iP9PEb/ppGG68VNgWDHxRem+spKfRj3WOb+1YTFFrwXCfy7E0XOJ5P9MhCN2xbNRInA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795503930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=uWITfgyRJ+DT3n8YFgueon79iakRaQERwgzzXSP2YYo=;
	b=FNuzioxV5YUlOEwevDXY3xngtZ6qIh27YAV6pQ7TefgFd1LTOId2izlsIRx3o2Rx0BRF
	 hh9RxuoiGifIg6r5I7T4fzvyagfZMCCqwrE1AZIzfnhnWrTvHWPlEiwyIMDqaLtcabc/l
	 NcWQlCscCVroZl/rS/UYk3tdsXMy86A6XpkDUu2UjMPev+LJOtsLJQuUh6PqIr2dpcuY3
	 pwFfS1bUdnj/PIUKc6Oz/7NeRjML3LqW2u7DDIWLvJcJ6un5fvGuLNstZij3etGl/Q5N/
	 kakAw42sycsqhYY+YThvG2n5fXQS66zNkV5I7vGg+UW3IwwzgjITJrmneS9MqNXfSWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=kqgoHF2Y;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FDF606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:05:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49FDF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=kqgoHF2Y
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so41530015e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795503929; x=1796108729; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uWITfgyRJ+DT3n8YFgueon79iakRaQERwgzzXSP2YYo=;
        b=kqgoHF2YDALc+f9/RieVMk3nV8G4RNjhav/vx18ZWMiMNQndDTGFtpK7lcTEzu4Lkn
         9D2G5/ZTGnNt+knnZeBE3unSxyw+zi93B1ut2dNz73+v2ADuPbdSWQHuzgkO04DLXmjL
         odO/YveQjmNTTn0H+03xgCdf1ZxUHYInFSTZxJpWBDm3bXL2gxi5n9PTKva+gOc/DtR7
         yntni/qD8wXpjNrB5LrlQnzvYJ4UQla64AG0p/S/lLP9GdKCnl4O7O81qKWlobG7lzKs
         4w6H9D1N6dKGYzVyikfctxOhKpa53SVjdwgzU+e6ys3k2v2tqOTyW+ukNX2O25ez5MGH
         HMUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795503929; x=1796108729;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uWITfgyRJ+DT3n8YFgueon79iakRaQERwgzzXSP2YYo=;
        b=xw+W90Ji49gsrgD7DjARrSi/4NLumRpZVxcVi6e28STOID3lQ3RNDTc9yCrVbyWmDS
         LbJF91pVeZxDoxOPR4aobfxP4TjzzsL2/eAZ24FEx1oEzshX1rDm6b9zhD09wIjN+bWV
         9My93+vkutIsx+iGluz6nl4K0RR5x1WoXzWlssixU1gnpd5InFqBkCeEs8XWom5S5wbM
         6oII54WEIr2O4vkfnaZO0fC0NvgBlr5ZWqXfNMMJQoJLUZRj7DmhXT8B/GvezOH3FsoV
         MgzJflazQn4aDACDPCYLTpdLbVhI2Y6B4BBl3w7nO3bQtqxq8RAzygymybb3QZzKwlmR
         N3jg==
X-Forwarded-Encrypted: i=1; AL+hErEVfEKpb91vP71TC0c26+54CTQOS+JWkIKxESEVsqdnj+o/VcEbH3I7vAcVn06s2lEGJSFZZIUEHShtlcM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8M06I6zqhyyNzu2bDCZV+d9MaXTPLQogf/b8sYY6ZNb9XPj9Ad
	mC4aYt0PRXnn2m2JLyYgg4kzmjl69LrR7doZATCT9oUFjlfeV/H8BegymBLteI9nFAM=
X-Gm-Gg: AZFdTZdSAAGcTB7jPYY9664HrnaSNjr6RDNCyePoYXPAk4dRjcS/cA+/7JnUCHHac0/
	xnbA70HsAfgcEq+IRg0zgzdqCRhZLAnE3Eu7Ao04s1IkAUgv9CxS9uRh4nq/cdfeZ8TWTuvixkl
	quLEpB1KX+FvTl1/fPgzTRMPey8h84q8oVQMMp9DwxN2hnv0UxmVbk+aR2O5DizyOn/NmSdbIka
	AV8VEXMx+YDlMeMfjgGi+RU3XeNwL4LUuSYXZUH/EnBF87JSaQh9tDkEWCAwSitPhWjo7MDx4te
	ArEuKuF9rg8Vvar5XPAj12GzI7UXVtRRnLYJk//RvYNtWyD/1lXhR1ZeT3Q6mhceTH/S1tXdZhD
	uKB0cNBsd8T9CPfQilJznCW1WW4g+EeKNi67rPUjAfpfcwdhwJHV6arFL+XENsmXw1KnTiS5EJy
	CgZfEpkY/6HrS6IEyS7o1LwNf2w6hGblEL4Nt2kw/3HMyHPi0LipY7Qr5W46BR+45MW4Iqot0Ve
	HHDoVC4Ft6spCu58OcGa2UVI1zPfekNcoqRAz1tnLi2TsXDJm9zaP2S/Nonf7jLZdtQIjC71ST/
	y2a4IX5YvZVclG5Dq814/vHq5rkWEzgyBqE=
X-Received: by 2002:a05:600c:3b9e:b0:4a1:cf60:dcc3 with SMTP id 5b1f17b1804b1-4bb88820687mr324067185e9.29.1795503928774;
        Mon, 23 Nov 2026 23:05:28 -0800 (PST)
Received: from localhost ([2a02:8071:6e30:8500:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb8526cbd0sm541592115e9.0.2026.11.23.23.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:05:28 -0800 (PST)
Date: Tue, 24 Nov 2026 08:05:26 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: filipp.dunsky@gmail.com
Cc: Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-crypto@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] hwrng: Add Cortina Systems CS7542 TRNG driver
Message-ID: <awU2-KjkZB7WvqfX@monoceros>
References: <20261123-b4-cs7542-trng-v1-0-92d9ffcee531@gmail.com>
 <20261123-b4-cs7542-trng-v1-2-92d9ffcee531@gmail.com>
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
	protocol="application/pgp-signature"; boundary="mtdygncuvh4wucsf"
Content-Disposition: inline
In-Reply-To: <20261123-b4-cs7542-trng-v1-2-92d9ffcee531@gmail.com>


--mtdygncuvh4wucsf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/3] hwrng: Add Cortina Systems CS7542 TRNG driver
MIME-Version: 1.0

Hello,

On Mon, Nov 23, 2026 at 09:41:35PM +0300, Fil Dunsky via B4 Relay wrote:
> +#include <linux/bits.h>
> +#include <linux/hw_random.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/mod_devicetable.h>

Don't add <linux/mod_devicetable.h>. of_device_id is already provided by
<linux/platform_device.h> with less overhead and build dependencies.

> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>

Best regards
Uwe

--mtdygncuvh4wucsf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsFNzMACgkQj4D7WH0S
/k4RvAgAkmX1z3ggD4bQYR5QDbQBtW/xgm40V3vJbHo8sFlOzs9OnglLP+iPjhHu
WKQBnpxjsqZITO8X1LvclAujKd6LAR/OEzTxOML37xIoq2uBbct6r4uBVug8dmzk
0TZf3jIxobXh6AuI2klxHcrpbIkEKAJgKFnJNJnRnS2pjQnmue649DpG/SF2PgAm
tIIPrcfWA1AyLg82sa98l6cfBXT/Cj1+457Y+hc7mN9Vs6T+gLTj9cRd+VHY6cW5
FqY3RUG/SNcyRVT4K6C6iR6RS2S41VNXYMCkhMXLIxu7ERVkC/tz2juaeFdUr1Zp
bBg0EPgOCTpcZl2EyaSSblW1G3fqCw==
=IJHG
-----END PGP SIGNATURE-----

--mtdygncuvh4wucsf--
