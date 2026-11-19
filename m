Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795069131;
	b=hjDix2Kesm0nsRkJ77th9EBStmVztkojYG2fbbxHMiaj/d4JzqZfFBa5/yLLLr16mRVd
	 jCLnL5+G6Zl/Oz/zHrZ0zwYYzcnm0qlzPFO95nhJCnZN0dR78PK9TJPItXUwXf9bmlNHA
	 cmkl7WCxo9hvGqQu2KUKB5bBD1yqPkS5bkwOmWCpXqC4eDwaZLqrPKLeWcVKFAAq+Lf1b
	 bY+lPvYUrSR5aajnBr61Ejtvp4jbSLnTjthwQeT5TDzDAYLZe+eokydPgQHGIGp4hImSy
	 PA3jqJRIrbLkQNbiVEyELQy5lPJFs47pUZuSZFGVjoLMnML5Wc/rODAgZbeeJ7ej5wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795069131;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=RxxDsLY4ljUbTZnycMtaYb8VPGrDn2EGtE3ij7vEDvM=;
	b=L6NF7aeie+AOAvtbO71BJpacYAGFy4Boak22sBmLERFnf1yqMkzJqxDuLEtreV5l4GLV
	 kGFruq8eVzDVBGJkJF1e8SiKlO5IbT75U0jNGgN21yMrX+saz4/BP27ZIvxTW8cZK8gcN
	 1N4guZkWkrMe+y+EirlsnT69x6xp4kzMWiLhj3NLUzlNLGtlLOtpP3k6Fai2vkcQH21ch
	 Pn3BxGxdRqIVKbUSSNrIL2QzCu2xqKGy4cDvZzdw1jNuKIODhbznOlvt1Bcv2PrjvSm1t
	 KsOAF4/K2Qn/O9Y2UkBtpMGWAHaE9E0xdnhDY+s7n+mL87iO9AkiQsMOWAx3shgrdng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xeY31rJJ;
	arc=none smtp.remote-ip=91.218.175.21
Received: from mta0.migadu.com (out-21.mta0.migadu.com [91.218.175.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E51606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:18:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27E51606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xeY31rJJ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=t7TRlOq46p8kCi/sZgPthGD6Yx0s98cBlhA2Tr75d94=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795069129; v=1; x=1795673929;
 b=xeY31rJJ6iz2DvTlXYboVccvUiS7FH3GIq5UUaSwxQF445dFVWHftLu5fWBrTiJoUZ1oFMn8
 0D8T83DUuQCkPFxA+xvITxngmBVg7FzZLdPmd4XZGJMzf3R/tzih19i5vEfg+hmqQML/2F6aCQa
 mxsxwJzH/5M9phzOu7QSisuI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 26b21a70714591fb;
	Thu, 19 Nov 2026 06:18:49 +0000
X-Mizu-Trace-ID: 26b21a70714591fb
X-Migadu-Flow: FLOW_OUT
Message-ID: <bd475114-6247-4ab8-b6fe-81724cc320ee@linux.dev>
Date: Wed, 18 Nov 2026 23:18:44 -0700
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
Subject: Re: [PATCH v2 2/2] mm/ksm: prevent zero-page remapping during
 ksmd-triggered THP splits
To: Usama Arif <usama.arif@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
 Yu Zhao <yuzhao@google.com>, Xu Xin <xu.xin@linux.dev>,
 Chengming Zhou <chengming.zhou@linux.dev>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
 Usama Arif <usamaarif642@gmail.com>, aarcange@redhat.com
References: <20261118212722.3922741-1-usama.arif@linux.dev>
Content-Language: en-US
From: Nico Pache <nico.pache@linux.dev>
In-Reply-To: <20261118212722.3922741-1-usama.arif@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/18/26 2:27 PM, Usama Arif wrote:
> 
> 
> Hey Nico,

Hey Usama!

> 
> I think I have had this conversation either on the previous revision
> or the mailing list somewhere else before, so sorry for restarting this
> again.
> 
> Isnt above a good thing? KSM is a memory saving feature, and this
> is resulting in 1G being freed instantly?

Not necessarily, for two reason (a), we are ignoring the users defined 
pages_to_scan, and (b), this leads to KSM using way more CPU time than 
the user expected, and in our customers cases, a overall system 
regression (outside of KSM also losing some effectiveness).>
> 
> As an alternate to having this patch, should we just have patch 1
> and users should turn off split_underused_thp when using KSM.

Me and David have been discussing the opposite. I was going to drop 
patch 1 as patch 2 solves the underlying issue in a fairly clean manner.

> 
> If you have a large number of THPs on your machine, using KSM is a very
> bad idea IMO due to all the splits that happen.
> IMO, there are 2 optimum host conditions:
> - A large number of THPs, and KSM disabled, hence shrinker can stay on.
> - Very low number of THPs, KSM can be enabled or disabled, but as there
> are a low number of THPs, the shrinker can be turned off.

This requires the user to be aware of these limitations and properly 
configure this system. With this patch we remove the weird interaction 
without needing any config changes. I think in our previous discussion 
David pushed back saying that it is not uncommon to see MADV_MERGEABLE 
and MADV_HUGEPAGE.

I think the approach in patch #2 is the most sound approach.

Let me know if that clears everything up!
Cheers,
-- Nico

> 

