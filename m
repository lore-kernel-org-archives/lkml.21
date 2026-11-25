Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795603364;
	b=SIyHT6Ue4vjmKTiDlh/H+XceLGcdJNSTuB1o5GwR9tAXle7/+LisPM2l0k8wRylqyBUe
	 BduN6va553DW9tgUWSj39ckuhh6B/SdYhMGnW4Z43Yo92gqJy7Um4RNheJ+uIBh3PShGm
	 2LffRT7nsari/lNWaEzcFXuO3E/6PzULX1q/oPnoTc9A/jl4doCpY/3kkZPkrcHfJsYXk
	 iQThMqDlEKpS1LZEoepoe8EPPYxeFljwOAmuESn2lO8k5TeJeHBWToigJcxEPvVzp5rgG
	 iR8YJ/u5Qvv7hs6exc01iB+j6tWQ6r969dDMZ6swKEQp98+WdXNPq8nCmTJc0G4+kGA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603364;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=/a/ZG6zKgHMqLc4mvHHEORZFp2S/0ZUiRBVyNDZzcWc=;
	b=HRR32XoYtd/EdMQfwgLBrRhSGYK5Wv9RdmXnivFs/wkF75C0vF6XneT9eKOwIVbZFuMt
	 kNzYMP+PW54Wj2ZD1rNrGkaCwAvjb2mNyZbs2HaHwH+ZjrkeB5W14vX7GMgSQY8lnMuBt
	 A8VxuTaX5LNcUeA1Cfk1hBTLL9LHbKJZX9AwIhSi/ksYcEnDbG2NjXKCKJvQC4wwIEQ+A
	 nz4pJbYnnMZ8uq+jM/Wayu9mviUQcQP6j7+I+8FyYix+NTZLCrmvnW6HdvE6mP3zGQivC
	 1XEDTw0Md5hrGjCObK8V97FGOcA/5ZHG5eZlX67ec4PVg/RnRHgp35qkbpvv7/bqCeQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DnXw3m9d;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.49
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F4A606A329
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:42:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3F4A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DnXw3m9d
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-990fbae94f5so2922471241.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:42:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795603363; cv=none;
        d=google.com; s=arc-20260327;
        b=TDbuF9E0HGqaBR/e/N2XekHmUJAqFm8uroiykMFsLDVEcSNbSpRn4sRzrkzWf0bHte
         M/azLMhmydp78r0NmxPhkfx8o/zzQi5qYkNTWbxnTV/w6x01UxqHLVrnRgTa0pvkG6vY
         8cDh2g+AHraHw6FLSViIW63MKZ+zKd+B6eIMfMD6oobnRIWlKfJx6aokzRhiJYsAplY7
         5wOJsJzeO7j/NIo4EvC2Ex878ji/rGrLmZVp+WLgGVYyOfY47izbZgiSaVcbAwY+IopZ
         IdNL/T5QosmYs8t1Gb1apl+msJR9XnTl4R+H7Y25tduDJts6S6l3ZJsDsaphzGTpf0Ib
         NRlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/a/ZG6zKgHMqLc4mvHHEORZFp2S/0ZUiRBVyNDZzcWc=;
        fh=nI/MW6VOg3Td+hJKnb6FzV+x7Vo4Z6ocis9i1rxhzbw=;
        b=gvQvCU9TdZXByw1bDfDFis/CoM0bDijk7EJJSw8YHxzxrL1O3Vpng1MSY4wz8o+AcE
         VWeyCqggJlWCjPcOJnhkk43nfITj0EXl9HDfKkOFWFrhU73uzFAcBP2KkIzHSEDzhVal
         px2yG0nVT2/cdyMOF/pla8akGUB4H2Z6/oM8xCM5sX4VzjtyVdGG0nTH/pdCUzO+23NF
         Oog8h5hjIgP1ie3ZFfizEAND6QwU2ipv9/NFirtg89Kih2NvoTr7CCCFT8fa0CpWWvv/
         aZLPlRvuEuzMfm2p+3ds9LqKxIsCQpdDSqSmyEB6bY0ED3wfKNHd5HsC9d/NfrrPL7lz
         6iOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795603363; x=1796208163; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/a/ZG6zKgHMqLc4mvHHEORZFp2S/0ZUiRBVyNDZzcWc=;
        b=DnXw3m9dleWiRRvXuQdPPMYTcl2aHpNDdv4pbjJuIGDXd43kSZCwm2q3KbnFlwS9NS
         EY938TrH2p8VGj0OJ91g8tKeDrghXE7x49Nk5Vvv3DJGYWywCPA9Hdqd9LFV4LMoEWH7
         M+mN/wKucbiUlikGRb6916jXiDKNverknlBtF3Q7WdosgGfYrxB/H1G2hvDOdEbJFkqr
         7rSmj4sghoxWCnbp6KlCvRJUfs/4xMHdCGJboAVkwQkaHEvivcXb7fJCAGF+xtMlIYq8
         q5XJMcAMhDsOI3m4Dl8Wspn4HBN6E788VLCBvovnHcEwAzSsC17WzzBwE+wiswyqWoUx
         kPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603363; x=1796208163;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/a/ZG6zKgHMqLc4mvHHEORZFp2S/0ZUiRBVyNDZzcWc=;
        b=YekMicG8Nd4Mj/J1QQgmoKCa80s4aCY4HzbRJCeMxSDQEW/z0typYROHw87QocNgjc
         8Fhw9EjUkmhSnw4JjETj97TdRUl6PlHwZ6ttqVLB+3omeuKDSxrWVEUtlx7alz44LoYC
         dmGxGXjRIQAJ0IXsj95ISNibyAuUFM4R42cGztD9Gqfyb1K+NEZwMqWPhX3RBgTsXDAp
         r153/6ebgWpi5hhtKfBnCEa6m9M7B5hIMx3pBdVO0s05PTvVaDj0kgAoQ+cha+sj0Ak3
         g7R1X29yIPnAEJuVnkmS+Ft5z+n7wA5Mn6/6WiYsKY/llYZNaA3bf37APeVVu+w4Yr0e
         QWpw==
X-Forwarded-Encrypted: i=1; AL+hErFnfF7R6ta20GykdIB5JoQNgXIlM316vCitgW5gGgFANObJHH7IbebuYUsxjHjNe1zlRqLoSljDS5yljAk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LSZauPIkiS1Ok2FnQdoo3WfqPUlZ4MYsFXDT52CaIyb1yq8Vr
	RzfEI6C5fc3n4rOBVdYk3RXB50obs9uH4m5HwSuWKu2OsAcn9YGtRygP0VVXx2ZSRxXccr6XA9J
	F2cyRpq4wIeLWvWKFq8oHXNjcKQ2Akg==
X-Gm-Gg: AZFdTZcRe58EqZhm6XdMMf+cx6U6ibU2SvC3tgtFvNQLxSorKNubm5p+mmvMNjRCwNv
	tEhggkRFhDacCdwuF4ITT2vI1XXSTj50BG/Sh5jGSIoLZ0vmItI2ZkhbnnK8BFNypdByN/JQHQ+
	7OUie51piwPQEQ8/x8N0fibfhxP6U828fk3AfetVgqCqK99fuSQOs6sOyaIk4GawpprdihBJt3l
	n8xKPA9NDd5Y9PU6VfrJw+6RnFlvzaPt244Y2zB9iGHQ0xFnUXLMiK3k/o9Qdmq3qGZ1AMpSJ7D
	496qBZklMmmNWbvtB3Zc66v4QJYO5EdW2V8EVGew4z99aVWgfY/q7VUDK2fzo6x6lyOkswGcmIc
	BZig+WFoQuHi02fQJLtQfNJug/phzv14bMcthkh/gePg3LKrBiQVO2BFr9/qxbBx4mlBhkA==
X-Received: by 2002:a05:6102:3593:b0:7d2:cf82:1a5f with SMTP id
 ada2fe7eead31-7d7395d2150mr8740665137.24.1795603362685; Wed, 25 Nov 2026
 02:42:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121214105.32596-1-gianfranco.mariotti94@gmail.com> <6298b3d0-db8e-4342-9abd-4c104bac8e27@oldschoolsolutions.biz>
In-Reply-To: <6298b3d0-db8e-4342-9abd-4c104bac8e27@oldschoolsolutions.biz>
From: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
Date: Wed, 25 Nov 2026 11:42:31 +0100
X-Gm-Features: Aa3M54roFIr0PhnlmT_bXjlKsY_WD56KJINpDz9vkucYv15wjRk7DGwl6xU0iag
Message-ID: <CAAX85RvitbgA09Qj+-LfhpKJ5p3HP-8QCDG5e4U69q_xrZ2V4A@mail.gmail.com>
Subject: Re: [PATCH 0/7] drm/msm/dp: fix DisplayPort hotplug, link training,
 and multi-lane PHY setup
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Yongxing Mou <yongxing.mou@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dale Whinham <daleyo@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jens,

Thank you for backporting and testing this on X1P42100 across both
the PS186 bridge and the LTTPR dock setup.

While doing additional DPMS/connector-off and branch-adapter hotplug
testing on QCS8275 (plus addressing automated review feedback on v1), I
actually hit the same post-link-disable HPD/IRQ_HPD pulse behavior from
an active DP-to-HDMI adapter and found a few edge cases in v1's HPD and
link-maintenance patches.

I am about to send v2 against msm-next with the following updates:
- Reordered the series so the self-contained fixes (1-5) come before the
  HPD state tracking (6/7) and IRQ_HPD dispatch (7/7) patches.
- Patch 2/7: also reset link_info->use_rate_set alongside rate.
- Patch 4/7: drop the redundant msm_dp_ctrl_configure_source_params()
  call (msm-next already calls msm_dp_ctrl_config_ctrl_streams() in
  msm_dp_ctrl_link_train(), avoiding unclocked pixel_base access when no
  stream is active) and guard SEND_VIDEO with stream_clks_on.
- Patch 6/7 (was 7/7): fix a runtime PM leak in msm_dp_bridge_detect(),
  track drm_dp_read_sink_count_cap() + prev_sink_count properly, keep
  the PHY initialized for AUX/IRQ_HPD across msm_dp_display_unprepare()
  while dp->plugged remains true (balanced across system sleep), re-read
  EDID on demand in msm_dp_display_get_modes() if edid_blob_ptr was
  cleared, serialize prepare_link()/unprepare() under plugged_lock, and
  keep empty branch dongles (-ENOTCONN) plugged.
- Patch 7/7 (was 5/7): skip sink requests in
  msm_dp_ctrl_handle_sink_request() when link_clks_on is false (which
  cleanly ignores those DP_LINK_STATUS_UPDATED pulses right after DPMS
  off), and emit drm_bridge_hpd_notify() on branch
  DS_PORT_STATUS_CHANGED transitions.

(Side note on that "No sink connected" debug message you noticed: the
if/else in msm_dp_bridge_get_modes() actually has an inverted debug log
and prints "No sink connected" whenever rc > 0 modes are returned.)

Since patches 2, 4, 6, and 7 changed non-trivially, I only carried your
Tested-by tag onto the unchanged patches (1/7, 3/7, and 5/7) in v2.

Best regards,
Gianfranco

Il giorno lun 23 nov 2026 alle ore 12:03 Jens Glathe
<jens.glathe@oldschoolsolutions.biz> ha scritto:
>
> On 11/21/26 22:40, Gianfranco Mariotti wrote:
>
> > On platforms with a native DisplayPort connector using direct HPD
> > interrupts, DisplayPort initializes on cold boot, but physical cable
> > unplug and re-plug cycles leave the display blank even though link
> > training and stream enable callbacks report success.
> >
> > This series fixes the underlying PHY lane setup, DPCD link-rate caching,
> > SST training-pattern handover, link maintenance BPC restoration, and
> > HPD / runtime-PM state tracking issues:
>
> Hi Gianfranco,
>
> thanks for this series. I backported it to 7.3.y [1] and tested it on a
> Lenovo IdeaCentre Mini 01Q8X10 (X1P42100) with 50 rounds of DPMS
> off/on, first HDMI only (Parade PS186 branch), then HDMI plus a second
> display behind a Lenovo USB-C dock (40B0, DP alt mode pin D, 2 lanes
> through two LTTPRs).
>
> Before, external displays behind the HDMI bridge regularly failed to
> retrain after DPMS wake on 7.2+. With the series, every wake trained
> once at HBR2, CR/EQ passed on both links, and video came up every
> round on both outputs. No "already disabled" or PHY power_count issues.
>
> Notes on the backport:
> - 2/7 is covered in 7.3 by the link_info memset from Anthony Ruhier's
>    172c1648222e ("drm/msm/dp: recompute the link capabilities on every
>    sink read"), so I dropped it.
> - 5/7: 7.3 already routes native IRQ_HPD via 216110888698 ("drm/msm/dp:
>    Handle IRQ HPD as a sink request"), so I only carried over the
>    pm_runtime_put() change there.
> - 7/7: 7.3 lacks 1bda647ce61b ("drm/msm/dp: move link-level teardown
>    from display_disable to display_unprepare"), so the teardown still
> lives in
>    msm_dp_display_disable(); I applied the dp->plugged gating there
>    instead of in unprepare.
>
> One observation: on DPMS off, the PS186 still raises an HPD IRQ about
> 100 ms after the link is disabled, which sends a hotplug uevent per
> connector, with get_modes reporting "No sink connected". It's harmless
> here, but some debouncing may be worth adding on top later.
>
> For the series, as tested on X1P42100:
>
> Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz> #
> x1p42100-lenovo-ideacentre-mini
>
> [1]
> https://github.com/jglathe/linux_ms_dev_kit/tree/jg/ubuntu-qcom-x1e-7.3.y
>
> Best regards,
> Jens
>
