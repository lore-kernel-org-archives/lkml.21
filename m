Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706557;
	b=KLwtOIp/oFcnIAyhAPpYf7sVX+tAYN7/nH6/2ZWmDz8vT2IIumBZGgpsdXdhZom20jwy
	 f2KqjXEhOAG8PrKjRXjSXDcWC3EKg7f0EhfrbPSdfhHEBfqJDmGmPNBvfk+eS7XQ3wCns
	 zu6aTkakZ2ncCviSAgKriKU51Z6EJjwxv5ubk6ytSPCt63cPHEudlzbcisqdpOiCvvLkw
	 GJ2xfF06tX4wSnOSLE6168tF8ouHwct8Jcbu1hDXoFyA0zIWt5IEUAzabt+YGGJVSqx+g
	 VQ68vN7cITtvKdsy/tM9KJuoAOO47BpJ6GGeT9LF9rMvib04Njb9JI0fc3wHg/Yn2yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706557;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ZvT7tk3P1HeqkH7Q6Z2/RmsaVAZjfaSe3LTozOquko0=;
	b=XjlC8tJXZsV9dIMdBZwBoePoaidRuFYxS1y0aKgEPDJ8BpQDzUFMS7Qr3aKLdfj8JWaI
	 dW8/zoLWNT0C1aV3x+AbXiHvf7/YL72tFflD64bBCuQJkBjNCZ7b2CmZebUZ/IWW2SS9k
	 HNadJxd7b/xHVyfbJo6SuuKac7mDHIL6LKuISVylXkUvd/RKHhsLIZTRdDP9xedVZF1oE
	 r04x8IekcYfLx0jiNODdqCsSwoVa7mzRNKCqIltcEyeXqyM2GMu5JDL5ZvwZ7UQB9yGE1
	 bmTdByBz/FFUzcqLsKMkPqzz5pDgPqxYOMgRbQTXJURHMMjS0NM9h8RZ5MuebbRcsYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ks17Enb5;
	arc=none smtp.remote-ip=95.215.58.97
Received: from mta1.migadu.com (out-97.mta1.migadu.com [95.215.58.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC03606A327
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DC03606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ks17Enb5
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=XxWyPvAJ0IroYsLOy5V5ybJak6wZ0/ht/VqjPuOuhjc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795706554; v=1; x=1796311354;
 b=Ks17Enb5Bv5JBp2cuKuvKzhoShVMZG4mRbSJwl7OZUw3wz/j843U/gHujp3PmAtYu5LSdZi0
 s0bhcvYbkh0XYprknwYneLk9cjUKIWo2y2SAW3gL9AnfJe10PfxWWYIdfm9z+nUut/o1Amh33/a
 sqlnI4/DUwy6GFey0+Qrx30M=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c2ce6ddd70b19568;
	Thu, 26 Nov 2026 15:22:34 +0000
X-Mizu-Trace-ID: c2ce6ddd70b19568
X-Migadu-Flow: FLOW_OUT
Date: Thu, 26 Nov 2026 07:22:26 -0800
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Tejun Heo <tj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	David Hildenbrand <david@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, Greg Thelen <gthelen@google.com>, 
	Greg KH <greg@kroah.com>, Ming Lei <tom.leiming@gmail.com>, linux-mm@kvack.org, 
	cgroups@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] mm/vmscan: Fix legacy memcg reclaim deadlock
 against filesystem freeze
Message-ID: <20261126152137.GA738059@shakeel.butt@linux.dev>
References: <17d0d1395c0237d201a1abb2473d51f5@kernel.org>
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
In-Reply-To: <17d0d1395c0237d201a1abb2473d51f5@kernel.org>

On Thu, Nov 26, 2026 at 02:08:56AM -1000, Tejun Heo wrote:
> Legacy memcg reclaim has no dirty throttling, and shrink_folio_list() waits
> for a folio that is under writeback and already marked for reclaim (case 3
> in its comment). That wait can deadlock against a filesystem freeze:
> 
> 1. A task in write() to filesystem B holds freeze protection on B, enters
>    memcg reclaim and waits for writeback of a folio of a filesystem on a
>    loop device backed by a file on B.
> 
> 2. A freeze of B waits for the task to drop its freeze protection.
> 
> 3. The loop worker has to take freeze protection on B to write the folio out
>    and blocks behind the freeze.
> 
> The same applies to any driver that writes to a file on a local filesystem
> to serve block I/O and takes freeze protection for it.
> 
> Reclaim can't tell which filesystem a writeback depends on. Count the
> superblocks that are being frozen and make the wait time out after 15
> seconds. If one is being frozen at that point, warn and give up. Until none
> is, treat such folios like case 2 and skip the legacy writeback throttle, so
> that the task a freeze may be waiting for isn't held up.
> 
> This trades the deadlock for premature memcg OOM kills during such a freeze.
> The wait also no longer hits the folio_wait_writeback tracepoint, and the
> hung task detector no longer reports a task stuck in it for another reason
> as the task wakes up every 15 seconds.
> 
> Fixes: e62e384e9da8 ("memcg: prevent OOM with too many dirty pages")
> Reported-by: Christian Brauner <brauner@kernel.org>
> Signed-off-by: Tejun Heo <tj@kernel.org>
> Reviewed-by: Johannes Weiner <hannes@cmpxchg.org>
> Reviewed-by: Christian Brauner (Amutable) <brauner@kernel.org>

Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
