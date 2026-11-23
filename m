Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441300;
	b=vx/SZpb1t4pNK6SUO44Mpr6WR3O2CkEfzswnr55dRSjljc9WK7Xsgs6n7S3VGVIbWOPZ
	 lhqj5SfSOV7Yj5/2FqsFjBtLudY8bVbfg4qOJCqswdJ5M+QeM9zD+fy8GIhOsnEcUyDWw
	 uKYldT8ZQDu3/ohJeLeimzGVOPHIHCDpDaRn33oQjj8GINC4GcrQIEAIF8EHd2owp8KFE
	 IRJjkamdWsEsLhAsD1PVGitNlGcA/bwFFbF71aWSdFfXhdM7eAajYe0+gDX6noVyNAjYF
	 2OaxGKk2Ti/PnJafRAml6IoVHaGMm+G/RUCNKY1+QyYClLeocRW2Ep/zuh5+4YkR9rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dojWJPFgnKNqylC7XUFb1f1eXTEneh88WiZp95WzBxo=;
	b=HTnSXEXircBu5f1gO7yvDdjsVjYImgHIaBRWGMfkvW2L2K/Hy7HPBCXRHsapqcR3a30/
	 X6U4mN1ZsBK+5WaTAqnvx3sEskBTAFhvXuJPaOQHgHgNT+sjpR3KsgAH9j68hez4LYKrf
	 gefbn/Rpr7jsO6/0QtBSsrp6ChOCMFENSGuIcZzNttRu3CQZ3wDZIq4j3/3sktyk4iMaC
	 w/hXOd6OXUBaOn14Xci29JQSYc1fFws8YNS9Ee0c7YtF13NO2haFLhoiZLTTvkvzCyQmB
	 lwzLYbNdGAFpoDw3z4zpk6LiYWmpX0wmYDaN/WCOA3NXR91LK2C4QrvzRd+fPqZjzMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=uDKHM7Ss;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7482A60A383B
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7482A60A383B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=uDKHM7Ss
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b596afb4c5so3592260a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795441299; x=1796046099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dojWJPFgnKNqylC7XUFb1f1eXTEneh88WiZp95WzBxo=;
        b=uDKHM7SsB0qkc2HpeKUX7LIJrt0OPC2vI4JaokDuAKG/PNYS7w6pz7a2sOI/jjkjCW
         kvXsFGiyVd+CAnDBUWBFfnV4jHsgfXCkvaOpd92pAAcxYpzvlAZL5KiKc7AeXnH+Dsrv
         qltcajAUj5EpoljOmtCbj/EEfZT5bvaKL++xwxICwz9Gfoq8LylOmAc9i0Os+Yqa1b9s
         JM9Y7Fmf3APXsII+6cmuoEp7pvuqhyKSLT2F/6swr82993KJ6SyLKW69iygNOOQ5NkWv
         9GrChOsjErSifiTBO9kLiphjmlOqHDODHiOIy5Fcp2Fzz85Cp+hFmEz6LPQ0mnv5Ceov
         55pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441299; x=1796046099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dojWJPFgnKNqylC7XUFb1f1eXTEneh88WiZp95WzBxo=;
        b=Lx5zHgiBqbvplGY7QMwOJuZ8WR/9q0EvHwrBIqQFSD4eX1nUwg11qtU+kabq/dXRav
         BptRMt7ihCYNE7W/aYXfucfLF0fyACArvmH0ZvQ7nGWS66yaWu/CSaGKPJj2KjawkGjh
         8AdIVILxxCMMQ2U9ZfjnfzTFg2deR6kuCA3cHwLxqMdjC8jwaM6aY7ZRpB/opgUGO3TG
         DiiUP0Ngzj79mUbxkY/jCQ7/ojESI/+5s7S4LQMsakAsYndxLXDEAAu98cHpvpmqCTAN
         pnh7G7xe/P07Hs08Hy/Of2i6TtgIfp1NQ62l/qEs62QobG7V+zLb0uro/HzIcFKogctg
         TzVw==
X-Forwarded-Encrypted: i=1; AL+hErHDe95ctFr3ctSZ+3UqAqZLlkHpnGZCb1WzkLZcGGZVSyjOdQL7BIiP4ZiIxr25BPNzeVV44JRvaV/KuCs=@vger.kernel.org
X-Gm-Message-State: APuU4Z84RDU9z3iAo8VhxckBy8t/c4DiuUuPz4dC7TsA/zitBPUBwtN/
	w6f/kBLpirUGDu1cYD6894Wc4ZKzmcF/z40obAT8tPY66B99RowBkbpEp4GgLIATSQ==
X-Gm-Gg: AZFdTZf3arvQxBgpe+GemTzLsMHTLHAuAliPSSAYvnjuD3gs9f0lKambUi9/+v5VenS
	qgwQSmbBpeMQzlBA1linS+cHcN43imKvJ/WszoQRd8EYTzcm6ydsw3inJTa94kaLYZ14MXdlSDf
	S9ZsWEBrnqzEuPpNoYxA+bpltrdGlXuDsb0yngfYMQifcban0m73ZPDcE+9ECqQoye+it2IXsrT
	0KdkKJwY84EuWtZpSvx+/ZwJfqoQwWD2sJzcl7KJAmdxByAr+FXcFq2tqAFEVWhG55VFoMWG8Iz
	shd4O5da9nTPQP0AZ/9JUQ2ialFVzNvfpr53fUEC1aGvQPfhwzTOEdj1a6e8WJhUi4IO8NKmRtG
	Ob/hnDizz2sh5SzFD9qxWLv12ZN1I+Vz+USgb414vYKOVIcHnrQ6R5a6ZBLUtNeXWIAVpt/uIKM
	VEXPDzQlNN4req5WFTfmhuulCB13EvPYsxFyxb9i5QXw7G8O3iRcGHZwjz6B4qLmNrEUxroCRVP
	wKEDIUcAwnI5finalWzjNcejp2kkoKG1sRofbbsHc4fNtGm/sS3EIr5jQY/hdUPHIXdJOl4Yp7y
	Ijht+ROg5b/kZUBuSylJ4y2X/3NGeNR7RHLjZkCskfJk3UWNfo1NkIRqDamKmZ/sJgz+0anNqvk
	fL3037WZiXlBCp24CR3q8FgReT81D0tGOXkehRvqeF129MSjKE4n0/UG4ZvMx1vrgHUhT0qpTef
	q+1rbMPELqHXJE419MrtPEQwqIJT7VAmWNWocC0h/MHaw6GGjihjze/F8qyVr3lpd0fR6vVFL6Y
	IDZRj1SZjawKCTwZCunVvO6pc+8zHqBGK94NShnGL755enokB9FBYy0IYGaCT9TGuVncmcpe1Yn
	uguQAenZrSbdyTY79/vbaGN27DObWkG7zJK2FU6nuhl9h6Kqa8aA2wvTKaCgRN3zc3bsyp1bKg=
	=
X-Received: by 2002:a05:6402:4501:b0:6b7:b872:27a0 with SMTP id 4fb4d7f45d1cf-6ba37e84aa9mr7855224a12.21.1795441298551;
        Mon, 23 Nov 2026 05:41:38 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f247012000e9a6b19fb24a0d13.dip0.t-ipconnect.de. [2003:f2:4701:2000:e9a6:b19f:b24a:d13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fbf0esm5339576a12.23.2026.11.23.05.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:41:38 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Praneesh P <praneesh.p@oss.qualcomm.com>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	Mark Ruvald Pedersen <wabsie@gmail.com>,
	Rosen Penev <rosenp@gmail.com>
Subject: [PATCH ath-next v1 00/10] wifi: ath11k: cut the per-packet cost of the RX path
Date: Mon, 23 Nov 2026 14:41:27 +0100
Message-ID: <20261123134137.718575-1-julius@bairaktaris.de>
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

The ath11k RX path spends a part of its time per received frame on work
that the hardware or a cheaper structure already provides: an allocation,
a DMA map and unmap and an IDR walk per buffer, a peer lookup done twice,
a cache invalidation per ring entry and per full buffer, bottom-half
toggles inside a region that already has them off, PPDU stats TLVs nobody
parses, and a flow hash computed again in software. This series removes
these one at a time:

1-2 give the refill ring a page_pool and replace the buffer IDR with a
    table of ids;
3   asks the firmware only for the PPDU stats TLVs the driver parses;
4   sets the skb hash from the receive engine's Toeplitz hash;
5-6 sync the new entries of a cached ring once per head read and
    prefetch the buffers of the entries ahead (cached rings only, that is
    IPQ8074, IPQ6018, QCN9074 and IPQ5018);
7   looks the peer of an MSDU up once;
8   drops a nested bottom-half disable in the reap and refill loops;
9   invalidates only the part of a page pool buffer the device wrote;
10  takes the buffer table lock once per chunk of refill buffers.

None of them changes interrupt placement or adds work on another CPU;
each takes work away from the CPU that already handles the frame.

The profile shares in the commit messages come from perf on an IPQ8074
access point (Xiaomi AX3600, 4x Cortex-A53, 5 GHz HE160, one station at
850-900 Mbit/s TCP), one run each, with OpenWrt's version of these
patches.

On a Xiaomi AX3600 (IPQ8074 hw2.0, firmware
WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1) running OpenWrt's wireless
backports with the RX fixes, with one HE160 station at 830-940 Mbit/s
TCP and 3 runs per cell, the series lowered the share of the four
cores the traffic takes in the cells where the station sends: bridged
IPv4 33.0 -> 27.6 %, bridged IPv6 32.8 -> 27.7 %, routed IPv4
33.7 -> 27.6 %, and routed IPv6 31.2 -> 27.9 %, which is within the
spread between runs. Where the station receives, the change was
between -1.4 and +0.8 points, also within that spread. The share is the time idle-priority spinners lose
on each core. Switching pktlog (lite and full) and the extended TX
stats on and off, adding and removing a monitor interface on both
radios, and unloading and reloading the modules left traffic and dmesg
clean.

The series applies on top of the RX correctness fixes https://lore.kernel.org/all/20261122210525.2076058-1-julius@bairaktaris.de/: its
4/10 uses the msdu_start_info2 accessor that series adds.

I used Claude (Anthropic) to help write these patches.

Julius Bairaktaris (10):
  wifi: ath11k: use page_pool for the RX refill ring
  wifi: ath11k: replace the RX buffer IDR with a table
  wifi: ath11k: request only the PPDU stats TLVs it reads
  wifi: ath11k: set the skb hash of a received frame from the hardware
  wifi: ath11k: sync a cached ring's new entries once per head read
  wifi: ath11k: prefetch the buffers of the REO entries ahead of their
    reap
  wifi: ath11k: look the peer of a received MSDU up once
  wifi: ath11k: take the refill buffer lock without a second BH disable
  wifi: ath11k: hand the CPU only the part of a REO buffer the device
    wrote
  wifi: ath11k: give the refill buffers their ids a chunk at a time

 drivers/net/wireless/ath/ath11k/Kconfig   |   1 +
 drivers/net/wireless/ath/ath11k/core.h    |   5 +
 drivers/net/wireless/ath/ath11k/debugfs.c |  15 +-
 drivers/net/wireless/ath/ath11k/debugfs.h |  10 +
 drivers/net/wireless/ath/ath11k/dp.c      |   9 +-
 drivers/net/wireless/ath/ath11k/dp.h      |  27 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c   | 712 +++++++++++++++++-----
 drivers/net/wireless/ath/ath11k/dp_tx.c   |  34 ++
 drivers/net/wireless/ath/ath11k/dp_tx.h   |   1 +
 drivers/net/wireless/ath/ath11k/hal.c     | 107 +++-
 drivers/net/wireless/ath/ath11k/hal.h     |   1 +
 drivers/net/wireless/ath/ath11k/hw.c      |  22 +
 drivers/net/wireless/ath/ath11k/hw.h      |   1 +
 drivers/net/wireless/ath/ath11k/mac.c     |  13 +-
 14 files changed, 765 insertions(+), 193 deletions(-)


base-commit: 1983b40acfcb3c3464b291c85977290a785bcfdc
prerequisite-patch-id: ed566369a9bbda0ac9a48357261e8cfe1cc0f1d1
prerequisite-patch-id: 726d7737c833da0842192eccececad4a0dedb1a6
prerequisite-patch-id: cf0b8ff1ac6cef681433247e4b937a3e23af78a3
prerequisite-patch-id: 03c89df01745ac9a80653431261f9a003dbca7db
prerequisite-patch-id: cb48c0eddbe0c2fe176e8edc94c6bc40be3c48a9
prerequisite-patch-id: 1956ec85ad80b68868538070fc0e89c29603467a
-- 
2.53.0

