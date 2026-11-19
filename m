Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795103885;
	b=HmML1/Qjj5ZZIt7rvrB3Qae8gbNWR0nmDmfg67yEdo91uoYgmaRDXT9v/TWJHBlQcRix
	 wqLZ9SPxJd9XIp6tcs7xUb2KlqJAfpdA9PVgDUmIIHsfA5N5027vID8FtqtYuW3cTtpzR
	 WB6+CsNsY0u+Lg1JLQDHZ/kF+Nc2Krl3faBCD1+uRTKQwAaHwErEXFqROzs/akBlig/DI
	 PgX72xiDP0A+ubMyqrXLTMxBumJ2Uy/8Wn/TA9qG/0T3wxm3GQbnQlcIuqbMLYwGIrqLe
	 JDoMfrGWcX34kJj1lYtt0TAQNku70LfCHIvUOVWU97nhSSiQCid9HQse+RgQR7YB/Ww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795103885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Zfp/sSG5jLSQxyif0VfIAOH3AOIjZA6+lW+WncRGZ4Q=;
	b=FnJsz8MnqQPNvkzcDhOQTwdoEtlM/quAWPLrhkRUVYK360qaY6LsnC3y7dn7CHfERQ+b
	 ViqxyptcPK1cutymlyHN4OWsB4hGZeI9lcoFdFngEEo5pqxkJ+ERkBxXlKxk6hob24+5d
	 x6g6U7mxTY36hx1fgXDnn8F2CWVD1qNpcDKdJulGWNZ0d6TgsSSK6qwo4OjlFSap/+muh
	 T7o628zv1xcr2c4CZNVs01K2yfJCyl80cmt1W4HASfylFfP4Yhq8MbsBfADl45BsYilvr
	 miyA93dmGjciYXP2SFHvPGbv1O9GGTmC/TNoNcuO5zeXlVN4lszGb032xpwQBQp3whA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="b8/KQKKL";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.181
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08144606A334
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:58:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08144606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b8/KQKKL
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-5778f744b79so64750b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:58:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795103883; cv=none;
        d=google.com; s=arc-20260327;
        b=BWl92slVbyuuZZkip2IJMSXKFrO2iU7I2gX1ogmywUewxPb+j/CyEvJ3mTkrpxrnkP
         tA8TOtGioAHO2OpSIrPjI6Dp2av32Ujue6wyRcm2gALxAJvVv1v8+HjWrkI9ZCUFsagy
         iJSpkKJI0DITpBWwXDfdQ7Jxq5BMZrY4tc1fEfP1pH40xDA6BnGIN9w09bJNJHA5FssG
         KM7umAsePmaAxIOMb4l9P2xq6sr5XdlLsLFI3hCIn0MJDb1sJd1D1ecYWSuQnQJflONI
         kCwfunNbZKCmtBmaNwG+hbtn9cf/rNMQ2YzoVqrffR7KpghIkVSyVQF/T6ECDm9OofDn
         2ECQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Zfp/sSG5jLSQxyif0VfIAOH3AOIjZA6+lW+WncRGZ4Q=;
        fh=OCZgsNltmgGheiLNkiqKShT3fpxblp+b29MynRrgTM4=;
        b=Ox7mq1kPlHeblBVUWEU/HoNPbQ+BC46vSvhvSEC12JGtC5QOjd5wg+XF9bZkR5rPPi
         ILQ0tnIdnVuFQXGGmUgjg32g35tZbP1sTQyK1TOjmQ8hXrDXEYcv7lHq04j0kbpDrAiE
         ASMmET8yanrLLSlpZ+/xxzxzqaInTTzO6VsQQDrBuVA5p5VhBdL8G96EzmDQyb+ae8yj
         207BcjKwU19hOkRJ5f2axO+/3iwav+3Xgwpvgd425qEV/2WdqCR8NkCnsmIV0T1F54Em
         vYcAabD3G/7V0xLRz3QiwD1fRC3qQfgP2V624S1vyP4ayAnWTZBCcOqnK/2CUQQGcp7Y
         Uh6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795103883; x=1795708683; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zfp/sSG5jLSQxyif0VfIAOH3AOIjZA6+lW+WncRGZ4Q=;
        b=b8/KQKKLuLw2fjXCVKnXMz7WyMe+JMwIhTGJitl1GlmwrZYO1JaOlzINlAnLlovAEH
         UG3KRK3i6l2S4bF9VRNQa/Gic4Yqe129EEfGg/8NRUY29qsTv0Wf4Ng0fsCXrEiuTF8t
         6P4mD3ym2ErzUwo/z1hB91XGfre4iQFqt6cVNRGoqPNLVbdoHeOnIwAVAZ2E3Hd9wHru
         L+3PbDmr5F6g5UJ1S8wtedFVF7mp1U5tVl10y8paIAtzTcgx18oVGhDJcxGFqKrAfVqs
         Ly48oTfs74KEl3SVDwG2VsYSayc8T8AVKtTZOSwKy39TrhqThwe57trwFB0QqPnPHMgx
         Z9rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795103883; x=1795708683;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zfp/sSG5jLSQxyif0VfIAOH3AOIjZA6+lW+WncRGZ4Q=;
        b=YO9YgrrxirsXQ8b0mW/bFlA/eRlFQ0XGCdWmv9MdS7ckG0V0Fv7qDJ7vc09ZeDyl3z
         +oq0iEe32Mvqi/OqOUFuLYpIxw9jlTKfW8lh+hOFX9WTgTgSItC8zQYWcu5xhfEci/zu
         Dv3eUSlkLRKMuHlZPz7fzYFy0aW1l/wa1zfAD0MJxcML30iPuIEhepD3h5ZMo+aWc3+a
         FAaIsBUlJ7XJDVkaZXQhBe42rt2Z+8DqXeBHCUi5k2S9KCdrwmmEG/Ir0wAjeeyfuYBS
         LhOMl+oHlrX38dvVw/RKOCISGvTT9LDCemLAUMQdIQgW/OEW7Yz5EDVyCGMhI3do7JgB
         nAeA==
X-Forwarded-Encrypted: i=1; AL+hErFij8FgOP816xZLK4G0OKSJ0K4qoE+elWb1w0rMygQ04xxsnrq3EnwLFmUVYL2r3pFagLyqn3lzeAzvxDw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Y0VjLD0Ygd/oYcJ8THt7GD9ItNQ1kAfpkfwyNoyKSbMOV88cK
	lUXPXLAL61JXjvXYDuwAXODt1PtE+VqkHEUlkaTTixAAbxx08C3hXXV7mkF1e0q4DoqN1ZyT+HZ
	aqkVg1KfiauQ/+63ay8YvesPSJdUaXb0=
X-Gm-Gg: AYBFou10C9Sq7xuduuZ9BDqDqGBqog4hJbRkHp3DAoP2yrOy0FYJlR1ItHE9PcfGVku
	xzCDHqq1mMgEcKSrqvPwevtmxhQobk5EQRK/ywuJ6PM84219Du2F7BBL/49hSs4JecmjZ7YH1KX
	OHeKlR3peI/e255NTBfljb7MrI1EJb/iYMBU81s6hXB3O1K/Y3SQGBrSi39v+CZaBWCpOk9os9s
	sUNmdhpqPcx3cGJGOWyJ/pgl+SotXoTYntCaMgEjoXq3NpdSrLdISSFl0IRjRHS5ruxWNPlq/L/
	jjjb/ghDkDLZkqIkLxbi335H4CqY64cYBcH3ZHdywJAjVFfUzTRju3n9gUp21ffjECBDRQjyeqJ
	ggHiHojjgx6XXBfGdl7jSr5B8Be3haFZum2axTPezWnIcGCpsySKOCug1Lb/Fg07f7g6iVWDttK
	pr3S7UuM/uXmo0xebpyRopzzhIqnT8MvLjOmJ+jWCIS0oBGB7XPt7dVoCHSWud
X-Received: by 2002:a05:6808:1a0f:b0:572:f9ab:c2c5 with SMTP id
 5614622812f47-57a0910b919mr443253b6e.4.1795103882844; Thu, 19 Nov 2026
 07:58:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-vfct-regression-v6-0-393797bbb6e3@amd.com> <5cf8f937-acc8-475e-ba0c-6be00defbb53@amd.com>
In-Reply-To: <5cf8f937-acc8-475e-ba0c-6be00defbb53@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 19 Nov 2026 10:57:49 -0500
X-Gm-Features: AclHuK-Pw2ItFRgv4vG8DuHpZH3Cm8ObSCuVEl9wVmjZ1BCfQqEiUUdyusvBEWI
Message-ID: <CADnq5_PAarNZ24xOU3MqVfEra1hSOqgrKQxvLppyCWZQebr_yw@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] Fix amdgpu detection of pci=realloc
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Oz Tiram <oz@shift-computing.de>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, 
	Reza Nikzad Chaleshori <rezanikzadch@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 10:30=E2=80=AFAM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
>
>
> On 11/11/26 10:43, Mario Limonciello wrote:
> > amdgpu needs to know the bus number the platform assigned a device to
> > be able to match firmware images against the right device.
> >
> > This was previously adjusted to be a soft filter due to
> > commit 11c141672045f ("drm/amdgpu: Fix VFCT bus number matching with
> > soft filter") where if everything but the number matched to take a devi=
ce.
> >
> > This however fails when there are two identical devices.  Instead save =
the
> > initial bus number to the PCI device structure and then match that.
> >
> > Link: https://lore.kernel.org/linux-pci/20261015124843.203905-1-mario.l=
imonciello@amd.com/
> > Link: https://lore.kernel.org/amd-gfx/20261019194106.2796150-1-alexande=
r.deucher@amd.com/
> > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> > ---
> > Changes in v6:
> > - Capture the firmware secondary bus number when reading bridge windows=
 and
> >    ignore unconfigured values so rescans cannot replace it with runtime=
 data
> >    (Sashiko).
> > - No change needed in the VFCT consumers; they continue to read the cac=
hed
> >    value from the upstream bridge.
> > - Link to v5: https://patch.msgid.link/20261110-vfct-regression-v5-0-f4=
9fae981bf3@amd.com
> >
> > Changes in v5:
> > - Record the firmware secondary bus number only on the bridge struct pc=
i_dev,
> >    guard it with a validity bit, and keep it across rescans (Bjorn, Lij=
o).
> > - Drop pci_bus::number_initial and have amdgpu/radeon read the saved br=
idge
> >    number when matching VFCT entries.
> >
> > Changes in v4:
> > - Retain secondary bus bus number for a bridge across rescans, and the =
child bus is initialized
> >    from it during allocation, before registration callbacks run. (Sashi=
ko)
> > - Rename variable to clarify it's for bridges (Lijo)
> > - Link to v3: https://patch.msgid.link/20261026-vfct-regression-v3-0-fe=
9586ed6978@amd.com
> >
> > Changes in v3:
> > - Preserve the firmware bus number across bridge renumbering, capturing=
 the
> >    secondary bus number before pci_scan_bridge_extend() clears it.
> > - Adjust member name in all patches
> > - Add tags
> > - Link to v2: https://patch.msgid.link/20261020-vfct-regression-v2-0-d2=
394d11450a@amd.com
> >
> > Changes in v2:
> > - pci_alloc_dev(NULL) remains safe.
> > - For buses behind a reassigned bridge, the PCI core now saves the firm=
ware secondary bus
> >    number before clearing the bridge configuration and carries it into =
the newly allocated bus.
> >    Devices discovered there inherit that original number.
> > - Add changes for radeon too.
> > - Link to v1: https://patch.msgid.link/20261019-vfct-regression-v1-0-5a=
63ddd378dd@amd.com
> >
> > ---
> > Mario Limonciello (3):
> >        PCI: Cache bridge firmware secondary bus number
> >        drm/amdgpu: Match VFCT using initial PCI bus number
> >        drm/radeon: Match VFCT using initial PCI bus number
> >
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c | 23 ++++++++++-------------
> >   drivers/gpu/drm/radeon/radeon_bios.c     | 25 +++++++++++------------=
--
> >   drivers/pci/probe.c                      | 16 ++++++++++++++--
> >   include/linux/pci.h                      |  4 ++++
> >   4 files changed, 39 insertions(+), 29 deletions(-)
> > ---
> > base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
> > change-id: 20261019-vfct-regression-2142fc52852a
> >
> > Best regards,
> > --
> > Mario Limonciello <mario.limonciello@amd.com>
>

Is v6 preferred to v7?

Alex
