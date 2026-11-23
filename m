Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=1.95.21.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432454;
	b=vBvShCAObbNI65tlArrPCf4T8xVOltMS9mHWDoJX+Y0Y7N4V3uH7udqaEZC7cS33qwDp
	 VBSj70LDNv78wTdcSguMXnl56DP+UVuOSoJ0KSuqMC866lbouoJK2Jv81YneB9Y9Y8Iis
	 tZXgmpM/GWN0nvYUT2S4R7PIZhih2hVoHuuVdXyxjaXOwu1brW2fJxBVuCQMUcUY5jTlc
	 sipCkVD1xCmO2qCwMRPCGhxtYwPllqBJY4V8dNlAIEBPtdtQ/wnGLl2Dl8waPggLzJnmf
	 2SzYmnlQUJLTIe95Nm6+/wrVfs97zqHoEBKQGGyLb6KrHvFQWDW5pa43/Ib53vpJa1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432454;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=YApVtt1/vqtj1+r1s0+RIPcopHlQ36IVbF0IWHndib8=;
	b=pOYt2CzQtGQaRB0DNAnzfqp5o/+gZlDuXz3dIq5v89unYPKsOBGN3C5kTtBlanuiMsvp
	 6a1o/E2EOmtyOHDVRYr1AFsUN/dP6lHcI9ctzCtZiqj9Od/VnPEQNt8Wq2EqkCvjc2gc7
	 PMCEgmYLPLvRNvLcUAkGM88LJH2ShdWBeNB5JCCaX7LUDtqH8z9ekHCR+ZaWbY1cgE/V7
	 SyhzH9oG228c39UmWcPzOtW2FEeq2Q2bdqNCmjV3kIYvHkPtTfSYcn/olsO+iZMdPrhav
	 eV7G8rm0Fp2vCVZNc6rRw02/mYVncAANqsnd1xkwfpBlnVHX+tXydwZmr2k2gKisGOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yeah.net;
	spf=pass smtp.mailfrom=yeah.net;
	dkim=pass header.d=yeah.net header.i=@yeah.net header.a=rsa-sha256 header.s=s110527 header.b=fTrqo5oi;
	arc=none smtp.remote-ip=1.95.21.15
Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D644606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:14:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D644606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=yeah.net header.i=@yeah.net header.a=rsa-sha256 header.s=s110527 header.b=fTrqo5oi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=YA
	pVtt1/vqtj1+r1s0+RIPcopHlQ36IVbF0IWHndib8=; b=fTrqo5oilHaC4gIlKu
	bTOwxya9n1cNrUxSO2CTdMy6Wm95eKezmtcFeJUjZK4Po7mVm2B/r09BS9QotLN/
	JxuHNU6FB0q6qZ+VhbxVlV/Edx5WCPrkjhOEJXfgxzOglRCRsHhzmJWFe+6GRwTi
	a94LWuVt9Pk3fv2hNt8vzgKUc=
Received: from deepin (unknown [])
	by gzsmtp3 (Coremail) with UTF8SMTPA id M88vCgDnRpK7HwRrunnABA--.2892S2;
	Mon, 23 Nov 2026 19:13:01 +0800 (CST)
From: Ziran Zhang <zhangcoder@yeah.net>
To: Oleg Nesterov <oleg@redhat.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org,
	Ziran Zhang <zhangcoder@yeah.net>
Subject: Re: [PATCH v2] sched: clarify ptrace's effect on task_struct->parent
Date: Mon, 23 Nov 2026 19:12:56 +0800
Message-ID: <20261123111256.18671-1-zhangcoder@yeah.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260910133027.8453-1-zhangcoder@yeah.net>
References: <20260910133027.8453-1-zhangcoder@yeah.net>
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
X-CM-TRANSID:M88vCgDnRpK7HwRrunnABA--.2892S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrur4DAw4xJw43Cr1xZw17Awb_yoWkKFX_u3
	yfGw48CF48JFs7XF47CF47Ar1Ygw4UJF1xZ348tFWUWa4qyan5G3Z3GF1fJ34fGFsxuF13
	WF95Xas7J3sIvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: x2kd0wpfrgv2o61htxgoqh3/1tbiNx3Sk2sEH70BmgAA39

> The current comment for the parent field does not explain that it can be
> temporarily replaced by the tracer when the task is being ptraced.
> 
> This can lead to confusion, so clarify the comment to document this
> important behavior.
> 
> No functional change.
> 
> Suggested-by: Oleg Nesterov <oleg@redhat.com>
> Signed-off-by: Ziran Zhang <zhangcoder@yeah.net>
> ---
> Changes in v2:
> - Use Oleg's minimal wording suggestion to adjust comment.
> 
>  include/linux/sched.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index 705970d07..8aad8a8ef 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -1093,7 +1093,7 @@ struct task_struct {
>  	/* Real parent process: */
>  	struct task_struct __rcu	*real_parent;
>  
> -	/* Recipient of SIGCHLD, wait4() reports: */
> +	/* Recipient of SIGCHLD, wait4() reports: ->real_parent or ptracer */
>  	struct task_struct __rcu	*parent;
>  
>  	/*
> -- 
> 2.51.0

Ping on this v2 patch. Suggested-by ptrace maintainer since September.

Sorry for the noise.

Link: https://lore.kernel.org/all/20260910133027.8453-1-zhangcoder@yeah.net/

Thanks,
Ziran Zhang

