Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795451161;
	b=GjHqamTHRgmqGYX2C2j+UtAHXsLdFmObJOHOt45ISIlid0bMfZdmMz0mXP9o7nAdPIwz
	 +z3MPtbmQynRnH24Hvu+UmPWauWQDGj6yS0+Y80mUWyodmc+h85v5hQbkKPV/yAKfhmkm
	 N8cCCM+jRA6WJmkklRLQKnH4dTYJEUOL+8PzzACRn+b4iYtGMk+aWNnznNeggSgH4/4CW
	 rRgZbsioOEMACptawof5S2JZVP7pRQJKslZmcdmWj6JHnFjV49cwl7JKFWEr56xmIdxUI
	 MTQBIL56YcQ1RL8clZvrFHGw0V6wC5nqv8B+Huj2EWPq7KiNA/imF0QntYbkQoA8qfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795451161;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=prYaKFvNeeWlQrQJryAk2GXhfdO1aTqsJXUejmAQUqg=;
	b=SrT+CeU7QW+8PhlR9wrNvaLyF48yofJRssOMtytOtol+bBCAc9jugw8zhBBwm5m7ju4G
	 DQn5Xh7DHpoVd0AhDiaZdGdQxYyYCHKJXlwZgxyUomXuJn9QUEI7FCiQgcniu0Y7O1zEA
	 ZHaL76Ffp0YCC4He9IVLFlvI9q8mI6mTYqnV5JrW0+rP5KKrtMFHR9MUdj3kSj0l72AyC
	 epO9T69WBopMVqIY3Hh0zpOhIH27/B72DewXmz4sL7LegrNlUMYDBYPPSH0+SP2jBKYid
	 7RsaKv8fkWYjVD77zO6iLUJEmOBV6zCHRqfeXyE0CR8hjknwY9CaBGNrH4v5ibMbzeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=MVaCUplV;
	arc=none smtp.remote-ip=199.89.1.16
Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A59606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:26:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50A59606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=MVaCUplV
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4jYBBw6S3pzlgy1t;
	Mon, 23 Nov 2026 16:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1795451159; x=1798043160; bh=prYaKFvNeeWlQrQJryAk2GXh
	fdO1aTqsJXUejmAQUqg=; b=MVaCUplVM0ipolWnKYvwj7TZ8VnV2FEVqY9mb1nD
	BAkRAAnajuwougl0h2g914i9dOt0wFbYSwqzHWJFFqbv11rYGVikswd3T+Y14tz+
	w7WjsvFw21lrEX7k+fySuNyGkePN9RQUa0u3Wos7e/FtUf1WOGQjhcFQHoJmLex4
	23XLHnyBn2Lwv/bfbz7/rTapdx7jkN0E1Q5frd7HdFTu/2rTkUum6r8zRJi6Up7+
	Gl6XQQNOyZSGVFIO0f4hNWyvqx1AkfXUYWISx85lJXRJShSP5GqQnF8mGdgaYR0K
	sP8F6mWnmM6ja6BsFFU4jsaw/4ZRfCFgJLVh0ZC9nAMZ1A==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id yygoOFxefgOr; Mon, 23 Nov 2026 16:25:59 +0000 (UTC)
Received: from [100.80.227.185] (unknown [104.135.182.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4jYBBv05J1zlfcns;
	Mon, 23 Nov 2026 16:25:58 +0000 (UTC)
Message-ID: <4f7c329e-d722-427e-8279-14c55fce7d71@acm.org>
Date: Mon, 23 Nov 2026 08:25:56 -0800
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
Subject: Re: [PATCH v3] coccinelle: locks: Add must_hold.cocci
To: Marco Elver <elver@google.com>
Cc: Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org,
 cocci@inria.fr, kasan-dev@googlegroups.com
References: <20261123104616.226112-1-elver@google.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20261123104616.226112-1-elver@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/26 2:45 AM, Marco Elver wrote:
> Clang's context analysis treats lockdep_assert_held*() as an assumption
> that the lock is held. A function that asserts instead of being
> annotated with __must_hold() therefore passes the analysis, but its
> callers are never checked.
> 
> Add a script that reports functions which assert on all paths that a
> lock is held, where the lock can be named in a function attribute, and
> which are not annotated with __must_hold*(), __releases*(),
> __cond_releases*(), __context_unsafe() or __no_context_analysis. A lock
> can be named if all identifiers in the lock expression are parameters or
> member names, or if it is a global of the form &name or &name.member.
> Functions that mention the lock before asserting it, e.g. to acquire it,
> are skipped.

Bart Van Assche <bvanassche@acm.org>
