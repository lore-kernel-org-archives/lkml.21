Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795680136;
	b=a+dwfLenUIBWJT8b1Ks5s6E2zxBsxRQaqQQF4Xt0Z8oMR1nk9/60Mwgr/GtWwkttHSKd
	 siSHp/SLv1QVgKv88CUewL1S5HuHu6z4fbd96ehW/9NckWxq9bQ8D1beOe0GjDkSjamaY
	 Uf4442BALd/mMYi2PMxR/vbNw2TUiaoW95TzAdfLwBk9dQaRGbXMwoGENmrr0BAmUSnBM
	 jBghDKRcYk4rpiA5+sXYlzEmRot65LDU0pbaO3/7HZYFWz0reR3rrTG00XhZex3ZJpQYa
	 6pLxxRTcFf4MyvU+MAYAMztw4//CxaZQDDpBy5s5x72jn6BIYBLZdNNmIYVkygz3i5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680136;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=N3RaXFDKfQNwD/7rbK7e/V5RDra9/0I7oTxMyTIYUUA=;
	b=O5384+nbUsvhCBfB1LS9Zu0PmJqazXHJoJXfkHkH/6YLIa2eBHgI6R2CwlwM18M2Ndbt
	 BOyuufmVW2xSlR/9Jd8SUq+1yfPZSVaa/TJZDlYTQUdAOx8ZtVUlMAZJBMkfnJV4f4qIm
	 BisTlsFZP/hIuw9HLEbUiZboYs0sJl9zPsHHD/QGidlB6SKxz9Siyaqu7auDbv84j/CBL
	 xt6CxpMHfUNsbUNQh9cjg4qpAEslUSWRt9fKXk297sNWnvS/ykoeL868h3y4HUjOQr1HT
	 PUhrvpou0mzDCNMfjm/bJvBwppEjypqHbzCjnnx6Jxg9AsjD7UtxdWV+Lt+8CLwwb/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SEtQw6Mb;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ezBu5bGc;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB335606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:02:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB335606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SEtQw6Mb;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ezBu5bGc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795680134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N3RaXFDKfQNwD/7rbK7e/V5RDra9/0I7oTxMyTIYUUA=;
	b=SEtQw6Mbq8R+Aics71hodROQM8X1QvvLHu1HCZVxPRSBYAArATYqsTDRmTOvF6EYl2+igX
	aFPdY7jCTpaKlcnP3ZWEUqXHIUOTEi1YtsrnM55kGuxx3smQV2rBe2SS9RVbD99lBd4ZVd
	/fq9EQ+B+efiJuZBv/GMetcToBJz6SM=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-375-fFOAewJwP5C1k93g2ppozw-1; Thu, 26 Nov 2026 08:02:12 +0000
X-MC-Unique: fFOAewJwP5C1k93g2ppozw-1
X-Mimecast-MFC-AGG-ID: fFOAewJwP5C1k93g2ppozw_1795680131
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-3adef2bf843so27125831fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795680131; x=1796284931; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N3RaXFDKfQNwD/7rbK7e/V5RDra9/0I7oTxMyTIYUUA=;
        b=ezBu5bGckn2Zfeo5iSj+gcDkqvWzwrGguLO+ictELdz0+TQtAIXk/f2NgiicHDVy0M
         YVdPCQf7scFQHg4LwSXXRtkAtc51UdgK3go6/n5GFNYP6iAC4dWxBs0UvABDqtkTGm+l
         lw/S0ZQ4tCQaCc/ZdjYgFTkyM2ODWu1zGs5zEHEvc+FWOSO0/d8K+VfnrIqGdUMZKYwc
         bv1+MvSocLDR1ZTD+Z9SMX+c22yk68M2Jb7W8J7Hgz7qMfOhdx4Vrfrg3sgUHN620JdF
         HTt/Yk87/hMkf9fptbLZsR6Zc77dHr4jB8lLnFF+sOVUCMu7+o26J0aS8slXrjfgtQiu
         iu0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795680131; x=1796284931;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N3RaXFDKfQNwD/7rbK7e/V5RDra9/0I7oTxMyTIYUUA=;
        b=u1C8QsegFbiIoVW75wtqapkpHNFc42B0hUnT22gR7A41oOR13f5uX2T1EfS0PUhHUa
         dkNINR0M8TxF0/mPMIrNUvq4zsHMUQ8gHX/uCkKKKW+rtQS3I7X6waCaw4YaXXfKxIIf
         jBBJ24oPlDHVEuRFEgWA7NtTNRla1oNKjmoIQ8vMkVsdkchJwZjVDES4wPNehyti3/aG
         CG6HnytSlxd6azxW0PcLjGPGp5F/93CE3aG8iZy3IkqihM+LvEdik8qoTps7TVZAGnHF
         xW7/EexwIJ6kcgtZ2mAF06pdWizuydduKxvL9EJlqusGEZzx8y6SYv9XUw6zbxZubDq7
         4tIw==
X-Forwarded-Encrypted: i=1; AL+hErGCVUcbu1P0snW2+J5NM9kFzBehnEHc/Fh0vME8uPLyRx4sJmm6BALPdVhopueaakJe4O4jadjFx7BTDy8=@vger.kernel.org
X-Gm-Message-State: APuU4Z92AAFd+xohYwuQkIN7GkGQDY8y5hWhA98OaXwWk+8Bf8BkvS+b
	wiC2jt/SOuzIPM7iijbVMOPJdVQusBWXNzrn0w6jYMaCZx+pdDDnKPKiYv2UCDYwK6In+tHDRR8
	R9/NCzYfyvVCXVAHkrhjOKFtn9nVDEIL7XTxg/2NvKo5hXa7me+aP6A7K7AxavfPQnA==
X-Gm-Gg: AZFdTZdMOJUjwo/MrRNOMP5427jslxh/8UC5dJjTZpWyDJI/m5dobG+kq4Oy+vIPmDT
	ood7INcNW1eRski/1BPwPOvFHfIX96IGTPHsXQbh3Mfk9NFkiye6EUWK+VKnzv2FBlkgW9UjLlf
	rL8sVyNctPiAS1KxzdTeUNziOS1H9c1tVROxZ7TF8sZsCJfNG1i16yFH7E6I0KxWk6n3hc7zKHg
	fQJYJewXM1lpCGNsTOAqaBqFrSgkKBufz4BdeUc7GOVxpIxw3mhdEexAJL+d0xIgpQZ2Obr8I4y
	jAKlfteYKlOqQumW9vL/OjyLeJGywtRSK6Bm4SbwFSo1B2c+7JO0TXQcdq19CaIxqvZX2hUfg7p
	Jp8TsuiE4UGv8jKeq+gmiO/JtzHqBSn7yy+z5fF2uE/tdUGrNQftQ1b9+IG6HE+ncXfIwgGZhfa
	FzwFts
X-Received: by 2002:a05:651c:a16b:b0:3ad:fcf7:950f with SMTP id 38308e7fff4ca-3ae7b7ce4dbmr51174521fa.13.1795680130209;
        Thu, 26 Nov 2026 00:02:10 -0800 (PST)
X-Received: by 2002:a05:651c:a16b:b0:3ad:fcf7:950f with SMTP id 38308e7fff4ca-3ae7b7ce4dbmr51174351fa.13.1795680129693;
        Thu, 26 Nov 2026 00:02:09 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.146.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm36660545f8f.34.2026.11.26.00.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 00:02:09 -0800 (PST)
Date: Thu, 26 Nov 2026 09:02:07 +0100
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
Message-ID: <awfnfwN41UWleO8e@jlelli-thinkpadt14gen4.remote.csb>
References: <6fef47e08a37079c08806b3c57994778@kernel.org>
 <20261120212418.10221f2e@linux.fritz.box>
 <06f4c157677f99fc5386dba4c9d68cd2@kernel.org>
 <20261123084345.4e24e3ca@luca64>
 <awQTy09VbrDn9RpA@jlelli-thinkpadt14gen4.remote.csb>
 <20261123151846.3fdcbf4e@linux.fritz.box>
 <awfe_r5McCTzr84x@jlelli-thinkpadt14gen4.remote.csb>
 <20261126084322.4abc6744@linux.fritz.box>
 <awfkczwhkLkXVEVz@jlelli-thinkpadt14gen4.remote.csb>
 <20261126085811.33e7f074@linux.fritz.box>
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
In-Reply-To: <20261126085811.33e7f074@linux.fritz.box>

On 26/11/26 08:58, luca abeni wrote:
> On Thu, 26 Nov 2026 08:49:07 +0100
> Juri Lelli <juri.lelli@redhat.com> wrote:
> 
> > On 26/11/26 08:43, luca abeni wrote:
> > > Hi Juri,
> > > 
> > > On Thu, 26 Nov 2026 08:25:50 +0100
> > > Juri Lelli <juri.lelli@redhat.com> wrote:
> > > [...]  
> > > > Just for my own (hopefully) better understanding, I tried to come
> > > > up with a setup that uses a cgroup with entries on some CPUs and
> > > > "max" on others, to reason about it more concretely. This is an
> > > > illustration, not a deployment I actually know of:  
> > > [...]
> > > 
> > > Thanks for the example, it really clarifies things a lot for me!
> > > I am going to look at it in more details, but, just to check if I
> > > understand correctly: the "trick" here is that "P" does not contain
> > > any RT thread, and all the RT threads are either in "P/noncrit" or
> > > "P/crit", right?  
> > 
> > It would make sense to me. Also, I seem to remember we said it was
> > actually a requirement at some point (threads only allowed in leaf
> > nodes), but I might be wrong.
> 
> Yes, this was the original design...
> But I think the removal of the "threads allowed only in leaf nodes"
> constraint was requested in previous discussion (I do not remember the
> details, so correct me if I am wrong)

OK, it would still sound like a sensible user decision to me (how to use
properly a flexible interface that also allows you to do not very sensible
things with it :).

