Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795536841;
	b=kYn8QcLNVW5Pu79yZv+Vx7MMAHWrvZOrSKDYyNZiy55NOVOtKs+xSIvM1sUh9OrasyNs
	 rgK9slurLct8lhz8z29oz3VsmrbP9JhFQyIexx8ecsMHxpSaoALx/afaeB64auyszA8Qw
	 0V89TJZRYwJH/d7c+MfoxZPYdbCEhN+1xQr5t2xgMVO1nxLdW36sWUIKiZkoVsdcgW1Lq
	 h4rPIe983GzYIAf2KgjKSgrzCeTPdLR5AK7nFUIdeo5/eZTBJOYAtGNlqnLtJFa0EG5lT
	 iL193yAU4yfdrk+uIzEloa+ecDSyL5j1bdCsuZLM5l0pVPd2VjHBHw9/gOUlPsX4SbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536841;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=3skHsXPWAPA6xtcJjoetiAZ5hNyad5A7kWWBwX3cakc=;
	b=zXhIRE09Z6IJqSWNSmPEjnkHHFdC9JIAn4G4XwU7tbYsKWR+bZJNVXHur5ROEtK/c8av
	 S+ZWfFQZOIBdRlAxdIG/CNye6wVvqHO4lyPDWVlYvoExbIYfJk3lBL4E0qc9kt8kWuhrK
	 48su2xRevWZr3NACX88Nz89Vdi0wxBFC3JQRXM7h6rDv0rdM5NGe34plaOlciviVPNNyX
	 yzP1AHQdxGO3LOnbMT495UFHxxI67Kox0TEXLdQdXxV7N93W5mIwwmST5Yr3pXSRnnL+Q
	 QSfP1EpQ5bR03VZMW27k8PRZxbSgcoyo+UKp4e5lfKUMIzB++cIbX/zD/xIqS++6O+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="OiDP+/11";
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4921D606A330
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:14:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4921D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=OiDP+/11
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A39601A1792;
	Tue, 24 Nov 2026 16:13:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 76D2C601E1;
	Tue, 24 Nov 2026 16:13:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2CCAB11E6809C;
	Tue, 24 Nov 2026 17:13:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795536837; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=3skHsXPWAPA6xtcJjoetiAZ5hNyad5A7kWWBwX3cakc=;
	b=OiDP+/118IsNkkWNjVvkTkhOkwiJEOWOgt/AuPd0p7RfL1uW/xPditFOwmUGlJAF+/ald1
	94jFeUbZ18pOhAWP9JdAeLzCIfoUAY4H4OLm6IcU6FaEegWeAb7ja+V5e/5aqY4C8GxgE5
	iqe7I80hpVi1dW09EJBRUcbNKJsfYRc2brJ4F8i9ljOvjSYCXRrEoLADhLZWn03WgVC4a2
	f2Qevq0S93oGchK8Au4ccupyRpgPxM/JKMqxEHx7mf0ufKL10dWwB8aT9iELn7GHRBGQ6Z
	vcceJIYH2yJ111oJRwPMlSr/FKSRRThvC7sxN43b2KaSllqYZp4v+ef2o9qd/A==
Message-ID: <500079e9-e626-4e4b-9880-adeea0724338@bootlin.com>
Date: Tue, 24 Nov 2026 17:13:49 +0100
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
Subject: Re: [PATCH net-next v4] net: stmmac: program the FSM timeout timer
To: netdev-bot+sashiko@kernel.org, zxyan0222@gmail.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 rmk+kernel@armlinux.org.uk
References: <20261118025528.2703790-1-zxyan0222@gmail.com>
 <179520945915.3135.14304625182301747705@kernel.org>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <179520945915.3135.14304625182301747705@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/20/26 22:17, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 1 · Medium: 2 · Low: 3
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [High] On every in-tree XGMAC platform, the XGMAC half of the fix never
>   runs.
> - [Medium] csr_clk_mhz is only computed when priv->plat->stmmac_clk is
>   non-NULL.
> - [Medium] The patch turns on an FSM timeout check that resets the
>   interface, with a hardcoded NTMRMD = 0x6 (about 1 s) for every…
> - [Low] The commit is written as a bug fix: the protection is
>   'ineffective' and a stuck FSM 'was not reported through the safety…
> - [Low] The patch adds ten STMMAC_NTMRMD_* register-encoding macros (1US
>   .. 64SEC) to include/linux/stmmac.h, the platform-data header shared…
> - [Low] The same clock (stmmac_clk) is converted into a 'CSR clocks per
>   1us tic' register value in two places that use different conventions.
> 
> --
> 
> net: stmmac: program the FSM timeout timer
> 
> This patch programs MAC_FSM_ACT_Timer on dwmac5 and dwxgmac3 cores after
> TMOUTEN is enabled. TMR is set from the CSR clock rate in MHz, and NTMRMD
> is set to a fixed 1s timeout. A csr_clk_mhz argument is added to the
> safety_feat_config callback, and NTMRMD encoding macros are added to
> include/linux/stmmac.h.
> 
>> The issue was hit in testing on dwmac4 and dwxgmac, where a stuck FSM was
>> not reported through the safety interrupt despite TMOUTEN being set.
>>
>> Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>

[...]

> [Severity: High]
> XGMAC_TMOUTEN is set just above without looking at safety_cfg, but the
> timer is only programmed when safety_cfg is non-NULL. Does any XGMAC
> platform set plat->safety_feat_cfg?

This looks valid, on what xgmac platform did you test that ?

Maxime
