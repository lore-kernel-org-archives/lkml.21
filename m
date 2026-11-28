Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795870239;
	b=AHpm5un1kzC1LiV1SeeZLQCj217lEJH2voQKJ7R+nvT3uV8M18miZKaaFS6/DGwu9gTA
	 3gr8z/gg8mofsDBL7ohSB3VhxOmPjTf6ok8yIx2TvEPfbLrF7sCbpQUzDKLem8mPreZYH
	 NNwlxxvOAvnUs9RubDBdz+ZYYFKB4qvpNE6Y5Gf1md1UhgshXR6Z5JvGL3ktfWTR0gmpy
	 rlZLQCv9QIehv2Zk9wU70QCpCWpZTDcY9YYbvR/Qkri08VcPz6vi/ZzlcFAoLF1WYzRzs
	 Df4lcxYD2Y7J1U6a557jxl0Gt4p7UzUE1Y2sOyRyk/drGS/frX3v2FE4YxOMB99R7Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795870239;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=dlni5aenWpGsgpqbnkM0iGcnmxau0sinRxLH9PXS2Fs=;
	b=POiCxvcFrgXkDNgi+PkmnyeKy3+r8SwcXBP1zHBcKCEOqHgLSXlzhD1XmNmHPacZrv94
	 nRw/3SvVcQSx800uKqLK4rss7r/gfOcOE0fliL0YDhAu+nwmkArkR0GA5iUE6LHNSWykd
	 4o9B4yE9eEFFBFPJxaI5Kz3OFUiqsdo5xlkN03UGZjTJqS3FgoTBB7zdQVV5g9m1v0h1B
	 NXO9LDmkHNt4MyHWR8maGi62rLMDrpdVwX1PKfSW12ECzmafW2APZky8Kr9rUvB8r1GWp
	 kaZzJ8h2IhMrPUFzIBGBYA9QNLt7e2LUwCiFJCJdk4ZaTnXhDnkRna+td1O2nEX1vXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b="fFIw/8GT";
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF13B606A31C;
	Sat, 28 Nov 2026 12:50:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF13B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=fFIw/8GT
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9DE4CA0011;
	Sat, 28 Nov 2026 13:50:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795870229; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dlni5aenWpGsgpqbnkM0iGcnmxau0sinRxLH9PXS2Fs=;
	b=fFIw/8GT60jjAYTmPbWKeOnP2zmwwMbyLtRS4s2ppiXXqQzdz/YKGBQGMDr1fW7Qog6q3n
	T6GT+D2QpZOLhPztQYhay7M3U1cHz2no0zVC8IzR75Ci9XOctoIZVSVjYHku+TH/KIIEcQ
	MZCoKp0mt3AvWeXWLi6xAk5NA96YYGrIhhBDTLcwLB7CF1cghiu48MuPHw6S4GgOWTIOL6
	uX6T96MFAyFttuiV6dPUJjdwtcMa42Xj39nhWpUpxBSBGSb1woCGD/g2o4A2+FTeqkAMoI
	DQasy5uezlW7CLSjebQp3Stko9jzGS/DtPL7vh0iB2ZsFCLK1hPMNl3R01ooLw==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Sat, 28 Nov 2026 13:50:25 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Paolo Valerio
 <pvalerio@redhat.com>, Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>, Gregory CLEMENT
 <gregory.clement@bootlin.com>, =?UTF-8?Q?Beno=C3=AEt_Monin?=
 <benoit.monin@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Vineeth Karumanchi
 <vineeth.karumanchi@amd.com>, stable+noautosel@kernel.org
Subject: Re: [PATCH net-next v9 1/3] net: macb: cache ENST config across link
 down/up
In-Reply-To: <20261127-macb-set-channels-v9-1-0b3addec7886@bootlin.com>
References: <20261127-macb-set-channels-v9-0-0b3addec7886@bootlin.com>
 <20261127-macb-set-channels-v9-1-0b3addec7886@bootlin.com>
Message-ID: <f45f2761a217b02d782039139bd3a046@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On 27.11.2026 22:44, Théo Lebrun wrote:
> Currently, ENST is not explicitly restored across interface close/open.
> If HW keeps its register state then ENST is kept, otherwise it is lost;
> but we do not write the ENST schedule again on open.
> 
> This causes trouble if the config is not compatible with the new open
> and link-up. The two issues that can occur are a link speed change (as
> all timings are configured in a unit relative to the link speed) or a
> change in the # of queues.
> 
> The latter is the main reason we do this change before implementing
> ethtool -L support.
> 
> If on link-up, the cached ENST config is invalid (link speed changed),
> then we ignore the cached config, log a warning and disable ENST on all
> queues. If it is valid, we explicitly re-apply it.
> 
> We ignore the cached config, hoping the current link speed is a 
> degraded
> state which will recover.
> 
> Take this opportunity to replace a kmalloc in
> macb_taprio_setup_replace() with a simple and tiny (104b) stack value.
> 
> Drop the old hack of checking for pm_runtime_suspended(), which has
> little value because we could race with the runtime_suspend() call.
> 
> Synchronise our config using the existing bp->mac_cfg_lock mutex, taken
> by macb_taprio_setup_replace() and macb_taprio_destroy(). To avoid an
> ABBA deadlock between bp->mac_cfg_lock and phydev->lock taken by
> phylink_ethtool_ksettings_get(), cache the link speed as 
> bp->speed_mbps.
> 
> Fixes: 89934dbf169e ("net: macb: Add TAPRIO traffic scheduling 
> support")
> Cc: <stable+noautosel@kernel.org> # more a feature than a bugfix!
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---

> [...]

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks,
Nicolai
