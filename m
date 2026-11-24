Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795518265;
	b=TU9M5Ug+7GeKsZ9EAOu3NqdvkNxYFOXgb7NH93wVVbTZEOOd4W7yP23Lctr6HZ391CbZ
	 jxJ6lptkcjgTFNICuRjacJkUa0t8NytAeeapYPWgghpcYRYU68eguVDLMuCVRSStb4i1Y
	 5xS71eysebtS5gHyS5qe8j/KDZbMCgVzXhNiiKEqa3yPG/+POxepzCe5tRBwv3WKXqYIi
	 jN/DaOHbHRky+PV/jaA/Axh5UZry6swuqGOr2f+5cL06XXuMwjOxseAu0wZ4zLKSM5BiJ
	 cRdO6QwTHpm6CPPlhCFfMXtTamjLAK2yzRlfe14Mpm1fPLR9Uc9lvtlNiGrRuDw8pew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795518265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=EuBOUwwiL3IP1HDk4+dxaacGJaiYkefTCK8JBEZyKe4=;
	b=eHMkwdxyRYx0w8UobYkBAw5IDRLZpZr/fIS1rgR89apVjggP6Wcj8IZEHZ+z/QpW0Pmx
	 oE0STpMwC0rH5GaWuY2elEE5lmkPn82qSl5Ld8wKra8qU/cPmiJXifNxn+UL/Mb/zUyna
	 QvtAfUeMqXEu+aVlc5SHrnZzGsMh9KOqjSp7ETZtx1DXGm8EOjpdU0eVI7aQzbEUCqanq
	 BnAHfvyfudvq8Xk0g1d/ed1SNRB9KT9ON6f6T+WQ7oqvKaBpwYPoO98cCT95gG5QiCsWe
	 c+Ne7soHgvVXr8MOZcCs4wUFUrIyCx/dZHITFzs5v+IJV4I4rHqUISPIOz8HqRvnmRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DGCTDoFb;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A30606A33C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:04:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9A30606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DGCTDoFb
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso41896575e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795518263; x=1796123063; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EuBOUwwiL3IP1HDk4+dxaacGJaiYkefTCK8JBEZyKe4=;
        b=DGCTDoFbikauyFIMqdrHOrgjM62cX402e4khRkckTqUWicey3hvdiitxOdhi/LnQPX
         aTSOrLQRZq2jH9Y9HZ72TUNBL+mjYSlxq3wKIKY+J08+lRpR5XH6w6BPHngOnvO6QvYy
         K9rCe6e8DtXTP61QTMxyUUJudVvqxpDN/1U8QuRhNNn9bEMn0RR3myK/dJcgxSJrZubd
         CKXN9aoTK9JF5tX0QeeMKR1TS/4kkIzzvAKHJTVkPuh99aZY/qVa33Q89BL0SheCGNn2
         52/MjgbVpwEywoE7zhkDzXASJFbSKeX+OlotoymZqP3SalM6HZM5s77bBz1an88vPSsa
         JHtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795518263; x=1796123063;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EuBOUwwiL3IP1HDk4+dxaacGJaiYkefTCK8JBEZyKe4=;
        b=LLl+m6dkW4FVPJfYRDlSI7G9fE5ptbX6X1VYdmEWhDxra/tRB8DhweBqRrvbzCe4MD
         sZG+KuF08pgvTZZzJFYWy+w1yFqyuQWrUaG/YLUnrZRD9gtt2IBy090batkuKWW31Km+
         B0+lJetVX7ogEgh7MGzfteG4I99ojvF/TNGZzNW/0NoZ63LpvjlaHjU+rI8wmREkb4V+
         CYyaMKYv//3rHYKWA/4f/+UzvBd6cVYxzmqAZhscPGfydGG7j4y2rCDqfsZIW+Q6OQSA
         2YYh2l9At4NuZdjnpuBechwMYh1grOR+KjzlLADMGpd7d3V+QrDwovaIEE+Au+p9/t2+
         iBBQ==
X-Forwarded-Encrypted: i=1; AL+hErHg22VmHlwWDkOstQUoKFr1kfADuWP+K3H4j2ENamGDY73e7l7VsYGNd5RZ2YvQEOY/nkTTTH1RBLNG7u8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9r90NZu5Q9ZtQ0SVY7nsn1XCwGpBJ9r6Hl8Uo+FwsmrsNn4D7
	yK8gBbZrw+Cqovph8xT+x+F+7vEiR/1jglfyWW5Wvl60C3U/L7YmH62ejlAIXW6hT/A=
X-Gm-Gg: AZFdTZfRGNSIypOhS9w28t69yjnVlxOlOhiZiOuopiDOjibAiz9ICoUXyvexjUIJiic
	0AMpOgiIUYc52/tWhTejqJ5XXynZLsXLC7P5appGn6eVa4HWr5tmwhT3dylEYuiXU4ZUrBqjDHW
	Hn/DWrn7cev24n4mJjJwH2Zab8BPqxnkGyeJYbmlafxreIrmyMuM8Rvpznlf5XU8SfL7lCgFny8
	lJ9DbZtDDwVOUedlMFB0T4P7S2rjnTOCmjUk8QwbpVIkFRv36JzIb6QKqcPpbu+o29qu8PHs0iL
	5tuZ8VoIOitijpqAjLU4jAQnMcid/qhr3pNoSpIXyITXNBCXC7jaFG2mFpx9w+UVu6tL3BvMRH+
	xR9HzjYEy4pqHm9vyXxqdfZkNad8Dzk5yEh4eeiADIi5jziU2NA1EjRN3/hwAZgAgCx5bSyQLSv
	fpy3CCxZHo/anGBCskWb23z5uriYojl1C24KGopDPp8izb7pKeZ02Aze9JqTmikdLZimHgrU4lf
	bFFr4C/XpCtePxl2NayGaglE0GUNsvmkqZ04cMIUIeJ5S+mbmMqwwMlGyxf04e4RJfSPBxD642k
	7Lkaj3k7NBHHaCeTNjOjFjAJiebYMK8=
X-Received: by 2002:a05:600c:e41a:b0:4bb:9959:54b8 with SMTP id 5b1f17b1804b1-4bb9959552emr100442045e9.32.1795518263196;
        Tue, 24 Nov 2026 03:04:23 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm422020975e9.5.2026.11.24.03.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 03:04:22 -0800 (PST)
Date: Tue, 24 Nov 2026 12:04:20 +0100
From: Petr Mladek <pmladek@suse.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
	Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Eva Kurchatova <eva.kurchatova@virtuozzo.com>,
	Yafang Shao <laoar.shao@gmail.com>, Shuah Khan <shuah@kernel.org>,
	live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] selftests/livepatch: clean the test modules
 without a kernel build directory
Message-ID: <awVvNNnQPGyNWb96@pathway.suse.cz>
References: <20261110161050.2451750-1-sashal@kernel.org>
 <20261110161050.2451750-3-sashal@kernel.org>
 <awQUD16CDFpCTxaQ@pathway.suse.cz>
 <20261123154433.1188237-1-sashal@kernel.org>
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
In-Reply-To: <20261123154433.1188237-1-sashal@kernel.org>

On Mon 2026-11-23 10:44:33, Sasha Levin wrote:
> On Mon, Nov 23, 2026 at 11:23:11AM +0100, Petr Mladek wrote:
> > The two parameters "O=<kernel> KDIR=<kernel>" do not make much sense
> > to me. The command starts compiling other selftests. I get:
> >
> > $> make -C tools/testing/selftests  O=<kernel> KDIR=<kernel> TARGETS=livepatch
> > Makefile:4: *** Package alsa not found, please install alsa development package or add directory containing `alsa.pc` in PKG_CONFIG_PATH.  Stop.
> 
> Sorry, <kernel> was a placeholder for the kernel build directory. Pasted
> as is, the shell takes "<kernel>" as redirections, so make gets an empty
> O= and no TARGETS at all, and its output goes to a file named
> "TARGETS=livepatch". If that's what happened, that file and an empty
> "KDIR=" are now at the top of your tree.

I see. I have never used these parameters so I could not imagine
what the value would be :-)

> > Are these parameters really used by the KernelCI?
> > Could you please provide link to a build log?
> 
> Yes. This is from Saturday's x86_64 build of mainline:
> 
>   make --silent --keep-going --jobs=8 O=/tmp/kci/kernel_build \
>        INSTALL_PATH=/tmp/kci/kernel_build/kselftest_install \
>        KDIR=/tmp/kci/kernel_build ARCH=x86_64 SRCARCH=x86 \
>        CROSS_COMPILE=x86_64-linux-gnu- -C tools/testing/selftests all
> 
>   https://files.kernelci.org/kbuild-gcc-14-x86-kselftest-6b01150f99c74e1a99a2a261/build.log.gz
> 
> > So, maybe just the sample command in the commit message is wrong.
> 
> Yes, it should have used a real path:
> 
>   make -C tools/testing/selftests O=/tmp/build KDIR=/tmp/build TARGETS=livepatch

This works for me.

> Please keep O= and KDIR= in it, though. The paragraph is about modules
> built for a kernel other than the running one, and that's how they get
> built without this series.

OK. I'll use the variant with the real paths.

Best Regards,
Petr
