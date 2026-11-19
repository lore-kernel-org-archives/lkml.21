Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795077821;
	b=txKU4A1nraIgT/ye96bdrONuk5zDdclOf2vMASzGNHvnt1Rpk9to+WvclPF6E1Z+qKYJ
	 K03KyqldlFcf19h/h/O7wHQdRAyVVz/Rd9+0ZtfogNw6gQL7v5KvOIcwmcJJ/x7QJxTJS
	 8BnUJeITgyjmLDk7qyTDZKPJuM5YXGRJFtt7MsncyR9szf9XCUhJzAC++aiTbYk00pb23
	 swRPrkPe6EibzXeSZUKVptCTYViXndK6Y2aIENUgj21QKNINDNqh543eFrSlrr86CrRJU
	 jcWVR5jEhd9kbqJ1j0TY+KBtGvmcj9wTaz0pROajm+q0ltTZDVjH1OZ9CDAGcypFLIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795077821;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=rtghJIjWql+xP2DKVq/IwfJvHxOsZQ8g4qMYFaP1EDA=;
	b=y/IG8ZZXfA0PgcVHws2zYtMpSIbURO9ZeMTrV56eDSJbacD+eZbikLqxdW18N+CYQUo4
	 4/YUEDMkmyRUoww5sOn9qKi+xqLA8f0fEIKSs6wVj+kQLh2HMzdpKt8dTaWfyaf8z7iu+
	 Ve+ZHoIN1po4cheSlsbJWaNoFFLBSkdf8RPH8gMBMiSqzeNGueEJI1+YcPw1skITrIAgU
	 JbOZJcM8C56Xweizkg7Ptb8oDkeZuPc+HALUZkZrARmmfVET5rfc1QQwJBRF6Ur/k1iFF
	 zPTqPAvgUYUqALD1y8WG132Qg4nG+VaZeq4870FMWm30RsOSQ0lwh+dC4ltm48BrNUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=mZmgybaJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EE6606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=mZmgybaJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 729B81F000C4;
	Thu, 19 Nov 2026 08:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1795077820;
	bh=rtghJIjWql+xP2DKVq/IwfJvHxOsZQ8g4qMYFaP1EDA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=mZmgybaJg/L2vOzYXR9VuaQbUN59V4Q9issn5IeVH5fWmmbGuYLdTVH8e5kAqkzsR
	 u/n+KaV5BBry8nJCAWIPUSETtpucShA8286lPYdkMMMhWwyZHLOph6eDqC+yBsgU0O
	 JZ0i62IgfmDVJFBqGH7vRP79oQGZl+o6pxzZ3vkk=
Date: Thu, 19 Nov 2026 00:43:39 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Qi Zheng <qi.zheng@linux.dev>
Cc: muchun.song@linux.dev, osalvador@suse.de, david@kernel.org,
 azpijr@gmail.com, lance.yang@linux.dev, fvdl@google.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, Qi Zheng
 <zhengqi.arch@bytedance.com>
Subject: Re: [PATCH v5 0/3] mm: hugetlb: fix CMA-related issues
Message-Id: <20261119004339.98c7e39ba863695691c7b921@linux-foundation.org>
In-Reply-To: <cover.1794907279.git.zhengqi.arch@bytedance.com>
References: <cover.1794907279.git.zhengqi.arch@bytedance.com>
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

On Tue, 17 Nov 2026 17:33:56 +0800 Qi Zheng <qi.zheng@linux.dev> wrote:

> This series fixes three CMA-related issues in HugeTLB reservation,
> long-term pinning and allocation:
> 
>  - Avoid ineffective CMA reservations on 32-bit x86 kernels running on
>    CPUs that advertise 1 GiB page support.
>  - Allow long-term pins of explicitly CMA-allocated HugeTLB folios,
>    which already own the CMA memory.
>  - Preserve the caller's GFP mask when allocating from CMA.

I fed this into LLM-driven testbot, both confirmatory and adversarial
testing.  All looks good.

Tested-by: Andrew Morton <akpm@linux-foundation.org>


: Tested the three-patch mm: hugetlb: fix CMA-related issues v5
: series before and after applying it. The 32-bit boots covered non-PAE
: and PAE kernels. The 64-bit tests used a two-node VM with 12 GiB of
: RAM and CMA-backed 1 GiB HugeTLB pages.
: 
: 1. x86: hugetlb: disable default CMA reservations on 32-bit kernel
: 
: Without the series, non-PAE boot warned and reserved an unusable
: 64 MiB CMA area. A PAE boot also reserved an unusable 1 GiB area.
: With the series, both kernels rejected hugetlb_cma= and reserved
: neither area.
: 
: 2. mm: gup: allow long-term pins of CMA-allocated HugeTLB folios
: 
: A long-term pin of a HugeTLB page allocated from CMA failed with
: ENOMEM before the series and succeeded afterward. As a negative
: control, I found an ordinary anonymous page inside CMA on each
: kernel. Long-term pinning migrated it out of CMA before succeeding
: on both. The change did not permit pinning that borrowed page in
: place.
: 
: 3. mm: hugetlb: fix GFP mask propagation to CMA
: 
: On a preferred-node allocation, the caller cleared
: __GFP_DIRECT_RECLAIM. CMA received it set before the series and
: clear afterward. I then exhausted node 0's CMA area: further 1 GiB
: pages fell back to node 1 on both kernels, and a fourth fault raised
: SIGBUS after both areas were full. The fallback's reclaim-enabled
: mask reached CMA on both kernels.
: 
: Allocation latency and general memory-pressure behavior were not
: measured.

