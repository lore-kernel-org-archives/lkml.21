Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.103
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795029342;
	b=aj5DTzSmzLzzg2oFj/t1zdiXeiwDBAr8WdZEy6+8PIht4LS4yIB/vkXN3v4buGFH5/wf
	 2zCRIRyoxXNJ4g1pF2dXKyZwoy8prBqynSsnYN9yGXEeGLyKLy5dvjFb2ExwrwHX2xkOv
	 hF9vvGZaBov4ENswODKaF+G1lIjME+a8KZeSLUGwqontpswAQbDhU+gp65ZAuctQ2ROa5
	 vOl+yDLrS7gBVCmQqv0Huhmv2UgxfzMxQnJAJH/XB1x+wSr0+HMdHLlUfbAjUygaN80sJ
	 IMGdyo4VdM1X2NDYboDdnjuMQ3eApbBa5v5cstfUoDr5tEmkrvBCoUIgkhza04GXD0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795029342;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ng2TPFdMxOFHLiZdjhAeL2IFis1gohsMTPuJTp5XCoM=;
	b=sHdWhJWKxy8NlTDi1eolAb1xCs/mUqneJa7Y6BRZpIsn+mwy9dG31y02Gg8XlV8w5JY3
	 b8akw/mNddNvq9ITqIogTUrrMAbfbiE7XRtlDmONN2Db247OqN2dJXbJ0WMBvNHUYBy6m
	 6QbRdzhbcERwSSLIYwVhBNclAenEx1rCQzqtE+z2oJZP541JfraI/k1Fp6iwav7fIZ7Xz
	 SsyBfniTDnkriZTXkGSwDDckzqzNlJtHaX3us/+ar52se80AizHtRIlFYX/1fZXRjmjgV
	 BLSj9Vyu5AbDwIHRDrTrDNAJZOsQuXXYUEPS8bwNa9IiOm6iAq/N+X2IZDIm5V47o3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bFl20dEL;
	arc=none smtp.remote-ip=95.215.58.103
Received: from mta1.migadu.com (out-103.mta1.migadu.com [95.215.58.103])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB886606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:15:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB886606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bFl20dEL
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=yJ/VgO6HGAtuOZaxpfVKTTpGQpLGk+yVE1GwJWY0ppQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795029339; v=1; x=1795634139;
 b=bFl20dELIk/bnrWQYSkbwYkGtvl2+h6a379s54Fsy0CrhqE2s554yDAuGymnyX+fsebHwgXU
 xOUokkwGT8m5P5qXsP7pCPyrBJFakR92VpK7dgufCTxI1hOHVU1v+lrzWl0EEWr0gAlbjcqzw5I
 kC8TuHRSb4xFpJHso0a3CCBc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f1c0974d48d30305;
	Wed, 18 Nov 2026 19:15:26 +0000
X-Mizu-Trace-ID: f1c0974d48d30305
X-Migadu-Flow: FLOW_OUT
From: Matthew Schwartz <matthew.schwartz@linux.dev>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com,
	chaitanya.kumar.borah@intel.com,
	Matthew Schwartz <matthew.schwartz@linux.dev>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Suraj Kandpal <suraj.kandpal@intel.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/2] drm/i915/color: only let the owning plane program the 3D LUT
Date: Wed, 18 Nov 2026 11:15:12 -0800
Message-ID: <20261118191514.2931270-2-matthew.schwartz@linux.dev>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118191514.2931270-1-matthew.schwartz@linux.dev>
References: <20261118191514.2931270-1-matthew.schwartz@linux.dev>
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

intel_color_plane_commit_arm() runs for every universal plane on pipes A
and B and rewrites LUT_3D_CTL from that plane's own 3D LUT state. Only
the primary plane on Xe3p_LPD can carry a 3D LUT colorop, so any other
plane update on those pipes disables the LUT the primary plane enabled,
and on older platforms every plane update writes a register no plane
owns.

Give the "Xe3p_LPD primary plane owns the 3D LUT" rule a single helper
and use it both to build the plane color pipeline and to decide who may
write LUT_3D_CTL.

Fixes: 65db7a1f9cf7 ("drm/i915/color: Add 3D LUT to color pipeline")
Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
---
 drivers/gpu/drm/i915/display/intel_color.c          | 10 +++++++++-
 drivers/gpu/drm/i915/display/intel_color.h          |  3 +++
 drivers/gpu/drm/i915/display/intel_color_pipeline.c | 10 +---------
 3 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 4070dc8d97d9..742ae471540d 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -4278,9 +4278,10 @@ void intel_color_plane_commit_arm(struct intel_dsb *dsb,
 				  const struct intel_plane_state *plane_state)
 {
 	struct intel_display *display = to_intel_display(plane_state);
+	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
 	struct intel_crtc *crtc = to_intel_crtc(plane_state->uapi.crtc);
 
-	if (crtc && intel_color_crtc_has_3dlut(display, crtc->pipe))
+	if (crtc && intel_color_plane_has_3dlut(display, plane->pipe, plane->id))
 		glk_lut_3d_commit(dsb, crtc, !!plane_state->hw.lut_3d);
 }
 
@@ -4313,6 +4314,13 @@ intel_color_crtc_has_3dlut(struct intel_display *display, enum pipe pipe)
 		return false;
 }
 
+bool intel_color_plane_has_3dlut(struct intel_display *display,
+				 enum pipe pipe, enum plane_id plane_id)
+{
+	return DISPLAY_VER(display) >= 35 && plane_id == PLANE_PRIMARY &&
+		intel_color_crtc_has_3dlut(display, pipe);
+}
+
 static void
 intel_color_load_3dlut(struct intel_dsb *dsb,
 		       const struct intel_plane_state *plane_state)
diff --git a/drivers/gpu/drm/i915/display/intel_color.h b/drivers/gpu/drm/i915/display/intel_color.h
index f3963a8d1239..9d11741423ef 100644
--- a/drivers/gpu/drm/i915/display/intel_color.h
+++ b/drivers/gpu/drm/i915/display/intel_color.h
@@ -16,6 +16,7 @@ struct intel_dsb;
 struct intel_plane_state;
 struct drm_property_blob;
 enum pipe;
+enum plane_id;
 
 void intel_color_init_hooks(struct intel_display *display);
 int intel_color_init(struct intel_display *display);
@@ -47,6 +48,8 @@ void intel_color_plane_program_pipeline(struct intel_dsb *dsb,
 void intel_color_plane_commit_arm(struct intel_dsb *dsb,
 				  const struct intel_plane_state *plane_state);
 bool intel_color_crtc_has_3dlut(struct intel_display *display, enum pipe pipe);
+bool intel_color_plane_has_3dlut(struct intel_display *display,
+				 enum pipe pipe, enum plane_id plane_id);
 u32 intel_color_background_color_drm_to_hw(u64 drm_background_color);
 u64 intel_color_background_color_hw_to_drm(u32 hw_background_color);
 
diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.c b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
index 7fc31fe891a8..77f65182e3e3 100644
--- a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
+++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
@@ -58,14 +58,6 @@ static const u64 intel_plane_supported_csc_ff =
 		BIT(DRM_COLOROP_FM_YCBCR2020_NC_FULL_RGB) |
 		BIT(DRM_COLOROP_FM_YCBCR2020_NC_LIMITED_RGB);
 
-static bool plane_has_3dlut(struct intel_display *display, enum pipe pipe,
-			    struct drm_plane *plane)
-{
-	return (DISPLAY_VER(display) >= 35 &&
-		intel_color_crtc_has_3dlut(display, pipe) &&
-		plane->type == DRM_PLANE_TYPE_PRIMARY);
-}
-
 static
 struct intel_colorop *intel_color_pipeline_plane_add_colorop(struct drm_plane *plane,
 							     struct intel_colorop *prev,
@@ -144,7 +136,7 @@ int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop_en
 	int ret = 0;
 	int i;
 
-	if (plane_has_3dlut(display, pipe, plane)) {
+	if (intel_color_plane_has_3dlut(display, pipe, to_intel_plane(plane)->id)) {
 		pipeline = xe3plpd_primary_plane_pipeline;
 		pipeline_len = ARRAY_SIZE(xe3plpd_primary_plane_pipeline);
 	} else if (icl_is_hdr_plane(display, to_intel_plane(plane)->id)) {
-- 
2.56.1

