Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795148980;
	b=KAYQtPDn3yd2ea4O+3q48+h7fOnmTYF+mYaMSuhRKm1IUVh+yTt3Thb5KErHTOgjuy9/
	 ipsNICgNg+B0wueixrsXkWrDtIEd55YcX12qrdydLQwjMsrBEswyXpgw9vTrzx6/4zJXp
	 G8u51EonOXbxtBwyX8aGfjCZFjr2pdPkky3cADL/pNIWZOIcRxl4ggNkZtt7irv6C3mfk
	 l68boEuna3BoZHAkLYjUdpf5X3lMYGgN4BtaFUnEeI0zc4iKCwmSIPK3Kt7Ytz0tUjawW
	 XapDqdP7DICiUaQXTUy8l1W+LL0wgNVsrX6WRlo4opFH5+SHmIEOt97yZECGhxOUBKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795148980;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=NwKyPi+EXp0S/WOyO+1mrzsEeZFSZSXM/L2QcxcxUKw=;
	b=qXAY9HCpLJ2lH8Cc4ztnrmXohds/mrikc+MNF0D7SGUsR2i2bOLbHgApegWu4cmJhGW+
	 IO55/O9zIcMqCsOxmzz0J/6gkw5SI+QqMvw4y7KAfp2E8kqY4u5kEDXLbn8FCXVbC5ka+
	 nPKpixvcXQwWA9gIv1FKmDQAg3YAUCVDH9GncCvhtMKeZBbGaFq/hRn2e9a+SgDIazxPF
	 w8aG3+ji5c/NRg+KRughaYpc7A6LA7Rve+Xmf0B5QYdjfIzwxt5SyyoofeJCEM+TGD9iA
	 FsQ493Qv5mA1J+gPuSN8vN10VGblX31WFHpA+Dm4FJPExN7U3KUvNvc98eosZ/UkmgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=4XV7rKRI;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE571606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:29:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE571606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=4XV7rKRI
Received: from eig-obgw-5002b.ext.cloudfilter.net ([10.0.29.226])
	by cmsmtp with ESMTPS
	id U8KTxexwiV16IUGFnxSFxo; Fri, 20 Nov 2026 04:29:39 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id UGFmxnjT2b2qJUGFnxNItj; Fri, 20 Nov 2026 04:29:39 +0000
X-Authority-Analysis: v=2.4 cv=A7tsP7WG c=1 sm=1 tr=0 ts=6affccb3
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=zpOVymEVAAAA:8
 a=sfOm8-O8AAAA:8 a=RSmfSHFI2LoBTrHSb6wA:9 a=CjuIK1q_8ugA:10
 a=LCD48ZUe64JR9pieE8wa:22 a=TvTJqdcANYtsRzA46cdi:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NwKyPi+EXp0S/WOyO+1mrzsEeZFSZSXM/L2QcxcxUKw=; b=4XV7rKRIxdtmrGqva0T2IrI2fZ
	RbG62Z+GkHytSWmn3OK7x5TcoHPqi2jjO++MwW+nrzqIj6wGDIXNuU3DKMGjBJ7A15TJXXJtGffXP
	Wpx5BPtFNj4E/jP4wP3PWOv6ucUEyGYvFB3j5Jmm2PB3Jly+/q8dNtWn+qJqwr8pCj7/douzEkBD7
	5KOjlIXhDObzVwKzdztx8aRyoW2m85f0vxQTvBWdGYvoMXD1URp5oj7zoPYC9wCLCKV5dVrnjkzNI
	X69gtLKLCLQx8MKJtNFYTnUmZ7zGBeMi9OaZekp2SCQwaen3jA8+tkz9sGZFgE8JMMgxZx/+U4MUq
	mes/Lmog==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:42072 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xUGFl-00000003dbL-2YK5;
	Fri, 20 Nov 2026 09:59:37 +0530
Date: Thu, 19 Nov 2026 20:29:36 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Roman Vivchar <rva333@protonmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Ben Grisdale <bengris32@protonmail.ch>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] watchdog: mediatek: add mt6797 support
Message-ID: <f0ea8f8d-eef7-4d13-8180-ea3e297c407c@roeck-us.net>
References: <20261110-6797-wdt-v1-0-7f07755b6074@protonmail.com>
 <20261110-6797-wdt-v1-2-7f07755b6074@protonmail.com>
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
In-Reply-To: <20261110-6797-wdt-v1-2-7f07755b6074@protonmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xUGFl-00000003dbL-2YK5
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:42072
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 18
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfMtUWbsQGrRjcsKta1lmd7uAqizcRjheahTdY/7arm2P+uiNff3cbuW746eZuyJt7R6+Kk0UHN191DEQtZRXnvpzkDBZZcnb3epf+hw7M8anS95VejhR
 I1oFFzqu4V56EMflEQEdZgf+SLQjF1A6iHqtRBlvYw8AGcvsCpzYPMRxmVm9Wc0EijK2XmpQMQyUrmAd1HLY8E1qZDLLoF4MA7KVdGgfCGsIdzb53B4TPnzZ

On Tue, Nov 10, 2026 at 09:22:22PM +0200, Roman Vivchar wrote:
> From: Roman Vivchar <rva333@protonmail.com>
> 
> Add support for mt6797 SoC watchdog, which provides 17 software resets.
> The mapping table uses bits from the datasheet [1].
> 
> Link: https://www.96boards.org/documentation/consumer/mediatekx20/additional-docs/docs/MT6797_Register_Table_Part_1.pdf [1]
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

Applied.

Thanks,
Guenter
