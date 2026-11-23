Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795441946;
	b=NkfY4hMHv3lLOns9Ps+ytse6X2CiVDBPv7eaLcStRywU7sbI6jbyPJlgwryC+hEdnmu5
	 TUU9rNeEqJomjdrtrF3lAFfPNXCdm1QmwmTvdEcy5nftu6bFsPj7tSJnvApyJtsb/wTA+
	 rZvomZGgOZQtAox6Q/rgOqxPyR0AuDEMfxShhbI4VIcvfK+BQAufQG4RMNf4V+KmJJQe1
	 eOoYNvKxazgbPs3uFhhzm3AVN3UASW1YYyFf6RFl6pwhszNB9GOA/l6pIxdZdZhs9rzpG
	 nnR4jZr4sxHglsOMbsmAQ1rN/RhWm/8WdR16eTZJNefsweLHkGOziEO+Eu5P+jbReMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441946;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MqsUgfbjTGosV8KLgH94swNqVxVFyiMW2uJSHt6oqyE=;
	b=KlLPQfhOcdbpdjlDxK9u1ho5QQ+cXkaPbmeKPbcEm3zGQhnWT6Xb0Xq2GS9+dEZGpkdb
	 orHJNmWLllcgKgjJDpGIqpVDgNj5JFHobvM4nPUsXzG3BVXlzzlc8S+0X49gocUjrckxA
	 zZYVFJ9iafXpYdr/p85jLdK/s3gXD9MLdpym7IQzHfVquMT4lor3vGnreZEkjn6k5Ujdr
	 r8lwMG/XAR6S2+qoxpD/JCvf9IADB2v3iM+OR33AowShGDvCguHzHum+emHrp8as1EOrz
	 UMydGv4nSLD3nS/GHu88JBakv7laks8j+RXDs8VLfr90KBh1ZQzp+B2imv0eiETKApQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=bJQoqRkg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3F4606A330
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:52:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B3F4606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=bJQoqRkg
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c51373ae637so500207166b.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:52:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795441944; cv=none;
        d=google.com; s=arc-20260327;
        b=Lke8BWAK8gWsXorpilJG9OeNi9v0v70NWHTTGzlZb03ZjQ+rGKzxDSkNbeib3N0Ce+
         d0GeQ8jAPIw8RoRpE5Fkm3AdMNKh+ELW+4g9uf8X3Td6A3CrxhXZMF0qsqdfSpvgrcwd
         r5m8PpVqZ7pKOv6fgY0sDGqHqe622300ga9LeQOnJah+b6NNw2b16no11Wm3OFSm7Kco
         5jUCGpwMkgdGsgq9XGen3kSyaEz9EuRb2aJB1yppbf0Jc2IAoVHKaJFsmYEyR50Gyfyi
         ZhBeFX1Qz4HFPc5OcyoW7VPN22FIeDommknnFW428i2pLNeyWuzc4Tdnky8z4tlIAxcw
         YE/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MqsUgfbjTGosV8KLgH94swNqVxVFyiMW2uJSHt6oqyE=;
        fh=sfqhhBnnusTyjs7kVvj6irr8K/3CoXPEP3H2upU4zHg=;
        b=JiMwmVeYgW272ba9gZmxrmIXumXWkhbwYQBE3TcZ0t4K0wedj9waFtmXQpxIvP5ECs
         HPPcPisTo4RkxU+4hRaXsfXKB9y4fcXZ9NiYre68AKbSDTnhyWL1cGvg+BoWHlDKYbnj
         4uJk3KhnK9sjCDHk5FPexTuA+gpgBdJ61xNgbDYqmINQwtjotgad4YIXYtEiS8lr5tPY
         F2L7SLLyNtKf4hwftq9xOMRIfbVbXMda7+tAnomIKF5V/O3HWj/BbANeVsUdeWMTkQNv
         xuoqlPXxobNFvXDaFuRRmzJCVajcoDGTlFJYMhWj4M0CTU1Fsmm1dQBTuIyB4sl9Mabk
         l/rw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795441944; x=1796046744; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MqsUgfbjTGosV8KLgH94swNqVxVFyiMW2uJSHt6oqyE=;
        b=bJQoqRkgwhu/jAwScL64VuCBogKk0UMsdFHvf86OOQ3eWz1GR7kQkwEFuVqCS44nhk
         x0xkT7Xuae+/dmUbrNkKtcAq6p5iIlIvDzGARl4y94569QqgjThwZU0/HUY8nQKTIvj8
         C7qzsmt/tORM8Nuyx1ZKeqfGVMrwr6St+9EU2A2o+0TeQG/y7J+M6QORoIEaiOSWpb4A
         oGiHYyGQQ7DSLd1YpROkYYK56YpBjfHeFloN/9GCmSg+rRi11gi9U8rBGwLeZM29KwTO
         5KJ0MdjG5PdPTTGEOsMyJFlBWpk6FUCEXX+DpgYXfo9M2Owf38AtuGtCqx+ARsA0JAj1
         COIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441944; x=1796046744;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MqsUgfbjTGosV8KLgH94swNqVxVFyiMW2uJSHt6oqyE=;
        b=HCkTln7XTwMkXyan+t8KJeZbdr8f/bJlGCvrvLDSDNFjgCLAtEaTAo5iq2rh2m6uOv
         WTc/IqDkLTL86PL+6Stuub7PLUBKqS1Nz/L/pgSX1Yc73Q+Jb3tU0QXS9DsQ1bOjJ6Yv
         mndbe8sV8EdaVaCbzSuHZ6fr9Lp/ZC3adtvque6b51ILzbfAQZGPlvC3wkp057CK2oCx
         agy5Yu59rfw/XT9oSQF5yYmQWllmltDDPlhg2oQ1VT9tsZ5V3d8q9qFg3dOy6kbyURQo
         zagISR7WhqPef8BEfHGEufajD4nhGklHh4ji3F5Yh1XBpdyMPx+vw+RgJeaC31UkSbp5
         kwFQ==
X-Forwarded-Encrypted: i=1; AL+hErF0T9Uy9N6zwI4aV2okJBJw/n/u0i9Xa/7LkK+ickjjZktq/xsrsRKVVzyCdpZsPflAOgSPTNPnfXNAO8Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OGjgH0ty4H1czWxAmhZCgYDx3hW4C0xAKrn02+2/BeQ4hBBxv
	6b821P24/TXAvpV3qpi/6Ou0ZVj0VBKv3U6DgWrf+u3bzOKz96ynhHj7lpm0szcMgw94QVb2WAp
	p0n8jov/+UsdC/Ij4UIX+11tQSvIkIY84SGbAE+JmEw==
X-Gm-Gg: AZFdTZcRMgx8HQEDUSIfTMUF5fdOcCmq1SIW2zNTHtmHVah/SlS2AXxMPHQl2rdwh2p
	l5sxT9ObWo90DX32w98SuUOL9lXRCZKllvTJtosBChd9dmBbk1eUukOnIJdav1XQ48tJDPBa/U1
	d4Oxl4OQFBsAZmnAoTojFyDw9zx6gLTQ4vGATZLgFy38OGVCwqsZ5UQV1PV+RRpXGQISpKmne2+
	mek/k7oVSS1lmJIF9vvnYAAu3kWm8M4ZqXpJmX1mqrLrpS8IEYk6Qko5k2gUCCz5K7r5AH2EFWt
	gYFRtOOJm0cv4z57zzcgxTbB8CHycEAEi30C4qRSxK2+Zkn2VRgPN+D0DFgNrfOg4msn0s5GinJ
	YPHfEfnzQaz3ogxmUKWpMSwGzUq+706DdmqJiE8w26sN+A4egDr1JjDwXgfDyXvnBuB+WrQ==
X-Received: by 2002:a17:907:a890:b0:c41:55b4:d88b with SMTP id
 a640c23a62f3a-c513ab14402mr1011361066b.43.1795441943836; Mon, 23 Nov 2026
 05:52:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123001213.7609-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20261123001213.7609-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 23 Nov 2026 17:52:12 +0400
X-Gm-Features: Aa3M54rLC72YmN77oZuExXcNM8GiTeI-y2pQi2iJEUsvIQMhXE4CHrZuqWCFrbU
Message-ID: <CAKTNdwE9aqrpyZYdgATvn7twDe_e46HBD-ws3vq3Lh1zrYG0Xw@mail.gmail.com>
Subject: Re: [PATCH] sched/fair: Fix h_nr_runnable leak in dequeue_hierarchy()
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 4:12=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Commit 486c3d06b902 ("sched/fair: Avoid transient double accounting
> for delayed tasks") changed the h_nr_runnable logic in
> dequeue_hierarchy() from "set to 1 unless delayed" to "set to 0 if
> delayed", but left the initialiser at 0:
>
>         int h_nr_runnable =3D 0;
>         ...
>         if (se->sched_delayed)
>                 h_nr_runnable =3D 0;
>
> h_nr_runnable is therefore always 0, so dequeuing a task that is not
> delayed no longer decrements cfs_rq->h_nr_runnable. The count only
> grows, which inflates se->runnable_weight and skews PELT runnable_avg
> and load balancing.
>
> Initialise h_nr_runnable to 1 so that only delayed tasks, which
> set_delayed() has already accounted for, skip the decrement.
>
> Fixes: 486c3d06b902 ("sched/fair: Avoid transient double accounting for d=
elayed tasks")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks a lot for the fix! The offending commit forced my RK3576 board
to keep its little CPU cluster pinned at the top frequency even when
completely idle, and with your change applied it's now back to normal.

Tested-by: Alexey Charkov <alchark@flipper.net>

Best regards,
Alexey
