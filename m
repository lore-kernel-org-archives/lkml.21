Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795191535;
	b=O0L6PYjT5ynSLrBw4cly3jR/A2sKPsHV4zbJP7V2dIYzsWT8XIMPZ8Jm2jXZQuo0bH7z
	 COg1wGVNcfdBhmJtQ9wYis10w3fM1bcqwPaKx0SOGXRJ7w5Vc/jXcU0BgOHHQICYTtXza
	 n9QVY9QR07yGNM/PNnY/k4BgSpaEykVgjja8H7m5b5SzJtotz/xI0Ukues/aZgHgmOKWm
	 m3EqWtkdDWT4f3rHND1jANdjV4N1i5Br7+Lfu1ecm+5o2fY9OAUXaYlxAnU1iq8iCh/Mf
	 G4o3+stx+t16P1sf3KeC/PqZpJD0rZOIEGo3uLPYn9mCh3Xv1knDhN5N2xxyoTncVFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=BrCnzItk6Eo8xbqsyLw/nHqEQlRmEOOyoUz0lwAU35A=;
	b=ThOmEjNPri/kDdshvkQCLYPglKg7n9KMegVUc5enur9IRZxUCMWjqwfMYEBPD56J0lUl
	 zLbmM+a7s6K5GfxkCwBUhCGJJBm+2e5cikr+iQdCHxCu8gXLOy3wWWghjt4SZ+F2gI5Bz
	 7PS815M1X1HaY86eyoej+TVfrcojIXj9L55+1RM4SqsnTIPRMqJw6mb8G0RDUFXpoAo/F
	 5qGm+QtsnJJqz0WU9QH10iz2WIRydCWEkwiSMn1/9KMgFZgLVNQT0uWDpIUbFfavyZCw3
	 Z1eB5790CYcNTi/QMcaiNild1rqmM9cKFLrSyUMVz+4O5ZkZbjHtmLydbJeMWYHstQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ymi1AMt7;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A0060A2606
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00A0060A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ymi1AMt7
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso10081115e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795191533; x=1795796333; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BrCnzItk6Eo8xbqsyLw/nHqEQlRmEOOyoUz0lwAU35A=;
        b=ymi1AMt74EmtO3KpNPeBmxGn936FaAH40b1fjOJSBMNv/rsqDBZ3xw4Lma38K3I3HV
         zk9Pf2EExgDNeuK1Ppyof9RFpYwozgTPJJABmDpweEFNa4uA9q2hiDa7RCcQDSSxfsLr
         uHJjqbltnPBm/SL4GBqH6e7qDuEqvU2QdR5PtyvRfhBnNUm73AJcmMWWqjoU5laS5Mgi
         GkoHBUrbCTVv1mEaLLgyNLOQugpSqSDEe0xCwaU6sARJ0Sfqbb+mdOEy7u6wEuv6J0Sk
         OfZeUbzzvKBY9pdpBzDRzciqNPFizYsC2vF4sOiX/Oq0SoRk8neAm9VOAZq+aEl8eLhF
         Xjew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795191533; x=1795796333;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BrCnzItk6Eo8xbqsyLw/nHqEQlRmEOOyoUz0lwAU35A=;
        b=LCIqRYZu8MlGUlFP7xhmlDfc9xreJGy92jmALD8Zb0u+tj3amI7xGv2gsjxthydcLw
         wNPJWWKI35zWMqJp8lqUt3FG5yDoyQrvCCr8Tq7i15KmDTopxrUD+pjuMfsdUgZq5ku2
         r7zkW1XP84G/ll8yNUaI6NqeDGaCinUnB6ivWglzbgWLpPRVjK74kROHOXmUx+2v8B76
         ZLoA1PkK1VfCYQsTuC0jZBDbjaaqOW1QwGNcPSf447jCx2Uhn8paYy178OEos6xzmfhB
         0axRiV2I+MukXCVBPvViwPkroxKybSEg3GdFj/mF3e9vx7hxRDYV6OrEYBYp5GnisdPo
         TEEg==
X-Forwarded-Encrypted: i=1; AL+hErFaeOieCtTBFBuo9pa04hX4+3kvPDIU95227Rm7eyOnccfrjlZCgj5Jdhi1ifrlkcDFHxPoMIQEoRM93ww=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AXNoNHhAvCyBzbBZ95on9E3H4O/GKzkOQlpadPbI9vwJAI2NW
	UIFWlua4T0Xt1AHTvh3k5+0ty+98Kgtvou7TlghYu1ZVy/Ub3soDVV3G
X-Gm-Gg: AYBFou1tlR+WCqHol77eJlyxf/flDwR+q0a6uQ2LDbn09uWHNCGMunxF3cQByKqwoAC
	/k6d8fxmYnRs9VfP9OAP9XBzfCEgWaxy6e9NgL8Ll1IPU/hKNb/SGINA1gA76Y37+f3kIuAX+sv
	00arGypS97DwJSiwAhuQIJLupzJnFTdxrtpikdLgYHUclOsuVFtpVeP1xS2vBhdBJWPmJ391Eb3
	BUvtQfZQ/iojR+M6nNKV9g8TMEpe3k/V/dAy0X+eptAlYHGeUVDVIsuAc+d1m2QAUbQnMes6+4a
	roSMeAZmWP195WtRz3d4+ycuVQ4iceDEA17u+fZ+OURA1rKHdhfF4uYkilyMbhQLx4Zv/oPRr70
	oMIaeAAxKMgNRcN7YxklAX47gXPpUUAc7t80DysHKKNCHegzuECCc2HLNdj5EI1aHPubB3w50Pf
	B8qcZGVuPHwqf2lio84wWGtCEBqVeQmX9Ob8VuTdeSWvW260zY4QXK9rgPCmyFxpE88QnOChC8/
	gKKxk+0vxwdVj9uZLlf0CQf+Ywh62PWFtMjI/s/6+9IT6nrrgxP6TcGnL0X8PkuFm13QI8b6KNI
	ySBCNfvpdJrxlK7KsCGgs6BfCrqqED3M3BCYHQGCYuywJYnwplY2Nfb+TtkfgIQiBg==
X-Received: by 2002:a05:600c:3b1d:b0:4bb:6991:2330 with SMTP id 5b1f17b1804b1-4bb8881a890mr80104035e9.22.1795191533093;
        Fri, 20 Nov 2026 08:18:53 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f278dsm47042095e9.0.2026.11.20.08.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:18:52 -0800 (PST)
Date: Fri, 20 Nov 2026 16:18:50 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Usama Arif <usama.arif@linux.dev>, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, kees@kernel.org,
 hpa@zytor.com, gustavoars@kernel.org, ardb@kernel.org, hca@linux.ibm.com,
 nathan@kernel.org, ndesaulniers@google.com, morbo@google.com,
 justinstitt@google.com, linux-hardening@vger.kernel.org,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org, riel@surriel.com,
 shakeel.butt@linux.dev, kernel-team@meta.com, rkeilty@meta.com,
 atish.patra@linux.dev, dgreid@meta.com
Subject: Re: [PATCH 2/2] x86/kstack_erase: Use REP STOSQ for large stack
 fills
Message-ID: <20261120161850.5b5fec5e@pumpkin>
In-Reply-To: <20261120153539.GW2668564@noisy.programming.kicks-ass.net>
References: <20261119213147.1094488-1-usama.arif@linux.dev>
	<20261119213147.1094488-3-usama.arif@linux.dev>
	<20261120104534.GO2668564@noisy.programming.kicks-ass.net>
	<20261120140200.53ec2557@pumpkin>
	<20261120153539.GW2668564@noisy.programming.kicks-ass.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 20 Nov 2026 16:35:39 +0100
Peter Zijlstra <peterz@infradead.org> wrote:

> On Fri, Nov 20, 2026 at 02:02:00PM +0000, David Laight wrote:
> > On Fri, 20 Nov 2026 11:45:34 +0100
> > Peter Zijlstra <peterz@infradead.org> wrote:
> >   
> > > On Thu, Nov 19, 2026 at 01:31:08PM -0800, Usama Arif wrote:  
> > > > +#ifdef CONFIG_X86_64
> > > > +#define __stackleak_poison __stackleak_poison
> > > > +static __always_inline void __stackleak_poison(unsigned long erase_low,
> > > > +					       unsigned long erase_high,
> > > > +					       unsigned long poison)
> > > > +{
> > > > +	unsigned long count;
> > > > +
> > > > +	/* Short spans do not amortize the startup cost of REP STOSQ. */
> > > > +	if (erase_high <= erase_low + 512) {
> > > > +		while (erase_low < erase_high) {
> > > > +			*(unsigned long *)erase_low = poison;
> > > > +			erase_low += sizeof(unsigned long);
> > > > +		}
> > > > +		return;
> > > > +	}
> > > > +
> > > > +	count = (erase_high - erase_low) / sizeof(unsigned long);
> > > > +	asm volatile("rep stosq"
> > > > +		     : "+D" (erase_low), "+c" (count)
> > > > +		     : "a" (poison)
> > > > +		     : "memory");
> > > > +}
> > > > +#endif    
> > > 
> > > Gemini seems to suggest 16-32 words would be sufficient to amortize the
> > > REP STOS setup.  
> > 
> > That really does sound like wishful thinking.
> > Especially if you go back a few generations on the cpu architecture.  
> 
> How old? I mean, Interlagos old, sure, but nobody should care about
> performance there I think.
> 
> AFAICT Nehalem and later should be good with the 16-32 words. As would
> all the various Zen chips.

Have you got an accurate source for the setup costs for 'rep stos/movs'
for the various architectures?
I didn't find one last time I looked.
Last time I measured rep movs I was using mfence to synchronise with rdpmc
and that takes even longer - so you only get the per-byte costs.
(You can use data-dependencies which have minimal overhead unless you
go back to to some pre-zen amd cpu.)

You get 16 bytes/clock until Haswell which will do 32 if rdi is aligned.
Icelake might increase that to 64 bytes/clock.
Agner has zen2 onwards at 32 bytes/clock.

Agner also has zen3 and Icelake being able to do 2 writes per clock.
If that is achievable for the writes being done (the loop isn't a
problem) then it also takes a while for the 'rep stos' to catch up.
(Then you have the cost of the I-cache misses ...)

David

