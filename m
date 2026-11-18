Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017191;
	b=OlA8xfErrJ/wl6e1Jvd5u/DG4M3eqRybaD1ynA5/oCHDlGmr4W9633V0OfCeU7dNbFhZ
	 TOeYmDH+X4Q7MsNq0dj3LrmJtxE/uR4yD/QtJcXylWm/XhSrnQUI2hhjyt9hHyeieVUjA
	 L8b3Tl02Weg1+tNeiH4HLzsj7iVrMXGeyxz0HOBHdBP9JI7Qytt2lMp9/u+KnvWzY/N+4
	 R0J0jkuiZ94haa138JxvLWmagrcZ1Xd9FGTacQbFBMsKoDvq4y0ZgRdzNX9es7CBTKChD
	 esXIC2VXn90VSRV9/DmT/64CXv8t94ssnk+MnkdJ+FxFb9o6fY9qUUFATdOLJamas7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017191;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=a85wi9zMKa3ITk5iiE5QycHbAdVE4Knzk7eFGcpu7xQ=;
	b=kHvjHvGGHSlYKwW0TxeARJJ+vcdTLEqas3e8jTrYi2rvIoMxCpaXaZDMwii17aPrdqX8
	 8fFiheYtaYW/U5erxR7LzweHI9YMk2boSPLmToDPIqegAdl+i/Juym+saiL79MFHpLP96
	 NJTdKlfHTp1ShGULZL/1zUJ8N6trW4mNa6ZlG3D3cfX/s7O/+kOmKDvZxCskiXmkYc03k
	 TRoq46iuh8pBKCIsKcWhP4rHmOwRwww0foKC9mK909UKmcqItwxsLJAoPQR9VA4wzn9mn
	 6W92JFWGiPi0Dy3UvygTdwPsIKHguJ01hcawPHuBYaekS4frcRfH0Z6AfKDWLIOtQEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GntU17sT;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=TGw4wEhA;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8AC606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:53:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A8AC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GntU17sT;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=TGw4wEhA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795017190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a85wi9zMKa3ITk5iiE5QycHbAdVE4Knzk7eFGcpu7xQ=;
	b=GntU17sTwCEPiLDxsAqaaHOhZPXKJ7NLXyZMmlw3JzRCYtB0alzbzQZycSXIpOriK7VLHv
	t8hAaNRiK99MmrAtT7qhu3446lEtrafcw8570cbYm37YyB5TDVQWZnHfOAuKh2yrlzPW41
	PT4IZ5RMTOA4Sr8sl9fSZETH13RTWSk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-Gfy06c6yMyWvnxBQFfNIhQ-1; Wed, 18 Nov 2026 10:53:08 -0500
X-MC-Unique: Gfy06c6yMyWvnxBQFfNIhQ-1
X-Mimecast-MFC-AGG-ID: Gfy06c6yMyWvnxBQFfNIhQ_1795017187
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4915ba023d4so835182f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795017187; x=1795621987; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a85wi9zMKa3ITk5iiE5QycHbAdVE4Knzk7eFGcpu7xQ=;
        b=TGw4wEhAEYz6dqxQddcwF2q5nSNk0fQ5KZjLd4qAAC0huj85vW++9H7xg052kqQirP
         4/7ZflEl59RJrPbO/EwbDUqXwmzPJxlBDlLJ6s7npb3cYtAN2ekn4ofpZVQwed46KD2c
         Eqs5qRBbPDEBSz2TL+ZkYV7lvc4UvrGUUE9R9vhHD+DOnNoRQUchIlmhv7hs+g8wY2nL
         J0JBUz2GRuOtN6+q4vogAaMvpb3HTZlwBUp2c/VYqaiYtc09cziupcrDNI/jGLDgWAfZ
         cGBjqv0W6tTxOfu4dSrjQALmErhn9ZYqntp25FkEf9b/XdZoC5XKRUbvE5UBGfnETMIh
         vWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795017187; x=1795621987;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a85wi9zMKa3ITk5iiE5QycHbAdVE4Knzk7eFGcpu7xQ=;
        b=Bgtz9lgbwpHVq4L3dYCj9RbLOlesV3cHmaDBMXpr0wBrCN/uyoaT5JUiU2TObHiCWn
         7MbykuGPILddGPRaivE+gYlpf2OwH6RWBzeVm6KDZCNlF0JD0Ihydp+6d5MV2s7ag2Bk
         hisg49CTzH+h8yT7+D3g84xJP+/ENnoxJ6JtPY6gjivC9tgFYd9zIUb+T+TJq0aOmB4w
         Je38HnF1hjItEzVECOFpPu3u+zcAzG/09kBe8jQpy9oaelmtX4KDD+iw7EnR7yXop6fm
         oKAag4kAh9uyezgweSRIAIr91TXnQhyq22l61FfnDoU+Yrf8TWM27k0JCxTMJ8ymJthG
         IhhA==
X-Forwarded-Encrypted: i=1; AL+hErFyLAkOzTi+6/5jlTSJFii8uB48iNRWLaDq8E2hgFogpVu/pEM+ftSR/PtYwJ+zhCehOm9tmFAubtomwjw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wtXGOZ3rPPN61KccQYs60o9CK4Dtrv+8mmKVuTozoywewdetS
	IPOyWfjoSCsi246K3pTVvLfiHjwbUZvUXD7cK/MzkE4GHP5wvLWawd2jj4rFUJnrTXjTIHThQ8L
	8pSCXJ7C6+WGmuC3qgZ69rgiVzXH0wpPornnKCIRntQ3RqJzmij8v5GGC0r8DzHCyOQ==
X-Gm-Gg: AZFdTZdeAS9e3trpRpLQp/28yM/ed3T9mihkd7xAjJLNiJ3pUiiLyRnVv6CKv4K1Wxi
	3Qdnc7cqI7//WbU1zDlgvc0XtC8QeuCAdqv+Cvg5OJnZj0nvRfLOxcyDNpNiKMczgXE/1sEW2TA
	rGJW8nomMDm3zQlEZv2L7HqtSFEVA7mfLVZvn3yvLGi5I5Ui13+ubQyEVZE+EH3YXvU58FY2sD/
	mxYEnjEg9GGFmZTsS97+p9SwrN0xipTD+pIVjxdj27XTElqVJJqC0pCsl90OxAleuu7/56q08U0
	bdhSKGW5E23qyqA814VauaojRVHj7ccRKBw4TEGr38KOv02SZnH3+GCbom6BTyzr6OicRyVPx8k
	ZM+q84wJZT4o9Ix6kgdSs4Liz8VM+NpEol6lFyrLW4B6r6x/eDM8vfWAvVX9zCFd0Diy0az/GaP
	33X5w=
X-Received: by 2002:a05:6000:310e:b0:4a8:7115:fa0f with SMTP id ffacd0b85a97d-4a87115fd47mr1608193f8f.32.1795017187524;
        Wed, 18 Nov 2026 07:53:07 -0800 (PST)
X-Received: by 2002:a05:6000:310e:b0:4a8:7115:fa0f with SMTP id ffacd0b85a97d-4a87115fd47mr1608144f8f.32.1795017187160;
        Wed, 18 Nov 2026 07:53:07 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65683d5a2sm5699651f8f.43.2026.11.18.07.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:53:06 -0800 (PST)
Date: Wed, 18 Nov 2026 16:53:03 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: peterz@infradead.org, mingo@redhat.com, vincent.guittot@linaro.org,
	linux-kernel@vger.kernel.org, tglx@kernel.org, will@kernel.org,
	boqun@kernel.org, dietmar.eggemann@arm.com, rostedt@goodmis.org,
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
	kprateek.nayak@amd.com, luca.abeni@santannapisa.it,
	mathieu.poirier@linaro.org, longman@redhat.com,
	ridong.chen@linux.dev, tj@kernel.org, hannes@cmpxchg.org,
	mkoutny@suse.com, shuah@kernel.org, bigeasy@linutronix.de,
	clrkwllms@kernel.org, parri.andrea@gmail.com,
	m.szyprowski@samsung.com, kayracizmeci@gmail.com,
	weihengqiuu@gmail.com, cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v7 00/40] sched/deadline: bandwidth accounting fixes and
 selftests
Message-ID: <av3J3zMfkRplg-N4@jlelli-thinkpadt14gen4.remote.csb>
References: <cover.1794922146.git.mathieu.desnoyers@efficios.com>
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
In-Reply-To: <cover.1794922146.git.mathieu.desnoyers@efficios.com>

Hello,

On 17/11/26 09:10, Mathieu Desnoyers wrote:
> Hi Ingo, Juri,
> 
> This series fixes 36 bugs of SCHED_DEADLINE. Most of them are in its

...

Thanks again for all the work on this!

So, I feel we are making progress, but the set keeps growing/changing.

While we spend more time on the "upper half" of it, would it maybe make
sense to split the lowest part so that foundation fixes can start to be
merged. I'm thinking 1-8, 10, 13, 14, 16, 20, 37 (37 is not a fix but
harmless). Not all associated test will pass of course, which is not
super nice, but we know they pass with the complete set and can maybe
come later.

Just a thought, happy to continue iterating over the complete set.

Thanks,
Juri

