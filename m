Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795394838;
	b=Itz2A94EWVxrbyHWakxyi0yLPwbR54cQdaz7l+7Ih1GyLs80zh4ufZiibQ4s95/TQwGZ
	 8mmCAuUYGZdv6FXmjg78f6vNtvnI012RQMG1JuGs0nnz3Nna84208ra9D40mi1PWjmrPh
	 utyT2QFnw2/MlZaywxeHiXF7wZe4cT0O3wwusmWuoBYCk7mzugarAHDlPXanYTOIrwtqB
	 i5RQnE1C1eS1ufEq1tXDfXvfYE4/0+KbO+BHs5N6CZdfoZ7+4znC7vN3z3G6hVw0EcWwL
	 viYFrYG/y/kC2l9rtmLzK4OUwKnixWK0tOM6erl2EuXYtBw0G721DG1p+FTgmySuvYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795394838;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:From:To:Cc:Subject:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=p7B3c6D/X11fLUAKKmi13BRTcfCArxOmxqQgFnPzAxg=;
	b=OcJwVBoOf0HoKNBlRoeqRAnJrYyedsrSki1XcHNrlJeQkqHQ1A6LfOmiH3KDTnHRZOX0
	 R9GKWixqiZrXwx1jjIAXZeeRJvI0j66/DK7GYJjw9vpJBcGZB/9RPnIurNg67O5tuRSoZ
	 4eJhfkmIufitNwe7+zwJxu7ZiRy4Muu+EeLzsaHj4kVRXgftNRzw2y+ZVJ1UDPsGzj8S1
	 VGdwwZ0z7YqzyltuezKtGH3H/P7MCdjQ6MhYx3/o79zubMxABzRtbVwbZXKL1lMUcutn1
	 lf/j42y7jrU32YNKZV8wwCIqwlmhYSzC2Q0LWLYZ97bwPQBQE5k7mdXZ1xYNxNFpODw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wfmQXoun;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3D8606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 00:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E3D8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wfmQXoun
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f03920c477so23921215ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795394837; x=1795999637; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p7B3c6D/X11fLUAKKmi13BRTcfCArxOmxqQgFnPzAxg=;
        b=wfmQXounwgi2H0Qxd61oGE737FXdx3pXDGCOw5wqSvHmhLwHbMYTvLOPgZ1H4nzjgD
         9xZkG+9qJCwNtxDlgINthLE2KrlkMUMLdkTfkRrxDnHg2/rRF6WcXNrtFZn/qVjya7pj
         GmPnzJlTLY18Bw6jiB9/PWzaufJ/EuY1zR/bDY4BNg5qVHJ4zAEf5u4OYbZwir3oJJ5z
         bWrI5gRmMuSG8UZAQ3EXEX981myLRid+1mc7xa3vIvUo30DDFi2XIQe6l+1+d/QDmIr1
         g8buEHoa1fy3Al0T/O3pbPGiy5AkuwlrIPoraLH1Sm1u/V9h97CJmibvWCcdVsbF+KQD
         Rxiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795394837; x=1795999637;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p7B3c6D/X11fLUAKKmi13BRTcfCArxOmxqQgFnPzAxg=;
        b=jnLRV+9F54QpGFQhcjZPXje1rl95QTfa753UvdXLldJzI6T72VU4nZLv3GIfuhYuwO
         oS7gKKPr6TWlR5kWbJ5vv+Z2OaV10lagABC08bBimHodHOAKgADB1ihPlHiSzcTYkttz
         hDJDwdC3TkGrVbCFxrE5SSSANmvir67qouZRA6rWFpzpTnc0gGsjLDfHyOVtDTuP6T8v
         QatvXB/NyI+DpBXfCUuw9kdJY1U7Dq7fMXVGdobDjBgHFutO2akk/KK255VITg6vGdWE
         pHGdYPykLaxGttvWSuTiQcAB121k3SQ6StRwO6eZgmyVXlEZYtjWn2pWm1PpSbxaQT3M
         ZCWg==
X-Forwarded-Encrypted: i=1; AL+hErFk/D7VdMHozzntVGFXcNQMwSx4UASGKn53WbWRUq2eW6VZwr8zAhJPbeeMUGuPbbMYnGaUAKLHUlALX6E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QBn9EaBJe6xQ4mlN6Vjt2oY46yNGseNOC6i245tIzCQGI0Bq0
	1d9H7EAxNDiD3ZOTKEtLROSPXAoxWNahZLoYwwQP0XMCE/htMUPNRFHL
X-Gm-Gg: AZFdTZcWk4m1zTrTm0YxBmtkkyOuVv/7jaZK76bie0pUlCOwD8uyweyxOFi7Pah63xp
	wteB5aML9aKg4L8N7ndc2wRyXNCPPIx9MGaCY+ZIgRJqe6/nNrrQ9nHVgKN6piD3kfH+YNPRPS0
	jZIvOUpeHOg0ZyQhjy3mp4HrjrhYX5YRPTgCQl4AEkEokjkBwLbzRY/QgEf2OdH7MPqBdhlTbFu
	g4q7vxCe81WBy1FZSfzreXYpwgRxbYlu5nC3s7Zc9uj6YuLgu1oTgeErRYydlzXH801tvZCDY7Q
	Znyjys7FmhuISvLAKglbP0n4lY5T8fVa4ZYh2/t4Dk6J5APp41StqCgmwljF62v07U3rOgnxqRv
	wr20rdb1rccJNQpxuwMrswYZ+x8Tij16RVaWsHaa1CTydUTYD4eiiKeXVaIyipVV+X4mBFIxL7i
	vHRYDWhyUHlPkhbN/Xmszr31aWxh/gLcp2Fo0DFvBJYFT9xq9nB9lTecxQkZbdFAjNKCZlbGtXx
	tfZt5el2143uLM5aZ+sAlBsozDCxBbjvXCwZ6x3iVGiuL7lvRSNXhm0u9FRApwRU/2sXQXj2J+J
	kz23rcYuxZYViH4DboYv7GtBuCosdeSfE6lk9+80Wp1bUamweIX6gUpmnc2v0Md//84ZldBr4C+
	O1ptk8qu59UBVHm7I5KQWeUlMxDAJkAMAaA==
X-Received: by 2002:a17:90b:288e:b0:3b3:ec88:72a6 with SMTP id 98e67ed59e1d1-3b41c85284amr8792429a91.3.1795394836739;
        Sun, 22 Nov 2026 16:47:16 -0800 (PST)
Received: from localhost ([153.61.198.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41abb1b66sm15471631a91.1.2026.11.22.16.47.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 16:47:16 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 00:47:15 +0000
Message-Id: <DN26CP5BB6O7.23ALW6CZUBYSD@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Karl Mehltretter" <kmehltretter@gmail.com>, <bpf@vger.kernel.org>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Shuah Khan" <shuah@kernel.org>, "Tejun Heo"
 <tj@kernel.org>, "Johannes Weiner" <hannes@cmpxchg.org>,
 =?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, "Shakeel Butt"
 <shakeel.butt@linux.dev>, "Waiman Long" <longman@redhat.com>, "Jiayuan
 Chen" <jiayuan.chen@linux.dev>, "Puranjay Mohan" <puranjay@kernel.org>,
 <cgroups@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-rt-devel@lists.linux.dev>
Subject: Re: [PATCH bpf-next] selftests/bpf: Disable preemption around
 css_rstat_updated()
In-Reply-To: <20261121082843.44614-1-kmehltretter@gmail.com>
References: <20261121082843.44614-1-kmehltretter@gmail.com>
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

On Sat, Nov 21, 2026 at 12:28 AM Karl Mehltretter <kmehltretter@gmail.com> wrote:
> trace_cgroup_path_lock. On PREEMPT_RT this leaves preemption and
> interrupts enabled. On non-RT it masks interrupts, satisfying the
> assertion.

let's fix the kfunc instead

diff --git a/kernel/cgroup/rstat.c b/kernel/cgroup/rstat.c
index de816a4..d72fe72 100644
--- a/kernel/cgroup/rstat.c
+++ b/kernel/cgroup/rstat.c
@@ -131,6 +131,7 @@ __bpf_kfunc void css_rstat_updated(struct cgroup_subsys_state *css, int cpu)
 	if (unlikely(cpu < 0 || cpu >= nr_cpu_ids || !cpu_possible(cpu)))
 		return;
 
+	guard(preempt)();
 	__css_rstat_updated(css, cpu);
 }
 

pw-bot: cr
