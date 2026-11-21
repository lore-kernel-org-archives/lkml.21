Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795274776;
	b=bDzr+TOHTQd1/z4r9H1nvtMdqp7UOkX/S2cUmQrt/dLoIGYiVa7R9lJuvkopOY0pPZdW
	 KSCoeEpJNNWKj2Y29K7rlDh9z2uAHOC+Hqqluv4iuXMj2MlSjpaIFl+w5sWtQODQwjbB8
	 fWpBq6ZRGGt6ExR9xX0rcbDNNd47CPleId/1HBMIdtfMwWfX+asdr4rjZ5G4W1pLVyn2l
	 XUYLm4kLxJlIS55GwmVFpmdOPgQ+kOg2TxefP4C954K4MxPgBXzu4nxpmC8K4ZleO8TqL
	 CkQD9RbWu96zVdBtIzJrhk6FsC3K+iAuRQoye0ue98l2SSCPiM7om5wvg5EVRg486OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795274776;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=id4o5PzKM3zH5WOwNFoAsHmh451u7zQsm4VsNoJjbC0=;
	b=e8TBAA/mI5Ec5WEdR1lXj3UU5CQsCKr5rx7eoInCfHVS9JElhhHIb6TSs9EDbvEYqEXK
	 Erw3HMYf9P04siojtidxcYfcjHwgyY4E36nV4U6LRfHSCTRsMm13a7t6hfN9v1flTO3rz
	 VFkmP6Dcs7pD3Fq9/VRQNSJDmG4aOORC+aTBieG/h4SngQC4TPPdchGRuDRSguFIrNtqD
	 IJGN8gOGsa9dzYrRrgvVlBNA8J/FWMNFLzEJSSnafkbXkVkiqYZOQhpO0qNMLBEE+8kEH
	 L6dac7U7omz2UNqgRIHJl5yQO3U5JUfYqGQWCJnzjlWxZE3hmRKL28lCY9noNCgO4Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=SmcTfL65;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE94606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 15:26:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAE94606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=SmcTfL65
Received: from eig-obgw-6004b.ext.cloudfilter.net ([10.0.30.210])
	by cmsmtp with ESMTPS
	id UjBoxmnp1RiNxUmylxAi4r; Sat, 21 Nov 2026 15:26:15 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id UmyjxMEa2laNKUmykxBOY9; Sat, 21 Nov 2026 15:26:14 +0000
X-Authority-Analysis: v=2.4 cv=UbpRSLSN c=1 sm=1 tr=0 ts=6b01b817
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8
 a=_jlGtV7tAAAA:8 a=pGLkceISAAAA:8 a=ryv-YxDhWCmM8qAHW4sA:9 a=CjuIK1q_8ugA:10
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=id4o5PzKM3zH5WOwNFoAsHmh451u7zQsm4VsNoJjbC0=; b=SmcTfL65i9WV5hm2yGgZHKnRXA
	eH1/TkNSZdfFsUlKo+yR5GQHjNnZJ5RG0/jdiS/J4CrKsDdpdQtg5EVCndq6wCB03fBbSRQqMhJy8
	vCL5hqSkY7QsN2Ta/NOxVql19/W6umBS73a2BnWkxVAYUWrPOpvfN9/8PxTQLrpHT8W37wL8sHz68
	AzdgxtP7nCs6gH3lJNmrJ0JINAdNpCD/6QpNuloB6g/LO+/wg5gz2vQZGkD3fEI/4NE8wl58/tLU9
	OZZW7AF7kEiMaCoS6L9EHOIZwYqCTjThitQVXRSarbpITjXDmj8pBdfjb8EWrBctI8ggRRQfFmd9r
	K3x5BM6Q==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:50930 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xUmyj-0000000112x-2dFW;
	Sat, 21 Nov 2026 20:56:13 +0530
Date: Sat, 21 Nov 2026 07:26:12 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Nhat Tran <nhat.tranminhk2@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Lars Poeschel <poeschel@lemonage.de>,
	linux-watchdog@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] watchdog: core: Don't report time left for a stopped
 watchdog
Message-ID: <08729e0f-874f-41cb-b6ee-bff6207c1cb4@roeck-us.net>
References: <20261121052950.287506-1-nhat.tranminhk2@gmail.com>
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
In-Reply-To: <20261121052950.287506-1-nhat.tranminhk2@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xUmyj-0000000112x-2dFW
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:50930
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 9
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfAV5oNp+uD5EOo50b2ZAzDHai4Iim2gL9tVsaMPIksaxUvnNk0mH5P03bi7m8kBZ2qY106+/95uVd6mA4VWgmvEgYpe2qZnCGHPYgL/Uy98azXzI6xiF
 jHq0BDe0admtRUzxaucPZLoGkxmYnIPFLXiSPsKcAj1nlERtQmhMxTkOq2CHhmeHUGYPcf6uDjt4H2GxwU9tP/A1YoNh9Ok4PFUi4ok+KTj68mxnc1eWh6OX

On Sat, Nov 21, 2026 at 12:29:50PM +0700, Nhat Tran wrote:
> watchdog_get_timeleft() calls the driver's ->get_timeleft() regardless
> of whether the watchdog is running. It is reachable through the sysfs
> timeleft attribute, which is world readable with CONFIG_WATCHDOG_SYSFS=y,
> and through WDIOC_GETTIMELEFT, also after the watchdog was stopped with
> WDIOS_DISABLECARD while the device is still open.
> 
> Drivers may not be able to access the hardware while the watchdog is
> stopped. omap_wdt only holds a runtime PM reference while the watchdog
> is running, so on a BeagleBone Black (AM335x) reading the counter of a
> stopped watchdog triggers an external abort. Any unprivileged user can
> hit it through sysfs:
> 
>   $ cat /sys/class/watchdog/watchdog0/timeleft
>   Unhandled fault: external abort on non-linefetch (0x1028) at 0xf9e35028
>   Internal error: : 1028 [#1] SMP ARM
>   PC is at omap_wdt_get_timeleft+0x4/0x14
>   LR is at watchdog_get_timeleft+0x24/0x130
>   Call trace:
>    omap_wdt_get_timeleft from watchdog_get_timeleft+0x24/0x130
>    watchdog_get_timeleft from timeleft_show+0x3c/0x80
>    timeleft_show from dev_attr_show+0x18/0x4c
>    dev_attr_show from sysfs_kf_seq_show+0xa0/0x138
>    ...
> 
> and the same happens with WDIOS_DISABLECARD followed by
> WDIOC_GETTIMELEFT on the open device, once the module has idled:
> 
>   Call trace:
>    omap_wdt_get_timeleft from watchdog_get_timeleft+0x24/0x130
>    watchdog_get_timeleft from watchdog_ioctl+0x494/0x668
>    watchdog_ioctl from sys_ioctl+0x128/0xbcc
>    sys_ioctl from ret_fast_syscall+0x0/0x54
> 
> If the ioctl comes before the module has idled, the read succeeds but
> reports 59 seconds left for a watchdog that is stopped.
> 
> A stopped watchdog will not reboot the system, so report 0 time left
> when neither WDOG_ACTIVE nor WDOG_HW_RUNNING is set, without calling
> into the driver. This matches the software fallback for drivers without
> ->get_timeleft(), which already decays to 0 once the watchdog is no
> longer pinged.
> 
> Tested on a BeagleBone Black: with the watchdog stopped, both the sysfs
> attribute and WDIOC_GETTIMELEFT after WDIOS_DISABLECARD return 0; with
> the watchdog started through /dev/watchdog0, timeleft counts down as
> before (59, then 56 three seconds later).
> 
> Fixes: 452fafed839e ("watchdog: omap_wdt: implement get_timeleft")
> Cc: stable@vger.kernel.org
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Nhat Tran <nhat.tranminhk2@gmail.com>

Applied, and thanks for testing with WDIOS_DISABLECARD/WDIOC_GETTIMELEFT.

Thanks,
Guenter
