Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364155;
	b=VInhVFf+uwl0wNHtUNeR1EmjFKPeT5IM926d/YJO6kA/KsglrH/SOwNXviXZKseFGGCe
	 CcGUfxpMe+4XEXp3t0XP+EqqcPUO0f5ESdWP4ifpkvHWOXUeMvjwlopTl7VzA9vsMXSKb
	 Scj36ldBy4cexD9U3gCs/8+I3kxmF/zNuxkot1DdXlCdZVUoCIkKWB1SS0u3eE093bQzd
	 qvG1/4ty2BBD9UJZFgduYYNEHAg6CedIS3LDrlXcAslVHRefHebu+fVz86mh52OLtMDmu
	 tGue+ACgBPel8ZzksHvAbhRvGvPlzT61v1anDLdkVT5OUrfv8gokRqhATS6Sm/t08hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364155;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=yFbIKxOtbGbhWSKxjVzud7YqnlnyHUxqB3yMV82sccg=;
	b=YJAd1dfbgPgLxBejfaTxkOZ+ziZ0ZGoCu9D4L9Xm4otLA3QjKVfGO2kd7R3hhciXPNdM
	 fhEACQcB3t4skfn4c3nBicTrLgQ8sp1AEvkTOZj0Rj4B/I6din5WusEgJYafwB66xvFF9
	 BU2sjQk5uynLAc0Ovo+lUF7tFjuDz7TiJCLKcno8hqoYDPB/xFKqVuGylO/Z4cifrkzeo
	 Vu0e0NxjOZO+d98gCYhuicefULmQ2pxDDiYYU5VeWMK7KPMiUqAZPSja1BwyF2o2zAruu
	 JI6peyzzzj7I0rSzOG6gzGsb+UEcPGAyXbsqIbYmFdjCsDmVwc0auhEcJMgZgZox4GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b="F33svv/5";
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EE8606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:15:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3EE8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=F33svv/5
Received: from eig-obgw-5001b.ext.cloudfilter.net ([10.0.29.181])
	by cmsmtp with ESMTPS
	id V3dFxph0xV16IVAEGxiSVo; Sun, 22 Nov 2026 16:15:48 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id VAEFxSiSNxmi7VAEFxAmlp; Sun, 22 Nov 2026 16:15:47 +0000
X-Authority-Analysis: v=2.4 cv=KuFN2XWN c=1 sm=1 tr=0 ts=6b031533
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=xqVzBJ8tQ9rw--ji0ZwA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yFbIKxOtbGbhWSKxjVzud7YqnlnyHUxqB3yMV82sccg=; b=F33svv/5hnq6PbKGM9TkpeVuhX
	S27cSmSggZCyEea4kmQ8ox80WzzpLNqhbdRn7P8fr1jwTWCtwi80IzK3KQ4JFfn7HqgOIUVsTTqZ0
	SdG0Dy1u2yGCwsV8k7w4wXgElMZmrO4xNQ1BgE1gGPQvjC14O1BCnK6WQqVtuDZGvhE6O89h6WzDJ
	Mga35wHzjatLeb6ImCc1+zIESk8SsUEki3vOI6hLNBzGlVksd9jRqu3URTqB3IMBu8tdpy/+P6IEz
	e18WwLrK2vux/1Dt2okxKQ/iZV4aAZlYLNwY1acH3SgY0uJKG21JawI76KTY3l05za4ihWPA2hcAo
	xh8gJx3A==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:44242 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xVAEF-00000002YAx-09Tb;
	Sun, 22 Nov 2026 21:45:47 +0530
Date: Sun, 22 Nov 2026 08:15:46 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Artem Novak <artem122novak@gmail.com>
Cc: bcm-kernel-feedback-list@broadcom.com, florian.fainelli@broadcom.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org, wim@linux-watchdog.org
Subject: Re: [PATCH v2] watchdog: bcm2835: add newline to dev_info message
Message-ID: <e9a71a95-3b8d-4e69-aefa-174446b1b19a@roeck-us.net>
References: <20261122082943.173681-1-artem122novak@gmail.com>
 <20261122102328.207524-1-artem122novak@gmail.com>
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
In-Reply-To: <20261122102328.207524-1-artem122novak@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xVAEF-00000002YAx-09Tb
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:44242
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 4
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfI79EloPR/6bjViLrFQ5SSsujV8ZzeMd2lIRRl8k7nD+m938s9JeEw2HorEsjn1HEHJGorD+utSK6kUhk7oLUfwgwpDUaUMmJKxFjwwD4CpsmOpg63Hp
 7oJPUZpk3DKoTYRZ+d7WHGilLgY44QP1TiLPYp1uehkmGR7RBYs/E5grWkFYHdFgVeeafFrUcdTwnMRahunarfYPQuBrvrZg5HzEINMJwdMbf581ogtvtk3Z

On Sun, Nov 22, 2026 at 04:23:28AM -0600, Artem Novak wrote:
> Add a newline to the watchdog timer initialization message so that
> the message is properly terminated in the kernel log.
> 
> Signed-off-by: Artem Novak <artem122novak@gmail.com>

Applied.

> ---

For future patches: Change log goes here.

Thanks,
Guenter

>  drivers/watchdog/bcm2835_wdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/bcm2835_wdt.c b/drivers/watchdog/bcm2835_wdt.c
> index 755954cbadee..df08236d2689 100644
> --- a/drivers/watchdog/bcm2835_wdt.c
> +++ b/drivers/watchdog/bcm2835_wdt.c
> @@ -213,7 +213,7 @@ static int bcm2835_wdt_probe(struct platform_device *pdev)
>  					      SYS_OFF_PRIO_DEFAULT,
>  					      bcm2835_power_off, wdt);
>  
> -	dev_info(dev, "Broadcom BCM2835 watchdog timer");
> +	dev_info(dev, "Broadcom BCM2835 watchdog timer\n");
>  	return 0;
>  }
>  
