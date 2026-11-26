Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795656740;
	b=VZqnm4H9xlD4URrr1Pg2wZHo+my9QOe6QhMoH/YS/jJ33KlpHY7NOhfZ6M4JZeCvE95H
	 lmqOXPQ0I6/wvIxXZnw8tdQyFDlmfL3qMFGUuuKvyDkGXlMJEkihjF8DcyX8fVRXNxjum
	 MY4tE4+IeheofyQFFzTE1CPvFK6cYwQctDTLZY3BOt/94jy67fxXzZpHl7aeXSApjqrte
	 LPU3tvu/R4l2RGDemNuLDBUwQhhd/9tG9fc3sya9rpCYDao87H8YVgbSxib9/UzrBYCFH
	 T88Iipko0Sk0wHHPXhNkUW+Q20tb6OS3RgvQy3uvFNQ4ttJAEGvXSPR5shhTmW5LTlQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795656740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5teNO/JxhkwB2jgsp8iXjdVcePZzcXg4cZvEeoAYOys=;
	b=itJ26D6heBzFBEB6nmMnFxzin9LLkt7sipGKOiY+QFev5vnE6pvpffMG62Y3IPBOPcwt
	 lOve34aejDwU8ao3haD1Uub2cvcMBAHNHOT0tHLJN4M1f4m2zpUkfLn4BO0LSJsBWG0ti
	 3sCgZ3y2rjA5CFDeWXLmiOTKLq7yag369nUZRSfTUsEqjVJ6jpyAASkGIoeGF/rYzrrbV
	 wiQzWOU8vQMAgARFNR+qhsljRii3n7j0bPW8Z4KqA5dQSMuIz43Rupbtym6t+1iUl5nhm
	 Kw+fAoKx8MCK8oJ5gk7Yw1epsIVutf4UAidMSXDGwGNDkAL/ye7s3xNiMvpiEfj1Zug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G69pUh0b;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F366B606A337
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F366B606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G69pUh0b
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so5263222f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:32:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795656738; cv=none;
        d=google.com; s=arc-20260327;
        b=QgjpmTmstjp4QVKteYVXiAbppsnB8kVCUU6L+5OGoPi9h+vT6jYjwm96S7+HrZEFM5
         vy4HKLrfJ83250EUsFHt+ajBfWK74/s6ci+xPhww16ChWOi4YYQZPq1PWftKR4z2a6qM
         RAFb9wsBMqAjcj8oOxmS84G0IpeMLHMl/xiSxhVbQs0cC/1GkIsnnYEtLvorOUihwsCe
         XJkXFzqEeZnSZPQUBCnmG27zy+1EuiO9rHOvZHrBqbiUsAnesC6BdaeiWn2SElwgdZYs
         L/YVt4k690hwRK4ZyCwz0MY6rkKvKuhQF0NJ9EVIoqPUoUHlyf8LxdCvr2KKfqUidN/J
         qekA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5teNO/JxhkwB2jgsp8iXjdVcePZzcXg4cZvEeoAYOys=;
        fh=rYHtGuh/yrho/Ya1nY/UYwTVE8YnAdNRM4NaX9C6lJE=;
        b=Jt0IxmYMVcUN4amOTOKDz9EYP9O3vAdgFQK7BNFoJLP3/KbAXBkTXbjTuZ13i12CKd
         Xt0z6cxeIqN+fVjhehDJOx5f+SOqwwJO8W4CvDfpK7kGVah+mQ3BoDUHkdnqBw1SjAcz
         p56ltOoPUKFRuHyechXckzcL1lmqLF9pITqD7DA6ar1WFPn59SObgDW9DI4quofrpjBg
         hA1gduknu3dudrmR5/OmQHAg38YlTre4DKTyrkCYF9y6mRhXJvDBJqTGv/TwLKB4RDSx
         kE4FktAWL67x4mrIGeLMlu7iq7zKZivDLj6x4Q2QFHLBtNiS3dqpfNL7A9UpUlenOFty
         PKbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795656738; x=1796261538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5teNO/JxhkwB2jgsp8iXjdVcePZzcXg4cZvEeoAYOys=;
        b=G69pUh0bIuMO5aiiQ2cErt6a8mQ9ogXBZQCUU0YPh2cUtHR4dr+eCfeZTqCSrtPfpr
         ElJuQnVK+miJu3zQW1iWegWXQH0L7/yM51HcdFP1yQi5pTLVHaJPXvXVaTdnOoHvujPb
         picYP8JFQObu7yJT8v+OFsrAkJo+tmVcVaccWFcfmEbKK0YWsMeifN8txbGiK6PFqSX8
         PzXYl9wp9Q7DvWIaBNqzMZNo9fsPNpIdct0GDPhphGfYthYvoCuAMxsQwEK5KxtoUyJh
         Xyk4MVwbvecngLVaLW8K3ZAVt9cIohphjoJpBqi6tgmlAoVvKERvaNeoDF3WmqZ7cH4L
         aqtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795656738; x=1796261538;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5teNO/JxhkwB2jgsp8iXjdVcePZzcXg4cZvEeoAYOys=;
        b=pIYyvcdDBs5umw4x5P00sQG+7HMD1NuKZ0RMun9ycCQd29vuM1EJ4xwameJZ34yAaB
         RPLAUwRC346LOiCermBUdnwzvsdxZQ87DVDKLuopNwWxw83H8FOpf5sFF3F34B9JHyEP
         zAgE54OPVc/vQtGhVOxnt6PGTUvLtxhXUHWmS1CTlRwjAj/4WU7MjYEkN2Qxcd0sM1LG
         rH+Ihy8OxI/IBvp8UsqeGTGCWqEEe6nvpDMW33ixSRpkUHhGa7uKC4WRcNJCwWi6869V
         /cduv4bvp0aYLTGDWI6BS9am5ffhkzOxaYrpcE1g9tpue6lrVEUvTV1w82mVO3A25dew
         D8og==
X-Forwarded-Encrypted: i=1; AL+hErHPVFn6/imrj2WJT1Vq5W88h0v/NjRtuuTIOerUy4B4/1zyEdbfWOiAu2oY2zgHxmiJjcO9UHRJtf+OEW8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9p90UME4Oag4UGHdWHqDuJ3jx+cwicYkbW8y1BtuOa2AoaZy8w
	qp0EP5KVcyP/hPHX7yyoYH2F6Kww4AR+7VOJ8gh31HUjYwXYzgfcGtES83xxZ/mYX0PAWiuZlUZ
	xUKz4h5HoJJa/b4iG6iIqxsAVidKjduCObgecJtc=
X-Gm-Gg: AZFdTZfy2FzvIGN39sfPvqbW5x9xs57XNm8It6wMOuYPjcZCcM0FX6Pjm3lBTYxNmo6
	JdCOsF+Obca8DzJYVwkD/GpqIC3FSzMjoNd+Kn0thYamUVF+lZHpnMOjItnMIKT2q3TKLc/7KTE
	12rJXOXtwbh7L6KMA3QfqUJOmZT4x25eVN188FyTLly/H+FEM/JDG2KtoGl6dqYr9siVIn2gkBm
	cpspXN0vpW9og6ivA3ehXKsL+f2xB1la1WbQJKTiawelt8fYU3feyNLqkr7ytc2eSQcojjxDpwM
	ntbjOPZdtyynEp/0cKNQcfValeAaCmqDOOHQve5gb+7y8ofbbYk+LkkN08FbCdJHKys0RdVz483
	v1gBltvr7AaBmdMs5lqIQy5OoP2BbPpuy7FIZJfiXPQDB6WkWASpE4+wjCjbRctg5RJr8+uOao8
	trd9wJk+DrBf7RNjiaQ0xWyNunLSAyLuxfjGpgPiellLkpMQ8vpYzInweMqy9Bvz5Rz9D0TIpPt
	Lmy0NovBU52arziRlFOj0lw1TT0bfjVxOEK7dIibA8JIWVutwTHCg==
X-Received: by 2002:a05:600c:37c9:b0:4a4:4d57:8487 with SMTP id
 5b1f17b1804b1-4bb887fe7f7mr340566925e9.5.1795656737646; Wed, 25 Nov 2026
 17:32:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023220431.1106611-1-jstultz@google.com> <20261023220431.1106611-2-jstultz@google.com>
 <20261024114422.GA6775@noisy.programming.kicks-ass.net> <58521a9f-2f05-4176-8b14-96c7b5f0e212@amd.com>
In-Reply-To: <58521a9f-2f05-4176-8b14-96c7b5f0e212@amd.com>
From: John Stultz <jstultz@google.com>
Date: Wed, 25 Nov 2026 17:32:04 -0800
X-Gm-Features: Aa3M54pITc9m_l4GP7pYefq-G1vawrBordw8bvc2EtxKjZzePz-SWvlKRRqUQng
Message-ID: <CANDhNCrxuWTohB_Vs+cmKyhNVbfiRMRhmdgLZ+2OoRHWh3cYPQ@mail.gmail.com>
Subject: Re: [PATCH v33 1/7] sched/psi: Preserve sleep-persistent PSI flags on
 off-CPU sleeping dequeues
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Peter Zijlstra <peterz@infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	David Stevens <stevensd@google.com>, Ingo Molnar <mingo@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Valentin Schneider <vschneid@redhat.com>, 
	Suleiman Souhlal <suleiman@google.com>, Andrea Righi <arighi@nvidia.com>, Metin Kaya <Metin.Kaya@arm.com>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Zimuzo Ezeozue <zezeozue@google.com>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Qais Yousef <qyousef@layalina.io>, 
	Xuewen Yan <xuewen.yan94@gmail.com>, kuyo chang <kuyo.chang@mediatek.com>, 
	hupu <hupu.gm@gmail.com>, Zhan Xusheng <zhanxusheng@xiaomi.com>, 
	"zhidao su (Xiaomi)" <soolaugust@gmail.com>, Hui Su <sh_def@163.com>, 
	"Shubhang Kaushik (Ampere)" <sh@gentwo.org>, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 10:00=E2=80=AFPM K Prateek Nayak <kprateek.nayak@am=
d.com> wrote:
> On 10/24/2026 5:14 PM, Peter Zijlstra wrote:
> > On Fri, Oct 23, 2026 at 10:04:12PM +0000, John Stultz wrote:
> >> diff --git a/kernel/sched/stats.h b/kernel/sched/stats.h
> >> index ebe0a7765f98e..20820fe1021a1 100644
> >> --- a/kernel/sched/stats.h
> >> +++ b/kernel/sched/stats.h
> >> @@ -175,12 +175,28 @@ static inline void psi_dequeue(struct task_struc=
t *p, int flags)
> >>       * Do nothing here.
> >>       *
> >>       * In the SCHED_PROXY_EXECUTION case we may do sleeping
> >> -     * dequeues that are not followed by a task switch, so check
> >> -     * TSK_ONCPU is set to ensure the task switch is imminent.
> >> -     * Otherwise clear the flags as usual.
> >> +     * dequeues that are not followed by a task switch. If TSK_ONCPU
> >> +     * is not set (meaning we already switched away while the task
> >> +     * stayed on the rq as a blocked donor), handle the sleeping
> >> +     * state transition here so sleep-persistent states (TSK_MEMSTALL=
,
> >> +     * TSK_IOWAIT) are preserved.
> >>       */
> >> -    if ((flags & DEQUEUE_SLEEP) && (p->psi_flags & TSK_ONCPU))
> >> +    if (flags & DEQUEUE_SLEEP) {
> >> +            int clear =3D TSK_RUNNING, set =3D 0;
> >> +
> >> +            if (p->psi_flags & TSK_ONCPU)
> >> +                    return;
> >> +            if (p->se.sched_delayed)
> >> +                    return;
> >
> > Must this really be sched_delayed, that is, cannot p->is_blocked be use=
d
> > here? I'm trying to push sched_delayed into fair.c if at all possible.
>
> In this case, blocked donors going to sleep would need
> to set the PSI flags accordingly (do what psi_sched_switch()
> missed).
>
> "p->se.sched_delayed" tasks would have already set those indicators
> but can still arrive here from dequeue_task(SLEEP | DELAYED) of
> sched_change_begin() - in all those cases, the dequeue flags will
> also have DEQUEUE_DELAYED which can be used instead to bail out
> early here.
>
> Would that be okay?

That looks like it is working. I'll include it in my next iteration!
Thanks again for the suggestion!
-john
