Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371135;
	b=GE3zN9i5bDxPKIhAc3Q/gpTK+cv99R0tsOjiWpWQFzz8X5Pbm8PtJnUZHaDMXaS8LRzD
	 hOfKFR+A1Xlm3tEM62BaaW3414Fs3cW+ff1bhUgTLA/pAWRlzdMn/hzHsELl1dLB+mYht
	 833J9TBzJZpTO6HBmxMqtF5zOvFhikSOdy+zoUDq0w2ikUQiD442N8m5mv7gvjfBHwty7
	 GnKWRVqd7eQk0vOcYQ1PxoJ/6+ToYxH1BCRNUvJj31D2OPxRlCqu1Z9j/HOfMfI4lMoSC
	 dSDzHUP3QEBfGO/X3upU++BAPS8w+9UwTG2yAl3La8gs6QsZiBb+Cvwv/lyYcfpPm6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=J5wr2XX35oswHT07XXn6WJ7cv9vcrkFz7qWvvzGKxxk=;
	b=Gj1IgdUC3EYjyd3c+Wf3/4NfsyQ6E+yFYi7kkmR8dbaYBtzjdEgQ9jUqQvHTaEFnVxiN
	 Q5HAvBPRkC29aM5hWhiCrup4lNnZKxUawPbd/N2a5UESYw4BN2sQSeg5TM7jAXxKHFDPJ
	 L+fz1g+mw70561bUn+gXlYnDMXv4t2es+hKeUIxTlC0J3bHPTgCPGwA/MbGUkqu0+LSZU
	 GBJwnAayAAIADHaupJtUvUKGJrDLjX/DclhjtoA/vKHImBlJAtL0g4DX+XeSl0WfNWOzP
	 mI9Re0d+8c1RL7OYcZw3gW54dMmE9EpLSrZ3mso+VWiaqAp67fhycy9iuynJBYDB0DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=qgSFWQwk;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F5D606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:12:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95F5D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=qgSFWQwk
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b86bbce3d1so3249901a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371133; x=1795975933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J5wr2XX35oswHT07XXn6WJ7cv9vcrkFz7qWvvzGKxxk=;
        b=qgSFWQwkPeFIWYgVDGzBnZCj78T8dEmLUPqDPmDYuVqwsHPDd9Q00dSSGB5iSW/NzT
         8rb//IbPkZth1Ns7daG1toL2oLFo8Ay0ltG5F3ohG5sA97qmnclxdGMuUshmzQ16/KMJ
         SYd9OPaUoJKTe9zguxg9TcO3n5J+YjWGH/MWDf7oEjk2ICHGNKRL063Kucuop8W3Zhp5
         bmWWJ6ZF2o61kubohDBJYm1FeoBVlkrjbyNj7rb3d4SEG4WJpMEccWbRex4gZoNerKhc
         9j9s2xHHfS8LNtp9C+ge2qaAnsbtagAZuqfRT1GRHo5EPdh5KGkCT1hNPyHIIWcaH4My
         PzEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371133; x=1795975933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J5wr2XX35oswHT07XXn6WJ7cv9vcrkFz7qWvvzGKxxk=;
        b=aeMr7q2afZHRjb3dRZkRZrbCTpmgegIUOHFWrtJ4N450P0U4gvbSa3meLPh/2XoUmg
         AV34NYHaC9ADC0qTBN26V7GA2ztC0ryreJVHqB9/7vs0WGE18kvbULjcjFPw6Oiyjru+
         Y9B/bHSVHklriv/0TFuUvcwV7/gpvRgNEuBUZoLXXnPdhC6f5nA56VrmEFJC+b4uVsU9
         wKn4183zRiPwImwvJYSoksqq2zzvnSc3KMFPjIjc52FZNBfjIAjtlBvU7D4aAJmP2iai
         3ol6UxRzdxmWw6m2zUQ7E5VD4ixYx5m7KpIjyEwIVAr0gXxBn7cpSZnYfEUwnSupWyfv
         xGng==
X-Forwarded-Encrypted: i=1; AL+hErEW3qIZG0K1C3W7oEmdNZigIn5fOCqFkPKJDgJuZDY7hKYPwap0qsSJKNQglBsdegNube99su+rOlm9Mbk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/O062KNZHMRpOHG2cT0CLo4l6Fygdp7x+pLYDRHIIN6RNuSLXY
	5WYSNTYDDS+2HlrFwm1EkpUhuwfvMVUsBfuz8RhdiGg/2KKcGO1J31xTX66FSdOidXpVgdkP/33
	nSDUiASTI
X-Gm-Gg: AZFdTZcBbm/j0EBaPxBhlgOiedhai3y2FpO31oppEsPBf6tXblpQgCa3L5ht6E7YauA
	9wm78z4F52EMHDNah62sOgYGxg+doqwLsgkR3cpsC1nbI5sUIxilBFSyRplTiI0916iNwSNK122
	3cD3o5cFz+ycJ4CUwt00jdMvcD4iHHp9J/kQRvYuGfjEA9z92yJvxtao8q9IEh7s3wZUelLIFHe
	daInucP+Viz8h93M6AbQxIuSdqBRVdKfsUC2Gzih2mCh1mdX3y5Qo05itD3gjLpdapq9oyLTPM/
	pDpbmYhvc03+Xms6bd8Ugpkhbw9jIkr1MI5ulpuBHiVrPkQfqglINW1QpRhms5xaqNOvnw650sB
	N6RG897v+TJC3c6Z/9USdlI+RxumZH5DOdfgD32M4s88sQBrHQggttEpdQJKgsIHOUmmCZ2KPWg
	+2ca2VRSia2MLZI9Yds4MUafNb0z5YhCFKiE3WRm+2UaOXzgYMYs/ry1Rw3rrHRoxzvlqHaGWyc
	tJDjX1slrADjq+ubNpBTDU8mVhHX/FqSPUQlAahoOx9aSNOaxiTCPssl8K+iYo3VJhZGK/1cp5O
	aXmwH3AI5mwPzxkHQRH559hlRoA3rSDmM86XclAbKm943NjK/iwtNzRxh+lyllPdD5/AK6iSoBR
	NwG2/tJYF2O14zO8RQtfxDY8TsQVcf4HMXlGVE5X+1W9I7AddEjFt4a6elI9p6iscbOOJB7wQO7
	aueToLeV7Y4sKZ+xd0SIC47nZHpALoduYl8BDWWc+hnAQrgyGJkA8h6n+3MH13NtsUEplr/HBqH
	XZxKQyC8B//KngWRtHTnb5brX/ClaUiWDPUvN5OuiN9FtEnn9ttA9vJTswep/RxyKJS3eTFmtkg
	UZ6NHylAhSqd7FZF9E2gmHErYUVjyh44aWlnZ9RO/uHZMOZwgJgixyIHmCKbY68xc4gsp/Fz
X-Received: by 2002:a05:6402:360a:b0:6b5:96e9:ae97 with SMTP id 4fb4d7f45d1cf-6ba37ea37c3mr6361595a12.34.1795371133000;
        Sun, 22 Nov 2026 10:12:13 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cc257sm4052567a12.13.2026.11.22.10.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:12:11 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>
Subject: [PATCH ath-next 0/9] wifi: ath11k: hardware TSO and scatter-gather with Ethernet encapsulation
Date: Sun, 22 Nov 2026 19:12:04 +0100
Message-ID: <20261122181213.1016590-1-julius@bairaktaris.de>
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

With Ethernet encap, the TCL of IPQ8074 can send a TCP batch from MSDU
extension descriptors: one descriptor per segment lists the shared
headers and the segment's payload, and the TCL writes the IP length, IP
ID, TCP sequence number, flags and checksums into each segment. This
series uses that for TSO and scatter-gather.

Patches 1 to 4 rework the TX path the series builds on: completions
freed and their peers looked up once per run, the TCL ring taken once
per dequeue run, TXQs pushed from BH work after the receive poll, and
the TX buffer ids kept in a table. Patch 5 sends TCP batches and frames
with fragments from extension descriptors, patch 6 offers SG, TSO and
TSO6 through the mac80211 encap features, and patch 7 takes batches of
up to 64 segments, as GRO builds them on a forwarding path. Patches 8
and 9 take work out of each segment's completion.

Only IPQ8074 sets hw_params.tx_tso, the chip this ran on; Qualcomm's
open-source WLAN host driver on CodeLinaro uses one layout of this
descriptor for the whole hardware generation, and each further chip
needs its own run before its flag is set. TSO and SG take effect only in
Ethernet mode, frame_mode=2.

This depends on Jose Ignacio Tornos Martinez's TX flow control series
[1], on my airtime queue limits series [2] and on patch 1 of [3]
(mac80211 encap features); base-commit and prerequisite-patch-id below.

Tested on a Xiaomi AX3600 (IPQ8074 hw2.0, firmware WLAN.HK.2.12-01460)
as an AP with Ethernet encap, on OpenWrt's 6.18 kernel with wireless
backports 7.2 and further ath11k receive changes, with routed and
bridged TCP over IPv4 and IPv6 to one HE160 station, 3 runs per cell.
Over a full run of the eight cells the TCL segmented 2,609,390 batches
of 14,450,235 segments, and none was segmented in software. Forwarded
UDP saw no loss, and the kernel log stayed clean.

I used Claude (Anthropic) to help write these patches.

[1] https://lore.kernel.org/r/20261021060725.242681-1-jtornosm@redhat.com
[2] https://lore.kernel.org/all/20261122181145.1015729-1-julius@bairaktaris.de/
[3] https://lore.kernel.org/all/20261122134228.956044-1-julius@bairaktaris.de/

Julius Bairaktaris (9):
  wifi: ath11k: batch TX completion frees and peer lookups
  wifi: ath11k: fill the TCL ring once per dequeue run
  wifi: ath11k: push TXQs from BH work
  wifi: ath11k: replace the TX buffer IDR with a table
  wifi: ath11k: let the TCL segment TCP batches
  wifi: ath11k: offer scatter-gather and TSO with Ethernet encap
  wifi: ath11k: take TCP batches as long as GRO builds them
  wifi: ath11k: give an extension descriptor the number of its buffer id
  wifi: ath11k: count the segments of a TX batch without an atomic

 drivers/net/wireless/ath/ath11k/core.c     |   1 +
 drivers/net/wireless/ath/ath11k/core.h     |  22 +
 drivers/net/wireless/ath/ath11k/debugfs.c  |   7 +
 drivers/net/wireless/ath/ath11k/dp.c       |  30 +-
 drivers/net/wireless/ath/ath11k/dp.h       |  54 +-
 drivers/net/wireless/ath/ath11k/dp_tx.c    | 976 +++++++++++++++++++--
 drivers/net/wireless/ath/ath11k/dp_tx.h    |  16 +-
 drivers/net/wireless/ath/ath11k/hal_desc.h |  46 +
 drivers/net/wireless/ath/ath11k/hw.h       |   1 +
 drivers/net/wireless/ath/ath11k/mac.c      | 156 +++-
 10 files changed, 1161 insertions(+), 148 deletions(-)


base-commit: 1983b40acfcb3c3464b291c85977290a785bcfdc
prerequisite-patch-id: ff44eb6f1d673e75bc013e3ffc870d7d30252c17
prerequisite-patch-id: 2cde5e2a788f79e4b8c858a60ec11cd120b1b97e
prerequisite-patch-id: c86d3c9047c851f45b5d46398850c9d810d82258
prerequisite-patch-id: c3c9a2d5971c3e294bbef307df3befb0ff6678fd
prerequisite-patch-id: 013f4003b682991301e1f6e4c381b30ba7ef38c7
prerequisite-patch-id: a3d4787acbb5c0739313b5f098bfb19add947ba7
prerequisite-patch-id: 0118167889d6928ea3b7922b59cd92c629d8ee1a
prerequisite-patch-id: f04db5549c465332f7abd795b0b3ed0984ca3444
prerequisite-patch-id: f0e6efbc4fce124f2b272bc3329a1903fdfef382
prerequisite-patch-id: 46dda0c1aa2552cbd23ab02fc8478d76bc8c8e99
prerequisite-patch-id: 383da58791500dcdad9357108b629eb40b25585e
prerequisite-patch-id: 603dbe7c8c57bd2d47c82087c7b4c45331e50e74
prerequisite-patch-id: 2d25128eaea6ab74b040b0334d0ca670a030870a
prerequisite-patch-id: 510f2063d0566c28ff6f72e99d607dcfd61c0e4c
-- 
2.53.0

