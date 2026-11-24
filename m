Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530994;
	b=RtL+OMhF48lBkUUo37wlmljMSlRwe4+KACZu6jm1LmExnupcNjGTQ+orzLO7jCjBsLeL
	 4y+/jeoq230b4UCMY3HpCtpzm/izxIZi7ZuMpWkiI1tZtk6/D4hkmGPoA4jDx/3VgQJzE
	 ZY98xFNWaNkkop72bUCQqyjug3QVDJ1pISQFfMAE91rsElw8fpNkgF4fz7XqnvgbFjjTu
	 ry5CDF4/Yi5RVcApuyauZ/oCPXPv/PoQ+Z/oDbd2k21lnqCYFTgPwkcUfiCfyS4c/g5q1
	 GjGsaW3AcT+njhjx5jZ4ZYWaiIAuTJKEOu1P/IH+2lATPy3isizQMcwIZAeHBA0aWvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530994;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=h2mPSw1B7T+UpRiyzIuukEUJ/+X1wVAS23+YiwuYWu4=;
	b=hzpfQlgHv5XvXGrxi82KOhR6Isw3AhJDnNG8pMNrkk3WHVGwJiCTLdOY4ZnaoBZ2MMW8
	 gzSXg00pPjWb+uQm8TMfP7TO5N2809RTiVhaOuQcDxh7Ehz+FoS+tWSqm/0srJxvNSQ9J
	 Go3bm6lsJllnrR/bhxCd0OljuKEsziivXykv/vk/PAbEP7Q1JuZywsdIK593g8IARtO94
	 Jd3o9fG+LCPOrhX04qMALgRfnAusQo2eyQNjTHf2CdW68QHG/GcBMkAjsMSk9F+F5nsG2
	 TIwjhij0StsIlxmS973YHAWirnF4kzELGeP+q6hbKTJrlZzPdZIC85M7KkBAWjiuaeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--penghuang.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="X3t/gGIy";
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687AB606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:36:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 687AB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--penghuang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=X3t/gGIy
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-38355b03cb8so4603587eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795530994; x=1796135794; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h2mPSw1B7T+UpRiyzIuukEUJ/+X1wVAS23+YiwuYWu4=;
        b=X3t/gGIyURKC6VuYtOymHzaIrZDXrq7P/5Bjk6S54Z8hVq/srWcUlSqoBOjCeL358A
         LECs2Hzmg37JO1FQOQo/SplP4OsJXRu34uTQqld4JKUu4G6EiKQHzxZ84Q/V58doh9zj
         zfeb2beFJ7XNRYIOOMMkN3VIQDThTUEuH4BtdSB595S/WSZI3jL7KAMYvEDfxu7wfHL6
         VG7uLZFZDfW6g1oezJrd7tCBYOhm5mLF5/tNIo/KRTDnTHWzRbsdnlKPenEwX3pqKoFJ
         y9JU1MEXkFDSjARe+Gugb3Ax//clx2JawM+P3pIauYBtL4gjsovpaotKi5WZ05mfIUV/
         1U5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530994; x=1796135794;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h2mPSw1B7T+UpRiyzIuukEUJ/+X1wVAS23+YiwuYWu4=;
        b=AhwttqBSiqXi1R9XzKq/7yEWaqnUGS0z8fBjfaO9EkqT03x1KqObH0RI2TCfkFkiO1
         ajuEro1q4jnFRzvOrALrbWEWWCFom30tbxdFs/MggaMTR0sGdQskWhHDDkNEzl7u4WBZ
         XqYedRb1M07TV9laK/wN29oQCrVNy76DzajakyEOHg9yRLuq+2JzcGNvgpBFZXmwAtzd
         8k4JA3/9iAy0qVPAhxZKFeLz2XkbWPUTmlsKlohzmR86bEPmiHiNwnFo2EujX7XaAvlP
         8tVyDdWKQCDNcHpsYsvxs8maxWABvXy/HQYqsfAc60WcCZCXqg+3n2QtQunEChpcy4xl
         IStg==
X-Forwarded-Encrypted: i=1; AL+hErHaFpgH+pZIckI4OHFeka0uav0C2BuMa5FSDmNPpBDDYJrKMeXqSDB9yGXGXGrVcDEVXypbNQTMAZkdwK0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/v5vfi88aEXdjhbQzssBQFm4VDCXh29vjVRF+136vg7kn/fqW8
	JL2FCuC2L82UWCVheUWLeojhp7FFRJNn5+mFUrx64BkWBM2AXDZQQlnhG0By1J8tWoh3N/GT2mO
	UbvIOTKOQLDxAaEsrfg==
X-Received: from dyah11-n2.prod.google.com ([2002:a05:693c:83cb:20b0:386:458d:ba4c])
 (user=penghuang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:211a:b0:373:5561:8d06 with SMTP id 5a478bee46e88-38570c36e7cmr13603125eec.37.1795530992365;
 Tue, 24 Nov 2026 06:36:32 -0800 (PST)
Date: Tue, 24 Nov 2026 06:36:31 -0800
In-Reply-To: <CAKfTPtDb6CZ8WyN8rdK_-9RNhaFRxaZGOE3+EfbkReqkFCCy2g@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261122015729.2512645-1-penghuang@google.com>
 <cover.1795462673.git.penghuang@google.com> <9b14aecb0ad560a3ce5f7925aaaee6e4f4a1a760.1795462673.git.penghuang@google.com>
 <CAKfTPtDb6CZ8WyN8rdK_-9RNhaFRxaZGOE3+EfbkReqkFCCy2g@mail.gmail.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261124143631.4012300-1-penghuang@google.com>
Subject: Re: [PATCH v2 1/2] sched/fair: Clear residual sums on zero task-group
 avg propagation
From: Peng Huang <penghuang@google.com>
To: Vincent Guittot <vincent.guittot@linaro.org>, Tejun Heo <tj@kernel.org>
Cc: Peng Huang <penghuang@google.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	linux-kernel@vger.kernel.org, sched-ext@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Vincent, Tejun,

On Tue, Nov 24, 2026 at 11:23:03AM +0100, Vincent Guittot wrote:
> When fair tasks are involved, the next decays will clear the *_sum
> anyway so I suggest to skip this patch if it's not needed for
> scx_switched_all() case

Agreed -- let's drop patch 1/2 since it is not needed for
scx_switched_all().

Tejun, patch 2/2 applies cleanly on its own with Vincent's Reviewed-by
if you'd like to pick it up directly; please let me know if you prefer a
standalone v3 instead.

Thanks,
Peng
