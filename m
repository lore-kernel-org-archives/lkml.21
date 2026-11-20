Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795144763;
	b=g1VTRg5XLm8PVdHtAKJXSka1WCt7Z4I4mtpbfvy/VJM2FImXAQjmakCqTjYJSB6eu3eM
	 pI+ehl5f/IGdH59cKXI98mD+Sl3NOb5s07RR46hUBmSO437nv6cEfIWP+sAOo2bgKHsGP
	 XPkWZAqmGdEtJU/sF7pRSsIPd96IAhi7OKAKSA0xGbfWvVet3ouxWFbHSo4zRE4+Gos01
	 cUiTwJselslbfWRBb65+sMFmZcqXDuJc2IAkRFG4wRmHsxi5ustuOXHhrBm/spxr/ihQk
	 QBzvvvXivLDo1Drvxgeo8dJMbT+Jj5v0pjKAxPD+oLLeZ965rRtS7l0mnIzbfyzDsrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795144763;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=e3wD7sDYHdJ5IM8Gjq16wv20BB8zD8yiMJqTnDWRVYE=;
	b=41CP1Z2Ov0wf037u4v/t3FSiMIpo+sOY+WLddsGXSD8C5XHx00R+A6WGxjZkb5Ww+t1W
	 ePwa1sKHAVJZBH0nMw8iSqtYD0e7BN8HSn/uhxBft0ymzUQJy8HZEsNqpLDOi6Wj/eFbL
	 yeCtDgDeccOzjosNF7iC2wM0nJHHubiTFhLYyon+sDMC7NzNjMKqkutV7/SN/2BDQiRKP
	 Cjy2aLZjfZStxV1tWALDOoq1vn8Fuyfos77K66JDLBJx7jG6B/Hd+mdaochUfrkeZsRqT
	 zb+1UCuDCT89QMQQJDw7UNiay1zSIERT6LxKwBgO97ODQvjCyGtb9GEbA75HjbyBlbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mnmbKZuv;
	arc=none smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A0E606A33E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0A0E606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mnmbKZuv
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-55c35262674so3649961cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795144760; x=1795749560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e3wD7sDYHdJ5IM8Gjq16wv20BB8zD8yiMJqTnDWRVYE=;
        b=mnmbKZuvbaSDF4AJaAGvlABavcIpMaKbaLieCUHR0QHoNFlswQdZ9RbiN+ha9eWuog
         C06SKqhbmt73brhKvWcWx2biPEbOvG8K8IZqRdnJRr2Ifa96K8XD2M8Yahfv0VhvPLZa
         hVUosvccytzo3xNm0rE395JCCfWx2Sf7LA0mDf7q3p3BhrbMDhQFuVGvLlP2aoAAUKjd
         l0KNUP6g3TZEw4suxjL35U2Jf2jZsYIwZe/yRQPrQgCP+0dJMc8xILtmJ2evv73Bnf+Q
         EVIRi16Hw6axMBU0yylF3LmoBRdE9q1Nb8DIJG6F2CdGZuhnFH2MJFjC80V3Igmg+mox
         lkuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795144760; x=1795749560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e3wD7sDYHdJ5IM8Gjq16wv20BB8zD8yiMJqTnDWRVYE=;
        b=nHfJtyCcyHO7WUUHTCyyjoTy4ARWsKT5ZxZ+TFgWrq+XEOUPh2blgTEh2BPxzZluyU
         d5ODj7mtQM75tj1y9SPwCn4gswGliaJZJbmNzUddGRDy56s224064NIdxVELoTxlP0MM
         zL/DUBy2GB2EsxUMIcVdGXXfqu9SSmCF4qfycwNsFxfa5KHWZ2EiU/LLzcQUlBWmljzA
         EJ+sPxV5FGW/Teps0pIOqlj/gJGfMWAzom8RAkIWm6vFp+WHwpDZEmhco4Tv9zfdpyJ1
         8zLV89SzBrh7V1hTjzBWmtmYJuMcDoVZG4ceYhZ72iCCgnnqLQGcGFzQilRmdT6oP/tI
         vJow==
X-Forwarded-Encrypted: i=1; AL+hErHQokF7Bnv+z5/Utz1xtvcTbQ3ppXGzsYb5avCuT3aSacNh8j37q2ngaz6qK0rKhnirOe6WS4uUNJNfHYc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tXHs0mksg0UT2BRtuLg1yHmp/uMHIXh8exC78zrAT9d41hfei
	a0EiW2fJOalo0ExKYH9oxTtscJKLDaAMggsXbJKr1P41Z2y+bu+5mrOi
X-Gm-Gg: AYBFou2nP80zTM7EaYGBYHTxYTR5/0EaaeyEIHaj2B2HXmJ9tkE+Yd+Vdhbsq+j58X4
	5K4d87+DzyKHirvCxx+Itgmzx+b1OVyaK9r7z9HQJRfdXoZ58u9U0wDz6+SL0z4ZF9hwr7GSkOO
	RrLguiQJHtnOTSy57t3Mvb1dEoCXaUb8YJxmh8V/Lpa5G9u3Agpeg6qo3XSp/or93N1erjZ0AdG
	KigFyIah7XA9C6KqRl9x7uObKryzlMFU7cHk2R1C3wNuKUCnoPEplEcOSbwyL4OHAguwerYG1TR
	fstq1wFMY9fP453L4hOYjitI7MS7cXbCamqyEYEOmg1aUKW66V8rYotILG37cFHe47BMy3kzLo/
	L/PQB9Xu9tbZFIDAukVK0CA+7C9m7xsgqA8eBK1D77cMhlDh9ASxi6QNb5roigrTkEfmXdH7+dR
	dpyPUzzIgWEzwuVX4vyfnOtfQD8xKFlbsEtFyHKE+ya1oKvHkdJXXgKkkgp/6V3xNksFLKtDM+s
	k2hnk6NNx+nMZ8Qj6xa2VaUjDryo2xUNCdOuqetb9Ix6g8Q4LQQtdSGoGVbiMeBUxAgOyaXtKD+
	gAaAmOSKWdSOgfyazc5MSBGfz+VgqRQEdn+WWAEiVDYuN1l5O4qPkvPU0PDHxfFM/XowYKSw38s
	=
X-Received: by 2002:a05:622a:5c1b:b0:55c:abad:a72c with SMTP id d75a77b69052e-55d76a6260dmr33689941cf.56.1795144760510;
        Thu, 19 Nov 2026 19:19:20 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349f6959sm14377356d6.31.2026.11.19.19.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:19:20 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Felix Kuehling <Felix.Kuehling@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
	David Yat Sin <david.yatsin@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH] drm/amdkfd: lock event_mutex while counting events for CRIU
Date: Thu, 19 Nov 2026 22:19:17 -0500
Message-ID: <20261120031917.1708024-1-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
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

criu_get_process_object_info() holds p->mutex while counting events
in p->event_idr. Event creation and destruction use p->event_mutex,
so the event IDR can change during the walk. If an event is removed,
the walk can access a freed IDR node.

Hold p->event_mutex while counting events.
kfd_criu_checkpoint_events() uses the same lock when walking the
event IDR. Event creation and destruction do not acquire p->mutex,
so taking p->event_mutex while holding p->mutex preserves the lock
order.

Fixes: 40e8a766a761 ("drm/amdkfd: CRIU checkpoint and restore events")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with a static analysis tool we are developing.

Compile-tested only, with x86_64_defconfig plus DRM_AMDGPU, HSA_AMD
and W=1.

 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 3d2136adb62b..20e3bbd073a5 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2234,7 +2234,9 @@ static int criu_get_process_object_info(struct kfd_process *p,
 	if (ret)
 		return ret;
 
+	mutex_lock(&p->event_mutex);
 	num_events = kfd_get_num_events(p);
+	mutex_unlock(&p->event_mutex);
 
 	svm_range_get_info(p, &num_svm_ranges, &svm_priv_data_size);
 

base-commit: 8dd68a79583aaf6df6fe4feea3ee9e9f26b02993
-- 
2.43.0

