Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429671;
	b=EGbhdoU6c3NCn2J/QuQUXdVA0RrB6PXPztilb6m1HhTXbM0gx0/1d1/THrm/YiGsiEPj
	 SNUMY2huRZNPg8/sT9Zug9i3avPxdpCIj4/oRNabDRqKdBSI0RUx0GCE9xZKWv6WUdcnc
	 LjdUO2e7g8uF+Y6ytfPzRuZm0WP5+52/IIMi1A08xDM6xIFqg+xYEpWrXCmqX8KaA2WYs
	 iMqLxBHKARedmPZ3yrx8H0uXj4ZmkCUSX7D+kaYLAPMcItsSTV/zNJ1c27eNkI+6GA546
	 YDGqq0hQlTK5/j4sXAzDlIszTNuRBI5QR7wE+pC1WsIiSMdT0N3d0jfWsiyAE7KT5yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Lc4/7eyOMTgZOdl/n/DtcDMWRq2CQUDPal/eQWw1Gm0=;
	b=OjSM6W+3z8U1zsGFyWJZcs4GEnNnXfTXErmkJEv5x5apledYkZhViFgiJOXWLUHqfbh/
	 H2G14Xt0u2fbuaVdglLNiWX1vkN6ZJuOLWoXIwBLdPsbJGjBOx5KAUDPCIGl/LG4/im2E
	 twyYIAE9aaz1RpOEjiVNdyGt/DrijUTrfwKztV7t71dMwbwvgtDuIGlcjlij+ezI7aQ9J
	 ieLnEfm3ut7acvmtAjQ9VBDMglF7uz3Fg60vbRsQUqLqAJkXsdXpechpnJRDEoKLH7WZa
	 YkwvrxaTfPRES6Mr5INORM5/tCz9Fu6br5zYx1Bu4RngTkFPiiF5x6/36JrDRBrJj4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wjvz1xTa;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793E8606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:27:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 793E8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wjvz1xTa
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3863db981d4so4115003eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795429670; x=1796034470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lc4/7eyOMTgZOdl/n/DtcDMWRq2CQUDPal/eQWw1Gm0=;
        b=Wjvz1xTamcJlGMxExHg1vqoU1wpahLAzRQM0c5iW2N4Ipg8ejjJToozitBjQ+jNxao
         v3O50AqcswVfr3fcrEUSGEL+WqESml/pouk8ltkgXA/78O16YjMJLhcgrQg4x4bbLwVU
         CALCtRpoDowB8a191mZnIxeF2HzIP7Y/4oy0jq5E5J5IXWrzJqcZseZDm9tQgKWFSi+9
         V6GmeBtPiDlCFktqpyjW7Hx1H9rpXJkBAsg70x4JkIO4Tq9LvWSK/5+Se2eNWUw9wv/y
         1ita8yV217XasCUoIdAdampKWhchyuaJqc+t98VEg7h4zsF7CHcHAPxqsNatu6TCiCuv
         cusg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795429670; x=1796034470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lc4/7eyOMTgZOdl/n/DtcDMWRq2CQUDPal/eQWw1Gm0=;
        b=zi0ckMMbT0EVbQmUniDH06JYuiVUZrzwalXqOIoNYBAWKPa8AcjGXrotlY0c3H0n07
         b/WdlL9J3OVIryUSm9l4JKj/7NeUfkDXVHy01XoSSOQ09C1jPKA/hsHaziJXYGWH81Gf
         xxwBlFlHBlKpn23RKlSb4bjhnVaEOyyyjGsA3ntzU+NQ5Ovssm+4pnBJtGk2qJ42XKeh
         KVHtwTOGNtwMfQ7YPbbczbg6JMzr7srr6biooXvfOWJj3WO3JCBSHSQI5SDF61AHDHSt
         v/gUndGuYGljaAnh4pLHIUNqkDDjOxkKes7tibewSZ6n79Vy44KUcepN1rCnVv1IOKhb
         YJrQ==
X-Forwarded-Encrypted: i=1; AL+hErFbOetYRkS+opm/CT2QS7GHLJPZQeJH7+SjkvU/dPyyCfo3I+pYrr/GV8/TariLHMSbdwEFhJ4fKFZjsGI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IZa4lgR4qGaz2SFajapfCp0E4m7vDYFcQCL4gAfUcwLDnQ3JN
	drvWLGNFJpW4qEvI9n+Mvoq9z7r34QGjBzsjvFsFPhzJ83EetePlYHU=
X-Gm-Gg: AZFdTZf4d3A81SlTiuQwlY+IJmqCzMHO1kBzWnP04JYCJBBTFHjxpoT0G1PeaOpNAQ7
	e2dfQTmcxLpLEs+IGPNiB54wWqdYiY4Qo3mxFNn/pKvzDpr6p9mGTXxvWp3ail/RqTO/uzbl3xj
	lY7JNLwkpdH2TM6XlnKXAER3e2PBCMU/RlHEAQN5FJ7/qp7CCWsmi2F18yVuxD1C+aMOklt29rS
	uQbtM9DL2C2efeYarCZKUMGpbUf8dVCYMcAhJ0aI46SbTr0eUm4l7zNHilYzHlV0DI/0vsrhFm2
	lkpfd5wARD+FJ7G8acQG/chTtXncEckV0wdrLrGwqMj7DoUgokv5h9SMbE6xEcfMTwDBoKTA05b
	jyxXQ+i9BzVIfUYLLja1WvXLU3vyA4Tkd2qO5qN6aMUHccspdugxvyNFgTivKO1JsuktG/NMAxA
	9KOj+OjRLs1mESRSIhysnxkdBbh7QjAyW2r1k5i1jLYhg4tRz61QP2+MbnDBr28ngeAQB8lxoKZ
	VuJ12vEtNtcsgKrery8dp3lN4Q78y4XU5Qn9X15GbA3XtS4CBizv6xRjDXiaMGb3dVFvatOElhQ
	jc2yqLKEtoesICkdpdIOYNgMTTgvuN69ldJJwr51SJJcl6lcj15+iU2lyO8c8crT6yhSRLlxsQS
	E3DU4/IhsotACbQ==
X-Received: by 2002:a05:693c:87c8:20b0:386:ac97:f661 with SMTP id 5a478bee46e88-386ac97f9cdmr3106585eec.9.1795429669425;
        Mon, 23 Nov 2026 02:27:49 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009.tailbdca44.ts.net ([106.205.242.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c0c1dsm37939268eec.21.2026.11.23.02.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:27:48 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Doitall <diainquiries@protonmail.com>,
	Ed Schofield <ed@aicharmers.com>,
	Andre Eikmeyer <dev@deq.rocks>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3] drm/amd/amdgpu: Add 5K Support for iMac20,1 and iMac20,2
Date: Mon, 23 Nov 2026 05:27:32 -0500
Message-ID: <20261123102740.1389-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
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

This code adds support for 5K in iMac20,1 and iMac20,2 with
support of changing resolutions.

0x4F1 is an Apple-specific DPCD register on the iMac 5K TCON that
selects tile mode: with 0x4F1 = 0 the panel comes up as a single
3840x2160 display, and with 0x4F1 = 1 it is driven as 5120x2880 over
two tiles.

On these iMacs, 0x4F1 = 1 is also required for the SMU to boot
properly. With it unset at SMU init, we see crashes in 5/10 boots even
with the 5K support applied (UCLK still works). With it set, or with the
display IP block initialized before SMU, crashes drop to 0/10.

To avoid depending on the bootloader, init the display IP block before
SMU on DMI-matched iMac20,1/20,2, so 0x4F1 is set before SMU init.

Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4455
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4895

(Tested on iMac20,1 and iMacPro1,1)

Tested-by: Doitall <diainquiries@protonmail.com>
Co-developed-by: Ed Schofield <ed@aicharmers.com>
Signed-off-by: Ed Schofield <ed@aicharmers.com>
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
Changes in v3:
- Restricted the display to 10bpc
Changes in v2:
- Added check to remove thunderbolt devices from 5K list
- defined 0x4f1 as DP_APPLE_5K_TILE_MODE
- Added iMacPro1,1 to 5K list

 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 43 +++++++++++++++++--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 28 ++++++++++++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  7 +++
 .../display/amdgpu_dm/amdgpu_dm_connector.c   | 35 +++++++++++++--
 .../amd/display/amdgpu_dm/amdgpu_dm_quirks.c  | 38 +++++++++++++++-
 .../gpu/drm/amd/display/dc/core/dc_resource.c |  9 ++++
 drivers/gpu/drm/amd/display/dc/dc.h           |  2 +
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h  |  2 +
 .../amd/display/dc/hwss/dce110/dce110_hwseq.c | 37 ++++++++++++++--
 .../drm/amd/display/dc/link/link_detection.c  | 13 ++++++
 .../gpu/drm/amd/display/dc/link/link_dpms.c   |  3 ++
 .../display/dc/link/protocols/link_dp_phy.c   |  5 +++
 .../dc/link/protocols/link_dp_training.c      | 10 ++++-
 13 files changed, 219 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index 890792a94..a907d5629 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
@@ -21,6 +21,7 @@
  *
  */
 
+#include <linux/dmi.h>
 #include <linux/firmware.h>
 #include <linux/kernfs.h>
 
@@ -3412,8 +3413,34 @@ static int amdgpu_discovery_set_ualink_ip_blocks(struct amdgpu_device *adev)
 	return 0;
 }
 
+static const struct dmi_system_id imac5k_table[] = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "iMac20,1"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "iMac20,2"),
+		},
+	},
+	{}
+};
+
+static bool amdgpu_discovery_is_imac5k(struct amdgpu_device *adev)
+{
+	if (pci_is_thunderbolt_attached(adev->pdev) ||
+	    dev_is_removable(&adev->pdev->dev))
+		return false;
+
+	return dmi_check_system(imac5k_table);
+}
+
 int amdgpu_discovery_set_ip_blocks(struct amdgpu_device *adev)
 {
+	bool imac5k;
 	int r;
 
 	switch (adev->asic_type) {
@@ -4026,15 +4053,25 @@ int amdgpu_discovery_set_ip_blocks(struct amdgpu_device *adev)
 		}
 	}
 
+	/* TODO: We should enable 5K in EFI and remove this quirk */
+	imac5k = amdgpu_discovery_is_imac5k(adev);
+	if (unlikely(imac5k)) {
+		r = amdgpu_discovery_set_display_ip_blocks(adev);
+		if (r)
+			return r;
+	}
+
 	if (likely(adev->firmware.load_type == AMDGPU_FW_LOAD_PSP)) {
 		r = amdgpu_discovery_set_smu_ip_blocks(adev);
 		if (r)
 			return r;
 	}
 
-	r = amdgpu_discovery_set_display_ip_blocks(adev);
-	if (r)
-		return r;
+	if (likely(!imac5k)) {
+		r = amdgpu_discovery_set_display_ip_blocks(adev);
+		if (r)
+			return r;
+	}
 
 	r = amdgpu_discovery_set_gc_ip_blocks(adev);
 	if (r)
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 5b634ae07..ea0af1fdd 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -639,6 +639,8 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
 	retrieve_dmi_info(&adev->dm);
 	if (adev->dm.edp0_on_dp1_quirk)
 		init_data.flags.support_edp0_on_dp1 = true;
+	if (adev->dm.imac5K_support)
+		init_data.flags.imac5K_support = true;
 
 	if (adev->dm.bb_from_dmub)
 		init_data.bb_from_dmub = adev->dm.bb_from_dmub;
@@ -1967,6 +1969,11 @@ static int dm_resume(struct amdgpu_ip_block *ip_block)
 		dc_exit_ips_for_hw_access(dm->dc);
 		WARN_ON(!dc_commit_streams(dm->dc, &commit_params));
 
+		if (dm->dc->config.imac5K_using_5K) {
+			const u8 value = 1;
+
+			core_link_write_dpcd(dm->dc->links[0], DP_APPLE_5K_TILE_MODE, &value, 1);
+		}
 		dm_gpureset_commit_state(dm->cached_dc_state, dm);
 
 		dm_gpureset_toggle_interrupts(adev, dm->cached_dc_state, true);
@@ -4739,6 +4746,27 @@ static void amdgpu_dm_commit_streams(struct drm_atomic_commit *state,
 	dc_exit_ips_for_hw_access(dm->dc);
 	WARN_ON(!dc_commit_streams(dm->dc, &params));
 
+	if (dm->imac5K_support) {
+		for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
+			dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
+
+			if (!dm_new_crtc_state->stream)
+				continue;
+
+			if (dm_new_crtc_state->stream->signal != SIGNAL_TYPE_EDP)
+				continue;
+
+			if (new_crtc_state->mode.vdisplay == 2880 &&
+			    new_crtc_state->mode.hdisplay == 2560) {
+				u8 value = 1;
+
+				core_link_write_dpcd(dm->dc->links[0],
+						     DP_APPLE_5K_TILE_MODE, &value, 1);
+				dm->dc->config.imac5K_using_5K = true;
+			} else
+				dm->dc->config.imac5K_using_5K = false;
+		}
+	}
 	bool frl_stream_found = false;
 
 	for (i = 0; i < params.stream_count; i++) {
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 1b91fe4c3..65a2330c6 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -698,6 +698,13 @@ struct amdgpu_display_manager {
 	 */
 	bool edp0_on_dp1_quirk;
 
+	/**
+	 * @imac5K_support:
+	 *
+	 * quirk for iMac that support 5K
+	 */
+	bool imac5K_support;
+
 	/**
 	 * @dpia_aux_lock:
 	 *
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
index 2b81396bd..e51ca7c95 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
@@ -123,6 +123,14 @@ STATIC_IFN_KUNIT int dm_encoder_helper_atomic_check(struct drm_encoder *encoder,
 				       drm_mode_vrefresh(adjusted_mode));
 			dm_new_connector_state->scaling = RMX_ASPECT;
 		}
+
+		/* The 5K panel reports no scaling info, scale every non 5K mode to full */
+		if (aconnector->dc_link && aconnector->dc_link->dc->config.imac5K_support) {
+			if (crtc_state->mode.vdisplay != 2880)
+				dm_new_connector_state->scaling = RMX_FULL;
+			else
+				dm_new_connector_state->scaling = RMX_OFF;
+		}
 		return 0;
 	}
 
@@ -3130,9 +3138,19 @@ STATIC_IFN_KUNIT int amdgpu_dm_connector_get_modes(struct drm_connector *connect
 	const struct drm_edid *drm_edid = amdgpu_dm_connector->drm_edid;
 	struct dc_link_settings *verified_link_cap = &dc_link->verified_link_cap;
 	const struct dc *dc = dc_link->dc;
+	struct dc_sink *sink = amdgpu_dm_connector->dc_sink;
 
 	encoder = amdgpu_dm_connector_to_encoder(connector);
 
+	if (dc->config.imac5K_support && sink &&
+	    sink->link->link_index == 1 && !connector->edid_blob_ptr) {
+		const struct drm_edid *kept = drm_edid_alloc(sink->dc_edid.raw_edid,
+							     sink->dc_edid.length);
+
+		drm_edid_connector_update(connector, kept);
+		drm_edid_free(kept);
+	}
+
 	if (!drm_edid) {
 		amdgpu_dm_connector->num_modes =
 				drm_add_modes_noedid(connector, 640, 480);
@@ -3312,11 +3330,20 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
 				adev->mode_info.underscan_vborder_property,
 				0);
 
-	if (!aconnector->mst_root)
-		drm_connector_attach_max_bpc_property(&aconnector->base, 8, 16);
+	if (!aconnector->mst_root) {
+		if (dm->imac5K_support && link_index <= 1)
+			drm_connector_attach_max_bpc_property(&aconnector->base, 10, 10);
+		else
+			drm_connector_attach_max_bpc_property(&aconnector->base, 8, 16);
+	}
 
-	aconnector->base.state->max_bpc = 16;
-	aconnector->base.state->max_requested_bpc = aconnector->base.state->max_bpc;
+	if (dm->imac5K_support && link_index <= 1) {
+		aconnector->base.state->max_bpc = 10;
+		aconnector->base.state->max_requested_bpc = 10;
+	} else {
+		aconnector->base.state->max_bpc = 16;
+		aconnector->base.state->max_requested_bpc = aconnector->base.state->max_bpc;
+	}
 
 	if (connector_type == DRM_MODE_CONNECTOR_HDMIA) {
 		/* Content Type is currently only implemented for HDMI. */
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_quirks.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_quirks.c
index 259966703..a84ff90ef 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_quirks.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_quirks.c
@@ -33,11 +33,13 @@
 struct amdgpu_dm_quirks {
 	bool aux_hpd_discon;
 	bool support_edp0_on_dp1;
+	bool imac5K_support;
 };
 
 static struct amdgpu_dm_quirks quirk_entries = {
 	.aux_hpd_discon = false,
-	.support_edp0_on_dp1 = false
+	.support_edp0_on_dp1 = false,
+	.imac5K_support = false,
 };
 
 static int edp0_on_dp1_callback(const struct dmi_system_id *id)
@@ -52,6 +54,12 @@ static int aux_hpd_discon_callback(const struct dmi_system_id *id)
 	return 0;
 }
 
+static int imac5K_support_callback(const struct dmi_system_id *id)
+{
+	quirk_entries.imac5K_support = true;
+	return 0;
+}
+
 static const struct dmi_system_id dmi_quirk_table[] = {
 	{
 		.callback = aux_hpd_discon_callback,
@@ -151,6 +159,27 @@ static const struct dmi_system_id dmi_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "HP ProBook 465 16 inch G11 Notebook PC"),
 		},
 	},
+	{
+		.callback = imac5K_support_callback,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "iMac20,1"),
+		},
+	},
+	{
+		.callback = imac5K_support_callback,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "iMac20,2"),
+		},
+	},
+	{
+		.callback = imac5K_support_callback,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "iMacPro1,1"),
+		},
+	},
 	{}
 	/* TODO: refactor this from a fixed table to a dynamic option */
 };
@@ -162,6 +191,7 @@ void retrieve_dmi_info(struct amdgpu_display_manager *dm)
 
 	dm->aux_hpd_discon_quirk = false;
 	dm->edp0_on_dp1_quirk = false;
+	dm->imac5K_support = false;
 
 	dmi_id = dmi_check_system(dmi_quirk_table);
 
@@ -176,6 +206,12 @@ void retrieve_dmi_info(struct amdgpu_display_manager *dm)
 		dm->edp0_on_dp1_quirk = true;
 		drm_info(dev, "support_edp0_on_dp1 attached\n");
 	}
+	if (quirk_entries.imac5K_support &&
+	    !pci_is_thunderbolt_attached(dm->adev->pdev) &&
+	    !dev_is_removable(&dm->adev->pdev->dev)) {
+		dm->imac5K_support = true;
+		drm_info(dev, "imac5K_support attached\n");
+	}
 }
 EXPORT_IF_KUNIT(retrieve_dmi_info);
 
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index 187486d97..e62f14f04 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -711,6 +711,15 @@ bool resource_are_streams_timing_synchronizable(
 				!= stream2->timing.pix_clk_100hz)
 		return false;
 
+	if (stream1->ctx->dc->config.imac5K_support &&
+			((stream1->signal == SIGNAL_TYPE_EDP &&
+			  stream2->signal == SIGNAL_TYPE_DISPLAY_PORT &&
+			  stream2->link->link_index == 1) ||
+			 (stream2->signal == SIGNAL_TYPE_EDP &&
+			  stream1->signal == SIGNAL_TYPE_DISPLAY_PORT
+			  && stream1->link->link_index == 1)))
+		return true;
+
 	if (stream1->clamping.c_depth != stream2->clamping.c_depth)
 		return false;
 
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index d3c484f45..a0b746250 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -635,6 +635,8 @@ struct dc_config {
 	struct spl_sharpness_range dcn_sharpness_range;
 	struct spl_sharpness_range dcn_override_sharpness_range;
 	bool no_native422_support;
+	bool imac5K_support;
+	bool imac5K_using_5K;
 };
 
 enum visual_confirm {
diff --git a/drivers/gpu/drm/amd/display/dc/dc_dp_types.h b/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
index b0e91b321..09bcb1600 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
@@ -1510,6 +1510,8 @@ struct dp_trace {
 /* TODO - This is a temporary location for any new DPCD definitions.
  * We should move these to drm_dp header.
  */
+/* Apple 5K iMac TCON, 1 drives the panel as two tiles */
+#define DP_APPLE_5K_TILE_MODE				0x4F1
 #ifndef DP_LINK_SQUARE_PATTERN
 #define DP_LINK_SQUARE_PATTERN				0x10F
 #endif
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
index 7b3aa02dd..aba1dc9b4 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
@@ -2656,7 +2656,8 @@ enum dc_status dce110_apply_ctx_to_hw(
 	struct dce_hwseq *hws = dc->hwseq;
 	struct dc_bios *dcb = dc->ctx->dc_bios;
 	enum dc_status status;
-	unsigned int i;
+	unsigned int i, n, enable_order[MAX_PIPES];
+	int primary = -1, companion = -1;
 	bool was_hpo_acquired = resource_is_hpo_acquired(dc->current_state);
 	bool is_hpo_acquired = resource_is_hpo_acquired(context);
 
@@ -2664,6 +2665,32 @@ enum dc_status dce110_apply_ctx_to_hw(
 	if (dc->config.use_pipe_ctx_sync_logic)
 		reset_syncd_pipes_from_disabled_pipes(dc, context);
 
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
+
+		enable_order[i] = i;
+		if (!dc->config.imac5K_support || !pipe->stream ||
+		    pipe->top_pipe || pipe->prev_odm_pipe)
+			continue;
+		if (pipe->stream->link->link_index == 0)
+			primary = i;
+		else if (pipe->stream->link->link_index == 1)
+			companion = i;
+	}
+	if (companion >= 0 && primary > companion) {
+		enable_order[companion] = primary;
+		enable_order[primary] = companion;
+	}
+
+	if (primary >= 0 && companion >= 0) {
+		struct pipe_ctx *old = &dc->current_state->res_ctx.pipe_ctx[primary];
+		struct dc_link *right = context->res_ctx.pipe_ctx[companion].stream->link;
+
+		if (!old->stream ||
+		    pipe_need_reprogram(old, &context->res_ctx.pipe_ctx[primary]))
+			right->link_state_valid = false;
+	}
+
 	/* Reset old context */
 	/* look up the targets that have been removed since last commit */
 	hws->funcs.reset_hw_ctx_wrap(dc, context);
@@ -2705,10 +2732,12 @@ enum dc_status dce110_apply_ctx_to_hw(
 		dc->hwseq->funcs.setup_hpo_hw_control(dc->hwseq, is_hpo_acquired);
 	}
 
-	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+	for (n = 0; n < dc->res_pool->pipe_count; n++) {
 		struct pipe_ctx *pipe_ctx_old =
-					&dc->current_state->res_ctx.pipe_ctx[i];
-		struct pipe_ctx *pipe_ctx = &context->res_ctx.pipe_ctx[i];
+			&dc->current_state->res_ctx.pipe_ctx[enable_order[n]];
+		struct pipe_ctx *pipe_ctx = &context->res_ctx.pipe_ctx[enable_order[n]];
+
+		i = enable_order[n];
 
 		if (pipe_ctx->stream == NULL)
 			continue;
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
index b4546f93a..9b69a8013 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
@@ -1205,7 +1205,11 @@ static bool detect_link_and_local_sink(struct dc_link *link,
 				if (!link->dpcd_caps.set_power_state_capable_edp)
 					link->wa_flags.dp_keep_receiver_powered = true;
 			}
+			if (dc->config.imac5K_support) {
+				const uint8_t val = 1;
 
+				core_link_write_dpcd(link, DP_APPLE_5K_TILE_MODE, &val, 1);
+			}
 			sink_caps.transaction_type = DDC_TRANSACTION_TYPE_I2C_OVER_AUX;
 			sink_caps.signal = SIGNAL_TYPE_EDP;
 			break;
@@ -1634,6 +1638,15 @@ bool link_detect(struct dc_link *link, enum dc_detect_reason reason)
 	bool is_delegated_to_mst_top_mgr = false;
 	enum dc_connection_type pre_link_type = link->type;
 
+	if (link->local_sink &&
+			link->dc->config.imac5K_support &&
+			link->local_sink->link->link_index == 1)
+		return false;
+
+	if (reason == DETECT_REASON_BOOT && link->dc->config.imac5K_support &&
+	    link->link_index == 1)
+		msleep(100);
+
 	is_local_sink_detect_success = detect_link_and_local_sink(link, reason);
 
 	if (is_local_sink_detect_success && link->local_sink) {
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_dpms.c b/drivers/gpu/drm/amd/display/dc/link/link_dpms.c
index 2aeb9a0e6..3d7d1ddc4 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_dpms.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_dpms.c
@@ -2084,6 +2084,9 @@ static enum dc_status enable_link_dp(struct dc_state *state,
 			!link->dc->config.enable_dpia_pre_training)
 		do_fallback = true;
 
+	if (link->dc->config.imac5K_support && link->link_index == 1)
+		msleep(100);
+
 	/*
 	 * Temporary w/a to get DP2.0 link rates to work with SST.
 	 * TODO DP2.0 - Workaround: Remove w/a if and when the issue is resolved.
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.c
index 49521ac4b..e7ce8e903 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.c
@@ -53,6 +53,11 @@ void dpcd_write_rx_power_ctrl(struct dc_link *link, bool on)
 	core_link_write_dpcd(link, DP_SET_POWER, &state,
 						 sizeof(state));
 
+	if (on && link->dc->config.imac5K_support &&
+	    link->connector_signal == SIGNAL_TYPE_EDP) {
+		state = 1;
+		core_link_write_dpcd(link, DP_APPLE_5K_TILE_MODE, &state, sizeof(state));
+	}
 }
 
 void dp_enable_link_phy(
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c
index 3be36d106..0618333bb 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c
@@ -1540,8 +1540,16 @@ static enum link_training_result dp_transition_to_video_idle(
 		 */
 		if (link->connector_signal != SIGNAL_TYPE_EDP && status == LINK_TRAINING_SUCCESS) {
 			msleep(5);
-			if (!link->skip_fallback_on_link_loss)
+			if (link->dc->config.imac5K_support && link->link_index == 1) {
+				/* The 5K tile link only has to answer AUX */
+				uint8_t lanes;
+
+				if (core_link_read_dpcd(link, DP_LANE0_1_STATUS,
+							&lanes, 1) != DC_OK)
+					status = LINK_TRAINING_LINK_LOSS;
+			} else if (!link->skip_fallback_on_link_loss) {
 				status = dp_check_link_loss_status(link, lt_settings);
+			}
 		}
 		return status;
 	}
-- 
2.55.0

