Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795657202;
	b=k6i4/dAGo/y7q+dOymJINughPD1TjQXnfYAj167Bds1cFHNv6D5zUNTcCWDHFB2gW4PP
	 ZQLXlfNZnd2IGJWV3VJhAmx7gy1iq9ZohEES3NYvcx6O6bVQOu7Pwzqd2d8kSUImeVBEg
	 Oj/RyUiuBMy4jli4BPkCRZo8TngupZuWPac0kHIvoUUFxkatvn1/cEQcC87t2UWnjy983
	 JgWn5uaPpUGQhK6lDLY/t64P7lMK3HqMXRTbHFa/Pq5rnhu2BTvFv3js5yNZYUNrGFmlY
	 T4uofBj1qe6/pRJzYiXV3ojJlgARle8rxX8NhlOfDAzkrR/AkbXvyNfWvslPFY1e9aQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795657202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=AYJ48wT8wbR89LuUPY5DsvGUK5hHS94g7c1QFSfuVP0=;
	b=uLApMMkoUCLbafiLvhWxTxohgEdbiPbGbXQpUYBp8fP+0CXlZFvrGgV5uQT8Z06/p1+6
	 J8s/lFZOWThnhBZyGJb2mZpZHMTnpHDjds+bE/4+ZiKCB/q4Dzd56BA59i4q1nu3k970n
	 yFdWxqTR7Rp1kVB7FJlSn86B3+RYiOJRmE9+r3dxItAi8VDE1JR2snkvVK0AG3VK1LxB3
	 mt2HyTRQOydoJxvEyqSaXeBXCFHtQEeNyWEN1qh41c/pus2vuTj/lqdjBzW4LdOI7acIj
	 GqtPsZpXRR0Go1c+4G+xeGabXwKkSjnvis9zy6kSamtRq9ZQGU68+KD9AYgAXBjF57w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="bvPYF6T/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9220F606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:40:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9220F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bvPYF6T/
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso46020795e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:40:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795657200; cv=none;
        d=google.com; s=arc-20260327;
        b=RV0j0OGjNyYrOp1dj6+d3waSYjwAlNiSGuJpJ1RYjbvDeqnwzhdo/xkJRlbaJ11cKX
         EW0sGIorVwd3RIkg70EuM0RB5EMopudWRqji5JLJcwfMl1KWpFclW9nRkjvdr0DoymmW
         SmUQne6vkFA+zAe/2MMtoGPFnrhLx/wK1ve2fXGevmRGK46GDgIF12heBTXmR7bi2hc1
         U5FlcUDUrRhg7vT8V57MkSnNeb1jALFjwk/cNCkW3gvl0MH68SaT/uKOuJn7cYXKRD5D
         gBWWgvqIgQv0zX8+B+p9Rjxn0oI8yZkOn8ezIX0I84XcdFr0qna1cq8AEdQeD22RYEjk
         g2Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AYJ48wT8wbR89LuUPY5DsvGUK5hHS94g7c1QFSfuVP0=;
        fh=cZ86GsHDIDg0Kw2a27oveSJ2BUkJBGgxdm5Mnx3fVUw=;
        b=lvVOW5/0G12AOp/kGSJBilODm349s2gDbs4PeZmQtwjuzdVt/miBGDcWeLYI+gvZ0O
         tomPCN87srAgViTy84AY3ZFTEm7MSYBu7tDsxaLGSig14wAXakX9PwMNwQgJjBYxd58L
         JohDFYUJglRfBvVUre2W0GEwgrQc75L2GHiLv+cVzyBV3qcSv4+7NVV8ypUZILQxq+AU
         LR23UHadwFwtNXNwjVB08bHvTBGsk2UVqe6q3I42eEBRv2SEmAjt6Ck32Vmhp3pP1hS5
         6yx9JNoyrGltxeUl3kRiGuz2CL1IUWs5F0OoZFPhwOJLdyPjatoRDJHfiUXsnoa78J3U
         NLIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795657200; x=1796262000; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AYJ48wT8wbR89LuUPY5DsvGUK5hHS94g7c1QFSfuVP0=;
        b=bvPYF6T/8fMo4E6y+2yNTd7XZkYbe3e7iwaAqCjlkQ0zckzdFXlPyLwUVDxzgE4/Ao
         TRRW7xV4/zoKcH6Y1Jc7k0rrcvC+GxJfZ1AVDq5HGEAHPgaZtl/9P0VMhIQ5+1hR99Y8
         DvFNhi+otn/VQtMT52l8noqHrR5wNKkXxtDsggFrsZ/r2p8f5uMIcHyFN2nA5veLh9mV
         ZkJx6VE7okFOJveQEoUbbmBUbao70XxloIvyk+vMj4FCJoVO/AHLji5zfDXusWJWzG0d
         Px9lVdOeb5Xopegqbh8WLDMXCP2QTCENz9AQJ4y+Z7ZavaFNaPjC6FXM9/aiKiZRS22r
         vORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795657200; x=1796262000;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AYJ48wT8wbR89LuUPY5DsvGUK5hHS94g7c1QFSfuVP0=;
        b=Zr8vR9qLdf4f0wjCtlQv7LaoONBBtr5OIJLpUcqHLB4tlJ5TmsgUfZkZ+B6oLm/Y74
         w+ZvuvDkeMy2vsEz64qpgAXSKd59j+AE8lzCZay0dCsbsUAorBZBgKT166nzrJ2ZW7Vn
         zCZ2vWEhXASJiKdrIQm0r5Llqgv+2YoUO3V3PM5ynaHveBe7GuX/MKYHG0FIKM7LcmM9
         35+igT9Nhgtfj9/Fe18olmqwGv/jTgDk0JCZYpeazwfcRb+biujF9h/sAn5ZNWg2QJIF
         /FGX5nCxzrGTVU/YXwsVkbgb7sqNKSUf3mYhhL9fQsDIcHSGuTuX2F8gbDdBx8AXPvGR
         zrXQ==
X-Gm-Message-State: APuU4Z+R87u9GlWImP+a3tuKyEaIxJv7RzrgfEkvo37J2QWajJXipk7O
	x4b9INHcoe4iP9o+leMl8fI+giZrmggb4GMn8AhdTywr8AoNVnxkztvicKZ8AVqRJ8b3+P6Nwi7
	annkSQnONnRCGn0I0vforZNo4bzKUDflJjQIyj8s=
X-Gm-Gg: AZFdTZdVApVoGz+oOcJQIMzBZvf4Xo9+VPeRAJNY++fGGVUOySeuZjuC4AtW2AYqLSt
	OndUBcbSW9tst391QhS6xEybmbJUc7ilHhB5lxkEqa3wkBY8dA9CKj8TcmzGgZ3poIlH9eSjgjD
	wKORwzOwm2l15Dej4pg2WAD/2NdlXoUcpqErA+0aL1zPFnx0rjtDTEm5NCPorzn9Lh2qSC2sTZD
	b8WYTEOUZwqtk4JIXVKVlwH1ivKj4QeFmfdmi4e/CgDM6vNqw8GJH4zViwxw+THhrd8Cdyhebwr
	1stXfzcvpF6Ae8yoB880+crSUc1SjAb2/JzQjckmkXQZnzExBj3CwumjDt6vSedyLmrPdOXNnLp
	DXRLf3fjFFnVfZ673U2iPYA7VjmGvbr5ZIMr4ZyS+PGsLHIwnzS8QZzgQYb5UpROF0aJ4tW6WFY
	DEUl9GPskYcKss4yDCsOd6yi9OhnLCITKSUlQ9irutZOTa3Xwf6Go1Y5uTd7+VUmp1vwrR2MRXH
	VPp46WAaTn14fbbxKZh7ISoGwjnMou7xPRBr5r5ODnIDVz5g3/SE+s4X8BpkJX+CMTlPQGiNvs=
X-Received: by 2002:a05:600c:3b9e:b0:4a1:cf60:dcc3 with SMTP id
 5b1f17b1804b1-4bb88820687mr457514035e9.29.1795657199504; Wed, 25 Nov 2026
 17:39:59 -0800 (PST)
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
 <cc76808cadf384b5ce9441f21b65a9e9@kernel.org>
In-Reply-To: <cc76808cadf384b5ce9441f21b65a9e9@kernel.org>
From: John Stultz <jstultz@google.com>
Date: Wed, 25 Nov 2026 17:39:47 -0800
X-Gm-Features: Aa3M54qIkiRBrgUtn3yTyeJ9yuuc_li9V0C0fAjYSveJleUhmIM2CiSBFoWUMF4
Message-ID: <CANDhNCqFgEoim3h4L34836g7gRrBUoOYcKZH3JB--KN0hJVvwg@mail.gmail.com>
Subject: Re: [PATCH v33 1/7] sched/psi: Preserve sleep-persistent PSI flags on
 off-CPU sleeping dequeues
To: Tejun Heo <tj@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, David Stevens <stevensd@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Valentin Schneider <vschneid@redhat.com>, Suleiman Souhlal <suleiman@google.com>, 
	Andrea Righi <arighi@nvidia.com>, Metin Kaya <Metin.Kaya@arm.com>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Zimuzo Ezeozue <zezeozue@google.com>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Qais Yousef <qyousef@layalina.io>, 
	Xuewen Yan <xuewen.yan94@gmail.com>, kuyo chang <kuyo.chang@mediatek.com>, 
	hupu <hupu.gm@gmail.com>, Zhan Xusheng <zhanxusheng@xiaomi.com>, 
	"zhidao su (Xiaomi)" <soolaugust@gmail.com>, Hui Su <sh_def@163.com>, 
	"Shubhang Kaushik (Ampere)" <sh@gentwo.org>, kernel-team@android.com, 
	Johannes Weiner <hannes@cmpxchg.org>, Suren Baghdasaryan <surenb@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 3:02=E2=80=AFPM Tejun Heo <tj@kernel.org> wrote:
>
> Hello, John.
>
> This patch also fixes a trigger without proxy execution, through
> switching_from_fair(). A fair task sleeps in iowait and is delay-dequeued=
.
> sched_setscheduler() then moves it to SCHED_FIFO, and switching_from_fair=
()
> dequeues it with DEQUEUE_SLEEP | DEQUEUE_DELAYED. TSK_ONCPU is clear, so
> since c2ae8b0df2d1 ("sched/core: Fix psi_dequeue() for Proxy Execution")
> psi_dequeue() clears all of its psi flags, TSK_IOWAIT included. The wakeu=
p's
> psi_enqueue() trips the check:
>
>   psi: inconsistent task state! task=3D1318:python3 cpu=3D3 psi_flags=3D0=
 clear=3D1 set=3D4
>
> Tested on mainline 4dd16e31135e with CONFIG_SCHED_PROXY_EXEC disabled, ea=
ch
> run a fresh boot. Without the patch, the reproducer below hit the warning=
 on
> 10 of 10 boots within about a second. With only 1/7 applied, 0 of 10
> sixty-second boots hit it, while switching_from_fair() dequeued a delayed
> iowait task about 3,500 to 16,000 times per boot.
>
> Tested-by: Tejun Heo <tj@kernel.org>

Hey Tejun!
  Really appreciate your testing and validating this is needed outside
of proxy! Especially the reproducer! I'll include your tag in my next
iteration!
-john
