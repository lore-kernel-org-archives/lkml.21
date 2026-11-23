Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429332;
	b=cHF9PTaro8uLBAgrCT+kl/Q5kdDWlU99USUJTSxVYkV36m7qz/qdfW0hg/zJ75iTHOFi
	 8LaqPHphW2An7WHxIEtxp6vRpihXiRFXSS67UBFKyhDpKgoU2qIX8Z9EsXjcesNfua0rN
	 /lRkOEzUqad+sjjj+lDmalQz9RUNmFTg+PLojbnbnGEqeSsRq4MQ5cav6M6vJIdUQCakH
	 YZ2zMRvTYXL1Mg/NGaZfS+2PayGnj/E+9ZDCn63s64jMjBgvAwgqVqT7mFCmlI2WLxH7A
	 w7OXUgDevX7JQxcprOwJnMWxSXimGgwayDDrdn8QtWJ4JoxRHWKfWr9uKfJxqyp0hJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429332;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ole/VklCtHFM4pZTEWXbIafAoWTcJ4IAxzwf7ff2jkc=;
	b=LaYtNwqt3tS8pfpquogMtMBd8GY8+GmRkWrk7wH2Vd0LGx1VjXyM414wKtuBbbJCzXhO
	 ZEBLABdDwjJah459IuwvfPgaKzrC/lBTNqp9ftdRGfrnkmqPmL18Tsg2wT9XD0pr/SkRw
	 QADekGYDm+5L+Aurmy7M01ck43z5+y/nvjR8BKaEXCG2Wdvyg7NDJ/mLX0/mZ9vEVmxYZ
	 vtg86w/YovyYqI4c4+l+jzTnr1dkq7X1MnGrz5a0MwN61uWV54pBCQ3ARpJq7+OiXdxa6
	 ep8lD7gW0DV9Ot52Q+ykm5LCwuuvuw5lYFZHkz2J3ZfqueHx1Gp5Laz2nBLlb1raQKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YmgzcS5J;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=RbNuqstg;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A35606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:22:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22A35606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YmgzcS5J;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=RbNuqstg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795429331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ole/VklCtHFM4pZTEWXbIafAoWTcJ4IAxzwf7ff2jkc=;
	b=YmgzcS5J3IVBfDDxNQF+32vtaZy7HyIxR2WtUL4J93nDgAaan07Dy/8RzUJUiFI1AhUlsW
	002svm/z6BrAwN5q7aZuBJOwYmMeUh6TVxLBS+TvolFdXHVDWUbuJiDxaa8nKWvYsh6ESq
	GliYR7jS3aGPCUjwBX+r4GFX0PG0Lzg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-414-3P6eWkKtPia4AWD7V92r6Q-1; Mon, 23 Nov 2026 10:22:08 +0000
X-MC-Unique: 3P6eWkKtPia4AWD7V92r6Q-1
X-Mimecast-MFC-AGG-ID: 3P6eWkKtPia4AWD7V92r6Q_1795429327
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4aae099f5baso1380686f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795429327; x=1796034127; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ole/VklCtHFM4pZTEWXbIafAoWTcJ4IAxzwf7ff2jkc=;
        b=RbNuqstgo5XZTIN+Bsnf/FGsNVhN89TZw8roZezK1w8m2/WGWAdsM1dgMxxk+qdTam
         MQGm3tN9pk4HF6QzVBKc+Uid/rLJ/fPeo6jh9mAwVO3GvA6YpEcavf9G3Q1n6esOCMlU
         GRFFsko0wf8YKsGFzgLs3ND+96dDy5dv43fuwpXnpsQ66Qe2rb2syH0FMGJMPI3BylAS
         nuT4JRB0IPHyxtmpfmcHZP5ba+t1DexPj6Y0+BcL9p8SgRStUDA5cn+9pt79jxFKl8uH
         PNRqcDOPugrVSEOt5KwtEYMlcUgVm+PY8aDIpZooDFqJb5J9aTwteaNMj7GLeG3/qNxe
         4Eiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795429327; x=1796034127;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ole/VklCtHFM4pZTEWXbIafAoWTcJ4IAxzwf7ff2jkc=;
        b=lLyNmKF1K2314ZQr/mrie12SqIyRvmrvShXo5BkHGTZajEy5s+5oKstO3NhUjrt+1q
         HJXRFqWgDbxE5FILl8eBoQRVHKYzbMLh+0DKrdt+D8vA2KjrKLgsk2rFWJpsn5F2D97j
         MJHTuMh9B4OAAb9PxK0rTHh1zEK//Ch/nAytf7neR8GwLcBr5pzhn9vZy6QNGxPu1kgf
         U7b4632TRUFdDG8TZYyNkBCSiu7XS5DYfzUlYfUZZMCUtNJvE0Mv0wahsMSze/aJyzsu
         wZGsYHzG79aGCHAPSvZov4K5k5Ln13upLvZ/Y3fn4fSK/GjUsY4faI9J6K2pKCqAhRjs
         GGSA==
X-Forwarded-Encrypted: i=1; AL+hErEdY4HdTTrrAPn5RPUkIfmq9l36Let6ohvmIQU1qf5s6XhdEBQgK57F/nHq8qIK39nFqXpq5J+J6Q7rpsE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EunyeTA/H3o6nTiH8ulQHLtYLp3A2C8sW2VkDEW2qsi5awgCm
	DA43L7uwVNK2efvvoUzYVYEzKdA721JAVL3WJVllrxkWhcH+bzMeK6HnYglXOLhYa9X1QNodOtL
	YUevArqXUyw15OQszVKSN6yKx9c5AgWv8/3NA5eWF4tBxIHDP5vI6WAqoo9RKpkvzQQ==
X-Gm-Gg: AZFdTZcAjXB4JS7MFna0HP4uf5MNA//Fq97AIhMqdXLad97DSQSnK9AwlA9EYxsLf2P
	GWIohUmtxmdIfZlRpMQI6KsUeYxOd6ruVruhdCQMbMHxhPLwceLJjk/Vwk/oPNzXtCSeWbAogdQ
	HBfTycfj3eCszOQvYqsYniyIwDE6xLpAf1uj+xur2l4SQRPdRPCTEtT3tTQDOw2WOlfr5Sj2Wwy
	87N6Rd7mT/XII5OguksAlOUoSIqqRHJbHmZpaIxhfMWXDeyWlVWIJbMekjcayxI/7OTMHPFaXZB
	SCEpYUnI4X0WcHvBUEFfZvjD0vhjQBuDAkhdgqMrptbjZi8PWKRuhsHOueyOrmCw7AKAnTPaeGZ
	5eyuJ0t/yCbhi2YUm3SkWaMDUSHrL2T1QosjhKZciUBFV9sp9zfJrwp9IcboixHlonOQXmduZE/
	hcZQA=
X-Received: by 2002:a05:6000:25ca:b0:4ac:7595:6f67 with SMTP id ffacd0b85a97d-4ac7595721cmr16585898f8f.40.1795429327096;
        Mon, 23 Nov 2026 02:22:07 -0800 (PST)
X-Received: by 2002:a05:6000:25ca:b0:4ac:7595:6f67 with SMTP id ffacd0b85a97d-4ac7595721cmr16585863f8f.40.1795429326711;
        Mon, 23 Nov 2026 02:22:06 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb98b4dsm22122529f8f.53.2026.11.23.02.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:22:05 -0800 (PST)
Date: Mon, 23 Nov 2026 11:22:03 +0100
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
Message-ID: <awQTy09VbrDn9RpA@jlelli-thinkpadt14gen4.remote.csb>
References: <212c244d534ee1fdb0538a980789e16c@kernel.org>
 <20261111175657.250354-1-yurand2000@gmail.com>
 <58cb2cbaf82c0f671213eaca46465cd5@kernel.org>
 <20261119151416.33f90a64@linux.fritz.box>
 <471bf8d446becabfca00041fb2a78067@kernel.org>
 <20261120120659.2e902463@linux.fritz.box>
 <6fef47e08a37079c08806b3c57994778@kernel.org>
 <20261120212418.10221f2e@linux.fritz.box>
 <06f4c157677f99fc5386dba4c9d68cd2@kernel.org>
 <20261123084345.4e24e3ca@luca64>
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
In-Reply-To: <20261123084345.4e24e3ca@luca64>

Hello!

Me again interjecting, please bear with me, but I think we want to get
this as right as we can. :)

On 23/11/26 08:43, luca abeni wrote:
> Hi Tejun,
> 
> On Sat, 21 Nov 2026 07:24:36 -1000
> Tejun Heo <tj@kernel.org> wrote:
> 
> > Hello, Luca.
> > 
> > On Fri, Nov 20, 2026 at 09:24:18PM +0100, luca abeni wrote:
> > > But the deadline entities serving the real-time tasks in a cgroup
> > > are pinned to cores (one dl entity serves the cgroup's RT rq for a
> > > core). So, they cannot just be added to the sum mentioned above
> > > (which works for dl entities which are free to migrate).
> > > This issue was solved by reserving a fraction of the CPU time (and
> > > the root cgroup parameters indicated this fraction) to RT cgropus,
> > > so that the SCHED_DEADLINE admission control is still the same (we
> > > just decrease "limit" by the fraction reserved to RT cgroups).  
> > 
> > I see. Can the fraction be the maximum across the CPUs then? With the
> > root at "max", the kernel knows how much the cgroup servers have
> > reserved on each CPU. If "limit" is decreased by the largest of those
> > on all CPUs, every CPU has at least what its servers need set aside
> > and the admission control for tasks stays the same.
> > 
> > I'm not familiar with the admission test, so I may be missing
> > something.
> 
> Uhm... I think this can increase the code complexity, but yes, I guess
> it can work.

What about a slightly different approach? Instead of reserving a
fraction up front (or the max across CPUs), cgroup servers could be
accounted like fair/ext servers already are: each server adds its
bandwidth to total_bw of its root domain, and on top of the global
test we check, per CPU, that pinned bandwidth (cgroup servers plus
fair/ext servers) stays within the limit.

IIUC reading your RTNS'21 paper with Stephen and Jim [1] right, those
are its conditions (1) and (2) for semi-partitioned systems, and
together they keep the system feasible. Did I get that right? The catch
is that the paper also needs changes to the migration logic (no throttle
bypass for tardy tasks, and the pushed task not counted in cpudl when
looking for a target) for tardiness to stay bounded, and AFAIK we don't
yet have that in mainline.

So today's DL isn't "pinned aware", but we already live with that:
fair/ext servers are pinned and simply added to total_bw. I don't think
this series should fix that too. What I'd suggest instead is:

 1. keep the interface per-CPU as Tejun proposed, and do admission as
    above (sum into total_bw plus per-CPU check). When a config is
    symmetric across the CPUs of a root domain, this is the same as
    today's uniform reservation, so it works with the current DL
    implementation with the same guarantees we have now;

 2. accept asymmetric configs too, but document that, until DL becomes
    aware of pinned bandwidth, they come with no tardiness guarantees
    for DL tasks (as with non-default fair server settings today).
    Once the migration side is fixed (the paper's changes, or
    something similar), they get the guarantees without any interface
    change.

This also avoids the cost of the max approach, where 50% on one CPU
takes 50% of DL capacity on all CPUs of the root domain, and it should
be less code, since cgroup servers would just follow the dl_server
accounting paths (dl_server_apply_params(), dl_server_add_bw() on
root domain rebuilds), but Yuri should keep me honest here. :)

The root entry would then just limit what cgroups can reserve per CPU,
on top of the above, which I think is what Tejun described.

Thoughts?

1 - https://www.cs.unc.edu/~anderson/papers/rtns21a.pdf

