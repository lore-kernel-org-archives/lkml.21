Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795886540;
	b=xRRGBzG39Fqs7mVoayJmCY54evt1Y55UeQUZwROvLDYBnd8aiccqaQdwPjKa5qxeeETV
	 yUfnPwBg5vpOQ6q+PTawoIEYwLQzAFeSqpAvRnyzuV20pTyR//UBjely/9PhoDDck+qH9
	 kNcfonJ2y6xfFhTl7hCV+Bc2la0Zta6fJ6+v+D97xX/khFbOJrkkb/9xbz1bbxt7rusT9
	 UMIWgMLoe1sYTwklg9gB5jFVQBMIAAK31r1Vysl1k31FsYGdWrFhdMJNtwtOEAmtGWoB/
	 YgnatsTeYMHULpuueyD2h1CEOYAzu/CJGBjoQzoAqQhlIhbTo9leldeVkiaSouze+Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886540;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sYnLslG0vGfNapeKl06yr4lRqve9qB4fEnPycqLuwWM=;
	b=WM8TQw7ccDpQXu8hmvRDE5j1MmUyoikK68dBmkw0XRjUcZw+oHWasrM9dSsAtVPaqmAP
	 BliWs9X0R0Okkrs0AqQa0OA148dqQfIGKJ8gRj47lhyxd8XS0/rPvpgs86i2NYK3N5vNL
	 w/IL5qYJtRwU61mUV/HoUJzhsNZSc3hnoLQGaqvjd3MGy/gKpfOOz9VJ/okhhSEO/FYBO
	 lnqc9/9mtLwsI0OsQqkcOWuLlv8aUR9FpRx3myhJKEEmZuQW/VjlO/e9coE72Wf1QzRF2
	 RNypJQZilTtpPKUYNyq4qml11Bn6wYXab9qgeFGjx5PLGHh7nPfKrZg/gR0dz5/ZuQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=TdCK2pBn;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC48606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 17:22:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFC48606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=TdCK2pBn
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso1344263466b.3
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 09:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795886538; x=1796491338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sYnLslG0vGfNapeKl06yr4lRqve9qB4fEnPycqLuwWM=;
        b=TdCK2pBni02a0qbI+gKc/47MyeXmqcfHIrbwcpebpOfcO6Q4bYj1XBI/wht7Pt7yNj
         SEGnYan8L91erBI9ypXiLuR8EMtBHfJXxhmMBfSd9isXFslJcydqHSzApBMjxVFMtMxX
         uAHhYNWHSAw88KYGiMrpjbMZUXlz56PixFj/fJE0QCRwC0AXsVy3voRm9G5K2k5SzVio
         fuDp1BlJmO6Kxs0oMrJjjnepPYpTU7F8qpAWYF7jaZjxZOS4yX6iCV2BxiyEge5/WDA3
         psdEgWVjJ9tYVpaIA+e5hDaJqMFmT21ZkaIzYxlWqVYYcMnUGSEbU+xtu0f0Skflc7nC
         /b4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795886538; x=1796491338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sYnLslG0vGfNapeKl06yr4lRqve9qB4fEnPycqLuwWM=;
        b=q/guRtYnx2XfgmYlZ73UQhVtDnIhlG751gXGLIxdzNDt7+vK8GJaYUaZ5buri7nb6r
         PsGjSelLpMA3jZxamgbzyuVhy/Xj5K/u+liDSyKkMeDk2FcfpVzeCSeSO4Kqm6kpD3Dh
         39IQfx7NSG/7OAuA05yE2d3dHS8acVGbwqgYNqz+TsfiQa+SZ3I5R4HOXAVURTV2afym
         AX4fMuRZUpkHpWbciJcSwTqIHVsLZ0VADbrPTACXXrbVIYtWYlgMNFHXgPT23bfs5Qut
         pqmf79/en1vvvnKqpyy9SMhwS1k/p3P+0EAKOXGzJy8Gt92C/+t4ZE1pKe+3HDdHGrHf
         sfww==
X-Forwarded-Encrypted: i=1; AL+hErHLcljvAGbZaE5Rexg+EPveEo7U09AOCbZGt72jVRW6zXFYQIC4IO5mVX6l/r6bNrg+Qr6bC2adsd6ce9o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WhQ22d5RwZcDddOVoa6RV08DTXGF0Udzp9WjB6rGjJs5LnCH0
	QusiRtFsvgQqeD+YZqlDa3dcrfrFaEMGIbLkUSIE6gLP0GfPe+POQimznIa61QKlSg==
X-Gm-Gg: AZFdTZfmw8+wNF8rn77dnulkw9g97Qn15grYoFgooZBvrXqqJTMBFQx0YM98e45h4U9
	Xr/izMxwDLTuru+Vd6Aprea40+3oihbKSukf1ue92wvZfaU25MTIgc+uhpkHsJZhcXTv6d5/6GP
	RST/vuMqCXjgQFPLwbH/+0X+InXDbmNskLSQDRrUypVLQgToybI/AMYtKs3dwZ83c4bqOwT/Zpn
	1+Ubt7fTCcs4NbP1mpXwoEZLPwzbUMWVpFLvtaCuQIZUhvEERu+IgDNfwaxhJ4hk81X1/JFMyFP
	mT3+eTZDJ9CyEwbnE0Oxo3oTlKft5Rah16m6DCBgRn0ggxtarr9oTBEsiob61MgnjNr0W6L31BJ
	uL133HK0zbF+5LfeNE9Z9oM3k5N04wKnmgiP+wBl4zDEd+yyjWFHLDMqQxi0V1CS0tOSZFGx+uS
	+ntwm91IVvfQLve0Rv9HNtSiq0sRghStSWNBdC2fx8drwyfBGDisK573qZuxvtMKEsSeDg1Ti4p
	cQkYMhcGO6k6xuJemL16QW1Yq27nCdwvaTjiAvoww+Q2Jmyw2mWjvkCgXZKj4e6NAQ22RTxFuhU
	mT36kCgZgNgSRQDjtXhror+vQZMqJgLsfLN7mUHhK3IqmTTQQXbvHgEvZGt10LiTk1yBefdC0G5
	BssRhtLSsMHoKvB7sN1+v9fmzntPSHCSAfysMxoxYcHipoN2HHtRLaun5NvXg5kgTVt8i46QRUb
	hgHTaT2bJipk8cDUKGmPvByQ9WryZ+PQaF46xKSG0VutlvvZjhX6cs71L93iPPal1Ab2oXR4K6N
	EEMTo4wxK5JaLXebweNmnPFtT/Neefc2tTspFRrxC+2EoS5Np5AeuOhLHzK27svhPQwyv7bcANJ
	cYuqmMa1y9nvkw==
X-Received: by 2002:a17:907:6091:b0:c51:51f7:c9e3 with SMTP id a640c23a62f3a-c5151f7fd77mr1878504366b.34.1795886538067;
        Sat, 28 Nov 2026 09:22:18 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm981388866b.80.2026.11.28.09.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 09:22:17 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	John Crispin <john@phrozen.org>,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
	Muna Sinada <quic_msinada@quicinc.com>,
	Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
	Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
	Wen Gong <quic_wgong@quicinc.com>,
	Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
	Jouni Malinen <quic_jouni@quicinc.com>,
	Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
	Carl Huang <quic_cjhuang@quicinc.com>,
	Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
	Govindaraj Saminathan <quic_gsamin@quicinc.com>
Subject: [PATCH ath-next v2 0/6] wifi: ath11k, ath12k: RX correctness fixes
Date: Sat, 28 Nov 2026 18:22:14 +0100
Message-ID: <20261128172220.922376-1-julius@bairaktaris.de>
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

Six RX fixes for ath11k and ath12k. "The hardware" below is an
IPQ8074 hw2.0 with firmware WLAN.HK.2.12-01460.

1/6, 2/6: checksum trusted for frames the hardware did not check
- Trigger: an associated peer sends ICMP or ICMPv6 with a wrong
  checksum, a UDP datagram with a wrong checksum in IP fragments, or a
  TCP or UDP packet with a wrong checksum in 802.11 fragments (a station
  sets its fragmentation threshold below the packet size).
- By the code, every ath11k and ath12k chip and frame mode.
- Shown on the hardware with OpenWrt's ath11k, 50 frames per case,
  1 run each: with ath-next's rule the AP answered 50 of 50 ICMP echo
  requests with a wrong checksum and 50 of 50 fragmented UDP datagrams
  with a wrong checksum; with this series it answered none of either
  and counted 50 checksum errors each.
- Impact: the stack accepts such frames unchecked (icmp_rcv(), UDP
  after reassembly). CVSS 3.1: 3.5,
  AV:A/AC:L/PR:L/UI:N/S:U/C:N/I:L/A:N.
- Workaround: none; mac80211 offers no switch for RX checksum offload.
- Found by an LLM review (Claude) of the code.

3/6: ath11k delivers frames under a forged source address
- Trigger: a station associated to an ath11k AP turns on 4-address
  mode on its own side and sends data frames with any source address.
- Reachable with frame_mode=2 (Ethernet decap) only. On the hardware,
  an ath10k station sent 200 broadcasts with a forged source: all 200
  reached the AP's bridge, which learned the forged address on the
  Wi-Fi port. One run.
- Impact: a station can send frames as another host, and the bridge
  then sends that host's traffic to the Wi-Fi port, where it is lost.
  CVSS 3.1: 4.6, AV:A/AC:L/PR:L/UI:N/S:U/C:N/I:L/A:L.
- Workaround: the default frame_mode=1 (native Wi-Fi).
- Found by an LLM review (Claude) of the code, then reproduced as
  above.

4/6, 5/6: replay check of the group key skipped
- Trigger: a radio in range replays a recorded group-addressed data
  frame while the receiver gets unicast data; no key needed.
- Both drivers keep one receive status for all MSDUs of a REO reap and
  do not clear RX_FLAG_PN_VALIDATED between them, so a group-addressed
  MSDU behind a decrypted unicast one skips mac80211's replay check.
  Not reachable on the hardware: its firmware releases group-addressed
  MSDUs through the REO error path, which gives each MSDU its own
  status. An ath11k station under unicast load received 29011
  group-addressed MSDUs there, and none carried RX_FLAG_PN_VALIDATED
  in from an earlier MSDU. It would be reachable on a chip or firmware
  that delivers group-addressed MSDUs through the REO destination ring;
  none is known.
- Impact there: replayed group-addressed frames would be accepted.
  CVSS 3.1 if reachable: 3.1, AV:A/AC:H/PR:N/UI:N/S:U/C:N/I:L/A:N.
- Workaround: none needed on the hardware; elsewhere none.
- Found by an LLM review (Claude) of the code; measured as above.

6/6: ath12k loses EAPOL and group frames
- Trigger: an EAPOL frame, or a decrypted group-addressed frame,
  arrives in the same REO reap after a data frame of any station.
- Since commit c4aa897fe234 ("wifi: ath12k: Handle DP_RX_DECAP_TYPE_8023
  type in Rx path") ath12k sets RX_FLAG_8023 in the shared receive
  status and never clears it, so such a frame goes down mac80211's 802.3
  path with an 802.11 header and is lost. ath12k uses Ethernet decap
  without any setting when the firmware advertises
  WMI_TLV_SERVICE_ETH_OFFLOAD.
- Impact: 4-way handshakes and group rekeys stall until retried, and
  decrypted broadcasts such as ARP, ND and DHCP are lost. CVSS 3.1:
  2.6, AV:A/AC:H/PR:L/UI:N/S:U/C:N/I:N/A:L.
- Workaround: none.
- Found by an LLM review (Claude) of the code.

I used Claude (Anthropic) to help write these patches.

Changes in v2:
- 1/6: also leave a frame reassembled from 802.11 fragments and a raw
  A-MSDU to the stack (Sashiko, on v1 1/6).
- 2/6: also leave a frame reassembled from 802.11 fragments to the
  stack (the same finding); read the new flags from the last buffer of
  the MSDU, as ath-next now does for the other MSDU end fields since
  commit 1e678e37ff13 ("wifi: ath12k: fix decap of MSDUs spanning
  multiple RX buffers").
- 3/6: result with the check run on this version.
- Rebased onto ath-next; discovery lines reworded.
- v1: https://lore.kernel.org/r/20261122210525.2076058-1-julius@bairaktaris.de

Julius Bairaktaris (6):
  wifi: ath11k: only trust the RX checksum of a frame the hardware
    checked
  wifi: ath12k: only trust the RX checksum of a frame the hardware
    checked
  wifi: ath11k: drop decapped frames with a source other than the
    station
  wifi: ath11k: clear the crypto flags of the receive status for each
    MSDU
  wifi: ath12k: clear the crypto flags of the receive status for each
    MSDU
  wifi: ath12k: clear RX_FLAG_8023 of the receive status for each MSDU

 drivers/net/wireless/ath/ath11k/dp_rx.c       | 124 ++++++++++++++++--
 drivers/net/wireless/ath/ath11k/hw.c          |  22 ++++
 drivers/net/wireless/ath/ath11k/hw.h          |   1 +
 drivers/net/wireless/ath/ath12k/hal.h         |   1 +
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c |  17 ++-
 .../wireless/ath/ath12k/wifi7/hal_qcc2072.c   |  11 ++
 .../wireless/ath/ath12k/wifi7/hal_qcn9274.c   |  12 ++
 .../wireless/ath/ath12k/wifi7/hal_wcn7850.c   |  12 ++
 8 files changed, 188 insertions(+), 12 deletions(-)


base-commit: 18d0bedbb5f0538396cb7f763ed9cd1dd69c5b23
-- 
2.53.0

