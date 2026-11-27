Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774464;
	b=sFGKkDFfLtfuhCMXGFey6JXbEFoqMlWzgFrjZYYg6vAC2gXvmkrChcVf/FwBTZHCzyA1
	 jL+c26piCS0x4uK242OQpQFhni4uszf3yeSfONvqxzSQ2EXpzZmtAaooPOzoyj7C7NZLi
	 ZrJQX/0n/NbdnsPs1gX2FNC2r4pCUX1UldLUbjeMPTHTvKTd7mPnx1M3IHoOAocHxElC+
	 I9BGoa33TiZfo7J3G7AkEKlS892F//zYFMJS8apem6ZxbTrCW6VAdd+TEvGz9UUFbnDX/
	 lctbODBAaI2mOA9hba35MuFujJMG9sscjrzvXb8oGggttwsHOJjqChRQLolEoX8Hz3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=N6GqXV/LyNS1eXCOHO9HEI0k077DJHCbRkOPximIJxE=;
	b=R1cscthzHGqXx21JE55aFwhxFbD3sU++0565zPyl+9rs4CwfgVpA2VFl4xq2udkOhidt
	 h025jfl45uN+FENW10PYGWbBJPkU3tmK+JXyKbmjXHe4G+oNGvBKu6sYLtxa2HA6CN26Y
	 5Zzt443M5gzpVq3uGOs0ZBaSq6R7IKQLs0eGK7VkTrFnvDgo32EIVIJgbhU3geGjBpMDM
	 5H9Qd8QhghCsz5W/tgapwEHZs2ar/1Xfy6Ev7yjuuuQp3emOYnmVJKYOOic2KMxkkp6Ty
	 Y6BORAZ1uGeSvff1qlTR8Lzv8fX0AMtp+r3S/VJs9h+QuTRlcMMAw1ZVvOYDIZ0a2Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GbXH75zm;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79ADA606A33B
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:14:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79ADA606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GbXH75zm
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-49a92144733so3962107f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774463; x=1796379263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N6GqXV/LyNS1eXCOHO9HEI0k077DJHCbRkOPximIJxE=;
        b=GbXH75zmMZq1wH6lilVCPrq1meQRkGymzEwoGp022+Rs7/GpALnIWBBO6kh+GPhwUa
         q+TeLZ7DENQDAAFV1C6mdk6CqJNXa6YjFNlwJR3yO0ZwIkInbzAhb0AH7HbG2ASoYXDq
         UlzrE9o81lgR71VFUEmY2GtFkdqdURvxHisTtdsh+podXGA+rwGSTjHgILpcFfG/jyeA
         REY8Sp+3soFJpYuWT60MCg9Vy23yjkdcjTo5vgn6+sAaf4PjgM5CHUM9g7dteli0tipP
         IUc0uElq6JsJ1YsHI3eknwGfpvcEfckjlTd2u1VSrsMyLqmdf1MTktKewdjmPlGyelca
         yfhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774463; x=1796379263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N6GqXV/LyNS1eXCOHO9HEI0k077DJHCbRkOPximIJxE=;
        b=z/O6BcZFNvd3bp+z4cmvwWoXUBaxLqBjBp9fFMid3m6tkx0GGqWjVsgF8uiWOG/zbG
         GJa8kfrLTE50CFeHiaPPx1lGeOQIZxogFyTpFI5qzpz7j30DICHOhN4FrC9qKLdpfOHl
         4/VQsSyTdYxKoYN+fHQqK6spu//UQeqsSn1PMwgPzeOphRoXoZS82JQvaW4+CfFd5QIJ
         0PHZxg9mtLnuLjAESTwPfg/0rQEiGa6Sxny7DGJEbrYz9m8wPsrF1DVqYiOUG+yLUHiR
         8vkAZoRV3N1THcC3lf7XVhncxAqa8tHfBWqrsBEdjB9smWZf92ud+0YveluGqUmqLIyl
         fbpA==
X-Forwarded-Encrypted: i=1; AL+hErFz4f1FyHXJ/YrDaCv+29QCfcsUZn5mnatGV1dppZHzAQv/9HfnD+Hr6ZrzrhxJDevnwDoZfUi0H8yo7+0=@vger.kernel.org
X-Gm-Message-State: APuU4Z91xowPbbXoRrrmJV4pSdJDPKUvT8LhHd2xow/gI+HiDYMbsUwk
	Lr6w+fLBiT0dC9xAxfECEFPBeq/8Dvkr7Ch5mWq/eRaRkELhiTVo8V0=
X-Gm-Gg: AZFdTZer2au2a5rL+kscDr0fPkEoTXrTITGLXWSp/JxxM4/AdrDOI7414lCI5oe7zuD
	MDnmEjaYRL1fdGfQWpcGnbwf4uhDvnC+04iv7LNy8tBxr8u4K1iuUFnnr8zWRREz7uVMFJnGxQJ
	TqINWHeqzYDj9qaC2dK5bXPg5tHRrJE4p24/d5JkiUzxUz3O3sBq55xO942ooblsvNWSoon7YNd
	cRx6/B/cJMEXsidz1cGYNQAP/xvV9ZdLfh40BDmL1sofYLJRnA7a6Tjvu1N2kmSgYyPWjqQCI09
	BEpaQ6vniOTN6nLmvWRv44u+IccZWYE71PvGe3PyuFsxw+0u6d+43X7qRfyFj2vbxClX9kNPzpy
	JzgiNKfD0KnWa19oftEwdBMyKR9nfnJhG0OsfJ539mFezF6vQ2rDW9R4lhBb7kX59TPvG2rVgYz
	EjmcpuQp5cgeZcc9ri1G/TrOa8xT+o8Thi0ZLkizctWXfFO+CQSZmsPLdn0gw2nNgip4rCMDsab
	PuR6AxA4ApZQvxPLwWwKQVibjF8OPp2uIfVcr/8Cd8kEXBHF17NYk0VuSaV5TKepvlRt/cbOYFO
	wQ7ml31JPwW748oPTu+HJek0Xa8QR/Vkr49Dmlbp/23TnC8aBjYRo+9Orll3MpIAMxpOhvyYQDH
	jrN4hTtgfT0LQDdz+cu8Z6hRseDGb3A6gTfq/UQaQwy4OszRlYYqIAb33sos=
X-Received: by 2002:a05:6000:2308:b0:49b:587:121a with SMTP id ffacd0b85a97d-4abb36787afmr49730970f8f.16.1795774462607;
        Fri, 27 Nov 2026 02:14:22 -0800 (PST)
Received: from localhost.localdomain (host-94-89-17-99.business.telecomitalia.it. [94.89.17.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm43651234f8f.26.2026.11.27.02.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:14:22 -0800 (PST)
From: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
	Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
	Dale Whinham <daleyo@gmail.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
Subject: [PATCH v2 00/10] drm/msm/dp: fix DisplayPort hotplug, link training, and multi-lane PHY setup
Date: Fri, 27 Nov 2026 11:14:07 +0100
Message-Id: <20261127101417.24303-1-gianfranco.mariotti94@gmail.com>
X-Mailer: git-send-email 2.25.1
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

On platforms with a native DisplayPort connector using direct HPD
interrupts, DisplayPort initializes on cold boot, but physical cable
unplug and re-plug cycles leave the display blank even though link
training and stream enable callbacks report success.

This series fixes the underlying PHY lane setup, DPCD link-info caching,
SST training-pattern handover, link maintenance completion/stream
handling, and HPD / sink_count / runtime-PM / PHY / EDID state tracking
issues:

1. Configure PHY voltage swing and pre-emphasis across all active lanes
   and refresh lanes/link_rate in msm_dp_ctrl_set_vx_px().
2. Zero out cached link_info in msm_dp_panel_read_dpcd() so re-plugging
   a different sink does not reuse stale rate, use_rate_set, or
   capability flags.
3. Avoid redundant back-to-back link training in
   msm_dp_display_prepare_link() and keep DP_TRAINING_PATTERN_SET active
   until msm_dp_ctrl_on_stream() is ready to switch REG_DP_STATE_CTRL to
   DP_STATE_CTRL_SEND_VIDEO.
4. Guard msm_dp_ctrl_push_idle(), reinitialize ctrl->video_comp, and
   keep training pattern active until stream clocks are enabled in
   msm_dp_ctrl_link_maintenance().
5. Use asynchronous pm_runtime_put() on HPD unplug/notify paths called
   from msm_dp_display_irq_thread() to avoid a synchronous disable_irq()
   self-deadlock in msm_dp_pm_runtime_suspend().
6. Track drm_dp_read_sink_count_cap() in link->has_sink_count and keep
   sink_count and prev_sink_count synchronized across plug and unplug.
7. Keep dp->plugged, AUX transfer enablement, and runtime PM references
   balanced across plug, unplug, detect, prepare_link, and empty branch
   dongle notifications.
8. Keep the DP PHY initialized across msm_dp_display_unprepare() and
   system sleep while a sink remains plugged in (removing now-unused
   msm_dp_ctrl_reinit_phy()).
9. Re-read EDID on demand in msm_dp_display_get_modes() when
   edid_blob_ptr is NULL (e.g. after DRM_FORCE_OFF).
10. Dispatch DP_DP_IRQ_HPD_INT_MASK to msm_dp_irq_hpd_handle(), skipping
    sink requests when mainlink clocks are off and emitting bridge HPD
    notifications on branch DS_PORT_STATUS_CHANGED events (kept at the
    end of the series so it can be dropped if superseded by in-flight
    DRM_CONNECTOR_DP_IRQ_HPD changes).

Changes in v2:
- Add Jens Glathe's Tested-by on unchanged patches 1, 3, and 5.
- Patch 1: clarify commit message regarding persistent ctrl->phy_opts
  staleness on link maintenance and update Fixes tag to 937f941ca06f.
- Patch 2: zero out the entire link_info struct (rate, use_rate_set,
  and capabilities) before parsing DPCD.
- Patch 4: drop redundant msm_dp_ctrl_configure_source_params() call (as
  msm-next already calls msm_dp_ctrl_config_ctrl_streams() inside
  msm_dp_ctrl_link_train(), avoiding unclocked pixel_base access when
  no stream is active), guard msm_dp_ctrl_push_idle() and
  msm_dp_ctrl_clear_training_pattern() / SEND_VIDEO with stream_clks_on,
  and update Fixes tag to 8ede2ecc3e5e.
- Reorder and split HPD changes (was patch 7) into four focused patches
  (patches 6-9):
  - Patch 6: DP_SINK_COUNT capability and prev_sink_count synchronization.
  - Patch 7: dp->plugged, AUX gate, msm_dp_bridge_detect() runtime PM
    release, prepare_link locking, and empty branch dongle handling.
  - Patch 8: PHY lifecycle across msm_dp_display_unprepare(), unplug, and
    system sleep, removing msm_dp_ctrl_reinit_phy().
  - Patch 9: on-demand EDID re-read in msm_dp_display_get_modes() and
    DRM_FORCE_OFF error log suppression.
- Patch 10 (was 5): move to end of series, guard
  msm_dp_ctrl_handle_sink_request() with ctrl->link_clks_on, guard
  msm_dp_irq_hpd_handle() with dp->plugged, and handle branch
  DS_PORT_STATUS_CHANGED connect/disconnect with non-reentrant
  drm_bridge_hpd_notify().
- Link to v1: https://lore.kernel.org/r/20261121214105.32596-1-gianfranco.mariotti94@gmail.com

Testing:
Hardware-tested across cold boot, unplug/re-plug, monitor swap (4K60
native DP and DP-to-HDMI branch adapter), connector DPMS/off cycles, and
IRQ_HPD link-retrain cycles on a QCS8275 (Monaco) SMARC board (SECO F86)
with a native DisplayPort connector running v6.18 + the FROMLIST DP
HPD/MST series (Qualcomm Linux / QLI 2.0), then forward-ported and
build-tested against msm-next.

Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>

Gianfranco Mariotti (10):
  drm/msm/dp: configure voltage swing and pre-emphasis for all active
    lanes
  drm/msm/dp: reset cached link_info before reading DPCD capabilities
  drm/msm/dp: keep training pattern active until stream video is ready
  drm/msm/dp: reinit video_comp and guard stream state on link
    maintenance
  drm/msm/dp: avoid synchronous runtime PM put from HPD IRQ thread
  drm/msm/dp: track DP_SINK_COUNT capability and sync prev_sink_count
  drm/msm/dp: fix HPD plugged, AUX gate, and runtime PM tracking
  drm/msm/dp: keep PHY initialized while plugged across link unprepare
  drm/msm/dp: re-read EDID on demand in get_modes when blob is missing
  drm/msm/dp: dispatch native IRQ_HPD directly to
    msm_dp_irq_hpd_handle()

 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  44 +++---
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |   1 -
 drivers/gpu/drm/msm/dp/dp_display.c | 228 +++++++++++++++++++---------
 drivers/gpu/drm/msm/dp/dp_link.c    |  26 +++-
 drivers/gpu/drm/msm/dp/dp_link.h    |   2 +
 drivers/gpu/drm/msm/dp/dp_panel.c   |  20 ++-
 6 files changed, 215 insertions(+), 106 deletions(-)


base-commit: d024361c631b3f020a26c07d683e5103404b0fbf
-- 
2.25.1

