Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795737772;
	b=gl2kVkLtPy6Z24jqCOdyxq7fPY9Znx292/huIZPdc3MzRYrhmJcqFPOOsGfCAzbV0zXB
	 6FIsafOuqG2hoiY6oKdSxJPAhd8DArPYEdj+eJDLHzf9IWTdwMzU5zLp3sWkeyFZzo2W9
	 FhtCJi15RgiL+KfW2fGQ7Xy8DavmbF7AsJLifHgVv1uXYqEifjgkEB4inOLqMsHNIgrAM
	 4DcaLGg13FaDk6jdTi7UntuqTqwH6pc7sUFktJmjZ3CiMr3vK0a5bx3YNDcjXtpFmhADw
	 YMMWBC9vqGx1aDiBHX3n/i4ST0XA7NXEFvoH0h+0ix8XVYyfNrqR2GUAGTHjC5hHAcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795737772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Content-Language:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=xjtr07JDs5eYYSE0PvekGDI6C8K/1rOMD113yDyp5fc=;
	b=CB2uSvRJeHxq8q9KHj4cy8r0WEDRD4+xmYghHRgBB7qRzH6zggaxDi4DaXSkwtc4+W2a
	 nm1v0TO7yfRJGDxIeEq5EDYlqXphS8drEpnbN4l30Db2owa9tNElQES7djtHyBPbnqkYE
	 JE5Pzb5R0OcWLcaCyzRagRcUc6CkUKZAjYOJyXufw4WigJrAxTGooEB/ZULVeJe3/Kzpc
	 4PODE/nlCPtI1AEgCL3kR8UEc2rqcn7DK8TqG5ThLfQMf9MMf6fiYREN9uqMPi64cmFEM
	 ZHZldP+hl57d6pcjWF+m1McEPzr+2Z31at8TXke+7sVKZQL0dxthFyp0wxtN3dqQxfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uMYcnx4Y;
	arc=none smtp.remote-ip=74.125.225.137
Received: from mail-wm2-f9.google.com (mail-wm2-f9.google.com [74.125.225.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3904606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:02:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3904606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uMYcnx4Y
Received: by mail-wm2-f9.google.com with SMTP id 5b1f17b1804b1-4b4e4d13850so24367915e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795737770; x=1796342570; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xjtr07JDs5eYYSE0PvekGDI6C8K/1rOMD113yDyp5fc=;
        b=uMYcnx4Yh37Y+xLN+Il2C4Kd7Ny2wm1aF0aJdhPVmM9j6HdceMZ6t/O/cIzk7Q4Aod
         yD4mgqX0gbLXEuZWVTSnnUiFzsZl34cMmaqzdCzU7i8fPTinMVEGSkyvlrsmanXxQv3x
         GL/YZ1hFELi2YhO3H9CWCgXbyHrhj6GbEOxCrCOiEqVrFd9yx5s1L8a8amqEtW2pCfPu
         qFSGK8sBthgWAcGndrC+DBsRX+jhdFXlBNUQjVdWck0T65SyRxmjzk+eiWews4VAVQPp
         cJ+71v94hlzidiBkjYmqrzisMKyXt+kydsUHV4Tc7qNzq0BLWxP/Rz/VhRCxjs7BmkiA
         9bvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795737770; x=1796342570;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xjtr07JDs5eYYSE0PvekGDI6C8K/1rOMD113yDyp5fc=;
        b=wZ+/GddBN6vQ02b2XX8h2/psUOZu/LBkmq/Y2kJMIPLmBjE6tkNi8x4zD8z8KdOSmU
         h9lj4qa+Y7RAKzQP/vhAyBDJ6Y8astMpIlelTm308qxMcOGzbYGKtPWOTnr+46nHOSFQ
         WoyUrjxyT+9DpqRFAr8S1LK2+GjJmq/QE1hip10bNshz1m1UIQiu0OdDjGmkwgj3Xihq
         E1TpkCuF2JREZu9xpBVNGhLCeJhHcAnDrfaTA7JcU8+WWc/vlNU0jkvY/BLm+fOZsoev
         TKHtrADSa4STlZDEjneS3Rm02+aYLmpt56C5sgrRqAXV8nGKa5jL2A3bailGUXcRQtz2
         2/Bg==
X-Forwarded-Encrypted: i=1; AL+hErGEQpq/sM2/HfCjC+iCVPdwOodyHJS4OuHa6Ymm91rUbyQjYXpS6a/c5u9f7ejoq+rS1A/1lJBlwNG5Tuo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rQbuQuJmx564R/t5WPxGQZ9QYRsaT0qdb5/KpHu88tyXqzfoq
	xFQLhyfbq4yAgNoAPfb+vW/ImchWm2Khjth4WXXjBJmCHXziD3Sn7xFU
X-Gm-Gg: AZFdTZcujca0sLm01/XVPza4PxQHznapai9wXlCEV7a2fnkLM0Ww/6VswIC3g1ZdLgq
	OKbmxynWzhytQvt7w7XclS7QvCXNeB+bP5roQkiCbMPUVbQ7BbwSKWzYCTo1hL1KegzdD9dFUf2
	a+1/BPANfO3VkCFgpQtHabbvsbsLtyY8kj13rBTFuyVobqsTR1b07X5ipVOLbRre9oe4b/d9sKs
	CF57WnZAwBGewCD/ZJtVdK/ktKLHjOMY+b78qUea/tSRgMd/MRIlJI7sKGi9AG7zge50BjnyHbR
	USb1iUiLtpG0Aq+wGIf+0GYICVFDrG3G4+XakE/6j6Zw5qmNZbuTNM7aamvT4lVmniwx5trG+hW
	/CwYkNkxdeuQ4IPXvV/Bj1s4kZAjlwZ5tDa29csIIviQtwYxAQJh76tPtVgh268b/OOL/CNZqGA
	GO2SWAYPf6MUkiblNIbjfVD/xzM02n7Df1iRBmngGaAAsQ6pNvVjnv5+RKT/UIvsjleVB2gsyi7
	p+2c9c1dAijTm14b0QY8S4lJZcqfa14+i1/4PlI8ManIR8ljZi8uvuTGraAQzRcQjI5/IWzJBsW
	xjpvpFaGTCxhdHd1unR75ax2rikRdhHdK4mK
X-Received: by 2002:a05:600c:8210:b0:4bb:6a2d:b438 with SMTP id 5b1f17b1804b1-4bb88786c81mr454598565e9.0.1795737770158;
        Thu, 26 Nov 2026 16:02:50 -0800 (PST)
Received: from [192.168.1.11] ([31.94.68.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm50065144f8f.24.2026.11.26.16.02.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 16:02:49 -0800 (PST)
Message-ID: <d34513d6-8f84-4456-9b69-67643f4eab85@gmail.com>
Date: Fri, 27 Nov 2026 00:02:47 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Richard Lane <richardlanedev@gmail.com>
From: Richard Lane <richardlanedev@gmail.com>
Subject: [PATCH v4 0/3] drm/amd: Enable 2x1 tiled display support on Apple
 Intel Retina iMacs
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi folks,

Apple 21.5" 4K (iMac18,2, iMac19,2) and 27" 5K (iMac15,1, iMac17,1,
iMac18,3, Polaris-based iMac19,1) Retina iMacs drive their internal
4096x2304 or 5120x2880 panel as a 2x1 tiled display using two streams
over an internal eDP root link and a secondary DP link.

At boot, the Apple EFI firmware initializes only a single pipe and
leaves the secondary DP tile unlatched with HPD deasserted. Because the
secondary tile reports HPD low and requires a vendor-specific DPCD
handshake before it responds as a DisplayPort sink, amdgpu currently
fails to detect the second tile, leaving Linux limited to single-tile
resolutions.

This series enables full dual-tile operation on DCE < 12 Apple 4K/5K
Retina iMacs so that the internal panel behaves like a standard
DisplayID tiled monitor:

1. Calculate the pre-OS framebuffer reservation in GMC v7 and v8 using
   mmGRPH_PITCH and the mmGRPH_PRIMARY_SURFACE_ADDRESS offset from
   vram_start so the full relocated Apple EFI scanout surface is
   preserved during boot handover without vendor-specific quirks.
2. Latch the root eDP link via DPCD 0x4F1 prior to EDID read on Apple
   hardware (DCE < 12), point the secondary DP link to the root eDP
   link (apple_imac_peer) via an EDID quirk covering 4K and 5K Retina
   iMacs, latch the secondary tile via DPCD 0x4F1 on the root eDP link,
   write the 3-byte Boot Camp source table (0x310) on the secondary
   link, keep the secondary tile out of D3 power-down, and unlatch the
   TCON back to single-pipe mode on suspend/shutdown. Once unlocked,
   DRM's DisplayID parser populates has_tile, tile_group, and
   tile_is_single_monitor on both connectors natively. (DCE >= 12
   support for Vega-equipped iMac19,1, iMacPro1,1, and 2020 iMac20,x is
   noted as TODO.)
3. Compute context->bw_ctx.bw.dce.all_displays_in_sync in
   dce100_validate_bandwidth() using
   resource_are_streams_timing_synchronizable() and copy it to
   pp_display_cfg->all_displays_in_sync in
   dce_pplib_apply_display_requirements(), matching the existing DCE 11
   bw_calcs() flow so SMU7 can downclock MCLK at idle on DCE <= 10
   without modeset underflows.

Changes in v4:
- Patch 2: Drop the link_dp_phy.c hunk that skipped DP_SET_POWER D3 on
  the secondary DP link, as testing confirmed both DPMS blanking/wake
  and S3 suspend/resume work properly without it.

Changes in v3:
- Patch 2: Added pre-EDID DPCD 0x4F1 latch on the root eDP link in
  dm_helpers_read_local_edid() so dual-tile detection works even when
  third party bootloaders are not present on the EFI partition. Added
  21.5" 4K Retina iMac panel IDs (AE19/1A for iMac18,2 and iMac19,2)
  and renamed apple_5k_peer / amdgpu_dm_apple5k_unlatch() to
  apple_imac_peer / amdgpu_dm_apple_imac_unlatch().
- Patch 3: Dropped the dm_pp_apply_display_requirements() call in
  amdgpu_dm.c and instead computed all_displays_in_sync in
  dce100_validate_bandwidth() and copied it in
  dce_pplib_apply_display_requirements() (dce_clk_mgr.c) to match the
  existing DCE 11 bw_calcs() path.

Changes in v2:
- Patch 1: Replaced the hardcoded 64 MiB Apple quirk in amdgpu_gmc.c
  with a generic calculation in gmc_v7_0_get_vbios_fb_size() and
  gmc_v8_0_get_vbios_fb_size() using mmGRPH_PITCH and
  mmGRPH_PRIMARY_SURFACE_ADDRESS.
- Patch 2: Dropped the DRM_MODE_CONNECTOR_eDP override in
  amdgpu_dm_connector.c in favor of DRM's native DisplayID tile
  properties (has_tile, tile_group, tile_is_single_monitor).
  Renamed tiled_peer to apple_5k_peer and set it only on the secondary
  DP link, removing dm_helpers_wire_tiled_peer(),
  dc_link_is_apple_5k_secondary(), and inline explanatory comments.
- Patch 3: Made the PowerPlay sync check generic for any combination of
  synchronized displays by checking timing_sync_info.group_size ==
  params.stream_count instead of tiled_peer.

Regards,
Richard

Richard Lane (3):
  drm/amdgpu: use pitch and surface offset for GMC v7/v8 fb size
  drm/amd/display: unlock secondary tile on Apple 4K/5K iMac panels
  drm/amd/display: report synced displays to PowerPlay on DCE <= 10

 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c         |  8 +++--
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c         |  8 +++--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 19 ++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 35 +++++++++++++++++++
 .../display/dc/clk_mgr/dce100/dce_clk_mgr.c   |  3 ++
 drivers/gpu/drm/amd/display/dc/dc.h           |  1 +
 .../drm/amd/display/dc/link/link_detection.c  |  7 +++-
 .../dc/link/protocols/link_dp_capability.c    |  4 +++
 .../dc/resource/dce100/dce100_resource.c      |  9 +++++
 9 files changed, 87 insertions(+), 7 deletions(-)

-- 
2.55.0
