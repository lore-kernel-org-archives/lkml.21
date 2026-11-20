Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795166931;
	b=ArbTVXdHw8bByDacKtr0qEKJiThw+NbCrIZWdGoZyq8PXPz4wc9OUdiD/viKz6BvQROs
	 D/uVQ2bJu9ttCqGAN4qRsoAj1M4xnQjG8Gk7ppn13x34vvOBK4HJOPsbEpT9Zrja18Zd9
	 QTjFa9i9pUVYlYCrmNWirIw/5d5/MZmg3K39Z9OY7nICVJNYVnQ9kofvBEwKzFbAVixR9
	 T6VeYXHL4rpwtispmdujS/vVTKOeXeZjwLA6j6XMZoAZJiOTnN9+DpKi4b5z9X7MkYyDh
	 84B2jBUbi3Xbp1X+ZNH/ZiBTPKcYn0erkdbTFVo+f5N4AfldiPVGGXq8YmNZ2JtF20A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795166931;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Ec4CEQczvF33Xv6vlVN3lwJwlaY+eCFQsn2TN99Lqis=;
	b=ZP83YWLc/l32sslyd5WE3fDzdKLLQzh7GqXfPESDlBOlgwuX6Fx2Pnz4tbax4NjP+13T
	 Lxdmsck4QLhOdxqadXAdiVkmLF+O1TdUZ33OU2PsEqju3n+FIdf9WaViRtbVr2lo81EeO
	 89jmzJwnwcvXE1EwIZ1mqpu2BxxEUZ9K08M6qnXy30pc+aidIsHrirLYPWe77vajGyD3o
	 oLKULl6+DEBaFun4ZMO9SMnYHEpSJT1lywvZDa1s9TRFy86X6QgRvCBvgMehCk5gFmNUS
	 OoGHBJGGzqotxEO//KJ1dhlOIH/DSdNBPxuTJr5c/0n+iIEfCZ+beAxX2tKCWM5m4Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cLDn1pFI;
	arc=none smtp.remote-ip=91.218.175.156
Received: from mta0.migadu.com (out-156.mta0.migadu.com [91.218.175.156])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27D9606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A27D9606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cLDn1pFI
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=dRQf0O/vFjffAS7nz3YwShJ/qNu75AAT9TWH7A9QSxM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795166927; v=1; x=1795771727;
 b=cLDn1pFIJi0+zwmnsK7rIhCK5PgxGw7Zbca9EW+hgJfAPbbbjqX8LjnqDGbx9btnUvXxyej1
 fUPmWPa/zZw3ong6/Q3w2eGs+keCAmKfY7HEPCrZ7Bf8VTfLGVYX+BSq6Ox8raZhcGjQmA1SBMB
 8O5FbWOuBJvIiPPA87kM1xZA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8d69dd6efdba7bba;
	Fri, 20 Nov 2026 09:28:47 +0000
X-Mizu-Trace-ID: 8d69dd6efdba7bba
X-Migadu-Flow: FLOW_OUT
Message-ID: <01e8710d-0eb3-4c82-ae52-682458a279e6@linux.dev>
Date: Fri, 20 Nov 2026 17:28:43 +0800
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
Subject: Re: [PATCH] eventpoll: check the event mask before taking ep->lock
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org
References: <20261106044624.278356-1-jiayuan.chen@linux.dev>
 <20261120-dazukommen-ruhen-fahnden-32e0d2201db9@brauner>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <20261120-dazukommen-ruhen-fahnden-32e0d2201db9@brauner>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/20/26 4:53 PM, Christian Brauner wrote:
> On Fri, Nov 06, 2026 at 12:46:23PM +0800, Jiayuan Chen wrote:
>> Check the mask first and return early if the event is not wanted. The
>> comment in ep_modify() counts on ep_poll_callback() taking ep->lock, so
>> do smp_mb() and read the mask again before dropping the event. Wanted
>> events take the lock as before.
> 
> Then this should update the comment too:
> 

Thanks Christian. You are right.

> diff --git a/fs/eventpoll.c b/fs/eventpoll.c
> index 133a764..8a564d1 100644
> --- a/fs/eventpoll.c
> +++ b/fs/eventpoll.c
> @@ -2029,9 +2029,8 @@ static int ep_modify(struct eventpoll *ep, struct epitem *epi,
>  	 * 1) Flush epi changes above to other CPUs.  This ensures
>  	 *    we do not miss events from ep_poll_callback if an
>  	 *    event occurs immediately after we call f_op->poll().
> -	 *    We need this because we did not take ep->lock while
> -	 *    changing epi above (but ep_poll_callback does take
> -	 *    ep->lock).
> +	 *    Pairs with the smp_mb() in ep_poll_callback() before it
> +	 *    drops an event that isn't in epi->event.events.
>  	 *
>  	 * 2) We also need to ensure we do not miss _past_ events
>  	 *    when calling f_op->poll().  This barrier also
> 
>> +		if (!(pollflags & events))
>> +			return !(events & EPOLLEXCLUSIVE);
>> +	}
>> +
>>  	spin_lock_irqsave(&ep->lock, flags);
>>  
>>  	ep_set_busy_poll_napi_id(epi);
> 
> This also skips ep_set_busy_poll_napi_id() for unwanted events now.
> So with busy polling an EPOLLOUT wakeup from sock_wfree() for a socket
> that only asked for EPOLLIN won't update ep->napi_id anymore, e.g.,
> after ep_busy_loop() reset it on timeout.
> 
> Is that intended?
> 


I missed that. I have no data showing that skipping it is fine, We should keep
old behaviour and calls ep_set_busy_poll_napi_id() before the early return.

It then runs without ep->lock, so the read and the write of ep->napi_id
in it become READ_ONCE()/WRITE_ONCE(). The other readers already use
READ_ONCE() outside the lock.
