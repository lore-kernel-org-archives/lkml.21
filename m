Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795657138;
	b=rWbKqd+nBeRfNfX2OJbjILSbq2ps2UdJSp/jopSNi2mh6FvK5tAhNJvFallG6ZFFwC7g
	 Zh4aeEiVSNqo9uPkvewx9BP8RDQor8NBvOhA+2QOGVvga8wPcZwYihQTr3orhINNpYtPT
	 NPO1QwEqF9TANO6oAmPv7FFzCo2WIKtPqLVlN/h7WmAxY5txvG47cpicNyV0ENQ2k0wh6
	 HZXvPFjl+jhEEMObtd5IyEvhoTbREWaGY3f8+KoNLqygPS4FoEZPbRB9nES2Pn6CiWdgW
	 gckNm6OYgzlQRjJKxGlQkaNven46irlGdercP3WFpylPxfT80Jj3GjslH6mAnuabmZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795657138;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=g3l0Ykb+ZcmjwlRBoiMTATM5wTW1kUFhUyfqUCn8uU8=;
	b=2Q7s+tyLARN0NpvpgoSC71AXfPz9mGWk5Z+zajUXjckWuIKQMFy/mszBMCbdzBd572OX
	 wKqQAX8Oxlw6pW+ZE00gnD2EwVwS9Bcf2DZ8zHJH25jigO69tYbW0AC74dfE3mvracQC8
	 EFsCAEe+ojTpQyh/Mu6dBDFmDgWwnYvqLu6BEnnrHr1yC0zSmsMh/jio5lNy3/DZ/BAxQ
	 Wj+CLKY/a0ZT+6QBL9AzHH8SGYAN/YsGuxHkMKvrrH176rLQN+R7PPNPGseNEnTboHqMa
	 e0bdt+o6t7Yhvwb+dgQcSmik1NEH+HFJpeiJxBYNCCnrOh852PwHvb+64rCK2cvG7fw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nTCniAE8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0173606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:38:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0173606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nTCniAE8
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so5722045f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:38:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795657136; cv=none;
        d=google.com; s=arc-20260327;
        b=q0amtUgGsAJx0WmelF+v4QRPvCHHNe6L7+JEQqTsBhRPB4h/wcQHoS6VsO1SlNbWmu
         t+6xSHP7vBPJ72gIO3xU0AOpfEMsP6UwV8Be2LoTrYtxDoyUSqQ/mJgZK+BxvhBuBkOz
         ce5HMU4k73VCN+wGQEI1sZNn1YBGPLZCv/aoNe1hRAqtByBHR5y2n18RFn/XKWm2Yab/
         nyJqQBYQpmn0q1RvbU6bhxlcKuhOXugDBrzNunXnJrXJSJBYVZD0F+R/PZQiJmUC5qvN
         SEmzmqiXXPXLftUWTXh37Nc9fkS4dpfwRmT2Wyg29SOGqyZZecOhgJ8GJ+1N9a9PQp8t
         d+ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g3l0Ykb+ZcmjwlRBoiMTATM5wTW1kUFhUyfqUCn8uU8=;
        fh=OiMM7NvnorVhbcEqcEDf/D5dIkT5xu4y0/YcQGKY/Mo=;
        b=nAF7jNUdpiFI+Xl7Cz70YTMtH/mgQueDkip7C+JDB2sPARmZq6QxY9l8AtGku0VWZe
         ZgbQhnvD59K1eR/W+TpztC+DgF1Zxh8/LH92zSTW6xSVbTBFtRa40jbhz/hrlU2W/8iy
         4yBa2kNqFL/jtjXAY+8jjJQW2u1VOqmfWpIcyZjBLG3bu+bhAsyA1HhUnTN0Y3eN9ql0
         iG4k7TZVZpAzF8kFdt/9DIO0BNy2HL4UrksmHEQueP+2PsUrz3V9Z3KbaJpbL9sZuQqM
         tSUZuAm8r8M7NIZhM/J9S3LTZeADAVDwpStj+Ok4AV/GORkIL+TNypwVpIr6Z8VyLA2K
         VpYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795657136; x=1796261936; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g3l0Ykb+ZcmjwlRBoiMTATM5wTW1kUFhUyfqUCn8uU8=;
        b=nTCniAE8txr9nhvN+ZvRRhljsLiSYswLXSE0YFSdUiAfCFiSxex+lUe58CAfx+Il0V
         O7mxNd2m9pdLe2F4LuwXfbqCfwdDOGmNTGS+Qo3Cxlv6uZhl0MclKy17BZhPhMw7dKlv
         Rg7CI4E3ycZ+kYxkGL/PumeNbb/EQsM/VlO287RVnC9VrTKZ0PIGH08aK39hPd71k3zG
         1qAtHtAIUJXxUezQg3DECzWFAeiOmiHNhCIReI9sp3a9p7lKmV+3rAaz29MkpWMdAEDL
         1f9T4bqe9R5RwKLvkfVfKMqS6KjdEP+tExowNL4uvbSHoab5le1mtCGhRVC+iADckq+E
         /erA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795657136; x=1796261936;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g3l0Ykb+ZcmjwlRBoiMTATM5wTW1kUFhUyfqUCn8uU8=;
        b=RCOCAHz9UchpWujxz0dqz4a/6NlDZc423HUupNQ7eaxEzOLvoef//W8LPJMTNj6jHi
         dL3897EZk4TVPRl5X+rJ7b2Iq8RBkekrCeU/H4Gmtrmkj43fedaZq6ECw747mU6k/jPa
         LBhrtRyJFxUzo5BR4hRL3/zCQwAFS0VZkRzZgxEVM4rzWE2y6PzmecZkGpCSEv2rdSXW
         vtqknxX1sanAFWdmAipP1KtxfUANfQ48fGWHexCbJWjGmJhY9ASCsrPfhJjwPbBVd6/n
         zGd73IGLethpTjSlRGO/DWWI4GSg9srkrY75vSt6BQRGGFSPUzVOSbX1Lo0901mjOmvE
         TR3g==
X-Forwarded-Encrypted: i=1; AL+hErHpH7Ej4Xm6TsTXYOHcFFkjzFNetmoduaUa5dCmbD/aRHrbfW/4tLfy3XkqwaoJ/VI7A69tvf0JQj9XiB0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hylDGxo1sIoDB4k1TPvOi78O5J18eX5H0wx1M3bf/RsHPg5Q8
	O0LlzdplSZ/LbYfgmqAMfVadtMxOZ+AUm9+qCo8I1CJTJ6IFkXONhxZHBSMx9urFuvbry+x4++J
	zfyzYncfvdcxTI2PL0ntXlmWU9iGmn/IbyWAM9FU=
X-Gm-Gg: AZFdTZe+ohyU63JOMzJYo+TFWPCWpsVfrXwCLxemww9CZA/toW45zfG8PF65LmVUsIo
	IRAJHD/NAsJwEA5gYH8ZGmbmcwB7Gmj+9OSjQuJjkENAOZKsZg6L3TdTO0mXWRind7Z1v4Q/2VQ
	FIL8r6Y5meBW8IgYo5da62MACpSI8sRoS2QUXeSU6I9Xdr8I6fDpaR1IC6IJXEPE02FYoostY4x
	to1OcDZ+xfve4JkiOFxoUoECCaHnHVVOSNp0QLig9m5sp8hsCbSPfnBONRhV5SSDkcGnjEsfT11
	yxjLifsL0FSN6bLUEyO4G6nj92Vc0TTFIGWzMDNQQ6sTMECC/Pb7oQMelcRzxNwGfP4uyBl5TE+
	wF4Nxov0qD1OFKAivqCx7ggvvaVcWhh30bBFxvBWy6hj3h0vBBhHmf1M4sj55VxRDIZItJSVFrV
	Dt0L7I++qGG23gd5FiOvUepuRfG2kMV6pW5acr8A75AUM5zCrQHj478dizNNRj0VHI03ZVyH+QG
	9ZSTUfAxS9fKUWgem63pqndv2EbDHwZxvbEkpl6+Tls0ZpbKNcrKA==
X-Received: by 2002:a05:6000:4381:b0:4a7:e4c7:2795 with SMTP id
 ffacd0b85a97d-4bb965c79f4mr3035906f8f.36.1795657135853; Wed, 25 Nov 2026
 17:38:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023220431.1106611-2-jstultz@google.com> <20261026051605.1997313-1-zhanxusheng1024@gmail.com>
In-Reply-To: <20261026051605.1997313-1-zhanxusheng1024@gmail.com>
From: John Stultz <jstultz@google.com>
Date: Wed, 25 Nov 2026 17:38:43 -0800
X-Gm-Features: Aa3M54pqJSLQBwCC41CTT5ZGMoGgsO7fbMkcL54oDpqbOMCbzUwNPN1kE9Zg9q0
Message-ID: <CANDhNCraG6YsrtJiGhosGKfaSXGYYNddAp90jdSnRKVwZwhdgA@mail.gmail.com>
Subject: Re: [PATCH v33 1/7] sched/psi: Preserve sleep-persistent PSI flags on
 off-CPU sleeping dequeues
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: peterz@infradead.org, hannes@cmpxchg.org, surenb@google.com, 
	mingo@redhat.com, kprateek.nayak@amd.com, arighi@nvidia.com, 
	stevensd@google.com, tglx@linutronix.de, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, vschneid@redhat.com, suleiman@google.com, 
	Metin.Kaya@arm.com, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	zezeozue@google.com, longman@redhat.com, boqun.feng@gmail.com, 
	paulmck@kernel.org, joelagnelf@nvidia.com, qyousef@layalina.io, 
	xuewen.yan94@gmail.com, kuyo.chang@mediatek.com, hupu.gm@gmail.com, 
	soolaugust@gmail.com, sh_def@163.com, sh@gentwo.org, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, zhanxusheng@xiaomi.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 10:16=E2=80=AFPM Zhan Xusheng <zhanxusheng1024@gmai=
l.com> wrote:
> On Fri, Oct 23, 2026 at 10:04:12PM +0000, John Stultz wrote:
> > +             if (p->in_memstall)
> > +                     clear |=3D TSK_MEMSTALL_RUNNING;
> > +             if (p->in_iowait)
> > +                     set |=3D TSK_IOWAIT;
> > +
> > +             psi_task_change(p, clear, set);
>
> In this case psi_task_switch() also clears wake_clock when the task going
> to sleep is the psi_avgs_work() worker, so the worker doesn't re-arm its
> own work.  psi_task_change() always passes wake_clock=3Dtrue, so that che=
ck
> is lost here.
>
> The worker can get here: psi_avgs_work() takes group->avgs_lock, which
> psi_show(), psi_trigger_create() and psi_trigger_destroy() can hold while
> sleeping, so it can block on a sleeping owner and be dequeued through
> this branch.  TSK_ONCPU is already clear by then, since find_proxy_task()
> doesn't park a chain that contains curr.
>
> The cost is an extra aggregation period, not the ping-pong described in
> psi_task_switch(), but it keeps the averaging clock from shutting off
> while idle.  Should this branch do the same PF_WQ_WORKER check?

Hey! Thanks so much for the review and feedback here!

Though, I'm not sure I fully see the issue you're concerned about.
Nor can I see how adding a similari PF_WQ_WORKER check would work
here.

Apologies for being a bit dense here, could you expand a bit on the
specific detail you're thinking about?

thanks
-john
