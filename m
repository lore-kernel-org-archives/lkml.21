Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939637;
	b=GwU2orCt/mEszpbVPm7jpMTawEiVP/1DJzM1heFduQjXoktnRyaeBen22+SRF7J0ORf3
	 Pap8tz25tvuMuzMKHV6OkuDAk40EGizs8WtA5M3dTcRkJY63njI0xGQXbKu/ef3andOT1
	 +Qh4atNxzgRQ/yccqpzVUbxLRaHNKto7463Tt8WnZKAlq9cFig9QgKRtX6bphLUg1yjB6
	 gzsMRS2irLWuteOzyZfIsXszmpxbzHyBoE3FmMte4X+fvBzD2ktTPD7olftqU3xb66aiH
	 ceNMLib0GD5vsnER2BQWXn19RpfY6SKBe5EleENlBx9FYqsPTiHQgwy2ZGn1dBZjSuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939637;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Sq/1M//wqu7IpaQb5QglXDa6lGNfNFKR6GV4QiVi6p0=;
	b=5S/+1fIZ0nw8vZhomNKL6qF66SE93FGXIln9U7tXLPd7lhS82BV5Rv/KyIApLGKV2nZr
	 pNV4g1BRTxFRO+4dcj0kkNGpDP+ZKOXyvyuHdecmkNdF5N3Y2UuNWwTzfbDWZa2MhT97G
	 9jqqpgneSY3ZNPZEMg0jTNRv1MScppIqF5oTk8Uu+9Mxz72w0WJU9m4kOUQLzJ6nupwWe
	 3h5aRb5sgTs6RX11b2PZbR+s/nd+0xMUE447U4pOuXRRuxpfb2rHgUvy1UdoL2SSP1yNk
	 Zbg5s2D72359lZM4JtmawuEgILsi35FvVxZGmi/O30CHMRxNI57zrzfuyb5EfsCyVLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=XEec57oT;
	arc=none smtp.remote-ip=199.89.1.16
Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8123606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:20:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8123606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=XEec57oT
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4jTY1w0m3PzlfkKd;
	Tue, 17 Nov 2026 18:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1794939632; x=1797531633; bh=Sq/1M//wqu7IpaQb5QglXDa6
	lGNfNFKR6GV4QiVi6p0=; b=XEec57oTlStiBj8DM4GSfjbzY1JrUDoLCaPevGlc
	fIRCo2Vl+PNjM0RJa70pHJ7vThMvcdJ0ZQMHYGZ05PXzbDKTkEX5WcQoI50Oi+1O
	L+vgmyp3EgimSJ7XVfxR4C/zvA81H5cy97Pe+EwCqqNcccmZPeqY8wV6YnvV2Oq3
	WTD5TxVEJkfaHaWvm6hSi+K+gThZxmSgMpqROoJq2lDoDVUTBYTIdlg+ekzKEmji
	atKvtKAuPCUD647EfYY0nANmz/OMK0xOoowJY1qeJSl5LhD6lsx8X2jhZoQXpXCc
	n9ZGTMlsq4GipPu5iKA+RfJ4X38qArSTzR7Uba6nSnhvwg==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id h0wTM1FqE120; Tue, 17 Nov 2026 18:20:32 +0000 (UTC)
Received: from [IPV6:2a00:79e0:2ed2:d:44bf:cc75:7d8e:9159] (unknown [104.135.182.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4jTY1q4yJyzlfvq0;
	Tue, 17 Nov 2026 18:20:31 +0000 (UTC)
Message-ID: <d345bdcd-d3ef-42b6-b2d0-a75f1830f1c5@acm.org>
Date: Tue, 17 Nov 2026 10:20:31 -0800
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
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <2d072123-0315-4432-9f5d-74d6071adb8e@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/26 9:53 AM, Paul E. McKenney wrote:
 > Would __builtin_constant_p() help here?
 >
 > If we don't have a build-time constant, don't check.
 >
 > If we do have a build-time constant, check only if that constant has
 > the value zero, that is, there is no update-side protection.

Hi Paul,

Yes, that helps. I had missed this option. Something like the
following does what you describe:

	#define srcu_dereference_check(p, ssp, c)			\
	({								\
		if (__builtin_constant_p(c) && !(c))			\
			__srcu_read_lock_must_hold(ssp);		\
		__acquire_shared_ctx_lock(RCU);				\
		...

This also fixes the runtime problem I mentioned: the argument of
__builtin_constant_p() is never evaluated, and '!(c)' is only
evaluated if 'c' is a constant.

I tested this with clang -Wthread-safety at -O0 and -O2:

	c == 0                            -> checked (warns without
	                                     the SRCU read lock)
	c == 1                            -> not checked
	c == lockdep_is_held(&m)          -> not checked
	c == ({ (void)(&m); 1; })         -> not checked
	     (lockdep_is_held() with CONFIG_LOCKDEP=n)

There is one limitation. If 'c' is a plain variable, function
argument or structure member, e.g. srcu_dereference_check(p, ssp,
foo->flag), Clang does not resolve __builtin_constant_p() in the
front end. It leaves that to the optimizer, which may still find a
constant later. The context analysis then treats the call to
__srcu_read_lock_must_hold() as reachable and reports a false
positive. Clang does resolve __builtin_constant_p() to 0 when 'c'
contains a function call, and that covers lockdep_is_held(),
srcu_read_lock_held() and refcount_read(). In the current tree,
every srcu_dereference_check() caller passes either a constant or
an expression built from such calls, so this limitation doesn't
affect any existing caller.

So in v4 I plan to:
- call __srcu_read_lock_must_hold() from srcu_dereference_check()
   only if 'c' is the constant 0, as shown above;
- keep srcu_dereference() defined as
   srcu_dereference_check((p), (ssp), 0), which now gets the check
   automatically;
- keep the explicit __srcu_read_lock_must_hold() call in
   srcu_dereference_notrace(), because it passes 1 for 'c';
- update the comment above __srcu_read_lock_must_hold() and the
   patch description to match.

Does that sound good to you?

Thanks,

Bart.
