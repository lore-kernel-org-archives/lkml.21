Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.188
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795028518;
	b=bFXufvOTfDp4YUm0oLuBJqzMOduwtNum6Fe0Q4jDxIEhqRRUnYDqqWCKMUG8gASPqYn4
	 KKwlUKHIJOibFQdOcHS/X3is+Cf5yfVZOhLz+rryfb8DXyd63uMYJRIxSoijRf6h9KAMT
	 JkJEsKZ/m4YXon+YmcEzFRo2WsNF325qIX2VN90lClndZRF8jUzr5hade2o0ZypJbuTle
	 sFJhczdcxapDeFNdR1Fl7vqT/egoG1qrJTdmI62IOBGhSzElA66hPIWOUWtWGjTL5Uz/X
	 fDoyV2TRx8l7j6Ho6VHbpC780Y+P1BRxlFCujXQRCE7u4vOfac9IWfMxBhTlALR8ayg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028518;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=EjJbHgwgcxNqW53fLeTodrRy7NHl4fRdnICBXCMuA2o=;
	b=y3AAG0SlJJfpv972EevU6KfQlG/tVmYyob1kIFLYpJUcJPOis6j7DVlXSsVeqm7MvKsg
	 AiIVILsXBiMC3A3sY2Oh3E/4FVuLYPVz4MLVqHYqeuc4qtOPPXCLA+Jm5rkaQWxuW/Evb
	 OEwpRvGvrvHFkhAVnxkJOkjUsOH+miJsWMTiNvQgIq9lyf5WQ7iOZUJyfhCqHHgZQkkws
	 ACU0Op6R1TRVHFHs2oljJOp+apPB/f3bpow3+5COjrhid3wmtir8KjnDSrLD6ykus/qgF
	 Lt08rjHE243zTkg1o+rQzREuWxFqX1hj8QFYsKDZnc0OF/IMxgXP7TZ22h+6jXgntDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wJ5bWs0N;
	arc=none smtp.remote-ip=95.215.58.188
Received: from mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BAC606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:01:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4BAC606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wJ5bWs0N
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=397Fnwjs2OurSvX7XPzQR9J6ItOjTstfYOqYmvEYocc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795028514; v=1; x=1795633314;
 b=wJ5bWs0NOU86zeHVo/NtoIlqGFV46EZcFtQLVsnXWkh80QXDlGr1Rjv05QpQuhOTl4uk4onL
 SAvzihVKc4rf70ZXJZdzlvV2igzTyBlAiWSMou5Omj2I4geMZSWJCF52drXy/pak7otTP04YNv6
 ida5+ahWRceh71Z8SbtMIldU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0fa632777596c450;
	Wed, 18 Nov 2026 19:01:54 +0000
X-Mizu-Trace-ID: 0fa632777596c450
X-Migadu-Flow: FLOW_OUT
Date: Wed, 18 Nov 2026 11:01:49 -0800
From: Shakeel Butt <shakeel.butt@linux.dev>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Pedro Falcato <pfalcato@suse.de>, Jann Horn <jannh@google.com>, Mike Rapoport <rppt@kernel.org>, 
	Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: consolidate the memory mapping entries into
 a VMA entry
Message-ID: <av32Bb3OAouItkpf@linux.dev>
References: <20261118-maintainers-consolidate-vma-entry-v1-1-8019b0e9928f@kernel.org>
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
In-Reply-To: <20261118-maintainers-consolidate-vma-entry-v1-1-8019b0e9928f@kernel.org>

On Wed, Nov 18, 2026 at 06:22:10PM +0000, Lorenzo Stoakes (ARM) wrote:
> Memory mapping entries were kept in three different sections in order that
> those maintaining/reviewing each distinct part would be made responsible
> for/cc'd on only those parts.
> 
> However this creates confusion as to what files belong to which component,
> so simplify things by consolidating them into one.
> 
> Expand Suren's maintainership to the entire component, as he is a trusted
> and valued member of the VMA kernel team and very much deserving of the
> position.
> 
> Additionally, drop Suren's core and misc reviewerships in order to focus
> upon VMA.
> 
> As David is receiving pull requests directly, make him a reviewer, purely
> as an administrative change.
> 
> Also specify the new tree location in preparation for the tree being
> established for next cycle, and remove the link to the not so regularly
> updated linux-mm website.
> 
> Given that, from next cycle, the tree will sit outside of Andrew's current
> process, remove his entry, also purely as an administrative change.
> 
> With that said, I'd like to take the opportunity to express gratitude for
> Andrew's huge contribution to mm, and for his being both generous and
> gracious throughout this period of change in the subsystem.
> 
> Co-developed-by: Suren Baghdasaryan <surenb@google.com>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
