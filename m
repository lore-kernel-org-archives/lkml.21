Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107851;
	b=Z7yh0481veQJK6xd3zyMP1Jv4THfpkdqVYX196LyRB8npWUDdxoR/Bg/+71aa5AKjx12
	 tuNXMS0ag++Z67viP/Yi7WFOVylLKXwC3/kzhHp4fW5zqTNwI+cRzQwcEdyoA7Dq3mt/W
	 5NeEYzFU1Mflylmb2hwAf3tDHsAv+kKRe9o4qVBU1v0FcnFvO17zVtIyCw9PTqzAlEtyt
	 NBgkuDwTuuLcD1uvDCz38CAeqeEPVc3yLeRspRVCdFmn6qlXtOIoyZKWejLjFNem9BBXf
	 fAkCALsjTm96KleeIWiZ0mWfqAgrZlJaxAWpT2xeIQp5mBh90js/0deLCjiR1SPLZhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107851;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=WHGlKM/TYaoTSSlrFQblz+QKKasbM+5dQbEhB2u9x0w=;
	b=kh39rysClcyfUCrl9dXuP9QnhCQwwVBdJILHlTIv4Gb+9uG9M676Oh+XTpLusg2C1loO
	 j1f3vES+ZEWqAjHIt6OUu8ovu0MtzHXz3lP3aQPUlYHOyeHl2YETm0BuSoQ8YLhtB+bt3
	 TipqwljTJIUsMK76vHMhliUU4Sby7FdwhXE1MgvmA4VminFluyDTVNRkyOoTYdqQomUaQ
	 zTUEkuLHBKBfGu7l6M6O2JVTiVBpG/MDqvg5ocnxqbTAioj5XgD2t95jf5k33l4iLDRCc
	 JmmYRP+dR8ApzL8lpnhroiMwSuIf0eaQvTX1FbT28wTPsQItxGdUM0By3SMVUn5eYAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="m83L/3It";
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F47E606A334
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:04:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F47E606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=m83L/3It
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b597558c4cso30591b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107850; x=1795712650; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WHGlKM/TYaoTSSlrFQblz+QKKasbM+5dQbEhB2u9x0w=;
        b=m83L/3ItJAiwa1zy1ZiMeJ4lm20ge88yRWqX4oBJT2dlcBS24L9HEkdB/XQDWlMUdl
         5tYt4HY3w+Sw8XZywQmtLYlle5v4zD5niTcnAhjps4CmUp7807bLpHmqzA/9WdwWo7eT
         aBCd20ddKL23x46NFkvs+nBP4LHHRdMi5WDUPC9AeSgms/g9r80dt3w4jhGgv8DG/eQU
         cCQDsOXj4E5asnfCq4OvPPKqHAH3UdepYxx4ST8CLPjpnJJNi63hKOIg+JFm3BPH6Ut5
         ZuPkjuJV5g19NFn+VzlYRVf91IuPxVHUOrmDv86ZIqeaFfU6xlYN8qe4HdhT2LkCRL79
         ioPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107850; x=1795712650;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WHGlKM/TYaoTSSlrFQblz+QKKasbM+5dQbEhB2u9x0w=;
        b=G3qBW1bushfFESbhEUw8t403JjifmXIONgfeuoXsLwtudYMmUhUxaymXOz+67TsM4/
         axMqtjtobbuEk0bCwGDyEqibuTVBD4/gB/hoETMU6X7lH5Zr9sVKftdk8L/c9htEGw9z
         K6qj7uD8y64mV2DJAiiAp0qDk33Rp6KWDHPQs0s8vo2eF7iPOzdZe2KrQHj3Fcf/lDpb
         TvW3Zym7/guxsCCWVGPybF0sckFxP6tB2AJwt9PAVBL1A7egRt0b2iJTNWtdsHjG/G3H
         dHj8oPC+xNxWILo4Mv4cumo1kiupmzpTXFCTx3N97tJEWxcC9gsXZwqhkOJdBmWzBMNc
         3GVw==
X-Forwarded-Encrypted: i=1; AL+hErElZosQi7G3e0Z/6ARzc7c452KquEiWu4n7m61mBXo5H9IsVMjnQlgfq1lbZDhaf1DsHI6/JMcBTofUYsk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oAbu3G3dTiDTJ6X/HYtIJOgLE02mk6C63memM/L2rKBC2R07G
	qujjn4S8qDaWWJLuURY8Xz3v5rEKH8I8F/HPDWxShhZ+R3pZ1c/Txdx7FQWUgHpprYNEU+A4D/o
	3Xh8N4lId0A==
X-Received: from ilbdx25-n2.prod.google.com ([2002:a05:6e02:4219:20b0:51a:af50:87cd])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:23c2:b0:53c:8f0e:ee3e
 with SMTP id 5614622812f47-57a0b34690bmr545790b6e.36.1795107849735; Thu, 19
 Nov 2026 09:04:09 -0800 (PST)
Date: Thu, 19 Nov 2026 09:03:58 -0800
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
Message-ID: <8b8db80fa775d701fc94bf9e4aa4b0cc577febf3.1795106937.git.irogers@google.com>
Subject: [PATCH 2/2] drm/nouveau/kms: Initialize primary_crc for RG CRC
 capture on GB20x
From: Ian Rogers <irogers@google.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In crcca7d_set_src(), selecting the "rg" CRC source passes
NV50_CRC_SOURCE_TYPE_RG, hitting the default case without initializing
primary_crc before packing it into HEAD_SET_CRC_CONTROL's PRIMARY_CRC
field.

Initialize primary_crc to NVCA7D_HEAD_SET_CRC_CONTROL_PRIMARY_CRC_NONE
in the default branch, matching crcc37d_set_src() where RG CRC capture
leaves PRIMARY_CRC set to NONE.

Found via Clang -Wconditional-uninitialized on an x86_64 allyesconfig
build. Verified by building drivers/gpu/drm/nouveau/dispnv50/crcca7d.o
with LLVM=1 W=1 (-Werror) and -Wconditional-uninitialized; not
runtime-tested on NVIDIA Blackwell (GB20x) hardware.

Fixes: 6cc6e08d4542 ("drm/nouveau/kms: add support for GB20x")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/gpu/drm/nouveau/dispnv50/crcca7d.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/crcca7d.c b/drivers/gpu/drm/nouveau/dispnv50/crcca7d.c
index 912f59aebe87..02db81e5c8a3 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crcca7d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/crcca7d.c
@@ -65,6 +65,7 @@ crcca7d_set_src(struct nv50_head *head, int or, enum nv50_crc_source_type source
 		primary_crc = NVCA7D_HEAD_SET_CRC_CONTROL_PRIMARY_CRC_SF;
 		break;
 	default:
+		primary_crc = NVCA7D_HEAD_SET_CRC_CONTROL_PRIMARY_CRC_NONE;
 		break;
 	}
 
-- 
2.56.1.708.g77570a6a1d-goog

