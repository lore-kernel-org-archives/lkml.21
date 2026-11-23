Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795434566;
	b=JYL628WX4btijqOwIhDK1HbAyNbFzdYUjFmj6wCEzvyRaiJdgLgBt1Ob7umQKPGMFP1B
	 bMiKFnRGNO2M5Q5mqLn9XktMdeV5Ncqs2L6vvheR7x0uqRdJ50zt7+MNf3/14JBuIczDJ
	 D0wsCl8AP+uWkDY3zjjGCmeg6jmDZCgtaqmTMAJX/jU81sGkOkbTLFO10Ox8vjfqffVVC
	 fX6XrR9yDll87ElzNhLWnFw2zeZU8uGjqmxatqc9QwEYSH48Bjm+Q1wnacccUnjkQC6k8
	 ce7K62bcecXm22JjCYk9+Hho9HkOHSKNMz14+YsGrMvukUXnM38cRk2kbKcoNidiCNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795434566;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=DLWiLwlOa1M+CGXscE3EqyDLFhF6yXj7XzInNLOita0=;
	b=noY91Q3y8xfHIprp8uD5ZGI6kP5Tc0M+6u2WD1r/0/lpzoMNJ+GqMhMdf37XJE319I5e
	 nukfwkWEZpA/5dWqF0IqgeacnfaR4Hujh+uN3sfApb5EdrYFEzxfWaIyLFuCUbMdY4Fcz
	 HlsYepFsRNdiQzamo0Wse8tDLgJXn8znYHMiRJTRuVynnYO7nOcAVkv+u4pLsDLh9Axc4
	 GntivSkrxCDMBUzGaZhlG0S+OQeUQeInuNLFGRsdxNbGRBXJV2F2Fvn2wEEl/EoFUBDWe
	 PGg7F0gTz7UUeYKc4BohdGUZgbKTit0UtZUN4MjrDedZrHcL8uMm0AAuQrTLV71N3xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=COSYS+dN;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8551C606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:49:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8551C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=COSYS+dN
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so26142685e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795434565; x=1796039365; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DLWiLwlOa1M+CGXscE3EqyDLFhF6yXj7XzInNLOita0=;
        b=COSYS+dNefZdqkxEJffuyhbTfHZeKxak1CQ0RmWdfYG/c4CrsOyFDid0VbHd6UUsK6
         ihEatHsLxMtusANsLiY+BgbJWxgE0PZCPAKSrONc900gvT48RIc8Lt3k0SePhL0EuiLp
         iCqCg3WaH4eDCOQK8gwwQKfI6QaLrqVWzUSiGeq68HfJUxeW29GpVAZrM841aJlBK3J3
         VonNZrihmfRFBsNBIllmKxy2dmE0Ibd6NPiXIhAoAP8BLZwH0BERyiIkBynx2L7Is7U8
         aUrhCKZTr+OpE9Kc3GhxM8evfIqq7RvvojUPrFA6mQOInvzwjBi5bS6SuKvShmskXbMm
         v9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795434565; x=1796039365;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DLWiLwlOa1M+CGXscE3EqyDLFhF6yXj7XzInNLOita0=;
        b=gRVQgrF+7cqGBndXXVio704fc6XyuOuQWwH4kC9DxN2NHKO3U6lG3Tj/KMyMAVNAvD
         4G9+R/Qjlp9Pt1FsC2aHcBBss0590CUh4Vc+r9tmzmv1M6oC9xNCxX996ZL5mdkYqv0s
         n3OKVrzb/FR4WlWnEvoGdgIy9LEdbdnVubPS8SjBzkRop8cNdnl8EKTr4Tk7prMNaFnQ
         rCPRM/WhMjcRj1+XnOQ1B3U4VKk0b8XnOOpUdDybC8GsS1fu/ZizgWGmmWKIsyhSYjpn
         +josj3GdqwGrDyaPYFAht9D5hBUz46IvfBlzRENGUqO7K/BF5CQn7R+rVueUtrj+qWGQ
         8WkA==
X-Forwarded-Encrypted: i=1; AL+hErFXL+nNspjJmhxvJ1H5ZcY5esaHNDFChpUoFrRLxG7+/izsa0Gue3/aTmyUZurN5Tsuj8CC+abnbMB+o2c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nFIadz0acUMtW0xZ03/hq6Yqv0zEjrblW+waL1X+7xxYabbMo
	hR+ZMiEc0ahJdPi/jRW7KSkibefEOfZCxyZt0WNcZU0S6/bckWJM3SqwBNbN+lRxVIM=
X-Gm-Gg: AZFdTZcq9a04g9rYgsLLBQSL2id9xC66gOKCJtH26RFs17Yf9eQxNzVuMphJDJn7wOX
	NJjAjaDJIre6sBwr8oMnfxzfmJ7YyJgRGizusmzt1RipLgN/krDrPfKK78W3TfiMIR4PL1g8ZWF
	M/FbMplGquiIPxo+zXspdNg8hSHOz6ksM/VgSAg1U3OZITQw2qsD3Fyjoyz6d6rPh0AKirgwbiJ
	YE/ohbWqijEmjs87Yy+SNW/GKdCM07WkaNHmttQ2PEMzP4QqV3QTG6dRSPlIxxKAXWyVnCwiA1A
	DhmyyRa2uMejjFYH65ag3GJxQaA4dfYzo5dhuO/sTUN8h5ufrWro2QTpSheJbFi+vtUNthKF5Hx
	Epdwl5Zi+386NtW5YH0vcrdkZBYRkDCAoiVSDMxDyEP1YehtU6Q41kcuf5ENe/OnV8pGXEpzDfB
	GE4RbRGnzwfww6tAmt2HFSAf53JDKL8zKecb8v4+w0LLuy9p8sqk447uWLsgf/RJ2ZqkkkWYhqz
	LTykIZr7ZlWbp0M3QH7h5SiJ3CtB2QDQjHY8uwEpBSresoKThZquHznOFiaIJIMnuysT8bgUyo4
	ZYUYUENznQhZ9wLyxMKcKjipurFV+IZlUU5pv+aOSEY=
X-Received: by 2002:a05:600c:1911:b0:4ba:38a9:85e3 with SMTP id 5b1f17b1804b1-4bb8880eecbmr256789465e9.12.1795434564856;
        Mon, 23 Nov 2026 03:49:24 -0800 (PST)
Received: from localhost (109-81-82-199.rct.o2.cz. [109.81.82.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm337727695e9.5.2026.11.23.03.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:49:24 -0800 (PST)
Date: Mon, 23 Nov 2026 12:49:23 +0100
From: Michal Hocko <mhocko@suse.com>
To: Tejun Heo <tj@kernel.org>
Cc: Zhan Xusheng <zhanxusheng1024@gmail.com>, akpm@linux-foundation.org,
	hannes@cmpxchg.org, roman.gushchin@linux.dev,
	shakeel.butt@linux.dev, muchun.song@linux.dev,
	penguin-kernel@i-love.sakura.ne.jp, mkoutny@suse.com,
	chris@chrisdown.name, cui.tao@linux.dev, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, zhanxusheng@xiaomi.com
Subject: Re: [PATCH v3] mm: memcontrol: don't miss processes whose leader has
 exited in OOM scans
Message-ID: <awQoQ4Ib9nCcK9Z8@tiehlicka>
References: <20261121073222.834282-1-zhanxusheng1024@gmail.com>
 <awQRT7InNqEF-K8-@tiehlicka>
 <305c5803b904a57c188b505d6ed9e1e4@kernel.org>
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
In-Reply-To: <305c5803b904a57c188b505d6ed9e1e4@kernel.org>

On Mon 23-11-26 01:13:25, Tejun Heo wrote:
> Hello, Michal.
> 
> On Mon, Nov 23, 2026 at 11:11:27AM +0100, Michal Hocko wrote:
> > Tejun, is there any strong reason to keep the exiting thread group
> > leader in the original cgroup? This makes CSS_TASK_ITER_PROCS iteration
> > really tricky and error prone as above examples show.
> 
> No, and I agree that the leader should follow the rest of the process on
> cgroup.procs migrations. It's this way because controllers primarily care
> about resources and exiting and zombie tasks don't matter much in that
> regard, so migration skips them and controllers don't have to deal with
> them. I don't want to change that. It doesn't make much sense to teach
> all controllers about them.

Agreed!

> That rules out the full migration path for the leader, and moving it
> without one looks fragile. If cgroup core switches its css_set without
> involving the controllers, ->release() sees a different css from the one
> the task exited in, which breaks e.g. pids uncharging, and that still
> doesn't work for a leader which is exiting but not dead yet as it's still
> running.

I see

> Maybe the leader can pretend to be in the new cgroup instead. On
> cgroup.procs migrations, record the destination css_set in an exiting or
> dead leader without touching the css_set it's actually on. When a
> CSS_TASK_ITER_PROCS iteration finds the first live thread of a process
> whose leader is exiting or dead, it looks at the leader and visits it
> there if the recorded css_set agrees.
> 
> That leaves the leader's actual css_set and everything that the
> controllers see as they are now. Only the iteration changes, and exiting
> and dead leaders are handled the same way.

Makes sense. Thanks a lot Tejun! This would allow to use
CSS_TASK_ITER_PROCS for the oom path.

Thanks!

-- 
Michal Hocko
SUSE Labs
