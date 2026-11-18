Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.186
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794974957;
	b=vgDEbdg5vpnGrQ2mWOJYW583k8nR1uZ5K15qLTtwbGW9TJwKcFr4nihtEZZ+ACv5vEHu
	 SO/dlhD6xvc0HJBmKhlEn2dIcp/xO/M/QSfGQL642WoYpzQejoi6zJ0gMCIdkBQo7lNLD
	 S1xC0H9mgdA5er99JqNlJOjDuv9fZ52DXWUxJA+7JMDR1dwr88aDF3RUrg1Vb83ibd+Ej
	 hyBAzc9o68qv3w4QCwN4A1Lr3/ts13/Q+qtms3ka/26LnCSYvMVmShZet9KZZ0RYrfYVt
	 48XeOetlE1igjtjyuQB2SQhWtHrnpMP+6E98VbT3HDNyBN29KEtFvQvzQ6IymX/hhOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794974957;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=gO/JIfcgvTrlBo/baVGaxSVMIPH4zI1FEGs1Iqz/bPA=;
	b=OYZzWiWXJ8dkIjauxocWl6M0gbUoWRMbtVRj8le0UrhGKj9uitJ5Z9RIW19RyyM9pm0g
	 2PxBqjnn2ueT+xdV8yxmsXmcNolDS3OC89Z8LEN4yYjSayfxiMKwlgbybFwwebNyy6kA+
	 oUO2yxxvefB4zuiNgwJPaMauhFxZDxAQHPXxW1o8qN0yo2MTPGbW5Lu+TOOnxy06SZENs
	 /Q0RIC+kzYCQkJ6SvBfDzfUgFL3zj+zRoN0ibiOqx2tXpQXkpSZFry2zrSY2l/17RiI8o
	 lZIlOyVyCuqgfny5LyI2KdYBQiamX5cbv7BN9tPhEeIFJ0UaGoYTz4izlpPtZzVXcEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=aUlNQ8fD;
	arc=none smtp.remote-ip=91.218.175.186
Received: from mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D87606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:09:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2D87606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=aUlNQ8fD
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kKP1J72ZJeOQfMxDWBKM+TEV898mVVp1LwfsakS8ddk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794974953; v=1; x=1795579753;
 b=aUlNQ8fDSTm6yVezvnyz8/frbGAzn3IEaGWblRIw4JmRsujNkcnqkn5j2cC0P+QJ0DxA9EvE
 aBXh+QBS6wklViFxgUIkJBahCQAWCsTJt0H9Sinn9bcc2m2VxOqs4/EQlBDN/bPxCkL4fV0/8TB
 yMWOnrmNT9wThxo6MUKqGnz8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 29c80f066480eadb;
	Wed, 18 Nov 2026 04:09:13 +0000
X-Mizu-Trace-ID: 29c80f066480eadb
X-Migadu-Flow: FLOW_OUT
Message-ID: <38118330-5cd6-4f32-9098-a3d07cc7b3cf@linux.dev>
Date: Wed, 18 Nov 2026 12:09:01 +0800
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
Subject: Re: [PATCH] selftests/mm: allocate nr_pages based on pmd size for
 uffd pmd_move tests
To: "John J. Coleman" <jocolema@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 akpm@linux-foundation.org, david@kernel.org, liam@infradead.org,
 ljs@kernel.org, mhocko@suse.com, peterx@redhat.com, rppt@kernel.org,
 surenb@google.com, vbabka@kernel.org, audra@redhat.com
References: <20261113040045.1439391-1-jocolema@redhat.com>
Content-Language: en-US
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <20261113040045.1439391-1-jocolema@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi John,

On 11/13/26 12:00 PM, John J. Coleman wrote:
> When executing the uffd-unit-test, the "move-pmd on anon" test will fail
> on aarch64+64k with a segmentation fault because the initial allocated
> memory region is too small.  This only happens with the move-pmd* tests
> because the architecture base page size is still utilized even though the
> memory region is specific to the size indicated by the pmd.
> 
> Patch 9f5c2aec3388 ("selftests/mm: fix uffd move-pmd test crash on 64K
> base page systems") implements an initial fix to the segmentation fault
> by skipping the test if the allocated memory region is not large enough
> for the number of pages x page size requested.  Since this will skip over
> the aarch64+64k pmd tests, this patch is intended to resolve the problem
> with 64k pages by pre-allocating the memory region with 2x the pmd page
> size (for area_src and area_dst) for only the move_pmd tests by using the
> uffd_test_case_ops pre_alloc hook.
> 
> Link: https://lore.kernel.org/all/20261103202049.499206-1-jocolema@redhat.com
> 
> Fixes: a2bf6a9ca805 ("selftests/mm: add UFFDIO_MOVE ioctl test")
> 
> Signed-off-by: John J. Coleman <jocolema@redhat.com>

Thanks for chasing it. I've tested mm-new (which already contains this
patch) on my 64k-page-size box.

Before this patch:

 ok 14 # SKIP move-pmd on anon (chunk size does not fit in the test area)
 ok 15 # SKIP move-pmd-huge-zeropage on anon (not enough pages for one PMD-sized move)
 ok 16 # SKIP move-pmd-split on anon (chunk size does not fit in the test area)

After this patch:

 ok 14 move-pmd on anon
 ok 15 move-pmd-huge-zeropage on anon
 ok 16 move-pmd-split on anon

So,

Tested-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>

Thanks,
Zenghui
