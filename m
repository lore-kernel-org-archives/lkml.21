Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795656686;
	b=a2JsDo6s0Dggbuka1fOUu5VNs6ZRlybDYoPEpR/StbkBAFvawd8J59YaFH/PnRKCTI1T
	 KGObEVGO77IHcyMmqEEkEtLLc2fPqtwv1aB8LazLxtv2/nkvjHr90E2wzL0rsLy54FKt8
	 aWbq8Sff5ryebvn1rVZ5TtEEmSooJS06LRQosD1qJcdtgM+pnv7CCHJul2XqzOLkqI/yG
	 v3tYXjDqFPCcUIVn4z+Sk4bTmxNiwWINI0QpHgg8AOuI0twL8elTU2KsLM0ZIlZXSPlvB
	 guvD5z1qFVgQWZyGkSnIFb2rGRqIwiMLUDcu3VxGvMMFIxItH9dGzfXh8pry7vDnnAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795656686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=UaNUkzASRrIHeMgTruEbm0VlyJP4nx7GPr1LyEdDdiQ=;
	b=ikrGIpTp30pSxfdbNOzPxwZyi9PgZ/sHBjl8z3jO8ZzAzzFGHncYdYqPcJ1dt6sAa9K9
	 VTkjEf7ka0NmFdivjdN7D2GtQgrTQgX4KIL6aQ4soJvnvkWq+yQtftvvTqDTH56mZnHjp
	 yN3apeFJpO9CfLhSzK7ZZ/GO4lXD7socCT6jkUxgupTT02uUfMtAFh1r6+tpS8PKDCnYs
	 KLN8GgqhDOhuqtelOu1gdYLnYiD8X0CTo+H/66D17KaqBujaK4eZBRt9s+c2ckpX+8mHC
	 utD7ipU5hKML8JeaZGfmcbw0cNmY6ZVKkVAGrSLuvd/JCv65gq4O95eizwX9C9Hlcng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nXyOEvcq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90ACC606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90ACC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nXyOEvcq
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4aa5833c263so6173716f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:31:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795656684; cv=none;
        d=google.com; s=arc-20260327;
        b=j+4t925uUov9Hr7v+yJyR8I+ffsTSbBO/7T6Vzps4XnT2IppkzKaRbAftkAoNF3fkr
         DaSFRGTco9Va0vcuL5PWLtNaRPjSb08eNHoZNGgipA0eAIhyExe/6xvlh3IOo77Eeamk
         kw/cp1NC5w/zYVw8AHKNqPdfdVc1phx/qnjwIK60jTjpxLABZ+mrDKKr7dVIhdpHlL+C
         18EKWrV2n3wLQaHqJZprOCelwU3y3S3P4W6prM5TDJ4sa25lyTtjg1YHIxF8hMrtqeij
         E4SRykMYmJOm8QfsSQXrIBsmxRimppgwzHfa1ZCNkytqBv4qT7Eg5MBTnEZW3ul0G2lV
         vtDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UaNUkzASRrIHeMgTruEbm0VlyJP4nx7GPr1LyEdDdiQ=;
        fh=K/P0qLuW1JFT7N8emgsKtBfUsp9Z1Kv1cf80TS2wa8Q=;
        b=ee7Etx3fglUg5tH9BHEZtQuzePucnrNHRIai5z6Jcwp8lhU6onNk9hC2jvIkngOQK0
         Vb2+mYh2etj+Ts269vE/72jNM/swlFvmXlvBKGjvo9F37D233P2aEuiKgdo9jpzgjGsc
         N43aYq7E/2B6WvEHBhNbYYFeEq6kkdWj91mQ5ME08JAbIWD1o08ayFpOgcbrV9HR4QxZ
         jP4l5UHpcptfZh7HJO/3GN51PTLM9E9q2fSBymBXMscMB6M3feyzi4oSD6a3oaVW7yiE
         L40YkF+AmxnwpQRV928b+emPlqFLacDfuLcOGV+/or6zUUso3ONg947GLQRHHmX+Nvp8
         e6jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795656684; x=1796261484; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UaNUkzASRrIHeMgTruEbm0VlyJP4nx7GPr1LyEdDdiQ=;
        b=nXyOEvcqVD5LAHQFYZ5C9of4dYqmsnpDpUYCihyaw1k+mSaLMQkpv3LJ0wCZ4m+oCp
         ZjoB9l7l7o1zB6DVer2/gwl01WfV27jp9Erzvy/X76Ko0f3W/AGRwyWuCGIaFwtu7GCW
         BAVM7NfW6HhBN5lkHhSkcC/zU04bzmVUtCowUiuAYlzSDkZlxJ6YqNM6pQTuuxRtu51i
         reFqNKe8W/JEhqZ6E0In02IIHwWladmyIMj9XrDfOhv+c3zXzjqO51BNmu9LGVWTit1C
         ITo3742aCjqP0xX7ombRUwViCZ9vwgLEQxHCpXjPNyiSSUoLBaoPtwB2bULCQbV7zzTi
         1I9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795656684; x=1796261484;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UaNUkzASRrIHeMgTruEbm0VlyJP4nx7GPr1LyEdDdiQ=;
        b=v0cLqE04+RI0vWrGjSLJj8JrzDLixqd/tX6c/94VSsnwy0ntbN/ub5YAt/T8r5uKwr
         6tg5D0BVSjrwQZkZJmG6g/C+byZOwPcGbaNNS0RiT4P02QLMPW1XdCrl1Zg6gdj3mOeB
         ddB445D5Fn2UcpH9LxveFzUgZSAwi09+fRZI9/HZGnX56tov/QqAiFYb00dmdnA0iml9
         2MUS+Q1JQNKtQcW7Xl2nUiwnwRojLfki2sgoDOwWi8Ykv27e2gebdAltDzqBog0z/EIT
         iGPnxa9pfo6LPfh/8EKTV+Yyad7+6uO2oT6+PQF2OY4RzJLLLDcK4hOqjSsRTuriH3eR
         Tntw==
X-Gm-Message-State: APuU4Z/E3AURvylIWoaki/EZMCNx+CPwTaxl3tYk9gpoTp1JFE5BVhor
	OfjyXCnDxlpIIzP98wEDGyFFvILQ36g/pAi4AXeV5oiU5jYzXBxNcEDfVu7STaF4hV8ep2aLtaa
	uYHJ57x6sgHbut5/QvG22tFU0ZJToQ/GPTcbbkXU=
X-Gm-Gg: AZFdTZet/PXZqThf1300lXNMPh11D5ajt2hPqvcUepAkZ2y9Ghp176Yk6NvySWo4Usw
	c6W7NaExnG4uBhp7zCqYttevkotpYBlAf36FQEY564COVJgTbhM4RRT/c/Ryvmq9uMkcFxVyhsg
	aFmGy1DGbb2T4UvWgaYkuhG6MpiyU8m5O8DOzMOh+4p9QS987kH/pq1v0wDG1xjUCtVcHsPtgrK
	1dx1Z3my9KzXGuigJBkuMgY8QXPhWyHpgGOidZX91vKbVjXNopXpZGLWBkeGXQVIOYBMPv3ljXc
	bpv3AR1FafHgT6h1n1KB+FNEh8K+cKKYvV74k/oelVt5jh+AesDoDizYoZ76FloJI5wRPND2AR0
	ZAFutXv4QnqZUDLd3y30CwBUgbcuXE0NHhoEr59uxuIdPUhlKfturjjyy2XyStcW/veml/bOSdP
	K+a679mERiumc735cE+sCK/tbAMNBbT644x7B0B3OF27orVVvJAKPGuXqGXg04ofLYMlmxhjZKs
	9T50eNuz2Nlpc3/QfSoUvRsG29Fd87gYeBo5y4AwrKLkArFYnsJ0iAHY1MSzPLuFNiSykcfqns=
X-Received: by 2002:adf:e889:0:b0:491:da8f:7276 with SMTP id
 ffacd0b85a97d-4abb2dda221mr29320409f8f.26.1795656683142; Wed, 25 Nov 2026
 17:31:23 -0800 (PST)
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
 <327337ed-6a9b-4ec5-ad5e-bacaaccb1553@amd.com>
In-Reply-To: <327337ed-6a9b-4ec5-ad5e-bacaaccb1553@amd.com>
From: John Stultz <jstultz@google.com>
Date: Wed, 25 Nov 2026 17:31:10 -0800
X-Gm-Features: Aa3M54otjatl9JMVa-r9EDoyURBSzfTKRCwPGM45EN2IlsOErvkPOaNX2_mUVGs
Message-ID: <CANDhNCqFJac-9U7F9-4bPpJpQB6Z62OX4gBtdW8DT0qirxLH1g@mail.gmail.com>
Subject: Re: [PATCH v33 1/7] sched/psi: Preserve sleep-persistent PSI flags on
 off-CPU sleeping dequeues
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: LKML <linux-kernel@vger.kernel.org>, David Stevens <stevensd@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
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

On Sun, Oct 25, 2026 at 9:32=E2=80=AFPM K Prateek Nayak <kprateek.nayak@amd=
.com> wrote:
> On 10/24/2026 3:34 AM, John Stultz wrote:
> > diff --git a/kernel/sched/stats.h b/kernel/sched/stats.h
> > index ebe0a7765f98e..20820fe1021a1 100644
> > --- a/kernel/sched/stats.h
> > +++ b/kernel/sched/stats.h
> > @@ -175,12 +175,28 @@ static inline void psi_dequeue(struct task_struct=
 *p, int flags)
> >        * Do nothing here.
> >        *
> >        * In the SCHED_PROXY_EXECUTION case we may do sleeping
> > -      * dequeues that are not followed by a task switch, so check
> > -      * TSK_ONCPU is set to ensure the task switch is imminent.
> > -      * Otherwise clear the flags as usual.
> > +      * dequeues that are not followed by a task switch. If TSK_ONCPU
> > +      * is not set (meaning we already switched away while the task
> > +      * stayed on the rq as a blocked donor), handle the sleeping
> > +      * state transition here so sleep-persistent states (TSK_MEMSTALL=
,
> > +      * TSK_IOWAIT) are preserved.
> >        */
> > -     if ((flags & DEQUEUE_SLEEP) && (p->psi_flags & TSK_ONCPU))
> > +     if (flags & DEQUEUE_SLEEP) {
> > +             int clear =3D TSK_RUNNING, set =3D 0;
>
> nit. You can declare these on top with clear set to p->psi_flags
> and override them accordingly here ...
>
> > +
> > +             if (p->psi_flags & TSK_ONCPU)
> > +                     return;
> > +             if (p->se.sched_delayed)
> > +                     return;
> > +
> > +             if (p->in_memstall)
> > +                     clear |=3D TSK_MEMSTALL_RUNNING;
> > +             if (p->in_iowait)
> > +                     set |=3D TSK_IOWAIT;
> > +
> > +             psi_task_change(p, clear, set);
>
> That way, we can have a single psi_task_change(p, clear, set)
> at the end instead of calling it here and doing an early
> return.

Ack. I'll rework it as you suggest! Thanks so much for the review!
-john
