Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795224725;
	b=merHQf2nuLtopX0H5fbA5mHcpfTbHUjB7DlSH7WF+L7oYYd3pFGCsB8bBGN7daLR7+Y/
	 mzoCy7juX2bniKBpnxuqdHW/D279UtT4Y8FINk5X9DHjipk2/yhb9WEq41W/6Eem8llvR
	 Vp14L1lpry9IaA+iseDJjszuCYA3Bql4+izliSD8CgnCoKz1E3PFtBoxPSswHFzfwFslH
	 goIP2zxpnQZ5F2DZfTD1+AIkRu+oNyrxpQqugzbk1oB+1WcV7Al6vkKtoHjCmh95bhDC3
	 8zxfEuS3Qz5To75JCRhv76xslizWhNZYN9YjwzEv4V3RtZFBZ8Vg87rQTQpEVJ7LWhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795224725;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=rlDLliB+QOtD7Ziahgfuy5fLAO8NSvZb0oJ9Xi9dkRs=;
	b=IKASM+54HcBeyA1BPVvo0fj4fA9+teTt/VTVzn6yvbT1D4LBDMlh53rloMiAXdVnUwU1
	 3PY/n9zGi6jmmKTOrIgZQMUZ+QBO/Ab619LTrZ/DKELBDv8hQwfjGI7VrvActpZ8u6Vqe
	 pVeGsjhg6A83cGiacRRCR61nt1teE3PIog8iPYRZAmgAGqKKhuRagS0tn4Y6hELqplVc6
	 cbmPxyDQ+ZL/OWMXYr2NFp2QCX4dIZgTdLJdoM+HD1tS9e1BA2IhVRW2xg9qZ0rTTWRZZ
	 nn+4+I6DMeW3MgpBVx6TFQEWCYsolDqDZPYVrMOYqoDaif0TYt1R0ElzU/q/2slN3LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=s85U6r6i;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1501F606A692
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 01:32:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1501F606A692
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=s85U6r6i
Received: from eig-obgw-6007b.ext.cloudfilter.net ([10.0.30.166])
	by cmsmtp with ESMTPS
	id UW3rxAHOnyb4YUZxTxbQS0; Sat, 21 Nov 2026 01:32:03 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id UZxSxlvir3nNNUZxSxrBvx; Sat, 21 Nov 2026 01:32:03 +0000
X-Authority-Analysis: v=2.4 cv=TuLmhCXh c=1 sm=1 tr=0 ts=6b00f493
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10
 a=9C19SFpus36fZyHDVEEA:9 a=CjuIK1q_8ugA:10 a=O8hF6Hzn-FEA:10
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rlDLliB+QOtD7Ziahgfuy5fLAO8NSvZb0oJ9Xi9dkRs=; b=s85U6r6iq7R9/waSVarOgreJWT
	TrcqunRegDk7BrDXjdDvhXx4es4vrkbmwPEp/3XBkdSzvLV0rpgskhpqxgEx2LpS4+KKUjINzO9FQ
	N8qo+XKoZEPkQ5ncqxoRpzH9szgXSczSvBnU049qKPUo5qHTwhpnZDOu3ZulJHkjpM3bjPSafwusf
	cTrrqlsYnvVDZ+5aRuVGm9VQEzNd2HzH8xQe5TJUbJBqVkQvnvMBY8PhJJyXpdf32Onz9lyXd/pes
	0NfotXZOc9IRhHefWSstRJPMu4Tvr46+Gcm/5hWdYWa+M9FhgTvoLJgwNOL+bsJtY0mILBfMwP5ie
	rGoKgtRw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:37764 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xUZxS-000000041yX-18L9;
	Sat, 21 Nov 2026 07:02:02 +0530
Date: Fri, 20 Nov 2026 17:32:00 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Diogo Ivo <diogo.ivo@siemens.com>, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] watchdog: intel_oc_wdt: Stop the watchdog during
 system sleep
Message-ID: <66a0d81c-13f4-40a2-bad1-96f9cf98deed@roeck-us.net>
References: <20261120102311.621074-1-pmenzel@molgen.mpg.de>
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
In-Reply-To: <20261120102311.621074-1-pmenzel@molgen.mpg.de>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xUZxS-000000041yX-18L9
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:37764
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 1
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLtmZbUxHNo/lp/zu+mG+cJrzUnR3PbLHEiAAH4DRkHOl+2Y2g+puY0buhmr42iRYOdFU8D3i0slPasuMopCyUa7xIWQzfDiSRIEcxgDFA9BRvLxWGJw
 +POiLbzRVm+VFjGkCJxDdSbwQN/K6mK6hZ5JWtQgEoZFbOHiGkdCLlwiTSAAq74pTz4q1OAhoE3Ea93vOtCXBBCxHP7Q3bXhHNXvz1Us0bkfLcFOBwLbATEa

On Fri, Nov 20, 2026 at 11:23:09AM +0100, Paul Menzel wrote:
> The driver has no system sleep callbacks, so a running watchdog keeps
> counting in suspend-to-idle. Suspend-to-idle stops the tick, so neither
> user space nor the watchdog core can ping it, and the watchdog resets
> the machine once the timeout expires.
> 
> On a Dell XPS 13 9310 (Tiger Lake, BIOS 3.17.0, no ACPI S3) with systemd
> `RuntimeWatchdogSec=30s` on /dev/watchdog-oc, both `rtcwake -m freeze -s
> 900` and `rtcwake -m freeze -s 60` resulted in a reset about 30 s after
> entering suspend, without any message in the journal or in pstore. With
> the systemd runtime watchdog disabled, the system stayed in
> suspend-to-idle for 900 s and resumed normally.
> 
> Stop the watchdog in the noirq suspend phase and restart it, with a
> reload, in the noirq resume phase, as iTCO_wdt does. Check the enable
> bit in hardware rather than watchdog_active(), so a watchdog started by
> the firmware, which only the watchdog core pings, is covered too. If the
> control register is locked, the watchdog cannot be stopped, so leave it
> alone.
> 
> Also program the timeout again on resume, whether or not the watchdog
> was running: the platform firmware may reset the control register, and
> when resuming from hibernation, it holds the timeout the boot kernel
> set. intel_oc_wdt_start() only sets the enable bit, so a timeout set
> with WDIOC_SETTIMEOUT would otherwise be lost.
> 
> Unlike iTCO_wdt, do this for all sleep states and not only for
> suspend-to-idle, as it is not documented whether the platform firmware
> stops the OC watchdog in ACPI S3 or S4. Hangs in the device suspend and
> resume callbacks outside the noirq phases are still caught.
> 
> Tested on a Dell XPS 13 9310 (BIOS 3.17.0) with the module built for
> 7.4.0-rc1 and systemd RuntimeWatchdogSec=30s:
> 
> - rtcwake -m freeze -s 120 resumes normally; the stock module reset the
>   machine in 2 of 2 attempts.
> - TOV restore: with the watchdog armed, overwrite TOV with 0x3b (60 s) via
>   outl, as the firmware might, then rtcwake -m freeze -s 60. v1: register
>   0x0080603b after resume (TOV 60 s kept). v2: 0x0080601d (TOV 30 s
>   restored, EN set), watchdog still running 40 s later.
> 
> Fixes: 535d1784d8a9 ("watchdog: Add driver for Intel OC WDT")
> Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>

Applied.

Thanks,
Guenter
