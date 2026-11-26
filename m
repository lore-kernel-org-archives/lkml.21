Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710845;
	b=jhFlwaW9ro10IF41CIlwqucsVABzqLZSHQuK3HB8xBrZb+7yTxkK9/bJtxVBRd7kt8x5
	 L6EtDYBI+nFBl0UdEASAD8UI1viycqANKbufQtB7o1hwZWT8TaYUV3hkx1jf9lN/pAS6t
	 DPssQUgwSktRY37/0p9Q4U7YaQ5eBtKFTmT5jLmBvgunOzev+WVqhilnedVgPxcMy37XE
	 JTQvhYoxtzQiJn2YpNeeuYtmClvttAr2br650Z2NztVX62CSCyac/zyMNmRFsabohGzkE
	 g3lRWN1cwWb7RWQ5JBFnhh96G4ItzvirsFpVb+g/9lMuvDtDkstgnpR/3oVdyCXKU+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710845;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=PDQh4Crk4HMl6k2OmnDfKytSQVD4stRFrNvCtlRZkH0=;
	b=GHFNoR+7P++Nvq+yHgvL/8DW4GdvCix9zADjYR6t+jE6Epjgi40UWQr0PlZZWR458+C1
	 wbiGMyItVerWUJ2G3FbqtkdloqwnOpWExyaIcuOfLlHygBBeCHcSlsJu6jgU+kxQGyn71
	 EshIDL6q/sBe9Nv+MOCeOy9Qlk7Cb7zMS6Dfvg6vz7JbtQnMb8j6k2+iwPbtP+LfuQCGX
	 l9ne/jYDP0efqvXz8ZgQHR9NOUfAaZHcEjg4fMJ+C5GqpHWBADyM7U3b9QC5orfv+Ms+e
	 QmHqG2EFNVkCKX6covtlf1qX5dEwXXniDfwiuCWlWsaDZ9rtJc3Ve6iMXZWRUqkPDjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=elQgKMeb;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ofUVuq9t;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96114606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:34:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96114606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=elQgKMeb;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ofUVuq9t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795710843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PDQh4Crk4HMl6k2OmnDfKytSQVD4stRFrNvCtlRZkH0=;
	b=elQgKMebSdzuIhgkztbmSxCP8Uvo6QTd/9wnxUsr71TQiy3+yZF24LJ5/RTgliX6TAOW3P
	VU1quu4BJBWJYjJT7K+tK+worP+zxR0GcTgrQ9Chd/9TRpXD3GA0XP77jDsCIbi9Z/25TR
	vIbhYATnEOt2NrCABK0jy/KQFQUmonk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-b3W--k2FOP6X_21seqgi3Q-1; Thu, 26 Nov 2026 16:34:01 +0000
X-MC-Unique: b3W--k2FOP6X_21seqgi3Q-1
X-Mimecast-MFC-AGG-ID: b3W--k2FOP6X_21seqgi3Q_1795710840
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a204ac318aso34272375e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795710840; x=1796315640; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PDQh4Crk4HMl6k2OmnDfKytSQVD4stRFrNvCtlRZkH0=;
        b=ofUVuq9tTLt7pCnggrubrOqVYuGpVXVUDUIViJOAHlCfZ1BBvc9vgs1Hv/ot4fR/Ek
         EUkKps02ZmBMXgdyt+mWP1yn5YokrL7UTjPFl2sUCfui/KwjJi+CLuXwmW58wvsbn6Wv
         A4gdLft+J0Lp2kqWM/84ZUpqrnGgswWn5CyUXrg1NBI9C6nr5VjI1FYXSf7/h3tPcerS
         N0oQNqAPiGV2EfUKSp0sDfOn7JkDjMmSFUt/8RnSuI/HlbggeMuzgDaKO8EkKHyyA8Hw
         xM6R6ax58zE29qZ/7akaVw0ds4XeEYkHw+Xywp00mrVCxx+BGgNTuiQOjmVjkA569JG/
         xlRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795710840; x=1796315640;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PDQh4Crk4HMl6k2OmnDfKytSQVD4stRFrNvCtlRZkH0=;
        b=Y0imNp95zIOLjyOEfp67GhP/W6wx5eM4ZdabV9GbWyeYxYTZISdscUyqgULP8hJMmE
         ZG1UVX2wRh1qY71JFu35JmOX7tTi0l+QfSlTEI04+8pYSlyUfMp5SDaHeBbaa6x23t/r
         QH3TA0id3fitZ3jVR8gf10zfaN3Bp14pm4wij3O2E/v2aU/UCAcVzqT1moZTkEv5oKgC
         NgHlaBjiNR+edRMg1xrOkY7nN9oa1qsVYkafUNfexrZTW/ojFnErycNh4ibDsQS8xg1q
         QmrgOLa5pht1kSiUpRghxg9swqWWFke8FG9NT1oDUAKhd4KtOYldS83TlhIfN3pC0Qr8
         bbJA==
X-Forwarded-Encrypted: i=1; AL+hErGlpqf/l5OMTOWeE3Spbr0ii1Hj07REotOekp4HdrdomOsWntOfz/N6z7KkmZtBKrcHEzwpnJNu94g0GAY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hGuY3hN3IZpfCNEeHCAKwW8uFNB/9tj4Cs/t5JnBW/MXt0saN
	UjDSPlNM90DnTf862LzX/vJAF/O+7dw2xlP07MVGNsrh4JK5//7MR4pqy8mjKV4rLj3QTbU1LE4
	1aDWtALGsQuPSsS/srXGDtXPd5K65Qijol6h0x8NlRk5nHRs2nABhauXXJBkXJmNulg==
X-Gm-Gg: AZFdTZfFAstOrhktkRo0lxk5pzWU9tBNxT7hM5eZeg6dT/Co7MnvFXHYY+Gtgk/aJye
	FeTuW594bd2kYGirRIBWgT6/PBzYfbUzD9IA+A++sDGBaEh0MizmieJah14gQsoa3AtR8cZ0Tbm
	latMBnLCVe9j9k2ClLquxo81blezm6vq3Cdy2JT1TIMKMGO/s/9SkEW6FTS9ZsAt2pb2aEkx8aQ
	5Cz/6yOoPGK9YHf5tJLSYepEuq3JQdTqWDpbvPUeZm5oOrbxb0/3UnU1PCbAD3UjLHY61XioTp/
	Yb9nP32deGsaCqqh028B+ORYJeiPmbuWcAjMtzYkz3a5WiZsTsD9SjwBp+LoOQi0UXSEM6U575Z
	WB41ex7d6C2pMPxKA74F/7+wcfl24ogqA5KZuk2OXVEpWeScD2C1LMVbORKSnAt7O1RBehTH5Ym
	/xn9M3
X-Received: by 2002:a05:600c:530f:b0:4bb:781f:6067 with SMTP id 5b1f17b1804b1-4bb887e21e4mr425796095e9.1.1795710840558;
        Thu, 26 Nov 2026 08:34:00 -0800 (PST)
X-Received: by 2002:a05:600c:530f:b0:4bb:781f:6067 with SMTP id 5b1f17b1804b1-4bb887e21e4mr425795515e9.1.1795710840185;
        Thu, 26 Nov 2026 08:34:00 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.146.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bc8ce06sm40151988f8f.47.2026.11.26.08.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:33:59 -0800 (PST)
Date: Thu, 26 Nov 2026 17:33:57 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: luca abeni <luca.abeni@santannapisa.it>
Cc: Tejun Heo <tj@kernel.org>, Yuri Andriaccio <yurand2000@gmail.com>,
	bsegall@google.com, cgroups@vger.kernel.org,
	dietmar.eggemann@arm.com, hannes@cmpxchg.org,
	kprateek.nayak@amd.com, linux-kernel@vger.kernel.org,
	mgorman@suse.de, mingo@redhat.com, mkoutny@suse.com,
	peterz@infradead.org, rostedt@goodmis.org,
	vincent.guittot@linaro.org, vschneid@redhat.com,
	yuri.andriaccio@santannapisa.it
Subject: Re: [RFC PATCH v7 00/29] Hierarchical Constant Bandwidth Server
Message-ID: <awhfdTbfDhpklaTN@jlelli-thinkpadt14gen4.remote.csb>
References: <471bf8d446becabfca00041fb2a78067@kernel.org>
 <20261120120659.2e902463@linux.fritz.box>
 <6fef47e08a37079c08806b3c57994778@kernel.org>
 <20261120212418.10221f2e@linux.fritz.box>
 <06f4c157677f99fc5386dba4c9d68cd2@kernel.org>
 <20261123084345.4e24e3ca@luca64>
 <awQTy09VbrDn9RpA@jlelli-thinkpadt14gen4.remote.csb>
 <20261123151846.3fdcbf4e@linux.fritz.box>
 <awfe_r5McCTzr84x@jlelli-thinkpadt14gen4.remote.csb>
 <20261126155736.20e64e65@linux.fritz.box>
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
In-Reply-To: <20261126155736.20e64e65@linux.fritz.box>

On 26/11/26 15:57, luca abeni wrote:
> Hi all again,
> 
> sorry about sending the n^th message, I just have an additional
> question to check if my understanding is correct.
> 
> 
> On Thu, 26 Nov 2026 08:25:50 +0100
> Juri Lelli <juri.lelli@redhat.com> wrote:
> [...]
> >   P/          cpuset.cpus=0-10
> >               cpu.rt.max: 4-10 runtime=400 period=1000
> >   P/noncrit   cpuset.cpus=0-3   (threaded, no cpu.rt.max entries)
> >   P/crit      cpuset.cpus=4-10  (threaded, no cpu.rt.max entries)
> > 
> > Threads in P/crit are served by P's servers on CPUs 4-10. Threads in
> > P/noncrit find no entry up to the root on CPUs 0-3 and run as plain
> > FIFO, as they do today. cpuset keeps the two sets apart, so no task
> > ever moves between a server and the root runqueue, which I think
> > addresses Luca's concern about tasks changing reservation on
> > migration, at least for setups that care about the analysis.
> > 
> > The mixed config ends up on P because of _delegation_. P's cpu.rt.max
> > belongs to whoever delegated P, and it's what bounds how much the
> > container can reserve. The application only arranges its threads below
> > it. If a cgroup had to be "all or nothing", the admin would have to
> > give P either zero on CPUs 0-3 (no RT threads there at all, not very
> > flexible) or a budget there (reserving DL bandwidth for threads that
> > don't need it).
> 
> Uhm... In my original "all of nothing" idea, my plan was not to set
> cpu.rt.max in P, and to set it only in P/crit. In this way, the RT
> threads in P/nocrit should be served by P's parent (up to the root),
> while the RT threads in P/crit are directly served by the dl servers
> configured in P/crit/cpu.rt.max.
> 
> Would this solution address the requirements of this use-case?

If the admin configures the whole tree, yes, I think so.

In my understanding, it doesn't if P is delegated, though. Moving
threads between P/noncrit and P/crit needs write access to P (the common
ancestor), so P is what the container gets. P's own cpu.rt.max then
stays with the admin, while P/crit's is the container's to write. With P
at "max", nothing bounds what the container can reserve in P/crit, other
than what's left at the nearest configured ancestor (or the root).

So the admin has to put the cap on P. If P also had to carry entries
on CPUs 0-3, P/noncrit would be served by P there: with zero its RT
threads couldn't run at all, and with a budget they'd use a reservation
they don't need. Leaving P without entries on 0-3 (i.e. the mixed
config) is what lets them keep running as plain FIFO, as they do today.
