Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795807881;
	b=CJ8D4tX3cMX8Yf5hK2FW+Hjfy91EKSR5ZX320ARIMAdkn/J+H0ot6sUFJnM961NDgVgo
	 YOzcqx9ILkx8BUjEt3JLSDGOiYedTZSfDuyGKOjYRL5DEC1B8qgRqO/789U4Rs8ojpebO
	 HNBbUZkZhsplMZ5U6eWM8LP4VAzhYWaaSuhZoHyhaMrwTQJ9F/6jU16YbzI6wUBSC29uJ
	 rOvzW/uTdEPfnNYQInkSVPxeqFY2ukkoli8raANG6RZrYoODfaSg6EQADhFc0eLpGItLc
	 XD0p/F7j5iuSvR5N9+08L0odV0OVGevYV+5wKB81mBxi5gBQ5SEjV9TC3CIdqZAFdog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795807881;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=Yg4FUuMVuN87SJW+itTPRW/kkDj97x/j1OhxTJZOjZ0=;
	b=sg78E8KdZkpzP4cGYD/1ATjnx1Vx0XHN+Pti3GHYgaM3DKxjZptb9MhkRXh9fNN2ajNv
	 gX8nNiufV7NWtMFjz6OgRFYsVLhI/Wyi+JCQDGoE+SsXfkFMJ8uSym0vsm5ar9lS+QCxx
	 ctccx6nBx49hrqefozxIgE5GWkwwRBTvneFAJ4t5Vvof9AaiY0bqdhVCPVXI+8wYA+au/
	 w0FmSiLFCj7cT6AH5z9m1EpNhoGr1JeKYCs3PkEyLrcDEM9YNToz/iskEFY7HKy48cVH2
	 4r6gkbhI60cZVMXLDxlxuzkECcwBnZIWen3wPL8g0zOLa228TvuCOqY7d7OxVD+qi/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=P8KOrBnd;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56977606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:31:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56977606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=P8KOrBnd
Received: from eig-obgw-5005b.ext.cloudfilter.net ([10.0.29.189])
	by cmsmtp with ESMTPS
	id X0LVxGo9F4vCDX1fExpXK6; Fri, 27 Nov 2026 19:31:20 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id X1fExKEEAYskhX1fExkOzW; Fri, 27 Nov 2026 19:31:20 +0000
X-Authority-Analysis: v=2.4 cv=CKMqXQrD c=1 sm=1 tr=0 ts=6b09da88
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=1yjjGGwBjegOdnxs56cA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Yg4FUuMVuN87SJW+itTPRW/kkDj97x/j1OhxTJZOjZ0=; b=P8KOrBndl5PJPn5ah2qkhUkL/W
	S2jI6FUZ04nvPM8Ya+EBhvWqcYVOohMz878oe68gYJ4fbPorlCHzfEikcEzOrCM+u+Hi0D39+eOHA
	2Ut8Esa4Ye7PxPEf+oh/p5HrZGK9QhsOoYyvjfZ4KUmjJLmdszbnoPz53RU/CPKFfLwQTu4byrYsM
	KRF/Nomuh15OhfXhjeEObfGKvF+Obk1XZzQxK3pYVyD8xwNy+JSyp9lA7lNl88QSxz9G7DHZlz7pB
	vS0nuAYso8duC6DW2GwHPOtRLU4LeqaLkuVdQgh8mI10QvTb7fSLgk8uxIWSS/HSw8AGEX8Un4Z+2
	DwsDst5Q==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:51556 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.2)
	(envelope-from <linux@roeck-us.net>)
	id 1xX1fD-000000040CV-3n3P;
	Sat, 28 Nov 2026 01:01:19 +0530
Date: Fri, 27 Nov 2026 11:31:19 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Sergio Melas <sergiomelas@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (yogafan) Add support for additional Lenovo
 laptops
Message-ID: <5c0b399b-e4ab-44aa-95cb-64498660c65f@roeck-us.net>
References: <20261127052841.492895-1-sergiomelas@gmail.com>
 <20261127052841.492895-3-sergiomelas@gmail.com>
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
In-Reply-To: <20261127052841.492895-3-sergiomelas@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xX1fD-000000040CV-3n3P
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:51556
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 7
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfK+fwtv4lEAelcE3phBwH58+On3oXZIiROeLOrMnZqa9b8AakmN6BFNrw/xNbPVJVr1sZCb+IrVaOAxuSosK2jhiw/by3u3QLBpO68ezfEnyGco27r+c
 52QtNWnBMIDQsW2w8EXShcsXpu4LfG12BPORI25/xX1xbE8grz5sFsKNk1wBB3vUrDMM5C8LMr35KBdB4r7hOEVt+8/osaWYoih4bp1Z0feMxJq4d5jBbO6X

On Fri, Nov 27, 2026 at 06:28:41AM +0100, Sergio Melas wrote:
> Add DMI quirks and ACPI fan tachometer configurations for nine
> user-reported Lenovo laptops:
> 
> - IdeaPad 3 15ADA6 (82KR): 1 fan, 8-bit x100 (LPC0.EC0.FANS)
> - IdeaPad 5 15ARE05 (81YQ): 1 fan, 8-bit x100 (LPC0.EC0.FANS)
> - Legion 7 16ACHg6 (82N6): 2 fans, 8-bit x100 (LPC0.EC0.FANS/FA2S)
> - Legion Slim 5 14APH8 (82Y5): 2 fans, 8-bit x100 (LPC0.EC0.FANS/FA2S)
> - Legion Pro 7 16IAX10H (83F5): 3 fans, 8-bit x100 (PC00 FANS/FA2S/FASF)
> - Yoga 7 16IAH7 (82UF): 2 fans, 8-bit x100 (PC00.LPCB.EC0.FANS/FA2S)
> - Yoga 730-15IWL (81JS): 1 fan, 8-bit x100 (PCI0.LPCB.EC0.ERPM)
> - Yoga Slim 7 15ILL9 (83HM): 2 fans, 16-bit x1 (PC00.LPCB.EC0.FANS/FA2S)
> - Yoga Pro 9 16IAH10 (83L0): 2 fans, 16-bit x1 (PC00.LPCB.H_EC.FANS/FA2S)
> 
> Reuse existing yogafan_config structures where identical and update
> Documentation/hwmon/yogafan.rst with the new models and contributors.
> 
> Signed-off-by: Sergio Melas <sergiomelas@gmail.com>

Applied.

Thanks,
Guenter
