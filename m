Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606634;
	b=VzQbx66847dTgn3/9t3uUbJIWg8lP6aIDgUcrxaoI6Y3iVQyArYWJrlQlG5tDgwM1mN0
	 Pb1NSaL22is2838sUVL251NlgkvIEFrmEGkykP1sNsCmWhdcAoU5cDqMHoBogGBxKvNu6
	 rnW5VkRscL+L1sitGlVehpIgolk4OeGQ1oyGieyG6rvpsXyjJC8I9Rw5s4MK3irCSqn76
	 PtmV64RmRuBEu7iFPUIdxuJyBDs5oi73hkVzTYusbwOqV8Ai/J69WgGN3qENCq4381TpT
	 dVo3Mf4Mj+46/0d1fF4MuIYN4hL1IwII9GFNJhwnh6u4JdW43wgBKGWLTUdYZd6D2DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606634;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=8wBVHYYIzQigIlGlhL1E2SXD/0Foprhlk3jXCBGc+m8=;
	b=AdE5mNsup5hKiA1kslgkwCPt6NExMHxyv/tAAbiV+wHu3l7EoX7gzH5bsxEmOyV8CtdM
	 tOHWex3y6C2/Lh4DDmsw015c7ujBn1nkulIUuPm4tIxNkTsA1NQoaS1cYZ9zrmNofL6oE
	 VARQsjL4t4IQ6lzh83Q0axJPHC0Lc66X27wY7cL9UmIff3MKtwaZjhZ1GAshX1UsduInn
	 sLqUrGa4OMyzL1Gdwz8SDlMUTlYul5kFyIITcMhzwPYDXY5eLdknf6JQ0SU6NyqJeZAVG
	 HmghRFTYzRIUNRJ/926EBcfZycH2wgjfE4bQMCmmCmpnYeEueF6mUxKvlwR5FUBT1vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="mosuS/Sa";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=IIWOiZyK;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1AD606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:37:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB1AD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=mosuS/Sa;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=IIWOiZyK
Date: Wed, 25 Nov 2026 12:37:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795606632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8wBVHYYIzQigIlGlhL1E2SXD/0Foprhlk3jXCBGc+m8=;
	b=mosuS/Sa03uu1p81hdm9daMU/PDF5wTebZtdy20GzNq+dQs7zU+fhXhPEgTtO49vSbrkiR
	F9OEQgUmttIicOFWl4TAIf4fE1TSLxFSidGP6ZH+JkQwARXzQwGQjGNRSSwFqRyVPBssZG
	4vqcI9rSlOXwZjIyJb/hfHn2X+zZfduVKzVrMoAkoXWqtyNeqfM89ZmV93F+y7FPGPrmh5
	ao0DHWYr5+Pn3g0Gn+WHb4FyqO84qn/zL9S5szQ98QKr56F2uZUV2eNvmLOuaWmMoMl8nf
	wbTSoszajn4bu3INy3TUU2NMUHLqRMr3GFqlw188OYFYq4FCWO3A0xLOYZZuNQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795606632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8wBVHYYIzQigIlGlhL1E2SXD/0Foprhlk3jXCBGc+m8=;
	b=IIWOiZyKXQlj4MUc4m9j0OcIvLx6Bi1XM+/DGMN88DCNc6MBcMgKqMoPgvt2TdwF5Te/2M
	TPmm/ck41zKpkhCA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Jiebin Sun <jiebin.sun@intel.com>
Cc: akpm@linux-foundation.org, dennis@kernel.org, tj@kernel.org,
	cl@gentwo.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	clrkwllms@kernel.org, rostedt@goodmis.org,
	linux-rt-devel@lists.linux.dev, tim.c.chen@linux.intel.com,
	tianyou.li@intel.com, wangyang.guo@intel.com
Subject: Re: [PATCH v2] lib/percpu_counter: allow concurrent sums with an
 rwlock
Message-ID: <20261125113710.Web5Cy2z@linutronix.de>
References: <20261124051952.1059282-1-jiebin.sun@intel.com>
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
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261124051952.1059282-1-jiebin.sun@intel.com>

On 2026-11-24 13:19:52 [+0800], Jiebin Sun wrote:
> __percpu_counter_sum() holds a raw spinlock while reading the global
> count and per-CPU deltas, serializing concurrent sums of the same
> counter. Since a sum changes neither the global count nor the per-CPU
> deltas, use rwlock_t on !PREEMPT_RT to allow concurrent sums with a
> read lock. Global updates take the write lock. The per-CPU fast path
> remains lockless, so sums keep their existing snapshot semantics.
>=20
> stress-ng dentry reaches this path through ext4_statfs():
>=20
>   statfs -> ext4_statfs -> __percpu_counter_sum
>          -> native_queued_spin_lock_slowpath

Not sure if `df' is considered high performance.

=E2=80=A6
> Suggested-by: Tim Chen <tim.c.chen@linux.intel.com>
> Reviewed-by: Tianyou Li <tianyou.li@intel.com>
> Reviewed-by: Wangyang Guo <wangyang.guo@intel.com>
> Signed-off-by: Jiebin Sun <jiebin.sun@intel.com>

This is fine from PREEMPT_RT/ lockdep point of view. So
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Whether is okay from actual RW-lock vs spinlock point of view is a
different story.

Sebastian
