Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.221.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794940774;
	b=I0DZJIuIB4S0ENyxzg5ZOzOCVWUSiBP7Oj1jj7lVzfO96nAZNDxArLeL4ALq9q4/B7G4
	 4nTJ3ZPh2sJbctvAvjtQUQB05uUJ5kMueVRcPga5YJr9cEWHDUQvoTeTUNQ9XHUDoCnpN
	 ip0yD1XbsG0fHZG927pDyo0fhglUbguc80pV2zHtyrg6osKX3+J6IaewXEARezjcKr6w4
	 9er7c80rb6XLTaFrl0pDb8WFE1q4m8KFYShnQa70koKGV9FIUV0LyHWZiOy7DXfMAv4nA
	 BrbiySuE8IvNEBimviJ0XIsPOMqqEtw/VEQbGdTQqlt0Rjo6Qs6AH8YZRnvaarJjOmw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940774;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lncRKJb281LFN/OuiZfN4zyt8y+KUOcywEPbnI0NV+o=;
	b=Wf2VACAGDKjJFXXduaO3JQ3yAsPm/l+5887iQ8lEIZX5pgCO1+SUPw7niTqmccWwzZgL
	 nRkilLBr2RidwtGv9I275hOB+MvG8/6XDdys5ikRxL1JmSFqB9koKA1WwV4njlBSae/E8
	 tLh8jUVW9iRYhVyvW+JD8whl479Mwx58btLbyWNjfRDcan87mo3jol7Pz9i1OX4qqHvSo
	 WmRix1BgPRgy2H3KumL+RVfh+EJbslMn37fVHYkaVnsE6Ty52mXFXCnuyVO3vZqttU3I4
	 LPLBjMmCWrl4ERY9lwV1tDKURw8hn2IgJnATK6x2+AnOYI/YEpNTR6lg/NQVyjzrDcg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=n5apFKsH;
	arc=fail smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90895606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:39:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90895606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=n5apFKsH
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4919a880834so55127f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:39:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794940768; cv=none;
        d=google.com; s=arc-20260327;
        b=VzorSrGeDVBsZQH2FeI6Q/684E5hr8WkovIgowwJwLbn71UkDB72uB2QLeloWEPd5M
         6KD0Z7i03wIcwot/wo9g8JTfFvPXK/zmJWnMRNG6s2rG+yc8HTMSr31lyKxO1xV7P8zK
         BDeaJ2Oa5weSMd14blUeA0S8hRA8pRDmXs8hY8RYTbBmOml1R14CQm657Jb3l3od8xBC
         QzJlpjZTNLcasj1sDfFMNuWDwJnjW1rO2ZDa+sUK+U6PKzA9jydxSNDvmMfI6nHRZeEy
         csApkO0EFGdevnbJNEclXV9YuMkkfZv9DRwH9FyCQWrdoPRLDlYQ2kYttAh5hD+OB/sE
         arMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lncRKJb281LFN/OuiZfN4zyt8y+KUOcywEPbnI0NV+o=;
        fh=sENjUcWfB/phUxWCasDq+4IT+Poab1UTKo9/ewXsU9Y=;
        b=smnNP/qzvRE7cpc27ncVbtUW3QL8fsGJv3NnpdDoDiH6hi9BjaSJLzxNo185212DOM
         3p/c/0dqEiyWZFCPf75fN9X0aV1ZDrq4MTtajxnJE7oCDHZ3oCi60ZhwlTxmtUo19DuS
         H8nLvVGEbQJUibfGte/mQEZxGmvPox9o+qKb7U9EijbD4zWR7Q9nwrNtUiFD4UtvCHVV
         6Zoc6Mnd+RdiG7fcCupikTV4N8LURFfvpBxRv/JYxSJTj5gR2/BmHe0kuVPwge8Dx3re
         Ap4sielXFabZllWjUmQGmq3wxYoCKh70FwhGFSn5MUGP7Z2JUEivbi7EAViEvFMXQ7GH
         nGWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794940768; x=1795545568; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lncRKJb281LFN/OuiZfN4zyt8y+KUOcywEPbnI0NV+o=;
        b=n5apFKsHwf1RkT73La0rNipFlNdFAyw3BALQ03opkhnzeT7XyhW1iksT9yArmvpHHY
         kpx8Dru2j5FSYl5ka+rCZmn+gCR3qiQJBQSInOTYAPc9s4Jt/QnNIGuBasdFnevNnvLE
         n9ALa2OSeEZEbFrDWZr9iH0a8sgmUroInfZw3/rCo9A1ztWfjYLIpBj0JS1c5P4kf3Ls
         wg4Ma2ddvz2TB9QeE0IvcTKLiAFr2gSU8Fmq9+K0u9smaJyTiN0q0zCPo38nKT2LXbHC
         5BJkQLiUWPSMdF1i2QB3ImuhOFCv5XOxM7FjT1ZdeFG3G/sKPxt3rq82T3Vqk+VWus36
         GynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794940768; x=1795545568;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lncRKJb281LFN/OuiZfN4zyt8y+KUOcywEPbnI0NV+o=;
        b=IiIK0bban2aHqxSsO9tjWkgq2dAMkY5vTE0bC3T1HdTExujm2lUdLwhCGYUzshWqJ8
         wmwx8+erCmZgnPNzxUllHxa1v1i9bBGZLt76gaPWaFLlY6OO7FJk9tGQTriiEediWPu3
         5/xIBaRzDVR/aE1Ne/xbQWrdN4XI/7Y0xgDr7ASwCTmRsr/dXLoa3ojFMIe6tqMnHEnj
         ytrG9Q9cN8DB6cI59spWtE3qdScSLaTd2C7z5j+r+bq0BZ+OZI7v2HO+0eFntgRPjJ+G
         jnBsI9t/WSDUQe7ebXHcqEoxjjgirp1AS/aH9N91WEIjowTp2wKA8JDP9nldbBskkVNR
         IFSQ==
X-Forwarded-Encrypted: i=1; AL+hErEIwEqNTw9GI9vOoCS/Dx/3dDt9/RSibqlJIvGrJ09kIYB/9T88tE6skhq8stZUoUaTnp8yJoX00xLUNHw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Yrq+qgtCA+rxYCpytlFZzDyiZ6mBoQL7SZHzgSf+u08bs0eGS
	OxweqtRrE17AIstpzByw8uMo0wT+CEtHJ6PcN4nngVELY7x06mOIbY1xsiMEZfE1N1zA81Q+HRw
	ya1BTuzHWU7wA1vXO4NeODNKbM4MWSF/TZ12rNwrs
X-Gm-Gg: AZFdTZf7Vq30WnIZX7JtiC66LFRR6vQNShZwc17zYASyuVprjjnnWPPo+BMteUgBrML
	XssI6kRf48BeOZhszreb66FRJgRVnqYaAaO7A45pHgVLA7AqcFuR1N+20mj9lgeZr6X09f3XUsg
	cYRRpAosvVfduMPytN7VVXyfCCHo5vuTDzXN1iPpUBR4tjrpDaszf64+dhwmZ4rw8jpmqt1gzbq
	HctHLZOLJZs9l1vycGGQeGenAHokxuYdv4+Eusoww8/nxNoqe8OQdtcbUEoY3zAmgxpSKxvV/Y6
	sfFwgjlHuSEmLOIBV8EPtsrsH4/GIO14DmufRlNWTdFaQtXigcQtUHxEZickVnzdRpE4OnDTdVD
	raxIyAw7k40XijUm6ZfitWblQd6EXkh4g8SUJ/7t+gRxCyta+MXB0+H7/tqm1bzR9PoFmP6jTPT
	B11HkgdggCCmmccWQt8usHxtumfh1IbZDTpGHb+PTG7FemfxSSKcS6i/S/JbGm6WE4ZeXLebahB
	MAaCKoY/h8lQ6yk06SWtL81w0vzWkpdgQrQig==
X-Received: by 2002:a5d:4b41:0:b0:4a3:8b21:51bf with SMTP id
 ffacd0b85a97d-4a63f182f83mr533473f8f.48.1794940767380; Tue, 17 Nov 2026
 10:39:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-topology-wunsequenced-v2-1-54611119172b@kernel.org> <20261117183043.GK1813469@noisy.programming.kicks-ass.net>
In-Reply-To: <20261117183043.GK1813469@noisy.programming.kicks-ass.net>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 17 Nov 2026 10:39:15 -0800
X-Gm-Features: Aa3M54pKRYI09jyRw-sTO4FGJp-XI-xiu5wM8zF3drrRidtrcRZTdo0aa8zBllU
Message-ID: <CAKwvOd=9pjhCnreMvoAH_0PegYg60ouaZL=BAjB242bE48J23g@mail.gmail.com>
Subject: Re: [PATCH v2] sched/topology: Avoid unsequenced accesses to jiffies
 in sd_init()
To: Peter Zijlstra <peterz@infradead.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 10:30=E2=80=AFAM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
>
> I don't speak enough C legal to actually understand the Changelog, but
> the actual change seems daft. Is this really needed?

I would imagine a delta of the disassembly here before/after the
change would make it more obvious (one less volatile access, which be
have arbitrary ordering between initializing other members).

But I guess I'm also curious why jiffies is defined as volatile
anyway? I thought the usual guidance was to use
cast-to-volatile-qualified pointer during access, rather than declare
as volatile?

--=20
Thanks,
~Nick Desaulniers
