Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795451004;
	b=ad6PfZ1Yd58e9+Qo1uc7vKo3/nW6DOizahbt2A8/5tZMXP8soTurvLLkSf4NkRC3ca9M
	 kOb6eD/VfeS3f8InZhpyy9odjlJICv7PT+Iz5L+f3Lef+ayPN0kJNNIzqGLRAKFkdXL1S
	 wURLLbuOfITpNW0X+B7E+DEYJiniwotFkZCIWUSncvNG8TePpuYzRTS3AsLpINl/misLV
	 0azNkXrug4+7rlUzNNoQ97DG17j4D0HzUMIhlrUKP20NR5WUH30TOkSSH25e1W1fu+QTe
	 iSGTMr2f84rdKZ+lorzvrjaxMZ4eKTdt/KfngGJlvFmY5iGGuumo9DIu9AfbZpYqv0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795451004;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=PBEKIwmlm68JPqk1+IxhEIhP5SR+X9JRgzwbdVtxN7w=;
	b=zYAhr2SYR0ahwPet+0ATvgxBuEAqqGS6DAKP0AyDsHaIFZR/QwydubEE/r9UgGiUHIEK
	 aJRr5vj4Ey1HnUQpduSMvmcR5J/o7ba1vYwshIOjfI/fNr1a2JlSzs3Acf5xcGVBEHtbt
	 x4IT2ZOrVdkUb0rlYgb2fKRN4Hgz6WlW5KWJZZshc78nSqhgFOXScuprNXHpF2KkssJ6s
	 fz6Mo4jPkPcyzyVarlZWKjHF3qYfxU1evvJ24rp5GPelUcf0MYKzhp/qqkx5ML4rXiuiq
	 18b+kchQCZ/bCclVpjJ5Q9vFzMhyHOGd9SPCkyy1IAiDC6hJ5NtrSt4zmWtLMRc0dhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LbWIkkpf;
	arc=none smtp.remote-ip=91.218.175.199
Received: from mta0.migadu.com (out-199.mta0.migadu.com [91.218.175.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A71606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:23:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9A71606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LbWIkkpf
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+aQKw6tPun4pr79Wyiw3tJn5bqKp4DiqK3iVZE+odMA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795451000; v=1; x=1796055800;
 b=LbWIkkpf+NVTs0ijO/2ma8CmT/dwWWWx6wabCenJvD4P5kW1VUHDWUiZaVTVsmSjPBniS/QP
 pZwKK5oXXSrf8rU9uvWtckgYJ+bFXcLAYejps5iTYkr/8XuBaobHTwC18OhDCOV0SfbUNPFXiiG
 xK8NpkkLWX9jwvw+kCen9eHY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 6ecce4449613c13f;
	Mon, 23 Nov 2026 16:23:20 +0000
X-Mizu-Trace-ID: 6ecce4449613c13f
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	tglx@kernel.org,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	ravi.bangoria@amd.com,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rkeilty@meta.com,
	atish.patra@linux.dev,
	dgreid@meta.com,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	kernel-team@meta.com
Cc: Usama Arif <usama.arif@linux.dev>,
	stable@vger.kernel.org
Subject: [PATCH] perf/x86/amd/ibs: Don't leak stack contents through PERF_SAMPLE_WEIGHT_STRUCT
Date: Mon, 23 Nov 2026 08:23:15 -0800
Message-ID: <20261123162315.1142701-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.1
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

For a load that missed the data cache, perf_ibs_parse_ld_st_data()
reports the miss latency as the sample weight and marks
PERF_SAMPLE_WEIGHT_TYPE as done, so perf_prepare_sample() leaves the
field alone. With PERF_SAMPLE_WEIGHT_STRUCT it writes only var1_dw and
var2_w, but perf_output_sample() copies all 8 bytes of the union into
the ring buffer. var3_w therefore carries whatever was left in the
on-stack struct perf_sample_data in perf_ibs_handle_irq().

CONFIG_INIT_STACK_ALL_ZERO hides this by clearing the struct on entry.
Without it, every such sample hands 2 bytes of kernel stack to user
space. "perf mem record" asks for PERF_SAMPLE_WEIGHT_STRUCT on x86, and
since v6.14 swfilt lets an unprivileged user sample their own tasks with
IBS.

Write var3_w as well.

Fixes: 6b2ae4952ef8 ("perf/x86/amd: Support PERF_SAMPLE_{WEIGHT|WEIGHT_STRUCT}")
Cc: stable@vger.kernel.org
Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 arch/x86/events/amd/ibs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/events/amd/ibs.c b/arch/x86/events/amd/ibs.c
index 66e67e27224f18..9aa47751b37f6c 100644
--- a/arch/x86/events/amd/ibs.c
+++ b/arch/x86/events/amd/ibs.c
@@ -1376,6 +1376,7 @@ static void perf_ibs_parse_ld_st_data(__u64 sample_type,
 		if (sample_type & PERF_SAMPLE_WEIGHT_STRUCT) {
 			data->weight.var1_dw = op_data3.dc_miss_lat;
 			data->weight.var2_w = op_data.tag_to_ret_ctr;
+			data->weight.var3_w = 0;
 		} else if (sample_type & PERF_SAMPLE_WEIGHT) {
 			data->weight.full = op_data3.dc_miss_lat;
 		}
-- 
2.53.1-Meta

