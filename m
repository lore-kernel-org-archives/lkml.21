Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690214;
	b=LDSzC7dGPDS87cUP7FBvACqu2wQB042+HDmHIykrKY0bSFGTqanwkB1wMNChdTLuiZ4r
	 FFfnXRyZ+g5RqlQbjPTeAb2exPFoVTXDd2J1YVbnnj/HVUCryGQNr8xj+mTTOTXLKH6Ot
	 WG3+XYKNhsW/tKNk04C99wvWtaq55nfdYbdqvfDLz2WyU/0i8Dr6Wyd8t/XKY6ONgQLE2
	 UrjnpERnPHOPeStwK6dSlj4mvt9hcB17GEDn6VHcK2nTAZFr6AnrP/jRz3kZzdh80xuqo
	 d9ZKuYd5NfJPnXqat3qFpaznONMSOfEII6bMWSmWPVJnMKfW9B37HkN/WoAHUvVhMLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690214;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:Subject:To:Cc:References:
	 From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Q4PeqWB34ICJadcEnqA8c/plr+YDmTN4ORlSnZ5sEuo=;
	b=JiQ7wUgUr+b0B0Cg9uh8+HZOTJhmpE/hA+mSqEoaX7YJMVWE+nq7cKlr4ADcde+VkXlg
	 mmvtfBops1eH7B/Lifu+di96y3PXGPy8XiaYKjp7bHPV6QepiK27sCO6pe9KSRv6ym6tw
	 yqJl/FFKmx0ItTSZzwRwZHz4w9q16H/vEv49kLFjWaVXo3WP8GXtayx4s1ZFxcLJKSjZI
	 pvYG/UvowjUz3QXabr+lJ2Cgs6l+qvopM0LlStI+q+KQNTfNjzto9OYPwehXMcrSMKHnR
	 vukjhVEBrgi0q7SXm8iPYN3ZCy/ZnYeIt79HCOYbFpLLGlh8r8/J9Vs/h+hfMbNUMdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.4
Received: from out28-4.mail.aliyun.com (out28-4.mail.aliyun.com [115.124.28.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF1A606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:50:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACF1A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.08028989|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_news_journal|0.00576181-0.00014206-0.994096;FP=4452848093057234459|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam011083034076;MF=likunyu@open-hieco.net;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.kAltRSF_1795690199;
Received: from 172.18.25.145(mailfrom:likunyu@open-hieco.net fp:SMTPD_---.kAltRSF_1795690199 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 26 Nov 2026 18:49:59 +0800
Subject: Re: [PATCH v3 03/10] sched/pelt: Add a new function to approximate
 runtime to reach given util
To: Qais Yousef <qyousef@layalina.io>, Ingo Molnar <mingo@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: Juri Lelli <juri.lelli@redhat.com>, Steven Rostedt <rostedt@goodmis.org>,
 John Stultz <jstultz@google.com>, Dietmar Eggemann
 <dietmar.eggemann@arm.com>, Tim Chen <tim.c.chen@linux.intel.com>,
 "Chen, Yu C" <yu.c.chen@intel.com>, Thomas Gleixner <tglx@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20261126051429.14091-1-qyousef@layalina.io>
 <20261126051429.14091-4-qyousef@layalina.io>
From: Li kunyu <likunyu@open-hieco.net>
Message-ID: <e64956eb-393e-6fa7-3351-acffa4ee779e@open-hieco.net>
Date: Thu, 26 Nov 2026 18:50:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261126051429.14091-4-qyousef@layalina.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Qais,

On 2026/11/26 13:14, Qais Yousef wrote:
> +
> +/*
> + * Approximate the required amount of runtime in us required to reach @util.
> + */
> +u64 approximate_runtime(unsigned long util)
> +{
> +	struct sched_avg sa = {};
> +	u64 delta = 1024; // period = 1024 = ~1ms

Would it be clearer to name this period as the base unit? A delta of 1024
corresponds to one full period:

u64 period = 1024; /* one period = 1024 delta units */

> +	u64 runtime = 0;
> +
> +	if (unlikely(!util))
> +		return runtime;
> +
> +	if (unlikely(WARN_ON_ONCE(util > SCHED_CAPACITY_SCALE)))
> +		util = SCHED_CAPACITY_SCALE;
> +
> +	while (sa.util_avg < util) {
> +		accumulate_sum(delta, &sa, 1, 0, 1);

accumulate_sum(period, &sa, 1, 0, 1);

> +		___update_load_avg(&sa, 0);
> +		runtime++;
> +	}
> +
> +	return runtime * 1024;

return runtime * period;

> +}

Would the overall effect be better this way? Or is my understanding somewhat off?

-- 
thanks,
kunyu
