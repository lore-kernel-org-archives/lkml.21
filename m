Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.32.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795507044;
	b=14r7sJim51ip8yyrKZSnFE1vqTv5B9iCXf0k93+K4GcXeXubUQQV1FTrHkn7nGtJ1cX6
	 uREKRDfWMi0Pc7X8mLrDERIL9967dqWXH+q3kC8QnJGaVBqW93o0lCtl7tzl5lAfcZ7o0
	 YhsDRalWQrcfLAsYgZD0jXlXdFAKLHwHrBXzVKhsVSGBxiZQEN2sNUnrLdgd/Ht+WaGYo
	 I56RLRVt7t9miGyWibleeN+LmAr79ZMhI49/lIBqfO3ofDnkrW+vlDS7sPRNFgNKtGtJG
	 LSnA0w5HHPn+SGNjYN0IJK+c5H0tyVVseCMnfy7lBSwsDAjBS91FcgvLdJwH0Vow4xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795507044;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=TFn0/ve38elVqH0MgkxcgQX3ar5upXZTtQddaJ6CDVQ=;
	b=aTIzo05f2brYimk4jWEpITErv2Zgf6l31FaAIhAveQt1pdE0yTD8UA9gQ0u+GhxRUrT5
	 iWKzcJ1AkkoNLEh4vsP56ImfvtYx9gZeeqfzqvFLD1662By64+6Efe83aVM0/52jxRS/k
	 CWpIre8sU38NJ87yWTCnJDaByk/ByRapK0p45bpHtC27fbDl51lU+jVLBV9QTyhYeYIKX
	 6QOAIArYDhJc8NqgxEKTuzRhh4kNvmWMWWeYrn7nPENwFWBgh9E0bVhPI/LuaThHzIV5z
	 UONApU8a8PCnOn/WpE7K4K7AyOSn39JTKncY3EeaAsWl5IpHkFg0Fk4FiaAkEDLIdpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yeah.net;
	spf=pass smtp.mailfrom=yeah.net;
	dkim=pass header.d=yeah.net header.i=@yeah.net header.a=rsa-sha256 header.s=s110527 header.b="WMMJu/mS";
	arc=none smtp.remote-ip=220.197.32.18
Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA3B606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:57:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DA3B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=yeah.net header.i=@yeah.net header.a=rsa-sha256 header.s=s110527 header.b=WMMJu/mS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=TF
	n0/ve38elVqH0MgkxcgQX3ar5upXZTtQddaJ6CDVQ=; b=WMMJu/mS8xeKwZ9M4u
	wa088JQ41/B+iDErAzer8sZ6nAMw2TF1c+wmNq7ln4i/t+t7fI6PZOGtTZQjZ+Cu
	lWg0adOiHHKpdXUY7ktPTYH7Wtu7KbTgGo4pJIDsnBYmiOlYm/pbgZCm3EpyUsxs
	DevFW6aW9mZ6OsWLAsM4J9op0=
Received: from deepin (unknown [])
	by gzsmtp2 (Coremail) with UTF8SMTPA id Ms8vCgAnZ9MdQwVrdb4rBQ--.65041S2;
	Tue, 24 Nov 2026 15:56:14 +0800 (CST)
From: Ziran Zhang <zhangcoder@yeah.net>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org,
	Ziran Zhang <zhangcoder@yeah.net>
Subject: Re: [PATCH v2] sched: clarify ptrace's effect on task_struct->parent
Date: Tue, 24 Nov 2026 15:55:38 +0800
Message-ID: <20261124075538.8793-1-zhangcoder@yeah.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <awRocuwV_7lJHSl4@redhat.com>
References: <awRocuwV_7lJHSl4@redhat.com>
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
X-CM-TRANSID:Ms8vCgAnZ9MdQwVrdb4rBQ--.65041S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUUUUUUU
X-CM-SenderInfo: x2kd0wpfrgv2o61htxgoqh3/1tbiNR7ztGsFQx7tswAA3B

> Well, I only suggested to simplify the comment you proposed in V1 ;)
> So please remove the Suggested-by tag, feel free to add
> 
> Acked-by: Oleg Nesterov <oleg@redhat.com>

Hi Oleg,

Thanks for the clarification. I'll drop the Suggested-by tag and
add your Acked-by in v3.

Regards,
Ziran Zhang

