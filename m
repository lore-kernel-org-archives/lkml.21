Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795464965;
	b=OcsQfBPXFVL2WJKnsPhZzt7p/T+jN3+C1lup+8KZ+lrzAU1yvo3tidodE+4LGQK1AfjW
	 U4bIS4v20YrBLN4C3jdH9AFL4XqT49PUki0oMgF1BZuTAN19zOzZD7oDGptnN4a69Jk/u
	 BouPKA6P2T1lB6I9W0uI8iVhz6gfb2GrrzKG+t7L+fc6K6AhHpFteh3loJwn8bWNgu+J+
	 rK9dRF6UJs4F51q+p+qh77A9/1nV8lyTcVrsZDx7ImC882JW7X6C5gKYBOW312/y1bSh3
	 rMAN8g7Sv7AFEfR9XhR+YtM6qOk01JRvI2MhYm7FJ7myTpKNMzFYzSx0fIWJ6CDk7nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795464965;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=gGVvVvpLYm7ZFPpfldspKuf2bI8IrYyXtaX6gOidhkQ=;
	b=paV8NakJPtJL05VPWO1XerXaq6jlqvkVeHpTN6aaKAB5kiuvDeuNKIjlmI/svA11mNg2
	 AgbbQd5LMQXFIdtiPIWyhacR2q/R17x/pRZS7yHyTH/Bi+ev0C2q6VsWSCVO8pfxBQ9iy
	 4Sa0lvdauAVAyNd5MlpLuslQWYAR3ktsR5iAqmtdyd5AQm7mppmAckz+FUfBV4vaeVCFK
	 wOk1RewCNETZA5CC/lrweqb1ywiUPksShZFlHeBYxXqgZXjdcw9oYfGOZmwJUUnRthuoQ
	 SK3cLWoDbY9IUgBR6xveMSTWG4CLvWeinP80xUHar3N6oG/Zt1uUcnub4UJkvUzwLIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=b8DEk7Uu;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DDD606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:16:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4DDD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=b8DEk7Uu
Received: from eig-obgw-6003b.ext.cloudfilter.net ([10.0.30.175])
	by cmsmtp with ESMTPS
	id VX6HxyftWVK9UVaSKxzqTc; Mon, 23 Nov 2026 20:16:04 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id VaSKxtZ2MGh2BVaSKxQa9W; Mon, 23 Nov 2026 20:16:04 +0000
X-Authority-Analysis: v=2.4 cv=Aszu3P9P c=1 sm=1 tr=0 ts=6b049f04
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=vsWaLUaKAAAA:8
 a=QX4gbG5DAAAA:8 a=CnilkIXYi68h046lorIA:9 a=CjuIK1q_8ugA:10
 a=ZAjiiiQUslnskKx8wA3N:22 a=AbAUZ8qAyYyZVLSsDulk:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gGVvVvpLYm7ZFPpfldspKuf2bI8IrYyXtaX6gOidhkQ=; b=b8DEk7Uu+idXKc6ft7SaCaQkcK
	ejSdQ8UJiwxAawFbhfC9PTlB8pw4YnG17z/Epk2zE7dvOa6RGzzraxeFRy5dxUV3MWC4PM48J9xIj
	cVjAcSxIqjI5Uz9+9KH7o3YKWA5oHqVcIQ7SK2aQykH2T+yVcRi8nx5jlPC9vzdhlrP0N7J9eudmb
	msoYEA/sY+Mw/+0Tdhu1YgxrDWqZB2c7OPxO1yq0qHRsFmb7i91q5ySWCDZ0RYFIWKtzTOkTjNOL4
	bYQtXWtlsBM7NOjqK5b4PURzszae0ykfKhBy7q/7HC8Gy+W6R+oU4f/VzfgEWujme9LknjNJrFlNV
	Z0aknGxA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:36638 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xVaSI-00000001f6j-0DzH;
	Tue, 24 Nov 2026 01:46:02 +0530
Date: Mon, 23 Nov 2026 12:16:00 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Rui Cao <i@udp0.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org,
	linux-serial@vger.kernel.org, phone-devel@vger.kernel.org,
	Roman Vivchar <rva333@protonmail.com>
Subject: Re: [PATCH v2 3/5] watchdog: mediatek: Add MT6833
Message-ID: <e9033710-6667-449e-a861-cbf3fc65bf43@roeck-us.net>
References: <20261117-mt6833-base-v2-0-058a0685c40c@udp0.com>
 <20261117-mt6833-base-v2-3-058a0685c40c@udp0.com>
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
In-Reply-To: <20261117-mt6833-base-v2-3-058a0685c40c@udp0.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xVaSI-00000001f6j-0DzH
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:36638
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 55
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfFi904afWt3qC7bQD3h70VccsXOFm5lUKD/YZO2NbQEyvmisVpf+LhF2mMoSR5QHn+Y0c0nHBIEqyeWaco7PYA6ygQFejX4qn3YnjltuJq5GZ2v+njvX
 v3Y+ekwsSM+I5XGWDjhh/P/k1f6p0lDMyY8Pc3lSC6LyJhfEd0DbEbIF19UQoG8t31KfBkJQ+EoxxK7nPBbYshh+TyKbw0or9815EqfDL4vAy/s5ZVDiEA0v

On Tue, Nov 17, 2026 at 05:11:33PM +0800, Rui Cao wrote:
> From: Rui Cao <i@udp0.com>
> 
> Match MT6833's watchdog. It works as MT6589's, but its TOPRGU reset
> layout isn't known well enough to describe, so it gets no match data
> and the driver registers no reset controller for it.
> 
> Signed-off-by: Rui Cao <i@udp0.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied.

Thanks,
Guenter
