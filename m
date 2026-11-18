Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794960030;
	b=GzJzNSFmdd1XQtpu88KeuF1rF0RNRAL/or5Akz6wTDv1I4CmFnfVwDj6xtLoeqo8MM/D
	 HCmHofhzlz9BnmQQSQjad2fpD2uoYEkclcai9okHkpTy3jsGZybGRifFJZMOoJnRUtGZ5
	 lbJEhIKbi3pi39/a9zPW4I3KEEKc9Y/uuqzRfg1rtcu18pl071j/06HtSqXCUM41P+zaD
	 HUPjDB9zkHR9schNruaIKzj1ZDv3IwPxKIkMsmSnHFMDpmc/tkxXyU4n9wwPqXXBBGzMb
	 SMhUw1WNv0Z8hdh2shsjN3dXy39ztwh/vGcJahxLuYgvw6f1SqfW4xAweC8Rk1Eg22w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794960030;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=bclIWZ6FX0mX08OYKuqV5M5iFQvVjJ51ZeOco2b+exc=;
	b=hOI5elPimjhJ9TePmQcE8eDl/erlehVx0H0BkKxIDjX5+lG+o0mXFtErT7Ylgw6zb0WA
	 Hxs7JRQrfxrACTTQVTwdeUIqzUmOu5jHhnjIs+2RnDtCxrUiNE8j/mZ4pmfCVJULHZn0x
	 LnRtw3i96qxbnecoGydbi1eZk3eyCFk5ksjUxWF8lVxy3z6x8HKCj6zK/ct4yXy8P3rDH
	 0qX0/ZqHpAB1qIvig5f6f2wRQgQbUycfcOCMQN/d6wTq2JdJIv3c+BN4Ea9FeGjYMPANk
	 NkWki36cOyeUxjxzTM6Pwo7qi4G4fQBFRZmVDBi9APD0M76r6NP/m1W5tcQmMVrFTyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=O0y8IEfs;
	arc=none smtp.remote-ip=95.215.58.182
Received: from mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A0C606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:00:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1A0C606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=O0y8IEfs
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=LfZWu2kDl00YJ8hzTGAr/QsVPZ0HXBKeCp53dE5Im/c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794960026; v=1; x=1795564826;
 b=O0y8IEfsOoJRQCQ7xQIuUqvj9rU7PKozSy/jaDvl9s3OiFU//Nl+JprWKvUyAaPcRPGMCV+2
 qLOhKKLvj4OIJ3qNqrVbvvTT8IkqEd1cRig9QI8gc6JPJLtXfrKzXBzjWVXbP9cWiVA62doebro
 WhTw9Y4FcjcPVBCDW0zrgTNM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f54fc8da450d0984;
	Wed, 18 Nov 2026 00:00:25 +0000
X-Mizu-Trace-ID: f54fc8da450d0984
X-Migadu-Flow: FLOW_OUT
Message-ID: <8130b695-c281-46e9-bfdd-e4873046c36d@linux.dev>
Date: Tue, 17 Nov 2026 16:00:21 -0800
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
Subject: Re: [PATCH v4 1/2] tracing: fgraph: allocate shadow stacks inline
 with GFP_NOWAIT
To: Steven Rostedt <rostedt@goodmis.org>
Cc: mhiramat@kernel.org, mark.rutland@arm.com,
 mathieu.desnoyers@efficios.com, andrii@kernel.org, peterz@infradead.org,
 linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, kernel-team@meta.com, stable@vger.kernel.org
References: <20261021174406.2891598-1-vineet.gupta@linux.dev>
 <20261021174406.2891598-2-vineet.gupta@linux.dev>
 <20261117185645.628de864@gandalf.local.home>
From: Vineet Gupta <vineet.gupta@linux.dev>
Content-Language: en-US
In-Reply-To: <20261117185645.628de864@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/26 3:56 PM, Steven Rostedt wrote:
> On Wed, 21 Oct 2026 10:44:05 -0700
> Vineet Gupta <vineet.gupta@linux.dev> wrote:
>
>> smp_store_release() is a drop-in replacement for the smp_wmb() and
>> plain store it replaces.
> This should be added with that, but I can just add it as a separate patch.

Thx for that. Let me know if you need me to do anything.

-Vineet

>
> -- Steve
>
> diff --git a/kernel/trace/fgraph.c b/kernel/trace/fgraph.c
> index bbf6e4e2da2d..d32160a6b835 100644
> --- a/kernel/trace/fgraph.c
> +++ b/kernel/trace/fgraph.c
> @@ -568,7 +568,11 @@ ftrace_push_return_trace(unsigned long ret, unsigned long func,
>   	if (unlikely(ftrace_graph_is_dead()))
>   		return -EBUSY;
>   
> -	if (!current->ret_stack)
> +	/*
> +	 * We must make sure the ret_stack is tested before we read
> +	 * anything else (See alloc_retstack_tasklist()).
> +	 */
> +	if (!smp_load_acquire(&current->ret_stack))
>   		return -EBUSY;
>   
>   	BUILD_BUG_ON(SHADOW_STACK_SIZE % sizeof(long));
> @@ -576,12 +580,6 @@ ftrace_push_return_trace(unsigned long ret, unsigned long func,
>   	/* Set val to "reserved" with the delta to the new fgraph frame */
>   	val = (FGRAPH_TYPE_RESERVED << FGRAPH_TYPE_SHIFT) | FGRAPH_FRAME_OFFSET;
>   
> -	/*
> -	 * We must make sure the ret_stack is tested before we read
> -	 * anything else.
> -	 */
> -	smp_rmb();
> -
>   	/*
>   	 * Check if there's room on the shadow stack to fit a fraph frame
>   	 * and a bitmap word.

