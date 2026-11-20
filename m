Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171240;
	b=oOIo4LdEI96w4Y9ljfuiVVaVgPW2tCr3VKfOHoEXPFsmOqzyp5XR4N4tcGXp67aYwiBV
	 xPoDXNykGZs4xOVTD3COGTNEmihPMIvE3qKKJI8d0mTbkqn6xhda5q2129CcaB5KEdkxO
	 5BiZbuGm1MSGw2Cmqyo80gM8+RcVGHxDrzqf6iy59JMHIZLFHj1WJsPAdZSg++0BPt+/9
	 Vqt/mY6ZBVyhsLGHvIQYSbR1CXxjDJh551wYYFWkDrRB8xuIdgbO+fqHnypycmowcR4H8
	 8AQmuubSA1efVXF0/QQl+h0mWXt3WMfDwYK71DGpx3WQLWkFr76Cr20KeLuSN6Hmm6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=TRKhJSg7Qs8Ga98wRztXXntzgWjghW1WGjO9rfgcgBM=;
	b=CJdrWk7vur/4AC9P07pYD3zogNXgOBZ5t7v7rmu6Vxhh/x3gF6ijN0M9ZmOx6C6kGjEP
	 g7t0qfJU6xwdUFHrH8vCjYNHGwUMRvQVv5d82E9gcgfp20QWeFv+k7lJjsb4idQ58DOhW
	 SjwJlgInvkGUgzDxMXcviofCAZO2ppanAoSox8z6Y14D9/y8sQl6gGGcJNO5BIvyt14tP
	 1nht/r+1gIWAOmwC8pvJn6/frNcJ/wdaKRmxbRUTv7g5DwPnZcaYk0Q7qRN1orpf4HlMz
	 AG3l6RZn9U/Et2xI5y674q7KrutPyP+WwA3ePeP6JFCKsNG7ACQFjNzwYkS6WsXhR2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mqN2fx0V;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD5560A2603
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:40:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BD5560A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mqN2fx0V
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so5485505e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795171238; x=1795776038; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TRKhJSg7Qs8Ga98wRztXXntzgWjghW1WGjO9rfgcgBM=;
        b=mqN2fx0VCUpxrok2PFPfzDSH+rX9eIfL2VitOGZuLr6V4fYgMTKPr24+6dyG7+8J64
         6Wjf0IE6QqSxkKVOKIT4QTPPQE+ue94g1WLw4xDilzxvIdxW/3gjyawnKybWsc1tRpUE
         FMdOt6S6QvLuiKsMx6TxToCppHrgNngcj6l8GAPcy+ji/4hrjH5uayVAlb3iG6nb6KMM
         RKCr5XEaPQRg7cio5mUOyRbFsiwS2/9yjmajBBEZLVC7QG48dWcSvFyOfwNwF7KGIrl9
         9FnovsXP6BopW8wE93eZ+wGjM/k9dMIVZl/pQyBRTQZrAn/fxitazDpRthN5cMPUCgTJ
         4a2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171238; x=1795776038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TRKhJSg7Qs8Ga98wRztXXntzgWjghW1WGjO9rfgcgBM=;
        b=kynfKmGYU/f5Q1b0bG3CvQNTObYPFy2w9Bx350l8PXdrRP+8ausOeIwhxfCAfdqkZ9
         JU0BpF94D7jDIDA43rP0tjiiWfxGvAqHtXf5pJ+haYtWc4lEZGtlydY2pQiDG0gXTxRV
         2Rm9219nmzcP8v2A53XPPcmuoaiQuGdEC/+26BNu1STOuXGI0K06JpMnI9Y3i067kbfQ
         4jE+VXfpupw8hXN/ahr1GpNEN58nw92VMwBJ6X6362XR1qYhD1Cf9C1+3Skgyi5aIqmy
         ZLUGpUZm+OTYMxg0ZMCxSqGKBAR7PeUjhHHfXWomqCSCkHkmRvoaEbp0W4cHUmJ3GNFN
         mlfg==
X-Forwarded-Encrypted: i=1; AL+hErHuCS6m+eOFHUKZE7HvnMNQdCeXBWxfKBE1JbMwfyfVLISEHJK1TJckTBTwiuXVlx1shKeLduoQeMe0j+8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Em/SZQGjEEhxgN4SSEPnp+wZHrBrqoABQFiVzihBwPZeIuTVE
	WpO4L6SbTZulgHGDu9CL9CN3ztGs51W46V3ryNTtwNqn8KonOn0YkRln
X-Gm-Gg: AYBFou2t8t146odInnTTf5btlP7tIgBuadNzrheYzO2I+nWo0O+OsfT179ssK4lMSh/
	5ywfBY6S6b4WFr9fRcGQZYUdgTwW6OLhcIirUgCEFwACOWMFSeJNP22lEaJ4a1xiNBUvbhuUW64
	N9iLjGXNsKC0XJvxUS/zwmDQhuc2w3oZXSp8Tcqv2qy6fpxzhX4a2PV6TRTXUo+R7NzrXtNIowG
	e0yBPsrVCz4u1Yg4LPklkTI4E/pLafJ5zgkpgcuIW2rSDf0kFfNUkLRkdLlzbsJr4tixKBE51cM
	2LpQLbBsrzQwMf4gSn0EGPcCgQxYyBR+1EJivTbTs6iZBk0gUqWn+uCK8CZJx6R3mNCwG8SHO5j
	khp2XQerhaG8zYuKJ+3DOKtKoL0IUZ8sk+C1hKg4E2jnVsOFW5PpPmQO/PCvQsDfohfyDsUo01u
	1PfQbQAjQnk2dAcrGSm5O/VPN60/6Bj5JU+TFxtF8fMM25w87PU8JmgzfhyknMQq7bd0Q+OeBxQ
	L7RWcot53D6kPDlJB8uIU7lurYVGDtJGoIBrXGbElaoPgfRovwFmWOe4zlmU+jWqSltSv0tIZnj
	JVm/R9TKFIPONsYRJs40roXjd6ZAS8dPJISfR8cTRzmdi65Ur6wv63oeCsKtfrtnsnmwU1oCkwv
	0GqSBqsjrWrtqkDIutJcnygBPUDSLIBgUxxqlX84p4R+F3dw0flICT28a5vwXd+3YQFYwwNbU
X-Received: by 2002:a05:600c:5395:b0:4a3:5a98:c279 with SMTP id 5b1f17b1804b1-4bb8880e599mr55432805e9.8.1795171238555;
        Fri, 20 Nov 2026 02:40:38 -0800 (PST)
Received: from localhost.localdomain (80-108-121-211.cable.dynamic.surfer.at. [80.108.121.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895eec06sm22297535e9.2.2026.11.20.02.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:40:37 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Fri, 20 Nov 2026 11:40:29 +0100
Subject: [PATCH 3/7] drm/etnaviv: Skip cooling requests that keep the clock
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-etnaviv-gpu-freq-trace-v1-3-445fc6eacddf@igalia.com>
References: <20261120-etnaviv-gpu-freq-trace-v1-0-445fc6eacddf@igalia.com>
In-Reply-To: <20261120-etnaviv-gpu-freq-trace-v1-0-445fc6eacddf@igalia.com>
To: Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: kernel-dev@igalia.com, etnaviv@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Christian Gmeiner <cgmeiner@igalia.com>
X-Mailer: b4 0.14.3

From: Christian Gmeiner <cgmeiner@igalia.com>

The thermal core does not compare a new cooling state with the current
one. The fair_share governor sets the state on every zone update, and
the step_wise and bang_bang governors and sysfs can repeat a state as
well. Return early in this case instead of programming the same clock
again.

Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 2a56bdf2510a..0a28e21feb8b 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1786,6 +1786,11 @@ etnaviv_gpu_cooling_set_cur_state(struct thermal_cooling_device *cdev,
 	struct etnaviv_gpu *gpu = cdev->devdata;
 
 	mutex_lock(&gpu->lock);
+	if (state == gpu->freq_scale) {
+		mutex_unlock(&gpu->lock);
+		return 0;
+	}
+
 	gpu->freq_scale = state;
 	if (!pm_runtime_suspended(gpu->dev))
 		etnaviv_gpu_update_clock(gpu);

-- 
2.56.0

