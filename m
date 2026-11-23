Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795471695;
	b=FSlJq51+dx3sPMlPkO0pIofbCeSkC+69PLOjplPTizReaRbziwD+RENlwfDes6Onyc/K
	 g617lRMUAeYHh6+Rn7a39++bM2q5S3z41dNve5n47XdKNlFhJ2IzGmsTfZRD/hmZfWQgk
	 fWh0lx/+hczqn/pSiDRE70cws6AKh/5jtbrsKvJGgjUCKKz6L8hXEMCLTR6kdQNhtHJO+
	 oOHzzFtGz741DEg7tJ9lVZz4TZI3lQJkM7T5kjjgpXiG6M1ewW+ZxKp8X/snxT8e/M1Re
	 LyXzuYLWbe6CnFE70pllkDs9r2dHdGW3GW3nEsTzknsU1Eovh2dy/uAEnAEaPDu2fpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471695;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
	bh=8d9e+YMOidi5LL2xCdgLdHHyKqQI1BilnlId8h90LJM=;
	b=dgndMwGSYPxvdtBwdBWL67+st1yi7nmJtWKL+QK7Gn+q3dDqfF1hfS4CYuGDSex9pq15
	 tSTT4xpfHylZUOQP6d87Lrz8Ef08pmuLnOs0NnqER+nUWNvQp4k494zNCZD1jfuX4vz+8
	 1ns6JqHnOCzOwQq0KJcsjYEprqOZiOfTzi+PQurJ8VYb4bRRBVswEqCgndToPotpoj6G4
	 TJQ2yU4vgvYTfLeH6+ZyY4bWerETVdDyRnYvK85N0ng3Z9q2ayRoIAay6nZFx6Dn6Hcnw
	 GZxWcWh5Ud5WUbu1wYinRn03JbHfqsFn4zqEGxbAk23QsTxi3GbH8R+W/mTJ7WqzC6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=gPwZ6LVs;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A6F606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:08:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3A6F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=gPwZ6LVs
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B5F54C4EFD8
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:08:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 55E7C604E9;
	Mon, 23 Nov 2026 22:08:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C324411E6AA51;
	Mon, 23 Nov 2026 23:08:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795471687; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=8d9e+YMOidi5LL2xCdgLdHHyKqQI1BilnlId8h90LJM=;
	b=gPwZ6LVsEXxNep/JPL+zIVG3xBj9ljumiCBc3iK3Exa5TwW0IT6uCSkaEQaT/fPUz8if/o
	va8LGpot2hbC6Z9zVrRaE3qG81yGiHNUYXQo+5Nhq3mccRPYc6Ya4vPu1+qM/DGJ8rNqoM
	luwTI1yrAgHoL3pOqqLhlI6zMyelOdpi6fvtS12rQERX7SlXnpnJHfPZjVC7vU3SqBuqlN
	mHmKLEtH0jcBiLbajAGjijg54L08qrRZMVTciAl8bTHDBPjDxF8YI64vUdJROJIGAIp2ZZ
	DTwUMk/FGx1C0tXturzJY3r8I0rReizsoCHpmh/JEqRl472Zm+PZVUzzxGXTVg==
Date: Mon, 23 Nov 2026 23:08:04 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Fil Dunsky <filipp.dunsky@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] rtc: Add Cortina Systems CS7542 RTC driver
Message-ID: <20261123220804bcab0f99@mail.local>
References: <20261123-b4-cs7542-rtc-v2-0-31ab43f2cc8e@gmail.com>
 <20261123-b4-cs7542-rtc-v2-2-31ab43f2cc8e@gmail.com>
 <202611232056209fabb078@mail.local>
 <179547125963.75567.6386430167092445665@gmail.com>
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
In-Reply-To: <179547125963.75567.6386430167092445665@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

On 24/11/2026 01:00:59+0300, Fil Dunsky wrote:
> Thanks for the review. I have sent v3:
> 
> https://lore.kernel.org/all/20261124-b4-cs7542-rtc-v3-0-53902bfbe0ae@gmail.com/
> 
> Probe now leaves the enable/reset state alone. read_time returns EINVAL
> when RTCEN is clear or CLKRST is set, and only set_time enables the clock
> and clears its reset state after programming a known time. I removed
> the redundant rtc_valid_tm call, the two probe messages and the ALARM
> feature clearing.
> 
> I also checked the year field and the calendar on Almond+. The vendor
> register definition gives BCDYEAR bits 15:0 to year data, with bits 31:16
> reserved. Using a separate RAM-only range fixture, the hardware passed
> 2099 to 2100, February 28 to March 1 in both 2100 and 2200, and February
> 28 to February 29 in 2400. Century carries into 2200 and 2400 passed too.
> The 1970 and 2038 first-second/boundary checks, year 2000 leap day, and
> 9999-12-31 23:59:58 to 23:59:59 also passed. I therefore changed the
> advertised range to 1970-9999. These are specific boundary tests, not a
> hardware sweep of every year.

So why not 0 to 9999?

> 
> An exact-driver RAM run separately checked reprobe with RTCEN disabled
> and CLKRST set: probe preserved control, reads returned EINVAL, and
> setting current UTC enabled the RTC and resumed counting. Each run
> restored current UTC before returning to installed OpenWrt, then I
> verified restoration again from fresh host UTC. Firmware was not flashed.
> Full independent ARM built-in/module builds and source tests passed.
> 
> Thanks,
> Fil

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
