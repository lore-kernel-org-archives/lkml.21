Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795624590;
	b=S1Cgq8KXPVzM3fR7gXC6Rd4nedS8VAgkGnRWTcNGG8VGjLrGGzEZf9p9yC7IvSiB5Ut1
	 QO8xRDJlRHZdDra/BaWGyDqSOxVsuPbADxP3GjN0JgouJWNlgwRDnRCHDQuz0Ems5AbWw
	 mPJDt7fAgUj/RNCUacv9CpG55NKnydq0kwn+sKm8lpzoLukQWmxwi9Wfs5VmXSiAxUCIK
	 S1yyXmS06G5SNTOUakItPcMGw1VrrxpYqVSqYsJ3caDcTPhUNvW8mTWAOwcWhRg6WW9UD
	 IQE3y0PIxxAvICxVyoZPZ4y33pqrWI3cKLotzjNfJlRVp8Ut0+W9vGuqXpGaTQGju4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=FD+pJUDv6zW82nWry+CbP4QIs08JghbicqZZNK2kgn4=;
	b=jTAapcM2ytkc6lj7RfyOZcJQc919wKgw043LhwkSz8eyitUW+cTSkx9MpM+mvF+AMmDq
	 JdhYixA3WnHE1kRxe2AgMycyNoGoX1lCsHgikAw0Iu86SnsTHEJQuulCmyMxjBEo643e+
	 UMeUgeb+fvEa5pwyd3/hzVRJLwptHgs8gsKXzeQbfeMYIKXN1tkYQPeiFDsafiRYApHLS
	 hX/EIagmgSKBVtOeJ7TibxzW8M3oHyZp/UmZsJEMqpfV02USzThSGdd1iSOAyYETLP7aD
	 9RGd2YWeM+0mlyVhsGhmabAMZHKaO6a6nsbo7aDz8w7Q7pGWw4zFJz0ogoaDHAz8U0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=AgPj57Ku;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5D6606A33B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:36:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F5D6606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=AgPj57Ku
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6bab377105dso4581809a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1795624584; x=1796229384; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FD+pJUDv6zW82nWry+CbP4QIs08JghbicqZZNK2kgn4=;
        b=AgPj57Ku+5AwMw3HH2GqYv88CN5H9hfQoj7bV3GRM5EUid8zv+XcJKPnKyOeX9h1Kx
         LyKDmi3+yKzzOtylUFYtpT9dMWimgNQ/vdYPCHzyJMv4iNZcDZWwWhQfIL3+VTykuR6/
         4HXjFvhsYIRJWdZq5Gi3cHCZ2SJRo/RIAvwXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624584; x=1796229384;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FD+pJUDv6zW82nWry+CbP4QIs08JghbicqZZNK2kgn4=;
        b=dQcwhBHSWCdFJzSpOmCoy0/3IVSecbDXZSYrcnDGysDigqtWYDc2k51H0iPXve7to3
         8y7UqSiRsiHvMb/cRN2S72CH2LcoIkJGRv1ktOk9HP2K2k7sfRwrCL45sWl8vjwXze1P
         AK1YNFrFR+SiF1lqxyGkdI2kKtRI2dEAyKe4pQo0y0YKOu/q4Bd/WDd/hxaKFAaEFNl/
         i8gGDtmmwGDv90nQP1KYw/DMbuppTjhMcvpifOVlsH1QcIlceGjdKUDSQM9kU5HWeS+D
         pc/PlqmuWn8Z0MoIF5Gh3Ik210vaEXaVPSKx+Uuhlw7WAVkmdnfQogNx/Eq+ml2qlzYH
         0fgw==
X-Forwarded-Encrypted: i=1; AL+hErHDCFMsabVGmrlpkUZD/bINTsvd8RvJUkTSJwEcoKd7opYaY1b+QRHqTf08PplOv5Te/v0Z9Spq5GjavRo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9k+wAxbqhOFtLOwifUMOU7BmpxkOOx2gOrIApdps3snA6+/rAa
	aYp5xfnaSqcHuPqCluWuWLNJAomn8B+3ltI8fKiq7NlIkM/WpLCzeOLzi78I3rbnDY5kg6buyeR
	G8+rz5GQCUw==
X-Gm-Gg: AZFdTZdOyfdsNEinGsfUdSuFW6xgxcp1Ke/IyxNbk+5w3l3pdzLz8l0wkivnZdQ4K5s
	M5CoU+6u5DPpQat8n2Gg0IZVvQlSuZRQXqcDhTJ1CKsrUGGRbfbH0ND9rrjNCHltu5UJonqjQR+
	Ih4FyA046v24hEaE5lO1ADrs49fZCIZk2zbmwQc5XYp3w+FW80EKro0+MaF7yV51AUrdJEVnF7A
	rwfciZ0MoBg2/ZrVhYeisVAQEqLqoovehszuzOgl7Otrf5jpiY77o3zq5gTBCNx0ssMRQF4KaKH
	IT5Pdb64sFO2mo9GRaQo4gGcXPLvPLhe/dEO5KOp11SiHl7XGso3XiFTzJJXeyxuiOsdZ6ekLCO
	BzmPSWrqrcEYw4tQwTEe2nt4j2vLsfIZ1nxbcxl+cds8RDqJxFsOO+57/aqrR/Cn7sEYQPU3anw
	MJd5Sl3ow3hFpCrKdrFtPlu7ixpCKYIQ/ukGkGiI0InQPpCtWIYMxwYLDn5BN52BzZopuYy7cgh
	YXxsoZmQJSKLjMuSrcXQFrSN+u5mBwchZDMZR2MudtY4A6O1i+UMAM+Trxixn7+deH9oCNPVcHy
	RqB7Cn40GTAg5MrSZDWGLd53teqWC6+WKZgCIUmeuStzYOUvK+q+ZADaSTnG4PBXrPBA6qDezHy
	40BQ=
X-Received: by 2002:aa7:df05:0:b0:6b6:eefc:ae7a with SMTP id 4fb4d7f45d1cf-6ba37c7b05emr9838895a12.4.1795624584454;
        Wed, 25 Nov 2026 08:36:24 -0800 (PST)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb11ff543fsm1820583a12.2.2026.11.25.08.36.23
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 08:36:23 -0800 (PST)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4d581da0aaso838603666b.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:36:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGu/4g6WG9+9f67vhIrqjWKt4B2J2hJQL3leUIG+ZIQHS9580Wo0GHPWOmxvSNX66gEUdbfg5ZzlAL2ljY=@vger.kernel.org
X-Received: by 2002:a17:906:4fc8:b0:c51:ab6:1c73 with SMTP id
 a640c23a62f3a-c513aaff9c8mr1629652066b.23.1795624583581; Wed, 25 Nov 2026
 08:36:23 -0800 (PST)
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
 <CAHk-=wjbK0xyhwvWP1uNiYR6i-X9MpCn8bnm_akxq0MsrYOL+w@mail.gmail.com> <awbJz9stwx_JzZFX@redhat.com>
In-Reply-To: <awbJz9stwx_JzZFX@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 25 Nov 2026 08:36:07 -0800
X-Gmail-Original-Message-ID: <CAHk-=winCVsBKy0mGZK3mazNoTO73MrnmFHXNBw0UNK30Di7Fg@mail.gmail.com>
X-Gm-Features: Aa3M54pPxr2VuJXWXHMKSQADyObX9AHM2KfGDGpOXz7rBKMCW5_j8OTDdxQ-wbE
Message-ID: <CAHk-=winCVsBKy0mGZK3mazNoTO73MrnmFHXNBw0UNK30Di7Fg@mail.gmail.com>
Subject: Re: [PATCH 2/7] sched/wait: add WQ_FLAG_POLL_EXCLUSIVE for user space waiters
To: Oleg Nesterov <oleg@redhat.com>
Cc: mt4022@columbia.edu, Jens Axboe <axboe@kernel.dk>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Christian Brauner <brauner@kernel.org>, Michal Nazarewicz <mina86@mina86.com>, Wen Yang <wen.yang@linux.dev>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tz2294@columbia.edu, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Nov 2026 at 03:43, Oleg Nesterov <oleg@redhat.com> wrote:
>
> On 11/24, Linus Torvalds wrote:
> >
> > +             if (flags & WQ_FLAG_POLL_EXCLUSIVE)
> > +                     poll_woken = nr_exclusive > 0;
> > +             else if ((flags & WQ_FLAG_EXCLUSIVE) && !--nr_exclusive)
> >                       break;
>
> I obviously like this change, but note that wake_up_all*() helpers
> use nr_exclusive == 0, so
>
>                 poll_woken = nr_exclusive > 0;
>
> doesn't look correct.

No, I think it is correct. I agree that this logic is a bit messy, but
the intent was to keep the patch minimal and the code as close to the
old code as possible.

The logic in the new code is that WQ_FLAG_POLL_EXCLUSIVE should only
wakes up one of the entries that have it, *except* if it's a wake-all.

For wake_all, the poll_woken is never triggered.

And notice that "nr_exclusive goes negative" is exactly the *same* as
"nr_exclusive was originally zero".

So maybe it's a bit subtle, but "nr_exclusive" has never really had
"zero is wake-all". The logic has always actually been "zero or
negative is wake-all".

Only positive values (that then go *down* to zero) stop the walk.

The poll_woken logic is just an extension of that rule.

But maybe I'm missing something. That's always possible.

            Linus
