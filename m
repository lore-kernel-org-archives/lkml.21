Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774471;
	b=dur9nc1PPrU5yl8M0OeFZlgWuWVf6hamHpyV3eqwP3b9isdfRfk90c4oXuBCT+mPBRyv
	 532+BJkIvZm5vHUDMll03OcF+Sf4yOfApQDqZHSGhprLMXcyMmtryhWqbsCieNnuVBhfC
	 JnI9fOrv0t9+P9ocUIFVNwtJIyDxGnLavg5q6TgNAAVx9VfRV4c1Jgd5vtgkzDTzJoGkE
	 SBre1twYvvOsaUi6vZd1FBDiGTIpSEbNA/VKA51hCbdZyvsDRaOoMiFhL8JZOcTPhNWAY
	 P4vykZjItngl+pIOfnu6UHkgHBxy/fBF9kJ49Y6uFE1TEW4X7ag3N/DxO1Uc8qEE6lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fJUOBB8U95qqxwIcvt8j09z1Ro30l4rqtcLjgd7Ggo0=;
	b=VVE1Nw31w6ZQq3n0vXNg6yUA4rKpkgVm7jlzmyKrWwGdM3EffE9wkNV8728MNTfLwv40
	 +C+9/kOrkfxnHXK1fqD19uv/z03iT08RGUnk2t8SCZuCnV8OfDU9GB+loBigzPcD/rTrA
	 9Mrpt5GpT/5DUTVOAk3s3DDrEo1xHYhPiRi1co+Wh1vY+74/+0sWsRyxobFqgHO9tp6ud
	 egFYgDZVPg9DF/gOAFEdEt9q8hwM7jaWGTCWZjHKbNbf/1TQksxcUZWg2coyl7+nwUmsm
	 Pv/Al5YeMCiuR07zyL8v0CMX7gQC/A3rPkWavGLkCrToeHqPuVf4RRp3vcOewnof+6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IilvzkAv;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB1160A2631
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:14:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DB1160A2631
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IilvzkAv
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-49465892f7bso5790834f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774470; x=1796379270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fJUOBB8U95qqxwIcvt8j09z1Ro30l4rqtcLjgd7Ggo0=;
        b=IilvzkAvhsgBTt47BiBoKOVmYJyeVUxy9gzsDKiu2ouCFbKX//wImu0Jyc2yZbHSgh
         c+nRkWQuYL1Tn/NDbaEK02rYlIupV8qiXghduvAEktPuemjKPmVpXXP74XuJzeeDJWqT
         ci/0kUKykDQ4OXKYNhnFRmA8eMSc0e83geGIhODU3YndMO+7gQs0P3Y2JtdV5j2fnu3g
         g+V6g3UvzLbKavBBpPcE1Z8yEvbXz+0zXSvAr0SMaKpXzhw5I8+LApZZh53nVOKtk4nW
         uhkV3T82iBH8WqmrBX1w1olbOFSegsbv1waZdy2luMhlV60vMH9R7/9/9vUAQD99CBOh
         Hd3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774470; x=1796379270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fJUOBB8U95qqxwIcvt8j09z1Ro30l4rqtcLjgd7Ggo0=;
        b=AzTH2Fa0xC7AwaeH1dhsManXGu46Y2AZRclEMKEbNGHk8wNsVE5+Nz4Y7V2hXYIchy
         qN1K0V4rrxj+F9gM+5JG8XAwY6FXXQy3FM1HtuJwtzrxYtpMaCdc66E75NgCA+w8XDUk
         U8dKrUMlbGjlTHSDCjHVNadYdPtxf1FBqtFSDfmm4yF3UfUcThi8/IbJUvz3ovKAllvc
         0TFioH6JyHyoDPYUIgNq42UEd8IdefkiKvvQicZLUphLMzD5YxkntB4nmGgQ/Tc62ad+
         hhALmIQ1NIUPKgye/m/EZBP/w1DINYHXXrqAD2rYBr76XOKDdsCphvsuR9GJAZWJCV1U
         o2MA==
X-Forwarded-Encrypted: i=1; AL+hErEM0f50cRqRAM89Dvy4U6VkxDznrFOjLTYUZtJ5b+RqwpJD2SE10R+H9S2MLPU2sc/vxEI2VYH4tlJnVac=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JxJaOoNmrRKWtdjxBWg2Y8Ofpx3eI83B5hMuGDnTqJQmWJqZK
	AtJnTkuEqlhRpQPTG/t/DADF8IK7ZPkSr03XFYvf/LW9lfKrhsa4MS4=
X-Gm-Gg: AZFdTZdnfFkGysBKDeFL57zBWCFWvfEHDzP+DFdk+Z/t/B1FwWezEgf8bm5ZyoZhbop
	qGHtY+MxSWNn3Equs/jmrg7pm5dy9096xWUU2BL/S3p+sMH4ak+tytH06+wHtTrUYo1cY+FOk7b
	1f5lQtwKSuYQZuKE8zs7zQ++2NwDP43BNcJmFFIRlv9hVRLbPbPNS4MAGkm5OknnN/LaOV61KVD
	ba7nwUvdbxQ2LgY6AajbM6y0HDLhYMqfrNW1/Z1WStLNboT/lLqus6/5VdLRI/YMpLQOYJ/YeeG
	k2v2wFmivs4NTvy7VhwCzfatsCpIMqKVG2dF2rzbB+ZvbuSwW6yy5RQpCy+aV3iYBqC5ddZ/j+3
	qEQzHjwH1/Bf64Bk/epw8DkQJ1Z9QicT4avhPOX1BNpeHUWa8Ca4gHXwakfRR6+LVny3MyG0wFd
	2J7X2DrR2IdPSE05SH6LnFzMWuvsfESU6pMgig8i7Lcy7gyZoFtS3YZSCK364WlH8WK/S0tRClg
	VMuLQWNcf6Ls8ec/14RV6m3Cu9miQI0ZOtJB0A8EEWHHGENhqKk/VQfc0CPqYeYArmXZRymxk8w
	fzILYA4GF8TaL3TQTHEq/YDLBenb3EdjRvZu8bv/pvC3H9os2O7k4Ts016/1y0EFips0/26apd2
	l9foBJ2HpRfpSmXh3OfEPpf3hWnL14DzxVGKtZwVQTv28kTuLfgZf8g1C60R9rqOvkMeqVuz6Ye
	3Q3CH+Xw==
X-Received: by 2002:a05:6000:4812:b0:490:88e5:92d6 with SMTP id ffacd0b85a97d-4abb57f6e95mr45513944f8f.49.1795774469450;
        Fri, 27 Nov 2026 02:14:29 -0800 (PST)
Received: from localhost.localdomain (host-94-89-17-99.business.telecomitalia.it. [94.89.17.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm43651234f8f.26.2026.11.27.02.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:14:29 -0800 (PST)
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
Subject: [PATCH v2 05/10] drm/msm/dp: avoid synchronous runtime PM put from HPD IRQ thread
Date: Fri, 27 Nov 2026 11:14:12 +0100
Message-Id: <20261127101417.24303-6-gianfranco.mariotti94@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261127101417.24303-1-gianfranco.mariotti94@gmail.com>
References: <20261127101417.24303-1-gianfranco.mariotti94@gmail.com>
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

msm_dp_pm_runtime_suspend() calls disable_irq(dp->irq). When
msm_dp_hpd_unplug_handle() or msm_dp_bridge_hpd_notify() executes from
msm_dp_display_irq_thread() (i.e. inside dp->irq's own threaded IRQ
handler) and drops the last runtime PM reference via
pm_runtime_put_sync(), runtime suspend runs synchronously on the IRQ
thread and deadlocks in disable_irq(dp->irq) waiting for the currently
executing IRQ thread to finish.

Use asynchronous pm_runtime_put() in msm_dp_hpd_unplug_handle() and
msm_dp_bridge_hpd_notify().

Fixes: 3ea2d1c3d154 ("drm/msm/dp: turn link_ready into plugged")
Fixes: 5043357e75ba ("drm/msm/dp: rework HPD handling")
Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz> # x1p42100-lenovo-ideacentre-mini
Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index b8373740275b..3c15f984b29e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -495,7 +495,7 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 			dp->link->sink_count);
 
 	if (dp->plugged) {
-		pm_runtime_put_sync(&pdev->dev);
+		pm_runtime_put(&pdev->dev);
 		dp->plugged = false;
 	}
 
@@ -1627,5 +1627,5 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		msm_dp_hpd_unplug_handle(dp);
 	}
 
-	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
+	pm_runtime_put(&msm_dp_display->pdev->dev);
 }
-- 
2.25.1

