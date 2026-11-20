Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795194457;
	b=jEYVC4CLW0WbaWqClDYuPS9v4WCuRthvcjPaYoIen/258A0OKt7tBETW/ILyFse7LlvQ
	 1wQgitMNxdGuAaBsnyIz+ty8sqxJvoQRlv/eGWUFBLXpR193iyjURO2djgl/EahbFIRgo
	 q7DD/qo57wYYbgVe03bFAxOjmnm2A7QfhWlsnfrjNo04Va2r4VmiJls9a7tBRdcsBWnLX
	 S8vTJWPM7YwD1GZTQJRgTRii2aK0clwOCktiraKMyEGcv6sdh8bZvh5uWIh3lL4Kv+Oms
	 4ySNz96SjWMKgMHAKtjKlDMTMEwNNknMCUAlFaHAwfQlz+g+XqCHnRI2uzUJOPUbvrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194457;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=cYUe6ULxQht0oeHwzKNauq2tYnRR3z+onqJpf3SwhcI=;
	b=cjCOVQXNa1UPd6MTP6DVt6Z0vlRqNKWakCPdml8AKlNDmkdvJkaIxKhl6a9KFbosduq/
	 /5f/WhKiBNl3NS/frPgF8t4kLE5GqXeDyLAyM6AkGciLgHpfMua6WFB6LpIiG0MQ7qJmr
	 a/DXjLGaAftoZhNkS9RKPQKYu/5pdVx3A8t/io/iWwVEabqFYNazZHoewE3V2RIv8pv74
	 EMvqM9x5UpKbO4yKA+fM98Gnmsky/lqpH7Lhmt3HmkWExSzzUJFtAmKw7UUSJkrUmCQAq
	 mkfYFzLLLETP/ZVUwm+nIA1fHbZ079teQbjQyZYWYhQdB012Kj2LWA0eiEs+vZVHSMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=SXev17MS;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D600A606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:07:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D600A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=SXev17MS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cYUe6ULxQht0oeHwzKNauq2tYnRR3z+onqJpf3SwhcI=; b=SXev17MShBfDVym7UghO3XVX82
	60MPtJ55ChGGmMJSEPMmhIcna81oZkSvPdnwRR60xlEE55vUbcGRR/tE5ImGqB8/+bJa/iXhJf8kA
	FudQYxq8Ju13mt17Nmr5gLHeatDf0XWSe367e3FbD0T5ecmHPBexYzfEl/yub9bYUywfbafTleSK1
	vD2inpANvfZuvNIhjJXyEnqpy7WxFcH32+V0Jw3mdafdaR6kyz5h6ebXKhKXvrDacwACI/24sGB2W
	7aANTTi2tJSxbNI3OOxEADL2bt2sFixLDgmDBEez8vAhpTuYSTAHljY9RFhNO8Q/hUF3hqFVJNwGb
	3KzFeRqg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUS5G-00000000yyj-0K1r;
	Fri, 20 Nov 2026 17:07:33 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9C4773008D6; Fri, 20 Nov 2026 18:07:32 +0100 (CET)
Date: Fri, 20 Nov 2026 18:07:32 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Christian <servidorjarvis1@gmail.com>, dave.hansen@linux.intel.com,
	luto@kernel.org, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
	x86@kernel.org, hpa@zytor.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] x86/mm/pat: HIGHMEM pages in set_pages_array_*()
Message-ID: <20261120170732.GT2668804@noisy.programming.kicks-ass.net>
References: <CAMas6S2z+9-TyTfFTRDM+Qk2rKpRoYAUJSvmMxEwG6eAnQQn-w@mail.gmail.com>
 <066e8503-2e25-4666-9f55-f62b7592854e@intel.com>
 <CAMas6S2OpEag7VQAtHaFrho8VF883+EpL9XpO_sTV=ZLpmDJsA@mail.gmail.com>
 <b0db3d3a-4715-4a07-9532-d07ffbf3bada@intel.com>
 <CAMas6S0sV6PuLUC+gTEaVpHq-imDYHXyRYS_UxDgD3eECqgxxQ@mail.gmail.com>
 <3203b72a-6585-4f65-8eec-a17881ebd76e@intel.com>
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
In-Reply-To: <3203b72a-6585-4f65-8eec-a17881ebd76e@intel.com>

On Fri, Nov 20, 2026 at 09:04:29AM -0800, Dave Hansen wrote:
> On 11/20/26 08:45, Christian wrote:
> > About the AI part: English is not my first language (I'm from Spain),
> > and I mostly use AI tools to translate between Spanish and English. The
> > work itself is mine. I found this bug on my own tablet, I traced it
> > myself, and I'm going through it one step at a time. And yes, I'll be
> > around. If this breaks something, I'll help fix it.
> 
> I've heard this exact explanation from two different contributors in the
> past 24 hours alone.
> 
> All of you were only constrained by your language skills from making
> kernel contributions? Then, suddenly, LLMs got good enough at
> _translation_ to make these contributions possible? While at the same
> time LLMs were getting orders of magnitude better at coding?
> 
> I'm skeptical. Do you blame me?

Notably, things like Google-Translate have been good enough to translate
'simple' text for a good while now. And we have definitely seen people
use translation tools before this LLM onslaught started.
