Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795704086;
	b=p0nmfmS1XhCrjC724ne/KrkxmjRdgf6DtP0RqF3gJbr++VZgHdfekKh/kOKIT5Skhkvm
	 z9L9y5Jo2HIOxez1hNSwvE1eYcIO50hXuuo59aAGa2biMhoNTlRk+6wmS+m0CCX2+30Pt
	 fovztpd+B40RDqcTlPpuCYtwuLU/DFAbzk7XaUKdYDwRco+mAYZXEF8AUBstStH7PN7R3
	 DHlgwZtcgkzuoDPjUBX3baiCq0oamkuPBJyQNeJZGAGWrgirOCzQsKyVj/ZjQSyjsVblM
	 C7+Ad2+pKDHkHh1FmceUuXfkZ1Ns8rIFggsHgLBzXaV+/tZCtGnxAMG8Fx44uEhLCJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704086;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3Q0FF1IyAcwjpLjwd+mXTwMoeBmTLz95TeFBN3exZ8o=;
	b=pY9gKN6NYi8aaUTFFEFhBwS3COvEtoQrJr0HXJZ2CF9tuT2EjwifVco9EpnXZ2RDnDfU
	 XGl7WB+Aa6FZObRoTPlsM0s9t6VcKL4kOiWX+LeuWM0nXPrRLny1qqZglBEPO49IcAqv3
	 TEiqPUeVPYFOaleCe6DCdtd/7EvUNLRqtAGNgPR2wivBu7uEYXIMqGHKHjJrhpjlFjhk+
	 pjnGaRu98trPaDtHGYG7oJpwEo+NxOR8mVAtl6gqJ74c3zTQ5R/cUs2u7Z6MH7O4mlHnm
	 INbjuSpFi21GkA1duvJl49AQTNK5oodw8nji/HbV2S8PqhaWx+Dgp84a2Fs22oifOnw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=blnOJWEw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4489F606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:41:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4489F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=blnOJWEw
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-716f259f52eso299954eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:41:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795704085; cv=none;
        d=google.com; s=arc-20260327;
        b=E7mc7jLLmBIT05bBrRMO6vMDaRR4GPiuYnNECccVKFMfkT6Vvbee41Ukyr/4V8dRNv
         gP+CkO6Lea0WUyc6UiojxrQGzJL0uYzxVngtBCiVIv2HEoPx7Hv/d2+k1M/t9HRBuAsk
         01UE0aUly8ahEGqGLbUy6x02YnSgxpf+H96xUR1bQaHngaH8KCYtvgfoIY1BTmLY3Hzx
         JNmT9oCpNLcU9R999yWE7ybsJSDDNTE9oGt5eZhP2zsxxx433az7p8AN67cgyRhas8bU
         XJ2oud4fomsKmDNbSqKMFIKtTWP7mfbT/Bd0lBapqpVRFkjNIp3EG1a8lD/m0xN9/u9E
         ASIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3Q0FF1IyAcwjpLjwd+mXTwMoeBmTLz95TeFBN3exZ8o=;
        fh=+pp5COXovGHeUg3U0euohWJv5RAWdyN7ZKRZhGF3qLM=;
        b=Fo4G/kmCLhZoyWbfenAlm0ZaTc/x5rZyOCHFEd8R/RgkhXJ3oe/XD2MxWlXgWTBFGl
         e74ln/PPcckUrIdAQ4EypAnSsPpXyoke91iCeMv2+9B7ebG7ZqtyBpfXHye84VGO33az
         EK3lsoH1ZNTzCkp6zXXIJZ38OmNk5vNtDvrDkv8ch/+rQrW5PZeIG2Sjcs2FMVkfWZY1
         zTat1LxyN8VRqP5Tsd1J/jIrNfNTCNW2Utt6SkpKg/FcUWUaP6eVvmH7iWImcIYM/erf
         RBW3lPgGJRce4NfAdxyVkdhx/TBUlbllCYHr6piE3Z1mF2TbO1Kpk025H/9V3SGGLxrd
         Zt3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795704085; x=1796308885; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3Q0FF1IyAcwjpLjwd+mXTwMoeBmTLz95TeFBN3exZ8o=;
        b=blnOJWEwPtqwDbVMRU+mGrtvAypiEInpX54DIyaten2cTjSll/L7pCqTGIN5AIYKfu
         5yG8wSeZp26oiCk9EKZG0rMgfmbScfu89wvrrdRWQaQzeahB3d3Cby4MMO1Y9EWoq19L
         586Md5Q38i5i5KNoUDHo6HVuBFBTq1UehgkxN4YbRYyzlQbCuAmeE1rzz8XiAIUYjGSI
         OIAQmU6xzKRSaI7kjL3dEMg1ELlidWs1LAwdVNixEpXMemq8uJMvB1EbgEjEv22C5njh
         3ByPjUO8H19xV2QgUwiCVRY+ZE09540TeKGpWQagV50CAkY2jVuZCRcPdibeEQ0mEuAn
         Mk/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704085; x=1796308885;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Q0FF1IyAcwjpLjwd+mXTwMoeBmTLz95TeFBN3exZ8o=;
        b=XSRsZWHYRGv4p8v+w3auzXNlNWoiM5Fjnvb++Y9qiSDkTE3zuEHBsywZli5TS2x0J+
         YLjMmptZrFHkrwQDYv+VU4wBztxk2gBwoNYzp5h2pvXXRg0rd9Ca/+eFTZrcxsHSd0Gr
         lHmYSolbcTqkQ9haxhh+BnLnLosw9oJToL/ed25DkNcWSlm23WHqgmL5DLbOTVJz859u
         PudfuzvkoHsTQ92/7o8Y9cp2HojdetM1/crsyiprcnffnQtxJ+d4qBrkslnlzpxy+6+P
         9T+lliPDKQrgZC9/QmETCG+dHjm46Ehc5xC/vqLjcs8c3i9X+ZZ2o432fSvhryFLtTIo
         kc9w==
X-Forwarded-Encrypted: i=1; AL+hErGKTz58yx3TYOPJpoASWUlMnzXTRbHBYPoQulnIP5f6C0lbwqPessgLVepAnPd2bjl0dcAhsA/9YknaqdY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VAksomy4414IfqqiUeNJ8CY4pIQ5zgOzdsGTK2cuDAOuZOln5
	iTa/zqvZmBXl2f15Af6x2YjlsCCmHv12JwktlteaOBKCnpDSBzZ9nZsmN4ig9IYDp/U8wHQ4ktH
	FbXW0YTf4i3NSclEjat8ZlqGYyxNryLs=
X-Gm-Gg: AZFdTZdTa/vyqNJfEu80BOs8mnYiYnWs75Hz55dH269EnRZENHxpdNrUdMtRksykbqY
	q5+xHWsoLGv2B68El3X3bu0QQwWHSYb6/SC+e8Aa2+EtvRdwpKYia3xrsQwPWkKwl6NhKzoNYvQ
	Y+CfONJjlbw1GnESyb4k/C4U+Q5/Us0l41WD7Burv8BdMPFi6bscTnC98Jf9Ou7xOjtaiNEYndS
	206otYdVK2icOjpD1owGfLAJNI6mJKUPguljg7YZHEZYZuJXsceZUp2M9P9IOUAqLmjVz+3OUZq
	gpsgP69pvCQ0gKi9NiFpfjtFLkqJ9Zn2JF8TbdaXOeIKlvU3/7Xn4yMGuWaXlx1zdAHHxBR8g/O
	EW3aFfPRhiVE4R76PsU60AiJ/lsOC64xjzXBR3BwvJukowfqDMnKsEDQblrvZbVRE4ZFTeNlVt7
	arVXUe40QoKisSEhiPXPw6yKqMKQjmfwSllwRoEaI5zU8ac03sMT9O5Z8WhaY=
X-Received: by 2002:a05:6820:a781:20b0:71a:ed80:f0 with SMTP id
 006d021491bc7-71b393836f1mr18817278eaf.2.1795704085187; Thu, 26 Nov 2026
 06:41:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <6c7b9cdf-9562-4954-9f66-444745e430bb@gmail.com>
 <SJ0PR12MB6830376D484FDC67FA87E10EF7432@SJ0PR12MB6830.namprd12.prod.outlook.com>
 <e25c68b6-d67a-4d5e-86d2-724ee2407f0c@gmail.com>
In-Reply-To: <e25c68b6-d67a-4d5e-86d2-724ee2407f0c@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 26 Nov 2026 09:41:14 -0500
X-Gm-Features: Aa3M54rd4-ZxJfzUBH2RLa9G95otVSabj3WJmMgpkejSZMXwLC-mfLZ813mzpOc
Message-ID: <CADnq5_NrEhM+SsqdABYrDh+0uthsE8w4sBw9M25OTxK8e6q4mA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drm/amd/display: unlock secondary tile on Apple
 4K/5K iMac panels
To: Richard Lane <richardlanedev@gmail.com>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, 
	"amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, 
	"Koenig, Christian" <Christian.Koenig@amd.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, "Wentland, Harry" <Harry.Wentland@amd.com>, 
	"Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>, 
	"Limonciello, Mario" <Mario.Limonciello@amd.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 6:01=E2=80=AFPM Richard Lane <richardlanedev@gmail.=
com> wrote:
>
> On 25/11/2026 15:41, Deucher, Alexander wrote:
> > Public
> >
> >> -----Original Message-----
> >> From: Richard Lane <richardlanedev@gmail.com>
> >> Sent: Tuesday, November 24, 2026 8:04 PM
> >> To: amd-gfx@lists.freedesktop.org
> >> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
> >> <Christian.Koenig@amd.com>; David Airlie <airlied@gmail.com>; Simona
> >> Vetter <simona@ffwll.ch>; Wentland, Harry <Harry.Wentland@amd.com>; Li=
,
> >> Sun peng (Leo) <Sunpeng.Li@amd.com>; Rodrigo Siqueira
> >> <siqueira@igalia.com>; Limonciello, Mario <Mario.Limonciello@amd.com>;
> >> dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; Richard=
 Lane
> >> <richardlanedev@gmail.com>
> >> Subject: [PATCH v3 2/3] drm/amd/display: unlock secondary tile on Appl=
e 4K/5K
> >> iMac panels
> >>
> >> Apple 21.5" 4K (iMac18,2, iMac19,2) and 27" 5K (iMac15,1, iMac17,1,
> >> iMac18,3, Polaris-based iMac19,1) Retina iMacs expose their internal p=
anel as
> >> a 2x1 tiled display over an eDP root link and a secondary DP link. At =
boot, the
> >> panel TCON operates in single-pipe mode and holds the secondary DP lin=
k's
> >> HPD line low until unlocked via DPCD registers.
> >>
> >> Enable native tiled detection and link training for DCE < 12 Apple 4K/=
5K Retina
> >> iMac panels:
> >> - Latch the root eDP link via DPCD 0x4F1 prior to reading its EDID in
> >>   dm_helpers_read_local_edid() on Apple hardware (DCE < 12) so the
> >>   TCON exposes its full DisplayID tile properties even when Apple and
> >>   OpenCore Legacy Patcher (OCLP) EFI folders are absent.
> >> - Point the secondary DP dc_link to the root eDP dc_link
> >>   (apple_tcon_peer) during EDID quirk matching on DCE < 12 iMac15,1
> >>   (AE01/02), iMac17,1 (AE05/06), iMac18,3 (AE11/12), iMac18,2/19,2
> >>   (AE19/1A), and Polaris-based iMac19,1 (AE25/26), checking
> >>   connector_signal since panel IDs can flip across the two links after
> >>   S3 wake. DCE >=3D 12 support for Vega-based iMac19,1, iMacPro1,1, an=
d
> >>   iMac20,x is documented as TODO.
> >> - Avoid falling back to DVI and latch the secondary tile via DPCD 0x4F=
1
> >>   on the root eDP link when probing the secondary link, allowing the
> >>   secondary link to read its EDID and populate DRM's DisplayID tile
> >>   properties (has_tile, tile_group, and tile_is_single_monitor).
> >> - Write the 3-byte Boot Camp source table (0x04, 0x1d, 0x03) to DPCD
> >>   0x310 in dpcd_set_source_specific_data() to unlock the secondary til=
e.
> >> - Prevent the secondary tile from entering DP_SET_POWER D3, which caus=
es
> >>   the TCON to drop HPD and stop responding to AUX transactions.
> >
> > Does the display still blank properly without this?
> >
> > Alex
> >
>
> I have just tested and the display still blanks, and recovers from suspen=
d
> properly without needing to prevent the secondary tile from entering
> DP_SET_POWER D3. Hence this patch hunk can be dropped (no modification is
> therefore needed to link_dp_phy.c):
>
> diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.c =
b/drivers/gpu/drm/amd/display/dc/link/
> protocols/link_dp_phy.c
> index 49521ac4b0e8..f051fe6c060c 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.c
> @@ -50,6 +50,9 @@ void dpcd_write_rx_power_ctrl(struct dc_link *link, boo=
l on)
>         if (link->sync_lt_in_progress)
>                 return;
>
> +       if (!on && link->apple_imac_peer)
> +               return;
> +
>         core_link_write_dpcd(link, DP_SET_POWER, &state,
>                                                  sizeof(state));
>
> Should I submit a v4 patch with this change?

Yes please.

Thanks,

Alex

>
> Richard
>
> >> - Unlatch both tiles (0x4F1) and clear DP_SOURCE_TABLE_REVISION (0x310=
)
> >>   and DP_EDP_CONFIGURATION_SET (0x10A) in
> >> amdgpu_dm_apple_tcon_unlatch()
> >>   during dm_suspend() so the TCON returns to single-pipe mode for the
> >>   EFI boot screen across reboots.
> >>
> >> Signed-off-by: Richard Lane <richardlanedev@gmail.com>
> >> ---
> >>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 19 +++++++++++
> >> .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 34
> >> +++++++++++++++++++
> >>  drivers/gpu/drm/amd/display/dc/dc.h           |  1 +
> >>  .../drm/amd/display/dc/link/link_detection.c  |  7 +++-
> >>  .../dc/link/protocols/link_dp_capability.c    |  4 +++
> >>  .../display/dc/link/protocols/link_dp_phy.c   |  3 ++
> >>  6 files changed, 67 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >> index 3d2201285888..6275a585593c 100644
> >> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >> @@ -1610,6 +1610,23 @@ STATIC_IFN_KUNIT void
> >> dm_destroy_cached_state(struct amdgpu_device *adev)  }
> >> EXPORT_IF_KUNIT(dm_destroy_cached_state);
> >>
> >> +static void amdgpu_dm_apple_imac_unlatch(struct dc *dc) {
> >> +     const u8 zeros[3] =3D { 0 };
> >> +
> >> +     for (int i =3D 0; i < dc->link_count; i++) {
> >> +             struct dc_link *link =3D dc->links[i];
> >> +
> >> +             if (link->apple_imac_peer) {
> >> +                     core_link_write_dpcd(link,
> >> DP_SOURCE_TABLE_REVISION, zeros, 3);
> >> +                     core_link_write_dpcd(link,
> >> DP_EDP_CONFIGURATION_SET, zeros, 1);
> >> +                     core_link_write_dpcd(link, 0x4F1, zeros, 1);
> >> +                     core_link_write_dpcd(link->apple_imac_peer, 0x4F=
1,
> >> zeros, 1);
> >> +                     break;
> >> +             }
> >> +     }
> >> +}
> >> +
> >>  static int dm_suspend(struct amdgpu_ip_block *ip_block)  {
> >>       struct amdgpu_device *adev =3D ip_block->adev; @@ -1677,6 +1694,=
8
> >> @@ static int dm_suspend(struct amdgpu_ip_block *ip_block)
> >>
> >>       amdgpu_dm_hpd_rx_irq_work_suspend(dm);
> >>
> >> +     amdgpu_dm_apple_imac_unlatch(dm->dc);
> >> +
> >>       dc_set_power_state(dm->dc, DC_ACPI_CM_POWER_STATE_D3);
> >>
> >>       if (dm->dc->caps.ips_support && adev->in_s0ix) diff --git
> >> a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> >> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> >> index 6192c0f6086d..e30450415462 100644
> >> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> >> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> >> @@ -29,6 +29,7 @@
> >>  #include <linux/string.h>
> >>  #include <linux/acpi.h>
> >>  #include <linux/i2c.h>
> >> +#include <linux/dmi.h>
> >>
> >>  #include <drm/drm_atomic.h>
> >>  #include <drm/drm_probe_helper.h>
> >> @@ -173,6 +174,30 @@ STATIC_IFN_KUNIT void apply_edid_quirks(struct
> >> dc_link *link, struct edid *edid,
> >>               drm_dbg_driver(dev, "Force FreeSync min to 60 Hz on pane=
l id
> >> %X\n", panel_id);
> >>               edid_caps->panel_patch.force_freesync_min_hz =3D 60;
> >>               break;
> >> +     /*
> >> +      * Workaround for Apple 21.5" 4K and 27" 5K iMacs which expose a=
 2x1
> >> +      * tiled internal panel over an eDP root link and a secondary DP=
 link.
> >> +      * Point the secondary link to the root link to latch/unlatch th=
e TCON
> >> +      * via DPCD, checking connector_signal as panel IDs can flip aft=
er wake.
> >> +      * IDs (Root/Tile): iMac15,1 (AE01/02), iMac17,1 (AE05/06),
> >> +      * iMac18,3 (AE11/12), iMac18,2/19,2 (AE19/1A), iMac19,1 (AE25/2=
6);
> >> +      * TODO (DCE >=3D 12): iMac19,1/19,2 Vega, iMacPro1,1 (AE1D/1E),
> >> iMac20,x (AE31/32, AE35/36).
> >> +      */
> >> +     case drm_edid_encode_panel_id('A', 'P', 'P', 0xAE01):
> >> +     case drm_edid_encode_panel_id('A', 'P', 'P', 0xAE02):
> >> +     case drm_edid_encode_panel_id('A', 'P', 'P', 0xAE05):
> >> +     case drm_edid_encode_panel_id('A', 'P', 'P', 0xAE06):
> >> +     case drm_edid_encode_panel_id('A', 'P', 'P', 0xAE11):
> >> +     case drm_edid_encode_panel_id('A', 'P', 'P', 0xAE12):
> >> +     case drm_edid_encode_panel_id('A', 'P', 'P', 0xAE19):
> >> +     case drm_edid_encode_panel_id('A', 'P', 'P', 0xAE1A):
> >> +     case drm_edid_encode_panel_id('A', 'P', 'P', 0xAE25):
> >> +     case drm_edid_encode_panel_id('A', 'P', 'P', 0xAE26):
> >> +             if (link->connector_signal =3D=3D SIGNAL_TYPE_EDP &&
> >> +                 link->ctx->dce_version < DCE_VERSION_12_0 &&
> >> +                 (link->link_index ^ 1) < link->dc->link_count)
> >> +                     link->dc->links[link->link_index ^ 1]->apple_ima=
c_peer
> >> =3D link;
> >> +             break;
> >>       default:
> >>               return;
> >>       }
> >> @@ -1299,6 +1324,15 @@ enum dc_edid_status dm_helpers_read_local_edid(
> >>       if (link->dc->hwss.prepare_ddc)
> >>               link->dc->hwss.prepare_ddc(link);
> >>
> >> +     if (link->connector_signal =3D=3D SIGNAL_TYPE_EDP &&
> >> +         link->ctx->dce_version < DCE_VERSION_12_0 &&
> >> +         dmi_match(DMI_SYS_VENDOR, "Apple Inc.")) {
> >> +             const char *product =3D
> >> dmi_get_system_info(DMI_PRODUCT_NAME);
> >> +
> >> +             if (product && str_has_prefix(product, "iMac"))
> >> +                     dm_helpers_dp_write_dpcd(ctx, link, 0x4F1, &(con=
st
> >> uint8_t){1}, 1);
> >> +     }
> >> +
> >>       dm_helpers_wait_for_edid_ready(link, ddc);
> >>
> >>       /* some dongles read edid incorrectly the first time, diff --git
> >> a/drivers/gpu/drm/amd/display/dc/dc.h
> >> b/drivers/gpu/drm/amd/display/dc/dc.h
> >> index 8471dcfe24fd..bd3857267331 100644
> >> --- a/drivers/gpu/drm/amd/display/dc/dc.h
> >> +++ b/drivers/gpu/drm/amd/display/dc/dc.h
> >> @@ -2018,6 +2018,7 @@ struct dc_scratch_space {
> >>       bool skip_implict_edp_power_control;
> >>       bool forced_psr_active;
> >>       enum backlight_control_type backlight_control_type;
> >> +     struct dc_link *apple_imac_peer;
> >>  };
> >>
> >>  struct dc {
> >> diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> >> b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> >> index 5b257f003f13..02c6e5874c16 100644
> >> --- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> >> +++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> >> @@ -218,7 +218,7 @@ static enum signal_type
> >> link_detect_sink_signal_type(struct dc_link *link,
> >>                        * we assume signal is DVI; it could be correcte=
d
> >>                        * to HDMI after dongle detection
> >>                        */
> >> -                     if (!dm_helpers_is_dp_sink_present(link))
> >> +                     if (!link->apple_imac_peer &&
> >> !dm_helpers_is_dp_sink_present(link))
> >>                               result =3D SIGNAL_TYPE_DVI_SINGLE_LINK;
> >>               }
> >>               break;
> >> @@ -1651,6 +1651,11 @@ bool link_detect_connection_type(struct dc_link
> >> *link, enum dc_connection_type *
> >>               }
> >>       }
> >>
> >> +     if (*type =3D=3D dc_connection_none && link->apple_imac_peer) {
> >> +             core_link_write_dpcd(link->apple_imac_peer, 0x4F1, &(con=
st
> >> uint8_t){1}, 1);
> >> +             *type =3D dc_connection_single;
> >> +     }
> >> +
> >>       return true;
> >>  }
> >>
> >> diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_cap=
ability.c
> >> b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
> >> index c487c5b87dfd..74954702c5a9 100644
> >> --- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability=
.c
> >> +++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability=
.c
> >> @@ -1496,6 +1496,10 @@ void dpcd_set_source_specific_data(struct dc_li=
nk
> >> *link)
> >>                               link->dc->vendor_signature.data.raw,
> >>                               sizeof(link->dc->vendor_signature.data.r=
aw));
> >>       }
> >> +
> >> +     if (link->apple_imac_peer)
> >> +             core_link_write_dpcd(link, DP_SOURCE_TABLE_REVISION,
> >> +                                  (const uint8_t[]){0x04, 0x1d, 0x03}=
, 3);
> >>  }
> >>
> >>  void dpcd_write_cable_id_to_dprx(struct dc_link *link) diff --git
> >> a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.c
> >> b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.c
> >> index 49521ac4b0e8..f051fe6c060c 100644
> >> --- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.c
> >> +++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.c
> >> @@ -50,6 +50,9 @@ void dpcd_write_rx_power_ctrl(struct dc_link *link, =
bool
> >> on)
> >>       if (link->sync_lt_in_progress)
> >>               return;
> >>
> >> +     if (!on && link->apple_imac_peer)
> >> +             return;
> >> +
> >>       core_link_write_dpcd(link, DP_SET_POWER, &state,
> >>                                                sizeof(state));
> >>
> >> --
> >> 2.55.0
>
