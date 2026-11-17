Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794941071;
	b=rBBmIfy3Jasg3vOxn/kqAZwuqEPS57tDJYsjb6vbJxwK08KM+QPc7kzHcw1OJOO1LeOI
	 PQBOgo7gbuHgK/r61Zf6H6gjFWL277/o0lLo58jpkGQjHgPrd21OhlB8SUkNKLKGu+BN/
	 HCWMlEjUmlUdlEgTBCqs9KbP/Yj7t676g2qEm2dJ+LQL4k0YVO2X8g2jSDh5rZHmAQSME
	 I6W93+sg2dlkxnKvhuTq0l6mgH2kyb9tX1Tv3Zxo/ptsHLtCdfOOZnVmTfLF69kRemyUN
	 d4WoOxFpJxIDrRS476hKhGKOVTcBPz3hRtk+7VFzZeZ+Wua/N5X6QN4Kow8pQqWPIgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794941071;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 Reply-To:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=9z6zKdX4wHoW3xONRbydFSpxllpbzGW0ykN6TGf05gI=;
	b=clrro5KGbJXvLKF9jUU3qY4yk9E9aaV63y1l83XVNxUTu+1cy7tyXlq143tT7E+4igja
	 DCg8kTvCexZQ0aJWePrxuxZMjw6KgLAV67Dq010CFikPjksTLPq2Din4ZIfON3yMWkOqm
	 79HicTTmvxK0Dc/ADPOUN5sqNvXy8f1wEVOtiYC3Nv8ccWhjJgazGdfwgusNYe2SGOVak
	 zqh9y2ReQzVK5H9dqUadlMKvAUOEKYcWSbDlCXLvJzqtd+G8NIh4+qPzfWlQQb9GhSFK4
	 uLsv+PIGPaVvvVybgsauTJxqQs2m7n8G1zx6dfaah5yf9jFclwYjsftOvgL7htc7YUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=asrTOXp6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC385606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=asrTOXp6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A64971F000C4;
	Tue, 17 Nov 2026 18:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794941071;
	bh=9z6zKdX4wHoW3xONRbydFSpxllpbzGW0ykN6TGf05gI=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=asrTOXp6VsSeg06uH0W4wZqfNY3g/CQ5OzO7joJlW4C27LtMYx64GoURgF4MFwLM2
	 TBWR6hL0wpg/bjL4+Mz7/xww7Loqhl1FWn82tIBRJyyNXQJc8eepoGPoYkbaQUzT5s
	 j8MIXbk2OmJ+iU8I9BjCU/SckBOv9lJsBCxVHG1bgaDckUdthyws9f95ne3GzcbuFR
	 Lc4VEn6/u9JbF6nDHGqx3KWCx4yKsDLgohvWAJMI2Dbv6qhydF7wVPmiMLmV+aM2DA
	 SKNuNJSCNgi52MPN0AFph0xoRf58V5Y5fata4I6hvqkXDmxfZtp0OE/ZEp9wfNNL7E
	 joAREUGWF5tbg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 700E1CE08D3; Tue, 17 Nov 2026 10:44:31 -0800 (PST)
Date: Tue, 17 Nov 2026 10:44:31 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>, linux-kernel@vger.kernel.org,
	Marco Elver <elver@google.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v3 3/3] srcu: Remove check from srcu_dereference_check()
Message-ID: <6f9e7e5c-eeba-4a8b-b944-b45bbe591cdb@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <cover.1794869902.git.bvanassche@acm.org>
 <8114def6bdc259f670f3d84f3ae0dad6809cd6c6.1794869902.git.bvanassche@acm.org>
 <723856b0-e1c9-41c7-a6d3-32a45ef1f88a@paulmck-laptop>
 <c935da68-bd05-46b1-b837-e62cda95c0ea@acm.org>
 <2d072123-0315-4432-9f5d-74d6071adb8e@paulmck-laptop>
 <d345bdcd-d3ef-42b6-b2d0-a75f1830f1c5@acm.org>
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
In-Reply-To: <d345bdcd-d3ef-42b6-b2d0-a75f1830f1c5@acm.org>

On Tue, Nov 17, 2026 at 10:20:31AM -0800, Bart Van Assche wrote:
> On 11/17/26 9:53 AM, Paul E. McKenney wrote:
> > Would __builtin_constant_p() help here?
> >
> > If we don't have a build-time constant, don't check.
> >
> > If we do have a build-time constant, check only if that constant has
> > the value zero, that is, there is no update-side protection.
> 
> Hi Paul,
> 
> Yes, that helps. I had missed this option. Something like the
> following does what you describe:
> 
> 	#define srcu_dereference_check(p, ssp, c)			\
> 	({								\
> 		if (__builtin_constant_p(c) && !(c))			\
> 			__srcu_read_lock_must_hold(ssp);		\
> 		__acquire_shared_ctx_lock(RCU);				\
> 		...
> 
> This also fixes the runtime problem I mentioned: the argument of
> __builtin_constant_p() is never evaluated, and '!(c)' is only
> evaluated if 'c' is a constant.
> 
> I tested this with clang -Wthread-safety at -O0 and -O2:
> 
> 	c == 0                            -> checked (warns without
> 	                                     the SRCU read lock)
> 	c == 1                            -> not checked
> 	c == lockdep_is_held(&m)          -> not checked
> 	c == ({ (void)(&m); 1; })         -> not checked
> 	     (lockdep_is_held() with CONFIG_LOCKDEP=n)
> 
> There is one limitation. If 'c' is a plain variable, function
> argument or structure member, e.g. srcu_dereference_check(p, ssp,
> foo->flag), Clang does not resolve __builtin_constant_p() in the
> front end. It leaves that to the optimizer, which may still find a
> constant later. The context analysis then treats the call to
> __srcu_read_lock_must_hold() as reachable and reports a false
> positive. Clang does resolve __builtin_constant_p() to 0 when 'c'
> contains a function call, and that covers lockdep_is_held(),
> srcu_read_lock_held() and refcount_read(). In the current tree,
> every srcu_dereference_check() caller passes either a constant or
> an expression built from such calls, so this limitation doesn't
> affect any existing caller.

Right you are!  Maybe __is_constexpr() would be better?

> So in v4 I plan to:
> - call __srcu_read_lock_must_hold() from srcu_dereference_check()
>   only if 'c' is the constant 0, as shown above;
> - keep srcu_dereference() defined as
>   srcu_dereference_check((p), (ssp), 0), which now gets the check
>   automatically;
> - keep the explicit __srcu_read_lock_must_hold() call in
>   srcu_dereference_notrace(), because it passes 1 for 'c';
> - update the comment above __srcu_read_lock_must_hold() and the
>   patch description to match.
> 
> Does that sound good to you?

Give or take potentially fixing my poor choice of macro to __is_constexpr(),
yes, please!

							Thanx, Paul
