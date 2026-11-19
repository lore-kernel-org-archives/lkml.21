Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106980;
	b=jM0N3ljWMa9jn6w8rjyS3TrcAGtfMCak0oMaau4ArFWFCBnKJ0KjHT4C90kgvvJb7uqf
	 4hoDD0yD3jpwVeMIziCm00ZyC+1hIzE9iZiHcIWZCj6Lr3nKaNUh2pPn1pdbZytDItQVf
	 7XGbvoYskUc4nTB2amZB9BRcPAl0eISjVsbQ8InHn6U9OMVuXcZRoim3sUZ5V5fHG1rRE
	 7lGubkIhI+aGLTwDmQWGzxubZpKTEHdZG3OOe1GCOqAa9Wgn8DZAiQNvvnUMo0xtYVd2x
	 d0PHaaNaePVvpOsXq3sAvEDmLtLuEGz5vdypCc69Cm0rZZeHuQmX9Db5kF3dW0hsA0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106980;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:X-Source:
	 X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=7OV8blyxQN8hICwY12OUvhaHDn8B8mZJ/h6yC+M4VvA=;
	b=YoMrF8PNolYrv2+eOOl/Q7a3Lk9Wx9gkvO6AOJtknCWVRq7irBNj57CiAL+FHxAzQQ0W
	 LUgTTJy66cKNAtUcn1fo0gp2+WM6eGI3FACTniGO/ab5KF4vuopPmLIX3LII10m3w/iQS
	 pn27XylFpdPscvJMKYwq3Z45+/HnDGqV6HLPO6X1VtiA5cgYEEmnf25YSSfaUtMDq5yUi
	 PpD5whADmoDJJr+CmwcMOp1IDa2LFvDesIAqJFg2lzX3ywuEz02NY4h2Qw3CWMT9QSd+M
	 prkPuq12igd/QAG9ldOt5j6gjGziFGJEZspV7MylYgjIjq1Rmco0s8wlv4gvIJdgSOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=oV5v81mZ;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41D2606A33F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:49:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E41D2606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=oV5v81mZ
Received: from eig-obgw-5006b.ext.cloudfilter.net ([10.0.29.217])
	by cmsmtp with ESMTPS
	id TqVQxeROQVK9UU5KNxUgwi; Thu, 19 Nov 2026 16:49:39 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id U5KMxa0XuSeuLU5KNxFWAS; Thu, 19 Nov 2026 16:49:39 +0000
X-Authority-Analysis: v=2.4 cv=NYvm13D4 c=1 sm=1 tr=0 ts=6aff28a3
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=8nJEP1OIZ-IA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=zZ_7FR3VXdKHyqDcGtUA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=7OV8blyxQN8hICwY12OUvhaHDn8B8mZJ/h6yC+M4VvA=; b=oV5v81mZUm32
	W2OuRrvZ71e8GPVLZNH5Hm5UDLnkGHrSFLzdMLuPvTjH+vSRFEeBh26tmV0DIyg9xzmLrgqpGsjHC
	LpoeZyGUWOrWxVY6E4HnKG41Ng+7u+sH5pNY+SJuED4tjW8CJkYuBr8W/UW9EXUoxYxM52Kdtn9sc
	gkXHkDJfQ3Y/Rzux73pTuUxDmRTFbq4kn2Cf7rQDjRD/28I1r/wp3DkFALQ+4gfdsOS1mDlM7/a0x
	8ziLJK6HFedOzqoFNaY1qI1a8RZNMCNhmtAXtidMCfLoyoRGhKxKctK6Tupp6/VXml/uoy4KJD9kH
	kW6of81p0xioaVDnSh3FkA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:55080 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xU5KM-00000003KR3-225m;
	Thu, 19 Nov 2026 22:19:38 +0530
Date: Thu, 19 Nov 2026 08:49:37 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: =?iso-8859-1?Q?V=EDtor?= Hugo Silva <vitorhg20080@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (ads7871) Add error handle from spi_setup()
Message-ID: <58a7d381-fb19-4d55-98d5-dfdf9b16e2b7@roeck-us.net>
References: <20261118092928.163553-1-vitorhg20080@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261118092928.163553-1-vitorhg20080@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xU5KM-00000003KR3-225m
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:55080
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 2
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfPqD7Qy5svo3+lI64UrlpT9IebN74qFLRW49pN48SvveXYQaBWBKMkgbNKcIHZBPQW6HA+3xry4i945Er9g9mSzzk8pvN/1jo2BHELuAs+6CzPzRJ48y
 nEruE5z/qnrH6chXcZnCs39MJr+Vkd/cGM/G+jzVDljuF/C0LtfIBHKOB9xdfGmUKSOZ7EyTm1SqFpHgqg1v0Zmu4auxRg5oUOr5AGn8qM4WpPYCsBAEmRDE

On Wed, Nov 18, 2026 at 09:29:28AM +0000, Vítor Hugo Silva wrote:
> The ads7871 probe() ignores the spi_setup() error return value
> and it attempts to write to registers even if spi_setup() fails.
> 
> Return the setup error before accessing any registers.
> 
> AI was used for peer-review the patch.
> 
> Fixes: e0c70b8078629 ("hwmon: add TI ads7871 a/d converter driver")
> 
> Signed-off-by: Vítor Hugo Silva <vitorhg20080@gmail.com>

Applied.

Thanks,
Guenter

> ---
> Changes in v2:
> - Clarify what happens when spi_setup() fails.
> - Describe the fix in imperative mood.
> 
>  drivers/hwmon/ads7871.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/ads7871.c b/drivers/hwmon/ads7871.c
> index 36297bc6d047..a1ffc35d9272 100644
> --- a/drivers/hwmon/ads7871.c
> +++ b/drivers/hwmon/ads7871.c
> @@ -187,7 +187,9 @@ static int ads7871_probe(struct spi_device *spi)
>  	/* Configure the SPI bus */
>  	spi->mode = (SPI_MODE_0);
>  	spi->bits_per_word = 8;
> -	spi_setup(spi);
> +	ret = spi_setup(spi);
> +	if (ret)
> +		return ret;
>  
>  	pdata = devm_kzalloc_obj(dev, *pdata);
>  	if (!pdata)
