Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.167
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795701191;
	b=TuxErCtL608Ro7p25QLhH+o2FVHMWNk61gwM32KBNWyDKBzqumk3CjZCp4UQ410UO7mS
	 xrFqS30CasplYIXkw1Jzu3rC+2QQduatlu0+mOJUC8SzEO7H81b3f1WPCUczMJaPi+JiC
	 rMAcdK9lX52qTzEWyYWafYHgIUu2m4eKcU+9Qw4ZSG4Ckz7Fa1bwFsIHMQDhEBVkLtJkU
	 eHH9VxwDMCj9z5lO9cIIln0aBuSbGANlI1BO4yJXF0JVujqJrwp2gqzHXiRnVxMs02IyF
	 pGrXJmjZaniM5SUqahZSbyUgQ/T9OcwO0Ep3E6UHNwb08P8gik6mVsOuAl21x8KiEHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795701191;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=wBNF/N6dV01CZXPBjN7hTYh2V25GC86ewPpc4xVTK6Y=;
	b=lIy6IU0fpSc9O2PMweReUvPvz13cq6pnAHKwiVHU00QjBscP8Fkg0jyizuXG0yopYFVE
	 mwPPnhHheYEKrQNtSCu7d33gCtS/4Yk/HhAod5lk0HnUE21hwq71kqFCL7buWy0vxGHQq
	 JzeBBgSlwZ9KZMcHfxYmfb7el27CTbuKgfVrPuijF9qW48+euNHstRx3fuQcSeMvcgMdU
	 VqQV2fsSNOVrVv/92OP0SrrAMcN0YHIRFasabbfhf2+bjx/7fM+1QaK2KRMBbyjbe2w3N
	 +uxgNt/TjEmAfCMoPG2v0EvgYJdT2ouGhf4NqXtQNb55SC9QYSa0XNpR0C7rYQL7EnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=MNz1ax2l;
	arc=none smtp.remote-ip=95.215.58.167
Received: from mta1.migadu.com (out-167.mta1.migadu.com [95.215.58.167])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6B4606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:53:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC6B4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=MNz1ax2l
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=wBNF/N6dV01CZXPBjN7hTYh2V25GC86ewPpc4xVTK6Y=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795701185; v=1; x=1796305985;
 b=MNz1ax2loOfN/E7+3B5LjZ6IsPtZBpL96L6Km2Y3WX8qz2f1KO0dOKeVsCjFbTdr5mGR93PA
 0IBXNNGXAXJEvOHlm76CUVPLz0LkrFZzt6qD+vuRYOiaAiAHXNG4Lk/FwxbLnZ9rfG0w6PM0g59
 ykLePE3nkU5M61q/1ZEBMzJNaQesuzcTy+U39DbNNqsDgq/DhM22XJZxkz3mT+Gl9Zuj9jf40wB
 zIK3Q4dQaF2d7/gT0zWjOx2E4NiN31XBk5Z5iCnk2cCg6I8vGpayexGUW6+krw/HLCDHDUCge6a
 p2hrOZbL2a13rgwFGZJtSOW5hqbLI4E+LKNaqy2iudLLg==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8a22f4692d3e40a9;
	Thu, 26 Nov 2026 13:53:05 +0000
X-Mizu-Trace-ID: 8a22f4692d3e40a9
X-Migadu-Flow: FLOW_OUT
Date: Thu, 26 Nov 2026 21:52:50 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Bruce Song <xiongwei.song@linux.dev>
Cc: alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn,
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
	paulmck@kernel.org, linux-doc@vger.kernel.org, rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Add RCU docs Chinese translation
Message-ID: <awg5sl7LxTOVqpSw@wyuan.org>
References: <20261126132523.6329-1-xiongwei.song@linux.dev>
 <0d5126e6-7588-4cf7-90de-0bd193db8246@linux.dev>
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
In-Reply-To: <0d5126e6-7588-4cf7-90de-0bd193db8246@linux.dev>

On Thu, Nov 26, 2026 at 09:35:28PM +0800, Bruce Song wrote:
> Sorry for the noise. git send-email returned "timeout" after the cover
> letter was sent out. So I resent v3 of the series. Please ignore this one.

I'm not sure if it's a problem with Migadu or network condition in
mainland China. Every few months, I encounter the issue where email
sending gets stuck. I do not know whether other linux.dev users or
migadu users frequently meet this problem, or just me made stupid
mistakes elsewhere.

