Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795419850;
	b=weMRQcy+oxPU/d3zvYZLLycjORh0Rgajh+xavDnqkLFyPPXPmjyk3B7Fb5iHktUUTscv
	 NzPH0SiPEEDEeyrKaiVUhcKilaWAQM9M4stMo0CZF8pzccYYHfO6Shd/pNuZgrtEVhoGQ
	 3n0JXZY7UTkzgUskvs3hSlljS+Uk64RkghvRAO53eXb1HFxBSqXsVv43wA9fR0B6bfOdt
	 rOvY7IUv/qs3cX2T5rbYVPKGcla1eiRGJOniLeeropD/KtXS+UUunAc9QpQHftXhvjM+X
	 4UhJvjKwmh1krjUaSmcOuEpukIWMthNASJfXc92CvyQcjBLJivFYYRdXJ73jqsi5Q/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795419850;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fI1Xf7N7ny+DpawEkxfuT+6fCUPWazdanO8QWe6e5E8=;
	b=ZGX8k2CJ+8esYuFvihrHZW3ctsB3HvG2VtFovHVdjADtu+FtLvV5w0OTAAxNLzHQ5XZR
	 ZXFtl7F0k+9aHxQhsOr0ypbZ4AabCzx2RQMCtcr0A5wU9G10XwldKPbw0rY8LRM37ECZN
	 xhShGVkCyEROQ6AOaVDiQVpM4kUX5hSBx8utx1/q5awjfIKZspibx0mxGz9gGW0s5m9Hv
	 Un/hUG6z7Rk4OBDTOhbyREX8+CHRLloU3M8bXh1pVqh1Vkecp1G3WTk2bjEiTSgWa0vXA
	 bmcsRdPqF0FM3yz48LY3OZaJS4d18RNr9qDbas16iB0vxXbhTHA8LmdgFvmR+DbueHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cXXJoguL;
	arc=none smtp.remote-ip=95.215.58.7
Received: from mta1.migadu.com (out-7.mta1.migadu.com [95.215.58.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE52606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:44:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAE52606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cXXJoguL
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=fI1Xf7N7ny+DpawEkxfuT+6fCUPWazdanO8QWe6e5E8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795419847; v=1; x=1796024647;
 b=cXXJoguLdQIEzqIEanxR9nuWlhlhVNL+J9oQGdyzeAUZzx7zYweobSFCEnemvE8QYHsBef+V
 kzvBKJavnIwxgWhimuO8qZ1U1gAhaOFCkO4SuzMSiiDz4WIKf1MrZVIFe6LST8phNle6yliUS28
 OiGpfDEokRzeOhfgC4WBmO38=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7aee2f06b95edebf;
	Mon, 23 Nov 2026 07:44:07 +0000
X-Mizu-Trace-ID: 7aee2f06b95edebf
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
To: Li kunyu <likunyu@open-hieco.net>
Cc: Qiliang Yuan <qiliang.yuan@linux.dev>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] sched: Keep CPUs that stay active online across root domain moves
Date: Mon, 23 Nov 2026 02:43:56 -0500
Message-ID: <20261123074356.496146-1-qiliang.yuan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <a0be247c-24be-5b13-ce39-48ed45d2eb64@open-hieco.net>
References: <20261120-bug-sched-fair-offline-active-v3-0-325e9eefa56d@linux.dev> <20261120-bug-sched-fair-offline-active-v3-2-325e9eefa56d@linux.dev> <a0be247c-24be-5b13-ce39-48ed45d2eb64@open-hieco.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Nov 23, 2026 at 03:25:14PM +0800, Li kunyu wrote:
> By the way, does "base-commit: b251360cb2e6c7b74d962831f5797a4520511b36" point
> to a specific development branch of the kernel (such as tip/sched/core)? The
> code in the rq_attach_root function appears to differ slightly from what is
> currently in mainline.

Yes, it is tip/sched/core. rq_attach_root() differs from mainline there
because of commit c6ff5c553093 ("sched/core: Annotate rq->rd with __rcu
and update lockless readers"), which reads rq->rd through
rcu_dereference_root_domain() and is not in mainline yet.

Thanks,
Qiliang
