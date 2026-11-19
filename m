Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107847;
	b=zmFHLaFhIQBjjJWttnCaq/GanMg6VvqT2sJf2O+YnJ2xtoXT6wePyLT0KG3P5wQz16ap
	 uaIyq7WwaDh3UZBg8Ayv9SXnR5YQJwlW7z548sKkbYY4j8OiYTHAoJ2jccla2PrWrwYlG
	 4XOC6Jt1j4ltUIFDDGJ4d5plGDeOOAfGeyoDOTGfDStnlwUXFDqxG8SPE1y5D7xH8TF28
	 TM2jTrFJp/HvXdhPO8OmapD8NLPPLoKMpWKhpY0RKH/WqRajLD/Mqv2/3hY65JMAhVZEf
	 NQ1dwVyVmqF5IPPbTdt67fcX/bs4sIdV9tfo1suy72EYIoAWwrNUOb71i4IKWzy9m7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107847;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=gP2dFp+nPAltPmlpy+sjF+Wz7tzVFG9r5/IcbCuHryM=;
	b=LoX0zS81YMacRrbblg1IkEN0MvZei8j3Y7UC+1Cu1QP2Nil6DTQ7k0PdpjCaFLPqyYoC
	 p4EQ/BDK9rqUkfN3Ssxh06U1nwnUORxc57y6nuk0I6hBnDpJgO30/qf+FNwz0nuF5oTOs
	 iETYXkHx38Ghb+RUbglWOe1QYKESIDtgF5xOwXZewBOQKuaFV+tcD7k57YFZn3fZ3Nz0R
	 /VxTijJpHM1K00lN4oMqNDTTqWzmJd23PbWa7NVP0LnvUnaUJ9D4xDY79qx5t2zkJzMuV
	 7/u0iQEhCREY7acfW2qvxZ6+OOg+vz/FTRUdk6sUe0Nl+CIALzSSz8hVeiSHGaiWlaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="hg/oRWK+";
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C926606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C926606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hg/oRWK+
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-383f2d05c73so3871358eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107846; x=1795712646; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gP2dFp+nPAltPmlpy+sjF+Wz7tzVFG9r5/IcbCuHryM=;
        b=hg/oRWK+4q6Im2Yeq49z5S3OMj5Uokk7fMh1fdnS/ESW5TA8B1TAHw2ZrxltLQdqrQ
         Wz54vGRoShSF9sqL3PTVKefW6gBu+DTQze7MslCCH/Ur4lXaqseSGaUEvdobGbXOIphv
         LgmobpJ1Ld6z63yfr0l/ejoRUmydBz1pJkfSUhq8B5radHs0p4xVDi+jMof8KqX/NwKa
         O5QVBEV6jp4282nIsO5QfCBNjiz+ANkife43v+xfX5Hdv6JrFRE7cSxlQWhGjODbqJ1T
         zhONzD2CMKGw8cSCs/E0Ogir7Jqh0PVKRUBwAUca6RLUYBHvZSnR6BDfzTGReGNHdgtM
         yZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107846; x=1795712646;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gP2dFp+nPAltPmlpy+sjF+Wz7tzVFG9r5/IcbCuHryM=;
        b=j4WHkYZK7xbp7Phf+y4psOd4fDr0mgELMQcblKnhvxdISWDPx++Hs2YkQGTtZYghbo
         eewuPOsECFmVQaWpe+W49Tj6H0z7T+c/ySPQ5ZY26/cg14Lo3FUQzTrijISYh3816RGn
         MMwzbKQiZYg0vBJO6sGpMy5pyuE91N1k5WgJZQB3u9/3UGTY8hbvwpNOaPqxdEcCVT+J
         oFIsCgQ6v3OdQDgLrd3HsB16EMaXf17TB5CsOpE0AwKG5CaFKBVZUZikcZ7jx6j3i8G5
         2H4jlrB20DvcVImkK6xuh8LV5C1t3MwlvR23SWx7Bf3xuUD1PMWuKHUfLMmI/yiqSxsG
         /pDA==
X-Forwarded-Encrypted: i=1; AL+hErEm3/9BMlyPTXO3VFqeYtWsKtsicu2Zr+qJVR3gIVtmOhVKd9bxyOFI+dxm3xrH6CpVZOVWeskClHuS/tk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tB46xhvkNTfL1kFtZVEuwHGMsu1zlZsAJcKGRzxnDb7mYnp5p
	TBFN07/OkciM8iqe9Gr+URznKakBdB8AuuCobSNZ2uz5WX0M/SxTvA0Y2ExpnPO5omnUj3utGCv
	37o6ErKt7eg==
X-Received: from dlbur4.prod.google.com ([2002:a05:7022:ea44:b0:1a0:8cef:34d5])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:2649:b0:194:9e7a:3ba2
 with SMTP id a92af1059eb24-1b5567f682amr277048c88.2.1795107845817; Thu, 19
 Nov 2026 09:04:05 -0800 (PST)
Date: Thu, 19 Nov 2026 09:03:57 -0800
In-Reply-To: <cover.1795106937.git.irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <cover.1795106937.git.irogers@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <f0db7ca640d19d1021b4031b08be426532425095.1795106937.git.irogers@google.com>
Subject: [PATCH 1/2] drm/nouveau: Handle NVIF_CONN_TV and fix error cleanup in nouveau_connector_create()
From: Ian Rogers <irogers@google.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In nouveau_connector_create(), the switch translating nvif connector
types (nv_connector->conn.info.type) to DCB connector types omits
NVIF_CONN_TV, even though nvkm_uconn_new() maps DCB TV connectors to
NVIF_CONN_V0_TV -> NVIF_CONN_TV and the rest of nouveau_connector.c
handles DCB_CONNECTOR_TV_0.

Furthermore, the default branch returns NULL without destroying
nv_connector->conn or freeing nv_connector, whereas both callers
(nv50_display_create() and nv04_display_create()) check only
IS_ERR(connector) and immediately dereference connector on NULL.

Map NVIF_CONN_TV to DCB_CONNECTOR_TV_0, and clean up nv_connector->conn
and nv_connector before returning ERR_PTR(-EINVAL) in the default
branch.

Found by enabling Clang's -Wswitch-enum on an x86_64 allyesconfig build,
with AI coding assistant help to audit the warning and prepare the fix.
Build-tested with Clang; not runtime-tested on NVIDIA GPU hardware.

Fixes: 8b7d92cad953 ("drm/nouveau/kms/nv50-: create connectors based on nvkm info")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index cc3caf8de64b..51580824df36 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1394,6 +1394,9 @@ nouveau_connector_create(struct drm_device *dev, int index)
 
 		switch (nv_connector->conn.info.type) {
 		case NVIF_CONN_VGA      : type = DCB_CONNECTOR_VGA; break;
+		case NVIF_CONN_TV:
+			type = DCB_CONNECTOR_TV_0;
+			break;
 		case NVIF_CONN_DVI_I    : type = DCB_CONNECTOR_DVI_I; break;
 		case NVIF_CONN_DVI_D    : type = DCB_CONNECTOR_DVI_D; break;
 		case NVIF_CONN_LVDS     : type = DCB_CONNECTOR_LVDS; break;
@@ -1403,7 +1406,9 @@ nouveau_connector_create(struct drm_device *dev, int index)
 		case NVIF_CONN_HDMI     : type = DCB_CONNECTOR_HDMI_0; break;
 		default:
 			WARN_ON(1);
-			return NULL;
+			nvif_conn_dtor(&nv_connector->conn);
+			kfree(nv_connector);
+			return ERR_PTR(-EINVAL);
 		}
 
 		nv_connector->type = type;
-- 
2.56.1.708.g77570a6a1d-goog

