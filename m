Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795021194;
	b=BcaJojZsoViQzOAvMaCOb/sMNSailiExZfAZ95TnBlkD/tg45gnsWptNv9fzT5xcCZON
	 NTEdnz3U4smX6Z+KYbE38jyvU/ReZ+5E4oXIo0rQnnlnS5s+oOF2Xo6r0WpMPstSjDwVa
	 sm3Utvz/7UEGwLSlEC7K2vqGTAdvFw7c3MFi8czEiEPH4bb/Ze/CDx1r8qBdXwMnhgXGR
	 GN1bWkL4SbzfHuxLT3CFFbRyzPfs+UiyJeK9tpl0UITZoJhLgY95KmSaet9Uk0nWkDY3B
	 1IEhW6m0eMKPba2Rjb3ZhWvwr6de851MRm6ZzvV2iftLYTBl4Pu8amv5GlKHFo0Cxjw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021194;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+eo4FKNzNbHf/eH43g1C8Z3to6Do7+2E27gt4uDxW08=;
	b=anQ592wGiqSpEYslB3v2KkGDCA8d20UPnxfCCB1HRivbYlxgIU2fcpB8V/7txNu3n6Do
	 r8YVNqO6opxxPWjYeEN26im7oYaks/fWNEcwI/E3KX/Fmn9/vRtcSsEv2f7ALrfvt290D
	 gtvnqEs72bfhfPgCi5Y9f68UQ+wKah+J1VtshyrsUiAqvyM5uRBUkgs27uGDgtse545pC
	 HRankWL2pGo4ufMtpr1TsAHJP6zGyvU/6ZyqrH1avue6c91IfxAbWNgJsMYnRiEiIF4Aa
	 fC6HYNwmgledZhvT0JLSGH9uIOCL6qwrnogBWf/iIUMoHBkQJkJKZJdKj/85YkFw6TA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="tsb3jtv/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F52606A335
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49F52606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=tsb3jtv/
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5c14f7768acso896105e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:59:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795021192; cv=none;
        d=google.com; s=arc-20260327;
        b=V/dpMgolf8otcr6/1o00jB2Z7Tga32mO6cb6A6vM0MgOeWyo2bjBlAB6vp/X0Z/V50
         NITCV2AYH+TOYd5xy2BRGqjpRoDXP6HYpHZbUoxxZcs4oKwuuGC7IXQcbg+QRol7uq01
         Qfbgb0hT5auC+rxsu6ep5VtiF2kHMLodaVQgj+pAm8Dl3yTvtNe0bNAd8AAqOHRlNuUu
         +w4Ou24xA7PJXNO8fpfzc461WNAgd9CGNIjPuo1EwMLdJkavbsAPXlsaat7FxjR4Md8F
         k/ul6DDnLV8oyxbSNXqkGllik//Dv2v0YIt0gwlnBc9aX2g8msWUGnklpjuDrbC16Ps0
         5UWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+eo4FKNzNbHf/eH43g1C8Z3to6Do7+2E27gt4uDxW08=;
        fh=KezM4UBfucfjnOluzp1Pdm9Yrd64UsO8EWfTutMGUIc=;
        b=PIrPMLQuCmGiFDjFuspO3xXGpwZcTtI3+Lb66TpZkNKAKUOyEUu74OEEbmpYcR6VBj
         DJjNUqG7Y4o3/jLqZ2DdJ9i6D+eh7qJioFTdVAzXjJxbYMxqEOScrEfRNPzsJ0GkLWYA
         At3Pxo+rF+lhSE9qbbseDpvkS3lzlGj7zpLloP1DOYLJ87gBP+qxNlrnick9O4ACY7zJ
         Ixwf+cKFjCF8SdXMKRANXTTc9ZlDvhy7kZZARVqDPeUkWHPcxUKbT3/ZiERCaMCN/tpm
         Z1B11jd925ZV9ha9eE9tLpPEXkHit5JUBF2jVfGZqw81x2LbdRXaCLg82j1+b+x6CG55
         8U+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20260707.gappssmtp.com; s=20260707; t=1795021192; x=1795625992; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+eo4FKNzNbHf/eH43g1C8Z3to6Do7+2E27gt4uDxW08=;
        b=tsb3jtv/d+zI1r94mKuk01oFSXaGJ5VfBd68Dm3Rzy3k/9SLJEJI9zvC5ERx83P8mh
         L/1k5WahXt+pRRzhHcYHDMSRuJM1TjD5VHtPSmgdvcsE7bgjMsIlMo+YJOsxodt6BDKE
         WgZi0KNeAOjP6r2GiyTfd+fHBUESbduG4DYdClB/Bqst6T6AYc3Y24sbaheI8lu+qMGX
         3hhYwGZJIpgbaepiYwepZXr+V9cZ/bQz35fnXnkTNzQzPv5ISz2zAb8tKPjJ5JQ0vFBn
         iosrC4gHAY/nVJ74V0i+yTKb1wxgWpU8SzcVufvUcALVry0duvdDvm8V8jy8r4h1xcDj
         iTDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795021192; x=1795625992;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+eo4FKNzNbHf/eH43g1C8Z3to6Do7+2E27gt4uDxW08=;
        b=afWUlwUu+/1wRRHreAKceIz2f/IfiW6tJE4bEzblRKxNPMuIP9bqsGvWWmG5LHmgc8
         b5TypK7fewW587PF1SWzOE02v1t+gZ8YIYG3EgZzfJrmmsa6TsgA2qCtwkMVnFVQDPWr
         NYVr22jG6wK0WWMBhwqZ5sd+qqFGESyXDQxM4rXXr4GGwEQ97yZNMi/ruASpvusv3uXh
         LBqS+2s71vYVDIpSmMknRKjB8YxkHb6fxPQkfnE5I67Jg+dkk7qSxbqX+IWQQ0o4Ycb9
         jKq3WxaeW8eGHcgaI/Se1C8FZD1smgQ9k2mMoG9db7bK2QI475WaIm06g1TGnJDIqoDj
         4PEg==
X-Forwarded-Encrypted: i=1; AL+hErErnMC4nY5mS8IwJVlnYWZRwvJo7v7vxRJTqYV3jjXOXUXUNADLUD/lJwzS+GTSIwBwJraDNHVMAus6hMc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZGDJQCFGOfQKfSkmhM+SE6xUx5iWR4gjFeNFNb7E6xwWhkkqC
	YSnRCUyNsDjhazX8OxKeSRApVVQjfrD6RXVx7rq4fhuXfFUdSUrv2l+9gReeMEeqzvIwGTW2bg4
	/Ei7huJ00x+tPPPD7d9ip9QEY+YwgWloEuWvZkGII
X-Gm-Gg: AYBFou1oetlTTfQOrlewhx0WAzMhqoFYeFlqbPhF8YdwIbQ7MRpmSaZhNr/DFaSOytP
	w2AUOUlDKSvREZiHPoDu+G9s3GP2uqbvHvTxIwOp3PdhSfNyOVoQ/tmMeTD9BqgKm3ZrXgdG1Ct
	WmuZmr33KlXFRZezCdPLAsIA/S8DyvkkVFzn2ZVxt6BD/8oMpmfBjWAaNNHEiZCSL5g1Tc7wSRE
	8ivjEqeIdtzspdh8f372hpiLx0kvug1KMbD3+VRT2Ci48SPhvG4b506GpyIjpvvX1QRg2y/cSmo
	GXncQmTNOug60+m7SL7kEuQr5NmrYscPt4jcih+FAB9611PCq3+uoNHM6D6boN96jjbB8+Fe7Cj
	+RHI4fXdFOwHhfTvdnjmzrfqeR+jYZFuL4A==
X-Received: by 2002:a05:6512:318a:b0:5c1:4e41:3cdf with SMTP id
 2adb3069b0e04-5c1a9c09ccemr1012943e87.12.1795021192313; Wed, 18 Nov 2026
 08:59:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117231352.3816603-1-jarkko@kernel.org>
In-Reply-To: <20261117231352.3816603-1-jarkko@kernel.org>
From: Andy Lutomirski <luto@amacapital.net>
Date: Wed, 18 Nov 2026 08:59:39 -0800
X-Gm-Features: Aa3M54p70wvOKpegO09-C-J-9l2I7cJO4B_J5hynU_tjApdK664yCTjVeFp42MQ
Message-ID: <CALCETrVUkbpoFjwSAejyA4b_9qEauAP_36i=O8Op1ifp8aUkqA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/13] Namespace for namespace roots
To: Jarkko Sakkinen <jarkko@kernel.org>, josef@toxicpanda.com
Cc: linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, 
	Ben Segall <bsegall@google.com>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@kernel.org>, David Howells <dhowells@redhat.com>, 
	Davidlohr Bueso <dave@stgolabs.net>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Ingo Molnar <mingo@redhat.com>, Jan Kara <jack@suse.cz>, Jonathan Corbet <corbet@lwn.net>, 
	John Johansen <john.johansen@canonical.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Kees Cook <kees@kernel.org>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Manfred Spraul <manfred@colorfullife.com>, Mel Gorman <mgorman@suse.de>, 
	Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, Neal Gompa <neal@gompa.dev>, 
	Paul Moore <paul@paul-moore.com>, Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, 
	Peter Zijlstra <peterz@infradead.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Serge Hallyn <sergeh@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Suren Baghdasaryan <surenb@google.com>, 
	Valentin Schneider <vschneid@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Zygmunt Krynicki <zygmunt.krynicki@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 3:14=E2=80=AFPM Jarkko Sakkinen <jarkko@kernel.org>=
 wrote:
>
> OVERVIEW
> =3D=3D=3D=3D=3D=3D=3D=3D
>
> A root namespace (rootns) is a kernel object backed by a file descriptor
> that binds together:
>
> 1. A full or partial set of detached namespaces.
> 2. A dedicated PID namespace for spawning processes into, signaling
>    members, and polling or waiting on PID 1 exit.
> 3. An initially empty mount namespace (CLONE_EMPTY_MNTNS) that must be
>    populated before going live, without inheriting host mount-tree
>    ancestors.
>
> Work on this feature started in 2025 from David Howells' container object
> patch set [1], which I turned into a namespace for namespace roots and
> rebuilt around that premise.
>
> While the patch set is manually written, the original motivation came
> from isolating LLM agents. Running untrusted agent workloads made it
> clear that OCI runtimes need to minimize their live configuration
> surface.
>
> Assembling mounts, credentials, and namespaces inside helper processes
> with a half-configured container is what I see as the main challenge,
> and the existential debate around namespaces and container objects is an
> unfocused discussion topic.


I've skimmed some of the series, and I see a bunch of good ideas that
involve using an fd to manage a thing.  But I'm wondering how much of
the value is added by that and how much is added by having a new
*type* of thing: the "rootns".

How much of the value comes from the rootns vs the new APIs to
configure namespaces without entering them first?

For that matter, the cells series also seems to contain a (possibly
very similar) variant of the same thing.

Would it make sense to come up with a patchset that does *just* the
configure-a-namespace-by-fd part?  It seems to me that this should be
an easier thing to agree on, and it's a big part of the complexity of
all of this, and it solves a real problem even without
cells/rootnses/jails/whatever.

--Andy
