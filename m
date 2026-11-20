Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.128.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795189120;
	b=c2Ya/JFlC9z4w6WnYxjg3VJ7SBDDk90DEinqt4qjqa1e8HJ9FJDhC9rlVtiORlFrGW6a
	 shFo1+MtbWNBSDtb/mUk6LhMeMwJ09sLEHiM8jF4h7nswCaYvxkYd+ooWer71d/vmz2nk
	 vJAi6IOecFndt9Y+i4xRc/BT1G4ur0TtcYF7eCTFrMyiytSy/4qq3ypHkxkb2Z8ChP7qh
	 mtzLLoYWm6jG+H51MYu/twBa8k6bGGTS0GAZA2eqv5Typ0xAynKkUST5oMv8rzKWtBxC0
	 /oudw3rdVjqszUX7wU7WdgSCE2vCL+We51iGxx1Qkb+f3WrgY6uAwW+KCMUVH6HibFg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795189120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:Received:From:In-Reply-To:References:
	 X-Google-Nh-Sender:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=Ps+r6wqioFZ5jOTix48/157hwwLW+rUrXw7vqmb1SQE=;
	b=YBsthg/2osiIPS41qSEeATx8GZw/LbqJ0gbHA72qBKfaAMMibrL41SLoU8oUcMp2mJtD
	 dyaactutHDrLshnjWhrnjuySGW4cqrLbhATQC3wUuyC/qE633IwzHyOnd8cKJiIKTTWAz
	 swWbz4n6tlMKxOZzTjGLY0PfjCHLUlsZ8DWFae183aK6GFYCARTPj5BsMkhF3oJily03r
	 P27mR5h47wYaIXqUIfvJMAewpFWMp6n+dVBkzqewWk4nhMUv5N4KmJodxS9/tJyOu36M2
	 XfZGLl+gzhLU2vnNbrsYPr5bkl7fs6JjnmK1j3c/YqVkG2AJzv41Q7dPkD3nPe5V/Dw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bnVGGT5F;
	arc=fail smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D202606A339
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:38:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D202606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bnVGGT5F
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b4cd576f2aso8587427b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:38:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795189119; cv=none;
        d=google.com; s=arc-20260327;
        b=qY6uRXXJJeQHzhoIaNMnHHoxp4EIpaQkYmhFY5c8k+Dkchtgk97q1hY86YA4MSbcNu
         pN+OSVhtbQbmOvDfjbsxGAcn0nlWCKP4kfKiN3iAfplDui2izg7MRvSEG5PJJKFZovEp
         zWVWecfRsq1aqioYf4phnr0c12SjlnaIqQPTdmqWlaviUB7yCSYNouFupd7KhyxOrUQK
         eetuVWSEu5+2/PcRZa6UyG6oXjPgU3eh9UepwG1hgNWKXuFGqLrEQ891RKxKSB3Oef/A
         qrVWJqZL3s24EeN1AgIwKlHDVwq9dny3+KgCBZwXaR0Qm0V5EDIul++QKiFtYAm0mINl
         X3KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=Ps+r6wqioFZ5jOTix48/157hwwLW+rUrXw7vqmb1SQE=;
        fh=Iif/3C5WbvWi7YbSFq5EQDI9JalsE+ah4cbWht78Ao4=;
        b=M68U7Zs8j73jIvAS5sSvYStPTVwmeqooprWMqN34Px2S4AK3uytZZFC7dnWWF7UX9r
         cJnznYI37sr4ihYhKogNEDAa8fiWEJeL/LCihuRlBHa2S180q9zS/p4AGqlLg3A6ILMa
         KCaxMDgP3MzeFyUQw0TjH8yCmfUY5Bx/z5skZ5VdNMa7lwGIXlLxz6umOeNvltNPrHLk
         v6RnppYN4wfgA/t7T6MxqzV52sB7CvXpCp74Py6s2/VJhaYxGxZNGTwK8fbLSsEHQNgH
         0RfwRbS+4PO/LVLheMUjuSEPhLyQdfx6ykRfXNGSMm3qXevUEV8bh6/yhsa1bKKUdlfE
         7pBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795189119; x=1795793919; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ps+r6wqioFZ5jOTix48/157hwwLW+rUrXw7vqmb1SQE=;
        b=bnVGGT5FdmfEv33S1WebbDElFiOPTlcUqXiZC55dfSFHGLQwFARnITwzxuBWLniQrW
         q8pWxUscFadJF2tPc65NGbH3a74iijEKChfdjO8i3OqgCNezzzMm+819J0XZYTOUPCT9
         2U21a8HyXsZk8rzpayrPVDyF+AeYsrff1w08u7diFt7mD7XoAuBHm67EJDkqiLCZ9LzR
         Dcti7VKSMEu3wxV1jk1BdKVtKv8NQyGKpf4BTu5yxWsqEPx9VAnagka7VyUqnB5UD/uf
         1yxZMIpKVsR/QesEP1jtp4yizg8aowpIw+GpXXKONwE+ZwGbroaQXWCMxzOQ56rKRebW
         MeyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795189119; x=1795793919;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ps+r6wqioFZ5jOTix48/157hwwLW+rUrXw7vqmb1SQE=;
        b=PrR3iIQy/ZVTa77zsvNfRR3jmBCIH/JrcWzWxH4XFR5MUf/BwEiKxe/UtPcbplZ2Qa
         lgOul2UWRHoIa4IWE4PL4128lGu7D6AevHzVjtdRp97VYjZeHlVJgbkD/JplcylrMuZ9
         3mR2j1ITuQxua4u/95cOmdM48sjqZE+spyMEeF4rBBBCAVQCkq528xxhEVF+sB1v5LFD
         VDb36wj8E2Sm5NTDyPjQ1ai5vgLRVf4qwPJFJ5CzwHc8ZPpBsHD81Ncfanh/yv6EjxVv
         qtXX6qr/MIYBNe8SxOYietdw1sJDR6xxRTQ9jNfsHA/6UOhTifjY1oh9Ovf2V4QvhQNJ
         e6Yw==
X-Forwarded-Encrypted: i=1; AL+hErEboKPb9PXFjcg+mWK2Sqao/D7a0hFCChvvdJvgMRQhnhVtuw9eRvmSg/LnUZT60bgunT96++VBg/r1k8Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sFSmfZCf1A8z6kK8y8oYExJ8hkoQfAc1pv6nv3FO6+COsqU3V
	uxT78arYmSeKdX3TI3NdEI50gBBYFetN/4pVrDH4l1zjaUp1Lwy6xHMO0qDOAcvLJp8epzvWIXP
	oTrV6ORQWir1RL14KToLEqUD6yWYYaFE=
X-Gm-Gg: AZFdTZcgJwHbIQkwhhLe5jGNGp//5EMXY8U9VLNwOY3z8Wr9clMD6roQf6t62AlruN3
	7VsDGVPNigJJQm+z212Nq2UgiEg79fFfAMjhKmQ+hJ0xdka5lAmvmotjlnNEweaiF6sr8nl/meI
	gimnirMMjTfUlqmaPEYmoAnY4jafH2Ne2imAoy+ZSvUNZFTkdK2G3ADkcrX7f6BG8LMLcolm/gJ
	77Nr0mjHaImB5MuUK7JVAwsr18UqMM974Rm2ZWrf2mzv3m5vxRW0KxDzbewwHyFa23Ydt8VM5BX
	/cayzSgAO4exyC91L5M9l161mOFi1elXf6m5Nfu7pgDfLfpVeylaTsg213Z6RUjmHJEotdMJHSQ
	MUu53Wwi3usj16gkkrZQP2tfxseTc6/MWAt1Y2Nw6xx28NHWkUyJrR2fDGnryl6ZN1mSoIVAGF4
	KxA846zXSNQJ7QcxyE0BjaiWBLzYEzVgG4wMo/ehEChJSm9c79IJESwBxA+OJ6Ijndvl+JhVh37
	BOmCg==
X-Received: by 2002:a05:690c:b1d:b0:8b4:dcd0:c84f with SMTP id
 00721157ae682-8b5204eac4fmr16574387b3.47.1795189118800; Fri, 20 Nov 2026
 07:38:38 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 20 Nov 2026 09:38:37 -0600
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 20 Nov 2026 09:38:12 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Fri, 20 Nov 2026 10:37:20 -0500
From: peder.bergan@gmail.com
In-Reply-To: <CANiq72kcDMqswODJ0OqcqecDG+8mVn7Q43v48=ED5d6tsFOWQQ@mail.gmail.com>
References: <20261119-fix-schedstats-bindgen-layout-v1-1-0599dd230ffd@gmail.com>
 <CANiq72kcDMqswODJ0OqcqecDG+8mVn7Q43v48=ED5d6tsFOWQQ@mail.gmail.com>
X-Google-Nh-Sender: AW_J_Uo0_1sBs8TErsdnA0bl-M_r09fo3bmPAFKFbN5updnOD3nt4wJAkVJ_H5CTbSBmeL_sAzELV7JydptwZ3U-bKXp4hN5P0JxyGZRhaKvQbc2xeia6Am19MNbOhrETJgmIlapcSxEfkIRcK97u7m9H2ahPrMhiDDN8BPwRvv50BcSMzFFRcxdoi5ZcHMpe9wC89aIvFtv1ZI5lI1vdEbb2_Uq2euYD3oi8xW93afcjggJ4FNACxgUJWawMCo_eQgx3psl
Date: Fri, 20 Nov 2026 09:38:37 -0600
X-Gm-Features: Aa3M54rVdUxyxZnU-ZKzu4pEIUMsVnXfFp-UHkXmafb_R_K0SJjuvOWClOTzccI
Message-ID: <nh-e30bf2f4-acc5-411c-89f2-b5dd827aa4d5@google.com>
Subject: Re: [PATCH] rust: bindgen: Preserve sched_statistics alignment
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Jules Mercier <jules@les-mercier.fr>
Content-Type: text/plain; charset="UTF-8"

Thanks, Miguel.

I looked into bindgen 0.73.1. The layout diverges earlier at
task_struct.se, and my v1 leaves that offset unchanged.

I ran a reduced test and found that making the type opaque can worsen
field placement on 0.73.0 and 0.73.1. Would you prefer limiting the
workaround to 0.73.2 with scheduler statistics disabled?

I'll add the bindgen issue link and update the comment and stable tag.

Thanks for testing, Jules. I'll add your Reported-by and copy you on v2.
