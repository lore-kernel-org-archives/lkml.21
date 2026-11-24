Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795512988;
	b=xH19w5v2KUn2nX5Mc9Q9zSFDrYbSPMlliFVFaVbvLuX4R4NEB5dabwdBr2Rcr4/5syyY
	 4tKK5c1+iCP0jU76BH+OWBQNbCkymHAGNwb4eeKq4YP5/pd9yBqGlWxE50GshEaLHJOYm
	 hACoZCxoNHY4WNQuEPmpgrvb9C9tCxSKzDHNZ2RAemEPG5eHwiZ4LHBgNyo02bY1QXPwY
	 u5B6cACtwajxsZ6D1T4AANxT+jH/EYrMY0X5fTv9mH0MX5a2xlRMFMnahxyPkB5+SkUIt
	 EagIhElt83lA+5/k/xaOQfC1Pe7eCMls0qfKHRYDpqeErux5eZRY50pMdHBmOYfiS1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795512988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=4xaFFhIHoS44jXaDcRw0bQNqoPw8nDo7E07z3G8Zk/o=;
	b=B7XPR7o48fr6lhY2FaeHju/xXK3FvfLQCwyKGe006PN079AYGQ9zLvWW26t1X/ucYcl9
	 wfFnKA9MPnYR8pkmttfN0SDKaxtoduu+yNLuFkzXvr5t2EcT2RXr7K2yWbNT3aFNK7Nj8
	 Q9NARJNa3N0jilrEXgWFegzKKqvMf851+NI8Ly3hO+V+Gf0OC5D1OQGrMAVtYmwh8yC+x
	 wF2m8C2ioE63ikKRg63hP/ERUixlfCLzKPhhTOXjAY2y7OWUlPx7Y1cnKsQf6MU/K94vz
	 o5z1cIdKqAr3Yu4LWAtzFoTTOi4CfSyIOn5tYer23Li49CWub3tDTClVanVAa2yKOBA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SYia7k5K;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB12606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:36:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CB12606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SYia7k5K
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b87408c797so5730658a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:36:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795512986; cv=none;
        d=google.com; s=arc-20260327;
        b=PwCSP4dVWnBmx+ktHRV46HDv9R7OZogeYOfw94MbOUGzCmrfm1HxmjBwhMTomCAWDH
         K9VAmO+6CDP4eOimiAvtu7FOBvGw/F7cTP0y1UaWPuv/ar0dJF9yK0auLJ1ypqP0ANRN
         DF90KTF5yv+ASUTWhmy87UluH0c+4/Gi5bLe/u/GwykJloPkUceHGsMOwohCkkdAw5Zg
         OFiXiMQhcEoo7LipGQIBhvV8yMKXNSE4ne2Uv6ygA0/XtgSoSxdUoBQqdAeeSkww5bDb
         QeHuAyjnHTuUdFUtlfiH/zVL7wDvXQngnWtKy90uGyj6hSr4s9KIli2dAbK2GN4upi7R
         Qi7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4xaFFhIHoS44jXaDcRw0bQNqoPw8nDo7E07z3G8Zk/o=;
        fh=HCSKYqYFKFAePIAyBZvFSt+v5IOed/sFAR8ziKJtEWI=;
        b=dBYacUkcyJxfPbuPiVRkfF2MxtMHNB8swum4Q5ZP6hN43Xhgqid2Edg/rp/b1pxse4
         eHXCxlfcsgI8wcmrQHzzNSWzsaKAVlqGy6tXHX7ENw5ZSe2CVvomJTu9zWL/0mIEYbzg
         aeGFrLJsRKsTUNHPGsSfwNXxUqxursipTdBZ1Z9+e5vNhGzZX4oJX1g0E6Sjbd/EgRNv
         4Rl4UpwtMRauqVDJuNU4FKXim6MFGiJxYrqfgCsKnobRrUkpaQru3w/ruQl43vk35v4z
         qoUhbhhms35+5JTjB7B8HRsrjsnx7ejlx53mt78NtoLrRt/NG4vg+V1ZBWKqq5EVBSK/
         P34A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795512986; x=1796117786; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4xaFFhIHoS44jXaDcRw0bQNqoPw8nDo7E07z3G8Zk/o=;
        b=SYia7k5KDOCheCjuliv+MVnLlRbaKyKu9NTfYgvv3gm9f5dC72XwkdXuxDGE030+9T
         QVNE+iKzhWJp0D64FRsl5jWHmuCpaEw/cFINZNyQT8rwd9vLHHmbAVDI3kECt3niwwI1
         fiZwCb6cHqwnJBZwyUf/Y5FHyxXLQE2kyc79HN1jMqnihT/z4E21Iswtcunt9CNVfgFv
         M/GFzsbbjK33L9JR/ATwzIEFSQqqqlb9wt9Gylmtv86nfRcEfvmQOK7Cyu1WpA2SnHRf
         ULLYBxVKb6yMDsx8XUkNi05r/tPW7NaNm0yW/PMNLiXAVJkKLB9rf2J0WTsrnJlVG/m3
         l6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795512986; x=1796117786;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4xaFFhIHoS44jXaDcRw0bQNqoPw8nDo7E07z3G8Zk/o=;
        b=TGMLed+65f9VDh2rNQqyCW3T7kGPZkscLdhlUjyCngdbQ6oZJto3ol1mkGwwU+Q6ZA
         PVGeH8V9pb0fZT0Ha32kMb7b0LYS75FSjVXMclh2bPNul1zmVX09nNH41erR9teNkUvN
         k7Ns+RrFnf17+hUmsyqTwhbanuZQxxWy6RTz8OJyeYfenffGjmGMzUz0wbylGcQTNyB7
         UKjg3ArH+se0EwNDDQ5pvAdfvzjYK05dJt9Yn4epK9WL6CwF2TTTND6OlX0yu7P603gN
         /rl/ALu5bYnGwo+5WrGYmBOUjkL1Od8wTms0hWpNI+PWY8hfwVYiXIA4zZ1Ld7MDx8iN
         DG8g==
X-Forwarded-Encrypted: i=1; AL+hErHZ/Ep7Y9Y2kf8tHHE5V66m9aP4t1W1NJyx/034qADJMGUZnU5M+kGDjNBvmSPwoQ6pom/m0jOZzidHTeg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LoS6ddfs/G5fhDxBoJHhUxNA9ShvrRnorZWsJNngFf5uU8G+y
	gfcKB50Gff29cFbWPWa73Qk4SwvUx5Z1oIv4sdNh+Mfx58HjZ5RhK1+ib+6rdDG0hiFztCY8GEF
	ZqbKr8DCmrCSndv/WgdHP622lQqZvD+N5AknJ+BoxeWUfn/URo3dz
X-Gm-Gg: AZFdTZdXyG6phpVvYdSG6XwjwKtdVLkawpFGTmsq9JBQEQ9M7PNoTOH3QJLFSNyZUrg
	Bgi1n2k+rhy5h6IzcU1bN9yxvVcHxcyehxnDWabiamRsURJjPhVdnf7AYLch25csdY7+/NLdhI5
	ilspmcepSYtZLaZxhsz4Tcq1qkQhW1pixfYOezeP5BUAJVxMmOYUw4nDEEvgjf55eOhMPF+c/Sw
	gHl9XkT5MJfFZJhDirufaGjAIksdvQ+R79Dt88gYhS35+LG0kx2LF7HcKGRRFJZ2O46tiLF9LYN
	gz8Tt5Of7gmEv82wLxNnwLJqqb5OOBLuqnUFhnzjOCpbYKzRdE8+pRCvKAvkgCEhl9O33jWSrH3
	cGBQjwhsPbyIXTgW9nZCR3eBiyzbmfb1Gc2PyVRkf6Z1Roy4u7ug2JxR7C9BU4bnjeOjj4w==
X-Received: by 2002:a05:6402:210d:b0:6ac:c1fc:8a98 with SMTP id
 4fb4d7f45d1cf-6ba37ec77e3mr10920244a12.42.1795512986310; Tue, 24 Nov 2026
 01:36:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121041507.39582-1-qyousef@layalina.io> <20261121041507.39582-2-qyousef@layalina.io>
 <282a3922-91da-4145-94b6-d1a6459b6da6@arm.com> <awU72HxIUrUVncvs@aerith> <awVGz7vg874E5C83@aerith>
In-Reply-To: <awVGz7vg874E5C83@aerith>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 24 Nov 2026 10:36:13 +0100
X-Gm-Features: Aa3M54rpOvLT6oR1yBS59IK8AffXurRB1o5ixMNm-oDfhJsI4JIHZ6a7-GnJfj8
Message-ID: <CAKfTPtDuFrckrkw=FXBOOY8nN93hpwmRYaNi7j5+4_ZhOyZW-Q@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] sched/uclamp: Fix race condition leading to
 imbalanced uclamp_rq
To: Qais Yousef <qyousef@layalina.io>
Cc: Christian Loehle <christian.loehle@arm.com>, Ingo Molnar <mingo@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, John Stultz <jstultz@google.com>, linux-kernel@vger.kernel.org, 
	Kayra Cizmeci <kayracizmeci@gmail.com>, Wei Wang <wvw@google.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Nov 2026 at 09:13, Qais Yousef <qyousef@layalina.io> wrote:
>
> On 11/24/26 07:40, Qais Yousef wrote:
>
> > >
> > > > +  */
> > > > + if (uclamp_is_used() &&
> > > > +     !rq->nr_running && unlikely(!uclamp_rq_is_idle(rq)))
> > > > +         init_uclamp_rq(rq);
> > >
> > > I guess this means init_uclamp_rq() will need to use WRITE_ONCE() for .value at least?
> >
> > Hmm maybe. Peter let me know if this is worth respinning another version.
>
> FWIW, something like this should do
>
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index c6780358a7975..982f913ec3271 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -2117,9 +2117,8 @@ void init_uclamp_rq(struct rq *rq)
>         struct uclamp_rq *uc_rq = rq->uclamp;
>
>         for_each_clamp_id(clamp_id) {
> -               uc_rq[clamp_id] = (struct uclamp_rq) {
> -                       .value = uclamp_none(clamp_id)
> -               };
> +               memset(uc_rq[clamp_id].bucket, 0, sizeof(uc_rq[clamp_id].bucket));
> +               uclamp_rq_set(rq, clamp_id, uclamp_none(clamp_id));

Yes, this should be ok

>         }
>
>         rq->uclamp_flags = UCLAMP_FLAG_IDLE;
