Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795297284;
	b=5Jp1qt/VPbyQnFo0se03Kqt/I5j+3t9/2cbMGKOvIAnYEoPJsTDeWRTR8L8IFWjbNlwO
	 I+8xG+BNbWCjZugdvpapMfc9hMnargN039wBA+MKzHiXNZKmVG8AvoJ5DOTJUAVyLyVEs
	 T2++OOcEHwKFAReKe7vrbhIwmpVbZAktUzXSinRZClOS70+mei+AJ8r3NcPK2xFMjMWsm
	 d6YBs9hLequ/jJFgY297JajsxvrjftVwsZpzVYBOymox2oHwKQrFOZmkFe0yzFFH2LYtP
	 guRFvbDX0LkHQtUpth9nxo1RupH/j9G4GyjQp0dqpBbvxyfV4SuIoeD/DYCUGDfiq7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795297284;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9WEV8XPKYzcX6N6zxNpHeHidbIcy6IRaF/m/BkLvHTg=;
	b=wBAvzWtthz4busI8Lgoit6LWS4VKq+dG8KBOIrjI2GXkfcrY9NtGrA8qCq6K16hs/Xbr
	 m8BMYZ//zCdTb3+lZzzWDTX2rb/tPesj56Wda8dkOkaQVsTEN6WddY6PnaI0GqUDTgN81
	 JbA9S2Ncm3QjqHtZ9ogIqPFRJ+dITtSPuW/ZK+JQWITvdGwMxcs11Ko0hS4YJqhsMZk65
	 cZPMzadfms9AmB8hWG+6BvBDFJzB6M5U+nJcwdmL5Nkyt48+fQ9910kFMgvYbWp4gQcz2
	 hiAj5RaeqLN+rHBw339HnS5fSREasZ+IhSuNoJIzLjJylqGS1TEk3n9GcI6yhMI/2dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PBWc7NJo;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BC8606A337
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 21:41:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56BC8606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PBWc7NJo
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so17461675e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795297282; x=1795902082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9WEV8XPKYzcX6N6zxNpHeHidbIcy6IRaF/m/BkLvHTg=;
        b=PBWc7NJoNOTt1LQDytZkrYMrxkqq9vcBC+zkg2mVI8gLeipr4z6f9hYN9Xbd2GBKog
         gTJYa32Epq/sqvm5tM61PDNS6JHlETtmSvw3PbyQ1yHCtY4DLIokPnvpG7SKacDihra2
         iIYk8vJBFEzzvfFxc4yxBnkbseMp/kFth9eXySyiwbYVkOMUgbffkJIXLfKc9yQ9UWNI
         H3LdpDPu0R+9GrxmvOH7GmAZ/4uWf76udAVwECDnWT60WGIpJgnshF9bRoQLBPlD9BXQ
         5MSFCCf6F4dBpCmlP/1o1IFk6L62KEU0+Pmh9FAPPUPDuxLrKcsT3PfdHasoz0hl5uww
         oHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795297282; x=1795902082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9WEV8XPKYzcX6N6zxNpHeHidbIcy6IRaF/m/BkLvHTg=;
        b=M9i40pC2S93g9PEyru1To2SsDxlWdys/WeuJfQ9IRrLsywxqWmbhodiXoBPqTzNrCW
         yVtdwZGErTFQam+ZUIfu9AYKo6XuQZziHMK4dfrI2Qyjgfn1fY5WtvhcaPsOq/w2dHk2
         ZPxAjE52LM7PYE3sUgvee8vos8gjHKOQWrfULWg2hH3zIe5KPZJvhjmvvgv0Gco70TYb
         7o12BfWxy9hkBSTfssarBXNy8XyrTZ9gni/XCD3u9knLsESnpOrkyHkBeluyN4yMIOyH
         s95ew0HkOX6sz99sjbhdkUqXgrTV1be248Ciy1UIrfG3rxSvPCaJ+BKwJyAWpq+6xvGZ
         Bdcg==
X-Forwarded-Encrypted: i=1; AL+hErG+Dupc5lCMHNr7b9i8W5UN9MJP1AyNYI5ShQZq4Kf++X5dpVLTi7xTXUb5dURsmDOC3zOtml542p/iGyw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fhWfWZEvGoWr11J71vP8FGVCwAAaxHq5nR01KcziDgX2bG93g
	3vyuqQFbhdm6C2MGKvfzMiGGoQS/Rdta6g0TSZzuolnyS4SutZRSMc8=
X-Gm-Gg: AZFdTZeY6fsGBsFxFqX2Pku1pzC/YIrA1OHceMdt2lFZ+1ifm2R/nTuMcAsighwy9Qb
	GD4u3LzpCst2NH8DmfurUYM//X2lDKudB+RVnV+KFGRjyNEBA8xDdzXdh+3LMjAR4nIt9QmqIRH
	mdz18L/8SNt/vheP3v6abz5CKL4MByDJ7pshJatmXIeyMbsQl0qswjd+aS/jn8BLgLBmLP9mK0r
	5kL/DGNL27JejtlZBTMms8Wz5El5Lamz9iO6kJF2MS7l6NVJND1ztVEgDOEYWe96zLYUEzwRges
	YnqxBPBNon6N/BxApcNH6KekdMztXVMKB9Xllt+UBNIrdNgVRtc9WhhP0cjFJYDskV4AB+/m4QH
	VivGpd1OblFoWZchvozZUr8fOrD6WM9Vii2g7A2rAbITUr19K3Ke1y0g0YQSBIy0gJm2SRY0Kjj
	yzaMC2ivAPHSB0CP6m6dn6fV3daSSNOOy+whhRjaYOkOIFJV9B4oP2eXaSh2WDxeY0169XwDuT2
	1fSrBO120u/EUe6UQknT7CTtcIqiRtDDlCQacM0LnbhYoNxTNTyKqbErX3VAwV6tYsX5y4IEB0j
	c6BZg2sioqmcya7EFPQv+4ypfp54mxttfHn+0P1a
X-Received: by 2002:a05:600c:3e1a:b0:4bb:6814:7391 with SMTP id 5b1f17b1804b1-4bb8881921cmr147831055e9.25.1795297281740;
        Sat, 21 Nov 2026 13:41:21 -0800 (PST)
Received: from h7015t.. ([193.207.113.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067a0e6sm54580645e9.4.2026.11.21.13.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:41:21 -0800 (PST)
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
Subject: [PATCH 2/7] drm/msm/dp: reset cached link rate before reading DPCD capabilities
Date: Sat, 21 Nov 2026 22:41:00 +0100
Message-Id: <20261121214105.32596-3-gianfranco.mariotti94@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261121214105.32596-1-gianfranco.mariotti94@gmail.com>
References: <20261121214105.32596-1-gianfranco.mariotti94@gmail.com>
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

Commit ed100aa239be ("drm/msm/dp: Enable support for eDP v1.4+ link
rates table") guarded the drm_dp_max_link_rate() fallback in
msm_dp_panel_read_dpcd() behind if (!link_info->rate) so eDP v1.4+
SUPPORTED_LINK_RATES entries take precedence when present.

However, link_info is not cleared across hotplug cycles. Once a monitor
has been connected and link_info->rate is non-zero, unplugging it and
connecting a different DisplayPort sink skips the fallback and reuses
the stale link rate and use_rate_set flag from the previous sink.

Reset link_info->rate and link_info->use_rate_set before parsing DPCD
capabilities.

Fixes: ed100aa239be ("drm/msm/dp: Enable support for eDP v1.4+ link rates table")
Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_panel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index d3468b73fdc3..c22a2bc9b635 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -195,6 +195,8 @@ static int msm_dp_panel_read_dpcd(struct msm_dp_panel *msm_dp_panel)
 
 	msm_dp_panel->vsc_sdp_supported = drm_dp_vsc_sdp_supported(panel->aux, dpcd);
 	link_info = &msm_dp_panel->link_info;
+	link_info->rate = 0;
+	link_info->use_rate_set = false;
 	link_info->revision = dpcd[DP_DPCD_REV];
 	major = (link_info->revision >> 4) & 0x0f;
 	minor = link_info->revision & 0x0f;
-- 
2.25.1

