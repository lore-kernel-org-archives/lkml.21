Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795655070;
	b=RddZleW5RPms/9Fah8fb/vkMGzK/kKexOUi2SPdLTINRTolHY+Qati/kgshPxGWOyZaw
	 ehB0o2EzC5eiVOpfzehMX1zMhw4brD6D5mk4y4kBIOKzKlKbZphbRc4PgxrJ8Z1bcjCyP
	 cRoTg8iaQ26TcuWhqnnh6pueApNgHqWqg8tliOKfGfBkuary7TjvNTjrsa5mUe0Oqq6zR
	 fxCJ+RvTBzX61qzOkHoKdmlJJ8W4ZPtJRSO/PhqmFVZOBWzfuiiCjzpe1+0Zo20IvSpro
	 DeijxyoB/WYC4+G4xslcynMK4d76IITQaKyB6zEPYnNIQhDegPXH14ISA40lt83CydA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795655070;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=KIktabnjHCDieeGWMO0z9Hmbrz6ngvKHiYWHyOgAZAA=;
	b=s5Wcar3xE655t9G3GpP8Tlu7JfNYEgsJq5Xg8Ke9DE1X5r9h2TqRVGr4K2uaJKJD6GxL
	 GGazjIDe/w6lX6MekWtDiTq/E6nfwyBYau+2U5rwcJgxk3doX+RCYQ+Q8+iFVGt+JRRVa
	 3ursmoFWWBumPWtdg67LZKNe01/fy1VOk8yHcrkkE9RWbe6HgS9G8Oz5es5I1sAvoqT9H
	 QIuQdSNhaBfj1SsNQ+rrleoI3FnPmQMllBMcpm1n8juKr3MUsOJFnOIj2b757m3pGPtxL
	 XLWKkaqu5NQqW++juE6Zf6p0dNfpVCuZfx4074g+p6e0h8OOeI3yTZ7/UPc7VTeDsKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D+32su64;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34EC606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:04:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E34EC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D+32su64
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so3388196a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795655069; x=1796259869; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KIktabnjHCDieeGWMO0z9Hmbrz6ngvKHiYWHyOgAZAA=;
        b=D+32su64yEFSWiFy82d+DObqCez07ncCZym22RZ0XHEzbtrSdvgbcUX6G1iliu8nbw
         9NEEBCAi8VkNV/bf8UUrOjFf7RWNb4XYVF7ruEihFZkAzGVF5wY3QD+F+56dyChU0lb7
         aB7VPJVuqGe3sLH769vvgEfgmtX6k0hpB1rvJjk0Rl83rLpa759tLyNSnLZWzVR4czmc
         HFRdp9BjEt6+Q89k8KH2sh78Ha7leOtjVVC6XAZpHzi+gFcu4dcS/MQN7EzK+4nLRCae
         xh+GxmNy+EM1UvoWgVm/191Zfjr+KZVoYjz6iSiaSmsN3i3dcNxqFYCNevP6gXYKuptn
         n/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795655069; x=1796259869;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KIktabnjHCDieeGWMO0z9Hmbrz6ngvKHiYWHyOgAZAA=;
        b=L8ubk5fmR+4qDvpmV8Y3iIGOlBWxsI1u94GVUlb7wAT4MMggqCp62la1Fg8rzYkLVS
         FfRTR7Tb23D3QGBBWrNxs5spqrWw7t1MI5+zBuI6jIAh6J3ZP/UEFzY0/0QnC5LJkZWd
         q389hUbTJKyHkSU7k9szmXqVG7gZ25ly/R9gfcBwEeoHH1BQxYCdhyGiOYTSO6o8/iZN
         iFdILVMjP8dXRBSnKpTCjrNIQoKCy9lOKObfamD3T4RrbmoCdv2X0KMYaahRGTKigmEg
         UKNDfN7kecFaXgFwi//Fk09Rpag/k9o++RpKq/OZwEFTeaYoeZwsAyWt0gcnkUQuv2Ir
         YnsQ==
X-Forwarded-Encrypted: i=1; AL+hErEFlwf0BvJeoYbFOa5ruEGqYN5jaa2M1VNLwC4AVaMXGpo4GQ3NNKIsCF7twKP6k0NBobEZaRSLvzYqvDU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/941j0EuRPL3oVVsd3b+ia4nZAEPxUK71JJpN0AJCDBdT5JD8B
	d4gF2sQ0HoTYQ+k+BpfSKZ3upqrfurvGaIIuDpkV1R0bWC/XHR9yOc7W
X-Gm-Gg: AZFdTZcj2NRpf+PDGDWCjejtwb746TIZCiPUGpbwJpsJHCgvsvx7VXk7NefChJWgnMZ
	k7y/dOZYUPqPvdgHHsV4J2P1mIbMthRmsRXqvfi5n7imGyvDK0BfbmuoOSwLQo5AO3TAeFZrSaV
	8Vt7R/PLY/bZcE0TBU6VmL0HOcoYcvFf/MJt0AKNntaKMJHp1ZKHTOSlWgWyNIOtT7l0c9iBWir
	OZT7YqhOiw4fngBr8nPrOHDne3V6nf8VgOCObNVrxAE4D1Q3VzIH1zEwmsdonuuLFt+WIvKTqTq
	bp/KCC17sa51d8lErmuWqqA6ShRKsOSc1oPE0MU5P8B08ek9dRZm1lSv+gqC0m+AuDy2u7vumYT
	EWxlL4zYM0lgy/S8BFaMI7hSn1rYowxkb9eJLgATs2Yek2lhorZMXqmxtDvvtFG2/eYbCvgVibG
	wqAT+XjBHjZb7mKC2r2jnHe5QZeopjARToMgUatWJTfG0sc4dtp8YPJ4naa7emeB6Fe0MXaoBIw
	cOOLNYW/empgWNiMK298KdWo2FwPWxs5FpsaARi8DceJ77ZArbeiTPXNI9gKHzISR/XhY0K4T0z
	rZwL7lmq3KWCcx8jbH84/hEbLQVMMumdD1f5H3Yvn285Be58kbwxSbOkgqUeKJYeXnHTnqpASAL
	u3aGoABu+OnYUKFrIs4spc3AVNNLbMuub2g==
X-Received: by 2002:a17:90b:268f:b0:3b3:a421:7e00 with SMTP id 98e67ed59e1d1-3b41c8d4831mr17552841a91.16.1795655068912;
        Wed, 25 Nov 2026 17:04:28 -0800 (PST)
Received: from localhost ([153.61.198.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad92c07sm30289984a91.13.2026.11.25.17.04.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 17:04:28 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 01:04:27 +0000
Message-Id: <DN4QLI2XAGO1.2DDIFJ49PNRPS@gmail.com>
Cc: "Emil Tsalapatis" <emil@etsalapatis.com>, <bpf@vger.kernel.org>,
 <andrii@kernel.org>, <eddyz87@gmail.com>, <memxor@gmail.com>,
 <daniel@iogearbox.net>, "Sebastian Andrzej Siewior"
 <bigeasy@linutronix.de>, "Clark Williams" <clrkwllms@kernel.org>, "Steven
 Rostedt" <rostedt@goodmis.org>, <linux-rt-devel@lists.linux.dev>,
 "Vlastimil Babka" <vbabka@kernel.org>, "Hao Li" <hao.li@linux.dev>, "Andrew
 Morton" <akpm@linux-foundation.org>, "Suren Baghdasaryan"
 <surenb@google.com>, "Michal Hocko" <mhocko@suse.com>, "Brendan Jackman"
 <brendan.jackman@linux.dev>, "Johannes Weiner" <hannes@cmpxchg.org>, "Zi
 Yan" <ziy@nvidia.com>, <linux-mm@kvack.org>, "David Hildenbrand"
 <david@kernel.org>, "Ingo Molnar" <mingo@redhat.com>, "Will Deacon"
 <will@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Waiman Long"
 <longman@redhat.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v1 1/4] bpf: Add call for selecting kmalloc or
 kmalloc_nolock at call time
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Peter Zijlstra" <peterz@infradead.org>, "Harry Yoo" <harry@kernel.org>
In-Reply-To: <20261125140902.GE2668804@noisy.programming.kicks-ass.net>
References: <20261124060357.11700-1-emil@etsalapatis.com> <20261124060357.11700-2-emil@etsalapatis.com> <DN38HGVL8JHQ.2ZVZQCKFXVA9T@gmail.com> <awWRZ9xCzWLnj_R6@thinkstation> <20261125140902.GE2668804@noisy.programming.kicks-ass.net>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, Nov 25, 2026 at 06:09 AM Peter Zijlstra <peterz@infradead.org> wrote:
> This is absolute atrocious shite. You cannot attempt a spin_trylock from
> NMI context. That thing might be a mutex.

cannot spin_trylock from NMI _on PREEMPT_RT_ ... correct.
And the patch guard against that.

On RT the nolock path doesn't reach zone->lock in NMI or hardirq:

  __alloc_frozen_pages_noprof()     alloc_flags has ALLOC_NOLOCK
    alloc_nolock_allowed()
      can_spin_trylock()
        if (IS_ENABLED(CONFIG_PREEMPT_RT) && (in_nmi() || in_hardirq()))
                return false;

fwiw kmalloc_nolock() has the same check.

> This should not work; if it does, that is an accident we need to fix.

It's not an accident.
In NMI only !RT SMP kernels reach the trylock.

