Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795515712;
	b=ZKCUit4mlRXLzpZFWz4viuu7v4xN0vFgYlHMJHr0EmJS9LSCqBmgpozu0Nwg/Q9Mk1eK
	 kKhd6oIGpTJWHh0oaBclIwlDVwRcG+Au0Iazq7HU+2pcechPofknK+bgvNEuP4N6+YTXS
	 t1nxjZdAKyushU8IFc85kYT0Kp8akEP4cVGENG7rRHSewCTdWTQAfhmpWCQ1ZcwpjqXxI
	 r7g7DVzGf4AqfBnggkt/e9YQWeNK5zPhYQXTZ7f8rjEsY58P7tAVwNMmhbWTyS18X0151
	 Epil1QJrq1LTqGqjK0Aub243tG3zNSlkUD8DHiseXqWH70jdLnksnA+aoWco3speIFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515712;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=EAb616aCFKaeCBuW+s0EO+gYz957AjGDpcMTSjjRJ0k=;
	b=Q6rdoWHWtzi72b57OcezYt5lQyS3vYTi4SBSN36KnFaMgVor3frN86V+NSWnPG+y8kFx
	 gmDV80sD56ZWzYI2/dDTBfDqxhzmAGJPvioSFLxh8GnHZHCA+CaczzpBfxRRtiTVVaaDs
	 M5spOOnr/KAFhM+9eydIP63NkLlnRFrcyCU31dDncziiv912Cf7cFUD9W9hbaxnCnDZjb
	 roiBSZzkM5+HyxRfzZTVfXvsZVK0O8piyx/UiX2HK+B54ZB602002EKIECSE00GwJ3S9d
	 N0YGhci3kWQ+4PhLXZ6ocb+XheNmBeEUjCAY0A53TZ6IWLk5bWMe1FC32MLdsic77aQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Lk1liJ0A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBF3606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:21:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CBF3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Lk1liJ0A
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c5118deebcfso633442966b.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:21:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795515711; cv=none;
        d=google.com; s=arc-20260327;
        b=N7ohAspUswRGZivbXpTvKEqCjDp1W4Qgn9hPGd3fJqv/ci2RlguSN+LSx/R0DCs+SL
         hWeCLo86hTGPjGelBH5J6+EUb5z4C7K6PRq++/OP2qdSYTfHCR1J+ThH36lQVm57m8En
         c3+qvlmBSYXk7+x60P9WUstzf4Er3TfoLie85evVtp/wUYugUhLW1vgs9v3oEUakPco5
         Xqqq/nzz4TsJqv3jrCR1XyCjGG0/tb425pLoYrwY0sAW2ifcXLHJMNevbHJBN17OBJZH
         VlBLnhtD/cA6b6kMAYU+RbTsftiUDRExsuqR0w4Rnionrybc95u3r27lDAXrZ5O7fHcW
         uLjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EAb616aCFKaeCBuW+s0EO+gYz957AjGDpcMTSjjRJ0k=;
        fh=G8Vhdtb0kujXMfSNRcp57LtV9dHu0TARQxMEVlK3qM8=;
        b=sVMAHSxYVxXhqrt+UwUU+08icTK2Mv8eJqXpGKOHt5VACJz/HQU3XvJR7qTubEpK6U
         Aa+PBZyPhDMsdlZpHz3XrBBSEQgxfGbW/I34D8mh/ayYHyAlo7pWExpQK2KJPwB5Xf9t
         g3WFkWhW9lsmdZ6mCn1HLay+MWQ4V1/nq7caT5Qg6TQNz9kPrcqICrSQnvSi4tMUwd65
         K4hJhI0s3QN4kDMzgl/cW3KM2LUrT9Tpfm8Jw1yO97r9uwiHpUX4ddOeLKKtnYeYLbTs
         C6jgn9KiT8TSNn2gL2gQiRKHrTDm8dYQOKlOKAW0NgWr9cVGgk5e0Hsku1+dCHhAIDiw
         QJrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795515711; x=1796120511; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EAb616aCFKaeCBuW+s0EO+gYz957AjGDpcMTSjjRJ0k=;
        b=Lk1liJ0ACWNQ1ODfdqGHihGLN5SxGl+p1YIPb8cR57G5wO/7Vd65Ebrd962f+US2JI
         OfBHEVXzwnI3MPOKzqxv3x9ZPSdowaxWPlzIPGf3HXFsMk5+AOM1xLRgvc+xu2Ub1Htz
         7KHDW9KCGKJa6eQ9Mfdkw5ZrLOFo7Hq1NoplwonbgMpKWkyj55qUY4o4VxnhHdMaZJkl
         +q7loZOVP9Tl0ja1ijRAatcWybALqcPybHeP/xVsoESM0cxnnAFCS44ui1iQy2cD+2Gp
         1CnTU+xuWFxC/aIPFAlkdSbuNJNfLdMsPpfgEKq7E00P289lF5ZcT1ceZWTnpkHWzTPk
         OahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515711; x=1796120511;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EAb616aCFKaeCBuW+s0EO+gYz957AjGDpcMTSjjRJ0k=;
        b=pP12IvOr9fc/qFDrT92PeGUTMBM9YEGHSHyretqFQBBz0bc330k3viyNehxnfYwWQv
         SQOghdSVyrjFSKbYgCxNLhMopz1v92Sv97f4IyN+AZxf9zVHQjmyb50Dp99I09sImfK+
         O+CKfSHRMCsgZ4tNMo+IlUYStMfQja9Io/UJ08L0egPeDpmhBT0GJ/PJMe+7LgqZveb3
         J60nWhnc7sSvyAdAs2KFa8UMdxKOiCrNOudbnNNVUdneo1E8jpsoIgISKgg+Jc8nJCSe
         Uxlq041s6eE46MXpG0D9eyDUxCIPCxlulE8XlPzWllTIf4470tdqM+kB0XndvumkVXIE
         EQQg==
X-Forwarded-Encrypted: i=1; AL+hErHqJadgj3mUn6ZuhvXu+vphYmS2R3/rfKtLmzkfA+6TlfHeFxQX7T+H8k7w+P88FpF4t+yi4XSMOXqDsZA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+nOSOGMqAlkg56230XciQqnlBBSMKWD3aE3LbKPWBIFSCvM/x
	kIfDvAtg9/NHXnUymOnXdJ7nSZ27To3OS+eIo9luGXE2DiemGN+1TQlKQmGzbADHhuNI7eZbdVl
	r5+V/Qi6pSSxD8ojD2USnhq/MzUWDLjgGSrt7+fdVugXt35AuY+QuhXE=
X-Gm-Gg: AZFdTZfi+n/t3KDHuIoU4qo1+SWYdgkEVSxuDTs6uCmzr687nVyhzip7ZThGK9xp6u8
	CwUuIpijrJUF/wjMIICpJ4Hnw3RYpBJd5iVCwXgNiZZdlrUTWuXTA8nxz7F64CjE2OFjL9KH8Be
	xSbh6FqYI8tvCRE9R8N5MjszLMK3ecHVRCMDKa/go15VMb5R1ikM9mb0PZ17eQ5TW0mr9EjjwI/
	YUIGdacrJz+Dl3Cv5XCIaEicu3ySBEkElkyjtICIcoNKntoATWFPL4dlYcCB1CKUlstPpSAd2Br
	h7B16pB4ygJ/kF4jFVfyPGFpnVj4/dAWv3EQ4JhzAwJpZvgz2hJP1Flg6QBvCkDKi1EC3m3HT71
	UMIn3pFQQCHQ3mKepibCIQWK7B/7+TXQiutEyoUv4AukRCmnXrMMlP94iN7p5kuGsb+MMGQ==
X-Received: by 2002:a17:906:f59d:b0:c2e:61e:f4fd with SMTP id
 a640c23a62f3a-c513a47e316mr1137772966b.5.1795515710841; Tue, 24 Nov 2026
 02:21:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122015729.2512645-1-penghuang@google.com>
 <CAKfTPtCQpVhtVT7Mhqe1=Ukcmc1pX8Jgn9ypb64--8cJ-7G4BQ@mail.gmail.com>
 <20261123160934.2289260-1-penghuang@google.com> <861e8b931f99acf9c44cff722d5e94e7@kernel.org>
 <20261124004742.1248371-1-penghuang@google.com>
In-Reply-To: <20261124004742.1248371-1-penghuang@google.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 24 Nov 2026 11:21:39 +0100
X-Gm-Features: Aa3M54poptazUM0JGKgFwqYCHNoqGw1XuVjKaJum1hg2U8ffwlyzLqavOvLaj3s
Message-ID: <CAKfTPtANtEnDDOe-PdLVR3BU5_cm9LiWTnU6eZJveUs4Py4qog@mail.gmail.com>
Subject: Re: [PATCH] sched/pelt: Skip dormant cfs util_sum under scx_switched_all
To: Peng Huang <penghuang@google.com>
Cc: Tejun Heo <tj@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>, linux-kernel@vger.kernel.org, 
	sched-ext@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Nov 2026 at 01:47, Peng Huang <penghuang@google.com> wrote:
>
> Hi Tejun,
>
> On Mon, Nov 23, 2026 at 01:48:44PM -1000, Tejun Heo wrote:
> > I'm not familiar with this code, so I may be missing something, but
> > doesn't __update_blocked_fair() already do most of this? It walks
> > leaf_cfs_rq_list bottom-up, flushes cfs_rq->removed and propagates the
> > result to the parent. It just stops running once scx_switched_all() is
> > set. Maybe the helper can run the blocked load update once on each rq
> > from that loop instead of open-coding the clearing? If I'm reading it
> > right, one pass after all the tasks have switched would take care of #1.
>
> Yes, Vincent suggested the same thing, and I sent v2 earlier today doing
> that one-pass drain via __sched_balance_update_blocked_averages(rq) in
> scx_enable():
>
>   https://lore.kernel.org/r/cover.1795462673.git.penghuang@google.com
>
> > As for #2, are the leftover sums big enough to matter for
> > update_idle_rq_clock_pelt()? It looks like fair can leave similar
> > leftovers behind once the avgs reach zero.
>
> You're right -- for update_idle_rq_clock_pelt(), #2 on its own is tiny
> (< divider, i.e. < 1/1024 capacity per recently-decayed group) and is
> not nearly enough to cause an issue once #1 is drained. #1 was the real
> culprit in our reproduction.
>
> I only split #2 out as patch 1/2 in v2 per Vincent's suggestion to clean
> up the util_sum != 0 residual in update_tg_cfs_*() when _avg == 0 (which
> otherwise keeps cfs_rq_is_decayed() false and leaves empty parent
> cfs_rqs on leaf_cfs_rq_list in fair). Patch 2/2 alone already resolves
> the sched_ext issue.

If patch 1/2 is not needed for scx_switched_all() case, I suggest to
skip it. When fair tasks are involved, the *_sum will decay to 0 at
during update

>
> Thanks,
> Peng
