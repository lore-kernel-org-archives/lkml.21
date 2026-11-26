Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688522;
	b=1Y74ey+XqERqPXPDckLsrsRl4nZpKNMb3JPGFsJQmKjssj/VY0MbiIcPOxnZLYIEh3AJ
	 TmWlY14XhGF7MT+BZOap0T3RdXHscqUfNR7+FWTtrsaxsX6Mbjm/Db03D0PAnQ1RYJFZ3
	 E4qcNzRKv8CpCHbi5jNQwvVjUEgTu0Y261t4+Zp6zno7lfz7vvwbqwBlSXOzB6Kh1SCN5
	 KwXBJHIeyRDrhmvJwq4QVNutKpwKnzzSwFc6TIf8NcT8xQhBsLRmFvxRpqEkOL30PRTzc
	 IKziAnUnfJ+jehw+yybo3KSQytuT6x9eu1K6qiw0B2PNmRcKyAyHomx7DPsPpIlRjrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688522;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=/HN5Oid87KZ1UD/wdD52UhmT1nmCHZ1TRAIR8tvOh2M=;
	b=Y90tHyusP5aQD+QmxGUWgx8NEcQgdXxZFP0LsYLfIstLkVifVYKS5W+iVRnGms2ZAqVk
	 bj44+5tNl01/HG90E2ppeVbaehmuWEUfJDVvJP6EqT2G2ZifvwE0yMuIE8w/+TfNpOSN0
	 QJmlg/wt0nGv2dh7ZhmNyflSGYpx7gzXHmvA7fHWfuW6XHzyPYQcNu9DlRaq7T7S7TWBv
	 HDwrLhE0MTdGFCUj/KzW+ylp6sdJOXP8RXfD9llwICZZywaEouhKdl5OhLRfn04ZiG49H
	 I59CLPxF9QZRK2v53YU7ARItinQ0vb3GXTi/p69XNdqEuP5mSriQYTT7pwfT8Fw4Yug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=cPvNv0hE;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA3F1606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:22:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA3F1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=cPvNv0hE
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1DD2F1BA8;
	Thu, 26 Nov 2026 02:21:57 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 15D133F86C;
	Thu, 26 Nov 2026 02:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795688519; bh=n9K4p8/F3VmtWDVOdaOe+f8q5Aq6mjeHJReQa1J1s5Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cPvNv0hEynkrWOOaA8TmOEaPK6UAqpsuL6HCvsVyJildD+dzukAovLaRVPH79K70N
	 4/Vcj0Mm/LMuV09HGYhIGE3Z7kucK++zIb+DRc1rlqbeoA5Yp2NFu9+J/zNrlyGRXX
	 p28V91wz+a1dVilO2tpE3ti5Il9DzEA8BNT0U7rQ=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Vlad Poenaru <vlad.wing@gmail.com>,
	Amir Ayupov <aaupov@fb.com>,
	Suyash Mahar <smahar@meta.com>,
	Song Liu <song@kernel.org>,
	Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: perf: End AUX output when an event is throttled
Date: Thu, 26 Nov 2026 10:21:49 +0000
Message-ID: <179568849229.76239.2933508660598702367.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124-arm_cs_fix_throttling_oops-v1-1-3ad1dfad0159@arm.com>
References: <20261124-arm_cs_fix_throttling_oops-v1-1-3ad1dfad0159@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 24 Nov 2026 12:00:25 +0000, Leo Yan wrote:
> Perf throttles a group by calling each event's PMU stop callback with
> flags set to zero. On a CPU with a trace path, ETM stops tracing and
> leaves the AUX transaction open because PERF_EF_UPDATE is clear. When
> perf unthrottles the event, perf_aux_output_begin() warns because
> aux_nest is still set.
> 
>   [  181.161897] ------------[ cut here ]------------
>   [  181.161906] WARNING: kernel/events/ring_buffer.c:415 at perf_aux_output_begin+0x1dc/0x1f0, CPU#0:2
>   [  181.234120] arm-scmi arm-scmi.1.auto: timed out in resp(caller: do_xfer+0x1a0/0x558)
>   [  181.234223] cpufreq: __target_index: Failed to change cpu frequency: -110
>   [  181.286675] Modules linked in: panfrost tda9950 hdlcd tda998x drm_shmem_helper drm_client_lib cect
>   [  181.314139] CPU: 0 UID: 0 PID: 352 Comm: perf Not tainted 7.1.0-rc1-00058-gdca922e019dd-dirty #11
>   [  181.323915] Hardware name: ARM LTD ARM Juno Development Platform/ARM Juno Development Platform, B5
>   [  181.334732] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>   [  181.341721] pc : perf_aux_output_begin+0x1dc/0x1f0
>   [  181.346547] lr : perf_aux_output_begin+0x9c/0x1f0
>   [  181.351280] sp : ffff800080003be0
>   [  181.354606] x29: ffff800080003be0 x28: ffff0008023fc000 x27: ffff4b45d287f000
>   [  181.361789] x26: ffff0009764787a8 x25: 0000000000000000 x24: ffff00080dc99710
>   [  181.368970] x23: ffffb4c334553000 x22: 0000000000000001 x21: ffff00080dc99710
>   [  181.376151] x20: ffff0009764787a8 x19: ffff000801cc6000 x18: 00000000ffffffff
>   [  181.383332] x17: 0000000000000000 x16: ffffb4c3a118c998 x15: 0000000000000000
>   [  181.390512] x14: 00003d0900000000 x13: 00000001ffff006e x12: 696765625f747570
>   [  181.397692] x11: ffffb4c3a52758d8 x10: 0000000000000108 x9 : ffffb4c3a117f620
>   [  181.404873] x8 : ffff800080003a58 x7 : ffff000808de4000 x6 : 00000000000fffff
>   [  181.412053] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
>   [  181.419232] x2 : 0000000000000007 x1 : 0000000000000000 x0 : 0000000000000007
>   [  181.426411] Call trace:
>   [  181.428868]  perf_aux_output_begin+0x1dc/0x1f0 (P)
>   [  181.433692]  etm_event_start+0xdc/0x290 [coresight]
>   [  181.438665]  perf_event_unthrottle+0x70/0xa8
>   [  181.442964]  perf_event_unthrottle_group+0x40/0x170
>   [  181.447871]  perf_adjust_freq_unthr_events+0x178/0x1a8
>   [  181.453038]  perf_adjust_freq_unthr_context+0x74/0xf8
>   [  181.458120]  perf_event_task_tick+0xa8/0x290
>   [  181.462418]  sched_tick+0x144/0x2c8
>   [  181.465937]  update_process_times+0xc0/0x198
> 
> [...]

Applied, thanks!

[1/1] coresight: perf: End AUX output when an event is throttled
      https://git.kernel.org/coresight/c/b7d7462c7f97

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>
