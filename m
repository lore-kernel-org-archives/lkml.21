Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795625091;
	b=MRpacQrgo6zHRPI0Jae0xeSy52iceMJrnIyl5bQuli0h8xHGo1s6c9g33tcmxRJKBtMJ
	 0q6TGAswHU6ukf90jcpjTy+DbkEf/LnP/A9x+tEH86llS5W5vqx48kSOH8sD9QHoHgUHG
	 ACmK31pd1HtgK38OBXxXlDNzdj9jCPhbwzhq3Gux6LrdhhOAxoymIkEDpp2p/RuBt3yfx
	 QWFL99PfBjzsSTnUrdOk6wed4zumRzzmDgKAPgjUJF/TV0lKh1dD88ZuENbG9gei1uV3K
	 RW36rVWgHPNXj1VfJAz5g57ZvuSXQsinvbDKALycTj76xPmZFuNU8Cuvf8g5Ftz0GWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625091;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=hgaCMNN78mPYYw766LPZBZkkCJJpMS5EJyVD2RyIiJ8=;
	b=rtf3tmRpN5Mm/t6hIMLMAZH3STtlhmBclUNkkgEsdKxGviLeQmJpdnAeLsmv5ri5Nm7d
	 7Pis7pUsyLSgC6XBzKgc2GASvF57fMoyU2QmukG464ly02jmWo+spPoanz8lnZnalrGxl
	 oabrMaeRAJSjHHeXlp9lMnhuptXoO/8o5OhBhhq+O6fAFFJFaGhn/kySusw4qMWza15R4
	 KcGPmi6NZ8wyfLA71lCE0A3TITA92Jw1yODaTnyBzl+3pMRp4XT/VYdb2FoMmyJlBnHk4
	 L9AYzrbYS/cAM12P1zEJ0bj603npdg8K+2/YptCOVL6Gpdk1cVngreJj/r5dxDuiBHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=o5XPK8RS;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF6F606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:44:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFF6F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=o5XPK8RS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hgaCMNN78mPYYw766LPZBZkkCJJpMS5EJyVD2RyIiJ8=; b=o5XPK8RSmJ8mhuQnJch/pooj0P
	TtJ8IUHFyXgZhm6yIuIcP0VfmnHgDh/8/Lu1FO482ZbIB1sA1AwIJfw7CPd0YYicBcnmirMot3ZEw
	i6DWihs30TYZmHsiFd5iIZ4CHoaDpT7rWPxI//x5ada0Iq3VJs8QcuZ+kuFG425D0/0tPQha8uAIH
	9VfFGPJ7gIHbGf5+bmJdQ7gcY0qgx4ehNZadPNe0vESL0Gg+CEgsRlF9SsuFUyVoirBBNhFbJMQdY
	I1CirdrHbBgOtvyzXLCYKLvVQMzWn37njxOPj9nYNVHQlJX+dlv4eQnOKurBaXab9vbZQUAgIK8rI
	QPfuJvYA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWG6u-00000000pzN-0dvG;
	Wed, 25 Nov 2026 16:44:44 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4ABDF3008BF; Wed, 25 Nov 2026 17:44:43 +0100 (CET)
Date: Wed, 25 Nov 2026 17:44:43 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: linux-kernel@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Kevin Tian <kevin.tian@intel.com>, Dmitry Ilvokhin <d@ilvokhin.com>,
	Christian Brauner <brauner@kernel.org>,
	Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH] cleanup: clarify scope-based resource management and
 goto guidance
Message-ID: <20261125164443.GH2668804@noisy.programming.kicks-ass.net>
References: <20261125161205.65809-1-przemyslaw.kitszel@intel.com>
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
In-Reply-To: <20261125161205.65809-1-przemyslaw.kitszel@intel.com>

On Wed, Nov 25, 2026 at 05:12:03PM +0100, Przemek Kitszel wrote:
> Scope-based resource management helps manage resource lifetimes, but it
> does not solve rollback of a failed operation. Such rollback is often
> best handled with multiple goto-based unwind paths.

Not sure I agree; you can fully convert to cleanup. Sometimes a little
tedious but often less horrible than you might imagine.

> The current guidance can be read as discouraging any cleanup helper
> alongside goto, including guards. Automated reviewers repeatedly flag
> code that mixes the two, so clarify that the recommendation applies only
> to __free().
> 
> Signed-off-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
> ---
> I develop mostly in the subsystem that bans __free(), which is also
> most low-level of all the helpers - so I get that we could discourage
> mixing __free() and goto. But for the rest it is counter productive.
> ---
>  include/linux/cleanup.h | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/cleanup.h b/include/linux/cleanup.h
> index 1e09aead4b08..3b852198e969 100644
> --- a/include/linux/cleanup.h
> +++ b/include/linux/cleanup.h
> @@ -145,12 +145,10 @@
>   * statement and not group variable definitions at the top of the
>   * function when __free() is used.
>   *
> - * Lastly, given that the benefit of cleanup helpers is removal of
> - * "goto", and that the "goto" statement can jump between scopes, the
> - * expectation is that usage of "goto" and cleanup helpers is never
> - * mixed in the same function. I.e. for a given routine, convert all
> - * resources that need a "goto" cleanup to scope-based cleanup, or
> - * convert none of them.
> + * Lastly, avoid mixing __free() with goto-based resource cleanup in
> + * the same function. This recommendation applies specifically to
> + * resources managed with __free(); it does not preclude using
> + * guard(), scoped_guard(), or ACQUIRE() in a function that uses goto.
>   */

This isn't entirely accurate, guard() is likewise tricky.

Consider:

void foo()
{
	...

	if (!bar())
	  goto bar_failed;

	guard(spinlock)(&my_lock);

	...

	return;

bar_failed:
	undo_pre_bar();
}

Then undo_pre_bar() is inside guard(); and that is very much not the
intention. The same will be true with ACQUIRE();

The whole thing is all about scope. It really is a point to be careful
about.

The scoped_guard() is safer, mostly because people typically will not
goto into one.

Now, clang will actually warn if you mess up; but GCC will not and will
happily mis-compile your code for you.


At all time; be very careful when mixing goto with cleanup. The general
advice to not mix is safest. That is not to say it can't be done when
you actually know what you're on about. But clearly the AI bots are
clueless.
