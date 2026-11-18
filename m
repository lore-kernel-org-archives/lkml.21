Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015812;
	b=fnMWfexBMaPUK7V664hLQuMduI2jZuTi3RsaODPUGkN/dE/XVB9Fmgj0Eq8ngALWDHmt
	 Eo4q2ImIJks9BSGBP+zChHvEANZpEyUdDK+mzNmhdSzdsd+0+OQIn8Dj3/3YTbCCDCfiC
	 kJzh4OL+gTFwEuE4C2JfqmvWoD7ondQYUzkY9X0YVs/SyHxKmTst+YZR1MGglkWkliJNm
	 amrGvqlfw6xWSMm5rUKKYMkMoJ0Z3o6+XIZGocys9gM8eHMgNeOvycYb5GY79dfo1RDmt
	 xuSd587wyyiw3gTgDhm69mwiXDoc1BHlCUKCyGgZ8ls0MZ8HcK+h7OFpm71GguuoyRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015812;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rHS9B+0BHde2X4jb3Xb3RONvqSby0IcB+XScTmz0upM=;
	b=2OMRZYHZydOSspKt/WPIpJzpWzq0ClHmhHg+y/bmxQaUqoxQLG/DTO4wb48RlGlx71xl
	 Rcwp+nEaUfOSaZ9J4qUniNUOQh0UOZmkGIFCjLUQ0Lda6WJE8LtuZuz4/kGX0qxT6oTA+
	 DII1ARc/3VTx/5RGFQ+RpOXjTJItctvy709Tw5XUTJ2c99viMtP9pkXkeYgyiDVaQcBZb
	 f2SuoIEXSupIYbfNzqzhwl7JEycic1Tm33BzofLuv5Jmb1ITUiWoVpZRklMUVn6QEWFJW
	 uAbu2YMN9vLX4/4yrTNTF3zt57/fRupLToBA9w0CVOnkwCM5+sH0l4auJrXfW1+T7nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VBBtvYWC;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0CF606A33A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:30:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A0CF606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VBBtvYWC
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3282db206d3so3064063eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795015811; x=1795620611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rHS9B+0BHde2X4jb3Xb3RONvqSby0IcB+XScTmz0upM=;
        b=VBBtvYWCkQ+uwNlm145G4Om9lraJpse8fcze2caHbJrErClBJ7lIqbagIsExxitUxs
         biyUa8H1QMmqgmqHN46h04VxX6i32F1KHOj++0arLGH60Ok8y7K5nrGWS6Jlvm4km23z
         ukUrlm86ZPPRm/+pFbCvJ5WLNkRA+DnTF4fi46n4bQtiyRK2GqtGb6LWuMChmV1MPTrh
         Niw7yUPlqOGIElI9h57hz0Thv2myX+EFzOEvlb+vgj7XHBEUL2/Q0QbkA9scRE/Jup2n
         OhoWqIGdd0CcRQDYG1MrYiEtklNeq4662N0c/qHoJRJrF9tnK6W3U7MnslV7BDiy6owF
         LzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015811; x=1795620611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rHS9B+0BHde2X4jb3Xb3RONvqSby0IcB+XScTmz0upM=;
        b=jBuO7Izp8A5Rul3S69dVCMQXaW4NrwXTUnfaok8HrRWskhM88Lg8BxerISHUtr17nP
         K7RYyly6D7/Y0fvDe6VCr0HABoCAYikjTMYXaeBjyxrpczKM4jKRXP6tiojxVAH+lExd
         +6kBb+qN+3E7AlpjUXT2zw3SPiC4ryifoxp+ihG59HADE6InreOhI2sh/JmdVFDVJw3+
         c68kkDoJ7ryH2ipSfJ1XKKCLqxbfihW6/Cw2gC777Xei3I6y0hZGlQgRUsmLWE5EYjTf
         lK6ce79jb7lgmxPFlGKUh+jViDi49KZYhpCylGJx9itp6vsdv7SVevyRMw/TjMdj9n5j
         oKbg==
X-Forwarded-Encrypted: i=1; AL+hErFYs/pH7APUXkCbbR3jBM22BhQvIxbs1wU3m9jsziJdpdgGOCeQ43HesYK7ONs+PvvqlFtaGgEgeKqm4PU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8C5UgiY2uSlCxWBb1rK5+NT9XDHQ0fPnPoVRaEEZrKcC6uGM7J
	byPlhk7be/vP/EJf4ATfmrzaTgy/yHdVu7pcSB4FBprZi3Z241u8FA+L
X-Gm-Gg: AZFdTZf5cd4gCAGBHjn2P59ynJFLu+t31zIzI8iedKCeM2472nIUaQDbBToH2mlpaxO
	fswekskLKgykGZMGdNQZlz2lufUGFN3qhopcgU4PReCv4piVyuOFB4QlvZkRS3/TRd67zOhWOvg
	uFIawaeTOsmBNJ8rCJgIIlSqHwOKNBWWz/epd3VVtRoYromTJI8TuMPjQ6u2Hf7jGNrqvBBVzcX
	/J6fhdT6Ro3OmU/mUoNLw8LLeHM1Nhlgwjk43cflmp2tazpzltrDjyvhwz/63yB0ZkgJ84BsMwz
	VhUsUNMgqrW7Z7sASAyKuxqo+EaQTS5ZqzB3QKHFOQZC3FzSZo1JfP1/d3qUnFh7YcVH4IhCCdP
	qINAdoBfggK/emno3MYwFoquDUvfinrNVDx0/fq0aHUYjjMm3Hg8T3mNLFARWuaMIw5wbuFdFNL
	cc4h7kwU+4pAwE/XQNbdAVhRm0VNWjblG6Quyhurnlb3zi01v4vpeOjZYCgXlM8y5tnIzKLhUqD
	hTcKPzCO09J017MMg4dzTP7Abj8RCpJkbgxbmycdHsgwv8L4WUcYgZyPO4d6LwnvBbhWiHEueGT
	RS27Ma6IETYiMtF+6qVIdPf2n3bP6vKU6bJyKdowS/DEu7adppaIfaEQNm8=
X-Received: by 2002:a05:7300:50ca:b0:381:7f3b:3c13 with SMTP id 5a478bee46e88-382803787demr2845493eec.23.1795015810729;
        Wed, 18 Nov 2026 07:30:10 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:2c16:ada8:2d24:d03])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a630517asm8922616eec.8.2026.11.18.07.30.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 07:30:10 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>,
	Wen Gong <quic_wgong@quicinc.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Anilkumar Kolli <quic_akolli@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-current 0/3] wifi: ath11k: give the regulatory state the lifetime of the device
Date: Wed, 18 Nov 2026 23:29:39 +0800
Message-ID: <20261118152942.62838-1-enderaoelyther@gmail.com>
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

ab->reg_info_store, with the rules it holds, and the default_regd[] and
new_regd[] domains live as long as struct ath11k_base, but their
teardown does not follow that lifetime. The SERVICE_READY_EXT error
path frees the store from a transient event handler, and the remove
paths that follow a failed start never call ath11k_reg_free().

Patch 1 lets ath11k_reg_free() cope with a store that was never
allocated. Patch 2 moves ath11k_reg_free() into ath11k_core_free(), so
that every teardown path frees the regulatory state. Patch 3 then drops
the free from the SERVICE_READY_EXT error path. In this order no step
adds a crash or a leak.

A separate patch, sent on its own, makes a failed SERVICE_READY_EXT
fail the start instead of letting SERVICE_READY_EXT2 complete it.

Zhao Li (3):
  wifi: ath11k: don't walk an unallocated regulatory info store
  wifi: ath11k: free the regulatory state when the device is freed
  wifi: ath11k: keep the regulatory info store on a SERVICE_READY_EXT
    error

 drivers/net/wireless/ath/ath11k/core.c | 2 +-
 drivers/net/wireless/ath/ath11k/reg.c  | 6 ++++--
 drivers/net/wireless/ath/ath11k/wmi.c  | 9 ---------
 3 files changed, 5 insertions(+), 12 deletions(-)


base-commit: b1ed5a45b994a6473ca1cf34f35a1bf87f1d8e2a
-- 
2.56.1

