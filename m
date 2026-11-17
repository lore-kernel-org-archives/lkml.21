Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938008;
	b=PE2r2VwDtGXfqDTGtvzTvYLJiwOfNIeweBgh1ZS0dKDdTYQgi0Lp3g2D0yYpn+CE03yN
	 rKq+3q2MeMF18OPoH11/KatN5pXUtdiTZ5k5pQIE9R7qmhVxmkMUisMflo35lkF+mYNeK
	 iMKPMfeZMMqWoRenYgHQgGwgT95pD39UzXHXM2FPiH9wmqmZEKoGyvCHPsJQSvFQPHc+U
	 WlISJ2F3GSyegEPWzzLA5DlAiZ80rebt7447Gvh8RklqYIqgl8yTnknrSIIIs4N7JD+VT
	 fgHwp9lfiAYLgyqRlxIiW23uGgUhWRFDa7wpczOt7TF8IOXnzeYObwaPXpZm+/50W8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938008;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 Reply-To:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=l22R1mIGyv+003QAnS3t/UDn7IP5iYTloHlOB3lDFJw=;
	b=E6qYYL763JsMpB6PB4CqOmmih0KbhVijU//yvPpeUKYBn0S9in/8KUAb4CUcRgkAPOCd
	 g/H+rkWktaVrI5OZ/yB3g5JJo6ytO6zcFHbyjV6VyKV7rLvUkK9u0Tk9Pd6LUxbY5fI+z
	 6f+cP8ioHAeFnhD5NQePDjZ796TtLGQ+2lFTTm1DHZh/OEjuksc0YdiG/LHSquWQ0Y3bf
	 YB5Nd1u9Toj7wCHWK/zWeg/eDle2ZxA8G+4pCwY0y+y8e4qjFJBZv7cFrpJqRNFORuuXC
	 Ghvwnw2tuF0iBC7Y34dKTbumYp30dyT4QCdl4d1W0JCixNuz3/hQ3XJtHLQsd9uPq8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NC70Xjm0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4B7606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NC70Xjm0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3D2F1F000C5;
	Tue, 17 Nov 2026 17:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794938008;
	bh=l22R1mIGyv+003QAnS3t/UDn7IP5iYTloHlOB3lDFJw=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=NC70Xjm0y6aIDKSM/EKlSEtXv2riXEaJeitFOnG/92BwVzCS92agtAHvAd0dD937p
	 eps4MX4gxYXGzM74rGczZqinRRKejFMBRdJeZ7DLb9C8Xkldq1xou1SkcdlWcgDhKW
	 U0eyUG+qSo/tWomUfPd8u0Mbk/l69ynXiW6/O7n4rRoKuYynpyb7jMQd1e0rbFWqEa
	 p/7J+v6dXpJ4IRJTVpDWu9OQvbZ7IspS7xOMrR8vBktZ0TToFL69DAQivqbd7g8fT0
	 LE3lAW+hr6ZAkScaUTX3CxGyUH+nVD6kzuEqZrPp+MNZYo5TrjvUy9GQ7qyfoNtJ/V
	 YC4TbKV7J4wlg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 637A2CE089A; Tue, 17 Nov 2026 09:53:28 -0800 (PST)
Date: Tue, 17 Nov 2026 09:53:28 -0800
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
Message-ID: <2d072123-0315-4432-9f5d-74d6071adb8e@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <cover.1794869902.git.bvanassche@acm.org>
 <8114def6bdc259f670f3d84f3ae0dad6809cd6c6.1794869902.git.bvanassche@acm.org>
 <723856b0-e1c9-41c7-a6d3-32a45ef1f88a@paulmck-laptop>
 <c935da68-bd05-46b1-b837-e62cda95c0ea@acm.org>
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
In-Reply-To: <c935da68-bd05-46b1-b837-e62cda95c0ea@acm.org>

On Tue, Nov 17, 2026 at 08:53:52AM -0800, Bart Van Assche wrote:
> On 11/16/26 4:51 PM, Paul E. McKenney wrote:
> > Should we invoke __srcu_read_lock_must_hold() conditionally, only if the
> > value of c is zero?
> 
> Hi Paul,
> 
> Thanks for the review. I don't think that would help. The Clang
> context analysis is a compile-time analysis. It does not know the
> runtime value of 'c', so a conditional call to
> __srcu_read_lock_must_hold() only behaves differently from an
> unconditional call if the compiler can evaluate 'c' at compile time:
> 
> - If 'c' is the constant 0, Clang removes the always-false edge and
>   the call is checked. This is what srcu_dereference() does with
>   this patch.
> 
> - If 'c' is the constant 1, the call is never checked. This is what
>   srcu_dereference_notrace() would get. srcu_dereference_notrace()
>   calls __srcu_read_lock_must_hold() directly, so it keeps the
>   check.
> 
> - If 'c' is a real lockdep expression, e.g.
>   lockdep_is_held(&foo->mutex), Clang can't evaluate it. The call
>   stays reachable and is checked. That brings back the false
>   positive for update-side callers that this patch fixes. With
>   CONFIG_LOCKDEP=n, lockdep_is_held() becomes
>   ({ (void)(lock); 1; }), so the result would also depend on the
>   kernel config.
> 
> I checked this with a small test program built with clang
> -Wthread-safety:
> 
> 	#define deref_check(c) ({ if (!(c)) must_hold(&s); 0; })
> 
> 	deref_check(0);                 /* warns, as expected       */
> 	deref_check(1);                 /* no warning               */
> 	deref_check(is_held(&m));       /* warns: false positive    */
> 	deref_check(({ (void)&m; 1; })) /* no warning (lockdep off) */
> 
> A conditional call would also evaluate 'c' outside the lockdep
> checks, so it would run even when lockdep is disabled. Today 'c' is
> only evaluated inside __rcu_dereference_check() when
> CONFIG_PROVE_RCU=y.
> 
> So the only case where the conditional call helps is a constant 0,
> and srcu_dereference() already covers that. Callers that pass a
> literal 0 directly to srcu_dereference_check() can switch to
> srcu_dereference(). The runtime check is unchanged: lockdep still
> checks '(c) || srcu_read_lock_held(ssp)'.

Would __builtin_constant_p() help here?

If we don't have a build-time constant, don't check.

If we do have a build-time constant, check only if that constant has
the value zero, that is, there is no update-side protection.

Or am I still confused about what this is trying to do?

							Thanx, Paul
