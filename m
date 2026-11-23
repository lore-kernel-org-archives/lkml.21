Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.66
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795420120;
	b=qDAyZdul5VmJHtnWR2LBp6pTe0NoCJW/mLDYk7TrEox19LKKl0Jm0udGy8zTW//SBl3S
	 0GSmjmvgNuiZGvylQPVoKPtipIZ4tqnGVrKYYG/2CvCOpY7jD0GpLyHTzD4LCGNPU0yWd
	 GALYneOhANicqZkXtpNhpIi4koabaQ98921CmKbgT+mYhS+l/zNJO3/HbbCr5ZEbqqfNK
	 t6KkIG2VdOx4GfctqOyIO8mz5tnkbgyyIIfzJROs5dsxasVQk/CoPP4RlQh9yamgM+Z4K
	 spVaLoF0TI/lSuY7RnOJoFVhp3GilV/P3BnDxNDLj6Rye2ql8mNPhzFVlZvDL4Tm94g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795420120;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TeEb+VkEV9Za4392jc0izFxAy0GlccQfW+OhledsOuw=;
	b=0MrsDCSqtTByvisxPn6weZWBl/t3wOqvOMXXRTdJT134CcMIFH7jAFX5YKmYIgigulHu
	 xQrJyYYwzsOLuggYWe9KD9Pxy7+HHljBqKKeCpORAViOtTT1fnuxRAmbntIy3Yr5Zg+Ka
	 GXtQdUi3NyUgW5OA0oWF43+9sNA4XYX1oTTHnJ1rgt0KXpgi3z/Z81UFEG7YqA8vfwY2D
	 9cY6Yx4SQ+RUtWomQ/EKVizhZ+HX/crSuDWUyyn1/qz+O32zQgzfoYn5wAO0tqPB/xLOV
	 8etpP8JZHKVfdggad6n7zVk42adsQo+BRZb8UJL97WrbFQYf8hAHvG/EbVK/j2ZgdjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=r4+GXb7W;
	arc=none smtp.remote-ip=95.215.58.66
Received: from mta1.migadu.com (out-66.mta1.migadu.com [95.215.58.66])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AAA606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:48:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26AAA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=r4+GXb7W
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=E3TRoGuyGmOYWn3zhujfxKl0PtdHJnYxb332iPImYlg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795420117; v=1; x=1796024917;
 b=r4+GXb7WxzzeMrY5K++9oC84DqOUfct4AMVlLpiHqPExM+RoOIWSf1Xc9TDH+8EPOXq54co5
 zVOMm+FWseyUWB61I2K0szZ5FFvsZ9k+6F3QCw12l+hefNQMaLdszi48Lx4u77l0HdEzp+ym6xp
 s7Sf6gvVm042u2yNABxuXk58=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 43d223002f5a23af;
	Mon, 23 Nov 2026 07:48:37 +0000
X-Mizu-Trace-ID: 43d223002f5a23af
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
Subject: Re: [PATCH v3 3/3] sched/fair: Drop the active CPU check from unthrottle_offline_cfs_rqs()
Date: Mon, 23 Nov 2026 02:48:27 -0500
Message-ID: <20261123074827.671080-1-qiliang.yuan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <1add44bb-c9a4-2bf2-6de0-a748648e99bc@open-hieco.net>
References: <20261120-bug-sched-fair-offline-active-v3-0-325e9eefa56d@linux.dev> <20261120-bug-sched-fair-offline-active-v3-3-325e9eefa56d@linux.dev> <1add44bb-c9a4-2bf2-6de0-a748648e99bc@open-hieco.net>
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

On Mon, Nov 23, 2026 at 03:28:38PM +0800, Li kunyu wrote:
> > -	// Do not unthrottle for an active CPU
> > -	if (cpumask_test_cpu(cpu_of(rq), cpu_active_mask))
> > -		return;
> > -
>
> Per patch 2, this check is no longer needed.

Right. With patch 2, set_rq_offline() only runs for CPUs that already
left cpu_active_mask: sched_cpu_deactivate() clears it first, and
rq_attach_root() only takes inactive CPUs offline.

Thanks for reviewing the series.

Thanks,
Qiliang
