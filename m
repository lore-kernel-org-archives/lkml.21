Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795572265;
	b=zQ6YaA43eXVUQwIMx7qGVvoYwyPk7caYamiCoLmvoXSAyNzVIaaxZOVScWxvESVBdeks
	 sy9d9UoSOwNp4rrYExF4IdXvwcnccP9happqWf+JAPICuRvN0XFkNRHxqA8BRKnyTKheq
	 DwNhcle6ZSw+RISGVN4qyCp/LaKc0perZEqKA6Gw3CXii5o9r7TR8TER1e+vGLCwpzCIs
	 0mtlfiqZUNoeSXDnevON6x6uXqGZpiIOU5DbKGhqOsmdve33rhkfi6HhE4EzyU6Uj9c58
	 +peDGPJdyK5kN7ULvdxmSkp1z5blYvc2+7WJfdJwRyu5mNSM4/ZHEJZdcCeOFhE2kvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795572265;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=kyF1PQF9lcGtzWfkqaX6DIkCAl/BRZ3Sz/aZMWmRKEQ=;
	b=uCPtDQh3TUBwjaZPN+EyrMhXzs0re90na2y89Im9d1YAfSBs2wGc64DvKHfx8qUhDgZd
	 2UsrcI++HKgtckd+syJttVH97F3fR52j0q46fbpR4g5B5T+W5pQ/mIfM6HfgUJfZinU4W
	 ngGQJPft4hTuPiX/dl4feFoxIBmsHVixYaIrTCw73ISuEbh+9x0oBhxFcizSfxqWJwFu4
	 biy1wDR8ItF3XBN7tP0/j1J3xQ1nkkc580P81D18Dsmjn/nxxhOvd+r4FOkQ6aaWnR6c9
	 BByQdXDhuceSA01MuMbqBe+QwwpYPOox5YcOhCzZ6MIkU4nvPkXd0ktpi9PN9iOb7tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=N+C+9XYN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D9F606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=N+C+9XYN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C0BA1F000D0;
	Wed, 25 Nov 2026 02:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1795572264;
	bh=kyF1PQF9lcGtzWfkqaX6DIkCAl/BRZ3Sz/aZMWmRKEQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=N+C+9XYNDsK8OPxn7bHuTkGnIaM8u7AHB/CRuF0HFDTqWbeOGVeCnvG8wXsb47p95
	 vLU19bFc6DjP0LeR2iJuyJXIdJk/Lejrgs6XsizYAKtxSCIjeXw5hr9eFQB+hLZDzG
	 tkNG1Or8ngRIPc7i5u52qoIOizwBLB4slNSwqF2k=
Date: Tue, 24 Nov 2026 18:04:23 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Chris Wiseman <chriswiseman@google.com>
Cc: Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph
 Lameter <cl@gentwo.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Roman Gushchin <roman.gushchin@linux.dev>
Subject: Re: [PATCH] percpu: skip sidelined slot in pcpu_balance_populated()
Message-Id: <20261124180423.ca36e90d4cabaab8b2dc4721@linux-foundation.org>
In-Reply-To: <18e88cd2a725491b.3137322e32332e3235332e313736.c1dd7.0000sendgmr@google.com>
References: <18e88cd2a725491b.3137322e32332e3235332e313736.c1dd7.0000sendgmr@google.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 16 Nov 2026 14:28:07 +0000 Chris Wiseman <chriswiseman@google.com> wrote:

> Commit f183324133ea ("percpu: implement partial chunk depopulation")
> placed pcpu_sidelined_slot at __pcpu_size_to_slot(pcpu_unit_size) + 1
> and moved pcpu_free_slot to pcpu_sidelined_slot + 1 so pcpu_alloc()
> checks sidelined chunks before free chunks. pcpu_balance_populated()
> also loops from pcpu_size_to_slot(PAGE_SIZE) through pcpu_free_slot,
> but was not updated to skip pcpu_sidelined_slot.
> 
> When pcpu_nr_empty_pop_pages drops below PCPU_EMPTY_POP_PAGES_HIGH and
> active chunks have no unpopulated pages, pcpu_balance_populated() walks
> into pcpu_sidelined_slot and repopulates chunks that were just sidelined
> to save memory. Because chunk->isolated is still true on sidelined
> chunks, pcpu_update_empty_pages() does not count those newly populated
> pages toward pcpu_nr_empty_pop_pages. That leaves the global empty page
> count below the threshold, so subsequent balance passes keep refilling
> every sidelined chunk back to 100% before reaching pcpu_free_slot.
> 
> Skip pcpu_sidelined_slot in pcpu_balance_populated() so sidelined chunks
> stay depopulated until pcpu_alloc() actually needs them.

Seems right, thanks.

> Benchmark results (4-CPU arm64, 4 sidelined chunks with 60 reclaimed
> pages after triggering pcpu_balance_populated()):
> 
>    Metric                                    Before     After     Delta
>    --------------------------------------------------------------------
>    Sidelined pages repopulated                   60         0    -100%
>    Sidelined backing pages (kB)                 960         0  -960 kB
> 
> Fixes: f183324133ea ("percpu: implement partial chunk depopulation")

Added in 2021.

> Cc: stable@vger.kernel.org

Why the cc:stable?  The changelog doesn't clearly describe the
userspace-visible runtime effects of this flaw (please always include
this!) so I'm struggling to understand this decision?

> --- a/mm/percpu.c
> +++ b/mm/percpu.c
> @@ -2045,6 +2045,9 @@ static void pcpu_balance_populated(void)
>   		if (!nr_to_pop)
>   			break;
> 
> +		if (slot == pcpu_sidelined_slot)
> +			continue;
> +
>   		list_for_each_entry(chunk, &pcpu_chunk_lists[slot], list) {
>   			nr_unpop = chunk->nr_pages - chunk->nr_populated;
>   			if (nr_unpop)
> -- 
> 2.47.0
