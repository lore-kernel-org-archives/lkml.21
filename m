Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167134;
	b=5F0Hra6J9qT5Zee2Rhqcbtlhrsd52iKq45ShRuKcCLHkXZhKebuZBUQn0vQgvN8w2XUq
	 IionvLE/iuK6ioihxA/2jd4eUEEhC9fWuoWggdC9maxV/1l3Bm82s8j3LqcVd6W+mGpD5
	 2fk+g87M0/L6fMgZtY/Qhm7ig2aNMg+7D9L8K/0nCg0TWEzi2YvVGqXmvPopmg6fLHHyX
	 IEP9BuVMRTcehwG+FZr+ymeJGvPhbOYjdFL5VGNwX9w3vzMljIRqhSBKnJHPXijyzlUyn
	 upJOWdbIwmZMG3nxUvs5mPO4sSnDJQA2e0Ehq/G6gNp9z6KCuvtvYMvBxSA7Wp6CyYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167134;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=NOdHN8HSi06sDrJLUdjkF+/dA9o+toApfuz7TH64mOw=;
	b=NekkD4MjZHa7iFRcC/k+dNpj5goNZPFUNnZdUVQLj2kjrUp+j1VrtWFd142Tnn2b+D2/
	 evGskZMZLYr5zAzCFc1i4e94YK5/1OzbDoGRsNP61z1estwsvzHDvh5u6j36Eig7SJB8S
	 lRVyXk0OVtHz4pzP6HY2w3YM6tVCzizk4N8H5D7mSQybPKRebSNkL62z9fZ0zYMwTi/Ed
	 +FyrsLFgGR1EtHCLQMwuW1bOwdTfGrQuRMXWBMfUXa5Ze1w/PJcCCZBRPXqRqkvxteac+
	 sRD7jqpuFTy6raOCp+ncq5k5+duwQytcTI2X/sr+UXU3Gp7156P4PyMM7tGvMvnxFMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0xS1lnJG;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C70606A332
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:32:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5C70606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0xS1lnJG
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 085214E41686;
	Fri, 20 Nov 2026 09:32:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C7E3A6017D;
	Fri, 20 Nov 2026 09:32:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BB32611BC0EC9;
	Fri, 20 Nov 2026 10:32:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795167129; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=NOdHN8HSi06sDrJLUdjkF+/dA9o+toApfuz7TH64mOw=;
	b=0xS1lnJGlmwliZy8MMggKiEvVyPYie91pstHyIlVCfKnUZl+K9fiSAoHeuM1sxmGCl/WIL
	iOeXaqpzFKJ1PBmMXGtDnfeggNgvqyJ4eLiHih72EgzNnvf9YkZzhZcoHPtnfmwbs3Gc7Y
	6063AIdoqm1KYWamSxnlj4fMf4SR5fllXmmLNvVYYLIAFmudegaicrIyiapkzOCu6Fh6TM
	4hvBrZafbqnTjhHPYVjS1OIQIw+Nm9eEnLPzdFiNWOEg/lmt59YdZZqRObu989gAr2YocD
	tSanyMLyCWdvKhJI7fpKykRVtP9XYbM9fLWcRFh5EAsNw9vhLqqSg/Vw1BmTpg==
Message-ID: <c84543f7-b824-4da8-9f8a-8e15d8f89140@bootlin.com>
Date: Fri, 20 Nov 2026 10:32:01 +0100
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
Subject: Re: [PATCH net v5 06/14] net: pse-pd: check the PI state under the
 lock when setting a power limit
To: Carlo Szelinsky <github@szelinsky.de>, netdev-bot+sashiko@kernel.org
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Kyle Swenson <kyle.swenson@est.tech>, Ross Cawston <ross@r-sc.ca>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <179515691045.3136.13671979747174463292@kernel.org>
 <20261120083312.2324522-1-github@szelinsky.de>
From: Kory Maincent <kory.maincent@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261120083312.2324522-1-github@szelinsky.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/20/26 09:33, Carlo Szelinsky wrote:
> On Fri, 20 Nov 2026 06:41:50 +0000, netdev-bot+sashiko@kernel.org wrote:
>> The check now runs under the lock. Is admin_state_enabled &&
>> isr_pd_detected enough to show that the PI is powered and has a budget?
> 
> No. This is the same point as on v3 and v4. The patch only moves the
> old check under the lock. Kory agreed to leave it for a follow-up [1].
> 
> Kory, one question: we are at v5 now, and most new findings are older
> problems outside this series. What do you suggest to get it merged
> faster? I am happy to fix the older problems in follow-ups.

You have my R-by on all the series so we can only wait for a net 
maintainer to take it. Jakub, Paolo, would it be possible to take it?

-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

