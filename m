Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795567886;
	b=Cwm8Dw+UbK2bL+K0MRDxmRrUc0NUXERPqvt/xO1H706Kt1EOjp1DKoAu0Wdy3DPZeN4F
	 J97CdiryOBYBKnEpksIdc92qbf31PpX211vOs46dgRXuHj991NXtZ5NklfUA3fJSzpHuT
	 GO6ZgZeFFJM/ZxFxR4GgLkgmpO2fztsi2L54IsLAtkDgVrvbnBk2fuo/6PUkCTLp3uA4x
	 VYN1gGXloF/YyINtTvU6tjByIvDSBlBF7fVeoHo955/t94G8AhrN8Xbj5K7w1w/Lp4f2T
	 yRqaMdNTKjERmlvuoKj3x7o02Q5fZK9RQRpvy4YvbGpsEFgNHFMe7ZtNI6bk+jCtmtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795567886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=0Bm9NXQn0v9M2tyfxAozRt5jQau1vpJZk8wO8ZZv9cE=;
	b=iJYymVh0OTm4DESUoZxQvax1SWxyaXN612Tb1m1tIcie03RU3jd7Y7J7gn5yNV34W5fb
	 oyM61QNukP32LNKfzlXgXMUw+vqjWkTQ5fREnQfMSnoubiO+dCqhmHoe9oinWXQwJM6ey
	 6OCEX9yTVEb02DIkmIVBZa1fv0jdPa32a3oLbHn9mM99FPctwhssjR5Ve1tQyvFWyeLP0
	 buFEDr5l4tjQe4riPtTd6qN2YFsJeXd21vnNGjjfSjyoEJ95J+oGw7eWxi0pJLeU3mZxA
	 bdIu729dpwO2GPyDkJ6pvAa8Kls6YbCve6U9vEIG17uPKoaks1/xQ60B73/VIukOC/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hGl4ayoc;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8547606A690
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:51:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8547606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hGl4ayoc
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso5670691eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795567885; x=1796172685; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Bm9NXQn0v9M2tyfxAozRt5jQau1vpJZk8wO8ZZv9cE=;
        b=hGl4ayocEX9r6evkVwQoj0cjaNV1eTxHvPVmiy3qklo0GBOKY/Vqu0SaA1NrQNhTxZ
         Pcga+1U3bUy0cKt9PVlVBowS2x1IoS2tfeQZis3i49cFBo4hwVYrfUKmgRunhFXL/S5F
         JWBrW6/gw3Hb+COVmRqu1cr00rB7eVWQlo/Y5LdRMO6rpc2BA2Y9hrzwaPxC9Lw7TEEe
         kPjVRiIAe9+FU77VM4mimnAEHljfrCr+Hj7l+VGYSSDKPHremnSHuxkk7TRjlvc/I0KV
         u0jBx/XaISOEpsd5A1xvrXpIkvYH7WYDMrEmajE7R70+L+rXLO62WfculirBEGeBn03c
         rH5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795567885; x=1796172685;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Bm9NXQn0v9M2tyfxAozRt5jQau1vpJZk8wO8ZZv9cE=;
        b=rUkIRSnDOBOWhl80SIWxsyXOejenODvk03RPVa2UsauGWsanSivFKjPI3xvgWwcIi8
         ZQinlQzXiskHrZ9PtFndQCoz7qh/P6kfG+L2AIUYy9E4q83axyeebMrvv5aFI5/6YnBa
         W6evXisLrvFoTQVkfVyoTeEMFcIsbcZIkJvQEZM68bjTurWY5p6MVjYpi7R4sQ+ktgAL
         APUhi+C+0UTIHuVBjf6J9tB/rj3ZLGBuAhPmIDKFbvl3vEDURTxiKW94drhHqsZecIpm
         Yl2Wkep+kag/IXq/B77Y7+UlBHyMLskeUC+Ajf5q4DxEGV9oSsXrv01x35v2+Jt8JIEx
         Hp2g==
X-Forwarded-Encrypted: i=1; AL+hErFXspyE6GW99glRseUlpuGGMQVVb32bc5i8uCb7T/Ah19oBeFpJZZc0Eogam+AYnk4AV2jsSVyAKykj47I=@vger.kernel.org
X-Gm-Message-State: APuU4Z90Vu9aeSBY+oOc8hKWyya60YNKLgW2QMU43rhiXhvczRuTjIts
	O3SMuyTExTv6tToKEl7wAQhGMRMjifZ/OY3GTNHiwj0pPHoV5TOVVvr0nFP2yZ+MRccyj75G7qW
	q0+lt8ZclIw==
X-Received: from dybcn8.prod.google.com ([2002:a05:7300:a908:b0:36f:5688:8a11])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:182:b0:386:b4db:74d3
 with SMTP id 5a478bee46e88-386b4db7924mr6776155eec.21.1795567884395; Tue, 24
 Nov 2026 16:51:24 -0800 (PST)
Date: Tue, 24 Nov 2026 16:50:51 -0800
In-Reply-To: <20261125005108.1020003-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261125005108.1020003-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125005108.1020003-3-irogers@google.com>
Subject: [PATCH v4 02/19] perf/uapi: Factor perf_build_id out into its own
 top-level struct
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>
Cc: Athira Rajeev <atrajeev@linux.ibm.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Leo Yan <leo.yan@linux.dev>, Dmitry Vyukov <dvyukov@google.com>, 
	"Steinar H . Gunderson" <sesse@google.com>, Stephen Brennan <stephen.s.brennan@oracle.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, linux-perf-users@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Document struct perf_build_id as a top-level structure in the perf_event
UAPI comment and add it to the PERF_RECORD_MMAP2 union comment so future
sample types can reference struct perf_build_id directly.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 include/uapi/linux/perf_event.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
index c49fc76292f7..deb7c42d109b 100644
--- a/include/uapi/linux/perf_event.h
+++ b/include/uapi/linux/perf_event.h
@@ -1099,6 +1099,18 @@ enum perf_event_type {
 	 */
 	PERF_RECORD_SAMPLE			= 9,
 
+	/*
+	 * Build IDs may be present in a number of events. They have a
+	 * consistent encoding of:
+	 *
+	 * struct perf_build_id {
+	 *	u8		size;
+	 *	u8		__reserved_1;
+	 *	u16		__reserved_2;
+	 *	u8		data[20];
+	 * };
+	 */
+
 	/*
 	 * The MMAP2 records are an augmented version of MMAP, they add
 	 * maj, min, ino numbers to be used to uniquely identify each mapping
@@ -1123,6 +1135,7 @@ enum perf_event_type {
 	 *			u16		__reserved_2;
 	 *			u8		build_id[20];
 	 *		};
+	 *		struct perf_build_id	bid;
 	 *	};
 	 *	u32				prot, flags;
 	 *	char				filename[];
-- 
2.56.1.831.g720f3f5937-goog

