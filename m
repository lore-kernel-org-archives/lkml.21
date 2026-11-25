Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795622502;
	b=WzUVIFnfvKP07HHsgbGFTcdikx6yC38XUIK1WSBqZsB1LpMUzOYZW/4SqXAS9ifEfXOd
	 LBg9VnZYHaZ0Z61S2e+OxGhI54sjGuIixd4O/DQgD/VSlHtfTWaiFxYjNOOPrDalRbGBE
	 rSOCeRkIYmQ8bAKxiSGmP6PYenXTEEFkWZjB0PKMiinSvWsWc58qhJP4Zu0gZDs6IprQH
	 8wx7Re0aY+5QX4QrWf3qDj6bj3hiXfPUhbbfSdFeBaDmISaXMuv16PcPXkK/x0KpPlFhn
	 MemPgiMwdkrykO8GqwIBtz9zgXm91Ra1Abs0/xqzjdkCdH5ubKNhgQCI0mbsa7i5nxw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795622502;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fI4P20bQCmfh6R7YugF4cBFoiAc+EQcossZkRSNDFiM=;
	b=yD0bzeYSyRV5g0YOXPOxklZpBig8gAwW4DRmOJGKymIpzHB+vnMxbvQDYpZY+5ewBj7m
	 v1vsSzhHwp+PTilAn3OsE9OQ0m4LrueX5xML2HrAeTrWHbtblxyEj/M9owz4E7JaJ67ge
	 Q4hKL/TE6rtKG8djQ7vp14k1uT8o4+gf0OZOE7TtcE1ZRqoLcqnBNthe7POZvAGDoibWi
	 wbV3IiwwqZy3bh8vwJcYhi47bwg+ibEmkaA15RpqNdNAV5z8r8Nw/5dvhtMwLbUTFMNLx
	 7FnKX17OvIYaV+46KUqUGhmk1JMP+O2FDMMaUp53ypSLDTRyJu9ZVlXqRgKSQsZgJHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XItMKMiu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA7D606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:01:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AA7D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XItMKMiu
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-703e2625ce6so218025eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:01:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795622500; cv=none;
        d=google.com; s=arc-20260327;
        b=IpAybWMzcwsuaMMVry4ba3Zj6wdLE+GzYUMK9vkvLohtF1q4xOmLB91bC5yHWE9wpi
         uzDqrrGK8bVJoMMAJEmAMkn00Jbk7IPrp598ADNvneL3mAdcfrXFTCwR/8kN+AE94r25
         LL5IkkGchpzNvVUnRuQhjA0IihsImzoqK2Y+sBhMZcabnhO4plZK84jZIkJrYJ00UgbN
         +HtLZDQ7d5nH5alnpmgw2F5bZCkcc/WaHICqXxfqVZfcdjAltzl0nPVyHf2zDrbIVILw
         EonlvTZWY6aUmekld9WTzWDkNVcXrBLygU6vABkWetSIgPlYIs19tWCZGR+4jSAuKrSV
         Ckaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fI4P20bQCmfh6R7YugF4cBFoiAc+EQcossZkRSNDFiM=;
        fh=qJvHWXprcFthhinAyaUWXg2d8wzNQKsVigIHtAwn6hY=;
        b=C+RySRktbHFqnZkOPFOIYsYEi1x4stgkW0MUg0uNZw74IzfxVfBWMwOkpn1FyUpPpR
         2vx3klI49K9EkEvZqxfiStwyt0pADoaR5RC5GgKkzjCPLiGwWg8eOTqCgzdYpyCzkTp9
         7uA7i1dj1dWQEaku3GKUrLjEAzFV8b31YNHLqZQGr3p9W2AXZSISJvxfY+ZxOsNGxSDJ
         wJ9rX0PeJJeoZF0mQ/Jn2DAtTcWbhaiElZt/BemJCbBZRjedFxY3jSfzKEwVT77JY58H
         UFlgWHmQrIGx5WsEUiLF35FmDhDcQRqQcjULdWAmBpYr0HiywSKHiUQuiAp9Epd5YUYl
         BJ3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795622500; x=1796227300; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fI4P20bQCmfh6R7YugF4cBFoiAc+EQcossZkRSNDFiM=;
        b=XItMKMiuVIfJevoNYe5KIA9SsmN6lk3hJjmx3VC8lbFJlp9GVyYDBFGtzs1B0hhbRV
         cltKjWagty5jDcYVk2GNrS0h6eyKIxe/VuMuDDD1Yw+GA1JZQNwLedzYfwba26+RioDC
         eM6EUnZXxB1l+HYysC8of1UcDMZYyLT9bh8w3/zVI9/8Dsi4AvWpqCSOXlfVNalqk+To
         i14BFMgiKU+sJElIDUvQ8pyRqPPayQpiP2cSV6pUWEpaMqYWcdtCXSjCV7QPWai+Qvm1
         /0TN7AMqCF3y8+vTIzMwSOa0FpGvCYR5yalEC9r4bScPe2UteeH/I1uFlAl+xvOWonQM
         vYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795622500; x=1796227300;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fI4P20bQCmfh6R7YugF4cBFoiAc+EQcossZkRSNDFiM=;
        b=IEKyjPBkeWSS8a4/qL6QST9OEozfoC15gUpF78yi6SlGWvydDJhxkhxRm+9YulSmcO
         ICvIP7yxTyXmhncNVD0vjF2pzDgwByp2sAfUN7u1Qu2tIIkT/2v5TxHSw+41BVAsL3v9
         x6PF1ZrCHRJD+WC5F22bIqzYiEhajYQ+xi5Wa/H4nxPAJE0mmz9INsRv2kAbDPVfYa9I
         FPoFq55r7TlEzVb3jwJbBj8GVDSpIg3iIjiypytyTjiPDfiw8S5lVDzmpUaVY5fO3YcF
         HghVMqxGE7e6HpTQyKG1zTL3rIh7OSJeR1bBz4JelA8QtvLI3UGxQtmIIfNadZtlTi6x
         C/HA==
X-Forwarded-Encrypted: i=1; AL+hErHX4KYg4igj/+ZAoYQeAhnYtCJhGUaMFn2/UhRv7xApXO5DcTob0x5ME3R2b9yytMidvYjZGddlAqWagGA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JA/BvhM7VHEEA/insysA+Drt23+p2zaKX2TsGp7BXRUyR5l3S
	waOZJmjQcw06048jioL92h2Xfff6QVzjGSRaGwzh7aISMsJwCBGsPyikmg4V/dZi/B5IXxfw9wi
	rHwMDC6KAKjuFsR3fv/tIG/RfObpUkOY=
X-Gm-Gg: AZFdTZdMV0T/WXGaT73mP7UNbUYzEB+9BmQgHIQSw8NbMpKY88FioqUPBC2rFIaMVCV
	IQJzmkaGZNLmHHFs9TJ5OkAKr7Vs9Pab6FykMcjsP3NS86jQf6Vc2gbhR0HEYudT8Dh43EbXFJ3
	2Obvcpe62XoPDwim1Hhznm0WJf6+KVckzBCFSAbY/m8130nBaVu+XpODsOjrer8ZieF5H7RsTjW
	On054munRtPXeCm3wZeAQHVw7HiFBzojsjXSpMkuentWK0rx0aHXGhFEb+Kkj20KOBu+/Y1QOOw
	yhLqBqU783b5wjgtemFbBlzWT1OwtHe9fraKJqYf8yuuw1tdOs2BJLSsT2a2Kk1ffObSbytON2R
	SVW9Tp4A96h4/OgiG95bky3PrCPMXHUjFecwzO+yo7yHCyMppEVdU5B8HmPxVKq9Ydr4hzLrm58
	n98ZQdIQ79D8SWiZVXmtBQ71Bk8T4/Fom9SznMPfY+BOH4dF/UIMKzaT6G8mk=
X-Received: by 2002:a05:6820:840d:b0:71a:ee8a:5d26 with SMTP id
 006d021491bc7-71b3903669fmr16310397eaf.0.1795622499664; Wed, 25 Nov 2026
 08:01:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <8342fe8e-5c52-408e-a2f5-0f04b10f332e@gmail.com>
In-Reply-To: <8342fe8e-5c52-408e-a2f5-0f04b10f332e@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 25 Nov 2026 11:01:28 -0500
X-Gm-Features: Aa3M54rIbsxve4YKvieiQM2tewmvhaZrVPRdb31u5oTtH2lIeVSsCz--7sCAIE8
Message-ID: <CADnq5_ObYb3d7V=cp7bm8qOoPi7bp9+B8LxPcx-0DiNxvJ=d5A@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] drm/amd: Enable 2x1 tiled display support on Apple
 Retina iMacs
To: Richard Lane <richardlanedev@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Mario Limonciello <mario.limonciello@amd.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 8:06=E2=80=AFPM Richard Lane <richardlanedev@gmail.=
com> wrote:
>
> Hi folks,
>
> Apple 21.5" 4K (iMac18,2, iMac19,2) and 27" 5K (iMac15,1, iMac17,1,
> iMac18,3, Polaris-based iMac19,1) Retina iMacs drive their internal
> 4096x2304 or 5120x2880 panel as a 2x1 tiled display using two streams
> over an internal eDP root link and a secondary DP link.
>
> At boot, the Apple EFI firmware initializes only a single pipe and
> leaves the secondary DP tile unlatched with HPD deasserted. Because the
> secondary tile reports HPD low and requires a vendor-specific DPCD
> handshake before it responds as a DisplayPort sink, amdgpu currently
> fails to detect the second tile, leaving Linux limited to single-tile
> resolutions.
>
> This series enables full dual-tile operation on DCE < 12 Apple 4K/5K
> Retina iMacs so that the internal panel behaves like a standard
> DisplayID tiled monitor:
>
> 1. Calculate the pre-OS framebuffer reservation in GMC v7 and v8 using
>    mmGRPH_PITCH and the mmGRPH_PRIMARY_SURFACE_ADDRESS offset from
>    vram_start so the full relocated Apple EFI scanout surface is
>    preserved during boot handover without vendor-specific quirks.
> 2. Latch the root eDP link via DPCD 0x4F1 prior to EDID read on Apple
>    hardware (DCE < 12), point the secondary DP link to the root eDP
>    link (apple_imac_peer) via an EDID quirk covering 4K and 5K Retina
>    iMacs, latch the secondary tile via DPCD 0x4F1 on the root eDP link,
>    write the 3-byte Boot Camp source table (0x310) on the secondary
>    link, keep the secondary tile out of D3 power-down, and unlatch the
>    TCON back to single-pipe mode on suspend/shutdown. Once unlocked,
>    DRM's DisplayID parser populates has_tile, tile_group, and
>    tile_is_single_monitor on both connectors natively. (DCE >=3D 12
>    support for Vega-equipped iMac19,1, iMacPro1,1, and 2020 iMac20,x is
>    noted as TODO.)
> 3. Compute context->bw_ctx.bw.dce.all_displays_in_sync in
>    dce100_validate_bandwidth() using
>    resource_are_streams_timing_synchronizable() and copy it to
>    pp_display_cfg->all_displays_in_sync in
>    dce_pplib_apply_display_requirements(), matching the existing DCE 11
>    bw_calcs() flow so SMU7 can downclock MCLK at idle on DCE <=3D 10
>    without modeset underflows.

I've reviewed and applied patches 1 and 3.  I had a question on patch 2.

Alex

>
> Changes in v3:
> - Patch 2: Added pre-EDID DPCD 0x4F1 latch on the root eDP link in
>   dm_helpers_read_local_edid() so dual-tile detection works even when
>   third party bootloaders are not present on the EFI partition. Added
>   21.5" 4K Retina iMac panel IDs (AE19/1A for iMac18,2 and iMac19,2)
>   and renamed apple_5k_peer / amdgpu_dm_apple5k_unlatch() to
>   apple_imac_peer / amdgpu_dm_apple_imac_unlatch().
> - Patch 3: Dropped the dm_pp_apply_display_requirements() call in
>   amdgpu_dm.c and instead computed all_displays_in_sync in
>   dce100_validate_bandwidth() and copied it in
>   dce_pplib_apply_display_requirements() (dce_clk_mgr.c) to match the
>   existing DCE 11 bw_calcs() path.
>
> Changes in v2:
> - Patch 1: Replaced the hardcoded 64 MiB Apple quirk in amdgpu_gmc.c
>   with a generic calculation in gmc_v7_0_get_vbios_fb_size() and
>   gmc_v8_0_get_vbios_fb_size() using mmGRPH_PITCH and
>   mmGRPH_PRIMARY_SURFACE_ADDRESS.
> - Patch 2: Dropped the DRM_MODE_CONNECTOR_eDP override in
>   amdgpu_dm_connector.c in favor of DRM's native DisplayID tile
>   properties (has_tile, tile_group, tile_is_single_monitor).
>   Renamed tiled_peer to apple_5k_peer and set it only on the secondary
>   DP link, removing dm_helpers_wire_tiled_peer(),
>   dc_link_is_apple_5k_secondary(), and inline explanatory comments.
> - Patch 3: Made the PowerPlay sync check generic for any combination of
>   synchronized displays by checking timing_sync_info.group_size =3D=3D
>   params.stream_count instead of tiled_peer.
>
> Regards,
> Richard
>
> Richard Lane (3):
>   drm/amdgpu: use pitch and surface offset for GMC v7/v8 fb size
>   drm/amd/display: unlock secondary tile on Apple 4K/5K iMac panels
>   drm/amd/display: report synced displays to PowerPlay on DCE <=3D 10
>
>  drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c         |  8 +++--
>  drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c         |  8 +++--
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 19 +++++++++++
>  .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 34 +++++++++++++++++++
>  .../display/dc/clk_mgr/dce100/dce_clk_mgr.c   |  3 ++
>  drivers/gpu/drm/amd/display/dc/dc.h           |  1 +
>  .../drm/amd/display/dc/link/link_detection.c  |  7 +++-
>  .../dc/link/protocols/link_dp_capability.c    |  4 +++
>  .../display/dc/link/protocols/link_dp_phy.c   |  3 ++
>  .../dc/resource/dce100/dce100_resource.c      |  9 +++++
>  10 files changed, 89 insertions(+), 7 deletions(-)
>
> --
> 2.55.0
