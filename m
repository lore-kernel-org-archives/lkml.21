Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795052872;
	b=GLouYPVNVcKItktzTE7eFQaoZzSBz9H5/UDgH0gvqFcDLLlIFuOxx27xedE9vkjYmQfu
	 w3qAbSaJHqbwVK+M4AP1sNJhrH940BmFdDxY/gLIQw8xkVtbITRcN1xtG9/c2NzXlgDod
	 rHmJgzwuHgaZ7mA6NQ+MWO1lK5C7TGI6yGEQx07hvXqapjhURBCtWs5pVvT2jeRVjyiQ8
	 sTcviQ3hi1wI5ujQ7X80QFRlOoeWvqYonK8jA7d72KtXSvVweqTTYeGCODHIEwY5z8dp3
	 GVUChewEUzMjn+LhZFboIri0BRMuKnbTNSZrE7CAEKlgBngww/MyCYbYUNf+ZZCV3Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795052872;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BF6MHMVC/gRhXEjqmDEfUPfPCO5ohWekc5J++08zS4o=;
	b=HjL2lNuI7jxTS4niZV650UlXAQKNXI74wBMDDGHhC3GxllPyplCYxO3s0Qc9TTSh0kC9
	 EETWF4bfNHtTR+NCtSh87o3+x5MCq9jFF1Yvg1rF8n/VCZmO4X7MHa4P/+cMDHZ7/i0Zo
	 S5+q4yXHVxgoPzC6PgN0Ci/HFAiM2qkqUeyvyrCm4apQbKowcrRcAdDAGFBEhjIRrxv0q
	 iAk38CosmUwVksmJf2GxgV5PVWeEMCYzNX601o28pXUXJUmPc8TbrfcO5UvIN24fw6FLC
	 AyvsWCgp1Owk1+H9JYrde+cr3BMyGheo50lHglWoAxyHHtEF/0F88PEx1R+Pj+tyqfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WNBbOJGQ;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA4D606A32F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:47:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFA4D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WNBbOJGQ
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2f01f296937so2951785ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795052871; x=1795657671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BF6MHMVC/gRhXEjqmDEfUPfPCO5ohWekc5J++08zS4o=;
        b=WNBbOJGQP22gqUiDU4eNd4w9Ilw6g7LrbmQStjy4SBnKM7Cz2YB+ZLOm2BUl5NA8xj
         YL1iDZ2iAqYX2vtbhlQp2DZX2jwZLs98IVlSXl7Mur8BZJixvAa7Z7mdQaTn0PCzSoJG
         E4s3pnISlw0Ju9UadnmRgJfk75A3AXCKZBeLUsDOcMV7h+wMQ0uSn+W/T2AVLwyq7W3r
         qT4kVp2KsV5ZA8Gl66EY11GsK50ccLAIFHIe6tvF9A8Pu9i51K06kkT/jpu9ZiK6YBTx
         ntIbX384YVvhXaHgmSMN8gRNvxbBdkLk4QlbhchYIizTDn/Czj9Z6K3gzkLes2sZDp5a
         1zCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795052871; x=1795657671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BF6MHMVC/gRhXEjqmDEfUPfPCO5ohWekc5J++08zS4o=;
        b=tOpWeFgGv7LtufQ7FWIUtXVzoG9t711I0RT7wH/0dOopEv8t0hzKC+Nfxp8kp5Yidz
         IfWzgw6Rarpyn29gxIgqELAYPWsQEvLU83bEws5Q3WY3m+C0U2npqAWF3zG2vQB1gVo1
         Mdn185kEqYzQcdPGKXfxd7YRjDHGNEZ7y/aMAXRN9PfCuGKOrx7DCq830Nf6OO+btii5
         5Q4rVF10ysMFtmPA9M9JDBz/x2f5c86A76uqddyeTQs4zNjD4u8/By8uglG70y+Dya2W
         bDfa6eklVECEsEo4Dupn5szs1xf9B/mNIskTDnMu5kGihTO+oV+AFmZvBVe33FV9PF0Y
         E+Mg==
X-Forwarded-Encrypted: i=1; AL+hErHRtSkG0ex85K8aLhM08VzJVRXZqlcH9HBwOltSmCZndz7eDGmOxls4SPUi4y9NP7ihVTVLrwkeiRjY1LY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8W5hJQYWtR2awtGm/3oDScfWDViP919tvEm7Pp83qpspyexIIz
	1sRiaJa8quXvpYv/ojDU4PrKd4QWNtbb5wCr7ERZNKDN55UBSRoXQKiq
X-Gm-Gg: AZFdTZeiJIcHkF/0oMYW6iJIfzKOye0NanBirgfwHZd009o25lmhAl6rnWyNsKYpNPK
	PwEeC+QiaM3Bjf9ZFZ0qlBZu250Urmwyobir7ZgLWP//Z8QcoqCVVX0NaITQBcqd+AD+62vwAA6
	fXhpYp/PCPXF5ii4o/aA5Qc9meO22XetV8vJHNCYM9h/b1+TIjuJr1pdpA81i+OSkzzckNqBPwU
	peo0puzby0klrlzDaT2N38C7SpaQJIjFWbhVpKoUqbfIgJKn5GcMAtE2ptZlGuCTAlwGEJEZAQX
	mBVVP/ZSt66hX5Jad5Wf8esr5j/WmlZu+VgfUHxmyDTRJsNhAb0rHQllIviySLNtyooQHEQNyny
	Ev67jXu7COh6SlMq9onOcAXp/cD8OCVJ8JymvXfcBUKk/l8h6XRvI9R+cUb4HjX5JxKzUr4r4qA
	FbXJhMb1cC/REihtHJxiaJBDTuEAumjQtydUzpF9e3DPFxtqIbetnep7kVShoI9vbYK8Sai0FQ/
	WAn4YZ3Rvb6nOLeoqwb9e2SDNsmIy2xGisesfTVEDk9oPBGx0MCT8Nu2a/hjpWVixv3OTL/lGwK
	zuDuSpYABP+TLDa16fP4CsHy9qF8+djEhCclfSV+EEsfvyuAAMQv9tjjmW0RPwZDrNmxweDyyjl
	9J889A0E/4gjE6PabOxcjZHuGz3XvKhUG3rieoMmVjuZvfUVFILHlcq9OC1wCh+zOuYCGPUsBeL
	XMXvukHO1KGiCJ/iTmVcu9L91OdsPN3kYhe3oslNOWHj6e2I5WzGgCeGpfaeJTF8l/patfhZ/CT
	a0mRTCGwd+4JKkppJY8yIMupkhqa1/mtBHxpHvM+03I1TQWkDsmorMO2MChBWsl
X-Received: by 2002:a17:903:1d0:b0:2e8:b5b2:a9f9 with SMTP id d9443c01a7336-2eff740acedmr41921305ad.37.1795052871033;
        Wed, 18 Nov 2026 17:47:51 -0800 (PST)
Received: from localhost.localdomain (123-243-92-89.static.tpgi.com.au. [123.243.92.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62db225sm21774475ad.72.2026.11.18.17.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 17:47:50 -0800 (PST)
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
Subject: [PATCH v2] perf: Reject group leaders detached by CPU hot-unplug
Date: Thu, 19 Nov 2026 12:17:30 +1030
Message-Id: <20261119014730.2074-1-danjwade95@gmail.com>
X-Mailer: git-send-email 2.39.0.windows.2
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
Cc: stable@vger.kernel.org
---
v2: use DETACH_EXIT at hot-unplug instead of a new check, as Peter
suggested.
v1: https://lore.kernel.org/all/20261116081248.21059-1-danjwade95@gmail.com/

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
 
