Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795366026;
	b=0bL/NeeaaA/DUQ5IKHRNcLN1oNi/zV0yabqyubYiCjAPYImXrn+5qRQbFSOlCE6tXEx6
	 xsP/f3yasEnimXJhlru4fJ2qWPqo/m2rYxIIOu9VS6IB7kIxV8WPalpbfIETCVZEfDBRv
	 Tny3FWtBdYJVz0up1e4bpH48BEZiQOB+KKdQyzwRJgs8KAvO07GhKYoSRRoCxK2306Qkn
	 R5aq66cXIkgMKQNBhVXNurc/0Z1770lGFRLVFmnP7wgP2XqNEcZqI0sWJNuBEazMpKxvY
	 z5VAsN3d6HvZqUDrunoz4uhtxt+0f+gwWnHTnL4G7ka1gl+6AJmZQtGYeXYkSr7+ymA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795366026;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=CcgUOigE4hpRX+rHA0yhwTQDEsteqQkBf6OiVwFSbwU=;
	b=PLegcY9W/3FghLtSgsjFL/PJQEQpblE11Byj+O6tZnatg87fpm3LxPEBaAFDMfyfMNj7
	 xHvPx1xP4nouo8szfiNHQzO72w0pYewmswJ075j8Z1lIiSpJaa4NU+QxzeJ2A3SIB2lrR
	 dHwIcuwDubR1zAtp3BVBXRoH0mb5OOhF6UZrqjo959qxH7cq9zUW++6ZoAnqy6NYvI0sw
	 z5iahuXfzLUyNhzgKffXSMgGPTebzu+rWivLfV9K1Bge+jnWhWTGa9R9kNEs9sKPMjmcX
	 /96URBnVT3CftBSPmvCLoG8iRBYpKn3k98zqwA8n3MkKndiJgzDlTpbcrhKIiJ1ljiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b="e1sqG/4L";
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D65F606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D65F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=e1sqG/4L
Received: from eig-obgw-5003b.ext.cloudfilter.net ([10.0.29.155])
	by cmsmtp with ESMTPS
	id V9jHxrhhb4vCDVAiWx3whN; Sun, 22 Nov 2026 16:47:04 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id VAiWxXsPDSgq1VAiWxWAed; Sun, 22 Nov 2026 16:47:04 +0000
X-Authority-Analysis: v=2.4 cv=c8KrQQ9l c=1 sm=1 tr=0 ts=6b031c88
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=dZ8iJ22SkCJ4RyOMX0oA:9 a=CjuIK1q_8ugA:10 a=Cz_zCYZHDdu2HsMO07vL:22
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CcgUOigE4hpRX+rHA0yhwTQDEsteqQkBf6OiVwFSbwU=; b=e1sqG/4LlQZn8szLeqSqRIxL5A
	DnqJ+kcIJV4mwG/ILFifJuhNeqRtPKNJ+WbsT9wIp4sOL2L5qp2KwEkbKlr47+pVC6mkmVNygHECO
	WBNKGnRPoMr/JM0TVsJwb/vFhN4n5YgOXun8HvkF8bCU748/u6BqLO45+dWD6P4ladQh4smgz1mKO
	vSY5rLR2tcTlusMAoBywB8U6nCTsRAcwtCxNYD9BwcrsWQivaKkjClASWZaLBtGQ4CQgNtHyGDzgH
	Ec2ShhkskMW3WgoK772vjMy96YpzAj8e6GECBTsIPwrtHVc9E134GCIcB95I4O/7JnzjRa1GAYtXb
	be/eTxyQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:55994 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xVAiW-00000002mLu-0NUO;
	Sun, 22 Nov 2026 22:17:04 +0530
Date: Sun, 22 Nov 2026 08:47:03 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Navon John Lukose <navonjohnlukose@gmail.com>
Cc: sergiomelas@gmail.com, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (yogafan) Fix fan paths for Yoga Pro 7 14IAH10
Message-ID: <b672573a-f0ac-4ad8-9be8-6f3a554ddd98@roeck-us.net>
References: <20260913214713.205208-1-navonjohnlukose@gmail.com>
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
In-Reply-To: <20260913214713.205208-1-navonjohnlukose@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xVAiW-00000002mLu-0NUO
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:55994
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 13
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfPB6h6K2ME7vaadLCUQa+4d/uVw1LuWkclFjoYlviw1wzb3M/nq6ASgFBcmY57xrUCLVmdEzJW2/9q/qrRR8OiGTiUnplbCR6Gwy1iD4mnhvwAg9qgan
 1nocYLoDk5ePLxV/dK1pk+BN6C219xoW2QuhmfOhLPMEILnh1TcQnYohxtGL+TwbE1jwwN5Imv2P7hJkC24opK15RZxShoYRBK9SVwllsGb9vnQ15OZfgt9z

On Mon, Sep 14, 2026 at 03:17:13AM +0530, Navon John Lukose wrote:
> The Yoga Pro 7 14IAH10 entry names \_SB.PC00.LPCB.EC0.FANS, which this
> machine's DSDT does not have, so probe matches on DMI, fails to resolve the
> path and returns -ENODEV. The EC exposes its two fan tachometers as FA1S
> and FA2S, and loq_15iax9_8bit_dual_cfg already describes that layout. Point
> the entry at it, and update the reference table row to match.
> 
> Fixes: 9c110a467686 ("hwmon: (yogafan) Add support for new Lenovo models")
> Signed-off-by: Navon John Lukose <navonjohnlukose@gmail.com>
> ---
> Tested on a Lenovo Yoga Pro 7 14IAH10 (83KF), BIOS QGCN35WW. The EC field
> block declares FA1S at offset 0x104 and FA2S at 0x137, both 8 bits, and
> FANS does not appear anywhere in the table.
> 
> Both fans report after the patch, 0 when stopped and 5600 RPM with the fans
> driven to maximum through the vendor WMI method. The multiplier stays at
> 100, and the AML agrees, reading the fields as (FA1S * 0x64) and
> (FA2S * 0x64).
> 
> The table also lists the XiaoXinPro 13ARE as machine type 83KF, which is
> this machine's DMI product name. I left that row alone.

I don't have a means to determine if the old entry was wrong, if there are
different machines with the same DMI entry and different configurations,
or if this patch is wrong. I have not heard back from Sergio. The patch has
been pending for more then two months.

I am going to apply this patch, to be released with my next pull request
and thus with the 7.4 upstream kernel.

If anyone has objections, please speak up now.

Thanks,
Guenter

> 
>  Documentation/hwmon/yogafan.rst | 3 ++-
>  drivers/hwmon/yogafan.c         | 8 +-------
>  2 files changed, 3 insertions(+), 8 deletions(-)
> 
> 
> base-commit: 22098763a10d9c13
> 
> diff --git a/Documentation/hwmon/yogafan.rst b/Documentation/hwmon/yogafan.rst
> index 6395c94..84c5d2a 100644
> --- a/Documentation/hwmon/yogafan.rst
> +++ b/Documentation/hwmon/yogafan.rst
> @@ -102,7 +102,8 @@ immediately to ensure the user knows the fan has stopped.
>   83KF           | XiaoXinPro 13ARE | 0x06/0xFE | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
>   82KU           | IdeaPad 3 15ALC6 | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
>   83RU           | Legion Pro 7 16  | 0x03/0x06 | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
> - 83KF           | Yoga Pro 7 14IAH | 0x06      | \_SB.PC00.LPCB.EC0.FANS        |  8-bit | 100
> + 83KF           | Yoga Pro 7 14IAH | 0x104     | \_SB.PC00.LPCB.EC0.FA1S (Fan1) |  8-bit | 100
> + 83KF           | Yoga Pro 7 14IAH | 0x137     | \_SB.PC00.LPCB.EC0.FA2S (Fan2) |  8-bit | 100
>   83BS           | Yoga 7 16ARP8    | 0x03/0x06 | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
>   *Legacy*       | Pre-2020 Models  | 0x06      | \_SB.PCI0.LPC.EC.FAN0          |  8-bit | 100
>   ----------------------------------------------------------------------------------------------------
> diff --git a/drivers/hwmon/yogafan.c b/drivers/hwmon/yogafan.c
> index 278cb08..3fcad00 100644
> --- a/drivers/hwmon/yogafan.c
> +++ b/drivers/hwmon/yogafan.c
> @@ -84,12 +84,6 @@ static const struct yogafan_config xiaoxin_8bit_dual_cfg = {
>  	.paths = { "\\_SB.PCI0.LPC0.EC0.FANS", "\\_SB.PCI0.LPC0.EC0.FA2S" }
>  };
>  
> -static const struct yogafan_config yoga_pro_7_14iah10_cfg = {
> -	.multiplier = 100,
> -	.fan_count = 1,
> -	.paths = { "\\_SB.PC00.LPCB.EC0.FANS", NULL }
> -};
> -
>  static void apply_rllag_filter(struct yoga_fan_data *data, int idx, long raw_rpm)
>  {
>  	ktime_t now = ktime_get_boottime();
> @@ -227,7 +221,7 @@ static const struct dmi_system_id yogafan_quirks[] = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>  			DMI_MATCH(DMI_PRODUCT_FAMILY, "Yoga Pro 7 14IAH10"),
>  		},
> -		.driver_data = (void *)&yoga_pro_7_14iah10_cfg,
> +		.driver_data = (void *)&loq_15iax9_8bit_dual_cfg,
>  	},
>  	{
>  		.ident = "Lenovo Yoga 7 16ARP8",
