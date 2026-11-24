Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542382;
	b=yPwfoExNbp6Y1BMMQ7bnkoA6U8vhvdNwf6hRWlGCf9niKilP6rLsZw4jLtbOU8F0KvYA
	 CBcQBhR3HHyjPY0N/ZCsB4zVnBuLn4lzL6tP3TZ2+7KcBFzm5PzIYnqueXdNu/C57T9z1
	 ENKvBwfD4lVBja4kaThOnL84H6oUgg+qs4I8IV1RBtHKs+rGo3SHzTpw/tNZBeXQLpvqk
	 RfiDwVBsodBZ1dN1toCzZy3K+IGqHidTN9sql6oEjPvtlIOozt0g32ee3oKklqp8l9XH6
	 mkZA9OrFmAqsug5g8QXDYj8ZlRbTvF376HVGK4LWnADN3q10vxFDgX1Wh3uHc7ZOvdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542382;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=4avrTBXIwI4Ug0xIZqAZV7idEBV34MIBg7/Dt/VHqac=;
	b=GN5U3d5C2k2J4D7QjRwedvgrhYTjgPG6VLrlYhPP1ns+eHD3E+z2SeED+1+yp0TvTOof
	 07uPlOZAe2qCZi6vf6+VHzmaqn5EmK4qKBGjcG2c/YpeN50nhAturf5o6csnrZ8JDytYm
	 8/PY5KLJlTKRN5rGtO7KNOaGZpzSrwylN6hDbtNuaaPPHaeaN7iEuDjjQuRE8lZ8oH8Ia
	 DQLpfwij1lhb+0iCHbeaU6lcxPJuzw06HbNYeNkDiUcyy6w8gGJiFwUImFzpJSxRnpGxw
	 k+W55G000hVS9r4YRhV/FjJJPinnDezbid+Li/ACcMTzfmcenSD4V8GPSqR+47norWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=v+k64sjb;
	arc=none smtp.remote-ip=95.215.58.129
Received: from mta1.migadu.com (out-129.mta1.migadu.com [95.215.58.129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D34E606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:46:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D34E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=v+k64sjb
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/7wknBEq6WBwj5CWotiHj8oj8kDn8ZpOZmB8EMdFznY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795542379; v=1; x=1796147179;
 b=v+k64sjbv7fBtKLfbTpoTPhh2gnEbJos7xs7OWfnl8uQ+l78eY2vs6K3bckbPG8RDkTqHM7G
 EwDZxJAF0cZwlg6xSBxdFj+Ck4ADYM1Jccu8XkNrAzIKFpEzF0dxGNPaW1B3oNByk3J0AfoBgdq
 tcYN50SRMVmzzjlbsI//C1lg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bebc83a82c657f29;
	Tue, 24 Nov 2026 17:46:18 +0000
X-Mizu-Trace-ID: bebc83a82c657f29
X-Migadu-Flow: FLOW_OUT
Date: Tue, 24 Nov 2026 17:46:19 +0000
From: Bradley Morgan <bradley.morgan@linux.dev>
To: Avi Weiss <thnkslprpt@gmail.com>, akpm@linux-foundation.org
CC: mcroce@microsoft.com, pmladek@suse.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] reboot: validate reboot CPU against the possible mask
In-Reply-To: <A62C877C-F65E-4BA1-AFCB-66B4E8961431@linux.dev>
References: <20261124082914.564587-1-thnkslprpt@gmail.com> <A62C877C-F65E-4BA1-AFCB-66B4E8961431@linux.dev>
Message-ID: <D198410C-400D-419F-833A-B11A76A2AD72@linux.dev>
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

On 24 November 2026 16:11:16 GMT, Bradley Morgan <bradley.morgan@linux.dev>
wrote:
>On 24 November 2026 08:29:14 GMT, Avi Weiss <thnkslprpt@gmail.com> wrote:
>>
>>reboot_setup() and cpu_store() compare CPU IDs with
>>num_possible_cpus(), which is a count rather than an upper bound.
>>With a sparse possible mask, this rejects valid CPUs and accepts
>>impossible IDs. reboot_setup() also narrows the parsed CPU number
>>to int before checking it, allowing large values to be truncated.
>>
>>Validate against nr_cpu_ids and cpu_possible() in both interfaces.
>>Use simple_strtoull() and unsigned long long for the boot option,
>>so the value is not narrowed before validation on 32- or 64-bit
>>kernels. Preserve the comma-separated reboot= syntax.
>>
>>Fixes: df5b0ab3e08a ("reboot: fix overflow parsing reboot cpu number")
>>Fixes: 2c622ed0eaa3 ("reboot: allow to specify reboot mode via sysfs")
>>Reported-by: Bradley Morgan <include@grrlz.net>
>>Link: https://lore.kernel.org/r/20260622154216.10064-1-include@grrlz.net
>>Suggested-by: Bradley Morgan <brads@mainlining.org>
>>Link:
>https://lore.kernel.org/r/D92156F5-5924-45CD-BCFE-AF385BDD15CF@mainlining.org
>>Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
>
>How did you account for this?
>
>https://lore.kernel.org/all/20260624174642.da2cc6912a9b19accd378538@linux-foundation.org/

ah crap, realised kstrtoul() chokes on the ,... tail. stupid mistake from
me.

yeah, ok


Reviewed-by: Bradley Morgan <bradley.morgan@linux.dev>

few questions, won't affect tag.

>
>>---
>>
>>v2:
>>- apply Bradley Morgan's unsigned parsing review, widening to 64 bits
>>  for consistent behavior on 32- and 64-bit kernels
>>
>>v1:
>https://lore.kernel.org/r/20261031060602.2949895-2-thnkslprpt@gmail.com
>>
>> kernel/reboot.c | 11 +++++------
>> 1 file changed, 5 insertions(+), 6 deletions(-)
>>
>>diff --git a/kernel/reboot.c b/kernel/reboot.c
>>index 9a84401adde5..f57b9aaef3f0 100644
>>--- a/kernel/reboot.c
>>+++ b/kernel/reboot.c
>>@@ -1144,12 +1144,11 @@ static int __init reboot_setup(char *str)
>> 			str += str[1] == 'm' && str[2] == 'p' ? 3 : 1;
>> 
>> 			if (isdigit(str[0])) {
>>-				int cpu = simple_strtoul(str, NULL, 0);
>>+				unsigned long long cpu = simple_strtoull(str, NULL, 0);

why this? I swear I suggested leaving it the same except from the unsigned
long.

>> 
>>-				if (cpu >= num_possible_cpus()) {
>>-					pr_err("Ignoring the CPU number in reboot= option. "
>>-					"CPU %d exceeds possible cpu number %d\n",
>>-					cpu, num_possible_cpus());
>>+				if (cpu >= nr_cpu_ids || !cpu_possible(cpu)) {
>>+					pr_err("Ignoring invalid CPU %llu in reboot= option\n",

i feel a follow up is clarifying this better. maybe a why?

>>+					       cpu);
>> 					break;
>> 				}
>> 				reboot_cpu = cpu;
>>@@ -1351,7 +1350,7 @@ static ssize_t cpu_store(struct kobject *kobj,
>struct kobj_attribute *attr,
>> 	if (rc)
>> 		return rc;
>> 
>>-	if (cpunum >= num_possible_cpus())
>>+	if (cpunum >= nr_cpu_ids || !cpu_possible(cpunum))

Ack.

>> 		return -ERANGE;
>> 
>> 	reboot_default = 0;
>>
>>base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
>>
>
>--- Thanks!

--- Thanks!
