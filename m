Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795863984;
	b=uIvN9Z2wnsCn2nnPC9c3WdW/CNopcm5Yp+eayjncLQTrweYkvEUzNByuA9rE8ncaRl8u
	 6eYOYQ7pamsC6dc4577Jd98oBeyjhe09Nx303lRr8HP2W+I6xKsE/GZsmI7/sPVF6sN8q
	 /yZX5hIuGORkXQmrAqELXoGgiugIgpm4Pa9NAQWS/BaHP4FL/t83EZjTyW67fpZv20fhe
	 gj3qvgQ6Ru229gR2KT0zhbp+mGGLhPle+RfEG6wQGTsVgRSxGOL0f+GWKVZhr16DCoadU
	 CNsisupVapH2pjMdvBM/G6th9C9ymOpiLBtqrJj/TgBeuYCbOe6ODUaXP6PyEzssdcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795863984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vuzWgEZTt/vmNk3O06RvjcsX2Xv/+otg2TVx6cWLcEg=;
	b=JJdJRs3d8Zr0FUPAWfyC2gNNTaZAwTuTJ/PiWp8XjDCT0zwmWKS4Qr/XZEo7OZ1I/brf
	 qdmuY0fbxKYlWXZT4pmlagQQBPyLvaWNggPcPcu5O4RsGDrGJNuuAFjVt4QS+9qkjHZYU
	 4OWanDhGjVniuvI8qnbF7Q4xXHE/r75CUZUjMNwD8ZUvIaj/ZqLJk/EBDq2WT9BiPwDpz
	 5qUmjJ8/SSSbC4x2AQraM0Gau3KuOHsr/VzG8GhFvfGX62A947T8NF+HBjWs+eIc4DVqr
	 q+bSLGn3JVh/Dwos99tc/O3stOzG6n6LCbrVXEM2Cmfn7fxxl0e+wuzlAgmR5BReneQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="R0Cy/C4J";
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298A9606A330
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 11:06:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 298A9606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R0Cy/C4J
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-385d8a00598so14228433eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 03:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795863983; x=1796468783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vuzWgEZTt/vmNk3O06RvjcsX2Xv/+otg2TVx6cWLcEg=;
        b=R0Cy/C4J+RnRpAmOs/2fep2ZWq42rV/Oqwxx4XB7c892508px5ck8ev3P1mgyCa7P+
         bndsTrIt1ntW1pY3SFqYsF/4D/eCoHMo0ZLk9m8xrJgJDx9YMUhka74k7vods6mwCxYj
         c2JXpg3+ReoAlwsC+XZQfTjZx68fwf4RlmLGovn3cxUQU58YPDPt73WbWwT3o6AKSS+E
         8adoI2anZBAMVbvmlnW2a5OmJh1mLT2pEzqLcyqiUnZ+cbRqBcyQdWB7ceEJG/tBOcfG
         QmxPPMF0aBiV4Swooa0PMBE9w+J8obPs+O9HCiRX9MNvMDzLQk0VCU6DolAfhoThhceE
         QnTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795863983; x=1796468783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vuzWgEZTt/vmNk3O06RvjcsX2Xv/+otg2TVx6cWLcEg=;
        b=OFRPK1qL0jwm0yjnBF/AquRe6FkvpnbvtfBI72pfxQGLeRCJAv5BK8tfMrtmNyEcOf
         a2n+j3Gpy5EYb2v3UGbSAxQYnbCHGkoA/WgpDFxbVnj9rnA4pIB/TWhLGL2t/qHg42TX
         WXMLQwx4z8Njgk2UjUMEMCoUohj2yNlVKCol9gtUCSlOa5s2Kx/wlE2YwkT7kNEni41i
         fCS/DmbYimH4yePPjnalErAOsJlF9I93G3uVGD2gViRZn1hn8ctkfgkqi5MxImDu20R5
         z7JD0CvTz+6UXKVhzNO2g1R+Esiv17K9/fZFN1yaEwtKPPq9PHuxwjEudMeXEkasQ4n/
         Vo/w==
X-Forwarded-Encrypted: i=1; AL+hErGAxbPDBavXSHM5R+fOplaZ/F+fDJyfBzOcPuRp/B+WQmcpE4ahEn6Z5sEbosC8ouOcMGzL+RqQZutYcbE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9G9MDWe6+z1HRPJF3f7BfnqjU8eoSphgEmOQcxGRDOxK84yWxr
	hPXcGZkRTc0MTmkAL4D+JFwvviPWGCm4WvcUC49AnIBhzgNYVLzl8a8gnFz38fQs
X-Gm-Gg: AZFdTZcvOR3pIKw/oJFTTp7eckkMtK9awbAir3TeIfv7h4+C4FcbACvb5PPwGlMqqMk
	MnGtxmFp4CrdIRXfUeBJKGlm8YAaWCAU55xq9TRKP6BV0OqRGs8rt3zh9cq4KOjqILXCPEmCMuu
	V5+idxoMmLGaJ73YtnfLaZ8d+ICPw9ItFZHqjVhauBop19HOVr1FO4GwxbtQBz/BFuSc2tRCPDs
	lIRajGWyt6W94iaMomhzqM5NGszOZ9HDNpjB1R7RiKVT4qN4lodEB6Bju7oVCjWCPxgutZSSJU2
	meXGLTJ7iFLLM29gX2TWUqfdgiVb5nW+LJgiVeJkX8MM9UlMeNCVmd95dylqS9jMTB2K8ej1msK
	8cE9N5F+JLtwUo9zwcPJL0QdSoNk6YWy1qOqC5L5BUMXGvsP/360CPd8vvmiPPu0F1QwxlnJ/jI
	cQtDGnOJohTOHpwFgjMNdmo/ztR99nQYvJR9UaIDXFgdWvgtvculuNc+cGia+XhA+A5a7tGzFrE
	vZWhTMv4DKAGPcc4piQhJwRD5YRQ6dZLKb6/xbeErCpvRsA1cGKsj/w6DdQgqtQys1W2PXjXbcE
	z8KaUKOq95Yd3snMfrt929YemUC5gJOO8HWCotGLbgnXU/74vVfOtjMMf6BV61tMAmJVoaeiomo
	Nq9DeE5LDKA2u+ngExBrZkDk8ycc3rN+nKsF9WrWaTvj+3IV5ryXQ+BvW6Njh9ANzQQlCFHqsms
	qdcYxfB6LCZiB1WDfdXpLeFpcWiK5Pkm1aQBmS3ZjA0mdMtg==
X-Received: by 2002:a05:7301:4704:b0:383:729:cabe with SMTP id 5a478bee46e88-3856f8519ecmr28552530eec.19.1795863983358;
        Sat, 28 Nov 2026 03:06:23 -0800 (PST)
Received: from spark-da2e.tail8e743c.ts.net ([211.105.22.106])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386c7c62a91sm40958970eec.17.2026.11.28.03.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 03:06:22 -0800 (PST)
From: Jinmo Yang <jinmo44.yang@gmail.com>
To: Filipe Lains <lains@riseup.net>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Jinmo Yang <jinmo44.yang@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: HID: logitech-dj: shared receiver keeps unreferenced HID devices
Date: Sat, 28 Nov 2026 11:04:07 +0000
Message-ID: <20261128110415.772810-5-jinmo44.yang@gmail.com>
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

Found by coverage-guided fuzzing of the HID subsystem through /dev/uhid.
No patch is attached; I am reporting the lifetime issue first and can test
candidate fixes with the standalone reproducer.

Kernel: mainline 7.2.0-ge46c86b19f4b (arm64, KASAN)
File:   drivers/hid/hid-logitech-dj.c
Impact: use-after-free read and NULL/wild pointer dereferences
Repro:  standalone C, approximately 57 seconds

## Report

  BUG: KASAN: slab-use-after-free in __dev_printk
  Read of size 8
   dev_driver_string
   __dev_printk
   hid_err
   logi_dj_recv_switch_to_dj_mode
   logi_dj_probe
   hid_device_probe
   uhid_device_add_worker

The freed object was a struct hid_device allocated by uhid_dev_create2() and
released through hid_device_release() by a different task.

## Analysis

dj_receiver_dev is shared by interfaces whose phys paths have the same
prefix.  It stores raw mouse, keyboard and hidpp hid_device pointers without
taking references.  During concurrent probes, one interface can overwrite a
shared pointer that another interface later latches.

The reproduced order is:

  1. receiver A begins probing;
  2. receiver B overwrites the shared hidpp pointer;
  3. A latches B's hdev and enters switch_to_dj_mode();
  4. A's hid_hw_raw_request blocks waiting for uhid userspace;
  5. B is destroyed and its hid_device is freed;
  6. A's request returns and hid_err() dereferences B's freed hdev.

cancel_work_sync() in B's destruction does not help because the stale pointer
is held by A's worker.  The existing remove path clears current back-pointers
under dj_hdev_list_lock, but that does not protect a pointer already latched
by another probe and held across the blocking raw request.

The shared pointer needs an object reference or exclusion that remains valid
for the complete operation, not only while finding or clearing the receiver
entry.

## Upstream status

Rechecked against mainline, linux-next, HID maintainer branches, and lore
through 2026-11-28.  The defect remains unpatched and I found no matching
submission.
