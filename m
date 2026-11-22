Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795360092;
	b=RmNuCA+z7h1mjqokQ5CrOMwYYwvOccZwDh8D6R36vu/Kz19VcE5AZ9mvEHSsmphQogHT
	 sRhK4GCzK4WEa8s9SZVHKxL3GwpFPMm1LRK57JkV+HFODssootvGJJsfjAjGsA0Y2RDxH
	 rJaTset82l91gXUdEfuJ5vKByu2mwYW85eAyOTZI2rhff0N9l+TdHMpc4Mv0sezDisJRq
	 BAXgRQUBTQYcWIbBqwmpyg9bQ/QWDuuRJ1AAS48w8MwWYE/8H7S8MEFjXNCn1RXZHK1Kr
	 C88rXIWPTE/mhzCdjBtqvvz01CsW8/TqbH1mFL/eAf3SMGrxtvWhu+x1+UjXkWU8RrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795360092;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=L5taQCA3yvh5AYAVe1wnOgk1TFyHKnQu9Ei6LAyOPC8=;
	b=2G4/zTYJ+otKHNnoAl69hef2PF5U2XI7wGDzCLPOoAY4TPPAmhBgcAZmJ/xFJYNXnaBJ
	 w+MffoPyzI6jU4N9rnr6+ZshombFIeBeTEg8D/wCt29uIv0uljCfA21ucMOW7AYtC9eyX
	 gPvBfekzx0t2GpedVT8kumkBicVBO/66dU/pj03zgFCS+RyO0JNJeBCNb3qhdYl+WnT8v
	 xJAaGszoPO3BqJU5/CjAptPsDpRMmwxt76AebZosWnJSGRw9WOR26PPVwzmxAXhdyZvaW
	 1NbRkmKAt4/oh09vapoAv/6hmHPE0kI3xLrVUzh7cRd06AG/7wf3i8vgyUS/gpuoPng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=vzIIU9he;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607D7606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 15:08:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 607D7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=vzIIU9he
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b87a1a2babso6737796a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 07:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795360091; x=1795964891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L5taQCA3yvh5AYAVe1wnOgk1TFyHKnQu9Ei6LAyOPC8=;
        b=vzIIU9heQTv89vS5jFbRCHsbqT/7bARyq8nah575IUhNXhCG3KzS3ylXxvTRDP2m4F
         4xRDxzapfc8aUG9L6ZUNylrl9miznoZ+OmON5CznFiiUI3JdjxG5zzJ8nZaDDSWJCdnw
         2Xd5p/fdiIRvML2cOL4gRoHexE1WXnykFdYhzSg03BNIPSAQShVbN+qJVbFH05r9HoRE
         XhhVsoSjDhBBudW3EgvGdNWLEilzS7fALZ45OwRcqBzBKxVFBHZsTjvKx9q+RpE+UXRU
         AeeQbb/JWUXeVxNk1yvybsmuy9s92Svm5LoB1PswRhtePfQtfd0wm6b5Lc084moT1/Bx
         qlOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795360091; x=1795964891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L5taQCA3yvh5AYAVe1wnOgk1TFyHKnQu9Ei6LAyOPC8=;
        b=2pflYuWJSD8WhQGHKOlBo5cPuBTub+iS1zsaB9aRH7ASBeWQU01MWaAyLyc5nhJz6H
         xuS+5geLVJFBSi469VOoCd2bQ1YN7dkeHFfhhSg3ZUlTISoj4ckKT8ZSZg5VWyCgsGO9
         A8OGZRglmX1EwL/oYOSNLZmosF3turwMtcrw7N41PbQuFGPTediEAwSWkBdncx71+ZQU
         bsnY95xp36iHrGNNXoYWJ5tR5AKSMAZfa2lwNouxNkk6vvw48+7flZ4/8dom8HUEo+1Y
         1Do6VASuKON2nBV4uauVggF4iv0OPRJdkaZTr7wNWBZ/KqhHmMMtaJA7aHMNl2YttNFn
         1gxw==
X-Forwarded-Encrypted: i=1; AL+hErF99lIhpVDC3MLYv/jjc9aq5b80fe/1cf3MroJu2yg+dxPoJWyAotP+G8nPLxiUqAwYOya8fTUrcotHluE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+k34GasJ1RxwGS2UcUIGMos94/p6okvdE4Wvx8jRYJXWCb+INK
	USovyJaN8cOQCLVmY0uQZ1a5+eZLQ8j/OH3MzbUkaTXSkpQ7dhErovG/gkBQ5staSQ==
X-Gm-Gg: AZFdTZevD4fvy1rdu+QFkizQeNCtOC6yy+qp560EZ/LHG6pajpYQB/mQRpGI/r0UUKM
	EeC5dxXN+06bLfh/x32NsT7CkQc5NbsFZeM8mVQ36o1EUKy/84Q3A10p+Bm42tn+HWdKJDMoiJj
	OMC/l1MJtqWRDqE1U/cMGGwECOqKxrQgwmgzbJTkcPsYmfZA8nDJTOB5LrmDe/4MWEHa/SVjMkb
	igX/SKUhG7Zgg3F+sgyynKNuyKJf4je8OiP0N8qciCup1rk3FYlL1AR0mxLn46ri26r7w/PgmXX
	7DzLxRdevvBrD4DM0lYHimBBu91LfSJrCirrVTL0inOvd+DUEwoxygA4aFV8gINLqz1H+XOrERM
	PCYStLb5UzOEs5uaY/Davf8YTeq1pOGMJxx9QtrA22zq0bUPAH7Z3XFowo9DHtYhZAR5Ppsd3Q7
	B86uBhRPM6O5qukl5uvnP5qZmHZIoppiPzNLQ9KZmRoyhgNh2ZsyDd+rHlJviK+6ybxFGGa9Gvh
	nVqmPcfM+KzXEPSRxYHznbZSEVaDq3kjdwiHQod/4XZiAejAJ4mwUxDSL4tV7O0imYrHqdQoZqw
	C4qSYyErHZu+bdnpV3E7B4voAKQG+xK6L6f2INDJXk6zYHpHGokaHdyNM4THu2s8ZQMBP84K8FH
	yArSFvSDtXZ1cVNjt5VUMLymRSp22mv+lJFSUx68twYyaMaTTX3A3IOd8MvidD5h/2DxvRFNEiM
	4YTicuJOssORFtrMxBro9BtOtCxxMltsJe/XzlSViT47XECcOmnxqaxWpPLWPwj6J3vMx9cQe5v
	YatFSDyzCrVDIAiDnBG2c4Cv2LlW5vXVfFkFJ8d0CkQ1j35/AZrbdrzg9islM8oknKmL7wg1NJP
	UggTjLXdfVuF
X-Received: by 2002:a17:906:1651:b0:c50:6222:7b1c with SMTP id a640c23a62f3a-c513aaada4cmr594204766b.23.1795360090707;
        Sun, 22 Nov 2026 07:08:10 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.181.130.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae68887sm324618466b.20.2026.11.22.07.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:08:10 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Sven Eckelmann <sven@narfation.org>,
	John Crispin <john@phrozen.org>,
	Julia Lawall <julia.lawall@lip6.fr>
Subject: [PATCH ath-next v3 0/2] wifi: ath11k: do not fail down transitions of the station state
Date: Sun, 22 Nov 2026 16:08:09 +0100
Message-ID: <20261122150811.3135445-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
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

mac80211 warns when a driver fails a down transition of the station
state, and ath11k does so while the firmware is down. Patch 2 fixes that.
Patch 1: with the firmware down, a key whose removal failed stayed in
peer->keys[] although mac80211 had freed it.

I used Claude (Anthropic) to help write these patches.

Tested on an IPQ8074 AP (hw2.0 AHB, WLAN.HK.2.12-01460): the firmware was
crashed through debugfs and the station deleted at once. In 6 of 6 runs
with this series station del returned 0 with no mac80211 warning and no
key removal error, and the station re-associated. With the v1 patch alone,
one run logged "failed to remove peer key 0: -108" and "failed to clear all
peer keys for vdev 0: -108".

Changes in v3:
- Rebased onto ath-next 1983b40acfcb.
- Patch 1: return the ath11k_install_key() error for DISABLE_KEY instead
  of the PN replay result that overwrote it (Sashiko review of v2).

Changes in v2:
- New patch 1.
- Patch 2: continue the host cleanup after a failed early vdev stop and
  a failed RTS/CTS update instead of returning from them (Sashiko review
  of v1).

v2: https://lore.kernel.org/linux-wireless/20261114225643.962015-1-julius@bairaktaris.de/
v1: https://lore.kernel.org/all/20261101174422.1275413-1-julius@bairaktaris.de/

Julius Bairaktaris (2):
  wifi: ath11k: forget a key the firmware failed to remove
  wifi: ath11k: do not fail down transitions of the station state

 drivers/net/wireless/ath/ath11k/mac.c | 31 +++++++++++++++++----------
 1 file changed, 20 insertions(+), 11 deletions(-)


base-commit: 1983b40acfcb3c3464b291c85977290a785bcfdc
-- 
2.53.0
