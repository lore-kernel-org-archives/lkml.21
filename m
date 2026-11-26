Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719860;
	b=yFLOdA7Wx1Ev2IIRr/SlF2Zk72sWKIp/WjWORMWSybu0VdtzKNGYzug8gyg7osk47787
	 hBnojqeT7MapFWEcso8XxcwbIw+KKBS4vkCPQCdlwSyTgadNduWHMbiPrZAySk+AjuWA8
	 hdDOX2XyZKt+6VWhR3ozGOG3+QGQK/ei8KDEgi0oay9uWjyoW/temHKbBVvLv+2xCFqY1
	 1p6tmv+QfY/HKYVbrSIFTZbVujYW8Xupmj3wn3lwOGbxVYXgI+cWTu0Sokx8BV3QBLk5l
	 6YJ23P1cyoIAoNLZWCQDw1y1tRndDGD4pLhWFIInELK5yMJdBfkZQCFZ3iTrNzhGR9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719860;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=8S26I6ok0b8j0h9YQ9IUuW55x9LrqcCKF+IrYf7BDO4=;
	b=JCTcYRYcxF74Sc1OWhK4neRFlG4Lv19sVRzpiCjGJSZ/VImUynNQopqwOjo8gurAWVFV
	 LxmeV7Rtn5sDalMZ0JDsQ57IQUOJKW2EHj/MG5o8j0e2sjEQQrn9WEUcDI/DoR3OvHhPO
	 6UPYLSn9bguuIYZOEi8DCTRZkPxLbyY0mn16uVcfAySxVBPTHgU1qF35mPz/hB10iBvMi
	 DQBXu+k7TsmFHK6bC7Avz6ocRUFChBOBCMl/tZDvHJgacNJ8uSTfwQo3cJu/1XaLJucBp
	 E7y7+1XaAM8JsIBfERqIySizUW/jVzkEE3mfZ/fHywk02OfDoI/cTOv8MsMqUyIj4IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LyZfe9UI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33D2606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LyZfe9UI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18C5F1F000C0;
	Thu, 26 Nov 2026 19:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795719859;
	bh=8S26I6ok0b8j0h9YQ9IUuW55x9LrqcCKF+IrYf7BDO4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=LyZfe9UIsfZsjtR4FVcI9/XOT/YilWBirVEmLuQzo7NPIBZ8XUYKiLRNl93xFqLnq
	 zSH0VxCrqEegpTdUq1tb+9rHrBq5IdmhfNp8Fdnqf08N/UYw3+9UMrV5cp6kLiTEE/
	 oMFelfcH+pgvoufFKnwd9FzvE6z+rboT+5Kx5LmuHXc1249mPSxzg+WQvmzr6wZrDS
	 cPD8zRmPJQofozgSCYI9NvvgIZ6xPjL7NlDH8qxxDjc+vxew3isRm0SzH6agL4cFFC
	 9DwfvPWPFYsSt6bT+UkBrIL7ibz2TPdvhZCvEVWTPRx2gzWo+odibnTCilwMfjEWMw
	 nOhfyb8O7aO4Q==
Message-ID: <4cb6e0ea-5e6c-4ecd-b673-70b42864c694@kernel.org>
Date: Thu, 26 Nov 2026 20:04:15 +0100
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
Subject: Re: [PATCH 2/3] mm/slab: add own entry points for
 kmem_buckets_alloc() family
To: Harry Yoo <harry@kernel.org>
Cc: Chris Down <chris@chrisdown.name>, Kees Cook <kees@kernel.org>,
 Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>,
 David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Marco Elver <elver@google.com>
References: <20261124-kmalloc-entry-rework-v1-0-37b1631a67b5@kernel.org>
 <20261124-kmalloc-entry-rework-v1-2-37b1631a67b5@kernel.org>
 <awg-2hrOmY5U3vzS@thinkstation>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Content-Language: en-US
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <awg-2hrOmY5U3vzS@thinkstation>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/26/26 15:22, Harry Yoo wrote:
> On Tue, Nov 24, 2026 at 05:30:03PM +0100, Vlastimil Babka (SUSE) wrote:
>> The way buckets have been implemented was to extend
>> __kmalloc_node_noprof() and two more functions with the kmem_buckets
>> pointer parameter, which means all kmalloc_node() callers now have to
>> pass NULL. To avoid this extra parameter with CONFIG_SLAB_BUCKETS=n,
>> we added macros for parameter declaring and passing.
>> 
>> This can be avoided by creating own entry points for kmem_buckets
>> allocations and not using the kmalloc ones. They all end up performing
>> __do_kmalloc_node() internally.
>> 
>> Since it's just 3 functions with few callers, do not try to do anything
>> special to eliminate code with CONFIG_SLAB_BUCKETS=n. Only make sure the
>> bucket parameter is changed to NULL in that case because it would be
>> ZERO_SIZE_PTR otherwise.
>> 
>> The removal of the now-unnecessary parameter macros is done separately
>> next.
>> 
>> Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
>> ---
>>  include/linux/slab.h |  16 +++++++--
>>  mm/slub.c            | 100 +++++++++++++++++++++++++++++++++++++++++----------
>>  2 files changed, 94 insertions(+), 22 deletions(-)
>> 
>> diff --git a/mm/slub.c b/mm/slub.c
>> index 70df0a2e3876..6674caabbb6e 100644
>> --- a/mm/slub.c
>> +++ b/mm/slub.c
>> @@ -5732,6 +5732,34 @@ void *__kmalloc_flags_noprof(DECL_TOKEN_PARAMS(size, token), gfp_t flags,
>>  	}
>>  }
>>  
>> +void *__kmem_buckets_alloc_noprof(kmem_buckets *b, size_t size, gfp_t flags)
>> +{
>> +	const struct slab_alloc_context ac = {
>> +		.caller_addr = _RET_IP_,
>> +		.orig_size = size,
>> +		.alloc_flags = SLAB_ALLOC_DEFAULT,
>> +	};
>> +
>> +	if (!IS_ENABLED(CONFIG_SLAB_BUCKETS))
>> +		b = NULL;
>> +
>> +	return __do_kmalloc_node(b, flags, NUMA_NO_NODE, (kmalloc_token_t){}, &ac);
> 
> No type-based or random kmalloc partitioning w/o SLAB_BUCKETS?

Hm that's right, that excludes it. I didn't realize that, but also I wonder
if anyone would really choose to have partitioning enabled but buckets
disabled. It should be straigtforward to add it though. But as long as
buckets are not disabled, the token parameter will be effectively unused. Kees?
