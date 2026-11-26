Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795655278;
	b=EpYp3irvp1dwfjfQ1mcQHimrLmW0TtXxPT4iupgKi3BgvLfiea4BA8SXSUxSL7a30Pni
	 h1CQ+Bk3htVty8MPD2+Hq97dNgxIFDo65hLAN3BWWJ0B10DjPbUhlG5dPYEygaxTlJwAT
	 L6DodD8xoWtrwoQQi7ExYn7hTDNbBwrn9nXeduvVr2qHLnafVtalLFECAWr7vSg4d3CZ0
	 Dlu70yyj2uicLwxXyLD/B4BxnALg3a86zJSWXAr5MAAKbdvyf9mci9aPHzLmXS5rTDFJ8
	 Oh4YIvI2fL0diVrVMleeYDqcQH0MQT/arNIZA17g7dn8qpr0HTAl0Uo255lnJkDtCDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795655278;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=0e+Ouu+6oLoZy2ujzXapWcEGF96bjKcfmd5hC33j504=;
	b=mJVIJaiWZA02rA7kyu50N3kFiD+Xadbinu/hOrbzzd1aK6MQfK05TiyMq2zzw8F+r7WI
	 Cmr0KcTBpuwm9ihiXdOLN4m42NDxaOj2SGIv1PymoHmXRejCfyBlIio5NKZoNNSKHMstc
	 /tgFjYdRVsuEk30H5iTb96RSzbTDOZdv1mJT6+fCRLPYfWaMeric84qliCoH34kMXye6O
	 5LyzWE68tI86mUexnHH+sbIZsrDvsQidVOCNYCvykCRodHq0g6Ev561pA2Pe7wIiSIS2m
	 Dm30Nu8+v6JAtzRdK0coDLffhU3ZcnherlWUgNdL+f1VT79xc8vc1CW/WMKgcQZAq0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bmHXJGPk;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB541606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB541606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bmHXJGPk
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-89d6bd67045so3038740b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795655277; x=1796260077; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0e+Ouu+6oLoZy2ujzXapWcEGF96bjKcfmd5hC33j504=;
        b=bmHXJGPkjT0iQQWrYHY7sMyXnEshrq4U4qqSkgr1yQNLs5XndAhbgAuEgGNipdAVzA
         Y/kpbeOd4V6KtAO+gVto16YC1OXlMWdopN84P40qpOAfBhWkeu3TlvNKmqdzjWkv9402
         XPbZjJVIzUPsX9dC8ibIjqU0cpmiM1zLBG8YZeHZqlMwEauunpmqjJ7+Um4D0iFH+N0c
         fSSlAQdFcv4LTcWYZoMMeUApUdEZhSDbBB+dzG9El7hJW3yTu63XexTMlR7e3nhkl902
         X/PLniWEHrA07+ix3ZGpIQcIlwYUj50YX721imnRnsrtxf4IoYCdrc+upH2iaaOcdUK6
         +jcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795655277; x=1796260077;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0e+Ouu+6oLoZy2ujzXapWcEGF96bjKcfmd5hC33j504=;
        b=tLNW0vZbrUEOiz7v26mZqwLyK9Vq31B5mGoDAto7lL/ngWBUkyK4FNdm6u8CcUXhJ9
         BmNU8KrcYlUx4lHg0CUAxvP4A9I797t1GgN6OAhYxxOQnmQHLr1BAxrA0QgAb5rABe4Q
         NA1b13IAwN0o1hmJWBMfeZEkmUFtPuGkSWkLB4Y3xXcTr28fzZos3JFXjogYP0ZYUOcO
         8pxi0o5pyLVUubCcDgjXY2oqtUhyoybvUr3UOVzKwbq9MtN3FW1sWfpNtXOyMBrcLw+d
         792iqqCuUKNVC6Aqeb3If9HnqYII45LvMNJ2P4vt6jksmAKt45qFlvcYtI4wKrRxFgwl
         2O1Q==
X-Forwarded-Encrypted: i=1; AL+hErG5fkMvasGy4MIcy+6L+UYtBDuwze6kkCUUFvn2aWpFu15mtVrxCrtCVj/gsp7+rHDR3b6KtUB/xTttpQE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GF+L8S3cfKgww5AamAMby8nZKvHdgyWCqdPO7CTrdSxTLYzsQ
	wmJ5+dDwll20xYyXbjcNz1J6Kznn+cJ/YCqdCslTYld7oxuIYGRbm1ot
X-Gm-Gg: AZFdTZeiAqVvaP1bXiTxM+dbWI+zx6i+0KeQmeNTCtA5NgFe+PMe0UZuqminelxbh6J
	0f17cfX8XIjyQgrs85xJMGHkEQN0eYSOctVaH5V1mDbDlgsu0OeypOEnyh0fEVt4T5xSxYVIaSl
	5k93PZIzUJVpeHFfRXE1XaXuo5Ec6r7QTfF/gRIl3pRrkI6N0cwPG0TA/9dmAUfsN+gqL3Js3fL
	psW6XMNcTMLVn49/mWyKMSNVFvr20qhtpopbiN1i6wLm+6sU0QFjCw9WsKVaQsMUQAVoAQkBjIJ
	72LCZI5T+5q0P4CFjjSb/odJjTXdL7hEuKmEDW1t5dzeYpuj1A/+YAfLkjZr+h/AJQMcJC47NZ+
	kNfjx6KtM9OlFtzmUhCPit1aszmvWgSAW46PPIjiNLZfHdegCfAy+hPBP0DjIJ6P4X6H7Tbmh+4
	4eKTJSOkKHpx4/jQe1JHUCzo/Jsj7a/7tyGbM8JVJTIdMGy3WAPMRNF3U3nqcOtGYnFhpCY4lfp
	CgkgKTSdhXa4NyeXpHcaPpi+MD4x0vfx/OR6RymuzW9qK2/fT+VP6WIFq1Msali5207NTFcV3/3
	d2oU1Xyzsj4HX0upzIo7A69yshuiiunzORVW5cSwQKh4IlNkjt+xNOEZXX/hYIl1/4NB5hrL27E
	JdBZMfaDK9CV1DYIExwTehy8F0kWesNsEZQc=
X-Received: by 2002:a05:6a00:c08a:20b0:8c7:f59c:e82e with SMTP id d2e1a72fcca58-8c7f59cee72mr10451362b3a.36.1795655276950;
        Wed, 25 Nov 2026 17:07:56 -0800 (PST)
Received: from localhost ([153.61.198.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4c43bsm9633902b3a.26.2026.11.25.17.07.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 17:07:56 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 01:07:55 +0000
Message-Id: <DN4QO5PPVN0Z.1CO2JSCYRH04R@gmail.com>
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
In-Reply-To: <20261125160409.GF2668804@noisy.programming.kicks-ass.net>
References: <20261124060357.11700-1-emil@etsalapatis.com> <20261124060357.11700-2-emil@etsalapatis.com> <DN38HGVL8JHQ.2ZVZQCKFXVA9T@gmail.com> <awWRZ9xCzWLnj_R6@thinkstation> <20261125140902.GE2668804@noisy.programming.kicks-ass.net> <awbvek-HS3OJYJGF@thinkstation> <20261125160409.GF2668804@noisy.programming.kicks-ass.net>
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

On Wed, Nov 25, 2026 at 08:04 AM Peter Zijlstra <peterz@infradead.org> wrote:
> On Wed, Nov 25, 2026 at 02:30:52PM +0000, Harry Yoo wrote:

>> One remaining accident we're aware is that we cannot attempt a
>> spin_trylock or local_trylock under pi_lock (even on !RT).

No. It's RT only. Already answered in the other email.
Nothing wrong with !RT.

