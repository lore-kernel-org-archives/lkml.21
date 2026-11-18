Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.210.214.84
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795055551;
	b=wf8mfy+GYBvRN/ataqiWtoOxbPr0oR90RaWOAZhOdw8Fizz6p8ZN/1f0LZgojAnZJw/G
	 yVcbJnnMZRolihu7hnukf8i45QGy9nAaWID37NmG18HRmH35A/QnGXLF4M+wiMHV/3FFc
	 sfPUCYcqsUGiC8aN0qzAL1+eN2jX5VskoPU+XznZBpi/6pXrotq4n6+4NjUeTrJ+M/pyg
	 xtXDIs2zmNMnZvxjNAOLHwKsOYLXowX+P3TeTnrdhrYPMHmxwODZhzHrIEreM7xLm9LFv
	 8XzYsCEdCmccfmWpE6Gfdxi1oZUChAO8HshdMJO9zdHVWKKvooKuueZjIF/h1UIWfdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795055551;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=dUTbeAqAaxTuM0VMwjdSnWt5sh+rSDLf8Abkyx7bI7U=;
	b=NtJ+oMKumiLH82uux0fL2hxfgaAxNpTHaI+MbtPUo01eBKHLwnzEFfyVRDgoNdeL3X7I
	 kRCrfoHxRBOs0IJew43eL96CnbhkiPNzL/M4m4Z1pSiT5fMOqpv95ifgyRcK9EEQ1/pGA
	 7oXoHf6qXt/SM+yE159ysWbzZv4/KKcoUNiZAVe2eDP8VsI9fqOpcVCGQ7xQOOCsIr7os
	 +aUeuJlBxUovrwglIxhlcJqS7AjqZJFrEse4pcHmc4czhD9lHtObwDzvu1AL5UZShN+rl
	 7E4J0w8Er7f0kIBOJyiU95GpYf7ZbkxueuSoC0vE9zJms3pZMbpd6/seBPTAKDNxgHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=codewreck.org;
	spf=pass smtp.mailfrom=codewreck.org;
	dkim=pass header.d=codewreck.org header.i=@codewreck.org header.a=rsa-sha256 header.s=2 header.b=THluwZ9J;
	arc=none smtp.remote-ip=62.210.214.84
Received: from submarine.notk.org (submarine.notk.org [62.210.214.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8039B60A2604
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8039B60A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codewreck.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codewreck.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codewreck.org header.i=@codewreck.org header.a=rsa-sha256 header.s=2 header.b=THluwZ9J
Received: from gaia.codewreck.org (localhost [127.0.0.1])
	by submarine.notk.org (Postfix) with ESMTPS id 47EC714C2D6;
	Thu, 19 Nov 2026 03:32:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org;
	s=2; t=1795055547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dUTbeAqAaxTuM0VMwjdSnWt5sh+rSDLf8Abkyx7bI7U=;
	b=THluwZ9Jb3QnCaD5M7NYO6mEgwewv5ZOoUprA/fbAwiKi3NJbkPLBOAP3sAA6tgu5G2WlT
	nmtgfawb1EZtJlQkcjFFWh79ZZ3ly+R+KoY9zyLxve+W4HL7/+aD+EimqY5L582OKqM62Y
	kRLumdcfvWWg5/exsTiCA1SM2UsUgjXYnLb0QkEqpoFYE95ZfXALOPjrWqyNy2sjaHQIEO
	wUwe2PEUHNYYFhDdNVRHmzSE1Y7Fdf4XUncoYyir1Dpe83tryp2SP2bxYIOgWVdorWMBR2
	GoV3KZ1WqL6JdFCyL6hEvXCvXXnPLWyp+FSTGOdyBIwBrT71QgZY5Bev53GSsQ==
Received: from localhost (gaia.codewreck.org [local])
	by gaia.codewreck.org (OpenSMTPD) with ESMTPA id bbd5e468;
	Wed, 18 Nov 2026 13:45:36 +0000 (UTC)
Date: Wed, 18 Nov 2026 22:45:21 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: Michael Mulqueen <mike@method-b.uk>
Cc: David Howells <dhowells@redhat.com>, Pierre Barre <pierre@barre.sh>,
	ericvh@kernel.org, lucho@ionkov.net, linux_oss@crudebyte.com,
	v9fs@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] 9p: fix data corruption with writeback caching during
 concurrent stat
Message-ID: <av2r8RSBGsPlDPPG@codewreck.org>
References: <20251227083751.715152-1-pierre@barre.sh>
 <1667424.1771432276@warthog.procyon.org.uk>
 <e2c960ca-7b29-45e1-b650-849fc357f8b0@method-b.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e2c960ca-7b29-45e1-b650-849fc357f8b0@method-b.uk>

Michael Mulqueen wrote on Wed, Nov 18, 2026 at 12:22:00PM +0000:
> I've bisected it with my reproducer script and found it was introduced
> in v6.4, specifically commit d9bc0d11e33b. I wasn't sure about the
> etiquette of jumping straight into a discussion and tagging regzbot, so
> I haven't, but I'm pretty confident that this is where the regression
> was introduced.

Bleh... Given how old it is I'm not sure regzbot is appropriate (as
Thorsten pointed out), but it is a bad bug and the lack of follow-up /
time on my part hasn't helped, having reminders would have helped and
can still help if nobody feeds the machine so on my side tagging regzbot
even now is welcome, even if I'd like to hope we can finally get this
fixed in a timely manner - the third time's the charm?


> That is the commit that adds the writeback path -
> before it, cache=mmap did not buffer writes through the page cache, so
> a stale getattr had no unsent data to zero.

Right, I wasn't much part of the cache rewrite, but cache=mmap not going
through the page cache meant that concurrent writes + modifying mmap
would corrupt the file, so I think enabling write cache makes sense --
even if it's a side effect that probably ought to have been commented
better.

The problem is that this bug happens with cache=writeback in the first
place; I expect this isn't making more noise because applications
generally don't stat what they're doing but also that cache modes aren't
default so probably aren't used all that much...

> I have tried the fixes (Pierre Barre's v1 and v2, 27 December 2025, and
> David Howells' sketch, 18 February 2026) discussed in this thread

For reference:
Pierre's v1 https://lore.kernel.org/v9fs/20251227083751.715152-1-pierre@barre.sh/
Pierre's v2 https://lore.kernel.org/v9fs/20251227180137.730385-1-pierre@barre.sh/
David's sketch https://lore.kernel.org/v9fs/1667424.1771432276@warthog.procyon.org.uk/

There also was another simple shell repro here:
https://lore.kernel.org/v9fs/2025543.PYKUYFuaPT@weasel/


As for the way forward, I'm a bit stuck: David pretty much NACK'd
Pierre's patch and sent only a draft that I wasn't able to process
(given my chronic lack of time for 9p)...

For starters since you've already rebased the patch, could you resend it
as a v2 as a proper patch? just looking at the diff I expect the
conflict to be around the size update in v9fs_issue_write() and easy to
fix but I'd like to at least get the patch sent properly so sashiko has
a look.

Given the commit message I also wanted David to split the patch at the
time, but now I've actually read the diff it's all intertangled and I
don't really care anymore so let's go on with it.

Thanks again,
-- 
Dominique Martinet | Asmadeus
