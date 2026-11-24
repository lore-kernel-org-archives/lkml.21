Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538318;
	b=JiGGgOTzu9AckeHA+qer/sthi06L/uCjBncgqWN6K61Sr+gxetM+Nn7FVZRlEESFwjuO
	 3k1iOPlCwAGdXQjRKBAuJ7zka6EpHlNCMx/9nlIM9cGpG96B+e4aGos8CqiyqMgAgIAQW
	 J5qIP4NAFpb6FDHtU/Po1c2sBBClYqh9Etssob89R6MR0A2EY7oh7cAuxrSo7m6dpFL66
	 Y9Q6JI/1j6bKjSXj8lbkHQehuyz0FmbaFP1XpwDD47OrZd5jpnmT/EmCFQEY6sZ/gnhtl
	 jZeZqYlSnK9P39y6YM0+GU9uS90m5rDrkbWcgJurtxzuSbbNKdFUEmZ79FA6H7x4nZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=/EJeu8eqnYrieEoQuogN5jN7oNvPxu+IBN2eMIBR7Us=;
	b=zrZdtQW2VguWbLZ47X728PWGjCdz673HiXZo114nyjt0pzdHuddTOtDVxEuKvecfU4BF
	 ht5kA/uYKnrf6xURosC9XhwpsqdqgkWTP7SALTwWkTZmQRhJPMDySKm/5o20CiAYpi0tp
	 dtMZRab5js6Tpg+aoG0lRa+eX5iTwo2XEFjd4NwD/hzBAmefCTANbiGEEYAVfPbcB4W2g
	 cwL4mMgwtVnJi2Gt/XVSPSIDA1UU6JNS3pRtrrqzh215aUxyPRh9LPiHX1SIQ2E0XaNMR
	 nHntt0M/KL7cnYMhBPyQNBfXt03AYXuSrW6BtwHZhA/QL9ifgPqfB1YIJ+x09/7gPag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=SmXRxnky;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8686C606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:38:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8686C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=SmXRxnky
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c50933bdf4bso939398466b.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1795538316; x=1796143116; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/EJeu8eqnYrieEoQuogN5jN7oNvPxu+IBN2eMIBR7Us=;
        b=SmXRxnkyJOLfjP32m9hhuB7ThQS51Qqg4E8pnGZT731XzZv9AmeQPYedNc4kvhkkg9
         QgNtGVEqszVIACPOtKfyriOR/kb0aSARrq0rqH1Nt2PNgVjyHCS9An+G7RtbRXF3JiiI
         1LJN/DPgC0zS5NXRHTnDlSOh6GIFmg3ThLESg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538316; x=1796143116;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/EJeu8eqnYrieEoQuogN5jN7oNvPxu+IBN2eMIBR7Us=;
        b=A87vZWdCOxdzRtPD6y0zVZv0eIhreEa3JBvTXQEuhjmlTcdQ4j+Gr9jB++awTMx32J
         AnrTNLNffWAhO2KXLefKtTFZtrdtEqO9sZRse7OEMw/5mSLdr+i/Bd9FnK5j0Og3Ipm9
         lSiO3SMiTpLhirOuEilBC/kXj/ea4yE4mAS2pquA3TvdE0+JqTti1lLdbW6T9tF0mvy3
         WabCHZxNblPEDStuovHA99ny+rYwJ+bNvf49B1l46xl3ixjMUgRd5Rhvavgnr2TxRPzB
         tMGtx3hEJ2iEVz0T7uf9Uo8oZJN81KaYKx+6nOvooJa3/565YeyScKeSiuLjkQkzTYuQ
         v0pg==
X-Forwarded-Encrypted: i=1; AL+hErHNWSAysT1LUCMe7o1ueEws1SNnKT8YpbmnQv1Uq8Bvw+P+PZC5rjEe+0ktIEqVXd2HST3VhhjGAnaBzwo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nECDR1wAfrrC36FhBxOGPd5G4e48+1+Gmv5sZHQIlEHNgfIZp
	MmK7sNPvsd5I1PsYBY6sH8GiUcLMwgzasy4GiKUkqZe5FZf7Uw7pIHV3oiM+TIBAENfIU9IIYdI
	jwoVLwag=
X-Gm-Gg: AZFdTZei4Zjzs4u8L93lEFsY6lsK9oCbIXRE2/tLqm9UqnZQkaAmH8fFZHoBod5eyz2
	jPsAP5LfHBBHgCHfEX0D/t7U7OPJMDdMvg0h7J8a7ET8K/2g74bYvmD1QkLgAtdxet6QDAyjbW7
	MV7gfwGVkVVsiVjamdY4Jj5MM6yvMwn7wSGicK6rb93VBWrg3MwLRXlqiskayuupWV7BV+Nxqmv
	DZjudC6I7bjnfb9ect9g+duMrn/JNjqSu7kkr03vCSMlHDCe1kJkHby411ZCvwZdQ4dyXWfRvXC
	K7qEFHeu2fIDNn5IdGWcP0B/lAFTzS3U5BLudbywSIEVKLSZl8/hTUypuWQaBv6t8S/87WzdpG+
	SjgPmNklpSdWQl/iwBiy3NnjOzwOE8XoxHrDl1V0pYPT3ZU4aXiHMitDnTtsyTAx//5QOBJ70RR
	WVWivPCirkAq4GYkvsWZWhCNnOUFZJ3Cw+BTuC7o+xgDtb3ReY4RabcFEi5oOhLhnSMiAFxidKh
	Fezwr7n1r4SwIv2aUxuDgPF82BPhztbT6eEiVXdkXe5w6MvX0KO2hdhe4deAuEpuQldH6wHGAD1
	6uswlQRHwKUchZYvnaZ2y6ii6x4jrJI0xC+MM874QHSyWKCd1fTkj+L6OBDJcou+NvMfRnVHJcG
	fXAI=
X-Received: by 2002:a17:906:f0d1:b0:c46:d493:47be with SMTP id a640c23a62f3a-c513a99ab72mr904706366b.19.1795538315858;
        Tue, 24 Nov 2026 08:38:35 -0800 (PST)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aeca720sm535149566b.53.2026.11.24.08.38.35
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 08:38:35 -0800 (PST)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c50933bdf4bso939394766b.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:38:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHvd2Y4i6MqHosgHt4h75+og8SUfrvkqdTULUCBTpQbSxBU1F/hL7WXZ50w/GXb8LGdg1o2Y7OmANjUbJ8=@vger.kernel.org
X-Received: by 2002:a17:906:99c9:b0:c48:a838:c17e with SMTP id
 a640c23a62f3a-c5131848f19mr1340338866b.14.1795538314950; Tue, 24 Nov 2026
 08:38:34 -0800 (PST)
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
 <CAHk-=wj_eqNh+gNhCQh3exrL5Pmo5hbZBcL0W-4Ah_Nw0Kegzw@mail.gmail.com> <awWSwmvaTwBxfU-r@redhat.com>
In-Reply-To: <awWSwmvaTwBxfU-r@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 24 Nov 2026 08:38:17 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj3GCXZohdFWWPAOkC_LHno4X0oQW+0sQFJzRMvjpODUg@mail.gmail.com>
X-Gm-Features: Aa3M54rSVXLeJrh34QUL8f4_MzvjAY0ztkaZZD6rbZrwl4RoBJ3r5dHQUBjwBMQ
Message-ID: <CAHk-=wj3GCXZohdFWWPAOkC_LHno4X0oQW+0sQFJzRMvjpODUg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] sched/wait: Queue non-exclusive waiters at the
 head in do_wait_intr*()
To: Oleg Nesterov <oleg@redhat.com>
Cc: mt4022@columbia.edu, Jens Axboe <axboe@kernel.dk>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Christian Brauner <brauner@kernel.org>, Michal Nazarewicz <mina86@mina86.com>, Wen Yang <wen.yang@linux.dev>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tz2294@columbia.edu, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Nov 2026 at 05:36, Oleg Nesterov <oleg@redhat.com> wrote:
>
> Well. It is not that I like this idea (and I bet neither you ;) but
> we can add WQ_FLAG_EPOLLEXCLUSIVE set by ep_ptable_queue_proc() and
> __io_queue_proc(), and change __wake_up_common() to check it

Yes. I called it WQ_FLAG_POLL_EXCLUSIVE. Let me send out a series
after I've cleaned it up a bit.

                 Linus
