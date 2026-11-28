Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795852799;
	b=dsg5x7O5hkMQJsH82t+kZJJUmsVimYJ2Nj4JcACZ/bqUcacDf1KtwaNCJSZathZtA+tV
	 Ed6Rt2rys0Pqd51wNp+2zQoJEO3BMmTaE91YPvi6d8sxdRHEQm3LfAo7V5II7letEmcTP
	 +B3/YEo+s4z7jBCqjJXZqVLmfTWr4S0ojH5GcFsYMWFpDBxlmCnRHGy0zzDMJVWkI7lzS
	 O9yT61zmGvXboFH2FADLaUsju1Z2p9fW3ceDNH3kdDzm6mVJ8DYW2G/oUVR1h+JlUZ+Ir
	 67aPlMN/pEDUHBh69tiRx1CidxXah9R3+Hnah+1n8rnDuVQ4mvns+bwOZlaexa1P0SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795852799;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=rECzFDCKo4XXlZnw/34prSvNBZQ0YYwmq2ei4FG0uow=;
	b=a1r0KdP6NQVTP4OURwfkQJPEAO9cAlIs/T64gD0pI8n9tPDQhxF/Rc8ggC8dPTXMiMZ/
	 UZ1+l0srXBncVAvEqDeeUuF1yLScn/wc3cjBQjMUeFZ2Yz4wxr1J1prrEaEKCK7e2UxQr
	 2VALU0E2SejlEIwNQFnhqMWqzsvJEkAgPx0qQ3u/+aSV4p4xY5OBHatqTbJY3tVElXNDK
	 fWEUH33yWoegxYTBS5loUNq4pFm9E8YkHfIpckpxGsBUNmJPgcmrW9F13QY2mlUNoQd8T
	 /9HJehu0PGHKJlDWEJReid5epRbNDqboJMg16YBKSlmuZhF3vMn3c6fCNIsmlEvklgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="i/U/to+v";
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3B0606A323
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 07:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE3B0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=i/U/to+v
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-491846221ffso7738608f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 23:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795852797; x=1796457597; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rECzFDCKo4XXlZnw/34prSvNBZQ0YYwmq2ei4FG0uow=;
        b=i/U/to+vCmL1lcMOCEc3owu39hWkCjDpqJ213buTkVu7MoriXmrx+7OGqlR5mKjN0K
         HJznAwo3QdHX+mccxMSx8rXVqDLQlnkM3P4KKsZD+//BlVONCBDPn8pZ4yevOzRiXp/I
         gJxK0s6juwE0bQ5bE/7yzG82cu1twxYL71VfcfhRCV7DMYxDCXh5JSCk5HmLwiBDbGcK
         /3LWwAPMgikzdeET6ZLrmfguyXOEAu3q8eXawDWa1Mz3qgEI2CVV/tpVSCKAYuyGlmKD
         c7Nrf1KPWTMmTIelV6zqs20Kg89Kf0hmSLldDN2UR8QXyMgoiMgC0Yrgxd++VBF30AKW
         lUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795852797; x=1796457597;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rECzFDCKo4XXlZnw/34prSvNBZQ0YYwmq2ei4FG0uow=;
        b=SafVLauY9Vn76qeW+vsXS/d4b53NpE76p6zslPqbgZ4JWWTlMLgNQQD7Dw7vRX6Qn+
         f08M+yrSbLVfcpxpWWd4MFLXf59bdL3Rtn44u+MLHPwJFyAiZYBBiEAnL9aLbpAix6oi
         NJvrxn/msYm0O6QKvgsTsj6jAmXAWVv1oDN0u5zdWt+WeplRa8BMXXy/jPqku88XBKhd
         iEjY2oSnXSax2yepA7PoQ981/xPDv+SNpQUsqvsfDXqYOiaJY18xVr122R4L/tjYDsr0
         61uCh0mbxz+v5yMt3N29R7L4R1W0Ke6bkTu/rlGRGIe7OyDWhpSiOavqblodUy5D5FoD
         6kDg==
X-Gm-Message-State: APuU4Z9GCW8puTO/eMOVzhOfND4PcwUX+ZLEp5JGHKNXCAte29Tv3hy9
	kkUQGzgx25CtsLui4yioXEThQ4VIYn5/5vnEyaSCrK/QFkZKjwYC+RDEPyboZzxURyE=
X-Gm-Gg: AZFdTZcf0cr18IuYyyJnlBcz1AspMzr2+3vjPxsq2MB6uAknoDVkyDb3YnR4mmXLQ6h
	29FuAk73mUjvr55oOzourSHp36DTp4QJXYOhNNxSrG4yijWpJf1MYVVp2J+a3FdnIpTwSWX/aN1
	FjPj3JAuHBmNetPPsLtG38TvTrJ7TQ7H4K49JyygXVJhpprpsre+hKB2k/Tm9CQZIVxHUfW/duW
	b5hJ3uYwpTwr9Cv/eqy7gT+3rurdlnKsGOIU5hOLObkSJAIJLII0uyhD+tyhXrKQv5kpGJabBwG
	KJ7tOTT/JCu+WhUZLrEk6moCfX/+vaupSEoBhI3RmHhmrpJNj9GR3ING9SdJ/3DZpGCTxflZG8M
	7JwIxBsS38N/u3abtOG3TlAudwnCsl3OUWBJvcPywkNbekOrZXUgc1TWc14euUBXlkkW6mfQ9ua
	kcsY0w2MYIedpw1bbO27Yz4S+ZfwOwOsBgvHLWvPPPB2xFtgaNZFcYEd7BHO+KaRggSSux7m4sf
	zN+vzTHUDcW51MPi/N3w6YzbWfNp8mNqwzTV1Z6Byw+vCiCB2Nq51JrKkz/tXM56Nq+LnK8BDoo
	C9oF7gwWgVsGSrgm7eaCG7Xx6jNrD1LKbiB1h8+ZEs17+9SnlCY2NkS+fjQz+/WFPvIrxvpCq/k
	0
X-Received: by 2002:a05:6000:2893:b0:493:f3f2:2241 with SMTP id ffacd0b85a97d-4abb272746fmr52992473f8f.23.1795852797142;
        Fri, 27 Nov 2026 23:59:57 -0800 (PST)
Received: from localhost (ip-005-146-085-079.um05.pools.vodafone-ip.de. [5.146.85.79])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab6b110ba3sm42679550f8f.35.2026.11.27.23.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 23:59:55 -0800 (PST)
Date: Sat, 28 Nov 2026 08:59:53 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Shiv Prakash Gupta <shivprakash.gupta@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	linux@roeck-us.net, wim@linux-watchdog.org, vikash.bansal@nxp.com, 
	priyanka.jain@nxp.com, lakshay.piplani@nxp.com
Subject: Re: [PATCH v6 2/4] rtc: pcf8525: Add NXP PCF8525 RTC driver
Message-ID: <awqJkqQ_8tXGIqo9@monoceros>
References: <20261127083807.2844507-1-shivprakash.gupta@nxp.com>
 <20261127083807.2844507-3-shivprakash.gupta@nxp.com>
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
	protocol="application/pgp-signature"; boundary="5kez4omv4kntvob6"
Content-Disposition: inline
In-Reply-To: <20261127083807.2844507-3-shivprakash.gupta@nxp.com>


--5kez4omv4kntvob6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v6 2/4] rtc: pcf8525: Add NXP PCF8525 RTC driver
MIME-Version: 1.0

Hello,

On Fri, Nov 27, 2026 at 02:08:05PM +0530, Shiv Prakash Gupta wrote:
> +#include <linux/i2c.h>
> [...]
> +#include <linux/mod_devicetable.h>

Both of_device_id and i2c_device_id are provided by <linux/i2c.h>
without additional build dependencies as are introduced by
<linux/mod_devicetable.h>. So please drop the latter.

Best regards
Uwe

--5kez4omv4kntvob6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsKifYACgkQj4D7WH0S
/k7agQf/dUy7wCorcL/I4owilXhYjnsXPrSYVFuZTI3zBHYDbdxpHZa80WwZlBG7
E4SFU0OwJbEJe6jfB4zfEAJno76UQtmfOsPNrRBjhVwTHfHa+eurWy0zb9D/2CE3
T9IHil5xV6MLLjEsteKu/ubZ5uOQpl/GemFXCbkkgQnOoNk3fu9vTRW3m81xJ9bm
uNWYCMXorvZ4Wx7PB2OLQd5RwRNUormhf1E7zoUUE4ilF3XfUbBOvueHDCr0dCy2
b/wJgjIiQzRLVsEcMQ1QhPUbCxlrMuzkchAgFdHqygmuxVmNh8Sz3yBHvjK4aG4Y
MLYKgxWCCTBVfnXialkv/zpFTTAkgg==
=jkpr
-----END PGP SIGNATURE-----

--5kez4omv4kntvob6--
