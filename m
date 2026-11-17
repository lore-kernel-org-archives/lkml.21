Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794945838;
	b=DCw/fuP5V8ocVDHKMX9RNx+rqOYaGwzMCFIuY4eQd1sadYYK4mf2QTmx9HfTfXPZlf3J
	 KVJFD/9tYO9wGPRntgkeCsJQKR+5VM/GUI0ozuF1haqvf+VCBA28I/dh/vS1fjIQSGmv5
	 eEnmYD113bISfILASWjnr3/q4J02ntaO1Fkq1yvZcmFZUNrhL4nnUYMpBzH/IJ8Rg0Zpp
	 d7QoNcMSMnga+7pOwaSV2+jQdDBHT5BSzVdx/AKFtnmr34RyR7wu7j5yTEbttW59spXB8
	 Bi1yhnp5RKdNYHHYXzwNsNAPrl6T7XpLSOTnfX//mvqYlCZSVNLoPBBRuXQWk5rYlHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794945838;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=U48/tzyhcDGP8mqsWTE+4aQHbfO78xx+pHhWWBO5sGs=;
	b=cJAVWQSPOrwFUfh2VMxRjg9HZv6HVJ635H3uGi4jH4Ecs5dgyQe1c5QiTdp6SUdTK0/K
	 bcNgVzFewKBaQNlGkjgWzNKB+fF/ZdjjHt2dyX59Lwu3EGCVRzaSbbwdiH5QZ4PuJqJVz
	 g7u9C4DEgkz6kbspUfKPLW8z/08M2FujgnU6vSaC6OOTOmHC1JQabjSbVXQOUInK7Qlu/
	 PJnwxj8OaxemCiQnKNKcPCwBnyuaFCQW/Ww6wcxSeyZCyUKpaRWyhrHSBcTuS3vFqxzoX
	 CWcxrI4xUI2NdOpvHXQAW5sqArCbhaNyxgEScal7tyAkSEJ1wXgpYb7j3v6gQMDfaNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=raZdQe8K;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B522606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:03:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B522606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=raZdQe8K
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jTbK96Jmyz1XM6Hx;
	Tue, 17 Nov 2026 20:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1794945834; x=1797537835; bh=U48/tzyhcDGP8mqsWTE+4aQH
	bfO78xx+pHhWWBO5sGs=; b=raZdQe8Kx4vKOp/HQgE81Mrf5tIq0skEzLSpjvk7
	lW6UbnwyWVv+u7iqi1ujLah/IZqnHIFrEF0y4cK7a7KcIIh2BnhxxXUYIWxGciZy
	2csXI1VWF+u7PUn71ed8BIHanfm6gBgApbRvbF6xJPHWaHMSMHImFZK0/3Ssqnms
	s2BHH+qtXxV/ckg4WYNccUH0wyQFKpf1qWAyBgPlONbGz+C/i3CBrupGZZT9QmnY
	zgb6pOOKeiMEqs21CGkYEI7ZhGBNsAJkuXnxJdBCYlMxjUH4mK5juQHOt90mFKsP
	4pDfnsQ/Mu1UGci+GmhWGuAnePA6A/lLQtXpVSxOwrt9AA==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id UdAbBwXI9_1B; Tue, 17 Nov 2026 20:03:54 +0000 (UTC)
Received: from [100.80.227.185] (unknown [104.135.182.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jTbK54d0Kz1XM6Ht;
	Tue, 17 Nov 2026 20:03:53 +0000 (UTC)
Message-ID: <a02a6dde-5baf-4223-a583-5270f39b00d2@acm.org>
Date: Tue, 17 Nov 2026 12:03:52 -0800
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
Subject: Re: [PATCH v3 3/3] srcu: Remove check from srcu_dereference_check()
To: paulmck@kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Waiman Long <longman@redhat.com>, linux-kernel@vger.kernel.org,
 Marco Elver <elver@google.com>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Josh Triplett <josh@joshtriplett.org>, =?UTF-8?Q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, Nathan Chancellor <nathan@kernel.org>
References: <cover.1794869902.git.bvanassche@acm.org>
 <8114def6bdc259f670f3d84f3ae0dad6809cd6c6.1794869902.git.bvanassche@acm.org>
 <723856b0-e1c9-41c7-a6d3-32a45ef1f88a@paulmck-laptop>
 <c935da68-bd05-46b1-b837-e62cda95c0ea@acm.org>
 <2d072123-0315-4432-9f5d-74d6071adb8e@paulmck-laptop>
 <d345bdcd-d3ef-42b6-b2d0-a75f1830f1c5@acm.org>
 <6f9e7e5c-eeba-4a8b-b944-b45bbe591cdb@paulmck-laptop>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <6f9e7e5c-eeba-4a8b-b944-b45bbe591cdb@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/26 10:44 AM, Paul E. McKenney wrote:
 > Right you are!  Maybe __is_constexpr() would be better?

Hi Paul,

Yes, it is. __is_constexpr() is a sizeof() trick, so its result is
always an integer constant expression that the compiler front end
computes. That's the result the Clang context analysis needs.
Unlike __builtin_constant_p(), nothing is left for the optimizer to
decide. This removes the limitation I described: if 'c' is a plain
variable, function argument or structure member, the check is now
skipped, as it should be.

include/linux/compiler.h already has a helper built on top of it:

	#define const_true(x) \
		__builtin_choose_expr(__is_constexpr(x), x, false)

so I plan to write this as follows:

	if (const_true(!(c)))
		__srcu_read_lock_must_hold(ssp);

Writing '__is_constexpr(c) && !(c)' instead gives the same results.

Results with clang -Wthread-safety, at -O0 and -O2:

	c == 0 or false                    -> checked
	c == 1                             -> not checked
	c == lockdep_is_held(&m)           -> not checked
	c == ({ (void)(&m); 1; })          -> not checked
	     (lockdep_is_held() with CONFIG_LOCKDEP=n)
	c == v, foo->flag, function arg    -> not checked (with
	                                      __builtin_constant_p()
	                                      these were false positives)
	c == lockdep_is_held(&m) || !v     -> not checked

GCC builds it without warnings. GCC doesn't run the context
analysis, and __srcu_read_lock_must_hold() is an empty inline
function, so the generated code doesn't change.

I will make this change in v4, together with the other changes I
listed earlier.

Thanks,

Bart.
