Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795464862;
	b=EpbFMcro/KhALa9/1FwfyJ/JugBOavSZaYgoegeQBpdGjqDfR6LtucPTLENx/cJ/tePI
	 gOY7+IgXgSmbM6rde9ZFizq98VFyEPyof8UhHhzoppnLx2t+GBpNBS0YxkmgxLYgkVt2o
	 ZxjL/gEe4EBjyxxf2tMB8cZKSdpgCyDUIbB1/If2vC1zfblKxYPx+au9Gnpt3cuBHh+lb
	 L/bIA6huQq7ortBcxQKmv6bqegBhJxn4zaMe6+iWjf4bXNTTqhD9AglLxnsIxnklY1Q7C
	 sxns4fe8ERh20Rmo83zxClkNRQtfJOD++N+g8mdY9d/vUlQSAoqLwCHlpkbxQbcIMNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795464862;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=cPrfk6ONyb8N7CKSwNcuu5XHZjwnL6CQE/ckKsJyYbw=;
	b=unFbKCqTeKFXs/sgIsGhy9mWdVfXGpd8CeVDpDsPJ/kIp6hhLCvWpDpTg9JSa9fIHURB
	 MugizEsqUYXMyDdPe47U/XUXrGd+SaLypoTx3kUXKLhTT1WBFP372MgB7xPvgL0iiGDcq
	 6mPy0OhEilP/HPlSjw9BY1G9az5+A31CL04ZT8si3sddfutfgT1cu3rLm0EbkOnZgWxqd
	 zM03/mWS80ykNHnrNb5tJXGxMK5PJkWV+Zy6l83ruZLZVv9ZtIu5LAOqPBJZSrJLxiixk
	 l81GBukMGpzvg6d/iH4fvPNvwFnMpDIRuc40V/F9Il4HzYYqd3WfBEtnhlVZEgb4ZgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--penghuang.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JeV+denR;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0319D606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:14:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0319D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--penghuang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JeV+denR
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386177b0516so10005510eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795464861; x=1796069661; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cPrfk6ONyb8N7CKSwNcuu5XHZjwnL6CQE/ckKsJyYbw=;
        b=JeV+denR+5MWRUHToxTFJvsyZ8ujMCOgwKYy+o+jl7EIKxx+bBL5XrDvz6e2cyVCaX
         SnhZkQv3I+Krw5EzRl+89Y3QSLSGt9/ZESoRF+70TEywkQvSGPkogEoeGFNJbaHBiiU9
         FtlOcadUp2OSkcri2qUgsuqT1CKhgn2piOTjpE2THBopgdX5PRvtPdu4SaK3H3irXcXl
         jiZzGqBYvEYe6RlGPMj3GDA7AFZbCrcVl4ZHzmx66PMbzOnqfQUEcOlvvMVQO948Q7DZ
         +IywqbUre79GDnHgQD4B2k+4pOWOeOGSTXEBm6cYk7PbOREmjDH4pNjVVNNGR9h14eRd
         rK+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795464861; x=1796069661;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cPrfk6ONyb8N7CKSwNcuu5XHZjwnL6CQE/ckKsJyYbw=;
        b=N53Cv2kSRVDFQquxz+PEYysF8yvDYOuRl9oE9VOKhRaWjkVJa5xyyJwiqrVMsGShHD
         CKOUgdbhes++y6EN/28To6YDxwDbckhPW6IepmYupNZ40gT+pVXzP7B2PM4xvIxF2Iix
         JsxMwJRSIMYfC7z4w820jhkiIBDJSBFtjZ0vuWICU7vQdeJbwudzsmQ/dMLziUh3PSyI
         9B/dkhWIierfx3JXanaoVsXBlHomKztPfEvHIyYx140p3XJ9bxYxco3xzZWGo8Az3wec
         nSNuuihSGImGUeOwRzqhrTQhPBdMuSUYDLzpxhcEpoXoiUfpwTmMbJp1tUTvEAsyReJe
         OnVg==
X-Forwarded-Encrypted: i=1; AL+hErF6UkOr8bA8Zfco6DdVh1VCKtFdFOhG2BQYU+OGgNrucWk37FYAspwZAB64+9qGNItliuZ+b5SCfsDLGhs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/syUKUiCyK91yEhBKLxgef6HySN5xm5AGJ/0AuY0rQIrBrueSm
	sInQtMTP+TYYMyWDK7XCntJWVF7LF8ipGaQEXJGE4VReDIDjBIDl06J56ls9roWo4hMmSBT+Svu
	65Zt7vy9VOTJRtEv9rA==
X-Received: from dycai24.prod.google.com ([2002:a05:7300:fb18:b0:385:58ae:e3af])
 (user=penghuang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:87cc:20b0:358:3426:d601 with SMTP id 5a478bee46e88-3856c0d0961mr13564449eec.2.1795464860602;
 Mon, 23 Nov 2026 12:14:20 -0800 (PST)
Date: Mon, 23 Nov 2026 12:14:20 -0800
In-Reply-To: <CAKfTPtD17e-veL1QgrhO6i4nsKyA3QfOEm8jNinJ_zf+vc8RDw@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261122015729.2512645-1-penghuang@google.com>
 <CAKfTPtCQpVhtVT7Mhqe1=Ukcmc1pX8Jgn9ypb64--8cJ-7G4BQ@mail.gmail.com>
 <20261123160934.2289260-1-penghuang@google.com> <CAKfTPtD17e-veL1QgrhO6i4nsKyA3QfOEm8jNinJ_zf+vc8RDw@mail.gmail.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261123201420.3970775-1-penghuang@google.com>
Subject: Re: [PATCH] sched/pelt: Skip dormant cfs util_sum under scx_switched_all
From: Peng Huang <penghuang@google.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Peng Huang <penghuang@google.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, Tejun Heo <tj@kernel.org>, 
	David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>, linux-kernel@vger.kernel.org, 
	sched-ext@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Nov 2026 at 18:07, Vincent Guittot
<vincent.guittot@linaro.org> wrote:
>
> Yes this seems a better solution but It would be good to reuse
> __update_blocked_fair() which already does the work for pelt signal.
> Regarding your issue with util_avg == 0 whereas we still have a
> util_sum != 0, we can use delta_sum = gcfs_rq->avg.util_sum -
> se->avg.util_sum; in update_tg_cfs_util() instead. When util_avg == 0
> we will be sure to clear util_sum too

Thanks for the suggestions, Vincent!

One small detail in update_tg_cfs_util(): under CONFIG_CFS_BANDWIDTH,
gcfs_rq and its parent cfs_rq can have different period_contrib, so for
non-zero util_avg we still want new_sum = se->avg.util_avg * divider
using the parent cfs_rq's divider. Keeping that calculation while only
skipping the update when gcfs_rq->avg.util_avg != 0 or
se->avg.util_sum == 0 preserves period_contrib alignment and clears
residual _sum whenever util_avg reaches 0 (and similarly in
update_tg_cfs_{runnable,load}()).

I have sent out a 2-patch v2 series implementing this along with reusing
__sched_balance_update_blocked_averages() in scx_enable():
  [PATCH v2 0/2] sched_ext, sched/fair: Drain blocked fair load on scx_switched_all

Thanks,
Peng
