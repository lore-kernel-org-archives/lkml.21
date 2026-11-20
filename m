Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.87
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795139501;
	b=oHFtnB3CbP667n6i3BBXE9llJ/p9ZJtQyW8sN6q0GlVegK+GLnKnxWYklpMiN+ybHiiJ
	 3TzsLicW8kQQ1960lPmZ2VnGfh+/r9lgwuWXbfsCSiQk42tHyoweK/gAtBuoUbLCYdiRW
	 xqak7/v/2/JnUbRes6d7cNU53LzB8wz1YUL1SjXXd/lxYQ+RQWhlRzjjvun29hDPU/xyl
	 FzJiuptCCeOeyqiIxRct+N7t5E8HAF8y6OYdL2Whz/b/RApqZ0tbhwdJz5TxYXikQHujk
	 NDD7DI743yc170EIqt7yt6i7R/o7TcQxIKsmIS1HJTLOJd4dXklgCz3gKvYrch4McXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795139501;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FvDJE+n71HTRKM6iNl5KrntFvqecHZirfobt7pnykMc=;
	b=HbQRA8087HyZt+/HuQuNK6hSAN0JpL+I2dJW/DHPrmmLpQ2jiIo3xGGy132+YTbRVIDQ
	 jWX6clW762lszVjeAVAjKEsKkmm5lf9R9sAFJMUdEKXCgtMUxQneZ73TtfjNPEvajauPa
	 NzkL1vTf8RenUYcnn9X8ulWlQ9drBOoKMeBG0WH2WMuemdwm+JpcqPrf6G4mlr23CeV7/
	 XQhr33XZGMg22evWauNQ81U0RC3W/BZIlakZ/5HX6kmk7KR0/nb0L1pdS6IXu9b2pglTO
	 aztA3rLWc1e44bULDF1PLTgqKSP58ETeI4vey1Pd60BylVlo/C9qaOnKvKc0MttS+bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=u0hpijTE;
	arc=none smtp.remote-ip=95.215.58.87
Received: from mta1.migadu.com (out-87.mta1.migadu.com [95.215.58.87])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6C9606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:51:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD6C9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=u0hpijTE
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ZiKMS/ZZpKwJvVwWzvJOPwyAyMNHTF5jfpzUaA7eYRc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795139498; v=1; x=1795744298;
 b=u0hpijTEDQlTgnbcP/Q/LlluerTaXPISQOZlBVWPMIWl+45Lk/a7+chw33Gf0ncbLzb6ftSc
 UztD0el79pJZA2iP6asJ3vMDUzN190uL/O/xJJ+1KTP2f0H6YvUKBAowwQljIYlqjcfzV/Q2Ani
 Id/Uj0wPJ8kNAg382bthOTRg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7edf8534af9eb4d5;
	Fri, 20 Nov 2026 01:51:38 +0000
X-Mizu-Trace-ID: 7edf8534af9eb4d5
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
Subject: Re: [PATCH v2 1/3] sched: Tell rq_online() and rq_offline() whether the CPU changes state
Date: Thu, 19 Nov 2026 20:51:30 -0500
Message-ID: <20261120015130.41615-1-qiliang.yuan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6fd92ba8-2249-b5e1-772d-cc598c91bad5@open-hieco.net>
References: <20261118-bug-sched-fair-offline-active-v2-0-b6ede596c6a6@linux.dev> <20261118-bug-sched-fair-offline-active-v2-1-b6ede596c6a6@linux.dev> <6fd92ba8-2249-b5e1-772d-cc598c91bad5@open-hieco.net>
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

On Thu, Nov 19, 2026 at 04:29:27PM +0800, Li kunyu wrote:
> Is this parameter currently unused, or is it being introduced at the callback
> layer in advance for future use cases?

Only the fair class uses it, later in this series:

  callback                         uses hotplug
  rq_offline_fair()                yes, patch 2 returns early when !hotplug
  rq_online_fair()                 yes, patch 3 calls update_runtime_enabled()
                                   only when hotplug is true
  rq_online_rt(), rq_offline_rt()  no
  rq_online_dl(), rq_offline_dl()  no

The rt and dl callbacks take it only because they share the
sched_class callback type, and they have no use for it, whatever
tasks run on the CPU. They move state that lives in the root domain,
so they have to do the same work on hotplug and on a root domain
change:

  callback          work                       why also on !hotplug
  rq_offline_rt()   rt_clear_overload(),       rto_mask and cpupri live in
                    __disable_runtime(),       rq->rd, so leave the old root
                    cpupri -> CPUPRI_INVALID   domain; reclaim RT runtime
                                               lent within it
  rq_online_rt()    rt_set_overload(),         register the overload state
                    __enable_runtime(),        and the highest RT priority in
                    cpupri_set()               the new root domain for push/pull
  rq_offline_dl()   dl_clear_overload(),       dlo_mask and cpudl live in
                    cpudl_clear()              rq->rd, so leave the old root
                                               domain
  rq_online_dl()    dl_set_overload(),         register the earliest deadline
                    cpudl_set()/cpudl_clear()  in the new root domain for
                                               push/pull

The fair callbacks handle task group state (throttling and the
bandwidth switch), which doesn't depend on the root domain, so they
can skip it when the CPU stays active.

Passing a bool follows Peter's suggestion on v1 [1]. Prateek proposed
instead to give root domain changes their own callbacks, implemented
by rt and dl only, which leaves rq_online() and rq_offline() to CPU
hotplug and needs no parameter [2].

As only the fair class needs the distinction, I'll rework the series
along Prateek's lines in v3, so that rt and dl don't carry a
parameter they never use.

[1] https://lore.kernel.org/r/20261112125947.GZ1813469@noisy.programming.kicks-ass.net
[2] https://lore.kernel.org/r/e1a63a3c-3975-4b05-8ab4-518c37d867d6@amd.com

Thanks,
Qiliang
