Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794946793;
	b=pOCQZwwC2jpg4JyNP6kEUAPK+utwcZymvXw5kvdSOJpQR6S0LmEJkAkLs3wpGTF2j88A
	 Ib9J/203GgUBK+Ro7YAfXJEtaVe720PWrNxUVEJWqSrnjYyljbv+/X4PyRywtfk6VnmuD
	 Ad8ZMbESJGiCB4CKLjDnXLzfEoQP9L4lAVm6g+SvlogJ6uPN2SO55NYJByQlhnfZCNLPB
	 6smc6/Lxc7NnNHUH5jl/jg08gP6ydlmXKKqwSGmcn8Ps3mqeU7oKtCaROivXLhAm2/6wB
	 BbRud8EXBfxon/nwBG7dD7acDqLD2qWW5e2N4SuEEF2NsiAGh9reQNTsNTtWgEdO83w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794946793;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 Reply-To:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=A7sFWg3FdFGJFzC56OEY89EwyXtt7N1MPCo8Ll2755w=;
	b=zvjGuL07yKQ31MlNtuQuwQSXCfFhxV1LOK26Co7DfE4sMkyvEeFMPaVhusUIBKDMF6h+
	 vThcQ9vXjFjc9Kdk+dvB14Rcj9zVySfVC6HzedRTW5oI8kgtab4or+kzVOwiicPbDS4hs
	 Gk1PfxU4BGqmk+hjHwPLo4NcSU4XRUmAoC5hvoo1S6BpADfejVjN029hXxWtkEPYsQDEb
	 BBdm5raQYB/HFA/TCz5zxbzc7GG8oRA8wSddsbmPGNzvp5eVle25OT36IejQgMcwyYcY9
	 gjGGcGkdPv3j4e6UP+2Ga4Wi9olltVDMUkzIWYy9zXJYNAggc9wPfpYCo7/tfTzP6pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gfA6LW8A;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7108606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gfA6LW8A
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 912281F000C4;
	Tue, 17 Nov 2026 20:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794946793;
	bh=A7sFWg3FdFGJFzC56OEY89EwyXtt7N1MPCo8Ll2755w=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=gfA6LW8ASFiNVALMVQVEfRT/W8e2RM6NsiWn7+Rr3ewoG9128spZuYIdbmfSpytoA
	 NGVQyGmbsd4HvFS1iEL6QiSY0G/VKYwcV4wCClrVY6Q+InkrBwPy+jvTZUFVpZQ2Gv
	 tu2t6qg4+pdh0XFrXIectqtj8IlphAENjlhczxWt2nD/kSB3VjSnPcYhE6JqyEMGxF
	 0HXtGkErBSOwjvrOTDvdyeQERZt6xyD2065Kkh40Fw2SUnHBzN+GpEvJ1KtZOftitE
	 pPc+rMM4kiVzE/0QadvjYTHbobULEq5y12FBpd2fqHENIkagp41jy44uRjMCSFeN/c
	 LBuTpQ3xGVnZw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 4FD6ACE097E; Tue, 17 Nov 2026 12:19:53 -0800 (PST)
Date: Tue, 17 Nov 2026 12:19:53 -0800
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
Message-ID: <e38e1ad4-5af7-48b4-9b38-d91a6d6f70c6@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <cover.1794869902.git.bvanassche@acm.org>
 <8114def6bdc259f670f3d84f3ae0dad6809cd6c6.1794869902.git.bvanassche@acm.org>
 <723856b0-e1c9-41c7-a6d3-32a45ef1f88a@paulmck-laptop>
 <c935da68-bd05-46b1-b837-e62cda95c0ea@acm.org>
 <2d072123-0315-4432-9f5d-74d6071adb8e@paulmck-laptop>
 <d345bdcd-d3ef-42b6-b2d0-a75f1830f1c5@acm.org>
 <6f9e7e5c-eeba-4a8b-b944-b45bbe591cdb@paulmck-laptop>
 <a02a6dde-5baf-4223-a583-5270f39b00d2@acm.org>
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
In-Reply-To: <a02a6dde-5baf-4223-a583-5270f39b00d2@acm.org>

On Tue, Nov 17, 2026 at 12:03:52PM -0800, Bart Van Assche wrote:
> On 11/17/26 10:44 AM, Paul E. McKenney wrote:
> > Right you are!  Maybe __is_constexpr() would be better?
> 
> Hi Paul,
> 
> Yes, it is. __is_constexpr() is a sizeof() trick, so its result is
> always an integer constant expression that the compiler front end
> computes. That's the result the Clang context analysis needs.
> Unlike __builtin_constant_p(), nothing is left for the optimizer to
> decide. This removes the limitation I described: if 'c' is a plain
> variable, function argument or structure member, the check is now
> skipped, as it should be.
> 
> include/linux/compiler.h already has a helper built on top of it:
> 
> 	#define const_true(x) \
> 		__builtin_choose_expr(__is_constexpr(x), x, false)
> 
> so I plan to write this as follows:
> 
> 	if (const_true(!(c)))
> 		__srcu_read_lock_must_hold(ssp);
> 
> Writing '__is_constexpr(c) && !(c)' instead gives the same results.
> 
> Results with clang -Wthread-safety, at -O0 and -O2:
> 
> 	c == 0 or false                    -> checked
> 	c == 1                             -> not checked
> 	c == lockdep_is_held(&m)           -> not checked
> 	c == ({ (void)(&m); 1; })          -> not checked
> 	     (lockdep_is_held() with CONFIG_LOCKDEP=n)
> 	c == v, foo->flag, function arg    -> not checked (with
> 	                                      __builtin_constant_p()
> 	                                      these were false positives)
> 	c == lockdep_is_held(&m) || !v     -> not checked
> 
> GCC builds it without warnings. GCC doesn't run the context
> analysis, and __srcu_read_lock_must_hold() is an empty inline
> function, so the generated code doesn't change.
> 
> I will make this change in v4, together with the other changes I
> listed earlier.

Sounds good, and thank you for bearing with me!

							Thanx, Paul
