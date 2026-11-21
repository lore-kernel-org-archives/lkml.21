Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795297279;
	b=h9B7pScERfrqBTQyb6UoPk53Z6dq0BSa0jFJReiP074xfoKgY7um20W4qUzs2XzzcHHe
	 FWhmPh4NI4HZZ4KP992VrEMjVkoG6rxc7AyYFxhbV6djiz50XfPKQEiHgO83qwLypAT2Y
	 WlKwF9XRImZXJoJhR/+h/7emSRLslyqUkhV6paZC88Lz3sfNw7dZnPtaoBjbJDkS/cxFQ
	 M9LUkK/khK17FVn+y/+VWNX7up89c1fxU7/ge1tcf1ukZKZjBOoY90HYZ7zQlgKro/8tZ
	 W16eQ1YXyjdpCn+pOInM1pW5Y1N8cEyBY0w5dtkPv8VuN0DHJr8B7XDYFKhPVOXUjdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795297279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VciGgAHE9AKbwhjShHEMH37yF95luzzv2P4k7R87BOw=;
	b=MhlKRsFBXpQXPzGJnVwruh2Dbe9Q2BUU/lU4sme8fu6l+/e8bVWXISONrSmqWI5TJrRN
	 +mpje8UULykXZN0o+/hbaGcUUBoui1KCrrqy9+/Ea/g/JCcKXB8ysLN1vsQnEhX9bWcH/
	 fO1p03vl/Y4MPfWecE774yrOXlvAdm3vbXCxTWL3oZjrMJCv3Fr5cQ7NqhvXeowxsNJnm
	 OZZ7ibi+pzcbOXI0KomItb67QOfRt5DkzvpRJIE5tnAv+tiCko1ru6nu72vlN40h1ChNI
	 1cyQijkx0ZKaKLJPVbfJwY2AvqdEojhpSc1iUU55kdini2pru9cq9Ze78h7ehAi8i7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="vms/8fN+";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1019D606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 21:41:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1019D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vms/8fN+
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb606491faso11328905e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795297277; x=1795902077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VciGgAHE9AKbwhjShHEMH37yF95luzzv2P4k7R87BOw=;
        b=vms/8fN+Bl8w2xU2W6cWQYeTyeoa+tp9vpy/hXhIzyb+w0gG++VWAc9Xv5xSUHqR7/
         yLNAMVJU9BX8eRj5r55da3Cpk0RQuAiNU0zkfauuy+DAGx0JFZCaFTGRiBRULrrTh4bZ
         KL7oyWYri5WosyrQGPgC32K6uX7e/VSnysFHek/jdlqxN6kx+JHXP/VihNw2X2Tf1TFx
         +TWPxFvjKENRTVMXzHaPHZ6cpxvUIGrJDQL8t3yIcXYZ71oS5xeNQXA1S67JRAJFSS1L
         A3k1lIIAftEzE09jyzGTGaGKiQ3cDcwQnD5peQSPY8OzPGVcyLwZB+Coz0cRUqFCSfCU
         js/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795297277; x=1795902077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VciGgAHE9AKbwhjShHEMH37yF95luzzv2P4k7R87BOw=;
        b=VuZsjgrI4ZpYTuk0awYdKfMglVZ5LeaiIlbLMQGAKUXLPEAG+Q06Kgue3naxOsAjFh
         etMfwraa+bZSmwcWuOrEbEh0TGEiCuJQXNV1gI3z4jOFMy+cLW0g+P8oBbaOS/BWHhxl
         Dn/Cm2TfciGiZSGY+yYV1ssUDv1pY8F8f34VeUZAhTeG3siycZbaiKALV79y45v6Ypo9
         yd0izpTlYqzfpBqfpRexC1qj0ES/aTffYzSU69ZEbBIRdcHzUfFZAh0wL0FNh/cMhFZ5
         Z/iynZoj7pUzwphjS3Jus5sNg3DrsWOb+U1zvohhgpvh3TLIwVEZgKUeKisrNOHy7zUw
         ZwIw==
X-Forwarded-Encrypted: i=1; AL+hErHUASOb/H/E0CeL7x2SUKJEvgCs2cUelfjax3WKI8BrHx+WoIkq+nygG98d0U+DB0k+oM0r9wEJG3EjNWU=@vger.kernel.org
X-Gm-Message-State: APuU4Z//Qbx9BCfJrUfnoauJAKC7vV52XeHMCbxy4isBM4Al56BsPGqW
	AvB1TfzWH5/aQQeCNVIiXBlza+EQrqBnvOfZeu6NODGnbN6t8ZOfZXI=
X-Gm-Gg: AZFdTZd88RgMy50pYQzuYPZKAeBuPO0x1VJRMsxEOaDKp4S6R+M9vUiCuo9DUbEnJGo
	P8CLmNVvB6c4/Oz7w5g38SUMGfGflRNW+Ras4F/o6VAYsWZ4x3fpDqqlhyXHjV0XGkGsKTBRd10
	gNNDFQXI6bSN1UTkOvbLCrPUPotxo0C9Nlxn5uQOgGxDJnsPp8eXyXQfC+JZapAeY4I286JNbnM
	78cxZ7tac5QW8YdCqcQ4p23hV3WUb8z28EM4NCnny0fOFBCH+eRhQLzw9rC7vR5OfH/m05QecdU
	6RME82C9i0aRDxJwFUebq/EqwKJHa9XeJypi3Bz5Ry9uzMqnrmM5oN4j6PhrST8zn49TP49qMvD
	RIpMEec44nSfL0kENMSkqt27QNm15h/8F8me50DxWesOzNeLOhla4d3Td9M3Y5zsv06U8rciDmc
	gjfnX/aiISMDmOjg5WCqdvku3Vk4CdYyKdHUFhSmiD6oeWqs0xbGErtWO4qgTKK7moU5+39lIb6
	v0KOZ0PctnkTJv6rXHbEmqIJNz54+epzINHt/HPW3m2WXLHXaCYKypDZf8Odl+x0GH/sb88O3bj
	Isb9QydZW86Cqr/CsE46M1MIthcpDeCBSvt1KVo=
X-Received: by 2002:a05:600c:a0b:b0:4b7:6a8b:9df2 with SMTP id 5b1f17b1804b1-4bb8882432bmr151110535e9.25.1795297277176;
        Sat, 21 Nov 2026 13:41:17 -0800 (PST)
Received: from h7015t.. ([193.207.113.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067a0e6sm54580645e9.4.2026.11.21.13.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:41:16 -0800 (PST)
From: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dale Whinham <daleyo@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
Subject: [PATCH 0/7] drm/msm/dp: fix DisplayPort hotplug, link training, and multi-lane PHY setup
Date: Sat, 21 Nov 2026 22:40:58 +0100
Message-Id: <20261121214105.32596-1-gianfranco.mariotti94@gmail.com>
X-Mailer: git-send-email 2.34.1
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

This series fixes the underlying PHY lane setup, DPCD link-rate caching,
SST training-pattern handover, link maintenance BPC restoration, and
HPD / runtime-PM state tracking issues:

1. Configure PHY voltage swing and pre-emphasis across all active lanes
   in msm_dp_ctrl_set_vx_px() instead of only lane 0.
2. Reset cached link_info->rate and link_info->use_rate_set in
   msm_dp_panel_read_dpcd() so re-plugging a different sink does not
   skip drm_dp_max_link_rate().
3. Avoid redundant back-to-back link training in
   msm_dp_display_prepare_link() and keep DP_TRAINING_PATTERN_SET active
   until msm_dp_ctrl_on_stream() is ready to switch REG_DP_STATE_CTRL to
   DP_STATE_CTRL_SEND_VIDEO.
4. Reinitialize ctrl->video_comp and restore source BPC/format
   parameters in msm_dp_ctrl_link_maintenance().
5. Dispatch DP_DP_IRQ_HPD_INT_MASK to msm_dp_irq_hpd_handle() instead of
   misrouting expired 0.5-1.0 ms short pulses to msm_dp_hpd_plug_handle()
   (kept separate as it can be dropped once Dmitry Baryshkov's and
   Yongxing Mou's in-flight DRM_CONNECTOR_DP_IRQ_HPD series land).
6. Use asynchronous pm_runtime_put() on HPD unplug/notify paths called
   from msm_dp_display_irq_thread() to avoid a synchronous disable_irq()
   self-deadlock in msm_dp_pm_runtime_suspend().
7. Keep dp->plugged, dp->link->sink_count, AUX transfer enablement, and
   PHY teardown consistent across plug, detect, unplug, and unprepare.

Testing:
Hardware-tested across cold boot, unplug/re-plug, monitor swap, and
IRQ_HPD link-retrain cycles on a QCS8275 (Monaco) SMARC board (SECO F86)
with a native DisplayPort connector running v6.18 + the FROMLIST DP
HPD/MST series (Qualcomm Linux / QLI 2.0), then forward-ported and
build-tested against msm-next.

Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>

Gianfranco Mariotti (7):
  drm/msm/dp: configure voltage swing and pre-emphasis for all active
    lanes
  drm/msm/dp: reset cached link rate before reading DPCD capabilities
  drm/msm/dp: keep training pattern active until stream video is ready
  drm/msm/dp: restore source params and reinit video_comp on link
    maintenance
  drm/msm/dp: dispatch native IRQ_HPD directly to
    msm_dp_irq_hpd_handle()
  drm/msm/dp: avoid synchronous runtime PM put from HPD IRQ thread
  drm/msm/dp: fix HPD plugged and sink_count state tracking across
    hotplug

 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 23 ++++++++----
 drivers/gpu/drm/msm/dp/dp_display.c | 55 ++++++++++++++++-------------
 drivers/gpu/drm/msm/dp/dp_panel.c   |  2 ++
 3 files changed, 48 insertions(+), 32 deletions(-)


base-commit: d024361c631b3f020a26c07d683e5103404b0fbf
-- 
2.25.1

