Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794940873;
	b=RNpMC/A8AVzTpmAMstsNlnRwScIyEAXpsyUYIkK6ee3LrW/1WhamdiGiUg2P0xa5ItP8
	 EXKBKaKOmDoUiy3+/x9F0qh93z3Hrpu2okgMuzPNRZIhHJvSz9JWIbBCv3HQCb4+mD5ay
	 x31wUmE3kBByDBbqdx54T6xBUkxmzNfxbh9p7rxkSSFXux1CmTCNCpA8R8xRVHSZ6ncD+
	 Wv5wfMBOBZU/qIGkNIO/6woxJABaEr9p5yn1sFiPYuFQVB1wN8031G+cHI563tDQ2QeIg
	 eWaH5TmorJCm1wT3+kYpbE37cfNH3ElUNctn8yYhTolKqonXLKE0Co2y4h7pMbOM9Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940873;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=uzgMGuJH7y9PpdqDVrfWe+YpxihFKk8NBF5FqP0/B48=;
	b=PlURJu9ZiRlKS8ACHAOc4LOBAcmCb8AjZAVJ0p2nTCSzWP/aC4WtWOsoTHyCBpTl0dLr
	 kG617inV3tMcUjxdA8k8zpG88sX3RyWgPO/2c8wlljoq/nILv9Je7paXwf/QGFwPNOAo5
	 /nYwuxuOrbkBiw9HqmC2bNPptCNgc1c5JY+l8JiiHyy7L7VP5fHX0PnJuAnLnL9e8MhvD
	 wfwcRAfaZi2zaMF37mgHKzIiYRj4pPH6JPjD8EKMWkvZVdcrXEnu1G5flRO5fkqPswddJ
	 WlR3asR9152D3WZiEjBUzj+Vtx8f+tnxvYnBrwx35Hhq7xa62PBw52dW7QndL8e+pFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=YFDmMSQ6;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3817606A336
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:41:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3817606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=YFDmMSQ6
Received: from eig-obgw-5004b.ext.cloudfilter.net ([10.0.29.208])
	by cmsmtp with ESMTPS
	id TNLBxUBS34vCDTO7ExOhQz; Tue, 17 Nov 2026 18:41:12 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id TO7Cx7scOuJrPTO7DxgSRC; Tue, 17 Nov 2026 18:41:11 +0000
X-Authority-Analysis: v=2.4 cv=WLZ/XmsR c=1 sm=1 tr=0 ts=6afc9fc8
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=gAnH3GRIAAAA:8
 a=EUspDBNiAAAA:8 a=3OfnbWqpRXkE7MXKp-4A:9 a=CjuIK1q_8ugA:10
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uzgMGuJH7y9PpdqDVrfWe+YpxihFKk8NBF5FqP0/B48=; b=YFDmMSQ6njJ7g3TGwyqyWG6HbD
	VSUs5xReDgoBDPjfuNVzXMpkDWlDX/66hznqmy1hiwlGvrhHVLfoIqNb9Ba7058Fj6B3Q3Caud8S/
	RW4Y2jcPocH/FzHoCD50S6gLiVL8jpsaYxgL5l4OQ1Q5cOVPJ0DFG/WWDTvYQFb1AXOYJgsiFNtwm
	irFQAVbPn8u3m8Nr4ILti1/hOWXmj/wc+qwyZYYxG6QAHRK80Bz2d9EgvK8t+nqCigZhOSMU5dwck
	hdNbtLBqmKlatziwPdDFz8+mwwxOXQ0TELj9ZWxiKMzSOemDfCMfTvTmSh7mK4LAV+uRtCpespuTU
	OD6atnNA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:45336 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xTO7B-000000006da-1bIQ;
	Wed, 18 Nov 2026 00:11:09 +0530
Date: Tue, 17 Nov 2026 10:41:08 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Christopher de Guzman <christopher.deguzman@analog.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: hwmon: ltc2978: Add support for
 LT7175 and LT7176P
Message-ID: <ea14de95-c079-4302-8a65-86c4c65a8e12@roeck-us.net>
References: <20261110-upstream-lt7175-lt7176p-v2-0-dd60d28383bf@analog.com>
 <20261110-upstream-lt7175-lt7176p-v2-1-dd60d28383bf@analog.com>
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
In-Reply-To: <20261110-upstream-lt7175-lt7176p-v2-1-dd60d28383bf@analog.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xTO7B-000000006da-1bIQ
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:45336
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 2
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfFXrPRIVHRdOLROOcgJeI9LKWZiQEyPiWoCoXNtqu065vYVUKa7nHZlTwuf917O2YLWBvS840UwpZS1FtpuDblGhq8XSC6N90G4iBSxXseys1nALdAXY
 aM9FqEMrPreQkdJmSfj+bJn7RbUryeUSiGlMKBxzpyN/ke8ME5f3uS8/JsGiFyp6EvbGouiwAq/dGINZwFAXYY6KNp2QQLAzU/79LppNBBlwjCf/4nP/Ww4M

On Tue, Nov 10, 2026 at 06:00:40PM +0800, Christopher de Guzman wrote:
> Document the compatible strings for the LT7175 and LT7176P PMBus buck
> regulators supported by the ltc2978 driver.
> 
> Signed-off-by: Christopher de Guzman <christopher.deguzman@analog.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
