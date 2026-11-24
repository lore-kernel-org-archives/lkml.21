Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795536684;
	b=mI2xgEwTCSWtEgWI01KlQjHiwlQW8kqBp/RightU0+Pv3rqF/qWCZs4rKyXrfiB+74PH
	 9wsJFuMVBJDnx2A10mF7noQPaxTQsvAKyUwa0ylc+oximhG8V0YYlY53puSewK77a52UG
	 armUYXCwY9NRSwN2xm9+DAEI2HgfU1P9L6NCTnip4AuqFIbwznVBzonxOAJowFn96Y6F9
	 AprzNwRCujJcL15lmUopeEKUTs0N1WKV/mBT+DOZZE3lcKSTYWUMBL28v+DvJ/y529W3k
	 qrLpZIq4qyL/mLn9I3jjPYX4eJLkEmlpwJJwzV1LMtnxV0Wf1xiG2HLT59K2tv19wZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536684;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=+S6bOIWa1Tp/7l4X7g3j7BgABxWUl4lAbrNlVqweKBc=;
	b=iUTIGW8eFLEauwzAMFstMYLKHAyZaRAy5Y8C6XJgJIGnkL2T+JuRR1PMjGsTaBc/qkGT
	 RzxNhRdVOsegTLTrxTpMMbuV3Ec/fYm/kW2geuZ1eG+744ABQqsE+Ikwr0lfNgxGTniE6
	 cAFcp66wp+QRWRWPbRrUVtp1Vm6tmsKD0iBddV1wNng0HQCZ23HjKScPQMop8e94d2Paj
	 muC5U7HmT1Yj8bBEx/q+tOC3knhPgKsafa0IFi3h4g5e/xzXkK2RPUNxIamdzCBCkGInM
	 26RGhSYdMK2CevS0Y/ko6FmPADCWs5ZNwZYhe7A0BhN9zwxgzQ2uXVPqEzIbXFeXfmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GWzrmpyH;
	arc=none smtp.remote-ip=95.215.58.92
Received: from mta1.migadu.com (out-92.mta1.migadu.com [95.215.58.92])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177EB606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 177EB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GWzrmpyH
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kuyOleWwDzCwOAbhTwZr+eYuB1feOA0aGQsbDGZDeFo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795536680; v=1; x=1796141480;
 b=GWzrmpyHHO86yvYXVhfz27BOT/z2HL9ff73l2/d4Gx3lLP0rfgwcmeq7+nyZ6FX3EXz4TjWC
 t2IiK3CluByzR/miI6rKBA+K2/O14L1ewDx8VlgpTsf0JOF98qze/s49wk5jp+wVNhLz9k3tG9s
 37jOpYBNwetruy/I2tRjY9IM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 35403d9553558573;
	Tue, 24 Nov 2026 16:11:20 +0000
X-Mizu-Trace-ID: 35403d9553558573
X-Migadu-Flow: FLOW_OUT
Date: Tue, 24 Nov 2026 16:11:16 +0000
From: Bradley Morgan <bradley.morgan@linux.dev>
To: Avi Weiss <thnkslprpt@gmail.com>, akpm@linux-foundation.org
CC: mcroce@microsoft.com, pmladek@suse.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] reboot: validate reboot CPU against the possible mask
In-Reply-To: <20261124082914.564587-1-thnkslprpt@gmail.com>
References: <20261124082914.564587-1-thnkslprpt@gmail.com>
Message-ID: <A62C877C-F65E-4BA1-AFCB-66B4E8961431@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 24 November 2026 08:29:14 GMT, Avi Weiss <thnkslprpt@gmail.com> wrote:
>
>reboot_setup() and cpu_store() compare CPU IDs with
>num_possible_cpus(), which is a count rather than an upper bound.
>With a sparse possible mask, this rejects valid CPUs and accepts
>impossible IDs. reboot_setup() also narrows the parsed CPU number
>to int before checking it, allowing large values to be truncated.
>
>Validate against nr_cpu_ids and cpu_possible() in both interfaces.
>Use simple_strtoull() and unsigned long long for the boot option,
>so the value is not narrowed before validation on 32- or 64-bit
>kernels. Preserve the comma-separated reboot= syntax.
>
>Fixes: df5b0ab3e08a ("reboot: fix overflow parsing reboot cpu number")
>Fixes: 2c622ed0eaa3 ("reboot: allow to specify reboot mode via sysfs")
>Reported-by: Bradley Morgan <include@grrlz.net>
>Link: https://lore.kernel.org/r/20260622154216.10064-1-include@grrlz.net
>Suggested-by: Bradley Morgan <brads@mainlining.org>
>Link: https://lore.kernel.org/r/D92156F5-5924-45CD-BCFE-AF385BDD15CF@mainlining.org
>Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>

How did you account for this?

https://lore.kernel.org/all/20260624174642.da2cc6912a9b19accd378538@linux-foundation.org/

>---
>
>v2:
>- apply Bradley Morgan's unsigned parsing review, widening to 64 bits
>  for consistent behavior on 32- and 64-bit kernels
>
>v1: https://lore.kernel.org/r/20261031060602.2949895-2-thnkslprpt@gmail.com
>
> kernel/reboot.c | 11 +++++------
> 1 file changed, 5 insertions(+), 6 deletions(-)
>
>diff --git a/kernel/reboot.c b/kernel/reboot.c
>index 9a84401adde5..f57b9aaef3f0 100644
>--- a/kernel/reboot.c
>+++ b/kernel/reboot.c
>@@ -1144,12 +1144,11 @@ static int __init reboot_setup(char *str)
> 			str += str[1] == 'm' && str[2] == 'p' ? 3 : 1;
> 
> 			if (isdigit(str[0])) {
>-				int cpu = simple_strtoul(str, NULL, 0);
>+				unsigned long long cpu = simple_strtoull(str, NULL, 0);
> 
>-				if (cpu >= num_possible_cpus()) {
>-					pr_err("Ignoring the CPU number in reboot= option. "
>-					"CPU %d exceeds possible cpu number %d\n",
>-					cpu, num_possible_cpus());
>+				if (cpu >= nr_cpu_ids || !cpu_possible(cpu)) {
>+					pr_err("Ignoring invalid CPU %llu in reboot= option\n",
>+					       cpu);
> 					break;
> 				}
> 				reboot_cpu = cpu;
>@@ -1351,7 +1350,7 @@ static ssize_t cpu_store(struct kobject *kobj, struct kobj_attribute *attr,
> 	if (rc)
> 		return rc;
> 
>-	if (cpunum >= num_possible_cpus())
>+	if (cpunum >= nr_cpu_ids || !cpu_possible(cpunum))
> 		return -ERANGE;
> 
> 	reboot_default = 0;
>
>base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
>

--- Thanks!
