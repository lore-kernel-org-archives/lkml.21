Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794946859;
	b=kzX38opFKkT0ZyJYVu+KE8x0gVnk4J42QVysLqS3HLxowlsXoWIfxxVXVp0pO5fVnY9F
	 P+hKAB0JS88ip+ywWXdJd6CKP/rnCnxGubl8kwxpoNsXdpMjGwVTqyr48DQuP5zyhKUOH
	 sgyq8GNIkU7fXITP7YPJJlF/ubtK6bzEVq5pN8mmZ96z+pNKR0EcZ9qu/u2GKN+EkAV+O
	 Y16Rr8Usw899M7Cr6bHhlOKACjj03QxYotewlKXJ7gtinX/hdOqX+lQ1UnqGYZM3sSqVy
	 OSJ9TJn38YCExKdOlelZGKJ/2TLhEu+lgu8bPjv8NBYigWR8GkBdoZ6fwJygOUu3VBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794946859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=wJnPRAtsIC+/lFKvaSJITyDCcMmwBTIjrSEQdzWYjus=;
	b=Adi9WGxynjAPUowiTLVO14VgBQX0J71vPX+MJSKJVTPYOuqnIBcmxKGlQHvhQkFY75Au
	 FLUB19+yAhpdpQjIk3omEg2SNZace0oWALD2fn1JxdfFRK6py4DJLA/Ex7j8l/o+ftTuX
	 LsuqhcDbVmkrgdNjefjfO/UWouhJ1BhZaaadLtowH/x5W4KxCGSYAMD1thFjiVEBdZhf7
	 04ZL/0c2a2udDPr4nU3YLtgrE5qPVUEg4wkkL2ojELRdzOyHQxuO23R7Go7cmJi6S1i8Y
	 w84c/5I0sfBCYJA7kLkT4ztJB7GuBFFweeVTxo1RJS49pA56c7ScP1O//Z0/TMY2HAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=S88o5Kgo;
	arc=none smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC487606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:20:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC487606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=S88o5Kgo
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91ea0c05c92so1331516d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794946858; x=1795551658; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wJnPRAtsIC+/lFKvaSJITyDCcMmwBTIjrSEQdzWYjus=;
        b=S88o5KgoxbrveL37wGuRzrzYcnhkBMWsA8x73ywQQE9fX1XVCCpsSwQNzTsH0IdaEc
         uIk3zsaUJJpzsXOe1LRLvGdCokJogPJQyoqnkZ3BufWjQV7YTF2W41whIAEyyV8PS1h3
         b0DAhTvlZiqWDzodzF3E0ioWMOtYgHO5jBkQ/ZXwYOkkb3YrrddxdTIpQgvkRjytAKCQ
         kzR+3nkUZ6SxdTxxbbTfXwtVVs2X34N1uwl0U4IWg2o21sqSKDGKoysZybPATkGX9Cve
         MuqcwLQU+6CPE5Wtbu6DL1GmbOZ0IefvkN29zB0i9Gao81jKYou6GxJEmH3quMDIGtu+
         J00A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794946858; x=1795551658;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wJnPRAtsIC+/lFKvaSJITyDCcMmwBTIjrSEQdzWYjus=;
        b=idO1mq+sbL4v8zWrXotnCfwwTpOQ1J0NW7y3LPNDackE/zlxNQDSuJ6AxwUjy7Q8tl
         YIaEs2xkjq1zU0vh1SKE+CZQWyZQoFUh/IbGPNMwEuFwITOIWJmyvYHh5a1IK+Mefs56
         tWLGSpRlXVkD4MqTFL6WorLCm6SghhK11raFWMwbRAPoMIlNLinW1OKQJyDZccs4kaGU
         o+Ag0OsJn4TGF/i8GmjuyvfRlvg0yJV1WWysATaIVYUOA8b8QOxcfQRxzyK+aaqBxNUg
         /PA2y/f5F5A63FtMjSoJXSlPrTkgRcqfYc5B5ZwJsEPcuqN8f65quxr4UOQdKUXLrStI
         lUyQ==
X-Forwarded-Encrypted: i=1; AL+hErGE+453nHkLXtBsc6t3MNmRkww9/5SHtgZ4sDEuCchBp17nSkBmSeYxK42hKwSuo2JNfJIkfoify0g2J5o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0/hwljFKcoYUpS2d++iH8s9CoE2QESpD4npF3wsJ1b//mhv/K
	Y6p+vdq3JvB5PobsEXVNjCB1rbTpiKgZ4pFtIN1elGEwSBcLftsNVXDt5Wdns+oCOBw=
X-Gm-Gg: AZFdTZeESeBAAtwbGXXaqHhq6cCevmFijPwAdYEiJlLeiOtxSJglqGZCaY5D3EhHmwy
	WbHxr9hL4mVhRywMmYWbalsmVIbn5t2Ptxe5bNDN9GPPsL7u2TubITdgVWA3f838X5LTN7P28e6
	1UenOH7Y2v9ekzyoKxvRZBK/SbHXnKw4ifN8TCDzdubZVkiFp/tWwVR4j/UXXiDyl40xAy9vPwZ
	VmL4Hk61LhvpjDg2oBL55luxkMBG9Hc+7ckkqCfhhTqUUz019qKD4w269hIDaCwHbl/Ia0ySUC0
	iM46cHHsbMWFdB5HvYra9Yk0Vd8pw1vOKCNxdAyqyaZbBB46bj7CDFMxkP+uimE763HjD1YHx3o
	BLdzn7FOXQ8ECucYy4zqVA7+ZOhrE3Uww7IV4qiqtIiH/SKqe47uBNXFzwzkGdBoXDaaJaea88C
	Gh1Ru8ThCaNL4B4hGH1Hu4dq8pe2B3YVaMWiRFqle65S2DK7nVpQ5dpedzAPBRo9NUUvRPQFWQ/
	YPJNTzUIWq0ZlvtujiB84xp9Z9NosTSdBUx40GZn9rxU88OAiLI5gI6SMZMnN9UiVytDYT3GdlP
	K+2S4Q==
X-Received: by 2002:a05:6214:3018:b0:91e:97a9:cf02 with SMTP id 6a1803df08f44-92114d84a69mr5475416d6.11.1794946857364;
        Tue, 17 Nov 2026 12:20:57 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d70c72sm2569566d6.33.2026.11.17.12.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 12:20:56 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xTPfj-0000000DL2h-3OIS;
	Tue, 17 Nov 2026 16:20:55 -0400
Date: Tue, 17 Nov 2026 16:20:55 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, iommu@lists.linux.dev,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH 0/6] rust: iommu: add a paging domain abstraction
Message-ID: <20261117202055.GA3115493@ziepe.ca>
References: <20261112-b4-iommu-domain-v1-0-c29e86788dda@collabora.com>
 <20261116193821.GC2452510@ziepe.ca>
 <3EB4C2ED-B699-4532-A562-68B78F6E29C6@collabora.com>
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
In-Reply-To: <3EB4C2ED-B699-4532-A562-68B78F6E29C6@collabora.com>

On Tue, Nov 17, 2026 at 05:09:11PM -0300, Daniel Almeida wrote:
> Hi Jason,
> 
> > On 16 Nov 2026, at 16:38, Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > 
> > On Thu, Nov 12, 2026 at 02:00:07PM -0300, Daniel Almeida wrote:
> >> This series adds a Rust abstraction for IOMMU paging domains. A driver
> >> can allocate a domain, attach it to its device, map pages into it, and
> >> install a handler for its faults.
> >> 
> >> This will be used by the upcoming rkvenc driver that my colleagues
> >> Detlev Casanova, Nicolas Dufresne and I are working on. More details on
> >> this driver can be found by watching Nicolas Dufresne's talk at LPC 2026
> >> [0].
> >> 
> >> As part of the security model, each client will have its own IOMMU
> >> domain. This is needed as the submission model will let userspace set
> >> most of the encoder's registers directly, so the kernel cannot check
> >> every memory access that a job makes the encoder do. With a single
> >> domain, one client could make the encoder read or write the memory of
> >> another client.
> > 
> > How do you plan to get the paging domain in the first place?
> 
> We plan to alloc a paging domain when a video encoder session is created. Then
> we call iommu_attach_device() before a job runs, and detach back to the default
> domain after it finishes so the next job can attach its own session's domain.
> This is so each session is isolated from each other.

If you do that you can't use the DMA API at all in your driver as you
have to set 'driver_managed = true'. Is it OK? If it is why not just
use VFIO?

Or are you planning DT horrors to get yourself a DT created "DMA
struct" ?

> > Using paging domains directly is very complicated, I'm not excite d to
> > see DRM trying to do this at all. IMHO there are many unanswered
> > questions how it could even do this safely.
> 
> In a very simplified way, this is not unlike how GPU drivers currently work. In
> fact, from a cursory look, this seems to be how rocket (the NPU driver) works
> too. Since we are merely porting the same ideas to video codec hardware, I am a bit
> surprised by your discontentment.

In my experiance any place I see DRM touching the iommu it is
immediately suspect. We keep uncovering horrors that people buried in
there. Yes, you can point to some DRM places doing something like
this, with a convoluted struct device scheme and DT hacks to make it
functional, no you should not copy it and certainly not entomb it in
rust. :(

> In any case, we need this isolation due to the submission model used.
> Most Vulkan drivers know their hardware pretty well, so a level of abstraction
> on top of it like V4L2 is unnecessary. Therefore, in order to achieve a leaner
> kernel driver, userspace programs most of the encoder's registers directly, so
> the kernel cannot validate every address a job makes the encoder access.

Sure, but you haven't explained what the iommu gets attached to (ie
where does the SID come from), how cache flushing works, who programs
the mappings, who is managing page pinning, etc.

Are you sure you shouldn't be using iommufd for this, tied into your
driver? It was intended for exactly this use case, to allow drivers to
delegate their translation to userspace. Though that doesn't relly
solve the questions about what it is even being attached to..

> The fault handler is used in the same way it is used in GPU drivers: to kill
> sessions if they fault. This way the driver can simply refuse further work from
> a misbehaving client, for example. It is also the natural place to enqueue a
> reset if the codec hardware is frozen as a result of the fault.

IIRC no GPU driver does that, they hook the obsolete fault handler not
supported in new iommu drivers not the new PRI based one... IDK we
have even wired this up to work this way.

It is nicer if the HW can tell you it faulted rather than expect the
iommu to do it.

Jason
