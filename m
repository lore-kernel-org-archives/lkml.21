Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795465201;
	b=1phN+PnHc4S4/4dc1zy6U/EUG7K3XA5rdcjiypoEul0qevuxQk5eU2gLh8CS6b9Z8AtZ
	 7awNcgmhkr6GYTg3FqkgLoz3j6002HC3Rz2AopcdMhak/vaHRXpqmcHPfsZwmxPUDze+k
	 oQujJOKsXn/p0S95S5uL3LFbhUjolyTnM7bK82O0TE4QUDyC7IxjtECmpxLZHdfxz5Z9L
	 pOv7OkE68WXqARxQyfRmEpzBivZf8PO/0ZgNOYE4wnFCW0KjjdZ9Grypx1u/tanGOYnJk
	 m6QKJZwtDSVOhyuNSAC8svQdA7ONqN7gyDH94j55LMN0BxI84IpRab0YLEtJRo2lpDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795465201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=RUQ8/mle70/OoJSe7E2/7hmZoUcB7bVUUwPl6zEwLxc=;
	b=SjyQSB3NmHKv1cpo81A/lof8GlGgiGc0Mgrv0HQD8pyhPB8YfY294cNogNFhM5vq0T5P
	 ejTeYBkXse52Xru9AWrur3F/7JnCj47tk3M9Y0V9IE9HOA11fgEYsbcV3LMDNY2VHFx22
	 cZixKN9k8/EWVGhRASOFAVEg+5yOsxANDc0S5bR3UCVUfFkfK2tZ6TsonY4PlNxGuWdJS
	 T8NJQNNLYE453lApPi/8avf5D54xSSl4CUmakgj14N9KQZQ5MbdvJI2jR1QK1w7t7YdKo
	 tbnhP9X4/ahqThNSxH3WnLOkNWv+1OFTt6D/A/Fyz6ZYjwY/ATYhArGhCOU6JIMkIqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--penghuang.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BMp44x0M;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E05606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:20:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4E05606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--penghuang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BMp44x0M
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so6028201eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795465199; x=1796069999; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RUQ8/mle70/OoJSe7E2/7hmZoUcB7bVUUwPl6zEwLxc=;
        b=BMp44x0MGVC19fFjMEwmTr6KgCDjlbJnNc+6fD5HFfAvmyEueZyPyBkd41Ai8tgF6S
         znlthvYSHGUlGKac2cuFWao7vcZMLvj0fCI99LJyHU7zMmhOXgNSlNPIAzVNZ7+zINNE
         /nA37fhib3VkRIGEY63qsCVDK8gAMVX9V/I/FIV/EkDQsITK1Mhsc1CWMBn1GqEjQELy
         tPHAt3YsB9gOI5L1TXAPDW40nZjL3GnNCjaJ5d0B1w5fpHTVg6bzr1AC/QDcOZWo2GXe
         SH53qXy2xQrdW8DIoeNxotv4I3wnbooAAvVb2C7AK2P5+qKi8HFA0Z2x9/mqHWpRq2lT
         UP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795465199; x=1796069999;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RUQ8/mle70/OoJSe7E2/7hmZoUcB7bVUUwPl6zEwLxc=;
        b=CnXrciDVl5qM690Ds453rt3/5XiNGCNh9Yjnh3Jj+0kGBfNGvtPgkhDlVv8LL9AY97
         AWJc6ie7jHWp3c7wjCuAdQNHkG2wBbUt8HprvYxKXEBamP4GnbfOeyZ+t9nzT2YShrQm
         WdwqkFUont+3wXwk8rl4o+cOFF0wDq1ZJNX72eaWKvujOyKR34aUBxUtwE3N58xAoUiT
         CJa38a5gCvZ8d+b+e/csjswtgYbgUXhcjY+ZBzNCZ5NIRJ114Rre2Y2qKJZGoHqRjvvC
         tZoabAJ+IKyEBKVB+oC1IYoG+XpPWXBhZo63UMeRG70ZhD7AxRt5vZuCn0BvkiRjZhoS
         gnzQ==
X-Forwarded-Encrypted: i=1; AL+hErGkG3b/woY/s6iYdb7UWSutlU6EPUGB9mrQVSOFkBA0xo77BAKVTx92Z3vAuWkOwp8a2s3GEQEMMIXOcO4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BC2JeNmg5tQyKJ/WMmHygtm1oVbRi3DXwhwS6ewjR7dWj6XPQ
	elMthhUsqL3yO1/n34N7OyYvI5/Yn+JVqVbF7XfCc8TAu7FKkEEpWF4CqJictQbzJynZPKksjwu
	UIQvDjyp5/p6f9MIeqA==
X-Received: from dybci24.prod.google.com ([2002:a05:7300:a498:b0:37a:8a0f:3aba])
 (user=penghuang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:51f6:b0:384:7b4c:8564 with SMTP id 5a478bee46e88-3857131a749mr14683264eec.41.1795465199126;
 Mon, 23 Nov 2026 12:19:59 -0800 (PST)
Date: Mon, 23 Nov 2026 12:19:58 -0800
In-Reply-To: <06baa96f105bbe10e6283e908f1240cb@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261122033316.2819845-1-penghuang@google.com>
 <20261122062121.4172437-1-penghuang@google.com> <06baa96f105bbe10e6283e908f1240cb@kernel.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261123201958.3988584-1-penghuang@google.com>
Subject: Re: [PATCH v2] sched_ext: Update other_load_avgs on set_next_task_scx
 and idle entry
From: Peng Huang <penghuang@google.com>
To: Tejun Heo <tj@kernel.org>
Cc: Peng Huang <penghuang@google.com>, void@manifault.com, arighi@nvidia.com, 
	changwoo@igalia.com, sched-ext@lists.linux.dev, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	haoluo@google.com, brho@google.com, joshdon@google.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello Tejun,

On Sun, Nov 22, 2026 at 11:47:04PM -1000, Tejun Heo wrote:
> I think this overstates the staleness. While the tick is running,
> scx_tick() updates them on every tick, so they're at most a tick old,
> at idle entry too. That's already a lot more often than fair, which
> updates them at load balancing intervals.
>
> update_other_load_avgs() isn't necessarily cheap and I don't think we
> want to call it from scheduling hot paths. If anything, sched_ext is
> already updating them too often and we should pace it down.
>
> The actual hole is CPUs with the tick stopped, where nothing updates
> them, and this patch doesn't address that.
>
> Also, how was this tested? Is this from reading the code, or was the
> effect observed or tested in some way?

Fair points on all counts -- calling update_other_load_avgs() from
set_next_task_scx() and put_prev_task_scx() adds unnecessary hot-path
cost when scx_tick() already covers active-tick CPUs every tick.

To answer your question on testing: on an Android 6.18 setup running
sched_ext, we observed frozen/elevated avg_rt in Perfetto traces, but
the actual root cause there turned out to be idle rq_clock_pelt()
stalling due to non-zero dormant rq->cfs.avg.util_sum (discussed in
the separate sched/pelt thread). This upstream patch came from reading
the SCX_RQ_CAN_STOP_TICK code paths afterwards rather than an isolated
reproducer on mainline.

Let's drop this patch. If we later observe a concrete issue on
tick-stopped CPUs, we can come back with a targeted fix and benchmark
numbers.

Thanks,
Peng
