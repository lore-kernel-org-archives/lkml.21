Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795235756;
	b=fzE70Euuzb3yY+EQ1aaJgeaPZkCyeVwNJyLUMFtA48M1V2+IPDZ2ry98tdgSh8uT5F46
	 9C4WhayzfQVzHiulw7px8Q+JVVy6NHxA2HR5VWLOemprRgArxQsnLhTKMJzNta5Vc6m7j
	 mDNP75xB/8b445u89+PjdBXS3x5qwxPjv84KX3XhLGCzxtxb4pIL7vVVR/lzrDAtzLGR0
	 LKr2zfqyUMA3DaExoSCWCOFNpWxRYL70gw7z7TuGzAmYAXVfWjnMC9/2odanCKLQYUpF0
	 75IzEnl7Va20TgcRMj/G3dVXpUuZd3i2jNI/M2ZiBSWCvJaetm4zMCfTBdt/RiCDxgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795235756;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=auk79D38/PBqUYtBuOHHdKt5R46eieSbxE66cikI1O0=;
	b=OO8k604XqI6qpb+ryoPtG4RV855RmYDeiUtM2pSNR0cKCofd7k+hPBMMI+AFeO79L2Kx
	 NFMJhdu6Ju8HgiDtl5EinS9f8r+JLjoBPvNGUgzXQccepBoS9ryk3LQwLhI8w7zurhJjL
	 chBWUx5JHF30zMVmzZCsb8EJ1SjfCUq0X1gekzuXlRLv8zhI8dpszBAvcy8nUJvtoMQfQ
	 smK16R91zKykVjiUOukEj4sGEQ0ALK/EshwQNBvmJbqD9rXEnIZoFkhgDc0hOreqUA47w
	 0ai+09H8vH6rg6r2ng9ZERLTx0fBk+8Obdh6pevEqL+ZfQ1gUFx7NOsD9oh0PXDRaig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=QGCz1bdZ;
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AC8606A6B7
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 04:35:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6AC8606A6B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=QGCz1bdZ
Received: from eig-obgw-5006b.ext.cloudfilter.net ([10.0.29.217])
	by cmsmtp with ESMTPS
	id UaOYx9CmSOOJnUcpOxqvj3; Sat, 21 Nov 2026 04:35:54 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id UcpNxZVHdSeuLUcpNx9BVo; Sat, 21 Nov 2026 04:35:53 +0000
X-Authority-Analysis: v=2.4 cv=NYvm13D4 c=1 sm=1 tr=0 ts=6b011fa9
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8
 a=_jlGtV7tAAAA:8 a=pGLkceISAAAA:8 a=1iPeMqUIMSWQFf1BpIQA:9 a=CjuIK1q_8ugA:10
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=auk79D38/PBqUYtBuOHHdKt5R46eieSbxE66cikI1O0=; b=QGCz1bdZlHJPQb0IhBX/wmnjYk
	DvjksHvXGm7NGuJMQp950xMKkfwbv4fZ6MjWxXm+HZUReEfDxEOgScFwtJOH553gy3IUVF9/c+eFP
	ocwn9nKB/4lgnQGJqX6uesJ1dU8BqCt9dGnaQQN8i5LdrTgbLrY/e+sKwdMa3M6iY8/graX/ouoOV
	cYbk8htvuzFnJxrHVFwA4qnMK+Ao0VdL5GEiDJbi2383a5Rp6fKVOJrrly4MvsRuEd6s+CJsqBm8L
	68mqBTBH3wg7eKvsIAHLbjLZG5hgdQg8hLu9gWPCu5zr+wt+4cggnJ81SgIMBVMSnWfLEx0U/esTz
	+ce7qjfA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:32922 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xUcpN-00000000mjO-0Svp;
	Sat, 21 Nov 2026 10:05:53 +0530
Date: Fri, 20 Nov 2026 20:35:52 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Fil Dunsky <filipp.dunsky@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6] watchdog: Add ARM TWD (MPCore private) watchdog driver
Message-ID: <377b89b7-90a3-41c9-88c4-fd3393055f91@roeck-us.net>
References: <20261118-arm-twd-wdt-v6-1-ce5c85b45c63@gmail.com>
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
In-Reply-To: <20261118-arm-twd-wdt-v6-1-ce5c85b45c63@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xUcpN-00000000mjO-0Svp
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:32922
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 4
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfEBMzZBCu9ClLgCnx+joSoSjMqxpe+GlahMecSeDCi2l0dS8SXkiSdS1VIBO08i2I5WdVLDbMTbDuNbdVF6r4lxP7wUWNK+0n4CRXgeegwB1gnbhcL6j
 yyrxvknleThVD95Zh7RqfPLXjZOLubLdpIfOo9vRr2Pq3bdPuhzvgzzr+f7V67BdIUlhrhkiGXWD3gFuJhGzYYqwYp2aA8yLks0DCqooY0a9yJoG1CGGNwbE

On Wed, Nov 18, 2026 at 07:59:36PM +0300, Fil Dunsky wrote:
> From: Fil Dunsky <filipp.dunsky@gmail.com>
> 
> ARM11 MPCore, Cortex-A5 and Cortex-A9 MPCore systems have a watchdog
> next to the local timer of every CPU, banked at the same address. The
> binding "arm,cortex-a9-twd-wdt" exists, but there has been no driver
> since mpcore_wdt was removed in v3.11, among other reasons because it
> only ever programmed the CPU that ran the ioctl.
> 
> Use the watchdog of CPU0 as the system watchdog: start, stop, ping and
> get_timeleft run there through smp_call_function_single(). CPU0 cannot
> be taken offline on 32-bit ARM unless the platform allows it, the driver
> does not probe then. The watchdogs of the other CPUs are left alone. The
> watchdog is used in reset mode only, its interrupt is not needed.
> 
> Bootloaders such as the one of the Securifi Almond+ start the watchdog
> before booting the kernel. A running watchdog is marked WDOG_HW_RUNNING
> and taken over with the driver's timeout without being stopped, unless
> it runs with a different prescaler: the prescaler cannot be changed in
> watchdog mode. Once the watchdog mode is set it can only be left through
> the disable register sequence, which is what stop does.
> 
> The TWD clock follows the CPU clock on many systems, so rate changes are
> followed through a clock notifier. If CPU0 lost its watchdog in a deep
> idle state it is set up again on CPU PM exit, and on resume from
> suspend. The expiration time is kept atomically and the watchdog is
> always loaded with the time left until it, so neither path extends the
> timeout. Timeout changes are serialized with the clock notifier, and the
> expiration time is published before the CPU PM notifier can see the
> watchdog as armed.
> 
> The watchdog is also registered as a restart handler with the default
> priority, for systems that have no other way to restart: the CPU that
> restarts the system, the only one left running, lets its own watchdog
> expire right away.
> 
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
> ---
> ARM11 MPCore, Cortex-A5 and Cortex-A9 MPCore systems have a watchdog next
> to the local timer of every CPU. The binding "arm,cortex-a9-twd-wdt"
> (watchdog/arm,twd-wdt.yaml) exists and 15 dts/dtsi files describe the
> device, but there has been no driver since mpcore_wdt was removed in
> v3.11 ("watchdog: delete mpcore_wdt driver").
> 
> As discussed on v4, this version uses the watchdog of CPU0 only, as the
> system watchdog. CPU0 cannot be taken offline on 32-bit ARM unless the
> platform allows it, and the driver does not probe then. The watchdogs of
> the other CPUs are not touched.
> 
> The driver was written for the Cortina Systems CS75xx / Securifi Almond+,
> whose boot loader arms the watchdog of CPU0: the board resets ~300 s
> after boot unless it is serviced. The driver also registers a restart
> handler with the default (last resort) priority, since the CS75xx
> platform has no other way to restart.
> 
> This revision was tested on a Securifi Almond+ (Cortex-A9, two CPUs)
> with PROVE_LOCKING: takeover of the running watchdog; watchdog ioctls
> issued from CPU1; reducing the timeout from 60 to 30 seconds after 35
> seconds without a ping; keepalives for 60 seconds followed by expiration
> and a reset; reboot(2) issued from CPU1 through the restart handler.
> Both runs returned to OpenWrt without lockdep warnings. GCC and Clang
> W=1 builds and host regression tests of deadline handling also pass.
> CPU hotplug, CPU PM and suspend were not tested: the platform has no
> support for them. The deadline regression tests simulate time and CPU PM
> interleaving; they do not replace testing on hardware with CPU PM.
> 
> The v6 changes address the five issues in the review confirmed by Guenter:
> https://lore.kernel.org/all/71aafc99-b3c4-4d4c-b468-086dde709b71@roeck-us.net/
> 
> Open questions:
> 
> 1. The binding marks clocks as optional, the driver requires them (the
>    rate is needed to compute the timeout). Should the binding be
>    tightened, or should the driver fall back to something when there is
>    no clock? Several of the existing dts files have no clocks property;
>    the driver does not probe there.

"something" is a bit vague. One possibility might be to try cpufreq
functions (cpufreq_get / cpufreq_register_notifier) as fallback.

> 2. Is a separate MAINTAINERS entry for this driver the right thing, or
>    should it only be covered by the watchdog subsystem entry?

A MAINTAINERS entry would be preferred, but is not mandatory.

Regarding the issue raised by Sashiko:

 Does calling watchdog_stop_ping_on_suspend() cause wdt->expires to be
 overwritten with a full timeout on suspend and resume instead of preserving
 the saved deadline?

I think we can call that on purpose. Maybe add a comment along that line
into the code to clarify that.

Thanks,
Guenter
