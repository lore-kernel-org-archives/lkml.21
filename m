Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795554760;
	b=i4qUBsWVdJprQo6JdddSmWMlda2Av8y0DMGG+D5yHgMCf3MG6pAMjYfBlzoJ/4R7b9g3
	 D9KG94ePSa0xawenAH3GmKVFw05ONcln3BdQsFFQmiue89i5RRoJvvoqXrc9BhomMizUY
	 Xm/Y6yIAkr5tySyMz+Al8ZbK+/jhHbuxBeT+ipJttwCmT6XY256fV1J7BmNY5aEu9cgtB
	 RuVLdqf7723Vp7/9/tD0fMllKY9QyuWsXY7Kpm0vUvhOMtM63D4+KiT7gjHqQGug/cl+6
	 SHTDwaHJ0lKR0w+Kx0wsh51Ok0UXpboTzdgNeJSSDqHwuHDe5s+3ZHOclQnwR/K3jwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795554760;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=F8rYSABrKPlESdcxDAuXs4pRX0vk4JfNgBSWMnneRLY=;
	b=4lHMNj91QuLNHolaZPoKRbyUVf2pFfohx6PsoMKmfgGW9uZBGom8TW14zRvTPxUA4mxe
	 Q+qr3BCkvzL7+GT1FUTL6XDpiLWcrbCpGUthsoZLlfdTmFXfbFO7dcfckokxaeM8qDug9
	 h0u1H0nn+IXdgW8eJJxBefzx6ZXvDvZfAjwMrnsolSLDcpdVsghVANjN3ZMHHlvVRJC9Y
	 OeK7IIYOU0ordHgAd2D9JBkVc95bfv1Q5lfVTQOJK5uxR4i7IycNB70nOyrX4+m9mOQoV
	 sOy/CDCNEpejZ8cJNGduo3Te3Xh8a8Y2/KkZ0eVTB1Nh/tR/pouW//O+D4aRlG/9d0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GN5MkXZC;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282A2606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:12:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 282A2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GN5MkXZC
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3866a784546so6622331eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795554759; x=1796159559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F8rYSABrKPlESdcxDAuXs4pRX0vk4JfNgBSWMnneRLY=;
        b=GN5MkXZCErMf6dk+btCaHgEKpXVzYUucT2PFwX2t+/tNrjV/cF/U5N19NBBskDejOK
         /X6fzSUtPGQlmlYHqX6ANopqE/wg0voxmqvEsznbkqudFn37VRE3G9EIpQCAZZPA3UDw
         qJ3eo05Kx5mchxy/46qSlgH3QLfQHg3rIpXpD8lN1Z3hQXLfzSbEkDppnC3emxM/rjp+
         P0EZXQiOkwBhk6jJ3Pn9AvdzPJ2g9ROj6DT7ToprpcuQQU7KEZ9EM+quDZgsqlPEq487
         0lEEDuluBkKLwJQsKig7ezsX1gOZOcSvaauArGbPTt2IgORbOlCD2DMU0GYZN/jHHnfI
         7opQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795554759; x=1796159559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F8rYSABrKPlESdcxDAuXs4pRX0vk4JfNgBSWMnneRLY=;
        b=BiXi+dbXLWWO4qgqAMex2N5+ttCr9C+mUBrhnmtEDPWkZJzxHsLAWHnwQUtdYzo0kI
         DQoR9A7B1j7vXk4m8aCIpR9JKkY0RzeojBYWWGlGxwyLgHBbLq3CsGmynNCKXqdCXTVN
         Hc0dvP37yx2emh2Vc+9SwBmipQaISQlSQHqR2ErWE8YOV6jiyu4LgO/gxgOHugUvlQ+U
         Z+dD/3BepUi7nMoHAhTMGiAGJRnNXn6kKjvrKRUGvMl/c3+CElTKkQg1T5ThsR7+Li12
         d2Yi8EGIMefahmPWWWgX7yEojKw0QMFvXioMfanqgfPZ3ocQghfuInfal0W/Ah7kmrpw
         vsvg==
X-Forwarded-Encrypted: i=1; AL+hErFHzgT+/wCWubuavviAS+ys2RNyQr/rtbELf3qnFE3aWM4U1uu872SCrnq76CrS9vWxUelfliOqv8VIpJg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pUXKizuzMfl8K2KLu3kPeCP0LxaIToYZQS4M6gBJ3IbfgZSY2
	OLnN1ED9jKus7ZCAUKdWGyZlocSgaUrpTR5GSS4aWS3YbjQdw8u4mgDi
X-Gm-Gg: AZFdTZdjQcxQ/JH1JfBTRYL68DPa6LzQnFCCA4Oezu3FnV6txGydpRtJrNOerfOj8gc
	WYfwWkE5DmKyMPgdY/5G8Jg0bpVDLxj7HEik9HZLwvis+2onqcai2lmtCOlQikHkkc3kzZhNevW
	YPvt8TQq6P2tBcFSRukbbl6+ym/+J4ftwihUb3wfBl5nXRCK0/942TIXSYe9bm6BS0iUu1JitCR
	J5XcrZUmE9J4T3g3zM5+7RhfiRG7U7Xg7KFrMMnC1TyzdHwQSktEFK24wCEY6WrE9RjAxxoLcde
	RH8RTqxRwG05AgfElrAxaqvlGOIa6KXQt5W9+OmqK8alAJz66IKi7Hv/BYOOJ5sy/i/NZ8jw+VD
	58jTFNDhKnHjZ/oDOD/aEy91kyL+zb6NWDIn4mTy9f5lXrultP+X1ILGRIXA8lzVE0tNNXdAH/L
	Fjx34qVD+dVCbaq9JSo3O3hudztvP2JFWbLJwGrKcWXo1NP7hhY7AEcE5394YtXJXc6o0242j34
	3gCU5S9DnAorQUtZPndxOxh2l4Cdx66WFQHwss8rpm+js1ZllLbBCc9xVN7lXchQapY0ow9iCIF
	Bq5RrseLyypO1MJTEfrod7w85ZMqb+xUq8J3flDjT5wHvyJdZPY5eA==
X-Received: by 2002:a05:7300:1c17:b0:386:a105:fa66 with SMTP id 5a478bee46e88-386a105fd17mr10963340eec.7.1795554759056;
        Tue, 24 Nov 2026 13:12:39 -0800 (PST)
Received: from shine.local ([168.196.221.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm22124445eec.18.2026.11.24.13.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:12:38 -0800 (PST)
From: "Andrei A. Bykov" <andreiab9019@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] Bluetooth: fix bonded LE peripheral reconnect completion and holds
Date: Tue, 24 Nov 2026 18:11:25 -0300
Message-ID: <20261124211127.41609-1-andreiab9019@gmail.com>
X-Mailer: git-send-email 2.56.1
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

This series fixes two issues in the Bluetooth HCI layer seen when a
bonded Windows central reconnects to a Linux LE HID peripheral.

Changes since v2:
- Rebase onto bluetooth-next at 6a40daae69b0. The Bluetooth CI bot
  could not apply v2 because the key-refresh configuration code moved
  into hci_conn_refresh_key(). Update that shared helper in patch 2 so
  both Key Refresh Complete event formats use the same path.
- Preserve the LE setup abort checks in both feature-complete handlers
  on the new base. Patch 1 has no functional changes.

Changes since v1:
- Refresh the saved synchronous request after timeout or cancellation,
  preserving socket references across controller reset resends.
- Keep the LE feature hold across encryption and key refresh. Explicitly
  abort failed setup and prevent later events from reporting success.

Both v3 patches apply in order with git am on the pinned bluetooth-next
base and the GitHub workflow branch used by Bluetooth CI. Local model
tests pass 152 command-dispatch checks and 62 connection-lifetime checks
with GCC, Clang and ASan/UBSan.

The v2 backport to Linux 7.3.5 passed repeated bonded reconnects,
approximately seven hours without observed connection loss, and Windows
Bluetooth off/on. Those hardware results are from v2. In separate
Windows suspend/resume attempts, the test HID application could still
wait for an HID subscription after BlueZ reported a connection.

OpenAI Codex assisted with analysis, patch preparation and tests.
Sashiko provided the findings addressed in v2.

v1: https://lore.kernel.org/r/20261121033104.441146-1-andreiab9019@gmail.com
v2: https://lore.kernel.org/r/20261124140956.15296-1-andreiab9019@gmail.com
v2 CI: https://patchwork.kernel.org/comment/27404265/

Andrei A. Bykov (2):
  Bluetooth: hci_sync: keep unrelated replies away from event waiters
  Bluetooth: hci_core: preserve LE feature holds across encryption
    events

 include/net/bluetooth/hci_core.h |  9 +++++++-
 net/bluetooth/hci_core.c         | 16 +++++++++++++-
 net/bluetooth/hci_event.c        | 36 +++++++++++++++++++++++++-------
 3 files changed, 52 insertions(+), 9 deletions(-)


base-commit: 6a40daae69b0c45d4f8b6aa247fca165b8534f60
-- 
2.56.1

