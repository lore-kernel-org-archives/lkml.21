Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.59.206.189
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795007656;
	b=1qJ2PB7bztMmU/T98xXp9bvXrrNQu5Ay5CfbaPnkUNnEqgH7a3m1mbdzLyjluRQvdC6J
	 GhxthlHNzzK0eLY2fV8XeULr18ZNbMmBjk8xVUebHJocRG/fyfFwqMVL+5LtTsWuOOuVC
	 FLzOxRi7OHwR5JFMV3YZX3ppndVcP6E8GbAVdwy99RPPIYEXGqhXfZeDSCEbXAMKdXg9k
	 H9eb44Bg2GIZa4wyjsGCIUCbuJu2sQjCxpk5+3PscVt0sV4bCiRZE74k69iNmT+1eddDz
	 Z/X+E3mXsBecnGwRkl68nuFJlFbOaj109OTrAXgAVNtJf4Im4jylX2kRI9V04IzjPDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795007656;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-NC-CID;
	bh=jfqiFSSFUtLpubMeYazVtBiAKSCsMWfxFdymjZV2kbA=;
	b=futmmKMxQUmTzBWmtPpl9pcTElpkSWwbjHlKVgcZrhWV/EtX9Eg2a8JFYWFDmtcFZEof
	 nFaCidYyN73ErJNsOFsKq8KdmtArfKMHBqbYfkrpzYni+fTG81t6a+Pvcn0FQwggI7Nsq
	 HFU7xw1BBGdmT4ldEYoqHTecSX0k6Hh8QQA6bgb8xEu44m4VMLsbjgP7LQXUwMPQ1T8JN
	 3/AmEcWlINlVyRY9SSR5ZB1rL6x5Wz6MUbWIBU3RwKPPmlbYGzRG4+cdTBWIW9XB4Mqaq
	 6Kx6AjB/Cyj2tGvccNbHdg4VpWpZXCn9HSDB0FuGz9yw9PgClS/WPrNXAfLlZxoIzEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b="T9/RB7wO";
	arc=none smtp.remote-ip=194.59.206.189
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [194.59.206.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4255606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4255606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=T9/RB7wO
Received: from relay02-mors.netcup.net (localhost [127.0.0.1])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4jV2970lzTz4Hx2;
	Wed, 18 Nov 2026 14:13:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1795007611;
	bh=N97bBK4e1wdhkPXJ9UymJ0KcG94sTetJEBypKucc5a4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T9/RB7wOAqq8VleQEublMKH3Pzu1I0KWWm6EBovTi4FuBsv2lMJSWzVj1KhASvNAk
	 rL+BtpqhFbMBFSVHZhME4yi5CrpBsmWao8sjpN+NZvyCyn2jvWwszZGgs+6372AZ+0
	 1Ii5wDncNOMGgcqSuh5kzVrx8Bh28We/ZoIFJaadmT7CruFbfQawOrVW2lA0ECJJeg
	 SoObLy0ESGh5cJ83XbUOnysGtZt/9jwzcFIZrmOyUHY7d5S/OnzLBnEkFwgMiYcY8C
	 ossdIX/0LI63S9wKlMysFEep2jSj6vzIGwQHLYH35/8IkB3Cv3SLw3n5w3uYBbO/3r
	 LsWONk9wQJRgQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4jV27S6NDPz7yQm;
	Wed, 18 Nov 2026 14:12:04 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4jV27Q6rhMz8tL0;
	Wed, 18 Nov 2026 14:12:02 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id ABFA95FA08;
	Wed, 18 Nov 2026 14:11:41 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <80eace12-17a9-4bae-a923-67174c663fc6@leemhuis.info>
Date: Wed, 18 Nov 2026 14:11:40 +0100
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
Subject: Re: [PATCH] 9p: fix data corruption with writeback caching during
 concurrent stat
To: Michael Mulqueen <mike@method-b.uk>, David Howells <dhowells@redhat.com>,
 Pierre Barre <pierre@barre.sh>
Cc: ericvh@kernel.org, lucho@ionkov.net, asmadeus@codewreck.org,
 linux_oss@crudebyte.com, v9fs@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20251227083751.715152-1-pierre@barre.sh>
 <1667424.1771432276@warthog.procyon.org.uk>
 <e2c960ca-7b29-45e1-b650-849fc357f8b0@method-b.uk>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <e2c960ca-7b29-45e1-b650-849fc357f8b0@method-b.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: 
 <179500750219.2145202.12078122543303060447@mxe9fb.netcup.net>
X-NC-CID: 3htsrNuz0alture0GSC5CM6gSzXmyH3PNGuvJBarrD5ZcY2ImA0=

On 11/18/26 13:22, Michael Mulqueen wrote:
> 
> I've encountered this bug and have spent some time confirming it and
> writing a minimal reproducer script for it.

Thx for this.
> I've bisected it with my reproducer script and found it was introduced
> in v6.4, specifically commit d9bc0d11e33b. I wasn't sure about the
> etiquette of jumping straight into a discussion and tagging regzbot, so
> I haven't, [...]

FWIW reg. regzbot: given that this is a regression that apparently
happened years ago, there is nothing much regzbot or I can do for you,
so I'd say it's not really worth telling regzbot about.

Ciao, Thorsten

