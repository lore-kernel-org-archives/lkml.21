Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443616;
	b=RpBDSOBYbB0D6YRrBjy/Gpp7b08P95kMmX4SSxPSbW0OslRoNqpglkJRjeFuwzCm3l0Z
	 OHplY+XYiLSghjyA+xe4mhY+ZM7pB345r1CQfWVYY6I0Mv/1d01uZMtHz00jD6Jz0OmnL
	 ZDwrZ24e31g0hlcDGZR3pG9uMbU3zoOA3rHRHFx7HYxhwk48RoHoPF+tYJvAoq9lrw9xf
	 EjyH4BbMj1AgcfyXMiae+CZp4Z726qH+nDJv5mUQZ+z3LOX1C2nqTc8449yHtPsyroFbI
	 vhsWfhquSAbtfPFsedNj2FoosJGPPPp1YCP22iQyv0hmemdLk6aWC2GInOH/OvPb1Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443616;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mXV6+GG0z8PCuL6UAZBUPBZ1GbikKdS6r0oEptKGfNs=;
	b=wGv4C3cwjMoCvD65K3J4s5rFrfg2iFsAKH5XWU8LReqf9TnTFPWRPTveCoAQpbC+QN7k
	 JNalAs2j/aQZJ5kMwxRm8eDc4NRTgLbvwlfzjEtyZUGcHh/B7idC4N4IOak1Ba5aIp5Xj
	 5TvlmgpaR4jjjiiWwNPUAN5mvT4AIgylvRGcmaOhlUH3xuDbsMjVF14TwRJCXMH8AtRTw
	 rV38I2A5dfaWuraalP4HVbMLf9hzaEVA3Twe0zjgIc1v8NEP+X2r0Dr5DvF74PzHbfD3f
	 mnmbslcjdHg1z5q9uWop9qeI6Vx5WdUsruwkqGFaoosEM9iOLZY9w6xRrng+/oZgqLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="f/1w/QGj";
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103F9606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:20:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 103F9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f/1w/QGj
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-38644aedba1so4957683eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795443614; x=1796048414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mXV6+GG0z8PCuL6UAZBUPBZ1GbikKdS6r0oEptKGfNs=;
        b=f/1w/QGjFccaJiFG3HZ+rpDXw8L2xJoQ59v3syiXQZY4NsO2GBB5fCINp1CyVmMYVF
         E9mRDiMfjxXdSkoOkf31pz0pJ4TxvwcSoDtkhvk6Qvl+yZe+u8JVB9mW6ybge9moTFE6
         RppaxbBG5SuEGZm/X7BWDXr0w3ewh7diGkdvyp6O3LZZO64Lg8pMYB80TI8mMSavlKWj
         R6d4YdSKvDxLHn73RWCVywKgKVQHiAHLH/IVtVvoS1wEAhKPEj6b612KuELFS2sttqdx
         dfKBjN3hoL4uDPPb1NyELWshyIDzXmci4MqwL3adOt/e0UzHzLY+nfzRAVgttazdZFa9
         Y6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443614; x=1796048414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mXV6+GG0z8PCuL6UAZBUPBZ1GbikKdS6r0oEptKGfNs=;
        b=i08yVu3zl7EB1tcItZpCGyHr2KAhgZvwt5XYsoecTFqTbSH4tcb0kH4FT4LHvoxLVg
         Bwd64DQ6Fph3W54FcYqkwW0oUskZ+ETKL6uLi0t1/hlDOCbWiLj59B/BEPJUx2kuNdPD
         WXLKs+MCoVt2UzB83FiRCE3GEYGx5jFQFvM4kV3SAgBAiA40vVkaorNKZruf3Tz7IAaz
         i7A8+e1Av2PLFsjUR28Fz6S8Yk1VwHYs8KoMhrTbhVF4Hmhn5A6f1ZDwnjlz1PPmje2E
         /RILP2hqsKI/5oJAipKUJQjoA5E/Ts5qBf7EoOPfrondWhe2nB7J2kbBwzlupgAAIzLo
         hNhw==
X-Gm-Message-State: APuU4Z/zB5loH5Ed1WtDyReK1zD1XeCrhFcoB0PF1xTnv8DXoIdqu/Pv
	cJQSFcPONKJCDo+kfFAD1vXadC/V9KkwCluNKkgGPng60Mz9Kqr+c5ng
X-Gm-Gg: AZFdTZdycbLfp5TvJvA9ZysP2GPdPMGSqyhCQDbAhPGqeOgeFtBQkSnaWroDrhqbVdd
	dCvY1YE4JcUHW3nUgynuytSa/qrxeMPhB90vv12Vi8S51XdL/wr8NMpJCwDQRyGo6AXcJAzrBYf
	F/z69mPyNTUgVe3Qkya6abxU8bmBIOKDC1K5WQ1eo9hIi7dDaNMpc3oYOpv5y8pOJuwKLFUHl3i
	zFVDGYfJpZgwiTkaMdbTp5iTG9uANaIhlBzxo3Z0/wYZLBOqaKVxohfM80Uev1Tj3J9tiBrY8y8
	D+WMQERpAA2CA+LwYNgF6p9LjChGF/tkeNsTBEEg/ARKdLt4qiYi4bRWLeEMVr53IpFgMPCZe9C
	MwiVT8cQJLGEzA5Pv7nJ81H4Fx7BSCQWV+4CBFJTXpqpj/Sei3NkQe53n1J7BTpzjqJGfY1HdzB
	ojCh88mfWrPA2EWuBjCfz0HQb57FYIFXFFdYgh9e+Ln+jgggLETOVsVg0tsTjHgeHuefbTZ3DqF
	UBqS/KMmLFUXnFdUm70N17RKhvjRXbv8DD6QEvGS3LKltqsOejIlIz8wkbo0GhhergUIXEG+NSe
	qY5qMvvvQWbgPC6QEvo5znJNufX1N1OBS5Lt0mCh/ic98swDc1pseYdclB3HvnZrU05f
X-Received: by 2002:a05:7300:8282:b0:385:af7b:d788 with SMTP id 5a478bee46e88-385af7bda3emr10643390eec.2.1795443614142;
        Mon, 23 Nov 2026 06:20:14 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38577214c2dsm35579857eec.17.2026.11.23.06.20.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 06:20:13 -0800 (PST)
From: Lian Wang <lianux.mm@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Kairui Song <kasong@tencent.com>,
	Jihan LIN <linjh22s@gmail.com>,
	Kunwu Chan <kunwu.chan@linux.dev>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [PATCH v5 18/19] mm/swap: skip reader rotation for single-device priority rings
Date: Mon, 23 Nov 2026 22:19:59 +0800
Message-ID: <e2a77e8a6c81c5cf56694b18f8e27b038055ddd4.1795439990.git.lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795439990.git.lianux.mm@gmail.com>
References: <cover.1795439990.git.lianux.mm@gmail.com>
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

A priority ring with one device cannot benefit from rotating its starting
offset or maintaining a quota. Read its only entry directly while the
caller continues to hold the topology read lock and migration protection.

Consume the cursor attempt and check the full/disabled pointer tag through
the common path. A masked singleton therefore terminates or falls through
with the same bounded behavior as a multi-device ring. Keep the existing
large-folio same-priority failure boundary.

This removes reader-local state updates for the common single-device case
without bypassing device lifetime or availability checks.

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
Signed-off-by: Lian Wang <lianux.mm@gmail.com>
---
 mm/swapfile.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 5a8663e9f954..91de93043500 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -333,6 +333,11 @@ swap_queue_get_device(long nr_alloc, struct swap_queue_cursor *cursor)
 
 	/* Consume masked peers too, so every walk remains bounded. */
 	nr_iter = cursor->nr_iter++;
+	if (ring->size == 1) {
+		si = READ_ONCE(ring->dev[0]);
+		goto check_device;
+	}
+
 	local_lock(&swap_queue_readers->lock);
 	head = this_cpu_ptr(&swap_queue_readers->heads[queue_idx]);
 	/*
@@ -361,6 +366,7 @@ swap_queue_get_device(long nr_alloc, struct swap_queue_cursor *cursor)
 	si = READ_ONCE(ring->dev[dev_idx]);
 	local_unlock(&swap_queue_readers->lock);
 
+check_device:
 	if (swap_device_masked(si))
 		return ERR_PTR(-EBUSY);
 
