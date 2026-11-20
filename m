Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795140638;
	b=x8ubvvVYs5EdGQM2TV8UI4wupxLefkHNxzJhqJjcS2dU4c3FUCqwXyYnRHZecW4vnU/a
	 tcto7hs3ZRouuQbeavYjmb3EE+zWvPACN5Al1WGP1nm7omZrMY/SO6DaaDldaMxqcFWm5
	 EmE8N8h8XCB9rvdFPikyRbDcrD3j2CY2guS6HSk4ilhxJk7wpnefvkb6Bhfq4A+FeUlI0
	 5ePsq+ayCUPSX3snACHjLv0MY6Y5eSDUfXzsBk357O+4MLWje2SN9qCoR9iksT1MwSK3B
	 I+/423V9UTTWIHQQmuhbz6F6+U7FL0MJml53rVvEILBZLE+hwP65zVnZYOeZzJkqIKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795140638;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fAN/e6+U7sfa5OtMD1qxSRiG4GHIFoLO8PhOHIp2kek=;
	b=YTB/2ILb4e5VmK68fBIeB+DeAkQSAXLrpsuw/3szU7ud0kfk75Oss3VQxDrtOlkpenMU
	 fP3I/A3BvBH/Rx8aIxyIUlem7sh4g9vybElcbXcDA/8ohaJTD7OzL+VyNCRziGibHEi7m
	 QzOzwEYh2y/1SVbi58UQVUiWQbNQN4BtSJV5FDk/i2J9SjmkHafII+lWp/F6gDkFYpqhi
	 76zYT4sICSs0NxuCc0Kfo4KSUFVQ9QknDoXEtfVNSYCIR6NyhYy+afyaL5QAcN4wRI+Ar
	 6NiOW170WEG2/rA+AJDwYytStZzaNAusDQY8f2FcksLPv7hJKcvTxWWjfVx8SWrHRNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IOqpF8Ij;
	arc=none smtp.remote-ip=95.215.58.170
Received: from mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61530606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:10:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61530606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IOqpF8Ij
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=mrjM3E9XsGUjjvDzD2P9xBJ+Fbcg5ReTEU8nz9rmAso=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795140635; v=1; x=1795745435;
 b=IOqpF8IjwVAI8iVy3cj8+rNKynHO7knY3frnR/aNG9asmV41tp+ZpF0l5oGj4U1cv/yT1BQv
 +OGqbxAyZ8xdvlt/Ncih7uz0eg6OSHhokUapnpchPgYouhUBd1VlXK9rK2TbncpcmMmfWP2dZRg
 JYJo/yNV0QbtKAEbFDWh9Dvg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 4a30cbd97f47fc06;
	Fri, 20 Nov 2026 02:10:34 +0000
X-Mizu-Trace-ID: 4a30cbd97f47fc06
X-Migadu-Flow: FLOW_OUT
From: "Xu Xin (vivo)" <xu.xin@linux.dev>
To: david@kernel.org
Cc: akpm@linux-foundation.org,
	chengming.zhou@linux.dev,
	donettom@linux.ibm.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	stable@vger.kernel.org,
	xu.xin@linux.dev
Subject: Re: [PATCH] mm/ksm: do not inherit ksm_zero_pages counter or PTE markers on fork
Date: Fri, 20 Nov 2026 10:10:27 +0800
Message-Id: <20261120021027.398507-1-xu.xin@linux.dev>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <41242382-1cfc-4dd1-8f8f-f9486f80b424@kernel.org>
References: <41242382-1cfc-4dd1-8f8f-f9486f80b424@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> >> But ... they were placed by KSM?
> >>
> >> Just like any other KSM folios deduplicated before fork and then shared with the
> >> child?
> > 
> > I see your point, but in practice, people evaluating use_zero_pages=1 often
> > look at ksm_zero_pages to gauge how much memory KSM actually saved. Since
> > forked pages already share the same physical frame via COW even without KSM,
> > counting them across many forked children can give a somewhat misleading
> > impression of KSM's actual savings.
> > 
> > Also, ksm_merging_pages right next to it is already reset to 0 on fork (even
> > when regular KSM folios are shared with the child), so resetting ksm_zero_pages
> > keeps the two counters consistent. 
> > 
> >>
> >> So won't there be an inconsistency when MADV_UNMERGEABLE?
> >>
> > 
> > As for MADV_UNMERGEABLE, leaving the child's mapping as a normal read-only shared
> > zero page is safe and avoids extra allocations. Plus it naturally avoids the
> > skipped-VMA (MADV_DONTFORK) accounting bug you spotted, and does so
> > without extra per-PTE overhead.
> > 
> > What do you think?
> 
> We should then definitely document the behavioral change, and how ksm_zero_pages
> interacts with fork.

Agreed, I'll update these changes into documents.

> 
> For clearing the dirty bit we should have a dedicated helper, such the handling
> is hidden like in is_ksm_zero_pte().
> 
> 
> So clean up that code (reducing the code comment drastically) and properly
> document all that for ksm_zero_pages.

Ok, Will do it in v2 together with the fix of building error when CONFIG_KSM is not set.

