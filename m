Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795624797;
	b=qfbo8tU24Ze7E8ozfw5rLk31sna0AB+z31XneSP2luQzSxxtOqrK7Pr3GV/f6vo2hCZ9
	 Ut95+pwDgJjsttsKm2OaPWv8K0hyKo8dsEwreW8EaYTeSoqHI/Fxy1iqSl5gb+0FMfu1u
	 6NJSLUMArEgHogD2hvfe1iVVbHvF0f6lfkvC/XaIPK1ULU7cKKrNR5yfakAUemTS22CfA
	 qL/jBYSzscMF9dM/fVCAO9DYR/0aDkBaBzsMlXdjUACGXnumLUoeEXPozBybn6HA2hsa6
	 0vxjVPodtAMpqrdOoRUXAvF59ZvUJRY/wCzeZuCBCJYTfcjeqKiGH5UEAFMqTqIDu/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624797;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=JxExNuQaJd3Cwz7l+JHbWMh1g3amu769QhEVBhR2vvc=;
	b=gPDsy8upAZy3z+wf1ocQUiUGhdShPdX3Hg9pmuamrsySzrb49jIGFDGG2lfC8EDYba0Q
	 lf5DxhKWg1Ck6qcgwp1jijqCtfD/kykBfIe9eNxCNvkau0exMbrZgqXvHmEKgLmDnsgxY
	 88xnFaTlrhRfHlPvZKzDlce6s7GAwXSFswi/3LJ8AZiW8/ToKu8GryHDn8uczjbk3/C0A
	 JQXw/zHQSwX8hcy+dz3A3GnRrsO5mY3T+670D2eyFlbnyVPs4Owa7J9DWEGfpSH6MGRGE
	 ajF9fT6CIi+EvzYiSg0g2bR2cxvxE29QIHfrQH+PEQsH/XMuuApMQjtbrcyGThcV8YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=OSDkQj1T;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6664606A33E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:39:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6664606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=OSDkQj1T
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c506a231b88so816462866b.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1795624795; x=1796229595; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JxExNuQaJd3Cwz7l+JHbWMh1g3amu769QhEVBhR2vvc=;
        b=OSDkQj1Ti0rYbrt+XplUWwAibe6OKpBozVfOioKe07INIwByGhPZk7VfEJExJR9pOx
         nDfhakDELK0CUMl1tWJLFPMtRJ/ksEHj/dh73akiu0hekPteZFuCQ7bSnhYoLtZW8DtO
         cAqE6puS+a0YtjqIDKfuaEDLlNbmYp9Gc7oyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624795; x=1796229595;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JxExNuQaJd3Cwz7l+JHbWMh1g3amu769QhEVBhR2vvc=;
        b=acY333KO+0jZPC+kxSfY+xc4fz8Ne4Wv3JK7W3uL0i5YnB63FyRgqjezOJhS4UBk5l
         MSRR5/vhnZKcCnSXQG98Gx5HDpdc7jOE1m5mxwKyiNOW5AvTAnRENd96p9JZxNCMb4qs
         Bnnwpu5FSPJDsy8EusjWwrE0yMFb/bFWji6A4kygK/DFEv3PjkOcbZifrI94KRrlGK3T
         MU8yP/fsDKSYd+/00ZMkXH9JC8anMRcfs418mf/eQJVmjj+JkwgDxuZw1zwg0HHiDX/B
         oyQYUOh6uaFoXtpQ0JsOmNA9yXrxegYWDe2PoY1EESWWh7wad9AEYkmS4UKbPEbkF6p2
         dGYg==
X-Forwarded-Encrypted: i=1; AL+hErFm40BiZ5GtyC9zwTaVRisEgCMFwNZ9GxeZH0u0Cx2tDdXjo+LKs76L6UfLCjk7QSFS/KxBM1kmm7Z17qk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+j2geRwTTMdMhCIF4xRIonDzPXvNC7h4O8QiE1ULAoAqLY1Rta
	tIv8cTdVVW3UmTxUPw3Lgct3Pd1uwYBYfrDRVTwjvdF5JQcVkPSa9NMkuewBU565pMdpr+wHIH8
	K5Zj+MdDGUg==
X-Gm-Gg: AZFdTZc6hdsPNa69l80WM0RBdn0tVlkfWeg6Mn37OAHC90DCWGHHhBIBwbBDKWqSs+M
	YhnbUoVyAPsFceQPqvC493OmJBKOnNf+JER9tuzkLhGX70q28n9NJBijY0SBoul34hc17vZuX+c
	QOIUYUAFhu3TkJpDzuydj40v0f1fESh7RSpHJpYcTpVbc8OMJasyyg+8cWja4ovW34ule3sIZx0
	S60k0SV4rzvGpKGY/o7vLaznD9A3i62Wlhjt3TRxeRpaThSTmuNv+d5gehN11SQ0v3lkagtplOR
	ruDfFHe4EXlGlguiCF1tnsn3yJWomIZ5Q/0ES1QI7y1q9QH8Inq+tFzsVlRbWmmYTdsqNI1QaFQ
	eC/pMWA5aqb+qKVtDDXVYS3GEp6Dzgr3ET9RBi6zFniCHRK9Y8etAoy+NB1D/YpRe8y2/401LDk
	w4T768HGoDnjr+DmU9qDSBVhDgvnYRig1HtQRMoYfV3ElAbEhW+joqifA8GRtYgDYu/j2TNfTHh
	j6KaQDWIH7m63H5KndlbLcRaBljG+hpy0ZxCr8JWQK79lbnP3TcGJ/dQ1TVWZD5WfNcYcgbkw7D
	PlfRJ/VHke/BllmV1w/5KlM0xRQrEM9mdIm/NfWnbDnmZovAi/wRHTCnM87X+vc/PxLNDwMo5mV
	T0D8=
X-Received: by 2002:a17:907:da0c:b0:c50:5545:b66f with SMTP id a640c23a62f3a-c513a803353mr1408612066b.23.1795624795206;
        Wed, 25 Nov 2026 08:39:55 -0800 (PST)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea1fd8sm656651666b.38.2026.11.25.08.39.53
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 08:39:54 -0800 (PST)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c5133831027so857314866b.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:39:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGBTGi9vDlMhgjbnAKiKO8KaiFoTLOyZ+BeYo7Blx8P9JWHi1ANRAVhjYvnE5Q6WNnJpPGHtowPytrKhmk=@vger.kernel.org
X-Received: by 2002:a17:907:da02:b0:c2d:c247:5400 with SMTP id
 a640c23a62f3a-c513a8493eemr1490131966b.27.1795624793689; Wed, 25 Nov 2026
 08:39:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-b4-sched-wait-intr-head-v2-0-4a764b64e8ce@columbia.edu>
 <20261122-b4-sched-wait-intr-head-v2-1-4a764b64e8ce@columbia.edu>
 <CAHk-=wj_eqNh+gNhCQh3exrL5Pmo5hbZBcL0W-4Ah_Nw0Kegzw@mail.gmail.com>
 <awWSwmvaTwBxfU-r@redhat.com> <CAHk-=wj3GCXZohdFWWPAOkC_LHno4X0oQW+0sQFJzRMvjpODUg@mail.gmail.com>
 <CAHk-=wgYc9vFEmyV0Ch_e49j6GOhUCMQMnMV4f1FLLvumZOmRw@mail.gmail.com>
 <CAHk-=wgFnKO_O0fR_-O+i5yUGaDcz8_HwpM5QiLM4jPFYZb41Q@mail.gmail.com> <awbMwBDP9TsJBmzV@redhat.com>
In-Reply-To: <awbMwBDP9TsJBmzV@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 25 Nov 2026 08:39:37 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiTUE9vfMvHeGz+dgex_+sMicSHnf6Nt2_w1-SkOmu8ng@mail.gmail.com>
X-Gm-Features: Aa3M54phjOT0um3z9odpNNELrhe-bLH1gtujI8-yceR8vi0wZ9OAzggOhpFehRM
Message-ID: <CAHk-=wiTUE9vfMvHeGz+dgex_+sMicSHnf6Nt2_w1-SkOmu8ng@mail.gmail.com>
Subject: Re: [PATCH 3/7] eventpoll: don't claim real exclusivity for EPOLLEXCLUSIVE
To: Oleg Nesterov <oleg@redhat.com>
Cc: mt4022@columbia.edu, Jens Axboe <axboe@kernel.dk>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Christian Brauner <brauner@kernel.org>, Michal Nazarewicz <mina86@mina86.com>, Wen Yang <wen.yang@linux.dev>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tz2294@columbia.edu, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Nov 2026 at 03:55, Oleg Nesterov <oleg@redhat.com> wrote:
>
> FYI, none of these patches can be applied, both patch and git-am complain
> "patch: **** malformed patch at line 34: *file, wait_queue_head_t *whead,"

Grr. I was so proud of having finally figured out how to make gmail
send uncorrupted patches so that I could do it in my normal workflow.

But apparently my clever hack was just hot garbage. Not the first time
that has happened...

Back to the drawing board,
             Linus
