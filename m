Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017613;
	b=RNuZhtiEIGJNhROmSj1bfIKsw5mg9b3TVJxGBvNgb5UR/YoNSyQ6WSzIQg5JEZf33nDR
	 jS9cGelss7PzI377+KsR0Dd3W8tDl7fmN2dQsClwfAWylPmgWE88Pn5phwwYt915soPGm
	 DjUL9uDpnTxf/gOktSJe1AOwX5E03dETR3YgRgwVVWnXzaMOPQiJXQaO6egjYgz/10oGX
	 p2Gr6rFP6FmPitPnarnHQnWK5XtLy4ZN6efdjN4JYOJ0R/siKBLwFH0CEsvcWLMm2DQQs
	 p/dWOFGCIYdiOznjz30/Vy6NgUTC6yzlb+LF7h42XPVskS8solDqD2cL5soFLNqp/sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=gN7nvCApkpNJjBBl+gdS00SQSe9taX0A7DICocon5Uk=;
	b=ewask2U0IAuGRpR+0mddqxWwtcJzgEIPYULaWVKhZ1qNQiWuXIPMQD//V8lx63YuADJb
	 sPCEKBuyBsHv1KUcB8A1JF/ESicq8kPGV0RLAxTfpxYiBfCHK0JpOTghNOBUW3MmkF4fl
	 Qaj+dT6XeYcYJ7EbSIzAmiu0PXbxtBW9ay500M51DrhsiUREVO5PMlnynX6bYpxmB/sES
	 nxUnTUChB6KFQeUwlbfZqF+tcBfb4jPS1QpefHfec9UK/rt6ufb68dMJrwwKWH/R0s+Q+
	 f0QQ4PnPYQWwHijjwp5TFAcFejzwfZKLB5H8chqwRVuIPrgiZNbq4x11jZILGvXoBHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=NsaoKX6E;
	arc=none smtp.remote-ip=209.85.221.180
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA32B606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:00:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA32B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=NsaoKX6E
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5eadadf23e5so823755e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1795017611; x=1795622411; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gN7nvCApkpNJjBBl+gdS00SQSe9taX0A7DICocon5Uk=;
        b=NsaoKX6EAyelKGC7l/g5UCQwSZxT96lYF7VFxnW5gSG2311qNRFlOqNKdjyxXJKTqR
         35qBeVSVK9m+dZiXVDJiEshyPwANzNbvsSbLVHjyQRJpEr99F+JM6h7XhzWzI4D1wHe6
         /Iss+aCOeivtGBs6O2ef/O4ssse4QU60KE+KBhlHL66dvHloRnS8CDdDDyzR0ZNrGVSe
         OzrOqDkYGUAgn+f0n1btObMOFOB5Ep7+bjDAiVsVnkDNAU4xi/Fn5HLCpXxmSmSbS4Mq
         2ypX/3wo7vOIxcHZPc16/J1ASVucuZPlGKn7YuIREhosIdqy/jmzbv9DdnHLiWCmIKeY
         J7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795017611; x=1795622411;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gN7nvCApkpNJjBBl+gdS00SQSe9taX0A7DICocon5Uk=;
        b=YfgatLzNBnKALuDSbzmb/GV196iFLRAw8/Hu7G6fffPWd0GgmPL9O0Gdx8dg18VJ4e
         zQo+/4AVaOzmUKgTuvuxhsUl8UQCfKe11P76MHIKlVLi/pb0Wfad6IrziA6iRvmEyHRe
         Qq0Dn1UwaUg5YieXpyyMMm2aOvRYyZkPCWXbS9j2963368wTFd1/IvxwwcRtUikMx54k
         ZIDIWmsn8ysqU7URcH2L0aqM1FfxQUObIwBBjZVL3B7WGskZPYYjaUb7wvyoHMnZCvX+
         5XGGtYIkowDcR0PngpZnrAJpVGEvxl5qvz6WMiwyQ+CopSSwwd/WrLLRVo7ojOEd6fFx
         amig==
X-Forwarded-Encrypted: i=1; AL+hErFxMViYDIO4cXrTZGuJI3np3uAFmln5tE7bZspscu+fUrGwiLKcjiEWIDmdJ+3ujD2mEHJkBD0UQZwe0wg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KRpwrD6yO9fTIgKQ9GU8bLAjmRb49qI686AKqsplGaWa4yQ8A
	sUVj2Vi1MCteXpoEDgpIwTpumfsSdG/5wv9OCiRikMIaIcehMdTWVjKXwZI+RlsFEZ+wzZ4CgdC
	VDmTt
X-Gm-Gg: AYBFou1aoEjxkuSFezv/iouUCXcLQZalXERRRYQztnNLzMTqtDHujGF+ZOzLyc72SvZ
	6rhXuCU18T6qpixvvkZwu4dYeqiFGB26StSZesYbrXrh4ZO2+FFR80y9XEyDIKFq0nMvA4weyz9
	3BWxCeFfWn+ter+/MKnQLF7a1IvfPDcg/vfcoECnvNKtGy/gIskkU2sk8Ho7YcczE7iFlH9O381
	2spGii6zExRvs+9qsItSMcQWMxhTLa4wssj5xEZyzhshIlFeAiqrmpU81C62TPUBPk/twVjF5qK
	xaFn2EkKIkZ9QZN3igxJ+zRJR4709D8Uc4Wv9FXASYubUTeDj6ZTvJQUvMHzajzcsLzeym2Akwz
	PreFornuUMA5iEW/yDdyl2adbXyaVTFf8pM/PzGFFNnwfCNF+TvD8D9zXNAUzrsF1o+QwYbDg1u
	rKdREjHbFOcJO4LnFHkd+F3imcK1D3C6yIA7KhpOyhEHc3ANYe1MidRAIjk3s3Wl3+hMrWYXWlh
	03TtqylDTwmwjow2nXLkH/r23F09htMKqTujwEcnp/p3x+PhQHMQ9mEEvFbzkMARnrvbRsN3p6V
	3dHy44fhu4YXy8QMcxDH87lCLGv2z3uX8cg8BeACEVQo9gg/KF7BTiRuhBPLzb+2UJ2HsMirv7V
	b19nGMchAbhmN0OhavgTlkMb5c1uWMATTDF6mDJ/PsQKZ7Ls+s1gc5emNT9xYpm03NvCc
X-Received: by 2002:a05:6122:3a15:b0:5ea:389c:51e4 with SMTP id 71dfb90a1353d-5ee645faa03mr1663031e0c.2.1795017611348;
        Wed, 18 Nov 2026 08:00:11 -0800 (PST)
Received: from soleen.c.googlers.com (57.233.150.34.bc.googleusercontent.com. [34.150.233.57])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee64ec2730sm2002506e0c.14.2026.11.18.08.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:00:10 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: pjw@kernel.org, palmer@dabbelt.com, alex@ghiti.fr, rppt@kernel.org, 
 pratyush@kernel.org, graf@amazon.com, shuah@kernel.org, 
 Chen Pei <cp0613@linux.alibaba.com>
Cc: guoren@kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, kexec@lists.infradead.org
In-Reply-To: <20261118091603.979-1-cp0613@linux.alibaba.com>
References: <20261118091603.979-1-cp0613@linux.alibaba.com>
Subject: Re: [PATCH v4 0/4] riscv: Enable kexec handover and live update
Message-Id: <179501759947.250261.1712117569683645423.b4-ty@b4>
Date: Wed, 18 Nov 2026 10:59:59 -0500
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
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1086;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=yx/6YU4ftdolIH+TM3tFCIqxwpFna+tV5pnuszpTgAM=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBq/cuKW1Ven/TsYWcH9R9JVtNZvIr/Wrzbj9eUF
 VZnu673CJ2JAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCav3LigAKCRC7dyhM23N6
 3l0zD/9GkT2xiw3xOPo4dtrl50v/Zo+28SEOr65ml35aBi52o28TK4homX8OAljUtDYygGhutpM
 WxnvBmRGuzLI5PV5A7/SV+WgkIZ52fXibj+mPS9LI2vYsbaTB7qWpXD/tPjUXOLL3sp8s0nWgA/
 xzgDZjJbri0YhMen/qMzef3v9u09p3Wn4uVIdtlK0LLcBqgYpEtW1xCFKqg8Plgdmm8VzBkMBqm
 201gts8eO1QmJ87giSN1+mgcvDTecZXC7TLBmWsfh6zueYb2h7iy18luOHRy2FcgK/fG6x6oK+/
 q5kb3mOX9vuWeOn4JfkYG9JvRemmTyttU4mvzXS7wc56lZd8ObMBpcWCRJaliTNo4Fwky6rrbSU
 ubyyFqvQGzUjfL2/Rp3rc+Cie1RnXgh0XXw4RSGXf6YrqAi8dVFfXKbWikrk5D9dqJ+2t6zEbFK
 +GHKpssJeeElG+UOr2KEGjpeWljj+Alhh73XBEVezYA9oWQYDth78nJKELwFtPq8Xcfc4Br9O1V
 Iu1DpxwaZOV4fUHtQpY9XdoUQSLklPkalqeaaIppy2vDIKY2IMWWeLNhVX7XrCsNIO3L/BO4EIS
 BjJYaBZ3qqGAfTeisqH8//T8U/uQq7h8rHx7J2zXA1bXqN+ErinqAopKFwtALn0trP8D1sYJivX
 Ntme4+UlYo8oAIg==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

On Wed, 18 Nov 2026 17:15:59 +0800, Chen Pei wrote:
> riscv: Enable kexec handover and live update
> 
> Host kernel updates in the cloud should not require draining the
> machine: next to live migration to another host, replacing the kernel in
> place while preserving selected workload state ("live update") is what
> KHO/LUO were built for, and LUO's documentation names hypervisor hosts as
> its primary use case. This series closes the gap for riscv64 and
> validates it with both upstream test runners.
> 
> [...]

Applied, thanks!

https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git/log/?h=liveupdate-7.5

[1/4] riscv: Call early_ioremap_setup() before parsing the DTB
      commit: dc821c9badf7b2558e206804c2adaae28d25477d
[2/4] riscv: Add support for KHO
      commit: 48ea610913a6d6fc513d082afad04ff342120931
[3/4] selftests: kho: Add riscv support
      commit: 30c6fc85b4fb89fc867bdea413403bf169e7e194
[4/4] selftests: liveupdate: Add riscv support
      commit: 9615c5074cdccb651684e61cd8872ca8b0b30e52

Best regards,
-- 
Pasha


