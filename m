Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795793896;
	b=VQD9jgTegye3GW2QqI4i2XuAT3m3ZI+ROdgb+U48r068sL+TtlfxfMFY3V58f2cOxLdD
	 k0mTWuUYfRVAgkArSIXNX2Nd5thqkXJJooRFTyyewYCf/QPpaUOTvPiw8JuAOv9pBgtxs
	 78+zpAdv9lDs/qj1QHhCLsAzwEtHlQr/eppqs9mYTke4gLXB0ZmO6ekmP1Vx69ChdoIf4
	 3bwZoGJjWQOaFoG2+V5pypv3WQqje8WQ5wJvRKUKPzzPXABTeE54hL5Ad/s2L0Ymk2wcL
	 MYOorvIQPzhf2P2I3uT5aBXEEp2HwSl/FlGIBBlYpT0grH9FO+hhzp7xhFDLTZ7OYAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795793896;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=ixVHN+f6bXwbfLfqFXi/FG437hi5R5SCUVq9nvoVZsI=;
	b=Sd1u9lYDyvMWqt4cwQfFliOM9bqdC6ntekXEvD9g297qLEo/cIf1yGn6JLkRbiEXLbM8
	 xIIQKAuIBAOKWfIPxkdYpOOjCTIE8sT3vVgayzPgppxFImPJH33jj4VPwhxyZScCfgsON
	 /HYQ5zyk9BOOTFfcEzWW1r+Wgphs4tjeM1USy6jbvwzlt/rRtwFvImN6AB5+PrCiAkl8E
	 X5ba8QbxgTFSrKu8b+sGjO624CYx6lIQwl5kjduasFjDjPJ6jPy5SMeb7Y4nm0CIVbR00
	 oCxlrlsFadOG9q9v8vZQvIc3NqVIWESn5BKlAaN2V+3RZnc7Q/sFu6ZQkU6a1i9AsOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=YcL0qfny;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E088E606A326
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:38:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E088E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=YcL0qfny
Received: from eig-obgw-6004b.ext.cloudfilter.net ([10.0.30.210])
	by cmsmtp with ESMTPS
	id WuwOxHkAwVK9UWy1fxZRgy; Fri, 27 Nov 2026 15:38:15 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Wy1exLNT0laNKWy1fxluFm; Fri, 27 Nov 2026 15:38:15 +0000
X-Authority-Analysis: v=2.4 cv=UbpRSLSN c=1 sm=1 tr=0 ts=6b09a3e7
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=p-LfKV-GAAAA:8
 a=VwQbUJbxAAAA:8 a=sOfCyYYy1NGfjWDh088A:9 a=CjuIK1q_8ugA:10
 a=97BuGM4RKn6GwmfqMd6i:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ixVHN+f6bXwbfLfqFXi/FG437hi5R5SCUVq9nvoVZsI=; b=YcL0qfnyoM1bBp23CVqi1J2zfM
	CiSXjtSQ7WGuRmME88zFXxggvDHzcN55VJ2FADsqbqXksEbU4FgbKbtczbcFrItzUBqP7ehb+VRu9
	aJ4m0h5qAiNwObhhPlH1AiEWg/JgLuPRwprU+kwLdmCwdpGSaDeoonKUiZ8bdgjztLnscmzfC869t
	eXHDiaHA8nn60bNiYatqhKXLUKAJXmN3rLfnxs52tS3+xcnhMVK02XjPPK2suwTPVqXZmUMJ4Ik4Z
	V+oPk80B2Isk6XZ3cOKiII+w/fmFYJVgl4aBna4RR9RuC7v1vNbYGWiS9Su94jiFPA1LZraFZTBP5
	qo2h6kbQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:53908 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xWy1c-00000002P4I-45YY;
	Fri, 27 Nov 2026 21:08:13 +0530
Date: Fri, 27 Nov 2026 07:38:11 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Lukasz Majewski <lukma@nabladev.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v5 2/3] dt-bindings: hwmon: Add National/TI LM77
 temperature sensor
Message-ID: <1c56cd6a-18f2-4104-9d5d-1c6bff6dc848@roeck-us.net>
References: <20261126124402.3015577-1-lukma@nabladev.com>
 <20261126124402.3015577-2-lukma@nabladev.com>
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
In-Reply-To: <20261126124402.3015577-2-lukma@nabladev.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xWy1c-00000002P4I-45YY
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:53908
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 5
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfHr4SyYFuKHlo+rmE93R3H9cOzIeCU7kLHUd+6HSyKVDKKx9DpF3P5vIiw1uHdls5mOKDbCcNp4hC45pR3bFhGCFWQtjrPcRboFgpKKaZJIQlIlpcscR
 h0T2UvXJ6x8RIfhrxm9uxoinlhBJziiDBg3I2877XBfCHXq1gt6S5019F7BlIZFUR9fVx1PnLw+fPGlEhBGzojsXC4AffAdgf1DkeA5indIP9zhKl2C08FWc

On Thu, Nov 26, 2026 at 01:44:01PM +0100, Lukasz Majewski wrote:
> Add binding description for National/TI LM77 temperature sensor.
> When compared to LM75 - it has two output pins one for interrupt
> and another one to signal the critical temperature alarm.
> 
> It also has only two I2C address pins (A0 and A1) - possible I2C
> addresses are: 0x4[89ab].
> 
> Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Applied.

Thanks,
Guenter
