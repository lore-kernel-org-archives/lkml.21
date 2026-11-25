Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795568439;
	b=qNQx3G//ZVVqw11KgxwG0JsyIaIWe6hWOSxwcjCXyNkZ2kNW5rLnfz6l5r/YsmSxy0Es
	 KNEEe1+RZZtGz+xIWufAOyV9jNnHaXhGqSYe9IUr8NaZ0kLYlwjfRpGSqoWMOTBIMYLaU
	 JCY+Mz0N8m4HH2rGIQtv+0mtCz/GEJOOJXaaMFxx9mNYmYh0bnAhz3X29p4Km7FCQ2eRO
	 zrhRI7yvQdZY3nxi8Zu0dZ7SjIROzyG7rw9yVF4jFxPbZ7QCVvVbatWmcMLdBdV0XSnR5
	 J2pP6mrb+A4wO7q5RTHmlHs8BXUys3HcpQRVCNrdq6pE6Ltq6aURXZjPfYV5QNX6WiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795568439;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Content-Language:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=4ztWU0LVXdWdRsX5K6cCqmpXvJ1UHD07jKNkG2vEvTY=;
	b=zcK+ZHKHLD1Cbn10+xdZqKskdADadFuWlU7BCW0gmvRUuJ9KaqDJl80XiBwm9D+8kmqJ
	 CTzY/tImQI/b37C83uOI4P37hUIdB9Qm4ssMmbWZYoxuk6Scvj8z8IOns/3bE20QSH7CQ
	 8xFSBvWB3S4mFyOsqQl/DrRIDY6ubwe9nISQdoAFrlIVsdtNwf/NcrBt4iDL1+AdGnfSh
	 d2fAc5ySV2AO1OC+mfOSFy/4I8wvZT9+rgiHjXG+D9ve9a9BZbTSs7zfJ05R8nPkFIwNS
	 gC2QM0N7OdSDlsLAWzD9F4GISmU/FI1PYEw8Mumk/sW+GFOList+OZp3j9pM+9AgUDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l0Rh6pKq;
	arc=none smtp.remote-ip=74.125.225.138
Received: from mail-wm2-f10.google.com (mail-wm2-f10.google.com [74.125.225.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD3E606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:00:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFD3E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l0Rh6pKq
Received: by mail-wm2-f10.google.com with SMTP id 5b1f17b1804b1-49ff9833fedso8369845e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795568437; x=1796173237; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4ztWU0LVXdWdRsX5K6cCqmpXvJ1UHD07jKNkG2vEvTY=;
        b=l0Rh6pKqooPz+EiUiL+CzJhfIFOfQQg+4yf5VQRD7QR7J8VtmsBsm5DVr3Sxy3IW6E
         uILWHHoog00K3QBS3preXlo3ysbf+D4MGjOFnwDSQ82tCfGUvLsyaMZXKn4R6c24qQoz
         5lG8/hId2pjoHlXTpxmG/oI64ggGNK5p9Ct1qHaDkF2GFsh9XgjKqdsmS6r9hnn6p8v7
         7w2LymaIvl19RFxDkjU2zrSE15nGTOyh6ptyIba2OwIDE8NMAuFa1nCGCmpUsDvjJW54
         Huj5EtE5xeK6CX6hpxEL4C/Af6Hm9LE+DML6PLqOnIFsMgMLb6wk+whedtx6QWY8HFx1
         BHFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795568437; x=1796173237;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ztWU0LVXdWdRsX5K6cCqmpXvJ1UHD07jKNkG2vEvTY=;
        b=U5O5lz/XTFxavW+UJmrxfKVC5TZ1FPIqeF6O7YsmuM5PDJbm6L00v07UNcU4gLc/fP
         r1v5WWOjgROMV4RMUgVr40u4Eqg6gGPuFF6GXS5KxnLh70MiP+ffYMa+U2xlWiHIlC88
         nmh/fPKIy7la//tbkJ578FMdcEYifPWZWchmXvgrSyis/V8nw9MsaLDXcU00bDNS8oC7
         PcWEzxu8w9rU7t9k3H7Oztk6XIXTzu7nAcVuuw+KFFEQGXt5fUHRnBRt0G+B3I+ItFU2
         0TKYvl75fCeSa43ik7pOzWpp0I2761Zt6xNqgE0PqWsG8BB8UvTaST3p63bnhjXgy5Wl
         1zgg==
X-Forwarded-Encrypted: i=1; AL+hErFUXU5Az56GquiOoAKG7oZfxPvnXyZa2vmTMNk4Kk7595iHMcPjEXU509wGXAswAoKq11sjuWyOGtWYz8I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TDyrI0yaWU6nnSMdQ9ia3lt335jXBNvBzqymtCyUTMVlqCGGg
	34gX8NSyRI6air8kvq/rIlX2ZJhWstYCIPB6dYqVQNqi6iiN2Z5pLI2Q
X-Gm-Gg: AZFdTZdhxFZ5U1wQ2oYHFSt0D43SRLXKP554QTYRRZ1Yo2DClnYj22LDY6v3NFaz73O
	RrhyJjTtv9SZvnu0heCBVTm+/yiFUlsHHo4UqhtOsoP/lE/r8n6cei/5g3/+SB9jVCA2KEtFVb2
	ZjwuqlILcwc5oZJPua3UcYMtO2ZGnHl+r+47R6lafWQKjluav/X7wAxB7SPCbWi7m1fkDnotrus
	+hJuXUZ9lTgLO/8674ZX/qpSzSYNUn2OqtS4KJ4TnXpJaoN4fZDC3Q9RFsQrog494/p1OKG4iMa
	0AWiUsKOwVVn5nPZAQYAOP1g9LzSR2CXYmnX1naRQ3YcKocuDTrgZxViO2lW7ON9xJbWOpnFv2Q
	heBocsggiXLctCmIiqXivYonEnUJr4BX0wRezYkx+MFD1Mw4zhbAHQJgvAqIivx2/u724W5Y2wA
	/oZBJOhwqP5xPp1cG36+/9fEvfmXDBiKk0GihEkY5oEE7yqYeAPZsBJ7MtgaZ83GZ0ctccO5wUl
	PSi0p9RcVLvZyxEIMy/X+1kCPuAhO4MbR8chx3Ahq3vdO1LYlZrysZA9YZ/f+ndbx8i0rSgqmcf
	tti3FQl8EKWsYoEI/GFUIST8M7i8HSGbg8Zz
X-Received: by 2002:a5d:64c4:0:b0:48e:7b12:ac9f with SMTP id ffacd0b85a97d-4abb5fa17f2mr31649016f8f.40.1795568436905;
        Tue, 24 Nov 2026 17:00:36 -0800 (PST)
Received: from [192.168.1.11] ([31.94.68.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d1bsm32363611f8f.8.2026.11.24.17.00.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 17:00:36 -0800 (PST)
Message-ID: <8342fe8e-5c52-408e-a2f5-0f04b10f332e@gmail.com>
Date: Wed, 25 Nov 2026 01:00:33 +0000
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
To: amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Richard Lane <richardlanedev@gmail.com>
From: Richard Lane <richardlanedev@gmail.com>
Subject: [PATCH v3 0/3] drm/amd: Enable 2x1 tiled display support on Apple
 Retina iMacs
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
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 19 +++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 34 +++++++++++++++++++
 .../display/dc/clk_mgr/dce100/dce_clk_mgr.c   |  3 ++
 drivers/gpu/drm/amd/display/dc/dc.h           |  1 +
 .../drm/amd/display/dc/link/link_detection.c  |  7 +++-
 .../dc/link/protocols/link_dp_capability.c    |  4 +++
 .../display/dc/link/protocols/link_dp_phy.c   |  3 ++
 .../dc/resource/dce100/dce100_resource.c      |  9 +++++
 10 files changed, 89 insertions(+), 7 deletions(-)

-- 
2.55.0
