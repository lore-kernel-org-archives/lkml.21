Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795148910;
	b=az761uFRKZU53HSamULf7XvZzl15RlPZcCiMKqEWq5bCFSnKjEaFhgdhSTev1nV+Hmsx
	 GMbDRidtHeAbtmujVA33QJtykoeviSe4atK7kO7SW+HLBk3NJY30L3mm0fo5agvoo/5+Y
	 zk2POtTUkqShUAqgoeASgy7hKvoEY03xjeFwSJ2XJkzIejL6prFR6R6oBYTeafo5qRhAu
	 MZYyb/s4s9BfV2xZ9BWmFbr5U+ytLSLkO15biAcHIB3Rx0bBQXuVU0FZE9XoBv7QG8X42
	 WzSDZs3/pFXvxJ5Eu5R5/ixy61oh1y1yvnPX/s4+JiFn6N5ha1OzA50N1f1zo1mQP5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795148910;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=nLedZFBA7pqqAsbPKZ7gcKV3+oeuaHEN21qa0HYf6XM=;
	b=krPnzyi7YJfDUe7v5TdnHCfj5ICT9MAPJRA2fQoUkpsTOjEXYa4Uw7J7Stj0iHSAglRp
	 Ma9g7MJvtu9ytPJoBk31wfWnmVN1wDYt72BXyFijvA2eLT2YO/Ji562FetksSAdYkaMm7
	 5UdszHjtczQgOiWnGpKWX/3W2kTNv2D77wQIAiPn1ADt0GoeG/FROCMOxVC8iQk4zZmeo
	 x7Vwvy4Ke8MFJbGzrH/LS1oES3NiQODqT+rWjCYVV8INBeRBCmL6ZomllLHJs5B8CtggF
	 gwkO1S9xK55se6AfDJHLYkVvXAKChf5bQIxMipcNcBpek9afFXF2TviQIzo0RVodBPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=FzyVJj7c;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C34E606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:28:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C34E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=FzyVJj7c
Received: from eig-obgw-5006b.ext.cloudfilter.net ([10.0.29.217])
	by cmsmtp with ESMTPS
	id UDv2xgMuwRiNxUGEaxzUKx; Fri, 20 Nov 2026 04:28:24 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id UGEZxu6GgSeuLUGEaxXoyK; Fri, 20 Nov 2026 04:28:24 +0000
X-Authority-Analysis: v=2.4 cv=NYvm13D4 c=1 sm=1 tr=0 ts=6affcc68
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=zpOVymEVAAAA:8
 a=sfOm8-O8AAAA:8 a=VwQbUJbxAAAA:8 a=hcTXbwEjzvrjQ1zhnm8A:9 a=CjuIK1q_8ugA:10
 a=LCD48ZUe64JR9pieE8wa:22 a=TvTJqdcANYtsRzA46cdi:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nLedZFBA7pqqAsbPKZ7gcKV3+oeuaHEN21qa0HYf6XM=; b=FzyVJj7cPvl7dEzz9yFaq4vsUh
	vV8Mtn7m3ZT1wQ+TyHistVMiLvQQiaVc93lEZehmwmIZVDjKlVAegoI/Bi1Q3DVjhrAqiPaZ23QOj
	UDpbQU4rSzBP6QCymIRj+WZgGmJVbAR0U7SI1WO867eMPhV/54DmMbc3ze3U1k/GlQGdxxC7yGS/F
	2PeoUhwh6NO3vETtwcEc8gX6GcLdSBZ061df7JkOC/4gT5KgMYHGSBm9i6Vw9B3nmAiomi71E15IC
	NMeEt27xdyds8cipmdI8jjiusi+LufINp3B2qLNLx++tTxEcghAlJvosRWbgs5M7W0gmWZoft6YAj
	Fua7BaKw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:33778 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xUGEY-00000003dBr-1qLm;
	Fri, 20 Nov 2026 09:58:22 +0530
Date: Thu, 19 Nov 2026 20:28:21 -0800
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
Subject: Re: [PATCH 1/3] dt-bindings: watchdog: mediatek,mtk-wdt: fix mt6797
 compatible
Message-ID: <6002e935-199e-4d0c-adb9-d0c83162994a@roeck-us.net>
References: <20261110-6797-wdt-v1-0-7f07755b6074@protonmail.com>
 <20261110-6797-wdt-v1-1-7f07755b6074@protonmail.com>
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
In-Reply-To: <20261110-6797-wdt-v1-1-7f07755b6074@protonmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xUGEY-00000003dBr-1qLm
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:33778
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 3
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfDgigy7SSSiVLUt910aXKnsA0yzrhqJJ0jGIiDHT6lC+MD1dGE6og5Zppb93yeNPwscSZy44b7w5CS7fKka8unCIUx7RgsCRvhSUHKFhhTzukUg9oCB5
 7iCuCPEyweo5BBGNBwkKpV6hDZS/z2IOhIwYnvpODXUZj2AKkZZF+2DyM/TYFuWXaHRB9TI1lKdIe7KbHQQ++bq1b7j0b0KV8IocAakWOlQaGB9Z6zKOdHbu

On Tue, Nov 10, 2026 at 09:22:21PM +0200, Roman Vivchar wrote:
> From: Roman Vivchar <rva333@protonmail.com>
> 
> The TOPRGU reset bits on the mt6797 SoC do not match that of mt6589,
> therefore they are not compatible [1].
> 
> Deprecate the mt6589 fallback for mt6797 and add its own compatible
> string. Also add a new binding header for the actual watchdog resets on
> the SoC.
> 
> Link: https://www.96boards.org/documentation/consumer/mediatekx20/additional-docs/docs/MT6797_Register_Table_Part_1.pdf [1]
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Applied.

Thanks,
Guenter
