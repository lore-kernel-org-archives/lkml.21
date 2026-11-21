Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795269681;
	b=ZEkltjvogZ/5UFCZgZ4D87S+X2ZLg//hKIRsjfifACulPBaMKYUCH549ZBeyxcAnxxY3
	 GTA+iFq7zQS4+ejYxIjmmFeDVdhPeSkD/v9faBORprC8kOV4VODNh3KCfd/arCfepoLVV
	 V3iLkgenv5dtf6Ox183N4jrKuadyuCLhX3nREZ3vV+efM9H1PvdASWVXG0ocL0rwhmToy
	 wQe+kWAMWmex+OilYYm++UgKR00Z2QK/KmrgdPN8b1G17nUnhCX36JRCkJtqSr3PPn10N
	 gdJVhl3XgKs6glq4fC0Yf0KJlQ1khvUnAI1Z9lqSBR9ACAUufMYeCTGPLcFrllehGtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795269681;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=e2mOK1MMQLYi3VECCKGxNvMEni9pzQtygVngFQX5eIw=;
	b=1GOGHvAGKIM+4Ra3c34ANOWU/ef0P4sw5UILaQ6AUJp7eGdxFRVU6sFHV+F5UFz0WUT+
	 IkNBbvjo6iaanyO42kARM8Yo82g3iYzdFKCzZssZAQ7RDanDAK38vLH7EyVDoJdf91jUK
	 yfT85MC48DjUuXHr5i/mbmkXIrEKeR8OKTBNQFc6jIYwmw1IpOtkvVrjPpyHLZDxcTBsq
	 VSQ06+ZmfVGosRIh1829unsVDSe3t75Sw6uMC3nKALNuwgDyfgJMa1RtQoGuta2mA9H9w
	 3jLwc4my96X7wPXswK57eK13PP/SthhkBSYcl/59sFnQizhC+P7pENf3VrZsuEvj4Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SD6TGIMK;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=O1Tn2CLk;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3486F606A32C
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 14:01:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3486F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SD6TGIMK;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=O1Tn2CLk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795269680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=e2mOK1MMQLYi3VECCKGxNvMEni9pzQtygVngFQX5eIw=;
	b=SD6TGIMKjQmZ/EZr+Ps5ebmHWtCZDGwOvhVTVnCxKDPjT8yNvgYbhmkXDgoQ/7qmJ1PC4a
	4Di8zLIYCQdVnBQSzOZTS+HhS5oKjHjkt9BAtStznkNmCsl6NCQWGtyM6Hci6Tqg9ayj5k
	VhiNgx4bP5ZlfpWP9IkVa2CNGB/82Aw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-448-rGxuWp8CO-6Np-JO_1bkLg-1; Sat, 21 Nov 2026 14:01:17 +0000
X-MC-Unique: rGxuWp8CO-6Np-JO_1bkLg-1
X-Mimecast-MFC-AGG-ID: rGxuWp8CO-6Np-JO_1bkLg_1795269676
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4ba078abd78so11400385e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 06:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795269676; x=1795874476; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e2mOK1MMQLYi3VECCKGxNvMEni9pzQtygVngFQX5eIw=;
        b=O1Tn2CLk9hyLN4hChofe7oNr8x8KRkmHX2SrOxpjr8bT3BFuUCb6zOQhQ7EwDB0Xu0
         M9/PnFeBcMX2ew/kIFcT6G8l/D2s55YbT3e7H29pckovrltLM4EmAnlNJ1dAJIrBJqMa
         kK6eLFDf9igH/q5evc3bK3Caolypy0jyDh5sm8DhfGtTUMIEECmxLa+72YSQYg/hfY/h
         27zI4vkkTnrR5KGZQYY4XKqYfrI5fGknVaDVon9eKEYwWS+JqIusgjA2k7f1IDFI+vwu
         5Ekx7SjTlsu6RnAkwdjxyzWtD6qurjDGCEgRS8hMrZn1nl16laSbDxD86eQ8GW7We1Lj
         yUYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795269676; x=1795874476;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e2mOK1MMQLYi3VECCKGxNvMEni9pzQtygVngFQX5eIw=;
        b=Q1x2eVzbrJEMB0x+w+2cXjF2evABTEcwcNMCMcAuUksTTuZyMrfz4DBM8oAD1JzQE/
         kNqGsui/umT8k+jaY/wgy4EK1DSt9ARHaWCELfVT5gEX7LckH623wZfzP2GnFvFg0sFG
         tGPUgKlMmsB6Vwj+Fb5a8Iaq/uAQovb3OEV8CP3/8780NzQxvTSa24rAUwpTlgPJnyEV
         IcfWHyNTjL7x19OIXw9U417U9FiSvPf6vub6AHAsIywJyxTV0i1w7YZG9LCuTujtMkH/
         5KPzc81H9ovFQJ4MY2oV+8+U65h3gkYsuI76XtCCEfMU0FG2/mSCgnE8MszQvHGbjLtH
         JKiQ==
X-Forwarded-Encrypted: i=1; AL+hErFAMMHdTwJyaO0KtRnNryqio5uf0EtBvuMPzn+ezY1HqPi2Rp+32De90AI4yJ1rX/Iqg0wNdnVyDAQDVnc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sRDiw/DNlvSZ8T9fT1m5bkbxZTfScUWrJU46vPz6ZdmMFpo6j
	NDOYCfDZOjh7FBP2hmQoBjQH1yl1acQeXHeY8fK0mD3urA2UYK/rmy2QCFSnduFFdpS6czTVqTi
	jCkZt90NPCoYaS9bHGIzMvQVgxfwCwidqpW/s0u45eZNzrBbPSwYN1zRbZTL4fgPQKQ==
X-Gm-Gg: AZFdTZeH+v5n1WZupNtDbxDLpBwtpgXxhg1zav5ZzkRgAvv26FOkq2BCT09aAlvfcnx
	SYjLXz6zQaGQJys3/zPtXuYEWeDcIdG+YqBE+3B8tGN7uHoWD3uzUrldGU1BIoAf6V1VgWwfok4
	jTT5jR9Toa5+M1vj6jpfC1R4norSk6nIB0fDCs6W9QthDRUhR36b6FnXqhIMzeic7pgnUjPU0EA
	mwxZu6FMMSFIGrYtJyB90d9v3IrXSdKkhbXZAmU3qRVOv7mYjmVHH2zd0v8ePiAUk4Nn3JoPthM
	3Z9xtT8ELcOTshNrWrdFAQxGcHZRjQPUshWil5nzs1tDa1oLtORvClUnHQGG4PdYyQLOQHME29e
	8aX7zHUbSChQPb9u+KpLWTDO/dwV/7mlLexNdTRQlWTb1D9BHsIHaLGJysnuUn2xqoA0vx3wcSI
	1M
X-Received: by 2002:a05:600c:64c9:b0:4bb:679a:86ee with SMTP id 5b1f17b1804b1-4bb88938dbemr145650275e9.29.1795269676261;
        Sat, 21 Nov 2026 06:01:16 -0800 (PST)
X-Received: by 2002:a05:600c:64c9:b0:4bb:679a:86ee with SMTP id 5b1f17b1804b1-4bb88938dbemr145649735e9.29.1795269675930;
        Sat, 21 Nov 2026 06:01:15 -0800 (PST)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.168.96.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b3a7sm228383265e9.3.2026.11.21.06.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 06:01:15 -0800 (PST)
Message-ID: <e8b9a9afb9587ed1f41c0fafd486ec9be82928db.camel@redhat.com>
Subject: Re: [RFC PATCH v2 9/9] rv: Test IRQ-exit softirq provenance and
 handoff
From: Gabriele Monaco <gmonaco@redhat.com>
To: Karl Mehltretter <kmehltretter@gmail.com>, Steven Rostedt
	 <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers	
 <mathieu.desnoyers@efficios.com>, Thomas Gleixner <tglx@kernel.org>, 
 Sebastian Andrzej Siewior	 <bigeasy@linutronix.de>, Clark Williams
 <clrkwllms@kernel.org>, Ingo Molnar	 <mingo@redhat.com>, Peter Zijlstra
 <peterz@infradead.org>, Andy Lutomirski	 <luto@kernel.org>, Juri Lelli
 <juri.lelli@redhat.com>, Vincent Guittot	 <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,  Ben Segall
 <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider
 <vschneid@redhat.com>,  K Prateek Nayak <kprateek.nayak@amd.com>, Jonathan
 Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,  Randy
 Dunlap <rdunlap@infradead.org>, Wen Yang <wen.yang@linux.dev>,
 linux-trace-kernel@vger.kernel.org, 	linux-rt-devel@lists.linux.dev,
 linux-doc@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Sat, 21 Nov 2026 15:01:13 +0100
In-Reply-To: <20261107171252.25090-10-kmehltretter@gmail.com>
References: <20261107171252.25090-1-kmehltretter@gmail.com>
	 <20261107171252.25090-10-kmehltretter@gmail.com>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sat, 2026-11-07 at 18:12 +0100, Karl Mehltretter wrote:
> IRQ-exit softirq processing preserves hardirq state until it finishes. Te=
st
> the resulting hardirq-to-softirq-to-hardirq sequence, including a nested
> hardirq and monitor attachment during the transition.
>=20
> Boundary and tick-exit callbacks can themselves raise more softirq work.
> Raise work at softirq entry, softirq exit, the final hardirq boundary, an=
d
> a full-NOHZ tick_stop event. Verify that ordinary work reaches ksoftirqd,
> forced-thread timer work reaches ktimerd, and a timer-wakeup callback whi=
ch
> raises ordinary work gets the final ksoftirqd recheck.
>=20
> Track the synthetic owner and serving-softirq interval so unrelated neste=
d
> interrupts do not corrupt the expected sequence. Reject the handoff setup
> while bottom halves are blocked, attach observers before waiting for
> workers, and recheck the setup with interrupts disabled.
>=20
> On PREEMPT_RT, verify that worker events do not report hardirq provenance=
.
> Do not run the synthetic inline IRQ-exit cases there. IRQ exit defers
> softirqs to workers, and serving-softirq state is task-local rather than
> encoded solely in preempt_count().
>=20
> Snapshot reaction counts inside synthetic IRQ-disabled and hardirq
> intervals, then evaluate the KUnit expectations after restoring normal ta=
sk
> context.
>=20
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

I still couldn't read the KUnit tests, but from what I get quickly scanning
these, it's massive. A total of almost 3k lines of KUnit tests for 2 simple
models is probably a bit much.

Keep in mind you are testing your unit, which is an RV monitor, so you may =
want
to stress transitions, mess around with the environment as little as you ca=
n
(e.g. disable interrupts) and use mocks/stubs where you can. It isn't alway=
s
easy, but the fact you're touching softirq.c doesn't look right. Your
unit isn't the softirq machinery, you should interact with it as least as
possible.

If you really want to test the system as a whole, you do a selftest,
which stresses from userspace, more like an integration test than a unit
tests.

Thanks,
Gabriele

