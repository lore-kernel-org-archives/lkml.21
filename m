Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795521932;
	b=OHgjGkPEXiS5C2kQgwqKlxQs67/Whj+BhqI1jNL5u2k4mlYvgXkEgSxGO4M1pcvxWsBn
	 69uI8s+SMKTrZ/uLKYMruKM26vvaXp5PuDKqt+MQXJiWAaCwdaf/ozcGxPtPjeKGjc46u
	 BoeQhXfdCjCSabjiZzV0XobXf83p/8zRYCEKksSPr/n1iCiVRAm9XcAfVLY6/VJ8R6vR8
	 XJHASwOTYIgLpkhSfHr0rGMgIk2BZKKYWb1SOCHIAX17H48lKQ9A/wX1R+pJyaAtDDVNM
	 SgUMY7MQAu/T079ICRITM2PyyPrjGnCfYt32bWhTSpxcVe8q3Fq9q+iExDwWm5qgSlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=t5DAWPIQJxmMOKP/hqm8wEkBGU/+0/HwxtbEt17HY6k=;
	b=3yAD1UzlCa6uYq+pszdyLfeQ09YcYNTObgcCM6VJMokP6XxCB7S1k+jGLJa7RHkSz0W8
	 xj7boQ3TtNZ0koK/g1QgtqyhJkey8hGngjIq+A3QY9gPnol6H3BNKfOS132T3v94T4Ag3
	 9I/KhCOKpqOd5rIx5YAlDmWq2jBvgOBX9imWadYTXvTjYWpCnsJxLzDADVtViBCxxjOd5
	 9NTEGbNSL8MpdfzEol5UxoUreJdeow9ROIQOmf1JZ7fYw/T5eQJBQ4hUb3yD3d7nQ1mM5
	 h/KtRKlXU6GDigIvJ2dJQwxKq2V+L60e7hiP+AW3yAprAWkz2nBrOFUaG/b4xfbGFiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="VR0E6/eJ";
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89422606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89422606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VR0E6/eJ
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f020d0169eso20917235ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795521931; x=1796126731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t5DAWPIQJxmMOKP/hqm8wEkBGU/+0/HwxtbEt17HY6k=;
        b=VR0E6/eJynbXo7eq0j9UewlBP/PeW2gHmZsgZ6eFtRxlOOQNxuDjm1JQjcj2xFcVFY
         0HjK545rm7jLRYrlQ0J6WvjZF0j33RKlxRkZXhUHHWbfrcf1bxoHvmBk/L4RcZLG5sQi
         1i0nMZ1IA1KHsiXVj29BbLOtvtDiIEsA3ZT5uInpvtShc12HPyr2yZRr1We0qdbcwyq3
         Vkzn7ncvugd3GRxl6zjW1WQwvlpn7cs9arRwuHyNLmw8XiLBcD8BFs0FhkvNRqLf9Vc9
         Rz/VHiXBSGzuo93VBX7elVS8hZRhibFzrdDukcEaOuO6AgbWAdXSweP7hLCiozygufms
         Jqsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795521931; x=1796126731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t5DAWPIQJxmMOKP/hqm8wEkBGU/+0/HwxtbEt17HY6k=;
        b=xotCN5LReVQoHKL1wzUZeoRk07G7KMmLjIXUqCBdTatRRajwiOzB31BfZ3MZypuxNQ
         eLAHIkW3sibL0L++QR3yAlWqdwNctowk42sklaGvthzvXEK2y/HipLRpMCNobiGeb4fw
         I5OzkFfEtf42/PsDey6lmnasUQwQ12YbnVoP6AIj1YQ1ng9PSmLcQ0GQQmVVNOa61P2t
         rKZ+L8vZaal269baozuY3563NvSf0N2KgelEGUarS3nA8wH6XIhH20gmHJpti0MMARdW
         Rv7ZZikIdEffDFsS2g9/ZQieZksTPrMXe7lLr0+/A11cCvVu4fjqtjADUTdfotdSyPRj
         Xiyg==
X-Forwarded-Encrypted: i=1; AL+hErEulQwCyBeSLPPyTODROFUgDmtCaly0uv1xpjKGTYbSQTmATw+SFGnQrjI1OepXhE3GP/Ode5h7Cn8oGNc=@vger.kernel.org
X-Gm-Message-State: APuU4Z92WQyYYKnkTI8tdrSAgl4AoXtr8Il7QtHVoRYhPCjSkVSxqB/W
	XvLqDjsPV+7vn9qA7osb3PnuyC0oKr5o1/BGk6bmkYi3OALjYLtb2z2pKxLHN8Jj/ODiV63m
X-Gm-Gg: AZFdTZeb0bBNhAFP134zp0FicNC1lD8XyODSi0jT4MMpRyAP96Bzl4okfPszfBTQoMu
	ZeZHbsRqfiqSt7RlitM16LtkD+MEhlPd42wjg7DtsiicMN544PIun/Qvay9oAOSnuQtRHcvt6Vq
	2RYl0nBQ5BW56LX/BKZQCgxvFwFTDK3QGlJJxjxFhbDN762zZOJ3ewUmHOlDKCDeglAm6BRQgkv
	ei2vE4y3dpkx2Fok6a+ds7uDjNIeFFd1j2YarPekuelAIR4UabflDkXOt3ZkLye9br37HiZTnZj
	P0alEOcfngihq+eoTEq0S4zRAkgi0A0Mt63jY94uBgSaJy6QBeY5QCbt/fn8f4luLtXsF5u7teg
	E3cYUs6H1ZkeIb6FDQrFe6rzwiw8fK9bsMiKDq914ZvJ/kk7oC1O/eJi6oxYhn6ojRGs5ol4Xd2
	tQEUzuL7LH9+EysP9y8CstnAeWyNOAsVKCxAKy0tNN1SJ1pn4PwRQxIDF5XAJSHvH/6O1X038dD
	7/chYqXZV4XqpzW1plwQslOsNnGFdoFxcUcXazMeU+e1M5vObXm5FXPYklVYqEjTXIKo1EatGF2
	x7a6t6X3knWiJMyJXHMZANOj3dFG9xHPQy1jE9xhYBOXF3yisBuy93SnEeFtmohqxRkjSGyM+AB
	BqbbNTJjeH0a5Nq13MnWx5K4gvEw9d3O5TuLjLRkUEY98h8pZghtTY9gYU15OaLcrcypX5nKv3q
	FO0fmJK0NO7eDZnvB+mluJXOUDPPVTCXmVsdV8lhubxcMJwJGysQJB2wmbPdEm8RonhGeXpGgh0
	wMPiUxMYC9uIRUnU2dcXExfZIfbHbtTRdoJzU2JHHL4NNDZ/g0IDoC2hD8xGe7n
X-Received: by 2002:a17:903:94b:b0:2e8:93b1:49cc with SMTP id d9443c01a7336-2f03f1bf19amr157803285ad.35.1795521930686;
        Tue, 24 Nov 2026 04:05:30 -0800 (PST)
Received: from localhost.localdomain (27-32-254-230.static.tpgi.com.au. [27.32.254.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f07d6d4bddsm39621705ad.62.2026.11.24.04.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:05:30 -0800 (PST)
From: Daniel Wade <danjwade95@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Kyle Zeng <kylebot@openai.com>,
	Aditya Chillara <aditya.chillara@oss.qualcomm.com>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] perf: Reject group leaders detached by CPU hot-unplug
Date: Tue, 24 Nov 2026 22:35:02 +1030
Message-Id: <20261124120503.334-2-danjwade95@gmail.com>
X-Mailer: git-send-email 2.39.0.windows.2
In-Reply-To: <20261124120503.334-1-danjwade95@gmail.com>
References: <20261124120503.334-1-danjwade95@gmail.com>
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

CPU hot-unplug detaches the events of a CPU context but leaves them in
OFF or ERROR, so once the CPU is back a detached leader is still accepted
as group_fd. perf_group_detach() does nothing for a leader that is
already detached, so closing it frees it with the new sibling still
linked, and closing the sibling is a use-after-free.

Detach them with DETACH_EXIT as well, so that they end up in
PERF_EVENT_STATE_EXIT and are rejected by the check from
commit fa091f46c383 ("perf: Reject exited events as group leaders").

Side effect: poll() on a hot-unplugged event now reports EPOLLHUP, and it
is refused as group_fd even with PERF_FLAG_FD_NO_GROUP.

Fixes: 226424eee809 ("perf: Fix corruption of sibling list with hotplug")
Suggested-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Daniel Wade <danjwade95@gmail.com>
Reviewed-by: Aditya Chillara <aditya.chillara@oss.qualcomm.com>
Cc: stable@vger.kernel.org
---
Unchanged from v2.

Tested on mainline b3dfbde62cf1, x86-64 with KASAN and PROVE_LOCKING,
2 vCPUs under KVM. Without the patch a sibling is accepted on a
hot-unplugged leader and the close gives 15 KASAN reports. With it the
open fails with ENODEV and no report appears.

 kernel/events/core.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index f5f2261f1fe6..2de4c3cc37ac 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -15342,8 +15342,10 @@ static void __perf_event_exit_context(void *__info)
 
 	raw_spin_lock(&ctx->lock);
 	ctx_sched_out(ctx, NULL, EVENT_TIME);
-	list_for_each_entry(event, &ctx->event_list, event_entry)
-		__perf_remove_from_context(event, cpuctx, ctx, (void *)DETACH_GROUP);
+	list_for_each_entry(event, &ctx->event_list, event_entry) {
+		__perf_remove_from_context(event, cpuctx, ctx,
+					   (void *)(DETACH_EXIT | DETACH_GROUP));
+	}
 	raw_spin_unlock(&ctx->lock);
 }
 
