Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795646152;
	b=fC5nAVu85fXA75T9wzkJdb0lLzTp+D4yWR/2Nbs2a3GqeupCl8MHtnxbJX+mZyOXfxII
	 AFA6Yt4USeMOMKWKWPF1GC7Ae2O9C7itAJ3rbB3zwuYo1/yU62JfGHoe44uKvZPbgsltk
	 s1CS1TDcv7hfyt/nw3TyGMNMuECmK75MTpMNJ6wt2qWfSaQEyIMszW06skQjdfMcjRQ2E
	 hI5dxVG/IaNuMlv0uoZ3bWVdcv0TBX2tpST7/YM/NvaA0g2MmnIMnzR4B4WC7sDzuuZOb
	 VfgXXpQKRjcyBKHagNzxPTdqlO9+x1Nwh83btaZL0btizW9yJD4QRwgvGGtckDECNgQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795646152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=RpMDODz1MVE0LFcr6VGr3hyHGta61wR5Cn1AYrSNYGY=;
	b=1Rfie3wGEPqQGB2kpK6tP4VEQvmC+Ufpq0Isx3Va3+XMtxk7y/RchlRnm0bvAnFSypdz
	 ynHoUhTFb/34UeIlAzA5MasEdhAfLMhvo00d+4Gk54bHOp6/+3TEAqCojpTn5GXrmsUwq
	 YQqN8QXTU41jAD6GbMJtM4Pt0dZHWmy5sVH8W3SI8YZqGKwEM916rdP+uqqZJtUhi5CBW
	 c22annaYIaF1lUGRkqYZekaR+2iShoyYlIlLhiQ9dXvHF3hCKttXVopIN4fdQJ8x0PWyC
	 Umyp6JEp1MKTa7+TEss0WAFcgdag6VC7BmrwuIo7b7+IZcbMKzUGH7bm1Y4O0nBzG5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=b109WJE1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA75F606A329
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:35:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA75F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=b109WJE1
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so5184082f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:35:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795646150; cv=none;
        d=google.com; s=arc-20260327;
        b=dGsR5cV7DdbKjnyc6eax668vSNS+lilsfFsw34Qn0wSX/elNM1G8HwbJmeSkS/Srcl
         yX1vwl5Hsgc5B4c0VEMOkCZ2QNAYrAyuPS/StzGP3OP6NdVSELsb4MCpJJeBtaXETDPW
         n11ID26XKrFYeonC51chSz0oikGM6Al/mHNn11IPUN6n/x5gIMSW7GLaNrUVgUjo/6/6
         wN+fZGXLL9sAMh9AV9DdoPdYenZdVso4nFA/XPxu8j8rQPAmIOkz1QAQPR8Fy1VvG0Ou
         Jb83yTavdrS/Gart8yy1leYslhg9MBjlpt30/oosn/V7sjh87RKrj+pU1QOKrF7zQaJs
         jKHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RpMDODz1MVE0LFcr6VGr3hyHGta61wR5Cn1AYrSNYGY=;
        fh=IwvQJPV0A5Cr5e73hZOFfJoLZDXe+DIdi/MfsG7zb2o=;
        b=E6NZxjde+X1scVMURHXDrqWFoIy6ekaQestdERIzj/EiY1eSTP2RUbppcKCT5M4uzj
         43EMf6R7KKAK13c+yNRqcdFImu6LX8S0R4/Y8goiMOQZyNx72iefHSNHiBEQYQyjxowc
         MF/6iu1l+UMKYRFW6PmRUqeYfVmIqwTFJcKuidh9w8go6rKjeQLpAR0nHvzockRL7kYk
         m4bF+wUsr9mdHBB7ixyj4L9szJpG4/xX6hQIOOnktJEHdB6QanjXWE/eVKqRcTnWhJnN
         1et0arAbHW9CG7cY9VxlEUYTD/QxHKtwV95/pbRDHdP2v55K2/mvF3MePruNZIxCAYtG
         X7Vg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795646150; x=1796250950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RpMDODz1MVE0LFcr6VGr3hyHGta61wR5Cn1AYrSNYGY=;
        b=b109WJE1fmRv+NDpf9Hu+4ltJLqCNu+W55GAVTLhgtsAHJoYX2gTWzCUNI9V7m+dYI
         xg9IBDyBTrVcDNSOvmQvCxoy2mDDPhZwjc3cNA5F032Lm3hRgUOgsyXQrNO7CgFhlsY8
         1mhUtdZu67tbWZAfGLNXR6ipk/FPFSA/PYpRs9lctlbBYGBmoldoQbJK+MlDhnih63QG
         e5eIUV1euspUKbllTzVze9KqXq/cuIbwvbMYu7FDkdcti1uDIUk8Qp3Xn9y52TcRX3/W
         qSM3apU6SEqXVUTJ7NYGDqON512HCJXp/4fwKTyir3oRUIOMMKrPD5MB2wYhBe7VcqsL
         /igg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795646150; x=1796250950;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RpMDODz1MVE0LFcr6VGr3hyHGta61wR5Cn1AYrSNYGY=;
        b=CcoiD8QBr5KgRDiV8/e4OMmnWlYM59Dka3QlSr8VXJrueZSp1oI/5ZVVd4RSGDPxLP
         R76vlMlry5xmlutK68WIp//iEbV4tCHOJoktxau7e8z+xIY77JWoovTFSqXRoSsyxGS3
         M5i9PFIsYdmsW4+9W7FheR3LYmYLVe1vKebFInb83sP5vR5E68rDtCIh4h8S8wlq1dII
         4SamOiTQ8HDuE4fQmzWD1pt5I74C7ucHGJmyWZfKFn75DklhY+MYD8G3AD5roZRBH1ml
         XKXfIAnsJRw+eb/j8HI3YJqMOPTVwti3XDqYjcIoFFY66punz7KyQeVGNqEwn6u3w2sp
         ZCLQ==
X-Gm-Message-State: APuU4Z9/lCEMan1jbspe37k62BYgecrTVroeyXAfHmfNw0jn4CiOZGmY
	aPnc7d7/V2Vu77S56y1z4W/FudsoenMUXxNtnGs0t+av/eMwWjQbNNfdknHH+xJ11SUYO/07yBB
	w2hqsP4y1bp1Qd8Nwln0992IYh+5OmL4HwYs88zUmaXLsPdfq0tHF
X-Gm-Gg: AZFdTZda49v5IQhKHBkjO9ewToZU0d3C46ZtjWiGQ0TUHRONJmhlp7Gv95eVo0gpMU1
	4iq84A9Etpx8BMMIfSnhhltw1K+DwtRszSeqz/k9iXIrB4cvIOXY4c34CjUEfMr02+T2FlfK216
	aoFw+53XLfW3XM2nUOpilho7tpMptx81t4Z4Ln4Np12aV68PUO/yt/GEZMj/6nzZrXtgEkg9qlC
	qdtwZn6+hUxzqSLfxF/zTBFVGsT5yKsLL+3P2wk5c3K9+jHOlWeNe5+FfM/zGWudSafyiy2pqCD
	vI9aE3OG0aAPPgn47b5V3J8ZiFlvIR0WTKFjRTAAyJUNBKpDHbbwL0OaC24wdrQL929FRMrMrkf
	JpXResq5QYso5hZyJlmUBbJeCKAaFtTpJitvIThFpwEQAQ92a5DcHEAcY+N2Gv+3nEY4pRjhuYY
	12pzkdosHtj7XmaruDgDh70yNECtLhZdBsrZPT8GdBakKysvnomMGONyAjEu88N5XFXlAKLQmjC
	gGUwyR3y+GVpuJ8k50cnxPTJTZ0naEsqjyGk96+cmcjaJwcTaXu3Q==
X-Received: by 2002:a5d:5f4f:0:b0:4a7:35af:c83c with SMTP id
 ffacd0b85a97d-4abb3e21218mr37214985f8f.43.1795646149678; Wed, 25 Nov 2026
 14:35:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023220431.1106611-1-jstultz@google.com> <20261023220431.1106611-4-jstultz@google.com>
 <atxtWdx0nqTRAAYw@gpd4>
In-Reply-To: <atxtWdx0nqTRAAYw@gpd4>
From: John Stultz <jstultz@google.com>
Date: Wed, 25 Nov 2026 14:35:35 -0800
X-Gm-Features: Aa3M54reh0Oovc-xdhLaC0dVgJgZktHmgMVnNSaHGVsxaFq6wCTpeL3-dT5kXNc
Message-ID: <CANDhNCpb3pt=9SwKXSFegYHwLBURv1nm_0fF3kYmev_zroneAw@mail.gmail.com>
Subject: Re: [PATCH v33 3/7] sched/core: Activate blocked donor when no owner
 is found
To: Andrea Righi <arighi@nvidia.com>
Cc: LKML <linux-kernel@vger.kernel.org>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Valentin Schneider <vschneid@redhat.com>, 
	Suleiman Souhlal <suleiman@google.com>, Metin Kaya <Metin.Kaya@arm.com>, 
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

On Sat, Oct 24, 2026 at 1:33=E2=80=AFAM Andrea Righi <arighi@nvidia.com> wr=
ote:
> On Fri, Oct 23, 2026 at 10:04:14PM +0000, John Stultz wrote:
> > @@ -7013,11 +7026,11 @@ find_proxy_task(struct rq *rq, struct task_stru=
ct *donor, struct rq_flags *rf)
> >               struct mutex *mutex =3D p->blocked_on;
> >               if (!mutex) {
> >                       clear_task_blocked_on(p, mutex);
> > -                     if (task_current(rq, p)) {
> > +                     if (task_current(rq, p) || p->wake_cpu =3D=3D tas=
k_cpu(p)) {
> >                               p->is_blocked =3D 0;
> >                               return p;
> >                       }
> > -                     goto deactivate;
> > +                     goto activate;
> >               }
>
> IIUC, p here isn't necessarily the donor, after the first iteration it
> can be an intermediate owner that is queued on this rq and blocked
> itself. If its blocked_on was cleared by a handoff (or its mutex has no
> owner, below), we now return it when p->wake_cpu =3D=3D task_cpu(p),
> skipping the sched_cpu_cookie_match() check at the end of the function.
>
> So with CONFIG_SCHED_CORE enabled, are we running a task that was never
> cookie-checked by the core-wide pick?

Thanks for reviewing and raising this!  (Sorry for the slow response)

Yeah. Looking at this more, I'm thinking we should just drop the early
return conditional and just always call goto activate, as the shortcut
potentially skips maybe too much logic, and duplicating it all will
just get messy.

thanks
-john
