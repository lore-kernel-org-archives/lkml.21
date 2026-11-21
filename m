Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795269588;
	b=2u18lOTPpTK/ZjVRVWyiEMHCJjpwAxoatQRtiklekWlvIZgGUcLi9nhEH7KtAkbiV6V/
	 t9C6nuo9NeACUjE+PqvSoqe4619JfCxvWw2G+whgZWPyAzWB7twHXCHLzw0XkfFq9DCx3
	 PaswwTxp+kt/cnQ3CqXpCmu+hYay+xssdOpWwfZ6Mw2s1piri8ZeynGFCqcn0EBH3eI8X
	 GysT6oxvnbB+hO8MKEcjzAXicxDdte61RPP6gPz3ucbzHIn6ueZD//G3NeLiP1bVupTWd
	 /yNJHCeWzgQW9dT5hlGM7rPpET1zlqMMi7a77nVykCVNdiqIEfAYgC9Xd2ORipv1nIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795269588;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=7k3r8PPDrCxF6hP3X+zpUxZn2jKh7gdiIuJh7iAh3oI=;
	b=qBY8HlaMEToRxp/PXi1/9xmM8MEF93bkCpwMYMuifwPsoihvXq12Z66t2kTZtQJwPRRd
	 QVFJ6Ipiv2gkHGW2GxNJQn1bly/OHpYVIDuYBUUVrCBFRkmTL2mx4pGZMqVANIwtGp/f+
	 aKYsmEVm8pVcS5xwZBYzQMWA/nqS9kJ6uVNUy6kKSRxDm69qwLTWOJXj2wzJ94kBwduq/
	 Mz5zX9Sk0E/dn3m1YFaRuCDhCsVTl0APWPyZKzn1OlysdK3aBTG3UBhkRYNqMNSczYWYe
	 /RPhCFKqPpSLhNvW3K9cA4Isg+MEAGV1NSKrFesCblqVz0Led3TDanZlH7xddKlrp4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QqFur8SC;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=U9SLj7ku;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01345606A32C
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01345606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QqFur8SC;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=U9SLj7ku
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795269586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=7k3r8PPDrCxF6hP3X+zpUxZn2jKh7gdiIuJh7iAh3oI=;
	b=QqFur8SCBpCAwvx6tfIegyK8wpI88eXtVsKt1h00iOk767vUE88TG/Z3752zq7wvXw9ZxH
	L/kDh9Aec2lXd/xW6dwTcnayOFfZ42jTf3vFd28NtyPNna43Ml5NQL5si5YC2i8nfDWAQz
	yjsfv0uvabgA5o3w7lkxAqm9ll5kzyw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-512-ksWfdiPdMC-5t9HOoepXdw-1; Sat, 21 Nov 2026 13:59:43 +0000
X-MC-Unique: ksWfdiPdMC-5t9HOoepXdw-1
X-Mimecast-MFC-AGG-ID: ksWfdiPdMC-5t9HOoepXdw_1795269582
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48e00f3929bso1564130f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 05:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795269582; x=1795874382; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7k3r8PPDrCxF6hP3X+zpUxZn2jKh7gdiIuJh7iAh3oI=;
        b=U9SLj7kutrjy7uh89FgVLtzDDev/JyugjhVvb/FHmxLA+VHDDZM16uuc+dk/N3JY39
         aaYtSSd/yOYkAcyxhLr3UgdRaDMptelc6sOdBcSX8ilAT7UMu7Abl++dkTXWJH2MsihV
         3ZFqcyHNaqG4qSC7LmXO4l92/0zQFSdP0oRWcTgLl3qehy3IO4v+aHzfk4TjkZktlXVS
         ub0fJXmArCrbWV2Z4VR3eMM4hGkpR31XAxQVKJfsX8Gb/tKBk+7hvio2vM6BnO64y36M
         DD+FMiI10UHO0CZKLEIILf5GQIXUmZmMed3ZbH3Chnsbm9/TcK1GV3tcc9UqvtkjqdZr
         S6zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795269582; x=1795874382;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7k3r8PPDrCxF6hP3X+zpUxZn2jKh7gdiIuJh7iAh3oI=;
        b=Ba1T/huTdNwcEObGBqAXyHPBzd8hq1mDBrBk4ngwxawkgc8phAW2rHLqAl/GUb/TBX
         jyPUpHeLhb/FaJWgcFPoDLtTopCi41Lwb1xunivnRgcPrVIWCZx3Pj6KlHVBuDBLnmQe
         t5ycw8/PubdBHCqQeN8X3qmF5VxzdY+7bQcIg+q6lH2OnSSwESIBv/XzGkDqoy7ZxpcD
         DBGm4Jr886lPvZBG6ehgTFD0ycFyjbVCTDb2MoKmZIVGKueRBC0vTJsTEa12AHhaLLSz
         VQpoQsn1Ye+9wMuwGlGQ5btgDC92uhaoGSebm7cARF/uDCH/g5ogSbu+936iYyNm6Yya
         BuCg==
X-Forwarded-Encrypted: i=1; AL+hErGbRTcbD50ngtx2cf5B/19zm0ImVCZwOejFBhoTeEuwftr1Ho3HE+7zxAUhwKAOzrdOzgcAgz853+ftGoQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bsnuQovm42jfjm+Ql9BzmSWUOJMvGELSn+NEe4VyXHZgSDWmK
	UWXdFy9YhNLTNJQanYaZ73DIYzhKgTi7+RouJBZE3PivvOZ574/AoLf4BLVWW0KxWRLjuCIlXbJ
	xVFXkQb7Uxop88rznlgEovTPAvBEr7CTYa26ecEtHdAwwnoVwoGrjOGoBFxA7QjbUWQ==
X-Gm-Gg: AZFdTZcqk6f3uET92Wlnv/TZyv2vJn3uQ+m0VeI8x7ec7TIgWWtEIdoTNLXG6Vr8vYO
	RSwLEyestQoU8BxujX3KnHuAKrB8UAZjoEgo/xrZ+KtE5egFMSsK1YhVmUZWwzRHr7uoxv/a760
	xFJPryAi9bYdWYao02VTVUMrQowSzQ9m6LLdtpP10J0kjV7bX8mJRLQp3oqrvUnNjJviaifpR5W
	2AbJj1dVdNRBVPlmFNs3JWfMdvqLtqW3bG321eSzDyeOcHU2MBh7pPEmFVMSHZ/0Wle5Un+kf0X
	WrY0WwPFqB40pncTheUGSD3NNfsVWmKjwcL/QGDET7zZPySpAsHWzbFhBIIRGdCiXcwl+se37kq
	EUlmmZI53x5tUhyNGjrY2uVzymU1En/WE5RKcYNjucN+W++/2XVtNvdjPMHKOU+BQJh6ANBt8Rz
	2w
X-Received: by 2002:a05:6000:40ce:b0:488:8347:a110 with SMTP id ffacd0b85a97d-4abafd02fa0mr13900114f8f.7.1795269582307;
        Sat, 21 Nov 2026 05:59:42 -0800 (PST)
X-Received: by 2002:a05:6000:40ce:b0:488:8347:a110 with SMTP id ffacd0b85a97d-4abafd02fa0mr13900067f8f.7.1795269581747;
        Sat, 21 Nov 2026 05:59:41 -0800 (PST)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.168.96.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf61b8sm10627917f8f.19.2026.11.21.05.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:59:41 -0800 (PST)
Message-ID: <a1ed104307416cf20b59b19e7b3ed4669403829c.camel@redhat.com>
Subject: Re: [RFC PATCH v2 5/9] docs/rv: Document the IRQ monitors
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
Date: Sat, 21 Nov 2026 14:59:38 +0100
In-Reply-To: <20261107171252.25090-6-kmehltretter@gmail.com>
References: <20261107171252.25090-1-kmehltretter@gmail.com>
	 <20261107171252.25090-6-kmehltretter@gmail.com>
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
> Document the irqstate and irqexit models, including their text
> schematics, synchronization rules, PREEMPT_RT behavior, bare-tracepoint
> boundaries, per-CPU vs per-task automaton separation, tracefs interface,
> and coverage limits.
>=20
> irqstate observes hardirq contexts whose boundaries pass through
> irq_enter() or irq_enter_rcu() and irq_exit() or irq_exit_rcu(). Direct
> __irq_enter() and __irq_exit() users, raw-only paths, and
> architecture-specific intervals before generic entry and after generic
> exit remain outside its coverage.
>=20
> Clarify that irqexit monitors preempt_schedule_irq() as a per-task
> automaton rather than treating it as the complete interrupt-return path.
>=20
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---

In the subject use Documentation/rv: , consistently with the others, you ca=
n
always check with git log --oneline Documentation/trace/rv/

Who is the target of this documentation? Humans or machines? I skimmed it a=
nd it
looks alright though very detailed.
Unless there are particular quirks (like what you do to start irqstate), yo=
u
probably aren't supposed to describe too much what the kernel does with
interrupts and can be a bit more concise.
The reader should be able to infer details from the models and should have =
some
knowledge of how the machinery works.

But take this as a general advice because I didn't read it all too carefull=
y,
keep in mind I want to read this and not have my LLM summarise it for me, s=
o the
target should be (at least one) human.

> =C2=A0Documentation/trace/rv/index.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 1 +
> =C2=A0Documentation/trace/rv/monitor_irq.rst | 350 ++++++++++++++++++++++=
+++
> =C2=A02 files changed, 351 insertions(+)
> =C2=A0create mode 100644 Documentation/trace/rv/monitor_irq.rst
>=20
> diff --git a/Documentation/trace/rv/index.rst
> b/Documentation/trace/rv/index.rst
> index 29769f06bb0f0..8dd4041e1a0eb 100644
> --- a/Documentation/trace/rv/index.rst
> +++ b/Documentation/trace/rv/index.rst
> @@ -15,6 +15,7 @@ Runtime Verification
> =C2=A0=C2=A0=C2=A0 monitor_wip.rst
> =C2=A0=C2=A0=C2=A0 monitor_wwnr.rst
> =C2=A0=C2=A0=C2=A0 monitor_sched.rst
> +=C2=A0=C2=A0 monitor_irq.rst
> =C2=A0=C2=A0=C2=A0 monitor_rtapp.rst
> =C2=A0=C2=A0=C2=A0 monitor_stall.rst
> =C2=A0=C2=A0=C2=A0 monitor_deadline.rst
> diff --git a/Documentation/trace/rv/monitor_irq.rst
> b/Documentation/trace/rv/monitor_irq.rst
> new file mode 100644
> index 0000000000000..3e4aa819fcbbc
> --- /dev/null
> +++ b/Documentation/trace/rv/monitor_irq.rst
> @@ -0,0 +1,350 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +IRQ monitors
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +- Name: irq
> +- Type: container for IRQ context monitors
> +- Author: Karl Mehltretter <kmehltretter@gmail.com>
> +
> +Description
> +-----------
> +
> +The ``irq`` container groups monitors which compare interrupt-related
> +events with the execution context recorded by the kernel.=C2=A0 The moni=
tors are
> +architecture independent: they consume generic tracepoints and do not re=
quire
> +an architecture assembly hook.
> +
> +The first monitor deliberately observes only safe, instrumentable events=
.=C2=A0 It
> +does not cover the interval between physical interrupt entry and
> establishment
> +of generic hardirq state.=C2=A0 The boundary hooks are bare tracepoints =
declared
> +with ``DECLARE_TRACE()`` rather than user-space tracefs events.

It's ok to say that it is architecture independent, but don't focus on the
implementation details of tracepoints, these don't belong to the monitor
documentation. I know LLMs like to write whatever they put in code also as =
text,
it gets easily unmaintainable and adds little value.

You want to describe the logic between your choices, not the technical tool=
 you
use to implement them.

> +
> +The two specifications use distinct automaton instances because they tra=
ck
> +different objects.=C2=A0 ``irqstate`` is a per-CPU automaton: a hardirq =
interrupts
> +whichever task happens to be running on that CPU, and non-RT softirq
> +execution is CPU-local.=C2=A0 ``irqexit`` is a per-task automaton: an in=
vocation
> +of ``preempt_schedule_irq()`` belongs to the interrupted task's stack fr=
ame,
> +multiple tasks may be suspended inside the helper at the same time, and =
a
> +suspended invocation can migrate to another CPU before returning.=C2=A0 =
The
> +container enables and disables both automata together by default while
> +keeping per-CPU and per-task state independent.

Right, this makes sense and I get why you'd want to match schedules for own=
ers
in the irqexit.
Still it feels like checking the owner is fairly tautological, since the ta=
sk
will resume with its own stack anyway. Unless the kernel is really broken,
current would do just fine.

Besides, if you drop owner completely and just rely on current, in the
apocalyptic case something breaks, the model would probably catch some extr=
a
switches in the middle anyway.
Though it doesn't cost much so it can probably stay.

What do you think?

> +
> +Monitor irqstate
> +----------------
> +
> +The ``irqstate`` monitor checks the ordering of hardirq contexts whose e=
ntry
> +and exit pass through ``irq_enter()``/``irq_exit()`` or
> +``irq_enter_rcu()``/``irq_exit_rcu()``, and of complete serving-softirq
> +contexts. Each boundary must agree with the corresponding preempt-count
> state:
> +
> +.. list-table:: Event and required context
> +=C2=A0=C2=A0 :header-rows: 1
> +
> +=C2=A0=C2=A0 * - Kernel event
> +=C2=A0=C2=A0=C2=A0=C2=A0 - Model event
> +=C2=A0=C2=A0=C2=A0=C2=A0 - Required environment
> +=C2=A0=C2=A0 * - ``hardirq_context_entry``
> +=C2=A0=C2=A0=C2=A0=C2=A0 - ``hardirq_entry``
> +=C2=A0=C2=A0=C2=A0=C2=A0 - ``hardirq > 0``; serving-softirq state select=
s the source state
> +=C2=A0=C2=A0 * - ``hardirq_context_exit``
> +=C2=A0=C2=A0=C2=A0=C2=A0 - ``hardirq_exit``
> +=C2=A0=C2=A0=C2=A0=C2=A0 - ``hardirq > 0``; serving-softirq state select=
s the destination state
> +=C2=A0=C2=A0 * - ``softirq_context_entry``
> +=C2=A0=C2=A0=C2=A0=C2=A0 - ``softirq_entry`` or ``softirq_entry_from_har=
dirq``
> +=C2=A0=C2=A0=C2=A0=C2=A0 - ``hardirq =3D=3D 0 && serving_softirq =3D=3D =
1``
> +=C2=A0=C2=A0 * - ``softirq_context_exit``
> +=C2=A0=C2=A0=C2=A0=C2=A0 - ``softirq_exit`` or ``softirq_exit_to_hardirq=
``
> +=C2=A0=C2=A0=C2=A0=C2=A0 - ``hardirq =3D=3D 0 && serving_softirq =3D=3D =
1``
> +=C2=A0=C2=A0 * - ``sched_switch`` from a serving-softirq task (PREEMPT_R=
T)
> +=C2=A0=C2=A0=C2=A0=C2=A0 - ``softirq_suspend``
> +=C2=A0=C2=A0=C2=A0=C2=A0 - ``hardirq =3D=3D 0``
> +=C2=A0=C2=A0 * - ``sched_switch`` to a serving-softirq task (PREEMPT_RT)
> +=C2=A0=C2=A0=C2=A0=C2=A0 - ``softirq_resume``
> +=C2=A0=C2=A0=C2=A0=C2=A0 - ``hardirq =3D=3D 0``
> +
> +``serving_softirq`` uses ``in_serving_softirq()``.=C2=A0 It therefore
> distinguishes
> +a serving-softirq interval from a task which merely disabled bottom halv=
es.
> +The hardirq condition uses the hardirq component of ``preempt_count``.
> +Softirq events also report whether hardirq state was replaced for inline
> +processing during interrupt return. The exit event reports whether hardi=
rq
> +state will be restored.
> +
> +On PREEMPT_RT the serving interval includes preparation before
> +``handle_softirqs()`` and teardown after it, not just handler execution =
or
> +CPU-time accounting. A worker can enter and leave this context even if i=
ts
> +pending-work check finds nothing. The RT entry event follows the counter
> +update that sets the serving bit, and the exit event precedes the update
> +that clears it. Processing inline from ``local_bh_enable()`` has the sam=
e
> +boundaries; ordinary BH-disable nesting does not emit context events.
> +
> +RT worker entry acquires any blocking BH lock before the counter update.
> +When the entry tracepoint is enabled, the update and event execute toget=
her
> +with local IRQs disabled, then restore the original IRQ state. No new IR=
Q
> +disable/enable pair is introduced when that tracepoint is disabled. RT
> +decrements already execute with IRQs disabled. Non-RT retains its existi=
ng
> +IRQ-disabled processing-loop boundaries.
> +
> +The model has six states: ``idle``, ``in_hardirq``, ``in_softirq``,
> +``hardirq_from_softirq``, ``softirq_from_hardirq``, and
> +``hardirq_from_softirq_from_hardirq``. The initial and accepting state i=
s
> +``idle``. The following schematics omit the guards listed above. To keep=
 the
> +state names short, ``A > B`` denotes the state reached when context ``B`=
` is
> +entered from context ``A``; it does not imply that both context-count
> +components remain set::
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 hardirq_exit
> +=C2=A0=C2=A0=C2=A0 +----------------------------+
> +=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v
> +=C2=A0 +---------+=C2=A0 hardirq_entry=C2=A0=C2=A0 #=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D#
> +=C2=A0 | hardirq | <--------------- H=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 idle=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 H <+
> +=C2=A0 +---------+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
#=C2=A0 |
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | softirq_entry=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> softirq_exit
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | softirq_resume=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
> softirq_suspend
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +---------------------------------+=C2=A0=
 |
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +-------------> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirq=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | -+
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 +---------------------------------+
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | hardirq_exit=C2=A0=C2=A0=C2=A0 | hardirq_entry
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 +---------------------------------+
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +-------------- |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 so=
ftirq > hardirq=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +---------------------------------+
> +
> +The softirq interval during hardirq return and a hardirq nested within t=
hat
> +interval form the remaining part of the model::
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +-----------------------------+
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 hardirq=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | <+
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +-----------------------------+=C2=A0 =
|
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | softirq_entry_from_hardi=
rq=C2=A0=C2=A0 | softirq_exit_to_hardirq
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +-----------------------------+=C2=A0 =
|
> +=C2=A0=C2=A0=C2=A0 +------------> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hardir=
q > softirq=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | -+
> +=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +-----------------------------+
> +=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> +=C2=A0=C2=A0=C2=A0 | hardirq_exit=C2=A0=C2=A0 | hardirq_entry
> +=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v
> +=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +-----------------------------+
> +=C2=A0=C2=A0=C2=A0 +------------- | hardirq > softirq > hardirq |
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +-----------------------------+
> +

I like the way you split into two branches, maybe keep the root (idle) in b=
oth
so it's clearer.

> +The ``softirq_from_hardirq`` state represents non-RT softirq processing
> +during interrupt return. The kernel replaces ``HARDIRQ_OFFSET`` with
> +``SOFTIRQ_OFFSET`` while the handlers run, then restores hardirq state b=
efore
> +completing interrupt exit. The ``hardirq_from_softirq_from_hardirq`` sta=
te
> +represents a nested hardirq during those handlers.
> +
> +On PREEMPT_RT, serving-softirq state is task-local and the serving inter=
val
> is
> +preemptible.=C2=A0 A switch away from that task suspends its CPU context
> +(``in_softirq -> idle``); a switch back resumes it (``idle -> in_softirq=
``).
> +The adapter reads the outgoing and incoming task's softirq count at
> +``sched_switch``.=C2=A0 Interrupts are disabled there, so no hardirq bou=
ndary can
> +occur between representing the incoming task and the actual context swit=
ch.
> +A hardirq in a task which preempted a softirq therefore starts in ``idle=
``.
> +
> +Hardirq depth greater than one is collapsed into the surrounding hardirq
> +state.=C2=A0 The depth comes from the existing hardirq component, so the=
 monitor
> +does not maintain a second counter which could wrap independently.
> +
> +The boundary events run after entry state has been established and befor=
e it
> +is removed.=C2=A0 A false transition or guard invokes the selected RV re=
actor and
> +emits the monitor's error trace event.
> +
> +On hardirq exit, ``hardirq_context_exit`` runs near the end of the gener=
ic
> +exit path, after tick-exit work and before removal of ``HARDIRQ_OFFSET``=
.
> +Hardirq accounting ends earlier, before inline softirq and tick-exit wor=
k.
> +``irqstate`` returns to the outer model state at this boundary. When the
> event
> +is enabled, the outermost-exit handoff passes pending timer work to ktim=
erd
> +with forced IRQ threading. It also passes pending softirq work to ksofti=
rqd
> +when no enclosing softirq or bottom-half-disabled state suppresses the w=
ake.
> +These handoffs catch work raised by tick-exit and event callbacks. The e=
vent
> +does not represent return from ``irq_exit_rcu()``, the later reschedule
> check,
> +or the architecture return tail.
> +
> +Hardirq accounting and lockdep hardirq state have separate lifetimes. Lo=
ckdep
> +can also create a synthetic hardirq interval without changing
> +``HARDIRQ_OFFSET``. ``irqstate`` models the preempt-count context and do=
es
> not
> +report those lockdep-only intervals.
> +
> +Synchronization
> +---------------
> +
> +Enabling a per-CPU monitor does not imply that the CPU is in task contex=
t.
> +An outer hardirq or softirq entry from a known idle context starts the m=
odel
> +and consumes the event. An outer exit can instead establish the idle sta=
te
> +without consuming an unmatched event when monitoring starts in the middl=
e of
> +that context. Provenance-marked softirq boundaries do not start monitori=
ng:
> +they belong to an enclosing hardirq. If attachment occurs during that
> +sequence, its final hardirq exit establishes ``idle``. If monitoring sta=
rts
> +while a hardirq interrupts an ordinary softirq, the hardirq pair is igno=
red
> +until the enclosing softirq exit establishes the idle state. On PREEMPT_=
RT, a
> +softirq suspension also establishes ``idle``, and a resumption can start
> +monitoring directly in ``in_softirq``.
> +
> +On PREEMPT_RT, probe attachment waits for an RCU grace period before the
> +monitor can become enabled. This drains BH preparations which sampled th=
e
> +entry tracepoint disabled before attachment. Otherwise an intervening IR=
Q
> +could synchronize the model to idle before a preparation publishes its
> +serving bit without an entry event. New preparations see the attached
> +entry probe and serialize the bit update with their event.
> +
> +Monitor irqexit
> +---------------
> +
> +The ``irqexit`` monitor follows each task's invocation of
> +``preempt_schedule_irq()``. It consumes ``sched_irq_preempt_entry``,
> +``sched_irq_preempt_exit``, and ``sched_switch``. Both boundary events m=
ust
> +observe zero hardirq count and disabled local interrupts. The owner save=
d
> +in the invocation's stack frame must match the current task at both
> +boundaries.
> +
> +The boundary tracepoints pass preempt-count and interrupt-state snapshot=
s
> +taken at the scheduler call site, before tracepoint dispatch can change =
the
> +observed context. Disabled hooks do not take these extra snapshots. The =
RV
> +adapter still evaluates its original live-context guards; the snapshot
> +arguments provide an independent check for direct tracepoint probes.
> +
> +The model has three states: ``idle``, ``rescheduling``, and ``suspended`=
`.
> +The initial and accepting state is ``idle``. The schematic omits the gua=
rds
> +described above::
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch_in / switch_out=C2=A0=C2=A0 #=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D#
> +=C2=A0=C2=A0=C2=A0 +------------------------- H=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 H
> +=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 H=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 idle=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 H
> +=C2=A0=C2=A0=C2=A0 +------------------------> H=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 H <+
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D#=C2=A0 |
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | resched_entry=C2=A0=C2=A0 |=
 resched_exit
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +----------------+=C2=A0 |
> +=C2=A0=C2=A0=C2=A0 +------------------------> |=C2=A0 rescheduling=C2=A0=
 | -+
> +=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 +----------------+
> +=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> +=C2=A0=C2=A0=C2=A0 | switch_in=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | switch_out
> +=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v
> +=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 +----------------+
> +=C2=A0=C2=A0=C2=A0 +------------------------- |=C2=A0=C2=A0 suspended=C2=
=A0=C2=A0=C2=A0 |
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +----------------+
> +
> +The incoming event cannot require its target to be current: ``sched_swit=
ch``
> +still executes in the outgoing task. Local interrupts remain disabled
> +until the incoming task runs.
> +
> +Instances belong to tasks, not CPUs. Two tasks may have independently
> +suspended invocations, and resuming on another CPU must use the same tas=
k's
> +instance. An interrupt or IRQ-exit schedule in another task cannot retur=
n
> +on behalf of the suspended owner. Ordinary switches while ``idle`` do no=
t
> +change its state.
> +
> +An entry starts monitoring and consumes the event. If the monitor was
> +enabled during an existing invocation, its first valid exit instead
> +establishes ``idle`` without consuming an unmatched event. Switches alon=
e
> +do not synchronize a task. An exit with an invalid context or owner must
> +not be skipped as a synchronization event.
> +
> +The helper can also run on a kernel exception return. Its events therefo=
re
> +do not prove that an invocation followed a physical interrupt, and they =
do
> +not describe architecture register restoration or context tracking after
> +the helper returns. The existing helper entry assertions can reject an
> +invalid caller before the entry event; such a failure is not a violation
> +detected by this monitor.
> +
> +``irqexit`` does not associate an invocation with a preceding hardirq. I=
t
> +cannot observe work between ``hardirq_context_exit`` and the helper entr=
y or
> +between the helper exit and return to the interrupted context.
> +
> +Relationship to sched/sts
> +-------------------------
> +
> +The scheduler ``sts`` monitor models the ordering of IRQ disable/enable,
> +scheduler entry/exit, and task switches.=C2=A0 It uses ``irq_handler_ent=
ry`` and
> +selected x86 vector events to refine that scheduler model.
> +
> +``irqstate`` does not consume IRQ action or scheduler entry/exit events.=
=C2=A0 It
> +observes generic context boundaries, so multiple actions in one interrup=
t and
> +an action dispatched through ``generic_handle_irq_safe()`` do not change=
 its
> +state.=C2=A0 On PREEMPT_RT it uses task switches only to follow the acti=
ve softirq
> +context. ``irqexit`` observes the surrounding IRQ-preemption loop and it=
s
> +task owner, rather than inferring that protocol from individual schedule=
r
> +entry/exit events used by ``sts``.
> +
> +.. list-table:: Monitor coverage
> +=C2=A0=C2=A0 :header-rows: 1
> +
> +=C2=A0=C2=A0 * - Property or event
> +=C2=A0=C2=A0=C2=A0=C2=A0 - ``sched/sts``
> +=C2=A0=C2=A0=C2=A0=C2=A0 - ``irq/irqstate``
> +=C2=A0=C2=A0 * - IRQ disable and enable ordering
> +=C2=A0=C2=A0=C2=A0=C2=A0 - yes
> +=C2=A0=C2=A0=C2=A0=C2=A0 - no
> +=C2=A0=C2=A0 * - IRQ action entry
> +=C2=A0=C2=A0=C2=A0=C2=A0 - yes
> +=C2=A0=C2=A0=C2=A0=C2=A0 - no
> +=C2=A0=C2=A0 * - scheduler entry and exit
> +=C2=A0=C2=A0=C2=A0=C2=A0 - yes
> +=C2=A0=C2=A0=C2=A0=C2=A0 - no
> +=C2=A0=C2=A0 * - task switch
> +=C2=A0=C2=A0=C2=A0=C2=A0 - yes
> +=C2=A0=C2=A0=C2=A0=C2=A0 - PREEMPT_RT softirq context only
> +=C2=A0=C2=A0 * - ``irq_enter[_rcu]()``/``irq_exit[_rcu]()`` hardirq cont=
ext
> +=C2=A0=C2=A0=C2=A0=C2=A0 - no
> +=C2=A0=C2=A0=C2=A0=C2=A0 - yes
> +=C2=A0=C2=A0 * - complete serving-softirq context
> +=C2=A0=C2=A0=C2=A0=C2=A0 - no
> +=C2=A0=C2=A0=C2=A0=C2=A0 - yes
> +=C2=A0=C2=A0 * - hardirq interruption of a softirq
> +=C2=A0=C2=A0=C2=A0=C2=A0 - no
> +=C2=A0=C2=A0=C2=A0=C2=A0 - yes
> +
> +Coverage limits
> +---------------
> +
> +The context tracepoints are emitted by ``irq_enter_rcu()`` and
> +``irq_exit_rcu()``. Softirq boundaries come from the RT serving-bit upda=
tes
> +or the non-RT generic processing loop. Consequently this monitor cannot
> +observe:
> +
> +- the early architecture entry interval before ``irq_enter_rcu()``;
> +- paths which directly use ``__irq_enter()`` and ``__irq_exit()``, such =
as
> +=C2=A0 the arm64 APEI SEA irq-work interval;
> +- architecture or special-vector paths which use only
> +=C2=A0 ``__irq_enter_raw()`` and ``__irq_exit_raw()`` (including x86 sim=
ple system
> +=C2=A0 vectors);
> +- NMI entry and exit; or
> +- instrumentation reached while removing hardirq-count or non-RT
> +=C2=A0 serving-softirq state, work after those removals, return from
> +=C2=A0 ``irq_exit_rcu()``, the conditional reschedule check, and
> +=C2=A0 architecture-specific state restoration.
> +
> +``irqexit`` checks ``preempt_schedule_irq()`` separately. It does not jo=
in
> +that helper to the preceding ``irqstate`` instance or model an architect=
ure's
> +entire exit.
> +
> +The standard hardirq tracepoints describe individual IRQ actions rather =
than
> +physical interrupt boundaries.=C2=A0 They are deliberately not used: syn=
thetic
> +dispatch and software resend can execute an action outside hardirq conte=
xt,
> +and one interrupt can execute several actions.
> +
> +These limitations are intentional.=C2=A0 A later architecture hook may p=
rovide a
> +deferred raw-entry marker for the very-early interval.=C2=A0 Such an add=
ition
> needs
> +a separate event contract and does not change the meaning of ``irqstate`=
`.
> +
> +Enabling the monitor
> +--------------------
> +
> +With tracefs mounted at ``/sys/kernel/tracing``::
> +
> +=C2=A0 # cd /sys/kernel/tracing/rv
> +=C2=A0 # grep -x irq:irqstate available_monitors
> +=C2=A0 # echo irqstate > enabled_monitors
> +=C2=A0 # echo irqexit >> enabled_monitors
> +=C2=A0 # echo nop > monitors/irq/irqstate/reactors
> +=C2=A0 # echo nop > monitors/irq/irqexit/reactors
> +
> +Use the ``nop`` reactor during initial qualification.=C2=A0 Select the `=
`panic``
> +reactor only after unexplained violations have been excluded on the targ=
et
> +configuration.

This is already explained elsewhere, you don't need it here.

Overall I need to get a deeper look at the models, but they look fairly
reasonable to me, assuming folks like introducing these new tracepoints and
wouldn't prefer you kind of use a combination of something else that is alr=
eady
there (usually not trivial).

Thanks,
Gabriele

