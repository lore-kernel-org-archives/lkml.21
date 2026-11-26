Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.54.195.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688951;
	b=Y537JtHMMzPCjWWP5Zy8mwSaISDOTSg4+SPD51biUv1rzm7IUHS13IpDiZq7kq6TuE0b
	 IlqxjP4eLFySwwZ4hKZ3UZwqz6Hb5uahlcB754JodNfHyfF41D2+LqqriC+MOVJnjrdS3
	 XqvNFFml4ALZ+7YTJ2ykau0bHoD2I9NRhtbXEdTO3kHeCWL5N2ktKq+hpCA7iMieHHf6T
	 C1aenbYS7uRR+GiP+bd+Ah5ff6jI68kYEe5ExXfseaFxn+q96RDSxYCK8utxSV3jt5wy8
	 KDniEnc1dY1XCx6h93yUs25oN7fbhSZWyOjp961ojfMZieb/2KXtFC99GDfT12QCjRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688951;
	h=DMARC-Filter:Received:Received:From:To:CC:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-Originating-IP:X-ClientProxiedBy;
	bh=qv1RQGlm8EJtWyprUSjXgxM7H5lRnLUjbPKRb3KF/xs=;
	b=VX/KuWefGZ/ZZM7pid5zV2Mrtyl/Jh1AipmTuGK78vtgb+RjUgnwWRu0+8IE48tneawr
	 gRn72NJgfk87ECysx1zWgwuIMK8d5RxQDxC83gWMejkQxVaNYUxmh0kDhWST1QGkdtOyf
	 VkyOx4m3VvcX3ube0qyfq0SYy08kCIxmyy4KkECLI4EHHUZP9Mb5S2Lqi9ozSUpAYU38k
	 WzLInzXFY3mWLu1SbaL1Y8bwpGSoPJmSfYK8VBifnT+UQlSgTnfR12Up64bUwv+L1t/eH
	 r6a5Tjz5MZy006qeyBYnC4OVAbo70dbUWlAkRSlD+YL9MDmqNqPaAmQ0k9Vbm1ljl0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fintech.ru;
	spf=pass smtp.mailfrom=fintech.ru;
	arc=none smtp.remote-ip=195.54.195.159
Received: from exchange.fintech.ru (exchange.fintech.ru [195.54.195.159])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DF0606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:29:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66DF0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fintech.ru
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.169) with Microsoft SMTP Server (TLS) id 14.3.498.0; Thu, 26 Nov
 2026 13:29:07 +0300
Received: from localhost (10.0.253.153) by Ex16-01.fintech.ru (10.0.10.18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 26 Nov
 2026 13:29:06 +0300
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
To: Zhenyu Wang <zhenyuw.linux@gmail.com>, Zhi Wang
	<zhi.wang.linux@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>,
	"Joonas Lahtinen" <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
	<rodrigo.vivi@intel.com>
CC: Nikita Zhandarovich <n.zhandarovich@fintech.ru>, Tvrtko Ursulin
	<tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>, <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
	<lvc-project@linuxtesting.org>
Subject: [PATCH v2] drm/i915/gvt: validate LRCA-derived guest context range
Date: Thu, 26 Nov 2026 13:28:54 +0300
Message-ID: <20261126102857.2719890-1-n.zhandarovich@fintech.ru>
X-Mailer: git-send-email 2.43.0
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
Content-Type: text/plain
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)

The GVT execlist context handling code derives GGTT page addresses from
desc->lrca in several places:
 - intel_vgpu_create_workload()
 - populate_shadow_context()
 - update_guest_context()

These paths translate addresses based on desc->lrca + page_index, but do
not first verify that the referenced guest context range fits in 32-bit
GMA space.

If desc->lrca is close enough (0xFFFFE, for instance) to the top
encodable page value, the page addition can exceed the representable
32-bit GMA range before the value is shifted and truncated for address
translation.

Fix this by validating the full LRCA-derived context range once during
workload creation, based on the engine context size, and reject invalid
descriptors before any GPA translation is attempted.

Also, use the same context page count helper in
populate_shadow_context() and update_guest_context(), so validation
and the later context accesses share the Broadwell RCS0 special case.

Found by Linux Verification Center (linuxtesting.org) with static
analysis tool SVACE.

Fixes: 28c4c6ca7f79 ("drm/i915/gvt: vGPU workload submission")
Cc: stable@vger.kernel.org
Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
---
v1 -> v2: 
 - Reuse the page count helper in both context copy paths, as suggested
   by the automated review of v1 [1].
 - Clarify the two-page minimum and simplify the range check.

Important note: v1 was ignored, I imagine, due to the fact that
i915.CI.Full tests did not all have PASS status [2]. Since v1 patch
only touched GVT-g workload creation and tests showed new issues
on GLK, TGL and DG2, there is a significant chance that the issues
were unrelated to the patch.

[1] https://lore.gitlab.freedesktop.org/drm-ai-reviews/review-patch1-20260529132430.1636603-1-n.zhandarovich%40fintech.ru/T/#m10cace1cbe046c03d2e77ed02d37ab9e9114b2ac
[2] https://lore.kernel.org/all/178012771442.26597.9069021566063616599@6beec6c84f66/

 drivers/gpu/drm/i915/gvt/scheduler.c | 41 ++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
index 15fdd514ca83..42cae61d3e79 100644
--- a/drivers/gpu/drm/i915/gvt/scheduler.c
+++ b/drivers/gpu/drm/i915/gvt/scheduler.c
@@ -68,6 +68,28 @@ static void set_context_pdp_root_pointer(
 		ring_context->pdps[i].val = pdp[7 - i];
 }
 
+static unsigned long
+intel_vgpu_context_page_num(const struct intel_engine_cs *engine)
+{
+	if (IS_BROADWELL(engine->i915) && engine->id == RCS0)
+		return 19;
+
+	return engine->context_size >> PAGE_SHIFT;
+}
+
+static bool
+intel_vgpu_lrca_range_valid(const struct intel_engine_cs *engine, u32 lrca)
+{
+	unsigned long context_page_num = intel_vgpu_context_page_num(engine);
+
+	/* Workload creation always accesses the page at LRCA + 1. */
+	if (context_page_num < 2)
+		return false;
+
+	return context_page_num - 1 <=
+		(U32_MAX >> I915_GTT_PAGE_SHIFT) - lrca;
+}
+
 static void update_shadow_pdps(struct intel_vgpu_workload *workload)
 {
 	struct execlist_ring_context *shadow_ring_context;
@@ -135,7 +157,6 @@ static void sr_oa_regs(struct intel_vgpu_workload *workload,
 static int populate_shadow_context(struct intel_vgpu_workload *workload)
 {
 	struct intel_vgpu *vgpu = workload->vgpu;
-	struct intel_gvt *gvt = vgpu->gvt;
 	struct intel_context *ctx = workload->req->context;
 	struct execlist_ring_context *shadow_ring_context;
 	void *dst;
@@ -220,11 +241,7 @@ static int populate_shadow_context(struct intel_vgpu_workload *workload)
 		return 0;
 
 	s->last_ctx[ring_id].valid = false;
-	context_page_num = workload->engine->context_size;
-	context_page_num = context_page_num >> PAGE_SHIFT;
-
-	if (IS_BROADWELL(gvt->gt->i915) && workload->engine->id == RCS0)
-		context_page_num = 19;
+	context_page_num = intel_vgpu_context_page_num(workload->engine);
 
 	/* find consecutive GPAs from gma until the first inconsecutive GPA.
 	 * read from the continuous GPAs into dst virtual address
@@ -980,11 +997,7 @@ static void update_guest_context(struct intel_vgpu_workload *workload)
 	vgpu_vreg_t(vgpu, RING_TAIL(ring_base)) = tail;
 	vgpu_vreg_t(vgpu, RING_HEAD(ring_base)) = head;
 
-	context_page_num = rq->engine->context_size;
-	context_page_num = context_page_num >> PAGE_SHIFT;
-
-	if (IS_BROADWELL(rq->i915) && rq->engine->id == RCS0)
-		context_page_num = 19;
+	context_page_num = intel_vgpu_context_page_num(rq->engine);
 
 	context_base = (void *) ctx->lrc_reg_state -
 			(LRC_STATE_PN << I915_GTT_PAGE_SHIFT);
@@ -1646,6 +1659,12 @@ intel_vgpu_create_workload(struct intel_vgpu *vgpu,
 	u32 guest_head;
 	int ret;
 
+	if (!intel_vgpu_lrca_range_valid(engine, desc->lrca)) {
+		gvt_vgpu_err("invalid guest context LRCA: 0x%x\n",
+			     desc->lrca);
+		return ERR_PTR(-EINVAL);
+	}
+
 	ring_context_gpa = intel_vgpu_gma_to_gpa(vgpu->gtt.ggtt_mm,
 			(u32)((desc->lrca + 1) << I915_GTT_PAGE_SHIFT));
 	if (ring_context_gpa == INTEL_GVT_INVALID_ADDR) {
-- 
2.43.0

