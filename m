Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795723798;
	b=LdoZUofzplr0Iy1RHt0Q3BXSV2FModwke+xAiFgWEMd0SCUNnfdooa9J5r/OyL9q5tv4
	 jbPEtFSnmAnxaTT3WY/O/v0yqaS1AUNi5ezzCMOZpeDIX3O9s/AoH183YrC89Rr+33VzF
	 1nnwAfsbPYPehWwlTe7A4mOw/lAfjCWDutZDOrJwW/AlibfmxDkj0LdjMupkeBcFiKB1d
	 ETauw/9UJZ9aeGrEyMa5aZLUuVHKVWp8Drt5WydBb+LMVRcoCOAi5FqREmBFqFYY4LPFe
	 H228IR3oE9IGuCvJVCEdI0XwOkZQ866LJgfeLXCqIGU5nD0kSrxY8hTg165cfJqAftQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795723798;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/OrrKD4PbU8J1zBT1VW3T/D/BHUVvLrmnY9knf4JEkk=;
	b=ptC62xt7+81LYlaM9HHkG+oclnai3S9FuIB6DKS0aNFu7eqMpEk9X/EknfWcRvRUYK9x
	 aA7q+BbtZQQFwfzrT9PEftmHI5SpOgkkVD34z76Dl6oaMEPiHTob/GhTJdAyrxvqXqsyD
	 14RUgoxu4L2jsetGCnkzJMuHLQyefDWH+scQjFtwrnnm+6hHz+pbUhmxMpqxsK7jxNq2g
	 GO7H1GQnP/yMn5Sfjt0R/0H921+PfT3S1MTiVD2bgjkNMR3cFXeqMcqp4eSXgfc+9URvM
	 PHOmLQQsaq08M0vtlrKRfcxw7pa0NLqUjlvyz9BT94D+i2xHBnZ6siGPgdL5s3vy3VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dn9pOQUq;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00678606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 20:09:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00678606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dn9pOQUq
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-490d59c3edaso5043604f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795723796; x=1796328596; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/OrrKD4PbU8J1zBT1VW3T/D/BHUVvLrmnY9knf4JEkk=;
        b=dn9pOQUqmIA6QOfUKt+k2aFnxD4sE8qGh9LlHU/8NKYf+C/7yk80j94i2FYny3it54
         bs3ukKO5Kws0wO/QML1kVl2cKdTDNv8mhRLT/ksqWWIvbb/HO8qnU4b0xRRnl1CYWRf3
         FxMAwLQKk4Ki/3rkPq996pKuzlCr8CpwrLAwHz6jk33jzCEv1rlYMOsfIwLGRocp/Kd0
         Zd2TaIF73+Q1EflQ7Y+aiKJixdAupQH8Nv9wa2VGekg1qC9DhbgRntOW2SoSRv4Av1T7
         80yMBniIozPDV53Rh6eBJI0fwIy1E4E6Ri1R980idAbZpw2QN5lHwC6vce7iKQDSzwdt
         tGCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795723796; x=1796328596;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/OrrKD4PbU8J1zBT1VW3T/D/BHUVvLrmnY9knf4JEkk=;
        b=aZjoKTdyEh5dFvZUKrGHSXvKQtqLoNQ+hYQGIj42g+ymIi0LAkxDnO4N1SB0wrdEqG
         PcCTZc7aYtxY+eFhA+QqyRP1G2bmHX8cCsskmc6fbc2d671laHNi0iYp7uTIKD0SWh8i
         yC68tlnY2r8dH/+awFSFKtmx27JTi/Q0BJ+BjvEXjbfFiSVx+BLiCO8RG0/BPrSLSdzP
         dObHPDWvZV5edneI+PDP3Iny1f9MnyBNrHpToGzZnMkInUO3PAXkjH8FGkv+xhhC+9wz
         PnqvhjPeZFG+jy9XIMUiwBBOGMnYXzK95jIxK3z86KX8CRMBVu7MpI+Os9QDrvCMDRVs
         62Hg==
X-Forwarded-Encrypted: i=1; AL+hErEFubLjZXUUbhvBPjDinKPsn0QqGcmORpyOPtU+cqE0kp7RjMGl3uHzvJYG/jzNs3uhpYKVYt8OI9S1nBM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/H+ut9rl7AIXcNbFrHwAKLDzK4VfJp/phI3qzPX3Xn3ocyZ/do
	g4GGL60lr7XeqZ3/3JOjh5soCp/ij51zM4vjnCzTH6vSSrYR6uoURTjIRJb82UwQVA==
X-Gm-Gg: AZFdTZeY5qa1SZOvc7wZqNBBnqotOuW8UiHUWLZanachB6GmqNKwVOLxmUdqca/VrPS
	9mN3ia/cOWT12V1J1muS/cm1Sc0k3psaY4MR3eRAFGDhGRSVpbqc5WyyqiqWLiqSItUprjAVn1W
	86tH46i4ahHtU6X9e3VK13O1yejnbNghoy/bIHRSnGLfBCZ/N0pNabWNlUoN/dGXerdkGQz8MFj
	teMXaeImIibqMpOZbMUVjJ6WcIdVuHwhBDRvy/QGGfEb8RiMd9lmdfai0xBQWDOxkuAP7IZUg21
	bvAqWCBuPX/jnxy7+aJUq8IK3p/L78XUrQE3ez/PumVk7BPqrf1sW1Y7J+vT/fpRVreHBegw/VN
	km6ERMTbl5qQG0ZncphwW6DT1LSv6TuU5NlKwRy4DAZJ1ZdnmdiY73slxbM39PCBRi42Mo19bZK
	NiownsuWI9U4Xex2+NzzKgIZfbWnpWcnrjttK5ryA3iarfxck8bQUMvufGtG4NgTAXRwWzqlq5Z
	BXqCvXWKXlwz/j2Fhsc/3oWSV5WTztj5Lk1BHYHBTr0IsIXrVk+iCQlKcB0WdXatg7d8zqkiMyP
	DBpsI2bDj4Bri+A6qJiam33enP1eCK/UQ3M6A7NByn8b3t4r07jDZlxG8taYhzml2V9E1DvJ8CO
	egmot5+LXK3rHMKcYGb6LyA==
X-Received: by 2002:a05:6000:29d8:b0:4ab:1d39:92c3 with SMTP id ffacd0b85a97d-4ab1d39937emr31825976f8f.20.1795723796009;
        Thu, 26 Nov 2026 12:09:56 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm48791551f8f.55.2026.11.26.12.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:09:55 -0800 (PST)
Date: Thu, 26 Nov 2026 20:09:52 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: mhiramat@kernel.org, linux-trace-kernel@vger.kernel.org,
	mathieu.desnoyers@efficios.com, kernel-team@android.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 00/21] tracing/remotes: Add printk, dump_on_panic and
 boot parameters
Message-ID: <awiSEPZdfQog3o-k@google.com>
References: <20261124152845.2233401-1-vdonnefort@google.com>
 <20261125160106.01c468e2@gandalf.local.home>
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
In-Reply-To: <20261125160106.01c468e2@gandalf.local.home>

On Wed, Nov 25, 2026 at 04:01:06PM -0500, Steven Rostedt wrote:
> On Tue, 24 Nov 2026 15:28:24 +0000
> Vincent Donnefort <vdonnefort@google.com> wrote:
> 
> > Vincent Donnefort (21):
> >   tracing/remotes: Gate tracefs files opening on trace remote
> >     registration
> >   tracing/remotes: Release tracefs,eventfs on registration failure
> >   tracing/remotes: Use kstrtobool for boolean tracefs files
> >   tracing/remotes: Initialise pos in trace_start()
> >   tracing/remotes: Annotate remote shared fields with
> >     READ_ONCE/WRITE_ONCE
> >   tracing/remotes: Use a single per-remote polling work
> >   tracing/simple_ring_buffer: Add support for compressed length
> >   tracing/remotes: Add dmesg tracefs file
> >   tracing/remotes: selftests: Add a test for the dmesg tracefs file
> >   tracing/remotes: selftests: Prefix hypervisor folder
> 
> 
> >   ring-buffer: Use irqsave for the reader lock in
> >     ring_buffer_poll_remote
> >   ring-buffer: Avoid reader_lock deadlock during panic
> >   ring-buffer: Use panic-friendly locking in ring_buffer_iter interface
> >   ring-buffer: Add kerneldoc for ring_buffer_poll_remote
> 
> Do the ring-buffer specific changes need to be part of this remote patch series?
> 
> They probably should be separate.
> 
> -- Steve

I could separate

   ring-buffer: Use irqsave for the reader lock in ring_buffer_poll_remote
   ring-buffer: Avoid reader_lock deadlock during panic
   ring-buffer: Add kerneldoc for ring_buffer_poll_remote

They are into this series because those issues came out while working on this
series and I thought they weren't important enough to be on their own, but I can
surely send them separately.

   ring-buffer: Use panic-friendly locking in ring_buffer_iter interface

This one however is only useful with that series.

-- 
Vincent

> 
> 
> >   tracing/remotes: Use ring_buffer_capacity() in trace_remote_has_cpu()
> >   tracing/remotes: Add dump_on_panic tracefs file
> >   tracing/remotes: selftests: Add a test for the dump_on_panic tracefs
> >     file
> >   tracing/remotes: Add poll_ms tracefs file
> >   tracing/remotes: Add trace_remote cmdline options
> >   Documentation: tracing/remotes: Add detailed tracefs layout
> >   Documentation/kernel-parameters: Add trace_remote
> 
