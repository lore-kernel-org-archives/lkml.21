Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795045641;
	b=TdEZGId4j/3/p28eUpg2cMUa4e/te4rQe2TzPOre0VSJol87NbJsDSTuwjdlGwI33GU/
	 10D5loeKitKZtRXMb3xcX7jx/BW7q5+Hx5OZgia2WCzKFArPYfGoFe+nrjjYODNi4T7NN
	 Hn0sJuwdtw9RtleAlXEgrp7cBDbOdak2Ojx89tsxpzdSc6gS4oJBZrAW5bkD7XRDRPr2v
	 PUdyPtPf+UarKJUp4ym8JVrUX5Bl2/DzyLbqS6i/8rdiqySoEsvctD7/LwNfCCL+ruxd3
	 Kq6/7JJN9rJveNbv1mwFNsg1ZR5Nj+gWymkz58LPiebGK8W5RtLsyvzS08OAT8Y5+eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795045641;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 Reply-To:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=FVMcDRaO7fblAIU8o4iF1UGzjyEvt9K+D485dwLppvk=;
	b=iwoDk1qI3CeupAulcFmrwkt0nEdUpiNPCQSEuYKrhLXFihe5nh7gLytCZUKoNznGcBic
	 0amipW1OGuBhQIsRGgnf8zY1bXiRIf0sEfctu52WOVO+XNn4/U3aMwYSsC4mBH24e4zEn
	 k4ycNnkUAjI0l2vOjK69KSwnBaHEJF7xu+yxqRJZMagdWOaH5WpXJqw1qyX0CaaIRHk5d
	 O8PUmqSNnhuWKuG6/MpMaDc2uOIK7/6+zMUhvGg84P8VWR0sw7ppklfNp40LWH5c4nG1b
	 rTMbtHGLw/bfmG5hH9U+k7s9IYemuHCG9FUI6u6X0bE9aXwyc0/2HBf9yw6cbpfjzyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="mPN/CaTs";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CF8606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mPN/CaTs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FFB31F000C4;
	Wed, 18 Nov 2026 23:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795045640;
	bh=FVMcDRaO7fblAIU8o4iF1UGzjyEvt9K+D485dwLppvk=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=mPN/CaTsvi8D0MN3Os6gIrbB4dP5fJKxPUKXvqCU5GYwDjxXvDhT1dpKfBFLm+sDG
	 wpus+FMulBSCq9nDsWTiLQOQeulJzoJ498RgGnWIfCSYKWGXn+qnSD4dDTFL+4fes2
	 vzGfUq19AxIwiTEbhP4Hqv97hjAsaxgT5EzzHF3FyR7onjwRERwrHUKEww3qNGV3Dx
	 3EEYnG5tAiffwEDLz5jj9wDna5BVUEsBq5NPmWW+QXV/OcbXwQw0UpZ/WvO71qmioq
	 AlZke4RkX84MutBIh79vT5DjfcejlyJrrVXyaDzoMo3QxnXDxFxa6LrtnjhONg+Lv0
	 /5Oxy9k4+j0yg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 5E5F5CE0FA1; Wed, 18 Nov 2026 15:47:20 -0800 (PST)
Date: Wed, 18 Nov 2026 15:47:20 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>, linux-kernel@vger.kernel.org,
	Marco Elver <elver@google.com>, Christoph Hellwig <hch@lst.de>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v4 3/3] srcu: Make the srcu_dereference_check() reader
 lock check conditional
Message-ID: <33d3685c-c5ac-4eeb-bd13-3865be4a4397@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <cover.1795043161.git.bvanassche@acm.org>
 <459250d4f2a6aa38ebab3fb51f6d4a63815bb4a1.1795043161.git.bvanassche@acm.org>
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
In-Reply-To: <459250d4f2a6aa38ebab3fb51f6d4a63815bb4a1.1795043161.git.bvanassche@acm.org>

On Wed, Nov 18, 2026 at 03:09:59PM -0800, Bart Van Assche wrote:
> Users of srcu_dereference_check() must either hold an SRCU reader lock
> or satisfy the lockdep condition 'c', e.g. by holding the update-side
> lock. However, srcu_dereference_check() calls
> __srcu_read_lock_must_hold(), which tells the Clang context analyzer
> that the SRCU reader lock must be held. That requirement is too strict
> for update-side callers. Hence, only call __srcu_read_lock_must_hold()
> from srcu_dereference_check() if 'c' is the compile-time constant 0,
> i.e. if there is no update-side protection. Keep the fake RCU acquire
> and release around __rcu_dereference_check() and also keep the runtime
> lockdep check in srcu_dereference_check().
> 
> Use const_true() instead of __builtin_constant_p() to test whether 'c'
> is the constant 0. const_true() is based on __is_constexpr(), a
> sizeof() trick that the compiler front end always evaluates, so the
> Clang context analysis sees an integer constant expression. If 'c' is
> a plain variable, function argument or structure member, Clang may
> leave __builtin_constant_p(c) for the optimizer to decide. The context
> analysis then considers the __srcu_read_lock_must_hold() call
> reachable and reports a false positive. Additionally, const_true()
> never evaluates a non-constant 'c' at runtime, so the runtime behavior
> does not change.
> 
> srcu_dereference() passes 0 as 'c' and hence gets the compile-time
> check automatically. srcu_dereference_notrace() does not accept a
> lockdep condition and hence may only be used by SRCU readers. Since it
> passes 1 as 'c', call __srcu_read_lock_must_hold() explicitly from
> srcu_dereference_notrace() such that the Clang context analysis keeps
> verifying at compile time that its callers hold the SRCU reader lock.
> 
> Cc: Marco Elver <elver@google.com>
> Suggested-by: Paul E. McKenney <paulmck@kernel.org>
> Fixes: f0b7ce22d718 ("srcu: Support Clang's context analysis")
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>

Much better, thank you!

Reviewed-by: Paul E. McKenney <paulmck@kernel.org>

> ---
>  include/linux/srcu.h | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/srcu.h b/include/linux/srcu.h
> index d4dcaeb83e2b..380b5964fcb4 100644
> --- a/include/linux/srcu.h
> +++ b/include/linux/srcu.h
> @@ -280,6 +280,10 @@ static inline int srcu_read_lock_held(const struct srcu_struct *ssp)
>   * with __guarded_by(ssp) as it would complicate annotations for writers, we
>   * choose the following strategy: srcu_dereference_check() calls this helper
>   * that checks that the passed ssp is held, and then fake-acquires 'RCU'.
> + * srcu_dereference_check() only calls this helper if @c is the compile-time
> + * constant 0 because otherwise its callers may satisfy the condition @c
> + * instead of holding ssp, e.g. on the update side. srcu_dereference_notrace()
> + * passes 1 as @c and hence calls this helper explicitly.
>   */
>  static inline void __srcu_read_lock_must_hold(const struct srcu_struct *ssp) __must_hold_shared(ssp) { }
>  
> @@ -297,7 +301,8 @@ static inline void __srcu_read_lock_must_hold(const struct srcu_struct *ssp) __m
>   */
>  #define srcu_dereference_check(p, ssp, c)					\
>  ({										\
> -	__srcu_read_lock_must_hold(ssp);					\
> +	if (const_true(!(c)))							\
> +		__srcu_read_lock_must_hold(ssp);				\
>  	__acquire_shared_ctx_lock(RCU);					\
>  	__auto_type __v = __rcu_dereference_check((p), __UNIQUE_ID(rcu),	\
>  				(c) || srcu_read_lock_held(ssp), __rcu);	\
> @@ -323,7 +328,11 @@ static inline void __srcu_read_lock_must_hold(const struct srcu_struct *ssp) __m
>   * @ssp: pointer to the srcu_struct, which is used to check that we
>   *	really are in an SRCU read-side critical section.
>   */
> -#define srcu_dereference_notrace(p, ssp) srcu_dereference_check((p), (ssp), 1)
> +#define srcu_dereference_notrace(p, ssp)				\
> +({									\
> +	__srcu_read_lock_must_hold(ssp);				\
> +	srcu_dereference_check((p), (ssp), 1);				\
> +})
>  
>  /**
>   * srcu_read_lock - register a new reader for an SRCU-protected structure.
