Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795198489;
	b=xt2Wzij38dVnEpqFs+FLCXrBWHSme4wttaQz2YppcU3yXNGKOaxLd/u/KsZ6cF/INkFV
	 c+23qZlcNf+EYWx0quD3H1MAiAe7uW4c0ynPNjWByDGTBenim4o7UG/SoTUZs8BdZRgbF
	 WfjltRTdiqv2pLisdESuP1cz3S4MCdy+7laZBfCaWgBMx4DsM+R2rAgqvU0c8O0uBd7fA
	 W9/L7jFKYFjAwOUL8+Tvs9/SpcFZv709cX8WasA+GY+Us5voMCFOk6cWQFN+rDwBXrVjT
	 izc1rUQ9Ui3SolGXQaHuswx7JfDub+aMDB5jXj20dKAPUYqs9CQx29dNbFG9qk6Ya3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795198489;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=M8AenZwvV8w3wm5n1csuPhHEsuDa2/V8kXLW0zHSUzo=;
	b=SnkyV8dd+8lENeIMDJ7Hph7noZaHrnQioJHXc4TRd30sXeeceEER2QjfJvRaqZhkWZRu
	 BK5uZrHWVjO4LwocjJmZO8+sOBARKJtEQlXaNP9Z2P1lunIpOpYcRqIzkqfO8dWFz4dnd
	 To9qu7tVq53fPakCabZt4YnMuT4ubAHPeWahjywK/UY2saZSeVo8PAy7QDSEg0HBl6MAl
	 duVlspzBAMTzhobP+U0QB7vp9vTEqkHfMlRI8Px0QBEfqbBJ9EZxz9k7HKqB/OeLK1yv2
	 paFJRN2cDVgfFWhGCJnmn/AoPNAekDKEYAwy9ibxuRf3l8mkpMVY/z/NmpWHapDoSIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=LFesUokW;
	arc=none smtp.remote-ip=199.89.1.16
Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABBC606D4BA
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ABBC606D4BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=LFesUokW
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4jWNlr51krzlfcV7;
	Fri, 20 Nov 2026 18:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1795198487; x=1797790488; bh=M8AenZwvV8w3wm5n1csuPhHE
	suDa2/V8kXLW0zHSUzo=; b=LFesUokWlWwL1HzyZa4r5HE63Ql1xTGfHAgVYviD
	JbRi7Oxamnp2Ygi0V8E/Rx24lqkFtLIKCvIyv/tLCrNM5rnbvKnZ23OAw425fU55
	XQ1NnA+WmFFnSXttWZum1UDGYjr6Ngi9wys3aBHaluesJBV9aHJ195vPFcQZFYFW
	qyY1Z0ki9sdlBZpcUEB8q2X2XXBEOalE5toAS36hArTcLA3FT8U4LGiVGuh9i1em
	rh1rj1IBeqbLkiIPXzhVpz2RW3dj2nMotP6IYQYes6NymS/bQNkyQbr5vw3ncpSm
	K/XLlmHpUuzaA9JJdTnirBrSDvJOuZpdjC94EplmwABE5g==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id r9AP0Byaez3m; Fri, 20 Nov 2026 18:14:47 +0000 (UTC)
Received: from [IPV6:2a00:79e0:2ed2:d:7cb0:c51b:a346:33d1] (unknown [104.135.182.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4jWNlp5hTDzlfcVB;
	Fri, 20 Nov 2026 18:14:46 +0000 (UTC)
Message-ID: <849463ae-c636-42ca-8cc2-667d84fea6fa@acm.org>
Date: Fri, 20 Nov 2026 10:14:46 -0800
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
Subject: Re: [PATCH v2] coccinelle: locks: Add must_hold.cocci
To: Marco Elver <elver@google.com>
Cc: Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org,
 cocci@inria.fr, kasan-dev@googlegroups.com
References: <20261120092646.3062639-1-elver@google.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20261120092646.3062639-1-elver@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/26 1:26 AM, Marco Elver wrote:
> +ATTRS = re.compile(r'__(must_hold|must_hold_shared|releases|releases_shared|'
> +		   r'context_unsafe|no_context_analysis)\b')

Should __cond_acquires and __cond_releases be included in this
expression?

> +def missing_must_hold(f, a, E, pf, p):
> +	e = re.sub(r'\s+', '', E)

re.sub(r'\s+', '', E) turns (struct foo *)p into (structfoo*)p. Can this 
cause a silent false negative and garbled report text? Collapsing 
whitespace instead of removing it would keep tokens separate.

Additionally, missing_must_hold() re-reads the file, runs splitlines() 
on all of it and regex-scans it for every match. Has caching per file 
been considered? Would this help on a full-tree make coccicheck?

Thanks,

Bart.
