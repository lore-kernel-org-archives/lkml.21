Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649483;
	b=eXWUSDjTpRX8+OE0gl5ACkYs6+x3kRVaPMBUiNi1gArHhByR394EQuDvlztYq11IJ/jM
	 UyFSY+8LuLl5swForB4/id86FL8lRrYHecygXg7I/8pH1Sb2tT5RcxbVRvFLSHTIMLoKo
	 wg9aSaEF7oWVpv3gvfK2HUrV5hvsYa2mAjtBeCo70JXC4WOnUNT+ajxYwNFFrXZghR0bD
	 MGyxBGSgBtfqpRMJxFyrc1XNepQM6nsqvaPsKQ4GyYXv34zfyNthHBsle+gUXZV8N1YOK
	 dUYAO8Ahie+BCNto7AaltM24O7EkZuWAJZgRoyFywgDPdKNwUtNp62NRUb26ivAc3QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=/ZtgARPu379mLd6QbSu5w/3cZo17qHpWETtyZC6BRtE=;
	b=hLIioxvemnGeSCb14e/5hh1yLG07UieoLUzZtCwRFEgNkdL7iD+LUSjHkfs3Bq4SVZM+
	 rrf7R4qAuZ73ane5jbASzXgAN9TQvnxzMDJdcVAaj5koUJdM1N+1MKXFiZo57kTFkaUeW
	 2tCKfW5kmYvCzBe/Kn0VXG8g2PRc3+KxysGivQfRCz1PxXNOKYrJy782vqI76eJTq2HIW
	 iZwD5PC6jsR6yl+F1uwZXq6wkrqQP74Kl2CBCGQn6bM5lFJWhkdCPEUEx3ddRPl7NjNM1
	 hXC8VQ+LbFXHbINh60hcdr9pWy5lZs9CHFJM+lsqbXCyMlX6n22kCMYM9T4co0H5ENw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Etw1usMc;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B990606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:31:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B990606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Etw1usMc
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c50d3ac6b51so1328131966b.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1795649481; x=1796254281; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ZtgARPu379mLd6QbSu5w/3cZo17qHpWETtyZC6BRtE=;
        b=Etw1usMcblqCO3PinEaDwsNBIFfJ2R3bcanX/VT2bD6spbWXgs4VMDGUWXITmEzF6l
         4cKuhjSQww9QCE9PiuHa0LDpfymmbEJ+aGkTLBUteHROqzGGXddaiwL8Ae04N/ksy9Si
         +Mag1Nerdbq310xTftvr6cmB5ax480VS+WF8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649481; x=1796254281;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/ZtgARPu379mLd6QbSu5w/3cZo17qHpWETtyZC6BRtE=;
        b=Dtz7X6fjFoAylwRJF+EPQWhqKmxuW6029k2dfWH6EUksjg5+j3b/bbCOFlUT8DU/Te
         pmLR0PgIjRmrbhDfhqedyEGf7CdfMzY9hNTier5DQVk4IYOegR3B0Ec/Ba2DeQI6zrOW
         4o74wFuRLfHU6EGAZZE7vANR6uMdHpwh5klGrQlWVxCNKs6BZVhQbH8I5K81OcoKdMjq
         zZewAnPZU6frweDUQaRDx7jBfJD6+TOgydUpwG+pQ79UOyCuf6N+GApwu5LVlkO8BBVd
         whMRtFQIzugGs78c/J+ztHdA1tX85pQuOXFK7Epw1uoFS2qSFbHFmdbrueNq5c78aIZG
         W59w==
X-Forwarded-Encrypted: i=1; AL+hErGNwkeaQdFiTYolPMdWwOIvQ+Vqm7GuQ4Tp8FyiykJuwlIP1LdkSCZ6fK16zYw2SccRi6EaU499Dgn2GeQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tX31LathHT8efTwsxI8jw+gw9FQVwoQmjGTo6LVsWMrfB5UQL
	P0jkBkzcmQrN+vZcmL0+vu1SdgwYRAkH4G83gLQQA2Gg0mN57dbtk4b68HwbpvpCOTQyAlOTwFb
	QBjH3+BE55w==
X-Gm-Gg: AZFdTZcWQt1VX7WeEEz1we2WBOI+HAMOrR2tgmbh1IGttUygHo5EWiAUKBUJCldJL6m
	imXNcrG1mHXUMvWaj/Ert+p/pVXCP2iqX7QCmodnuj+BvjVFBvSyaGGfLDaNoBM+sVSAs0bW0HX
	6jLk0EIN++Ums0CGN2xyxXAZZlji3I6gC3XAQWTe299AezZtrXwv6aKrqOIC4M5+M8RZNVbH93z
	yLXT8SXmy6vUGvsRczkHx0vN4uG/7anQNNNkNCxvwp7+BW5FjsKn9X/6xQU40rXlVoXBu4cR9ed
	EX+/dZGKKaXIkgKGOEK3ZtZizpICJuZcfJJj+1loptOv25hRg50lD60AVXLKvP42xOkOfDphgrj
	Fj2yI4k3CyVHN+Wy1heW9pDkLLSNkPVi662jPAwlTcT/GY4euSRNTdMfBozAttp0PyH1reCJR2Y
	fXYClcU5RsBalCAlew+czDKgOYEAn46X+pCqUnpGZlUNuJMcKIFzt0pa9PFH25mx4GIFsuynoP7
	tYSvGuT8PULVjC2oF/ZGQHqwtvQN5SKE1kqlSJHbh+8quvO1oUk+W7GW1srEI2S/OijjLw7f38+
	QUWFxyWr9+ZgnqsdzGgk4y7p8VAXWRnH4Kt1ZEnC/4R3d1PgxfPybIYF2d4FVbBtGh+sXFHF3SK
	vS8B2SgvaRFNbO/D3rdKb4PG7
X-Received: by 2002:a17:907:968c:b0:c51:205e:6e8e with SMTP id a640c23a62f3a-c51319b6e77mr1721755466b.24.1795649480815;
        Wed, 25 Nov 2026 15:31:20 -0800 (PST)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acff65bsm726507866b.4.2026.11.25.15.31.20
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 15:31:20 -0800 (PST)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6bab10844b5so6873698a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:31:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErESpzbhWZL4sLgX40OTiUoAekGkGLgOqvOdD2KBEAa+WIAsrsVjJDLCoqEJqCgfNB7tB/Y44HKZmWsLa88=@vger.kernel.org
X-Received: by 2002:a17:907:3e86:b0:c36:777f:824c with SMTP id
 a640c23a62f3a-c51315851d7mr1801088966b.4.1795649480354; Wed, 25 Nov 2026
 15:31:20 -0800 (PST)
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
 <CAHk-=wj_eqNh+gNhCQh3exrL5Pmo5hbZBcL0W-4Ah_Nw0Kegzw@mail.gmail.com> <awV66PQWrBOKcZCE@redhat.com>
In-Reply-To: <awV66PQWrBOKcZCE@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 25 Nov 2026 15:31:03 -0800
X-Gmail-Original-Message-ID: <CAHk-=whanFATRSwcW9TCa+4zR=k_QnNFtgxnFCg1d_vr6Ye=OA@mail.gmail.com>
X-Gm-Features: Aa3M54q0sE_qX8UjHHTquK89Ec1CONb0zaQmq3jckN_Jm8WAOhqo827YNI7zBIg
Message-ID: <CAHk-=whanFATRSwcW9TCa+4zR=k_QnNFtgxnFCg1d_vr6Ye=OA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] sched/wait: Queue non-exclusive waiters at the
 head in do_wait_intr*()
To: Oleg Nesterov <oleg@redhat.com>
Cc: mt4022@columbia.edu, Jens Axboe <axboe@kernel.dk>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Christian Brauner <brauner@kernel.org>, Michal Nazarewicz <mina86@mina86.com>, Wen Yang <wen.yang@linux.dev>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tz2294@columbia.edu, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Nov 2026 at 03:54, Oleg Nesterov <oleg@redhat.com> wrote:
>
> This will change the current behaviour if ret < 0. Say wake_page_function() does
>
>         if (flags & WQ_FLAG_EXCLUSIVE) {
>                 if (test_bit(key->bit_nr, &key->folio->flags.f))
>                         return -1;

So I looked into this. We only have a couple of cases where waiters
return -1 to break out of the loop, and none of them have other
waiters.

In fact, I think that's pretty fundamental. The reason you'd return -1
is because you have made any other wakeups pointless.

The wake_page_function() is a good example of that: it returns -1 when
it has taken over the lock. That means that the page simply isn't
unlocked any more, and there is nothing else to wake up, because the
*reason* for the wakeup has fundamentally gone away.

But you're right that it's a differen tkind of case, so there's a
slightly expanded comment about it now in that "always queue new
waiters at the tail" commit.

And:

> Can't we at least cleanup __wake_up_common() ? See the patch below, I already
> sent it but it was ignored.

Yes. I've added that to the branch too. Maybe I should have added it
to the head, but I was lazy.

And I've updated some of the commits with reviewed-by and acked-by.
Maybe I should have added it to the head, but I was lazy.

               Linus
