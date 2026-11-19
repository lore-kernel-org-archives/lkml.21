Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795059952;
	b=tkjiaEd40aN3y/a1h1LQefGhlhPOA5XZ50yDfimwqYJmpiQR8gravyOrj1l/poD8FzTl
	 juGh3J5y6QkGB+miIcLH7bsOEB28Z+10yb1z62nn0c9omZoHs56CQsw4eiUPHvbGlZZHs
	 63HXu9iM7DpZKGkBel5BeZ1NPpgFbzE6qjjgUfXwI7LgBUdQaag+B4/2ruhmMi1jhh5hT
	 RUG0IPtuWrg6NQ3HGTwLoB2yQsoWLRZx7ylW02RLUNTd4i+3GD9tOooEobusyp/rQyRX/
	 pJHrbNUWN0yYpfTef3Hos/1YDp6fEiYgBVGc5/i9krL1eaAcirVqSmX6lCJF9kqfN9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795059952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=8qLgOCLTulYn1+d3HKH9PJ+ODujlzAUfUScnoc6M1Q4=;
	b=rFZrcPHiyXTpYrwxpguXgjUv/AOyLI1hya6yAakEB4O4HZQsazgr6Lo+0HFt1zeamtMf
	 ml0ILjXKBrbNYWLSyg1Y7H72g+TVRzz5ydNrd+gzBhV/27OMsGQpfHGM5rc8aLoCLtij5
	 MPjOMLlKkn2wIhGszAU3FFzQnpqX6hbzkYcQxN+iQeScsSr5RT6r5jo/M6xjk8mS1Aw3e
	 QrE32sdcXQRxGgYJcNMvfif/5pgw5zoWit4rHtvorGtvaT4PCfl9zlWNGxlj9DwQ8B6xF
	 zt8VKnbvKdQp8syQK1+R8GejOLDUAUAl06c5eRo/ufyN/aZZSLVCEMpjvthY1QPm2jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cbOzaWcX;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F89760A2603
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:45:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F89760A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cbOzaWcX
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8b5a6f2f27fso873961b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795059951; x=1795664751; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8qLgOCLTulYn1+d3HKH9PJ+ODujlzAUfUScnoc6M1Q4=;
        b=cbOzaWcXbcVheE/8dJiWdbmV7ND1PTau00PwNAkfFFOgzBe0y3gTkUsXRdkoVIeOHO
         VrcxSXC5ebaT4qrKtimClxvPuslbSxyhKy9GASjTFGTFu2dcelOi9xyVsdBxAc/hzED5
         oRhUxwnUbIIzsswiB/TLHTAPyWXMvfL73E0GTCffu3VCxY9XbaDiaVpf2YbrHmH7mU+y
         gu8nfT1P4y4gqTAUKJYFBhyh+rnujd43p134tcyfWD+xBMAY7N8eXQofxNUtsVcE0Ev6
         fWN/ptHi/ZQ5Zgeq9h2Uk73ZFPdC1iZ4gXD+RZQh8QAxb8WNd/rV60t3Gpci0oklxgKB
         ivZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795059951; x=1795664751;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8qLgOCLTulYn1+d3HKH9PJ+ODujlzAUfUScnoc6M1Q4=;
        b=cBPLfOzyPyy4Yk0bRLlg1xA5ObInjpR8VT3KmIpZPIIMVHhsBxfWv9NzHc1bcZROq5
         a8CA5zvjCX8PcY4DQNLNwdH/4pJWORZX6CE3Gu/g2mD1WqxVSRcuwrZPSjc+VteqA+zT
         Pfy8B3DdUuXLqzrHTz3HPbTzk7j8ljOwmTgB+QwyZF5/z/K3uYTXVjtRRPZrz+OpI32K
         y1Ap7EmCdgDOPks13IRYPnG54difY9cP7Fo2/ftaGLrfioqwpGNWST9Kj53CfNCbJDaU
         guUjEL69e3P4g52CJsHOjY1wktPLKxMvPSGB8p21ZRwEie+jMJgNZDPoczoaFfBW79fU
         73+g==
X-Forwarded-Encrypted: i=1; AL+hErEEqOavJ/HfjVDIsk6EqKaSHzrijOGvPq3owL0zBJqKcoqwcchNKFYVE52fAjQMXo/u54psJc9JRtA3nkM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zPf7foFAoIUWbJcoT5jJJQxqGd5d5kpZM1x8Qnbx4QBYZCQMp
	aWq5fVbRzH90vuUSpBNXu71d3nQYwTBNRdrQcWd0emKl4uI69AJfQ0xb
X-Gm-Gg: AYBFou1o0plbdffJGebaDxWhHKNnhsLU+pWJdk6QJPLlW3gUJSwlFEbidiRCqvZtAig
	74B1IV0W3ePCPXd0GTH0nQ8Gn8txrd02TkdlNUcuV8IJgE/rYMfjxSwzAd39b9nWUFn7Drz0yD8
	GboIjPxzGAW71CdK/Oi1FCKnQDzZ0r0plifUKCbbB6kibNuTxeVEf7o53BtI6azi9NxUNDTYRsI
	dAR8SF4pVDJmr576bt2hwGIC8fRTy69owckstx/EBQhb+iiA2ASHIDyRz9vs6mXlgqe9qC/Jq0H
	nrA3uCBKmbxoLI3q8Y/oxBnGTWsQjk4SRdJAn0UvB1bD5HF/x1xFEg0/nPu4gojaK8MOCTRvyey
	+4ZIhRrY2ApkAAcUWyO7FDlJZg8c8tVLiGxCiS/RGE4ENl7rz6ZvLBTJ8MT/ym5qPeSTBfYmAGF
	UWqyyRWDLRDpvVdtkM4nEKySMk5Jh9Sml6wy7REjt9JQmdyGVvLnm5APLX0psSnqDeg73GGnBqT
	SmyW/+bjEdXrdkDhN94pD9gtkgKOhQqR1gtVJIMJ1miRHzGC13mLLBwuk+rQGMhGiJaxMsEbKB0
	4tXP0+p0bbT8tZmJoL3T3mfpHseK9AYbtIgOQ/48BPmxIznrx4UjAzeDEn8CU3CatIiQ/7OLxy3
	wmiQKP+75V4n+ay1Kl0GPwWK2wnopqxuoVdmj
X-Received: by 2002:a05:6a21:2d43:b0:3eb:99a9:d3a8 with SMTP id adf61e73a8af0-3fe8b6e4faamr4692271637.64.1795059951330;
        Wed, 18 Nov 2026 19:45:51 -0800 (PST)
Received: from localhost ([153.61.198.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca5bf959sm2028068b3a.20.2026.11.18.19.45.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 19:45:50 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Nov 2026 03:45:50 +0000
Message-Id: <DMYVN8WPV380.3ID1QHDI7BKUS@gmail.com>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Song Liu" <song@kernel.org>, "Yonghong
 Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "Emil Tsalapatis"
 <emil@etsalapatis.com>, "Barry Song" <baohua@kernel.org>, "Shuah Khan"
 <shuah@kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2] selftests/bpf: Fall back when
 memcg_proactive_reclaim data lands in shmem
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Hui Zhu" <hui.zhu@linux.dev>, "Kurt Lin" <lylin1023@gmail.com>, "Hui
 Zhu" <zhuhui@kylinos.cn>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>,
 <bpf@vger.kernel.org>
In-Reply-To: <79797479-029f-4e9b-8076-6a92a2a70cdd@linux.dev>
References: <20261117170704.1146730-1-lylin1023@gmail.com> <DMY136RTAL9Q.2WQSZ57W1YLV2@gmail.com> <79797479-029f-4e9b-8076-6a92a2a70cdd@linux.dev>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, Nov 18, 2026 at 07:04 PM Hui Zhu <hui.zhu@linux.dev> wrote:
> What about two things: only check when the test fails, and check
> KPF_SWAPBACKED instead of f_type?

It's still overkill. 50 lines instead of one more compare per test.
It doesn't cover arena_memcg. The failure there is a dead child,
and its O_TMPFILE is gone.

> 1. Check only when the test fails.
> What the test needs is "these pages are reclaimable", not "these pages
> are not shmem": with swap available shmem reclaims fine, and then
> reclaimed == 0 is a real regression that must not be skipped. So probe on
> the failure path only -- nothing is paid when the test passes, there is
> no polling, and a regression cannot be masked.

It can. Kurt's guest has no swap, and /tmp is overlayfs over tmpfs.
Make bpf_proactive_reclaim() return 0 there:

  skel->bss->reclaimed      0
  si.totalswap              0
  file_is_shmem(data_fd)    1    -> test__skip()

With the f_type check workload_dir() moves on to "." and the test
fails as it should.

Swap alone is not enough either. The prog passes swappiness -1.
With vm.swappiness == 0 get_scan_count() doesn't scan shmem:

	if (cgroup_reclaim(sc) && !swappiness) {
		scan_balance = SCAN_FILE;

So reclaimed == 0 with swap on is not always a regression.

> 2. Probe with KPF_SWAPBACKED.
> f_type is a blacklist, so the next stacking filesystem repeats this.
> shmem-ness is a property of the pages rather than of the mount, so ask
> the pages: /proc/self/pagemap for VA -> PFN, /proc/kpageflags for
> PFN -> flags, then test bit 14.

Bit 14 doesn't replace f_type. ramfs pages are unevictable and not
swapbacked. file_is_shmem() returns 0 and the test fails.
Let's deal with the next stacking fs when somebody hits it.
