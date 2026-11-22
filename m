Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795354949;
	b=FRr8e0SgsoounrIR7046MT5a2+Irm08Q+GT91FWUoyE4guH8A4N7MqZCJo1VRKfTerpq
	 mehGW8QPqGYAb9bq5iBFP1tJVH15tynDMjhyspSaPEH8+iC+zMk0BE2Xd6fveoQ4Y6Qbt
	 KDKDp1jMN5VxqMDgPDFwxr+y8RMj0HtZzMGZ/RFHHSJpxM/Y8FjAIj8jL8d+yKmD2P+LN
	 T5KVxx5+YyysUJKbarvjfdzutaiYedAVxhmpFjsEEcmX6CMGNZPtyEMthZV6Q+FTTD6bP
	 zeVnWQKnbEitN+RjDmnf0EFc6ZN8vH7wC41cxxjOkdMOd+Lq2rQehrY8oawzed2qxWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795354949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=j9qJb/G70CWhRDyDOXO3PSTyr68Kfj29Z7JRpthaS1o=;
	b=s6U3Xs9JOIBkMmqhGc13u/OYfDT5G4+xXNoMJKX4SZQZCK5btSXdCpGIiZ+o0ED13EIf
	 lJuK854Hj3AiIMw/CK0i88iaGYtZagjrffZ+TG6NDbO3tK5bbtjbmCXJvVD3c9aV/7Xsg
	 6ol5fahpQzi7e2BCre7FrnCQ9tAee91X7HCl30IgB0YLoLKQBwU4cdoCwNeSFo//9XrOc
	 QxQ6cbAf/oTuC3aRz1SGcvDJmirtE/Gv7413TVdWpLlqtWFqNf84bCSwqj7b8Du0VOmrZ
	 93fNQWCbKFL+Ff8yK1GYHg5TsCWeGEj4p23EHFGYUdD4tJyYCwvFjahXY/dOueLsrYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=i0OqwT1R;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FF3606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 13:42:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19FF3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=i0OqwT1R
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4cdc606b47so415127866b.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 05:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795354947; x=1795959747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j9qJb/G70CWhRDyDOXO3PSTyr68Kfj29Z7JRpthaS1o=;
        b=i0OqwT1R6zYF2OL3SBIIAuFU+nCBkGYR3qh45rJl6KbcfUll0eHwJdHv1yOsLgVYi+
         Dt3xywdYmXGyVqHJF4zwX/bu0HJ3KsYpoXSKNN78OXdrP86wwzp0m5ZbBQ8LvW2oYFJm
         qJRnyK6SWSq3BUc6yb0vaY0VfaMQtF66GtQRAPWlubfpanDjdJGdjHXBojD9flhV5sap
         dkFM62xeGnEpzoGZGrHDWaP+Dcbf7DqrjaRbx6i8yAcXvOuPgg53MPWjzVapHlhJVDre
         wk2g9yXHq1XTD8WzhPcApvFrILHzLqkYRjF2+tcSc/ndwFssZ3eqben/o6LGcAY6mZ1Q
         OBMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795354947; x=1795959747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j9qJb/G70CWhRDyDOXO3PSTyr68Kfj29Z7JRpthaS1o=;
        b=fWByyLUYEfiIjANqL3i2QkIGQsLi/X6ISVf3Jb7Xx9U4yW4rMYc5LGWvOm9eb06RKZ
         6heIU0JtKlzl2G2RpOC5o2JQ2zEX1lJ1PaAhsVOmgYS75qU6hKZ6nzUiibkUwe8PvhCI
         S6yB9jov+LAgPR4mMdSTm9etbCoW18IGyN5xxc9tOOvOSsYTXrQtvr0ChMxBgWz4yI6B
         gAvuSqf047ADdDw4+WWrjBWs7Wztu3i1vLB0+5qBVTXnZZvEwqNBQ8LQKlrhdULymRRM
         o+8EXAa9Iri9bt/W5ce5auukoAZ/Nihvd6cE3jnqabaA5c/OOeAPyP6dyzs3jn8oFnv0
         p15w==
X-Forwarded-Encrypted: i=1; AL+hErG/seJmAZbkGfZfkwk4YpoCeB2hedxLzb0SC6A0sLmqsat+0gIvNvDY1yCE6kpZUJzA7UIwp4/VXWSvcj0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qUPi4QeaFS2N4AN1ceovR2NfZy6JcPeLxlF07t9ANr66JmHf0
	nrg8pLZumleUIN192FeErx0PUZV9FW4MbDwPtDbxYVkrqAAsfz0PYf/79Wr6MtmG2w==
X-Gm-Gg: AZFdTZcZg1L2Lrg1Lh6Fhs6UvId2P8+mbF9A5d+sTG83/OsoFnpe4iLwKKeKmci+lRO
	86uEvGsbksGGaaIwVczAzMe1OWGEDnX8b9YRm5k9i19XDXQ2TCPIBj6fFT/MR+Hejvz+ZShvfjR
	rOh4D7qcS0fOPs8WLtKmSmOvIK+ZVa1dgfzP0zlrxwbKxkqHg+DFHnzwjrR1TMMlk6sC/p/P0hA
	V11fCoZKk98XSdtUci6s54aqnHEBkPMeFwuVDlL4Q18OUg/xt0+BBrGFbLd8zlGP7/Ynki9cpMV
	cq6uVlBuNjG+N0K9KN+gUaCS5GQNzdSr97eCnmreccdE+/hldJpFHCia0kBAYVU6Yw1CWSF2lYN
	6j4y32H+16wbDFr2xvkyv4lwkW7K6DztgviNhFG+0rtYO0JmujCpAp/Razxku8sT2QYDi0fk1MO
	w3DdPnFMSiwFvaT7MJjVKiKvlFgNLqUph0ETcU9TYFUS1cdJmOSfhdPAv3kXcc3MDd3/fR86i3c
	lP7wdipYdTjAil+OlS0NBL/L+Cd5s9nhIi5wbm7mO7BUKkujNR5X3ZTWS6TDRA3A8AJ9m8nsgBs
	7uHEdFdqPRSpIf93+CQUIEtr8juG8XUF8hBABWcLdndokjDcbQ0anDlYcIiDJt6paNezzyqWTzQ
	x+RDjDyNf9bsCiMa1GHO1MmFqCdJ1Y6Ho7fAYp7nWmSo5/pvpN0CSha0ygpc65Qf4ByLeBxMaUB
	U2SkeNQpK/ZnIYDZvTuH2+vaHo+k4a39MyEvXtV4iGdevDsJki7Upkr2Vpp21nEjUHv076rmUF3
	nWn8wRdLQnoio66EmgrMosi/BHabaaN7BipZfH8cidtsICCN7/V5N58y5PSb0T3+g78a4sxccCL
	VWh0jiYrsKd+FvigKIQxRKxd4sfKpAKiseHrRhRemTE66FyYOWpNqKY=
X-Received: by 2002:a17:906:6690:b0:c4d:167d:dcee with SMTP id a640c23a62f3a-c513aabb216mr555094366b.40.1795354947374;
        Sun, 22 Nov 2026 05:42:27 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24712e3000000000000000a27.dip0.t-ipconnect.de. [2003:f2:4712:e300::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad010bcsm326020566b.1.2026.11.22.05.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 05:42:26 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	Jeff Johnson <jjohnson@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 0/4] wifi: mac80211: TSO and SG for encap offload, and the TID of 802.3 RX frames
Date: Sun, 22 Nov 2026 14:42:24 +0100
Message-ID: <20261122134228.956044-1-julius@bairaktaris.de>
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

Patch 1 lets a driver offer TSO and scatter-gather on the netdevs that
send with 802.3 encap offload, without offering them on the 802.11
path. ath11k uses it on IPQ8074 in a series for ath-next that lets the
TCL segment TCP batches, which depends on this patch.

Patches 2 to 4 count frames received in 802.3 format on their TID: the
802.3 receive path counted all of them on TID 0. Patch 2 adds the field,
3 and 4 fill it in ath11k and ath12k.

Patches 1 to 3 ran on a Xiaomi AX3600 (IPQ8074 hw2.0, firmware
WLAN.HK.2.12-01460) as part of OpenWrt's 6.18 kernel with wireless
backports 7.2, as an AP with Ethernet encap and decap.

I used Claude (Anthropic) to help write these patches.
I have reviewed the commit messages and the cover letter myself and
edited them where needed.

Julius Bairaktaris (4):
  wifi: mac80211: advertise TSO and SG for encap offloaded frames
  wifi: mac80211: take the TID of an 802.3 frame from the driver
  wifi: ath11k: pass the TID of a received 802.3 frame to mac80211
  wifi: ath12k: pass the TID of a received 802.3 frame to mac80211

 drivers/net/wireless/ath/ath11k/dp_rx.c |  1 +
 drivers/net/wireless/ath/ath12k/dp_rx.c |  1 +
 include/net/mac80211.h                  | 19 +++++++++
 net/mac80211/iface.c                    | 14 +++++++
 net/mac80211/main.c                     |  3 +-
 net/mac80211/rx.c                       |  3 ++
 net/mac80211/tx.c                       | 53 ++++++++++++++++++++++++-
 7 files changed, 91 insertions(+), 3 deletions(-)


base-commit: e1dd8486807c1acf9551250b7f81e116a21e6ad6
-- 
2.53.0

