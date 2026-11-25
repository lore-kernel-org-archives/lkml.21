Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634645;
	b=R5BCKzNuGadrGp9G7zHXfBLqbWWW/VEYJn4+U9Io19SfXHU4XuCPiAPQBjn6eucS9HQi
	 adqIbIdQSeokdNjn7L6HUpaaFt44Frye1pdg+uNyufcVwfng9RWAN9+4ZVVcgDs3fkc3U
	 3MD6/k3sVDB5kavnlx21SxY700SVPDXLkxHGN3HbTrPD/xb9MLqkybTu+qOWDfiroyk7R
	 iXU8VueYtoeR66JmqPhCCqWW73W/ZrpNwVpbUMV6P6Wx2uaVDT11l45WKhbOz6h6v7fr7
	 RBMOUFhGOji9S5es1brnotThiZR5hzsASSVN0OWGyKLiki3yHE3U/zObKYUEGtCVxuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=3W56owSBc9jDVBiGRn0n4U9fWiaOv59zmbpdMIKAQa0=;
	b=1xWEBO8kGbmAUdV5WEeM+UA5RMkFtMVe5BWqlGzFLEwY+2tW3GP/PGYTZk30XVMoeLhF
	 Ky27aOLJh/qr8N//Rerfsu9jNBYeteg8+HuU4XQmKEGq18lRbzaRIplKNbp3PAEZR0TgC
	 3DbViA1VhVZN29HcxfvAZg3vuH6RmEJhAZk32Oez9M2qxOAit9PrXmC84BZzI6udgPNWq
	 Z4hSKEn6ztCInvyjS6A4B1WBf+D5JMteO8lmJx83Ju10SiuWVQzT0FJ3pL3SNg3quE1Ju
	 ql2ptbIp5N2xMn7pQJ5bBUCj65ujsGa+df8vdwpz/c3uZ35Yy/24uTAtjgIcs1BHmCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sz+yewe6;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6F8606A331
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:24:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F6F8606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sz+yewe6
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so79953395e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795634643; x=1796239443; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3W56owSBc9jDVBiGRn0n4U9fWiaOv59zmbpdMIKAQa0=;
        b=Sz+yewe6SyziGzAEKzOt5nMHv1H1Lj+Z0HDc2vJdMO+FHM4t3rSpipfVL8UM/QdD1x
         kBqA6Sdceo9aY62Jz/SuRl/Sttghu54EXFh8TNr6KSOQUVZTh2wpfqmAHftQV5qzyz3c
         ng9iz9IiznD9HXqDB/XigbFclvpxfzMmANNPRPBx5HL50hiAQY9hLcZXA4ZSjDhUDWpm
         sW8W6jVnTTMruYiVqumEG6i4Qok05GVUWo4qF0BzASRNS//sy5CeJj/3OcErjwTsza3s
         HzmUq+ancqiboahacBkg6mvsCPqhwXY1muu1KxXEGCSsID6NvMmcVVaenkS2TPTxc9ju
         TWiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634643; x=1796239443;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3W56owSBc9jDVBiGRn0n4U9fWiaOv59zmbpdMIKAQa0=;
        b=C/enyOlx89qcQP301xqnvygllY6iwGYpWDPH0Beei9+Zd40xK4pXcbBf0B7hShzlSn
         WK91ep/lmZFl7DeIXtV8I8o6THwqGOLWJ2jghY8NEl3RqJdP55eEOoBtSyazgWNxNcBw
         N5lKLJj7spZozPum3yjgXwdyOy+305m53pg4Kux/qt5SpoCdPYocawZoD2rvpKI6ocAI
         LK1RVauORwYgvTKEmficc9Y/66fIIsZr1veSuHspXYREra0p9Y9bi97tCIlnQdMUjHsK
         rbs1fxtnPApKAXHR2dfCCwR5TIVm4mdIiObXOy1cLB9ki78S5d0k0AIGpSRPjEWAebyx
         oC+Q==
X-Forwarded-Encrypted: i=1; AL+hErEu3lVKPsrSBOXJ0L0tQJrrKpaOz1Gi3OfSLYki1q2wy7l2m4yYiTZxKj0GXOiDrP1tnPaOSLx2czc9goQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9liFGXwjC2m+xS5e4G7n28uU8HvOKAsIGJn3lhwWA5H6GBlDik
	nSFzPJcn3A0aC1pTkRDmqlNzO68zBP0TfPTinmjttIpjTExzBTVWqIpL
X-Gm-Gg: AZFdTZdStspH7uJl/xnu++IOIDpYAY25U3U3tUX7lkKd0UIYDH8lI8EzDBWPviBZzy6
	J7cmreQzZhnQfbpqtHfOwVznP0yHDFqliI+MWyPDxgBDOxUbOtMgcbD2gJ0imfh+3XhQdrEttI+
	JfG2vFF3xAJ6CYaaP2VasKxPmapvL8cEJcg7VWgAAtgW+SHv9qX7OiXbKxqoNNOa1PkllJWg66r
	fM+gO2BpJD18uVJQrJb429xAqcIk44UETbTI+rkFM6WfuU37I0vvOMKoPcrcgZWkj7pOIWH2IXG
	SgV+WBGKe/dfNQFgVxDuVq1MN8kIKNi+p6O3kbNY8wycrh4UDs5oPDLgYa/ZqL5PEQ3YLjmlKxY
	4ipz/oOCPmkc+T/QX6XkIL2FdLCYodZ5UfDngKMIvh7XV1EI3mqUq47quakEi7d2/SFdsIcKQkE
	X/UKZAOaF9bS7kCGHp9DDWr6Dy+4jt4gwSEMAIk6OGZQneoLm/T6cjQ2kdZZ9dt+JmggpDhTKp8
	aBL68mwXOpyIU2HqKBM9WBYYf+0fWD5s4Zr64ycKSMIx1nZuXE3uSNMg0NZ2hiu3Do4jzspSUtL
	cHEG0h1Xyf8EggKwGbHO0Yw5c3nTjlgnLPlxwABt+JM6iso+qIB88B/AWcgiuX6g50TnL7xKBIj
	Kbqq9cXbyhOhuzxRckZ4AI8jXGM0Mz9gh3z7t+5xD5IZdznCTtwUb4x9J1oG7NqIqNUAlwEAQD5
	gKD6jd+w==
X-Received: by 2002:a05:600c:5901:b0:4bb:5e8a:7c9c with SMTP id 5b1f17b1804b1-4bb861467c8mr329102905e9.7.1795634643163;
        Wed, 25 Nov 2026 11:24:03 -0800 (PST)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-095-114-079-170.95.114.pool.telefonica.de. [95.114.79.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm34180072f8f.18.2026.11.25.11.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:24:02 -0800 (PST)
Date: Wed, 25 Nov 2026 20:23:30 +0100
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Hongyan Xia <hongyan.xia@transsion.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Song Liu <song@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Valentin Schneider <vschneid@redhat.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] sched/preempt: Check preempt counts in notrace
 helpers
Message-ID: <awcwI1imHpWk8QFE@gmail.com>
References: <cover.1794814699.git.kmehltretter@gmail.com>
 <446e2bd042ce071da52ea80f577fe43c1b3dc031.1794814699.git.kmehltretter@gmail.com>
 <c9b1e3a8-bb25-4808-bcf0-f2d5ba72a58f@transsion.com>
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
In-Reply-To: <c9b1e3a8-bb25-4808-bcf0-f2d5ba72a58f@transsion.com>

On Wed, Nov 25, 2026 at 01:26:28PM +0100, Hongyan Xia wrote:
> > CONFIG_DEBUG_PREEMPT enabled. They therefore skip the bounds checks
> > which ordinary preemption operations provide.
> 
> Nit: Somehow my brain cannot parse 'bounds checks' before reading the 
> whole patch. Hopefully it's just me.

I'll reword that to 'underflow and near-overflow checks'.

> >   #define preempt_check_resched() do { } while (0)
> 
> No need for this hunk as you are in !CONFIG_PREEMPTION without any 
> checks anyway, but for symmetry I guess it doesn't hurt.
> 
> But if you decide to keep this change, then we can always use your new 
> macros and remove __preempt_count_{inc/dec}(). They no longer have any 
> users anyway?

Agreed, I'll remove those two macros.

> > +CFLAGS_core.o += -DDISABLE_BRANCH_PROFILING
> > +endif
> >   CFLAGS_build_policy.o += -DDISABLE_BRANCH_PROFILING
> >   CFLAGS_build_utility.o += -DDISABLE_BRANCH_PROFILING
> >   endif
> 
> This exclusion looks massive for a whole core.c file. When someone 
> profiles branches, does he or she really care about branch statistics in 
> DEBUG_LOCKS_WARN_ON()? Can we just switch to unlikely_notrace() in that 
> macro globally?

unlikely_notrace() does not solve the PROFILE_ALL_BRANCHES case, which
instruments if statements directly, including those in the notrace
helpers.

I will follow Steven's suggestion and make the Branch Profiling choice
depend on !DEBUG_PREEMPT instead.

Thanks,
Karl
