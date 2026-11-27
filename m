Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795790386;
	b=L3hdIYfuxNQNQlLvkKWPSe9kfwrlUuuE927qjJ1KV9i8fEJZqDIzAdb1nzK5sOrjwDji
	 SH62WiBLwBdD1uVWdJ6qoZHXInbQlZEsSBY907mXwRhq31ov0wja2NDz++J8pRAQ9VI2Z
	 PCraNgUGvT9/AzYUI2xz9/guDAJZkNaG31s6jbhD2qZI+eCKeFlvmKRQDmWxLo/AZuW1l
	 6Zo/yX1oKNshzDcCAIe74gMtJjhLfVoI8a6AL+18oq7LrWSDSRLEAu/wLErixMlt5U54B
	 UmdX1cxOV1sLk74/XsQx+m5npl/urIeEfe/b3KVakop7sf30YFcsCuBs92Uw8NzxqxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795790386;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=PN86BsZ1PH/DrkXq+czzN5cIE8/yJRupytTCddGChE8=;
	b=HX2De1EwaxzEkcXwEkVb8H7nZcn7t0Z7K7jGlqmFkJaHWDjxA0c3d/4uUMKbTees33+t
	 UrZZ7DSxPmVz4//VLRWgbl0hh4jMQftCITOIkXCpFNvHhJWLCQea5GsCYyJbCy4Tf4WKQ
	 LC0wIAou+dLqlLD76+8zmQc4Ibp3qA2Ws8AYomigYj0KVqH2nQ8ncuwFNoJdIPDjLK6z4
	 3a5Es0EMfkRvkda37X5VQc6VoQICP4vKbn10vbLau+fktfTzuwZVqn5kWHLf327AsU2W/
	 Pvv8lkA3vxMxdIqFQI9flgvEed7IDX7P0Q5yCpmIdnvBCGxYxOa7a1KwQgq+YApNS5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=t5DNb8b7;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D71606A33D
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:39:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30D71606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=t5DNb8b7
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 91FCF1A183B;
	Fri, 27 Nov 2026 14:39:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 664A66049C;
	Fri, 27 Nov 2026 14:39:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 78E0B11E6907F;
	Fri, 27 Nov 2026 15:39:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795790383; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=PN86BsZ1PH/DrkXq+czzN5cIE8/yJRupytTCddGChE8=;
	b=t5DNb8b7kRQmeROkgq54uqsl3RIWeb0Pqjhktx6Cyq8DG3doMvrA3EitFVC5CPCtZXkvl6
	umtkD33iCGfEteA1fNByUu6lf2fbM2WSQoStmuYLcWOboA+BDQkTf93Bhkp+DYx77OUhzV
	Lrgdk9VehHlh0HWNNZU4TuRNnr+PuixskVW0z1dDL/bEq6SQ05QkaVhqQad32bBGroF31p
	QpEhjrD+KdQyfwZd3dSO6HBqPIi2NPTaRrN7pA8Kui7TRqkZRKiubrHwbEuCDPogpCBfrn
	sc4Epar1YBs5q0vKqPygrYZ1KsuWup3FJ7uzmUKYAg2cyBaDnbhSRfjJ+OrZAw==
Message-ID: <29aaf251-f785-42b7-89dd-525fc77029f7@bootlin.com>
Date: Fri, 27 Nov 2026 15:39:37 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH net-next] net: pse-pd: fix bogus budget evaluation
 strategy check in IRQ handler
To: netdev-bot+sashiko@kernel.org
Cc: o.rempel@pengutronix.de, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org
References: <20261126143012.1595919-1-kory.maincent@bootlin.com>
 <179578982915.3135.16459182795663099712@kernel.org>
From: Kory Maincent <kory.maincent@bootlin.com>
Content-Language: en-US
In-Reply-To: <179578982915.3135.16459182795663099712@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/27/26 15:30, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 2 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] The commit message says the bogus check "does not prevent the
>    TPS23881 from working properly" and sends the fix to net-next for that…
> - [Medium] With the early return removed, the simultaneity check at the
>    top of pse_set_config_isr() (`(notifs & DISCONNECTION) && ((notifs &…
> 
> --
> 
> net: pse-pd: fix bogus budget evaluation strategy check in IRQ handler
> 
> This patch removes a check in pse_set_config_isr() that compared the PSE
> event notification mask against PSE_BUDGET_EVAL_STRAT_DYNAMIC. That
> constant and ETHTOOL_C33_PSE_EVENT_DETECTION are both BIT(2). As a result,
> any notification that included the detection event was skipped.
> 
>> The mistake went unnoticed because ETHTOOL_C33_PSE_EVENT_DETECTION and
>> PSE_BUDGET_EVAL_STRAT_DYNAMIC are both BIT(2) and, when only the
>> detection event is reported, the function performs no action anyway.
>> The check does not prevent the TPS23881 from working properly, but when
>> a controller reports the detection event together with other events,
>> the whole notification handling is skipped instead of processed.
> 
> [Severity: Medium]
> Is the statement that the check does not affect the TPS23881 accurate?

...

> The note below the cut line says the fix goes to net-next because the
> TPS23881 works fine with the check. Since a classified PD on an
> admin-enabled TPS23881 port could be left unpowered, should this go to net
> instead, so that the Fixes: tag leads to a stable backport?

I didn't face any issue with the TPS23881 driver but I am only testing 
it on my desk, so I may have miss issue with it.

>> diff --git a/drivers/net/pse-pd/pse_core.c b/drivers/net/pse-pd/pse_core.c
>> index 0477cf6787bd3..ae31175921a07 100644
>> --- a/drivers/net/pse-pd/pse_core.c
>> +++ b/drivers/net/pse-pd/pse_core.c
>> @@ -1291,9 +1291,6 @@ static int pse_set_config_isr(struct pse_controller_dev *pcdev, int id,
>>   {
>>   	int ret = 0;
>>   
>> -	if (notifs & PSE_BUDGET_EVAL_STRAT_DYNAMIC)
>> -		return 0;
>> -
>>   	if ((notifs & ETHTOOL_C33_PSE_EVENT_DISCONNECTION) &&
>>   	    ((notifs & ETHTOOL_C33_PSE_EVENT_DETECTION) ||
>>   	     (notifs & ETHTOOL_C33_PSE_EVENT_CLASSIFICATION))) {
> 
> [Severity: Medium]
> With the early return gone, the DETECTION part of this check can now be
> reached. A DETECTION | DISCONNECTION mask used to return 0. It now
> returns -EINVAL, and pse_isr() reports that to user space:
> 
> drivers/net/pse-pd/pse_core.c:pse_isr() {
>      ...
> 			ret = pse_set_config_isr(pcdev, i, notifs);
> 			if (ret)
> 				notifs |= ETHTOOL_PSE_EVENT_SW_PW_CONTROL_ERROR;
>      ...
> }
> 
> Is this change to the ethtool PSE netlink notifications intended? The
> commit message does not mention it.

Yes it is.

> Can the TPS23881 produce this mask?
> 
> - tps23881_irq_event_over_current() ORs in OVER_CURRENT | DISCONNECTION.
> - tps23881_irq_event_detection() ORs in either DETECTION or
>    DISCONNECTION, depending on the signature result.
> - tps23881_irq_handler() merges several interrupt rounds into one
>    notifs[] word and loses their order.
> 
> An over-current shutdown followed by re-detection could be merged this
> way. So could an invalid detection followed by a valid one.

This is PSE core policy an what should we do if we have detection and 
disconnection event from the driver on the same interrupt. So it is not 
related to this fix.

Anyway I think we should keep the warning in the core and maybe do 
something in the TPS23881 driver to prevent such case. IMHO this is not 
the core to decide.

Regards,
-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

