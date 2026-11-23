Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795420744;
	b=yWAlHDxMWbwXKnojcp6ldQnNzxCWee2UD9txYc4Yd0NHUVoAZnPoe3H+x9GQv1/ZbzxJ
	 gl613WCi5trn1uihOANohDkXn/gxRoA0yc7qYW/A8dMe9q4tJJHXLSgqlqcQGWCEBrU79
	 bsrp4YREARVSWYYFyZ9JHUuWbIkRcjJDYvUSB36Kp1x6HkH+piTDo9THHznwWERBEa0Sm
	 gRB539VuvLTK93trVh3P7wXb1XMseldEIk+ZGq0bvRm2rNOk94F/fgK2DDOf3drDU0ZzV
	 qNYtMwb+grFGb4iwHaaplbCrcL7h/aTkawxPgu2RxRwyWS4GbxZtCMxo0j2DLGnjIww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795420744;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=W+zsJJ1aBB5y23DhHkSQAtsEWnBqQa/ccFUCBqopeOY=;
	b=y3Q05mvtmzgHXzFlESgMEta9K2WirZm3yBBUtUdpr4I1blZaOCGW6d/ZthaAdNbCZVuy
	 62uakG7FZh0oKqm7fL3sZuwQRUBCyusLlndz5INjfmVuEDayQeGskCS9R/0JiYaTQmmq3
	 WqC5SGu2i8uLlI3Cp9CsGTb4cffrucnn4TBW6OaI6PHez5UBtD0iS6JIM+6gE+n3u4xzF
	 sTiP/9zfwnagRNGgDeRKK7tGyyzViLP2QxLtlx5NnfqdHxbJ1pdTr4ngR2hXJAnx1Jxqh
	 kiWn+KFirB0EREbm41jzmBP3Kqvo+DH39k91J/yRMOLeCfR65kK+XW3M1ri55Dt9DUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QISGdT3k;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pzoYqGoq;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05A5606A32E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:59:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D05A5606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QISGdT3k;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pzoYqGoq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795420742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=W+zsJJ1aBB5y23DhHkSQAtsEWnBqQa/ccFUCBqopeOY=;
	b=QISGdT3koEGTFcYByJZX8zPTULxzW7fGETNvivrXfNYBNyK4BH45wd1/PR4X7kNMYwrTJE
	3lAiJgiaKq66ISBPGqto8dyRQyJ8ANbt7l0HC6oWFAwqLUOsbUTL51pwDuxJ0vgomhXrIV
	Ckpc9r1wjEmSZllnwzZ8pbb5rOHXGMU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-DRQARebwMPa-SjKYUSBgLw-1; Mon, 23 Nov 2026 07:59:00 +0000
X-MC-Unique: DRQARebwMPa-SjKYUSBgLw-1
X-Mimecast-MFC-AGG-ID: DRQARebwMPa-SjKYUSBgLw_1795420740
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4b0a307487aso13973015e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 23:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795420739; x=1796025539; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W+zsJJ1aBB5y23DhHkSQAtsEWnBqQa/ccFUCBqopeOY=;
        b=pzoYqGoqML8EpEkLBFXlsnFXXKnDIAH8c8QsznzmkKr3JE+coZBudrIQXiCXeYjY/B
         e638N/bGtTMvx14tsYrMiperx9x1uZAhFWZ4Osr22zZmU0f4wCwJrdsJtci81pbIsr8W
         dvk8Y6SS5W2YDhwo5tuHhYpnXDkejTRMg9t1SPHTddn+9lW90iRdR7oTgxJIo3aarYrl
         p2Gm7+WZRjUqnZt9hae1x+4n50oYcc5Hb2pK/FgYBHihB8gPQsATGOsib4D2aWXqMwkk
         3EUYjKp2PSoE/fjYQuzeDdM+X04E6bwDZ4lmmwLBNqrvm8ZMDiGe3kPz70TXvHktMJaV
         B/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795420739; x=1796025539;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W+zsJJ1aBB5y23DhHkSQAtsEWnBqQa/ccFUCBqopeOY=;
        b=hjzGSj6kFdws6bOZcasgvGLYuisEkbYfLgi2CudImgsdOETjN0q+7hLOOJaOk44/jy
         tszBpyT6+GVKhdhex6Ung+7GzDQlmerSXIQYUEKbzjexGH4PZwJdTXq88n09Y7OJfEwX
         0azMSEb5MS++ZeVbRxpz8l+ulRzPVWXZ3e8Qvy2wUiLMH4gKzKm+BntHXH+WHkgjUQjM
         udsu8mV3gLmJ5mB57bejWcTDW4fmnmhjkl+N5jgFddfDGa4TD/DmUtscJyU+EM5+Lpn1
         I0TADYwAK07wJc9g/+IXWt6Fh13Qo5nOZ4DMMinWNu6kc7ten/PHXWXYX3DCYbscYtuh
         3+cw==
X-Forwarded-Encrypted: i=1; AL+hErFVk45s2Q9eAtM80F9VTZSTDCWybk1/sAAzeZTdutp3JA/5hiLRyfGyiAJdZQ1OZILjC6rmpPJeKzJ3z0U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qqHU5bBfugkAnv99X4V9vaMImDfwesQPEKLE38Y9s0nKIZvXS
	01KaBegyjiC8TQ1Zw781dGeTVU2R6Sc4jq/pmGSem3n6qLPfRVAE4ZwgUW7tqkq60LTlN+zMpsw
	6y8MOp4RMC9SL1vuUToR6pleta77Jn5vII4IkZOBB1VrfxHXm5QvxxSrNpvf9L6DLYw==
X-Gm-Gg: AZFdTZefvDLEOlg4YJ+i3dnspIh9gePlLDyJShEVSNRacSK+CT1WyyP/cPdVmEDuQ6B
	G0NL5E7dhMZOrgQbpXoYkqeLq3SuuhZ3bNIiuhdlapCpILilJvrXz5cJZVcU8njPOSLOrm0fCQx
	RRQnxSU1P6h4zYDmCjItFB6pwegRECGGEUbHE4OcHT+oEDvwrdtWisYMMZs3nycpjlOPXr5I/zE
	9HwJiSVX7vEfmFC/Tc0GQ9oeFdQiclhi1rd33wkwfyxrihqIyVxkb1Oe6uCUvve88YV3n/YnsuB
	7+cnfmxEXTJ2IsM9NrVSW3J0G4P4ykvZrk4nDCS4ceDlLOzw8Ods7TWqakcBwFBshn3ry475hQ8
	5qbLMXiiXSPQ8s7pvnRZo6jyEiKJxPBu4IBYIJq9cwHoCqmfbWlJdL7dn4EpnQbt1i072MFasNy
	ET
X-Received: by 2002:a05:600d:82d0:b0:4bb:818d:8d8f with SMTP id 5b1f17b1804b1-4bb88818955mr254816335e9.23.1795420739769;
        Sun, 22 Nov 2026 23:58:59 -0800 (PST)
X-Received: by 2002:a05:600d:82d0:b0:4bb:818d:8d8f with SMTP id 5b1f17b1804b1-4bb88818955mr254815915e9.23.1795420739428;
        Sun, 22 Nov 2026 23:58:59 -0800 (PST)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.168.96.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm148906565e9.0.2026.11.22.23.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:58:58 -0800 (PST)
Message-ID: <b8c1ad21d862b1da1cab0f5370f3a2885501e9f6.camel@redhat.com>
Subject: Re: [RFC PATCH v2 4/9] rv: Add a monitor for IRQ-exit scheduling
 ownership
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
Date: Mon, 23 Nov 2026 08:58:56 +0100
In-Reply-To: <20261107171252.25090-5-kmehltretter@gmail.com>
References: <20261107171252.25090-1-kmehltretter@gmail.com>
	 <20261107171252.25090-5-kmehltretter@gmail.com>
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
...
> +static void handle_resched_entry(void *data, struct task_struct *owner)
> +{
> +=09da_handle_start_run_event(owner, resched_entry_irqexit);
> +}
> +
> +static void handle_resched_exit(void *data, struct task_struct *owner)
> +{
> +=09/* Do not hide an invalid return behind enable-mid-invocation sync.
> */
> +=09if (owner !=3D rv_get_current() || hardirq_count() || !irqs_disabled(=
))
> +=09=09da_handle_start_run_event(owner, resched_exit_irqexit);
> +=09else
> +=09=09da_handle_start_event(owner, resched_exit_irqexit);

What's the added value of this logic? As far as I see from the model,
resched_entry is only available from the initial state and reschd_exit
is always going to the initial state.

You don't need to set both up, since both are equally likely, you're
eventually getting to start the monitor anyway.
But in case you really want a start from both, I'd say you can do:
* resched_entry -> handle_start_run (we are in init and handle)
* resched_exit -> handle_start (we are now in init, handle next event)

No need for any further condition.
Or am I missing something?

> +}
> +
> +static void probe_resched_entry(void *data, struct task_struct *owner,
> +=09=09=09=09unsigned long pc, bool irq_off)

Do you really need this level of indirection?
Just give all arguments to handle_* and drop the probe_*

> +{
> +=09handle_resched_entry(data, owner);
> +}
> +
> +static void probe_resched_exit(void *data, struct task_struct *owner,
> +=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long pc, bool irq=
_off)
> +{
> +=09handle_resched_exit(data, owner);
> +}

Thanks,
Gabriele

