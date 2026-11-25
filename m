Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629143;
	b=hglcHZd3dr1PBba3uXNXApfErcZ5nhbmNL6RWJXnGT/Mkk9Db7UxTuug0wCJVdpGB8iB
	 WA1LPxZYCT1lb7P6JlUVRVfsagyHmxEXlZbpqFY25jvaIaJXJWUn69YxecJ1SOrI06C6I
	 itZC8F0OrvG5uVh6hQ8tQG5Eqkh8xdbLOJ7+k0XbBc9vg3zgshcZgFiEcCyEKua48Cu3o
	 Ijl1IU+3WwXZL3L1q/CUz8KzM7GY2/QAYiZme+8sjHYRzC4OxG/qn/jOtXQFfV8GLkrL/
	 wOQ4fT2Fbx8uVkU9lt7wYQS+A7MZpwWi+B5nOhE03fXIg65uNy/pZ++vpPfl+qF72JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:Received:From:In-Reply-To:
	 References:MIME-Version:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=0+MG6+0gHbyYQq/Q0s/NefIO/PQ2Tu2wSVhno+8Yx2A=;
	b=EiT8ZofnNb4ldlRd8e7PAfodsDNzFyj9jPmO8wiQ6XobwgfTc70ag0azAbJa7yHmcQMo
	 8FygB11+Dr2okyAf3KDB7JXXdJu1VKleSxeO4vFeqUpBctLqVwuRU0rXHMCnSHVQznQ02
	 kBsU1jYTVQbXTpEYMEupU9IWBHGxtP86RIQS/S9ouXgSb3jdVf+uz39YK9Yn+apNW91DQ
	 xgQzn66goPx2RmRJeTYluiYzOxYXNxZZVvCgFDisJf3yoWQuUSb231HXtz2RypU3Wp9Eu
	 1czTsQQmMFp55Kbyzg+6nDvF6CbYEp5Jx0awIXTY7dyy6aASHmW/OT9M2Y8NZYIYKGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=OAzvLrB0;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885C1606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:52:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 885C1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=OAzvLrB0
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6bab10844b5so6388100a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1795629139; x=1796233939; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0+MG6+0gHbyYQq/Q0s/NefIO/PQ2Tu2wSVhno+8Yx2A=;
        b=OAzvLrB0OWE1iPxpRBcIihGMtwga8R+qGTKBq1iA2RWqJ8zKuwxIhpIYKjdy6ZPtSP
         68iY63H9S81lQlwiKLsoa1c/h44fPrn+5sXkegNZPNMRiX+023Kr9qpT/Xp4eXh/BMaZ
         4NZzPjJ1WvWH6xJWQPIjWj3p625norH8g4e8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629139; x=1796233939;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0+MG6+0gHbyYQq/Q0s/NefIO/PQ2Tu2wSVhno+8Yx2A=;
        b=LvVvO84JL4OETAUweLslJE5pJaeqoM1JiORS5M2HJRAuAkMmT3L23+zhRY4jcJvbWC
         9U9cmZYHJXvDLvYTnqBj8G8VXMj+Zh+e0l5owftssLX9FTZwLTcajR3TpD7qBnR5mLNv
         9m1lH7OLU8evbdHCRYhEdVDtCw/3s0AdFGta6dCMJi82voBk6Hwc5agNOhAiJwj7bOAS
         mUYFUIIVhbhe6jnj7nxIFqbAAvuIQxGtLMBfTT0dG3SFsUcC6O9rUP5yF6hUe4i6a8MA
         CQ23u+l6Zoc+5rur1Leao+deH1PCBpThJ7P6b8oXiGy92q4YOB9eo7IlX+Y7jq7+W/X1
         99gw==
X-Forwarded-Encrypted: i=1; AL+hErHiwMAYsg+/fHxI5cejUqXZ7P3yViprRUwQTfjnI0nyp4FIAfraMwhwS5N5/7f3RHewifJphBIfna9vusQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/d6+/8f+yjNh6oVUcH674FTL9TuQTDUpuMMFGN5Vnj5PbwEjX0
	CJXEpcSiKxnolsFe2/8BYcnYPk0vtz7+BtrU69/JIpePgp75jXACLY61KmcbSi91knhAvm181Nu
	nMhakGwMJRA==
X-Gm-Gg: AZFdTZdrtZYWOYcJ2sQC0NH9st4tTPot2qUaUDBNLh1d+f6oR95aADQwxOZgE4BqpRj
	76+OaL/3CVHexekZYcpH/NR2550QvGSJaN6+LYOHuGHv+iThRJ0p4Ia6L3D30Zkjr/Xh6Dzf+pe
	QSKKM7XkXP+bMcTmUQ7Prt9KHuCiCo6emsvvtK8rfeT0qMsBB6hjAW8OOnJM1Ca0ofDIK+BvTEO
	fTKOzuauL4hsnDpFjWjhmBrsvnF8CDMTrdALhoHA4bq/EM3dMr6JOuGgDSx1UAKRQ96HSMEUIVH
	ybRpJsaaA68ayEyJArRMnwDGVycoK1twnATDUotutR8EKLwjIB2mZdimtORqnU8Patg4CuzjfkQ
	FRP6qO0lezx3I3r7p6L5QFo/eKqG6ZzjeLpa8ZWm3pgKmotiCdahumq9yw6QGp3Yt7LVc/wH3I2
	nylcW1QiQbWFyEJBdkSsKh265iL9c3o5oXyLagH4YS5/nXqmF4xffcH9pNE/W0m944sGQHrLv/8
	ThByCaZzqo/TV/zmd47fzoa0iytcnkWlF9cQE0cocC+XHEqFy9FHOGEm1CA3cs6RwzJww86p1sQ
	7ntgxCwApbcK32hfmqYfP9AdsinHs5jad8Hl1zNKOsAwgXCRRsNDfYocKs8AAdK1a3Sn5G8macS
	moBk=
X-Received: by 2002:a05:6402:14d3:b0:6b3:e4e8:74ba with SMTP id 4fb4d7f45d1cf-6ba1fb13893mr11236850a12.13.1795629138805;
        Wed, 25 Nov 2026 09:52:18 -0800 (PST)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb1ca4ff7bsm1753230a12.8.2026.11.25.09.52.17
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 09:52:17 -0800 (PST)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b86fcbd647so9503199a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:52:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFQMarqQMyT+ZnDdH0dJDJnP0UMAedOyJhDf0KRoWowwcymEd4LGpFOP0o5Vx5j6jSnsoku3C40+fhOcGU=@vger.kernel.org
X-Received: by 2002:aa7:c0d8:0:b0:6b5:6b89:e3b0 with SMTP id
 4fb4d7f45d1cf-6ba1fc3dcfamr11863663a12.19.1795629137592; Wed, 25 Nov 2026
 09:52:17 -0800 (PST)
Received: from 425495914135 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Nov 2026 09:52:16 -0800
From: Linus Torvalds <torvalds@linux-foundation.org>
In-Reply-To: <CAHk-=wiTUE9vfMvHeGz+dgex_+sMicSHnf6Nt2_w1-SkOmu8ng@mail.gmail.com>
References: <20261122-b4-sched-wait-intr-head-v2-0-4a764b64e8ce@columbia.edu>
 <20261122-b4-sched-wait-intr-head-v2-1-4a764b64e8ce@columbia.edu>
 <CAHk-=wj_eqNh+gNhCQh3exrL5Pmo5hbZBcL0W-4Ah_Nw0Kegzw@mail.gmail.com>
 <awWSwmvaTwBxfU-r@redhat.com> <CAHk-=wj3GCXZohdFWWPAOkC_LHno4X0oQW+0sQFJzRMvjpODUg@mail.gmail.com>
 <CAHk-=wgYc9vFEmyV0Ch_e49j6GOhUCMQMnMV4f1FLLvumZOmRw@mail.gmail.com>
 <CAHk-=wgFnKO_O0fR_-O+i5yUGaDcz8_HwpM5QiLM4jPFYZb41Q@mail.gmail.com>
 <awbMwBDP9TsJBmzV@redhat.com> <CAHk-=wiTUE9vfMvHeGz+dgex_+sMicSHnf6Nt2_w1-SkOmu8ng@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 25 Nov 2026 09:52:16 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiRbii1c78G2gwpKspaH1hj_VwLrur7NEBKn0GNduBvJA@mail.gmail.com>
X-Gm-Features: Aa3M54pD_6kkJ5tspvLPVjU5eOwlU_YotXkRlOxaA6oY6c-rpN2ggFe7Zir-l2E
Message-ID: <CAHk-=wiRbii1c78G2gwpKspaH1hj_VwLrur7NEBKn0GNduBvJA@mail.gmail.com>
Subject: Re: [PATCH 3/7] eventpoll: don't claim real exclusivity for EPOLLEXCLUSIVE
To: Oleg Nesterov <oleg@redhat.com>
Cc: mt4022@columbia.edu, Jens Axboe <axboe@kernel.dk>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Christian Brauner <brauner@kernel.org>, Michal Nazarewicz <mina86@mina86.com>, Wen Yang <wen.yang@linux.dev>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tz2294@columbia.edu, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Nov 2026 at 08:39, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, 25 Nov 2026 at 03:55, Oleg Nesterov <oleg@redhat.com> wrote:
> >
> > FYI, none of these patches can be applied, both patch and git-am complain
> > "patch: **** malformed patch at line 34: *file, wait_queue_head_t *whead,"
>
> Grr. I was so proud of having finally figured out how to make gmail
> send uncorrupted patches so that I could do it in my normal workflow.

Ok, my thing no longer mangled whitespace, but it looks like
"Encoding: 8bit" will still then cause line-wrapping even when sent as
a raw message.

Fair enough, I think it's actually smtp rules that technically limit
things to 80 character lines even though no modern mail transfer
likely cares.

So I just have to make my little thing send as quoted-printable. So
hopefully *this* actually comes through properly.

          Linus

---
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 23 Nov 2026 16:47:42 -0800
Subject: [PATCH 3/7] eventpoll: don't claim real exclusivity for
 EPOLLEXCLUSIVE

An EPOLLEXCLUSIVE entry that wakes an epoll_wait()er returns 1, and
because it was queued as an exclusive waiter that stops the wakeup walk.

But nothing makes the epoll user consume the event: it may be killed,
time out, pick another ready fd, or just not read.  Anything queued
behind the entry - a blocked pipe reader, an accept()er, a recv()er -
then sleeps with the event pending.

Queue it with WQ_FLAG_POLL_EXCLUSIVE instead: still only one epoll
instance is woken per wakeup, but real waiters are not skipped.

Reported-by: Mani Tofigh <mt4022@columbia.edu>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
---
 fs/eventpoll.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/eventpoll.c b/fs/eventpoll.c
index b959af04772c..58c0cb845dc7 100644
--- a/fs/eventpoll.c
+++ b/fs/eventpoll.c
@@ -1626,9 +1626,8 @@ static void ep_ptable_queue_proc(struct file
*file, wait_queue_head_t *whead,
 	pwq->whead = whead;
 	pwq->base = epi;
 	if (epi->event.events & EPOLLEXCLUSIVE)
-		add_wait_queue_exclusive(whead, &pwq->wait);
-	else
-		add_wait_queue(whead, &pwq->wait);
+		pwq->wait.flags |= WQ_FLAG_POLL_EXCLUSIVE;
+	add_wait_queue(whead, &pwq->wait);
 	pwq->next = epi->pwqlist;
 	epi->pwqlist = pwq;
 }
-- 
2.56.0.313.g975a75ca90
