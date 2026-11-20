Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202448;
	b=VssRg5osO0SYKdaE/Tn+GCVy/iw4TSpMPX+UdX//nbG/3KJjpcHqfUZb5iu+x3eeIZAj
	 ouVvOmrOI/fwh7lPhD31pV2QbQ6Sg2QqDiZnEREgpu2FGKTGam5+qG8peCseZQsnAbOcR
	 5HRJRFU/RvWIdUj0z0ll+SfEKdwT0zEJoqbGk3NhY4PVtUugwK/jHrFogLXtoJC/0TKeH
	 sPuLUqiHFotgrDmZYCAHyZ99PvdntWcdId5nkA7DeNfb8Usy5UFCoaTU/ULArHh61deKl
	 yIls+NOwORQQG9hd4dkzDOj0n8XZlTCChX/3VLKTGPc+qxsuIU9SyAJ+RgEAstbxN4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202448;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=5n7hU92/hTAahTaIujkTsWGLRtB7NISm8chiqkmyJDg=;
	b=aYfEz8meSj5Y8ddgFJ4Xq1adHSuJk+NCcbTYXeS6gBf3G+gYLn6dtItKTMOzyhYPjNbw
	 67KsulcvNAqKzoCmd1Q4m/i+qx2PLErch3pdFA766YyzlTNODmCfXRP24w47tZEDW2Mtr
	 H+8UGfuRelB5VwRnqSkpOM/3G9dPR6xsH5jeBKR03WFWzsOrlTI5/DZYl17JPs3WV90ZO
	 ZbxXHw2AJB2WH8w9rZpX66uj77ZmoTGAVaKN9g2ooVL8FJqacYwx3mmNi265FsamlBkR1
	 ubYom/CXiIYbd7pyG7vUGmpBsHZMJL5nI6q064qKMJEJ0DUE7lK4+IMq+A8c2SqEZIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=mWUIpTKB;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00025606A6FA
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:20:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00025606A6FA
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=mWUIpTKB
Received: from eig-obgw-5006b.ext.cloudfilter.net ([10.0.29.217])
	by cmsmtp with ESMTPS
	id U7MdxENhPAR1iUUAAxHC2H; Fri, 20 Nov 2026 19:20:46 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id UUA9xJbVcSeuLUUAAxunQq; Fri, 20 Nov 2026 19:20:46 +0000
X-Authority-Analysis: v=2.4 cv=NYvm13D4 c=1 sm=1 tr=0 ts=6b009d8e
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=H1xHdJbw_7IDupmx:21 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10
 a=kXaYdxMDRVOPY9whCecA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=5n7hU92/hTAahTaIujkTsWGLRtB7NISm8chiqkmyJDg=; b=mWUIpTKBK8cp
	uU2skt3T4IAFceK6GL5mPGPVxfgiexxQYUmBu3a75swLgWJk1J/qCd5Beq8bdgOPwYMiNwZOpugXN
	YMlNi7uWgp0iL1ERt4XZqdM8GD6SNvCyMsJSPHzCcfwgoy1xeFYa1vYUvXgH2M0S/Ye7z5xFGeG9E
	pd8wAA8G/6VRF2G0d7pIOgYi/WPM9tOX8inlbbU9mg2QsmBHye4illg4+WgHVpygJlja76otE1uXR
	rIy2MO1CGGHSN5bN5H46KLd7GZOM/x//MDGn5R92QigylNvKmedEtSTedJVkJzJC0HKgD0N+7R26S
	slqW5f6At9BWAGjXQJhJzw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:35344)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xUUA9-00000001V67-1ka0;
	Sat, 21 Nov 2026 00:50:45 +0530
Message-ID: <38e5fb82-c883-4e49-9fe4-b77a122a586f@roeck-us.net>
Date: Fri, 20 Nov 2026 11:20:44 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: omap: Do not read the counter while the
 watchdog is stopped
To: Nhat Tran <nhat.tranminhk2@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-watchdog@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261120124009.24264-1-nhat.tranminhk2@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20261120124009.24264-1-nhat.tranminhk2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xUUA9-00000001V67-1ka0
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:35344
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 2
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfAPyF8pGzmxOW7DeNVq9DNnHhhoGDqB0pl0vuVP5C5JcHdNMpTOz5eDadnG6eO/elbqRj8t/ZkKVFhKdIHgAb7+8OqlGkob2ZC+Zhfg18n4TLbuyh6jp
 DeLkRsXCip98MtCfAiOAQp6jooACzVnkjAp5VhjP3c2skvnhaZQ7q+NF3eEeD8Zdp7EiX8wH8IkMubHNZFO9HQYzPnb/phNzSwgEqpOHaRvIPktb1I09HU87

On 11/20/26 04:40, Nhat Tran wrote:
> omap_wdt only holds a runtime PM reference between omap_wdt_start() and
> omap_wdt_stop(), so the module is idle and its clock gated whenever the
> watchdog is not running. omap_wdt_get_timeleft() reads the WCRR register
> unconditionally, but the watchdog core calls ->get_timeleft() from the
> sysfs timeleft attribute without checking whether the watchdog is
> active.
> 
> With CONFIG_WATCHDOG_SYSFS=y the attribute is world readable, so any

The watchdog can also be stopped while the watchdog device is open, so the
problem is a bit broader than that.

> unprivileged user can trigger an external abort on a stopped watchdog.
> On a BeagleBone Black (AM335x), with panic_on_oops set:
> 

Seems to me the proper generic fix should be in watchdog_get_timeleft(),
which should return either return the configured timeout or maybe 0
(I am open to suggestions) if the watchdog is not running.

Thanks,
Guenter

