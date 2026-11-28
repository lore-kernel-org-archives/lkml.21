Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795887043;
	b=KypDRpLQq9Lupek5BULJeUy8MCPgNXT54SVSIoIeSiar/4hYWKnxm/4tZz3tnZzMxa08
	 NDdRjLhjsti9FqHNbanQZGA+vu2c8FpFS5zrcq8+lxMdoEC7X37CUz1m6xYrSXVSlJ+ap
	 irUM52OHUnCh08qyLlAy9L3osNzvHDmVovxpEWa4kM+2plZF1tIv2OGcV0op+nhFd3CYh
	 ZYggEpeXiWh72GjnYQsim1xVNVoMfGBw4rss9SWjv0Jbq/SXzSvUJAU66ak6aQROlyMML
	 pk/2FZFMho5KaPJEvIi+Zxc1m7unzdF9Df1PlfzuqTpUDrukyMt6ikzkUMRpcx+FjuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795887043;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=IFnB6CDvFZiq3onzUpoPrpFUC6m1eqZBJ4AIlKa5sXM=;
	b=Wm5HU0BGAoesHf/tAW/ZuWoEfET1oFaBD8Ygdjo9r0f5lWt8Q3iIKvWKV48VwtvzYXSt
	 PWsind9OZkqbhRr/UdnyENB237zO956aRhcdFH8fc90tY1os2iqeerTTvhT14xu4w6Ouk
	 r4f3KNyibFjf2KdhcFL7scvNIL+IQ4UULkthBCfWBumeyZKnVNF+2TbkVSlvT/186G5/F
	 A/7rPSQ9FPo+MqX/qWv2KWoUHZV1IBbEhDAkQabEKEvcBPn9Ye7ZZhrp9kuXP1IiVmWXr
	 6w7bQGO9KOcmkwWgLb2VNdR/rGUXJzZQ1W6FxnjSPWMia/FYIuYXWXcK4XEiZD1lM3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=s1JA2nuo;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3B8606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 17:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A3B8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=s1JA2nuo
Received: from eig-obgw-5007b.ext.cloudfilter.net ([10.0.29.167])
	by cmsmtp with ESMTPS
	id XHtzxJrJW4vCDXMG2xv6KP; Sat, 28 Nov 2026 17:30:42 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id XMG2xr5PpxqjjXMG2xrFRU; Sat, 28 Nov 2026 17:30:42 +0000
X-Authority-Analysis: v=2.4 cv=bZxrUPPB c=1 sm=1 tr=0 ts=6b0b0fc2
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10
 a=WoPjCpCImSOVVK_ux44A:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IFnB6CDvFZiq3onzUpoPrpFUC6m1eqZBJ4AIlKa5sXM=; b=s1JA2nuo+uv99ocoP+8wse7oPO
	h5wK6VChdJJDJmAh21mX8mHNH3MpsizXvhJOP1PGF/sWUjNW/m/Qro0l1ZEHd6gSRwelB7KDiDuuP
	20vVHko47ZfBEvgKFw8tT1F2HS4V9HtQzOmgJPb2Hd2idqQYQEUEqSt+ysR8KVKdRqe9qiRm5GQrI
	EKMVM+YWYyUdjfGSytL+zKaHjKCLmHMAFmFMHhgG9Vsa+NfS8gciED+bDfI3OnHsXS6IH1fMaKJMA
	IwgBKAEu5Uw36BKROf0h/0rmz5vGHUi4OFqVFvopTrpq+LXwZ+eLs1tc6WfvBs2zjRLWB+lIlYDUP
	RnMAMD9Q==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:58730 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.2)
	(envelope-from <linux@roeck-us.net>)
	id 1xXMG1-000000002pe-3ByJ;
	Sat, 28 Nov 2026 23:00:41 +0530
Date: Sat, 28 Nov 2026 09:30:40 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Tomasz Bojanowski <tomasz@bojanowski.me>
Cc: linux-hwmon@vger.kernel.org,
	Hamza Mahfooz <someguy@effective-light.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (nct6683) Make pwmN_auto_channels_temp of
 NCT6687D-R writable
Message-ID: <68a7dde4-5a62-47b5-9203-b892bb4a23bf@roeck-us.net>
References: <20261117071645.587863-1-tomasz@bojanowski.me>
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
In-Reply-To: <20261117071645.587863-1-tomasz@bojanowski.me>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xXMG1-000000002pe-3ByJ
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:58730
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 2
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfGFnAUWU1iRSy7ZwqPkB0MgxD2pijzK2WAVLjmsjKmVQq+rFMiGom3ASlYAJ4GEVTlc/VqIojkhoc78FrkjtK+7/AGq92xFiEZ9NtLazP9XJOWYjNdeu
 Wkv1dWZFBjShWO1dU2VxPBj4QaniuyXpCsK7dWvWdsG1mRTW+CH6LCk40sGfhU3Fm/Z3i8JmXqRlr/c5zktnBxpTHXen+b27XaUMtjrkzreeUsrARrKHEHC+

On Tue, Nov 17, 2026 at 08:16:45AM +0100, Tomasz Bojanowski wrote:
> Allow selecting the temperature used by a fan curve on MSI boards with
> an NCT6687D-R (customer ID 0x20d), in manual and in automatic mode.
> 
> On an MSI MAG B850M MORTAR WIFI, the BIOS setup offers four temperature
> sources for the fans: CPU Core, System, MOS and Chipset A. Reading the EC
> before and after selecting them shows that each sets a single bit in the
> lowest byte of the fan's source register, the bit of the monitoring
> channel of temp1, temp2, temp3 and temp4 respectively, and that nothing
> else in the fan curve registers changes. The other bytes were never seen
> in use, and how the EC would combine several bits is not known, so only
> a single temperature reported by the driver on the first eight monitoring
> channels can be selected; other values return -EINVAL. The range can be
> extended if a board needs it.
> 
> The attribute is writable if, when the driver is loaded, the curve uses
> one such temperature. Before each write the driver checks that this is
> still the case and returns -EBUSY otherwise, so that it does not overwrite
> a source which could not be selected again.
> 
> The source is written in a configuration phase and read back, as the
> curve points are. If that fails while the EC responds, the previous
> source is written again. Sources selected through sysfs are restored on
> resume, after the curves and before manual mode.
> 
> Tested on an MSI MAG B850M MORTAR WIFI (MS-7E61) with pwm16 and a test
> curve rising by 10 per degree Celsius around the measured temperatures.
> After selecting temp2, temp3 and temp4 in turn in automatic mode, the
> duty cycle followed the curve for the newly selected temperature. Invalid
> values returned -EINVAL and left the source unchanged. A source selected
> in manual mode took effect after switching back to automatic mode. After
> suspend to RAM, the source and the curve were the same as before, and
> manual mode was still restored. With the driver unloaded during suspend,
> the BIOS restored its own curve but the EC kept the selected source, so
> restoring the source on resume could not be tested on this board.
> 
> Signed-off-by: Tomasz Bojanowski <tomasz@bojanowski.me>

Applied.

Thanks,
Guenter
