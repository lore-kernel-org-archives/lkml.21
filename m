Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179924;
	b=vQceyD7Ke5OjPEqH6ITj3Ci4/VRfsyH0vDdlWhVog7xKx22TsesW4A639DdowFhXDggn
	 Z3raW5mnkfHdKqTR8S8pc5lXPQePrUO2nAocFbDKdrOHGztpllHrpn33md8tlfNl2zQFV
	 qFj6FIllhZQJN756mGedfN8hq7BYIHgpu3PorBQweU8RL/9vQxIZiAFp6Js9yxmcpP7uO
	 +O0JhSavAywbwwMw6/w3d4RByRzcZ1tedR1tsGhJrDGm5Hq6JYUwxz2oZF2otjbdRavY1
	 SO/Wi4AXdrQZJUl7YzRG3LeNLC0pp/9Y099KWrthNjofEp2FJDa1IrN9I4Xzr7laKXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179924;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=P1l8hjvVS49GyIA6u6rGG13XCHYYHrZ9VUNaIusOyIk=;
	b=cjHLAES3IGj16xAeEt4iIySW5mVYwH20XPGTkVHqlmx/9OiT45olxAjcJPlMP3hGjGde
	 NhcMsnU4+HToyN76CzB7S2dptaZa+vIJ9wpHV62KKCS1m+uhLTFxYM3gLfY7kXm7NMfqx
	 +2tNWPLD+yxVIv4Mc25IUF2xPj0E+oznqPphbyPAIJ9Mrneu9/BdjlpLKTO1O/Oga99Cr
	 ujJgn4pbfVAeqdnR7dLVA7iE31DMX8KQ+RY+sEVRBJpeBQHiIuALcXh0xLxHorCL1dCCQ
	 QvbN4z7EwUlBFHxUt/98rLVS/uJGHZpAAz9hDvxVuDsorRcA4fP4RjWQ9WCMS4i9VdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bZ9xd49f;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="a7E5Q/at";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7902606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:05:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7902606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bZ9xd49f;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=a7E5Q/at
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795179922;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P1l8hjvVS49GyIA6u6rGG13XCHYYHrZ9VUNaIusOyIk=;
	b=bZ9xd49fLutU4LSmBTMdKOZW1VQh3P3GkozyoTTwkrm9tSFwPeccX+Tzq2umIJU/7PyQ6l
	byyeXpFsJ2PulJVS0EkuEPyrH75v8Mv2QVFg4RJJk/ToMHjdfEeFM8e6+yqUD29mRk5x6x
	DrD5zsEOF/t7ZRzmEWh1FeubHTbpbO4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-oAsmoTJMMk6rdXSQhgh7fg-1; Fri, 20 Nov 2026 13:05:20 +0000
X-MC-Unique: oAsmoTJMMk6rdXSQhgh7fg-1
X-Mimecast-MFC-AGG-ID: oAsmoTJMMk6rdXSQhgh7fg_1795179920
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48e0461e040so720172f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795179919; x=1795784719; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P1l8hjvVS49GyIA6u6rGG13XCHYYHrZ9VUNaIusOyIk=;
        b=a7E5Q/ataALL+4CgEZhd1/J5a6wtd4Qr7q0QjAm+vqgoEh1WazQWKqUvtZeABshdr5
         BZ8w0ow4XI0vd6Aws7ckDJEyccq1QNcI6suKHQHvEEyvIjtiLTuCkowo8BpJyelOWYgy
         /UOE2YHL2iWIVODyvLYMaEPe0ANXjRSe/Cfh8QFcyZY053+EzqA+hW36Ez418LE4lU2R
         GzmNt8iAVXH5KSugNbLql1JDi1189UOHJ9DiE3xrrw4i5QCQEgMmNhL+m8oPavLfal/h
         qNslfkxBK16Akwij5pxzwWlixaepoQY02h3PBfIvbW/Zcgbzk3v2zKinRBjyeev8MdbO
         pUWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795179919; x=1795784719;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P1l8hjvVS49GyIA6u6rGG13XCHYYHrZ9VUNaIusOyIk=;
        b=Ik26HTE1TKw3fl4TtMnYB0HDpeepMMhGT8788gqSLHzDVaxWMHLbDTmqw8QMK4pXfM
         gMjwoQoh6dfHgIqokgC13e/vLh7lJv2OwwNwG/gYknccVJyZOS/L5CQki9Cn36Z+84y3
         EY4N0WLaTEM1ZVSHbYGy/Yh6XHZ3opkvf6TlEe5LnWPohp/CJuX9eqylUgxneAdCjSGw
         pF75wqWOwtaQnyvLndACfRNSHhK/x/69RxuJtSLyPN1IyXbIG5KgcdyZyLKYrbVlvUOu
         IlE5cmLFlSg6jc3W/q8T+Fr2w40OHEFMAuenhmj95SxBFnUjJXh8xPeLPge9kCTEDYQz
         8NrQ==
X-Forwarded-Encrypted: i=1; AL+hErEEvdAxlTUovaDytOZ37WRapSXbckmUmiSGK1uVBDeMb+kMwXbCD9pMzDsv2sfTkaUGPVWiedpDR6oPvdI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0VvavTP+PsqXfyN8LIT/O0bfgq2TjTybMZfMojO0fW0mFCAI+
	Bg+HBVnuxQyRgVoWTYFJyWcwV3ueKlz+VWE5yvUNOXRlga6PNzJrSBr5kIDGjsNKNyuJcIHD6ZD
	+PE0COnMKTG5SS0uKY2BNqeIXKEjzrAJ9yHJNjhoWTrt3N7Mx2ETI4iVF/nsGMwoCoA==
X-Gm-Gg: AYBFou0x70domGL5X82sX29GMNVqEs5lyrkZ/1rs18cq2QG7/+8Wcu93tJeNNwSXH2a
	8Jy4ZRGjU6sC8+6sshQ5kHVMCHsckFGHc1v5c/Dp6lX7G9lhSw4n7SER6uErcCaeVSuhVlnFRsj
	7VFo8854uAZ7Eysq2HYehuc4qAmut0eEZ714KBbloa/zr+imAT3A0WBl+rqnFxAkg+SDNPGcGCN
	motEdaS7mBp+pqMsqx2RklHk3DauEmUGOxdG5npajeu8uvvf2pepP7Uk3GzpZgCy5ZBzNzXWET7
	UxXPHqRFlXK1zxlPo0GJ32C2pa3wU1AMoQPWB3VXIdRJEyQNlrkw+JCl63k0w7F11aoElJslWQI
	WDOYl+WWpnEJEISQw1fj6oMf3ru/3zyMJuY5u9l+I9PqUwWSLRUZFOicVKv32+1AQvBR7GE/yOO
	/ypQ4=
X-Received: by 2002:a05:600c:820c:b0:4bb:6f6a:1976 with SMTP id 5b1f17b1804b1-4bb887c2923mr64602995e9.2.1795179919581;
        Fri, 20 Nov 2026 05:05:19 -0800 (PST)
X-Received: by 2002:a05:600c:820c:b0:4bb:6f6a:1976 with SMTP id 5b1f17b1804b1-4bb887c2923mr64602195e9.2.1795179919119;
        Fri, 20 Nov 2026 05:05:19 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm85099165e9.7.2026.11.20.05.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:05:18 -0800 (PST)
Date: Fri, 20 Nov 2026 14:05:15 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: peterz@infradead.org, mingo@redhat.com, vincent.guittot@linaro.org,
	tglx@kernel.org, will@kernel.org, boqun@kernel.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	luca.abeni@santannapisa.it, mathieu.poirier@linaro.org,
	longman@redhat.com, ridong.chen@linux.dev, tj@kernel.org,
	hannes@cmpxchg.org, mkoutny@suse.com, shuah@kernel.org,
	bigeasy@linutronix.de, clrkwllms@kernel.org, parri.andrea@gmail.com,
	m.szyprowski@samsung.com, kayracizmeci@gmail.com,
	weihengqiuu@gmail.com, linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v5 00/17] sched/deadline: first bandwidth accounting
 fixes and selftests
Message-ID: <awBFi0bwFt5KoEq-@jlelli-thinkpadt14gen4.remote.csb>
References: <cover.1795115075.git.mathieu.desnoyers@efficios.com>
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
In-Reply-To: <cover.1795115075.git.mathieu.desnoyers@efficios.com>

Hello,

On 19/11/26 14:06, Mathieu Desnoyers wrote:
> Hi Ingo, Juri,
> 
> This series fixes 14 bugs of SCHED_DEADLINE. Then it shows the deadline
> bandwidth of each runqueue in sched_debug, and adds two selftests. The
> fixes come first, so that stable can take patches 1 to 14.

Thanks for the respin. v5 passes here: deadline_switch_test 5/5 and
deadline_bw_test 46/47 (move_cancelled skips), also with scx_simple
loaded (the server cases run on ext_server, hotplug_server skips). The
sched_ext selftests pass 40/40, test_cpuset_prs.sh passes, and there are
no splats with lockdep on. So you can drop "not tested with sched_ext"
from the cover.

I replied to 10 separately, with a readability nit that is not a huge
blocker.

Peter, Ingo, I have the impression this is starting to look good, what
do you think?

Thanks!
Juri

