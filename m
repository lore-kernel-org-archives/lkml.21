Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795777892;
	b=Y/J9lZBZ1mIMcjVUakkrSTw9yDxeVXtsocvv7hfGCfg5hPG1BlSQ8QgjwRQkHfNDJbwg
	 Xt7t90W0zYVIvlUgtARlavKWp7homWjYKOIZvVUbufkrRGyl3WksA+YGLpHakSnBDlvbj
	 PTbxJ/ZIkh6hwWGCOi/jyapodkRy67zWhqyLoiU5sEmYXikFtb//SR07djkG+EO29K9je
	 hQyIwTZvtYu9jtV08Xc4Pl+asPy2v7a/m+J5Y6G7L8cpVpAPhlV0I7UBeCWdkbOChx9p/
	 FILDnf+X9VncAhKeXwGHQZibmTEsTVVVExMRZGzgneHUF+RLlh4jCP59W1h2KivrAEw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777892;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=98Pd4QGjIEPXVeUiRvi7TuihbBiAKIo2xCRvvcecKvA=;
	b=yp0vITFkWo9m5XDngeJ1S+RCNr/ql93CTg90Zfsyw2Ebxruazap4E7VyjhwPF7Mjws+Z
	 F1sZftUoP9bMZEJXXqVqNBVgDonJUDBLCXymkZoehnXy4HmEXOTMBlIRKa9xSvXA1/VYB
	 ErbhfpukmBYhQdz0EDAZXKxHghUIaTFZEEms6yglEPPGe4y6hJcQ/bGjo1XLJ88Hbb0ma
	 ypu5SoN4UIZwkhue9sQzze16wjV4ARZ4yBbs/w5RtjtKtlF9lDU3jr7UgBVE1PKnCqe3V
	 BDTGUgAgDKb9D6LuoqKa8M1ERCKde2LopTIpzBLzc7nLMoSb1BLruneZYEkh0r7SlRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sxgrW6z7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE373606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:11:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE373606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sxgrW6z7
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c5188e17487so343104566b.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:11:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795777890; cv=none;
        d=google.com; s=arc-20260327;
        b=VcvPr7nsahw/QiG5PyP4FOgdyO/EhKmU6s3oznn4SClVT8fcVLwe3Q1cQoJLwRDAlL
         ocN0qlqzEhSoAsgvc4M45bgiSnDHoXUAmW5ZZtYpJt08lHEy0OBGOPi/rnVSaNlmew04
         BL01bmAUN2gTLpDVArfGPPBVqKrs1irsCrnx2VyhsbqwNj21TtQ8Uie+tCy6kOA2ng7q
         qnhzsgs4+xNHgRREIB4GdI52DQamhiz4Zx3WmTPemQa3Dn37fgvywwS61ecTVJ70Atdj
         l0oCyyUrtqsqfTj+Uz4gBSPg+YIQhVXP12GVNysVD9d9GYzMn6SuCQa9TrgDP66tlZUV
         xslg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=98Pd4QGjIEPXVeUiRvi7TuihbBiAKIo2xCRvvcecKvA=;
        fh=XIZhluXyanZ7qa+fHS5NSZUl96KVUo6BgfBvFw+oPk4=;
        b=OSPaBguCd/0WD0k4vAc5NKFqDHVEE32Br3SNw3lLcfP4qpHnCgqLKpNk/2+w+pnEMM
         nbSFfS4KdBQVKu3dYmS3/88mtxyRTamXSn+Ws/0qI7x3CCinhXuCVQPda2rngxL1Rl3w
         78FlAoem4C/l2o4JlW2jxguZ8xsamhPK9Y6/wrZNe4dYz6Wec73NfJ7aPkayZifmNBt5
         L9KMdhUsYLiS7kd2YrWXy92DXuROZ7v7z9v/CyzyINV+4bK+6F2x1kt2Wk5ArjSeLHJr
         6GnWARjftWRmIapvAinzJgroNh7ugo1HPdf+XZgE7AFuT1QF0i1fKk/wopM3EqQgQWpP
         ybFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795777890; x=1796382690; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=98Pd4QGjIEPXVeUiRvi7TuihbBiAKIo2xCRvvcecKvA=;
        b=sxgrW6z7OlMEr3PpgDR1lSGrJ1Y4j68z1O0ikPEqhI2RiuhbK0BS++hq/3prVOv86Z
         ymJ5rutAwr6gOXn40W+pSexvtrTJRzdCjLuyMyIA42NYFBZ+x211oitxCkU3ifH9RL/e
         pf4VSuAvuK0aXYhDVKqAUy7m5B/TLR8y5EXY343MgwzOZJvqRWAF/fk372zMk3qOkP4w
         HmpNoT9+MxdKAYxhQf+i6UlnzaN4OZURuujvY1VwnOktwTn32JzU9gxJL3OhbG+e3CUy
         2tIqHnfwT3hIslmB4/LLgnQGkL5YSiUvMjNfpiz9YyIomLi7GYByEeUCFNoGyPUb6I/c
         61GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795777890; x=1796382690;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=98Pd4QGjIEPXVeUiRvi7TuihbBiAKIo2xCRvvcecKvA=;
        b=uTfmTD3Mx0Q+1O9XgczARQp/oo+x/dyDdkJDvzumPop2AUs0p2e4DRhCiy9lPW9oba
         Ov6mcNwZLpDtswrXO2r71zEUbPB09e8KSCe0LTkEvQ81UO0O6kmit7G+i+dT+yoYWZDO
         hKjeApbx537KAHYku0YV53LOoC70RNpXWbgMLze7ww9jy8AZ2ERYtukfXe8GdfRLiUaS
         I7xxo7k8xXBxgUMAX8sqPD1Cbb8o0gEuDfm+yoEy1s96MmbpFd7xtSnFIX22epMUifPH
         Ek1Kt/P4C4aJY7fIVtSNwiUIMxKkiICIK1xAyPC223I9fD2J4j9ezxzJqxxjtsndQthl
         KhWw==
X-Forwarded-Encrypted: i=1; AL+hErFTaJCTVjlydCpQXs+1at5iXbj4xtU5thTeatNDo287NjKHulEfuhXtHQXrwCbdnGPLTwyxVOa49aPE3rM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eBPeCHtx5FcEkH3Xgy2Ges3HHzOgtGVr30W/rAiJ9WJFs/plx
	lJF6AU+fF+gmlMSGQwMZ1ssqh6IzfXK3Ygg8LxvdORbcN0+Wx9xDmaQyVVHdd3DZVQQgj6F2V1D
	89cbx9y/PkqTyZ4DXWmU0HeuB30XKH2f9YtMP+ocnEA==
X-Gm-Gg: AZFdTZesU/ajoiw2iL/Kex7jCqXklRI92ZjE0duriEeP6wAtxdhpfPA8NKWWm3apEuc
	T/k+DBK0E7PvvUdqwbymyxpu4dv9U1U4olZ+tn/wzLxCPVxmUciUgTroeVzlh6mHjIniC9a5VEf
	Qaj7CsmRKx/MKFNvIlhLAQDADHbtuTiGEh0rWMxmmJSxA+dLdVotsYUUW/ogEIpaUkOAZ0ve16V
	1f18ZfERXTfW1SBDG9OalWMHYhp50DYIA6QQGiGBVo7JfUCKnJf9fOODfT8Yq5HwNr7vC9oMi7a
	gF1ke9rthf2GmV8Sp9h2SbtmIZzEe6ZShb/ibdF7dwOET3x5Tn3IauInau73Fm7NBIxQVI82+RV
	f/DzPsb4cU23Ny7jsCS8IiENUYDa1654z1PDZNC2j2hzkMKyiU4Ffv2VtaBGT7q9wqjil1ohafD
	8gl57RBFNZ3EmQhgM=
X-Received: by 2002:a17:907:7f91:b0:c50:c04d:cbb4 with SMTP id
 a640c23a62f3a-c513ac9f641mr2091220366b.43.1795777889836; Fri, 27 Nov 2026
 03:11:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261127094038.3422499-1-yu.c.chen@intel.com>
In-Reply-To: <20261127094038.3422499-1-yu.c.chen@intel.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 27 Nov 2026 12:11:17 +0100
X-Gm-Features: Aa3M54pobXKisx1cHaC-83D-nCxmcfAvNuIM6QnqY283U7jfhBf1M4QEW8Oj1pQ
Message-ID: <CAKfTPtBexuKgiVWWk2avKzVo2MpH=8BLE3b11nXDvoKqqopgSQ@mail.gmail.com>
Subject: Re: [RFC PATCH] sched/fair: Expand SIS_UTIL scan depth for small LLC system
To: Chen Yu <yu.c.chen@intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Ingo Molnar <mingo@redhat.com>, Andrea Righi <arighi@nvidia.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Valentin Schneider <vschneid@redhat.com>, James Buck <jbuck2005.linux@outlook.com>, 
	Usama Arif <usama.arif@linux.dev>, Tim Chen <tim.c.chen@intel.com>, Yi Lai <yi1.lai@intel.com>, 
	linux-kernel@vger.kernel.org, chen.yu@linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 27 Nov 2026 at 10:51, Chen Yu <yu.c.chen@intel.com> wrote:
>
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

Tested-by: Vincent Guittot <vincent.guittot@linaro.org>
Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>

> ---
>  kernel/sched/fair.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index da0d9e19c457..1c0e2ac7751d 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -12937,8 +12937,9 @@ static void update_idle_cpu_scan(struct lb_env *env,
>         y = SCHED_CAPACITY_SCALE - tmp;
>
>         /* equation [2] */
> -       y *= llc_weight;

nti: it's worth adding a small comment about the reason for the 32 below


> +       y *= max(llc_weight, 32);
>         do_div(y, SCHED_CAPACITY_SCALE);
> +       y = min_t(u64, y, llc_weight);
>         if ((int)y != sd_share->nr_idle_scan)
>                 WRITE_ONCE(sd_share->nr_idle_scan, (int)y);
>  }
> --
> 2.25.1
>
