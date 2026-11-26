Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795675315;
	b=EOJvPI/KnbkPSkl+BbtoZhhvW98rYcot2GqcwV9N9RJaeLHk8dTCqC1d/B5N83DZUAh8
	 Nw48Fz3OLRucw69oxfIewmloVlR8nffHHNhULc83zMRPAoVEtY7SklVPY97bC+kG804H4
	 FUOO4BIH5YXuA92DWA2CDbviL7fpE2Ws5/SqSBYRgGm30mJEj6dNme8whlknQtqPyJiJ0
	 1axjWe1qay3mSWlwflYCHBMjbKUGAcCG+EB5R4YpDykDI/enqKh0L7zJpP+6V/8ruHv7v
	 o7Pw81P03NwySQTeQo+VksQQ8NnXy5QunKdPHVQcNb2HNm6wkm33INjyPB67F2mJcqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795675315;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=wgeUolha0fJQH9UwTLcaDXErohxlBmGVPsT2catGQk4=;
	b=F8jTLkgQij9um8lxG3e5zDlZS99l9GbdkkDSDGC/RplIceeUk8ax0jM8hkKejn71EP28
	 aurgCSs2MPpkDrBJv3c4ntdB/WR0RNaOObuLGAc7gZx5eibdYrcShevKcHouTg9e/79Mh
	 V8KpC7oJvZ0JcYMFcWsA3PT+MloUPJektVJwNKY1Xt375pMkMKe01hJl1udoFwcpWGtAW
	 EtD1TUr2f3eAfKjU8ZPJBnI3rfKSMCV+4tpkaP8yZG4UU5f/LJ77wgrZ4H/lx8IkfRUpo
	 rOxIoU/G04WvA4tulOiWadAOmKrlzGJkEljrFQ/XyEg9yCTSyRK1JEJzM9+1Ir96kkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M47Q5eJ+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9A7606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M47Q5eJ+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD1931F000CF;
	Thu, 26 Nov 2026 06:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795675315;
	bh=wgeUolha0fJQH9UwTLcaDXErohxlBmGVPsT2catGQk4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=M47Q5eJ+gBbg21TeYhMgcQJmEolXZeGyr1Z3yNmNIhsk8ZCUDRuYEPJdLV77mzPDt
	 bs/OWPm7HRyz2gDPAT7YlDQ9F5FeGXPadxEC62HPXUdNKrcZ5KNYa0eKncwoZ34xba
	 rNX0wPiDl01AO0GxeRZJXGI6FbZmbuVL12VmI6xOAtOnrtSuIaRR4FswZdpEdvM4s+
	 ZCKU2WpeiAi+xs9SEY3M0zKI+z9k3SYhkrzPRDxiZuZuBwielUOgpc/5i/OFHARn0H
	 0VHxvCMoMASX6x4Am6ugvOFAges/84GO2oj2jbmtQ6yZmdID/5k3651dfTxxcNS2N6
	 zwjuHgmnR6Q/Q==
Message-ID: <fba23668-add0-4787-b027-bfba1f66e090@kernel.org>
Date: Thu, 26 Nov 2026 07:41:48 +0100
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
Subject: Re: [PATCH] selftests/mm: move the HMM migration benchmark out of
 selftests
To: Balbir Singh <balbirs@nvidia.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>
References: <20261126025653.1344932-1-balbirs@nvidia.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20261126025653.1344932-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/26/26 03:56, Balbir Singh wrote:
> The HMM selftest runs benchmark_thp_migration on every invocation.
> The benchmark repeatedly migrates buffers in both directions to measure
> latency and throughput with and without THP. Run it on demand so the
> regular suite spends its time checking correctness.
> 
> Move the benchmark into its own hmm-bench binary and share the device
> fixture, buffer helpers and migration ioctls with hmm-tests. To run it:
> 
>   make -C tools/testing/performance-tests/mm
>   sudo modprobe test_hmm
>   sudo tools/testing/performance-tests/mm/hmm-bench
> 
> Drop the 128-PMD buffer to bound the amount of memory migrated in one
> measurement. With 2 MiB PMDs, the largest buffer falls from 256 MiB to
> 16 MiB. The remaining sizes still cover buffers smaller than a PMD, a
> single PMD and multiple PMDs, with and without MADV_HUGEPAGE.
> 
> Call fflush(stdout) after printing the results for each buffer size.
> The kselftest harness ends the test child with _exit(0), so timing
> results still buffered in stdout can be lost when output is redirected
> to a file or pipe.
There was recently a discussion on where to put performance tests. Usually it's
much rather tools to test performance.

So what about tools/mm/ instead, where we also placed gup_bench.c ?

-- 
Cheers,

David
