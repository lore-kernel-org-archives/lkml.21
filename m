Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458579;
	b=XTxy/WHrx/a8hBjTNVycSeGYLDSW3zNpRJFrU5gzvWlcHxGzA4pPS9Lki6dCU5Jej1je
	 TB6S8xX46eAQlLZbgSXycMfzgDxNrHXVBeApe0ScEA4Es1uubOfzwyIFoPxyuyiYkomp+
	 LPPLAAbENh6RTxQoN+Cm6J8EBGgHEh572RGaeMkm8BRjOnRkqTMTgam6qTYWbN7G/8CL1
	 gfrBUsIrMmeYkSbb+xP7Ua0S7t5BfpunP6JDmydCA3T0vLQzaTRZDiGH/ZgLwD9i8fsVU
	 vM+YUg5RooIC+eFmbqriOQkC3JicCjSuqcakvwSWid8RVLWYom9vXlpYCpro4hCvHGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458579;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Date:Message-Id:In-Reply-To:
	 References;
	bh=6RKT0O/a2ICAVlG42q1U3NHIVPPuSmn9M7UwQWzHXqA=;
	b=Th0wqObTNdFhn02plltXpaPz7Z5JVos8tGrdGi2jSIBJkg7f8XqNmQVJw3bL5+nGV0fi
	 2HWGOsUrJ5mDQSBiP4FaOJEYTNr1lAvavVtVTlFbAr+VK4i2hfW+JqvGlWqSzw3AB/+n0
	 m9gIvIgLXiyhXlhYdik0OlBUOWhGQxOH/Z935kRe8wlGLv8LffUmEkCdN2svYmiEyT2C2
	 Bi/vyYhJSbVfllph/aPqBiPf2CJ8nC1/r1C7/F6KwNYl66AU3tohMX6/z6C70MXZgs3FC
	 TGYxnuu3CP84TCGjztEz7oqy6E5QFNuxedwILJPfNSexIkJi6vF4KFcDwPZ7C5VCTmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cressey.dev;
	spf=pass smtp.mailfrom=cressey.dev;
	dkim=pass header.d=cressey.dev header.i=@cressey.dev header.a=rsa-sha256 header.s=key1 header.b=tZSy5iHx;
	arc=none smtp.remote-ip=95.215.58.12
Received: from mta1.migadu.com (out-12.mta1.migadu.com [95.215.58.12])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6392A606A334
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:29:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6392A606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cressey.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cressey.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cressey.dev header.i=@cressey.dev header.a=rsa-sha256 header.s=key1 header.b=tZSy5iHx
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6RKT0O/a2ICAVlG42q1U3NHIVPPuSmn9M7UwQWzHXqA=;
 c=simple/simple; d=cressey.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795458576; v=1; x=1796063376;
 b=tZSy5iHxpKXau/8scmsuCbWl6lrffVjXRG9VmFdr3C/kIKixag/xuel4IMc9mid9ozacPLHA
 ZwBVAitu9Ix5fQLsX/y4FV+KRD4kElSq40dCiPbGBPPKLgbJAfjzJ+CH02wM3eOyEwEhHMVgyQQ
 VcrTR8zCd8PJbLaZdZnlVpD6o48DPDoHeZnNj5kAW49GkxlXO0dNHyQn6Zu+spbl82575q5D7zt
 t2lvnHHR//HwtqhdbwqwD9nLd+Nzv6pL6EHV6qRFrvYYsQ9yYqoaTLoDzHvNSeqKtRcnBwwY+hl
 T9ph0wRW94wyZZPhmZZKPtVH0XlQ6mQENx77z6oaCJCzw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 37519310d25481af;
	Mon, 23 Nov 2026 18:29:36 +0000
X-Mizu-Trace-ID: 37519310d25481af
X-Migadu-Flow: FLOW_OUT
From: Ben Cressey <ben@cressey.dev>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>, kexec@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] x86/kexec: Type relocate_kernel() to drop __nocfi
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Date: Mon, 23 Nov 2026 10:29:13 -0800
Message-Id: <20261123-re-5825067c5cd5@cressey.dev>
In-Reply-To: <avVUv4_eeOOr7ZX_@jpoimboe>
References: <20261111-x86-kexec-kcfi-v1-1-b4d41ea14deb@cressey.dev>
 <avVUv4_eeOOr7ZX_@jpoimboe>

On 2026-11-12, Josh Poimboeuf wrote:
> No objection to the change itself, but PLEASE no LLM-written changelogs
> or comments, they tend to read like Rube Goldberg machines and these are
> no exception...

Thanks for looking at it, Josh. You're right that the changelog and
the comments are much harder to follow than they should be. If this
goes to a v2, I'll fix them both.
