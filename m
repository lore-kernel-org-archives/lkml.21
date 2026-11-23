Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.75
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795418934;
	b=LBoJeBC8BwB08zQyUQc9IPQ8ID3zMvdWAKTjdIFQJaHFtml6EjjyYuR9hB8wIYJXWMAl
	 FKlzWOIvaA2LX8OIkN1OnKbMbSURe8FgQhIabmpwIKbW+k4fdCD10CXghVpLDza2nKnfz
	 bbpJJxpensbg3m4hihowpxayrq1l+szaK4v+jFfpB4fH9gqqzlIQNCsYhNTOvpLq+MpLa
	 r/WblEikW6MEQh9yBgp9MvzSDgtcMV3cEYEaJZo/Iur23UGeb8fBtoKnuK3G0K4an9VT9
	 9LFmE9doLbAJgcSXi0se9PTxqL1TgOqW3FQ0MCfzdhQ/jaj2TExiMBBoDhzLtIDam3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795418934;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:Subject:To:Cc:References:
	 From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=tUPidA6EZCcz/d78WVQUDxzSE2iTdJGL2wlh1JnZtdM=;
	b=1fIeCALFROy09tXD3LyHbeMkKAAY2qKuHq3C2W/UbpxnTlCAVymCXXeQEgM2fv5p/+PD
	 Ab2Of5dZejzZdfw5GEqEyR/x5yrcjJmKlKOmyhIG+fVmv44kdrdEpprQLJ3vjh0fiePvo
	 LAG3jCqJk0iI5c0EYazvyT9BpWNY3bnJub1dCHZ5IhFGPVgtPMQD23nd7auknNbSR59za
	 ytqIXG1TRgp5y1TyZMBCLA+DekG6dO2XmXrafxfEKkcyGDKBWZLXMRZ/Il75ooCthrKGx
	 K5dU0wRvnH/2A/CGnniHQrud7QyjP/0Myt1he3JETzNppQ1HYXG6E6b9sg2E0P80miw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.75
Received: from out28-75.mail.aliyun.com (out28-75.mail.aliyun.com [115.124.28.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CA9606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:28:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3CA9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1211138|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_enroll_verification|0.00619622-0.000421743-0.993382;FP=13244471019873835198|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033032065030;MF=likunyu@open-hieco.net;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.k86r2ap_1795418917;
Received: from 172.18.25.145(mailfrom:likunyu@open-hieco.net fp:SMTPD_---.k86r2ap_1795418917 cluster:ay29)
          by smtp.aliyun-inc.com;
          Mon, 23 Nov 2026 15:28:43 +0800
Subject: Re: [PATCH v3 3/3] sched/fair: Drop the active CPU check from
 unthrottle_offline_cfs_rqs()
To: Qiliang Yuan <qiliang.yuan@linux.dev>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>
Cc: linux-kernel@vger.kernel.org
References: <20261120-bug-sched-fair-offline-active-v3-0-325e9eefa56d@linux.dev>
 <20261120-bug-sched-fair-offline-active-v3-3-325e9eefa56d@linux.dev>
From: Li kunyu <likunyu@open-hieco.net>
Message-ID: <1add44bb-c9a4-2bf2-6de0-a748648e99bc@open-hieco.net>
Date: Mon, 23 Nov 2026 15:28:38 +0800
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
In-Reply-To: <20261120-bug-sched-fair-offline-active-v3-3-325e9eefa56d@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 2026/11/21 10:57, Qiliang Yuan wrote:
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 731d78155e654..e366040f4fb4f 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -7859,10 +7859,6 @@ static void __maybe_unused unthrottle_offline_cfs_rqs(struct rq *rq)
>  
>  	lockdep_assert_rq_held(rq);
>  
> -	// Do not unthrottle for an active CPU
> -	if (cpumask_test_cpu(cpu_of(rq), cpu_active_mask))
> -		return;
> -

Per patch 2, this check is no longer needed.

-- 
thanks,
kunyu
