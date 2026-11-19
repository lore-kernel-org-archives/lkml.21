Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795098968;
	b=3u8vLk29GDL2QtI6qfjmDgIK2Bm9MxowPX0emnsVZbDwkXBYr64MgEw5DzNmKuEip0bW
	 EmhV7K47/jPbrRj+zdH89CdOF/ciZLioEnveT9AdaGXJA4eVjJMbm+HmdxiGyETwTvgBp
	 var2gEcn+MlY2VSAX4HxhsCUrx0XLWLs126H0E1ANuFhx60mFtWPB+SOhTcJx46ysHZIb
	 WcVD8ziKiPdLb5pYXyx78176h8tCsrS2TfpmYzV9ohkJcQvHqEhSTHEgxRc5/MwGTDrz3
	 y84DS3C/9Lyj1fXVZyHNUb1e6XlKeBspQ8GLk+Ss3AXvQ1vftNg9ZeKVhlwv+kKW66A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795098968;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=jq7QluxFWPHAuK60qLtOSJq6FvP6A976D+oHoxb50WU=;
	b=IWIxDIy70Ji243nq0D4VRlU0m8Z/9ZNx/DWXa5roAz/qO1ogiXpDk79wunr99hXaplwy
	 qFVq7+zs3cRshcv0XxQEZr+WJ2NGi/K7biZS8tsazIFzWmorcFgKOyABzwZbYKlR8RWg7
	 UrVez3C4l0M6RpLjdkfKGyDy2m4+689j4BahvaJ9eBieAEKAccOmGhvThzJ8M9brrnXo+
	 6PaFQ4lR8Dp7KLmu2ieruHxhWpLJXE8cWnVTqL+NFRlfRERwzjQN7SYoD+BRaVVa3/j+o
	 9Wwh0ixY5W3p0aNkVclE+5atQUopFNdU73Y3rDAuCyjf6SHx6mv4z9Vv2Tl59Jbs+5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Faqaxe9P;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=FiSXS6yC;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0915E606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:36:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0915E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Faqaxe9P;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=FiSXS6yC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795098966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jq7QluxFWPHAuK60qLtOSJq6FvP6A976D+oHoxb50WU=;
	b=Faqaxe9P8CiHiZH3Ul/6hRnT5L3rbz2UaVoMT2p7I7fpA6jGVUAZvnOfTMWmoJv7kmdRNR
	vV9q15mnW1aT8NG00ian3QFQi8wSND6i04P/ukBo9UHRnx430Wj6Z45uANYjcl124KWfYN
	OuB24dGcIRvXMUjqW9KJjI2XlufYReY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-501-Cfi_v2THOJ6JUoGqU9J4Zw-1; Thu, 19 Nov 2026 09:36:05 -0500
X-MC-Unique: Cfi_v2THOJ6JUoGqU9J4Zw-1
X-Mimecast-MFC-AGG-ID: Cfi_v2THOJ6JUoGqU9J4Zw_1795098964
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48e00f3929bso625328f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795098964; x=1795703764; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jq7QluxFWPHAuK60qLtOSJq6FvP6A976D+oHoxb50WU=;
        b=FiSXS6yCOufYiTlGUvdZm74i00rEKHl5MKL78teZJdohSVEay22CNDKlce/cR70GHc
         QA31hrGFSayAUsCKbDCPeXOom52Iq3LeoJE7FuKnYcwwLhksgap6zoD0WdgpQlRSA97b
         rbmzHUEEoGn6J+PiPvXSaCX2JtkY7mb8oBGTkGtFyh2eWoIleVn/Uf7aPBfJWIe6EYet
         tT3fKCz0o6YQX87iNeuR/HnNSbLbIZ0YgTcIPjrG16KJfcQuhw9Y4zUE4mr0w0lMp9dC
         kqK1OU8/jCN0PQxEZAeSYqWUkBFBTBTVs0Ikh3YAHXDKf8hchB0edan9JXGLuYMPEX1z
         X07w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795098964; x=1795703764;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jq7QluxFWPHAuK60qLtOSJq6FvP6A976D+oHoxb50WU=;
        b=p8uYXbeKLlSDlTWzkcTms+pyJ1LxTXoppJIZNh9rluRGfAvmpSlzmfH2P0W2JhVhEi
         QoYF8G0Ks4OILhjerUxP6+nHvtvIAhLk+pQ8WkwGWdHmsiamwgyi6Aq5JNEKKunKiKbG
         lJK4NHA5ul9Jv1+W2OdIiVh0YaoxDVMPZX4M8yH4KJSA48zP/4t97rhaf6tjx04kS0il
         eW0XMLkemM3e6fpNGj24l58mdvbCbnM/c5vEwG916sQL9F1sp6TObxkoJ3JJIC+0UvXf
         ur8G8NqHMotkV4qdGhYnS9TpFMV89etCgPoLUzCFQBvm7AeNVqlFsDOWIjX3IXKyRan0
         PZyw==
X-Forwarded-Encrypted: i=1; AL+hErEQ1u/btF5bwfzCVXWl3K49yI1BRgFhASgesVHfLIbq0inYRL2dCiJvB85tz2vJZ/mI/XLNt5mJGPpFPco=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AkzHbX8Vn+lhfi9B+BFO2CqrnPOhaR5jeHg4YlfyS21m2szam
	x50WgveDXNQ/At3UVHcv3kLpxdiqlD6eKeChMo3zCjC1gnmDAo8saWtmOsiIadxi3yEHSEyGkwf
	6vyxC0HkHN5bY1XzZjqTTQwT4LT4GWhwxsrx+E3b8TlSCK62QwrFf93FgyI896k69DQ==
X-Gm-Gg: AYBFou3Q6XLgge/V9Q85Zf7qSllE1cRwmKvO0O2AfcfroUNhxGBRhK68Jq7Zgx+6R7a
	m0584bIEqvwuzZRHGrNz4Xq+MUdOjKSgq1brYFDJB0SRV7G2Sy2hu2rVXAplkVjq4OHN6FNNjBV
	aDPr1dMk9iIO+/W4S0M+efMTbvmVGrUOJ3YudgFr5UVtwe9RjkoBzVg/xccKiRr76AfHsrvW0/u
	0N9YUYthIH7HIwH456ufiD/VtRbssN9FcyJFEcpwMzhRfH7ROiyVCP6wfA6+cJuxgox2/ziC5Jt
	HmGOtbbQ5VcKv4YYylb/TqJ2o2F111BiLnIN/HBGXtRjpHfLWb/R4CUxBRuDjRxbcqJ+/6BQ526
	XRUUJjNJ04HNtqSeP088966nhmWoD9g24qdc+W1ApaCeUHv96VpFcNrSktzWRs64o2fw19U/meX
	e/42A=
X-Received: by 2002:a05:600c:4e86:b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4bb8609ad6dmr30007655e9.0.1795098964167;
        Thu, 19 Nov 2026 06:36:04 -0800 (PST)
X-Received: by 2002:a05:600c:4e86:b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4bb8609ad6dmr30007085e9.0.1795098963704;
        Thu, 19 Nov 2026 06:36:03 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b8429sm1879735e9.14.2026.11.19.06.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:36:03 -0800 (PST)
Date: Thu, 19 Nov 2026 15:36:01 +0100
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
Message-ID: <av8JUXtjhd3PoWL7@jlelli-thinkpadt14gen4.remote.csb>
References: <20261109163616.195264-1-yurand2000@gmail.com>
 <212c244d534ee1fdb0538a980789e16c@kernel.org>
 <20261111175657.250354-1-yurand2000@gmail.com>
 <58cb2cbaf82c0f671213eaca46465cd5@kernel.org>
 <av7cRIyAMoiIR5k-@jlelli-thinkpadt14gen4.remote.csb>
 <20261119152744.3a2f7aed@linux.fritz.box>
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
In-Reply-To: <20261119152744.3a2f7aed@linux.fritz.box>

On 19/11/26 15:27, luca abeni wrote:
> Hi Juri,
> 
> On Thu, 19 Nov 2026 12:23:48 +0100
> Juri Lelli <juri.lelli@redhat.com> wrote:
> [...]
> > > On Wed, Nov 11, 2026 at 06:56:57PM +0100, Yuri Andriaccio wrote:  
> > > > - `cpu.rt.max` only accepts per-CPU settings, so the global
> > > > "default" is removed. Removing all overrides means the cgroup is
> > > > a "max" cgroup, while just a single override means that the
> > > > cgroup has its own budget.
> > > >   + This new interface disallows zero-runtime overrides, as a
> > > > zero override is equal to an empty override when there is at
> > > > least one non-zero override. As an example: [<CPU0 10ms 100ms>,
> > > > <CPU1 0ms 100ms>] is equal to just having [<CPU0 10ms 100ms>].
> > > > This seems a bit odd, how to make this better?  
> > > 
> > > It's odd because a missing entry means "max" when there are no
> > > entries and zero when there are some. Can a missing entry always
> > > mean "max", per CPU? On a CPU that a cgroup has no entry for, its
> > > tasks would be served by the nearest ancestor which has one. Zero
> > > then becomes a regular value which is shown on read, and the two
> > > configs in your example are different. The former can't run RT
> > > tasks on CPU1. The latter runs them on the ancestor's budget there.
> > > 
> > > This means that a cgroup can have its own budget on some CPUs and be
> > > "max" on the others. That is a fundamental part of the interface,
> > > so I think it's best to get it right from the get-go rather than
> > > starting with a restriction.
> > >   
> > 
> > Agree on making zero a regular value and on a missing entry always
> > meaning "max".
> 
> I think "0" as a regular value is agreed upon by everyone :)
> But I would avoid "missing entries meaning max"... See my previous
> email.
> Basically, I think a cgroup should either inherit from the parent for
> every core, or define a deadline entity (even one with 0 runtime) on
> every core. Mixing the two is, in my opinion, problematic (for example,
> it would change the serving reservation when a task migrates from one
> core to another)).
> I hope this "all-or-nothing" approach is acceptable...
> 
> 
> [...]
> > Making a missing entry mean zero at the top would bring back the
> > ambiguity you pointed out, so what about keeping your semantics and
> > adding a validity rule instead:
> > 
> >   A cgroup can be served by the root either on all of its CPUs or on
> >   none of them.
> 
> As mentioned above, I would be even more drastic:
>    A cgroup can be served by an ancestor either on all of its CPUs or on
>    none of them.
> 
> What do you think? Can this approach be acceptable?

Yes, works for me. The example I gave is just the extreme case of the
problem you describe (the "other reservation" being no reservation at
all), and your argument covers the nested case I still allowed.

Tejun, I think this still addresses the original concern: zero is a
regular value with a single meaning ("no RT on this CPU"), and no
entry only exists for a cgroup that is "max" as a whole. It's not a
restriction to relax later, though: a task changing reservation on
migration is what we want to rule out.

> > In practice, a cgroup whose parent is entirely root served (e.g. a
> > top level group) has entries for all possible CPUs or for none. A
> > write that would leave some CPUs served by a server (or zero) and
> > others by the root fails with -EINVAL, like the existing admission
> > checks. Further down, a missing entry is fine and means the parent's
> > context on that CPU, which is always a real server or an explicit
> > zero.
> > 
> > With that, per CPU:
> > 
> >   - no entry: served by the parent's context on that CPU
> >   - runtime=0: no RT on that CPU, shown on read
> >   - runtime=N period=P: own server on that CPU
> 
> If what I wrote above is OK, I would just avoid the "no entry" case,
> and I would define the interface so that missing entries are not
> possible (for example, see my previous email: we first set a (runtime,
> period) for all core, then we can override some of them... But not with
> "max").

OK.

> > > The root has no ancestor to fall back to, so a missing entry can't
> > > mean anything there. It has to always carry an entry for every
> > > possible CPU, which defaults to zero, and reject "max":
> > > 
> > >   0-127 runtime=0 period=1000000  
> > 
> > Also, related to the above: on the root these numbers mean something
> > else (how much DL bandwidth cgroups may reserve, not a server for the
> > root's tasks), and showing them in the same file and format is part of
> > what makes the example misleading. Would you be OK with dropping
> > cpu.rt.max on the root and exposing the parameters through a
> > separately named root-only file (or the existing sysctls)? That way,
> > having no entry all the way up consistently means unmanaged FIFO/RR,
> > and nothing on the root looks like a budget those tasks share.
> 
> Regardless of the filenames we decide, the defaults for these settings
> indicate the fraction of CPU time that can be consumed by all real-time
> tasks that are not in the root cgroup, right?

Not quite, I think? They cap the bandwidth that can be reserved for
cgroup servers, so they only cover RT tasks that are served by one.
RT tasks in a non-root "max" cgroup (with no configured ancestor) are
not in the root cgroup, but run in the root runqueue and aren't limited
by those values at all (sched_rt_can_attach() lets them in
unconditionally). Which is the kind of confusion I'd like the root
interface to avoid.

Thanks,
Juri

