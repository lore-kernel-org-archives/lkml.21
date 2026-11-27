Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771525;
	b=4B5JeweqKovN4sIdqyQ//o0pc6U4mhPQ08Wm/iE6JKJV12M8ojAC+1NJ2+nzs8DjtXkk
	 muxWR2ai3DaPCbnyekvX4qTE75p95eybP3k4EC3/tRIuCrT2M0IQOY9DLdEr0j7mhHn/E
	 xe9jiGOGLhbe1VsNjBpfrDENord/MDB+C7FjX6p2ohfvdg2nDu54+uVoHlm3wxTPzRMlA
	 BtgsSeMenN43bhVopiZax9EFbe1PUsiJ/DdNLxTngEiT8K/LiPksKpc4cgG2Ybdt+Lmrl
	 5MyfB6Wam89mvSm8uVtd6Z0zPVp3+I7hXlPQC76I0S1DbWIwQUDrPBWzmgezHse5+hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771525;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ksU77zdRcGEkDaOL3bOMHybdYo8q9JOlRC2jOXpEIBg=;
	b=SE3oNq8RGBVIlBKVsMIuYGqgqbpoFJ86CleqP10qOxlAVCnodrIP1I3K3E7etOOboNlx
	 +8CSyS0g48ywhPiR0C3h/dnd5W68m62uJxSAxS6sHj9d72KFd5X+huWnU8iNn0INYIjOj
	 ZZ5FijHJCmnILenuM+lNnXHMfG6jkriCGJbHcwepe2zZ8GWtvxTngLK71zhDW2zyudhZl
	 kv0fgxc8PLoS5DU2h5dHOUXo8Ufn5XWnAC/SzjDJ24lN6VrenXiH4FTJDjoGdc/3yy+9Y
	 UluD8ldFEXSTBLQDxja5ShLAujL8NkS7cbQuytbgosbsWtzrHjKVKXVZH6MGGr3PCvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M0ibVAZ6;
	arc=none smtp.remote-ip=74.125.225.139
Received: from mail-wm2-f11.google.com (mail-wm2-f11.google.com [74.125.225.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44491606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:25:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44491606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M0ibVAZ6
Received: by mail-wm2-f11.google.com with SMTP id 5b1f17b1804b1-4a5f76661b5so28073475e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795771522; x=1796376322; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ksU77zdRcGEkDaOL3bOMHybdYo8q9JOlRC2jOXpEIBg=;
        b=M0ibVAZ6C8OVUcl4EI3ZlwCkK+mJiNzkqZyIXFFvE9whZuTyfP3GfAqPNRZvSsHZRK
         a3jDqgoFRFx9K/6vSiN1XtgUuixndOQauEmL7L4l+Vk5Ol+/UzLC5Yxh6Yb8TPCodR7R
         1GhUAe5fGwTYfTmdIu4vda6wkEJJaTC5PvI4x19Ph5CL5Vn5PUoD0cd3ZL7DbYkBqUEN
         MwSfWa6P0eWJcg6tp3puClL9opzAeEFE0QUiWYji+Ki1tJ2CWqaIo6B7aTOVWVRpcmPz
         zpPo5GtMhg5iX8ucz1JjNsVITHX9zaji02AfCRkJoIZJ0Feibvw4xh0yKi/TYG3++f/W
         g16Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771522; x=1796376322;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ksU77zdRcGEkDaOL3bOMHybdYo8q9JOlRC2jOXpEIBg=;
        b=K4eDahYQTh9RvcUUbjP3EJyxAp1YBSmBfu9On+rCBq7deq6u3UEKcqf/YRHFf5yS5o
         dstZw5nw9UTg4UD6cSfkjU117h8H0lT4PAr9hfmfZufYI4Iw4Fhf+G2PRMtfylTSI/Yf
         GXh9D4QbV1KwJThqhlfWAloKdGk1DBF59IHsaJ/qSU0Z/faWQeeircUb4PilPPAg+8vM
         3twHjytMsiTHLMmTSOnhTmtZt5shFQt9+dQdWEYV3v1REl6DEltBpP+Sy4du5rtNM1+c
         G/IRKOaEckNBEXGIQlMoxhnDzUOld9OM6mNtVcLKFSi3bx21Cpz+pPMvzTJpLQpl0OKw
         NqXw==
X-Forwarded-Encrypted: i=1; AL+hErGakGP08uSb5gt106gh4EicSZG9rLXJYF6ChgI5LwoflyLWKDAkDZ+i1igaVWxtxWgxzmpXT0O8eOc8BR0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+B5kDY2V0rcFknPXgXDjtmgd1NgQ2/TYkRECHhHgtIVuKEpkGp
	u8esNYo6Q/g5PFGlQLsBhc4ONvhjowqGxxxwvgy48uKLKdlZt/jvQFZj
X-Gm-Gg: AZFdTZdu2ebISf5F9mxKJa8jfjYmMNeJYJLrx5JufvMfDk8J45p+X6Cn+ksEo7oz2xy
	iIVkKnzbVQnVZomzCtzxJoreJrW/VtFYp5Bt96dZWEOVRRd1DaHq7yp37vAwwdb2Wl+PiKJRJjw
	9AYRRvgc89WggNMD1VmTxU7Q5RFQ48HArp28DC74BykoHeIl5fHox7MZFfN8fucOPGiL70qByXb
	826d81+19bzf3eSLvS3RrR+SFFj8hF7GW6TMTxIrNmzwj06G+W6HqOz7wzBcbh41VA0YSiPrZ42
	ljvOpdFPIH9jazYQZLoCurh/spbm+OOpKprnFi/XFU2moaJWT7gyLbXUtZVu7T1T0z+p9Jy8awv
	eUuecy6I3tDmb0TiB1qM19d2dzVv5tve/NC3vP35ACqayYsNg3S3fn0XZAvYZZG099fvyAWwFX7
	V8DgiyGCWM2aODIhU628rGkGiJwAjUQBCU3vQWFzTHmFMDp94z0ja/fFfblzRzxA3/+zCLYJpHP
	CFgk8AnHxLnZjklxWI62bK7iaIr9MVyOUfzIBfI77zHRpkSVX/l977Qidx3QuKkjafnExH+/9Yl
	OSTdPyFGZ6vG7wkepv6dmC7SbwxUDk8KvK7P8w==
X-Received: by 2002:a5d:584f:0:b0:4b9:8ac3:f5fa with SMTP id ffacd0b85a97d-4b98ac3f6d5mr16755716f8f.48.1795771522353;
        Fri, 27 Nov 2026 01:25:22 -0800 (PST)
Received: from [192.168.1.11] ([31.94.68.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa397asm46609335f8f.48.2026.11.27.01.25.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:25:21 -0800 (PST)
Message-ID: <2e93336e-9983-4d20-96fe-515a6b5009b2@gmail.com>
Date: Fri, 27 Nov 2026 09:25:20 +0000
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
Subject: Re: [PATCH v4 2/3] drm/amd/display: unlock secondary tile on Apple
 4K/5K iMac panels
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <07e54333-2391-4e8f-8819-fa431d981430@gmail.com>
Content-Language: en-US
From: Richard Lane <richardlanedev@gmail.com>
In-Reply-To: <07e54333-2391-4e8f-8819-fa431d981430@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/11/2026 00:05, Richard Lane wrote:
> Apple 21.5" 4K (iMac18,2, iMac19,2) and 27" 5K (iMac15,1, iMac17,1,
> iMac18,3, Polaris-based iMac19,1) Retina iMacs expose their internal
> panel as a 2x1 tiled display over an eDP root link and a secondary DP
> link. At boot, the panel TCON operates in single-pipe mode and holds the
> secondary DP link's HPD line low until unlocked via DPCD registers.
> 
> Enable native tiled detection and link training for DCE < 12 Apple 4K/5K
> Retina iMac panels:
> - Latch the root eDP link via DPCD 0x4F1 prior to reading its EDID in
>   dm_helpers_read_local_edid() on Apple hardware (DCE < 12) so the
>   TCON exposes its full DisplayID tile properties even when Apple and
>   OpenCore Legacy Patcher (OCLP) EFI folders are absent.
> - Point the secondary DP dc_link to the root eDP dc_link
>   (apple_tcon_peer) during EDID quirk matching on DCE < 12 iMac15,1
>   (AE01/02), iMac17,1 (AE05/06), iMac18,3 (AE11/12), iMac18,2/19,2
>   (AE19/1A), and Polaris-based iMac19,1 (AE25/26), checking
>   connector_signal since panel IDs can flip across the two links after
>   S3 wake. DCE >= 12 support for Vega-based iMac19,1, iMacPro1,1, and
>   iMac20,x is documented as TODO.
> - Avoid falling back to DVI and latch the secondary tile via DPCD 0x4F1
>   on the root eDP link when probing the secondary link, allowing the
>   secondary link to read its EDID and populate DRM's DisplayID tile
>   properties (has_tile, tile_group, and tile_is_single_monitor).
> - Write the 3-byte Boot Camp source table (0x04, 0x1d, 0x03) to DPCD
>   0x310 in dpcd_set_source_specific_data() to unlock the secondary tile.
> - Unlatch both tiles (0x4F1) and clear DP_SOURCE_TABLE_REVISION (0x310)
>   and DP_EDP_CONFIGURATION_SET (0x10A) in amdgpu_dm_apple_tcon_unlatch()
>   during dm_suspend() so the TCON returns to single-pipe mode for the
>   EFI boot screen across reboots.
> 
> Signed-off-by: Richard Lane <richardlanedev@gmail.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 19 ++++++++++
>  .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 35 +++++++++++++++++++
>  drivers/gpu/drm/amd/display/dc/dc.h           |  1 +
>  .../drm/amd/display/dc/link/link_detection.c  |  7 +++-
>  .../dc/link/protocols/link_dp_capability.c    |  4 +++
>  5 files changed, 65 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 3d2201285888..6275a585593c 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -1610,6 +1610,23 @@ STATIC_IFN_KUNIT void dm_destroy_cached_state(struct amdgpu_device *adev)
>  }
>  EXPORT_IF_KUNIT(dm_destroy_cached_state);
>  
> +static void amdgpu_dm_apple_imac_unlatch(struct dc *dc)
> +{
> +	const u8 zeros[3] = { 0 };
> +
> +	for (int i = 0; i < dc->link_count; i++) {
> +		struct dc_link *link = dc->links[i];
> +
> +		if (link->apple_imac_peer) {
> +			core_link_write_dpcd(link, DP_SOURCE_TABLE_REVISION, zeros, 3);
> +			core_link_write_dpcd(link, DP_EDP_CONFIGURATION_SET, zeros, 1);
> +			core_link_write_dpcd(link, 0x4F1, zeros, 1);
> +			core_link_write_dpcd(link->apple_imac_peer, 0x4F1, zeros, 1);
> +			break;
> +		}
> +	}
> +}
> +
>  static int dm_suspend(struct amdgpu_ip_block *ip_block)
>  {
>  	struct amdgpu_device *adev = ip_block->adev;
> @@ -1677,6 +1694,8 @@ static int dm_suspend(struct amdgpu_ip_block *ip_block)
>  
>  	amdgpu_dm_hpd_rx_irq_work_suspend(dm);
>  
> +	amdgpu_dm_apple_imac_unlatch(dm->dc);
> +
>  	dc_set_power_state(dm->dc, DC_ACPI_CM_POWER_STATE_D3);
>  
>  	if (dm->dc->caps.ips_support && adev->in_s0ix)
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index 6192c0f6086d..0863628c9d67 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -29,6 +29,7 @@
>  #include <linux/string.h>
>  #include <linux/acpi.h>
>  #include <linux/i2c.h>
> +#include <linux/dmi.h>
>  
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_probe_helper.h>
> @@ -173,6 +174,31 @@ STATIC_IFN_KUNIT void apply_edid_quirks(struct dc_link *link, struct edid *edid,
>  		drm_dbg_driver(dev, "Force FreeSync min to 60 Hz on panel id %X\n", panel_id);
>  		edid_caps->panel_patch.force_freesync_min_hz = 60;
>  		break;
> +	/*
> +	 * Workaround for Apple 21.5" 4K and 27" 5K iMac 2x1 tiled panels
> +	 * (eDP root + secondary DP). Point secondary->apple_imac_peer to root
> +	 * so detection/suspend can latch/unlatch the TCON via DPCD; match both
> +	 * single/tiled IDs and gate on eDP so only root sets the peer.
> +	 * IDs (Single/Tiled): iMac15,1 (AE01/02), iMac17,1 (AE05/06),
> +	 * iMac18,3 (AE11/12), iMac18,2/19,2 (AE19/1A), iMac19,1 (AE25/26);
> +	 * TODO (DCE >= 12): iMac19,1/19,2 Vega, iMacPro1,1 (AE1D/1E),
> +	 * iMac20,x (AE31/32, AE35/36).
> +	 */
> +	case drm_edid_encode_panel_id('A', 'P', 'P', 0xAE01):
> +	case drm_edid_encode_panel_id('A', 'P', 'P', 0xAE02):
> +	case drm_edid_encode_panel_id('A', 'P', 'P', 0xAE05):
> +	case drm_edid_encode_panel_id('A', 'P', 'P', 0xAE06):
> +	case drm_edid_encode_panel_id('A', 'P', 'P', 0xAE11):
> +	case drm_edid_encode_panel_id('A', 'P', 'P', 0xAE12):
> +	case drm_edid_encode_panel_id('A', 'P', 'P', 0xAE19):
> +	case drm_edid_encode_panel_id('A', 'P', 'P', 0xAE1A):
> +	case drm_edid_encode_panel_id('A', 'P', 'P', 0xAE25):
> +	case drm_edid_encode_panel_id('A', 'P', 'P', 0xAE26):
> +		if (link->connector_signal == SIGNAL_TYPE_EDP &&
> +		    link->ctx->dce_version < DCE_VERSION_12_0 &&
> +		    (link->link_index ^ 1) < link->dc->link_count)
> +			link->dc->links[link->link_index ^ 1]->apple_imac_peer = link;
> +		break;
>  	default:
>  		return;
>  	}
> @@ -1299,6 +1325,15 @@ enum dc_edid_status dm_helpers_read_local_edid(
>  	if (link->dc->hwss.prepare_ddc)
>  		link->dc->hwss.prepare_ddc(link);
>  
> +	if (link->connector_signal == SIGNAL_TYPE_EDP &&
> +	    link->ctx->dce_version < DCE_VERSION_12_0 &&
> +	    dmi_match(DMI_SYS_VENDOR, "Apple Inc.")) {
> +		const char *product = dmi_get_system_info(DMI_PRODUCT_NAME);
> +
> +		if (product && str_has_prefix(product, "iMac"))
> +			dm_helpers_dp_write_dpcd(ctx, link, 0x4F1, &(const uint8_t){1}, 1);
> +	}
> +
>  	dm_helpers_wait_for_edid_ready(link, ddc);
>  
>  	/* some dongles read edid incorrectly the first time,
> diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
> index 8471dcfe24fd..bd3857267331 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc.h
> @@ -2018,6 +2018,7 @@ struct dc_scratch_space {
>  	bool skip_implict_edp_power_control;
>  	bool forced_psr_active;
>  	enum backlight_control_type backlight_control_type;
> +	struct dc_link *apple_imac_peer;
>  };
>  
>  struct dc {
> diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> index 5b257f003f13..02c6e5874c16 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> @@ -218,7 +218,7 @@ static enum signal_type link_detect_sink_signal_type(struct dc_link *link,
>  			 * we assume signal is DVI; it could be corrected
>  			 * to HDMI after dongle detection
>  			 */
> -			if (!dm_helpers_is_dp_sink_present(link))
> +			if (!link->apple_imac_peer && !dm_helpers_is_dp_sink_present(link))
>  				result = SIGNAL_TYPE_DVI_SINGLE_LINK;
>  		}
>  		break;

I have also discovered that this modification to link_detection.c is not needed.

Richard
> @@ -1651,6 +1651,11 @@ bool link_detect_connection_type(struct dc_link *link, enum dc_connection_type *
>  		}
>  	}
>  
> +	if (*type == dc_connection_none && link->apple_imac_peer) {
> +		core_link_write_dpcd(link->apple_imac_peer, 0x4F1, &(const uint8_t){1}, 1);
> +		*type = dc_connection_single;
> +	}
> +
>  	return true;
>  }
>  
> diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
> index c487c5b87dfd..74954702c5a9 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
> @@ -1496,6 +1496,10 @@ void dpcd_set_source_specific_data(struct dc_link *link)
>  				link->dc->vendor_signature.data.raw,
>  				sizeof(link->dc->vendor_signature.data.raw));
>  	}
> +
> +	if (link->apple_imac_peer)
> +		core_link_write_dpcd(link, DP_SOURCE_TABLE_REVISION,
> +				     (const uint8_t[]){0x04, 0x1d, 0x03}, 3);
>  }
>  
>  void dpcd_write_cable_id_to_dprx(struct dc_link *link)

