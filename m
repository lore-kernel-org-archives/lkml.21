Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795215585;
	b=cZr5ZWGQH7lzj8nNfncbdqnV98qrFKIPzmkz4alCp2+oN6QBdJYoBfGyBFoN/Yi0K8Z9
	 jlrUTPKtPU60XkFTbNOwpwHWhphtG/CTZ0YXVek53Gi/EyjFKn3ASkoJRA4Cct+xzX55V
	 t0J1xWIr09adjFFIoqZgfkZ89AMPG4PgVxWycXeOblQDcmYPBID6AsVTyVihQJaHGsjCw
	 YutqQjxj9KzGDJhg7y6AMvXOVQ9SWmi+9NvpgoUEPfZ9q6Wtd5/5Nw6k7qOzHRUzWuT3y
	 37SQuGgIenPm2HNOMnJGrigHxIfFZwJ3G5PMd0jjGJz1vw+AZ3i6dDl/bfTFcjT+HSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795215585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=YPDsvFkr4i8FkAzmO1aMvRKcZ2VOzq57ruv3ddaJg+E=;
	b=gVoHf1j59zPNHuEhhzsCS4SjEZWu0VfG+wA+72IqkoSXWLGX63kWjbFBbmefO/YDwTD8
	 BkYVo+muWKdglo4FOBTzCLHSbZ9LeAE7JatSUNgc19MbFRvn8R1gdvNIlos+mntHFkC80
	 TxVxUMSyd+bbjWTdfeuYzIwhRfcph9pRZM6wq6ZBBsZRqph+8cb/RFHlpblNQUslca3hw
	 1o1D1c97CZc4D/HLcOUJx51lP8gxXRERf1mpU5CCDkUPhEW3dLc6pI901XGStsdvRmuCl
	 A1vQAGEjDBlduIkYFHn9V4jhMvU2x0rIbt8ECIBJ3zGzoQRf+lFz3Sc3MpNMvIWgLzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Q/CunrUC";
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3519606A6AA
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 22:59:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3519606A6AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q/CunrUC
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso981603f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795215583; x=1795820383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YPDsvFkr4i8FkAzmO1aMvRKcZ2VOzq57ruv3ddaJg+E=;
        b=Q/CunrUCCCYy0T/k7VAhBD+gvhvoI6xzmbTMZXnbbhVp5ChLwSQfU2l7Wz0KBndhln
         dWXqyuwyBILR2yxInR0MFYB/i7IwSYkVJBiAKVcJhRmUJ+Sqj3AIxWLjsfw0QiZolztd
         +Jeu7N0slmqGNw0/xosPOIqYKKloP9tzBRmidT9jJoKtUvJYcaWKHM8vavk599QYsGjO
         fj/GbtPfq4Dg8FefkuAuM1vu0MPE5amntWtjqWcLWto8vqmnVaRn19zpLfuF8m4uQqgt
         7SagGCceJ7UTZvlhsfxATzJrSzgfltOtUM4yT8Mtd11p110Hneho5GPUP3RK3m5WMDYk
         r0Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795215583; x=1795820383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YPDsvFkr4i8FkAzmO1aMvRKcZ2VOzq57ruv3ddaJg+E=;
        b=MX+26myAiEjzjMcbk06FJrw+6ens4LZQnaT1pHw/6FTapEoFVNUR8z/R8S0/dD6Xue
         Zgw+iQ1zIe39v1U0FHvIDcpzVK+iULKD0NmVYHm+oAE+a0yYAbBbCri18L03IzR0KsaC
         eQPo3qlNZbqXNlHU4P7ZDEe6TDerodmNViX3YHsgFsoBl1kcPQE0GE5HKoLlsKjO8lka
         fBfpiyr89WlWQKXVGdcdsKbKkXsoOaAtqPowqjc83XHiQVQNTwgNtzJGHcWvsVpeyRfs
         7Mqdsjo30fiL/zFX7S2xi7hv0MDYLKqUTnKmqtALe87O7fV+FcwUrZNw6TYQqrNEd+Py
         hQBQ==
X-Forwarded-Encrypted: i=1; AL+hErFsNlhTzW9RnGYV4uUyLCZnrSYEX9BLww77595ZyThxFyB+ykn1dbyo2QjEQFyGX3R7D+3qMrPu6flFekU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fvSK3FGO4s6DU9wMm5bcx/1Bl2Jk0GtqFkcxKkOKhYMFRc4LG
	NE2I3T2VhlfbmDJ3Zq9ALlxzJXC5aAetOYkRa7S2zyyuPf74QkycSF2t4vwO
X-Gm-Gg: AYBFou2kQ3aSASJOlb6tcDoTfh6BqGXcVNojExa3OOxqjfowa+AoUIqzZLsUyZJ6WA2
	SoRBEGLEX8DneOuwTmWesPgOa2s1MJvAC6vRIvu19Z5pEyXQxtb6i7gh7lvfsHTMq6hgogSAXx+
	isfH59Ni7LJAV3Ooyhd8Svg7sj8jz/8zaNZARA1H1qCJzkHwkYAVam/STuEBEuqtDbeMGGx7ucs
	O9MMMukJZhyTt1ZL/rf6iGShJm5/uEH1MtyPe228G2Y/vPEcMCGQUyEVd1hXpIOL7/v7IKiOsvn
	XtTczEzN+qCDWn/S+kfkL49Ky+qvoUZCLoNH91FvG3d3Pw2xNb4e6hBQjCqtnkNYRiYAtGDe6BC
	6JmS2BJSlGKIFBcfGfHYzBS7Zx1pkLdnQ+HGxAh+RCCbrHAlic1itk4B2XyeoiVXbfFM81faLsC
	lvYLAnLseC1ueqwlU9qXrMEpcmZlLCmLLQz2SwwlSaGJdycSHck7jWL57qFAQJFX97KMpMKSqgL
	mplAadpyiUUwCrXarxOmheSdtZnU0MYVlRgC+T0LLilFTxdomkKhfBAY22dYlFRTQPfBWLppL+W
	FKf6gDF5sqJq4F/ddkSWssay7NxJ
X-Received: by 2002:a05:600c:37c6:b0:4bb:7033:c938 with SMTP id 5b1f17b1804b1-4bb888147b7mr102309785e9.14.1795215583026;
        Fri, 20 Nov 2026 14:59:43 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442995sm128863475e9.2.2026.11.20.14.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 14:59:42 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Jeff Chen <jeff.chen_1@nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v2 wireless 1/2] wifi: nxpwifi: validate ext_scan buf_size against event buffer length
Date: Fri, 20 Nov 2026 22:59:32 +0000
Message-ID: <20261120225933.1148680-2-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120225933.1148680-1-tristan@talencesecurity.com>
References: <20261120225933.1148680-1-tristan@talencesecurity.com>
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

nxpwifi_handle_event_ext_scan_report() uses the firmware-provided
buf_size to determine how much scan response data to parse, but never
checks it against the actual event buffer length. A firmware response
with an inflated buf_size causes reads past the event buffer.

Add a check that the declared buf_size plus the event header does not
exceed the event skb length before parsing scan results.

Fixes: 73b01e57ed3e ("wifi: nxp: add nxpwifi driver for IW61x")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/net/wireless/nxp/nxpwifi/scan.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/wireless/nxp/nxpwifi/scan.c b/drivers/net/wireless/nxp/nxpwifi/scan.c
index 4eeba6700aa72..398c3f8ec0781 100644
--- a/drivers/net/wireless/nxp/nxpwifi/scan.c
+++ b/drivers/net/wireless/nxp/nxpwifi/scan.c
@@ -2443,6 +2443,15 @@ int nxpwifi_handle_event_ext_scan_report(struct nxpwifi_private *priv,
 	u8 *scan_resp = buf + sizeof(struct nxpwifi_event_scan_result);
 	u16 scan_resp_size = le16_to_cpu(event_scan->buf_size);
 
+	if (sizeof(struct nxpwifi_event_scan_result) + scan_resp_size >
+	    adapter->event_skb->len) {
+		nxpwifi_dbg(adapter, ERROR,
+			    "EXT_SCAN: buf_size %u exceeds event length %u\n",
+			    scan_resp_size, adapter->event_skb->len);
+		ret = -EINVAL;
+		goto check_next_scan;
+	}
+
 	if (num_of_set > NXPWIFI_MAX_AP) {
 		nxpwifi_dbg(adapter, ERROR,
 			    "EXT_SCAN: Invalid number of AP returned (%d)!!\n",
-- 
2.47.3

