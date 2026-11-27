Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795783799;
	b=a+An4b7xakJnrToi/v3SL6ohdr7H1tRx9o9B8Pl6jNRDdCHf81pG2T8RQ9rokuhERBy5
	 bUi66oNwFv2DIrO4wrzrB3dbZc+bQI1RG7X4DWCnU/eMYNujZod5rv4cAxFe57fOt8LmB
	 5FKqgCgjjs/6JsJUtf6Qh6MEULjjCki4/R4DCLEDxo8HYaiMwZclYmBw2xrudUIuJ5Kq8
	 13rSlg8x15KNiTfc4SkPi4givQNYl5gi23qloXV8irFBvEz593rsiODkgnmCL00pDTQPE
	 sw5Oqip8JOOdeBDFJJ0c5pX8p+LyEyLeMoMc1JBtavlr/2QCtVyER+5MRX627ggNLjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795783799;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ZO6heAT78+KsCatcg/QiXuriBp3MVsbrgd2xihHsQMU=;
	b=RlFWttZj8T07R7Q5rEmNuXWMR+aOihNW45SifKMSNDcadneLRtNEuGifLPenXd1Na26I
	 5LqvjMpOTDZfTCyszXrWo9Qez/FUpVi7vWHTLsLCRZZ5yggi7CkV3H59UcBty42OV+ZkI
	 d2bRla5Ty14TyN8szHG05wfRjsPaTg1hUGBAL5+5/IdXlsezBHpvncObuTBWIKY5N7laz
	 l6b0JEctOPYIB+in5BUacPXbmW4IFrRXVe7veQ3ryE0v29xm9TIUDaM1SEd2c6kQsozlq
	 BH/Vm3XJDlllKbYeZjX/yImd3wkSZx769bMWLHs/NYK6+HmylSC8qPm1GzRXYcxe8kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Je6ZFcnm;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32B38606A333
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:49:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32B38606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Je6ZFcnm
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1FD271756;
	Fri, 27 Nov 2026 04:49:55 -0800 (PST)
Received: from [10.57.71.101] (unknown [10.57.71.101])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EAFC53F86C;
	Fri, 27 Nov 2026 04:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795783798; bh=/AC/MACE14zg+3HZS4lHrcjWXcpILpkhdyf+BtiTdig=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Je6ZFcnmUhJJIaD0YZ0HP38/RVpw29Vp3lxcLDZaFAQAnTaYsCFhfxXtTSaUVOI36
	 +8OLtYzXdVp2kJhfWRxxDG4uZmmi8H5PaNCL80j7e9v9jks3qiwJIZ00ycBmOphFwW
	 1qfzm/6RSdbDEQ8GnP2gay0t6EGPfdQD7gJSM12c=
Message-ID: <20410c3b-3057-4cee-9dd6-5c3f69ac0a27@arm.com>
Date: Fri, 27 Nov 2026 12:49:52 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] sched/fair: Expand SIS_UTIL scan depth for small LLC
 system
To: Chen Yu <yu.c.chen@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 K Prateek Nayak <kprateek.nayak@amd.com>, Ingo Molnar <mingo@redhat.com>
Cc: Andrea Righi <arighi@nvidia.com>, Juri Lelli <juri.lelli@redhat.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Valentin Schneider <vschneid@redhat.com>,
 James Buck <jbuck2005.linux@outlook.com>, Usama Arif <usama.arif@linux.dev>,
 Tim Chen <tim.c.chen@intel.com>, Yi Lai <yi1.lai@intel.com>,
 linux-kernel@vger.kernel.org, chen.yu@linux.dev
References: <20261127094038.3422499-1-yu.c.chen@intel.com>
From: Christian Loehle <christian.loehle@arm.com>
Content-Language: en-US
In-Reply-To: <20261127094038.3422499-1-yu.c.chen@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/27/26 09:40, Chen Yu wrote:
> It was reported that scanning more CPUs on a system with a small LLC
> benefits the workload more than limiting the scan depth, because
> scanning more CPUs does not cost much and work conservation is
> preferred.
> 
> Expand the scan depth so that systems with fewer than 32 CPUs per LLC
> behave like a 32-CPU system. This way, the scan number can be scaled up
> for such small systems.
> 
> The effect is as below:
> nr_idle_scan before -> after the patch
> (LLC = 8, 12 and 16 CPUs for example)
> Cell format: util_sum : nr_scan before -> after
> Load% = util_sum / (llc_weight * 1024)
> 
>   Load% | LLC=8            | LLC=12           | LLC=16
>   ------+------------------+------------------+------------------
>    10%  |   819 :  7 ->  8 |  1228 : 11 -> 12 |  1638 : 15 -> 16
>    20%  |  1638 :  7 ->  8 |  2457 : 11 -> 12 |  3276 : 15 -> 16
>    30%  |  2457 :  7 ->  8 |  3686 : 10 -> 12 |  4915 : 14 -> 16
>    40%  |  3276 :  6 ->  8 |  4915 :  9 -> 12 |  6553 : 12 -> 16
>    50%  |  4096 :  5 ->  8 |  6144 :  7 -> 12 |  8192 : 10 -> 16
>    55%  |  4505 :  4 ->  8 |  6758 :  7 -> 12 |  9011 :  9 -> 16
>    60%  |  4915 :  4 ->  8 |  7372 :  6 -> 12 |  9830 :  8 -> 16
>    65%  |  5324 :  3 ->  8 |  7987 :  5 -> 12 | 10649 :  6 -> 13
>    70%  |  5734 :  2 ->  8 |  8601 :  3 -> 10 | 11468 :  5 -> 10
>    75%  |  6144 :  1 ->  7 |  9216 :  2 ->  7 | 12288 :  3 ->  7
>    80%  |  6553 :  1 ->  4 |  9830 :  1 ->  4 | 13107 :  2 ->  4
>    82%  |  6717 :  0 ->  2 | 10076 :  0 ->  2 | 13434 :  1 ->  2
>    84%  |  6881 :  0 ->  1 | 10321 :  0 ->  1 | 13762 :  0 ->  1
>    85%  |  6963 :  0 ->  0 | 10444 :  0 ->  0 | 13926 :  0 ->  0
>    86%  |  7045 :  0 ->  0 | 10567 :  0 ->  0 | 14090 :  0 ->  0
> 
> It was reported that with this change, the regression was fixed on Orange
> Pi 6 and Radxa O6. Since Intel servers usually have >= 32 CPUs per LLC,
> this change does not impact Intel servers much. AMD servers have 16 CPUs
> per CCX, testing on AMD Milan showed no significant difference on
> redis/mysql, and a slight improvement on hackbench/schbench:
> 
>   =========================================
>   hackbench threads+pipe
>     num_runs:      5
>     host:          AMD-Milan
>     kernel:        7.4.0-rc4-sis-patched+
>   =========================================
>   G   FD  | baseline s/se% | patched s/se%  | SPEEDUP | RESULT
>   ------------------------------------------------------------------
>   1   1   |   6.352/ 7.57% |   5.680/ 5.74% |   1.12x | noise
>   1   2   |   6.225/ 8.75% |   5.624/ 7.27% |   1.11x | noise
>   1   4   |   8.834/10.23% |   8.799/10.24% |   1.00x | noise
>   1   8   |   4.833/ 1.70% |   5.060/ 1.72% |   0.96x | noise
>   1   16  |   5.471/ 1.61% |   5.551/ 0.60% |   0.99x | noise
>   1   20  |   5.220/ 1.17% |   5.298/ 0.82% |   0.99x | noise
>   2   1   |   5.558/ 6.23% |   6.114/ 8.63% |   0.91x | noise
>   2   2   |   8.056/10.44% |   8.029/12.53% |   1.00x | noise
>   2   4   |   5.292/ 1.26% |   5.152/ 1.89% |   1.03x | noise
>   2   8   |   5.493/ 2.15% |   5.403/ 3.38% |   1.02x | noise
>   2   16  |   5.557/ 1.68% |   5.407/ 0.88% |   1.03x | noise
>   2   20  |   5.224/ 0.68% |   5.341/ 1.19% |   0.98x | noise
>   4   1   |   6.047/ 2.89% |   5.797/ 4.41% |   1.04x | noise
>   4   2   |   5.597/ 2.19% |   5.791/ 1.77% |   0.97x | noise
>   4   4   |   5.397/ 1.62% |   5.501/ 1.18% |   0.98x | noise
>   4   8   |   5.468/ 2.67% |   5.155/ 0.95% |   1.06x | IMPROVED
>   4   16  |   5.989/ 3.31% |   5.507/ 1.36% |   1.09x | IMPROVED
>   4   20  |   5.267/ 0.79% |   5.101/ 0.60% |   1.03x | IMPROVED
>   8   1   |   5.322/ 3.12% |   5.273/ 1.96% |   1.01x | noise
>   8   2   |   5.531/ 2.38% |   5.367/ 1.64% |   1.03x | noise
>   8   4   |   5.672/ 0.70% |   5.814/ 2.60% |   0.98x | noise
>   8   8   |   5.037/ 0.93% |   5.100/ 0.97% |   0.99x | noise
>   8   16  |   5.455/ 0.45% |   5.290/ 0.39% |   1.03x | IMPROVED
>   8   20  |   5.388/ 0.36% |   5.285/ 0.18% |   1.02x | IMPROVED
>   16  1   |   5.519/ 2.49% |   5.296/ 2.10% |   1.04x | noise
>   16  2   |   5.398/ 0.77% |   5.503/ 3.05% |   0.98x | noise
>   16  4   |   5.274/ 1.72% |   5.363/ 1.72% |   0.98x | noise
>   16  8   |   5.416/ 0.37% |   5.185/ 0.20% |   1.04x | IMPROVED
>   16  16  |   5.596/ 0.41% |   5.337/ 0.24% |   1.05x | IMPROVED
>   16  20  |   5.292/ 0.88% |   5.076/ 0.55% |   1.04x | IMPROVED
> 
>   redis (redis-benchmark -t set)
>   =========================================
>   THR | baseline rps/se% | patched rps/se% | SPEEDUP | p99 ms b/p  | RESULT
>   -----------------------------------------------------------------------
>   4   |  1492165/ 0.76% |  1480823/ 0.00% |  0.992x | 0.541 0.546 | noise
>   8   |  1665556/ 0.01% |  1665501/ 0.00% |  1.000x | 0.490 0.489 | noise
>   16  |   984279/ 0.60% |   974545/ 0.00% |  0.990x | 1.124 1.109 | noise
>   32  |   887091/ 0.01% |   883212/ 0.44% |  0.996x | 1.713 1.721 | noise
> 
>   mysql
>   =========================================
>   THR  | baseline tps/se% | patched tps/se% | SPEEDUP | p95 ms b/p | RESULT
>   -----------------------------------------------------------------------
>   8    |   151897/ 0.76% |   152428/ 0.54% |  1.003x | 0.07 0.08 | noise
>   16   |   294014/ 0.59% |   296699/ 0.28% |  1.009x | 0.07 0.07 | noise
>   32   |   386817/ 2.18% |   377835/ 0.31% |  0.977x | 0.09 0.09 | noise
>   64   |   560950/16.97% |   481494/ 5.68% |  0.858x | 0.19 0.23 | noise
>   128  |   752079/ 4.92% |   729685/ 3.89% |  0.970x | 0.36 0.38 | noise
>   256  |   772771/ 0.62% |   771630/ 0.21% |  0.999x | 0.79 0.78 | noise
> 
>   schbench
>   =========================================
>   T   WRK  METRIC   | baseline/se%   | patched/se%    | SPEEDUP | RESULT
>   -----------------------------------------------------------------------
>   2   8    rps      |  1683.8/ 0.04% |  1681.3/ 0.10% |  0.999x | noise
>   2   8    wake_p99 |    10.2/ 1.96% |     9.8/ 3.82% |  1.041x | noise
>   2   8    req_p99  |  4904.0/ 0.00% |  4904.0/ 0.00% |  1.000x | noise
>   4   16   rps      |  3369.0/ 0.03% |  3353.9/ 0.44% |  0.996x | noise
>   4   16   wake_p99 |    10.0/ 0.00% |    10.0/ 0.00% |  1.000x | noise
>   4   16   req_p99  |  4904.0/ 0.00% |  4904.0/ 0.00% |  1.000x | noise
>   8   32   rps      |  6724.6/ 0.04% |  6722.0/ 0.16% |  1.000x | noise
>   8   32   wake_p99 |     9.8/ 2.04% |    10.0/ 0.00% |  0.980x | noise
>   8   32   req_p99  |  4904.0/ 0.00% |  4904.0/ 0.00% |  1.000x | noise
>   16  64   rps      | 10933.0/ 4.10% | 11179.8/ 1.80% |  1.023x | noise
>   16  64   wake_p99 |    12.0/ 0.00% |    12.0/ 0.00% |  1.000x | noise
>   16  64   req_p99  | 10051.2/ 0.13% | 10051.2/ 0.08% |  1.000x | noise
>   24  96   rps      | 12970.1/ 0.22% | 12971.0/ 0.48% |  1.000x | noise
>   24  96   wake_p99 |    13.4/ 3.81% |    12.4/ 1.98% |  1.081x | noise
>   24  96   req_p99  | 10179.2/ 0.21% | 10185.6/ 0.21% |  0.999x | noise
>   32  128  rps      | 12613.1/ 0.09% | 12667.2/ 0.11% |  1.004x | IMPROVED
>   32  128  wake_p99 |    37.2/ 3.55% |    34.2/ 1.43% |  1.088x | IMPROVED
>   32  128  req_p99  | 10467.2/ 0.59% | 10358.4/ 0.06% |  1.011x | noise
> 
> Fixes: 61ea17a63719 ("sched/fair: Add SIS_UTIL support to select_idle_capacity()")
> Reported-by: James Buck <jbuck2005.linux@outlook.com>
> Closes: https://lore.kernel.org/lkml/CY5P221MB09262B7D6A68954CC1B3199FBD442@CY5P221MB0926.NAMP221.PROD.OUTLOOK.COM/
> Suggested-by: Vincent Guittot <vincent.guittot@linaro.org>
> Tested-by: James Buck <jbuck2005.linux@outlook.com>
> Signed-off-by: Chen Yu <yu.c.chen@intel.com>
> ---
>  kernel/sched/fair.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index da0d9e19c457..1c0e2ac7751d 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -12937,8 +12937,9 @@ static void update_idle_cpu_scan(struct lb_env *env,
>  	y = SCHED_CAPACITY_SCALE - tmp;
>  
>  	/* equation [2] */
> -	y *= llc_weight;
> +	y *= max(llc_weight, 32);
>  	do_div(y, SCHED_CAPACITY_SCALE);
> +	y = min_t(u64, y, llc_weight);
>  	if ((int)y != sd_share->nr_idle_scan)
>  		WRITE_ONCE(sd_share->nr_idle_scan, (int)y);
>  }

Reviewed-by: Christian Loehle <christian.loehle@arm.com>
Tested-by: Christian Loehle <christian.loehle@arm.com>

Also agreeing with Vincent's nit.
