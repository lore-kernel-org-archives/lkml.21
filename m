Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441814;
	b=xICUtUeqbKr/AffPaPlrdXRoXwK/YSEiqvGQivQEQQOH9H3tJTOOwjF3cLEj6jz9rhFH
	 TfmDSZkW7Heb1xtPI5p13Er8/CMX1m0EkJF24NCVyFGhq1bBH3k0REHHrUeSJuyo6evZc
	 yfFoGCbfXwpJZ7YuU72Z+dFyej9ccnbbFx+mRzqLb93QHZfwwoU7ClXkHmABfMVetj1sm
	 1pnU9RSBzhjCfNiI9u52yZ9Wga+nRkC9l2IF8xrcHZ0b3x4wd5mqrgz0z7zh+JZgZ2p/4
	 NFXzmygXLnQMwmK1JQ9dHjQ/BgVsa0mVQwurtS4FA/eptyfoKg1MFVfe3fuUGTnHI/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6HVhuJO5sWXcG8AHtCleMZpnq8VDkE7D2E0LYlxDAms=;
	b=xkfHenqbxaqs1tsgzyNNsDSc+qH4nIBJtOy4yP8E0vTN7o4VMm/CCGBxpZMt66kMYONQ
	 oP146vQnhdpokQiacPCixJvTzv+oGccBlLktC09cdegf+wZhUU384GRCDSWntQPmLt5nE
	 CQRJNroevUeG0KRQL5hqh+JU/eFqkHYCc7PwqDaxbNFTILYKmBm5aPxrH526sCfGqPQ3O
	 D71RzTEy8OejEktJFgpuxq9Sc0SDjY6Y82K/UN9yeOLkMBS8AtC51N0RzJG4OQ9VypkX3
	 G89Vm5ZZkBpIL22C0PU1YJsN1KxMlbTgi5pJuFvoAaKpq4pxmcYD4K3/BCINwH7EMfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=fmXruYz0;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D32606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3D32606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=fmXruYz0
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c50e26763a4so609871666b.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795441812; x=1796046612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6HVhuJO5sWXcG8AHtCleMZpnq8VDkE7D2E0LYlxDAms=;
        b=fmXruYz0deYCehGg3JbGZElk1YjeENCV/exDiYalJBTQroow8nfTEnk1HZYxno4lim
         jexGlx8D65vlURBxPfm8ACsN6B0i1PWsJCevjwYqcp0YMcik09ehcaf60jQlQVfuHyIT
         nGLPG90HWarEaVMMr8jeCqzM5RIfSuxCEdS50mlTApbxnU5nes+Z9FAx//udGj1aL2Iu
         OCGa8NRbcoit0LgstMvmEvUkBs2R5/60Ax+YvoXhUfkd5SBnqn4+nCFqe4t8E8YiaM62
         qK0YmAXR/ycvI+ksGTt8TcC6uADey7WFFPoofQ7twPmjS9NCo6n9+6vwLq/GkPtFc86E
         tL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441812; x=1796046612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6HVhuJO5sWXcG8AHtCleMZpnq8VDkE7D2E0LYlxDAms=;
        b=WnbWrs7jQEYeYNP0Q5/og+gvilt5F2ML9hYAJdrHUGJZ9+NY7kpELhfczt+Gbez3dl
         XTgI1fDOSgEthwmZx2Fl+8+z7kRaAIPvtsn9Z4kIlo0Osk6Q8pBVUa81tmZwga/Spyqj
         I53jD4Eh1EfP13z6X0KjCqOFIbbgyeVJWyo7uNWlj4xYm3MrSBrBbmoLeXwDQhL+NFmm
         PGJflvZsp3EHWMVQk/fhveS/bidEVNNqfT0Ex/lyPshPeWdgE4dcmQDMbrcEqxmhXGLa
         10aTbjaNl9nGsBlhvNaK5itGOESzZ8Ywz3tLd/Je82AE2K2hdvYxX1Yn11i+W0Ufe6Ov
         h0Sw==
X-Forwarded-Encrypted: i=1; AL+hErEB33QDeGw8aKv2Xjgr7LaagjGQWtJYlJswCkLPCZ8AcdRP3x3xM54HDcuHHG3lKf+HdUpBcJghyFdJKpo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WE/7vHcDoMTJJA8Zlb5IAU1fSt6FYAzbfpF+OCNlinztTSnih
	mnJ0kiQrExJidQ+Z1JuUwQXvxl4M7cu9MAsjEiHNU8wJkRaArBXJ6ttszUEMGHSefA==
X-Gm-Gg: AZFdTZdmqGbvejxkGNfBzMN0yAks848YhUgMoaENO+KTusad92Zh0BVviyuAiLh1SNM
	LnJ7OhYNNoRTNJBfBFeQVqAJqo8vEjtkUdYDEv8YC7z1fLDaWvq4fLQTAn0UUpYej6rdhRin1/1
	bMMF0jsHF4lyGBiEBcfEhpFRAlVYEnlTzU/0Y3H3nuoFfzizm6sZHPYIdCb5tT0bnuvKDesFjt8
	S2vCJlpxpD9ACowcnxZ7Yj6Gjj+YWzpq89eT7HS39AMJ2KCK3XNBgNQDDqOsgF4JvgmZMwRCaQD
	Z8KH6SlRPQTSlqlaDzOeJ71u+PYTFvDad95Ul16HknxdwY905Zmfnjy0WZ4c340sapgXZbTFnLb
	0AQhJ8pSsUtZPovFkSf+B3MXxMuXDQEcyWqOGpkn3HSivKH+U7t/g0juvCpnVo7ZlWgyDzTXzfB
	18TCdmByx+6XxTL+GP0PbafWUENU7ccAxGuROSWZBSSyuifJDSkXWjRy7QZ7KN6F8/op2XFQwxL
	y68jXw1vIN4qAb1a+F2G7CKA9eGyywoCpRyHoARURS4ZePIZPVGsogP8kwDr+aOsbc3VEC6w041
	GkZRQ9oTQ2JatQ8VxVMW72oX5xgTMFk60cfedf4DutFQXjt2V48f3beVaVtieInfUqHgCBIdHE8
	Oc/8N6aetb1f0joTtSwdL1PtE4Rw/9AyxV4Uyc+PSfmpqwzOTxbI+ihE+PM+D5Fq70W4DGEXjrC
	VoXFO083IS1SLvet81Ob9MmrE3NlaF4rewRqbcR749P3xoM+IWcCVrBVp7as8L9amUt7nifKSZV
	2b4rCesmjjgAfKBUdFb4M6HhmakEQQXXi2D+xnzsRgpKeudgJafOuLw/DLC/SlLjgXbtvoeA6hT
	hfub1FXSJFaRUREA59lXCb3HYLopmN8SuQpBx9d6+O+DNQNhMuvXrs0g7My/5zZhjrpFjG3c/Q=
	=
X-Received: by 2002:a17:906:8a63:b0:c1c:4a80:30c4 with SMTP id a640c23a62f3a-c513a99a66amr712771366b.11.1795441811767;
        Mon, 23 Nov 2026 05:50:11 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f247012000e9a6b19fb24a0d13.dip0.t-ipconnect.de. [2003:f2:4701:2000:e9a6:b19f:b24a:d13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8a4sm5357732a12.21.2026.11.23.05.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:50:11 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
	Sathishkumar Muruganandam <quic_murugana@quicinc.com>,
	Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
	Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
	Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
	Govindaraj Saminathan <quic_gsamin@quicinc.com>,
	Wen Gong <quic_wgong@quicinc.com>,
	Carl Huang <quic_cjhuang@quicinc.com>,
	John Crispin <john@phrozen.org>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Subject: [RFC PATCH ath-next 0/3] wifi: ath11k: merge the TCP segments of a station in the REO reap
Date: Mon, 23 Nov 2026 14:50:07 +0100
Message-ID: <20261123135010.721107-1-julius@bairaktaris.de>
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

With Ethernet rx decap, ath11k hands every MSDU of a REO reap to
ieee80211_rx_napi() on its own. mac80211 runs its 802.3 receive path for
it (station and fast_rx lookup, station and netdev counters, control port
check, internal forward lookup) and passes it to napi_gro_receive(), where
TCP GRO on the netdev parses it again and adds it to the aggregate it is
building. A TCP upload of one station at 850 Mbit/s is about 70,000
frames a second through both.

3/3 merges the consecutive segments of one TCP stream of one station and
TID of a reap in the driver, as GRO on the netdev would, and hands the
run to mac80211 as one GSO frame. I would like to know whether this is
the right layer before going further, so this is an RFC.

Why in the driver and not GRO per MSDU: on a Xiaomi AX3600 (IPQ8074,
four Cortex-A53) routing a TCP upload of one HE160 station at
852 Mbit/s, without the merge, a CPU profile (one run) has the GRO
functions (dev_gro_receive(), tcp_gro_receive(), inet_gro_receive(),
tcp4_gro_receive() and their helpers) at 7.9 % of all samples, the
mac80211 802.3 receive path at 5.2 %, and the second peer lookup that
the RX cost series [1] removes at 1.7 %. With the merge, in a profile of
the same upload at 814 Mbit/s (one run, with further datapath changes of
mine on OpenWrt), GRO is at 1.0 %, the mac80211 receive path at 1.4 %,
and the merge functions themselves at 2.7 %. The driver already has what
a merge needs per MSDU (the station, TID and receive status of each
frame, in ring order) before mac80211 sees the frame, so joining a
segment is one header comparison.

What stays per MSDU: every frame still passes ath11k_dp_rx_process_msdu()
and ath11k_dp_rx_h_mpdu() before it can join, so the run is built only
from frames that would take the 802.3 path on their own. A frame joins
only with a receive status identical to the run's (so the decryption and
PN-validated flags are those of every segment), with no FCS or MIC
error, unicast, not EAPOL (those take the 802.11 path), not of a
4-address station, in one buffer, with a TCP checksum the hardware
verified, and with the Ethernet header of the run, so the source address
mac80211 checks is the one of every segment. ath11k has no decap offload
on mesh interfaces, so mesh is not merged. A frame that does not join
ends the run before it is handled, so order is kept and nothing is held
across reaps.

Counters: 1/3 makes ieee80211_rx_8023() count a TCP GSO frame as its
gso_segs packets, fragments and MSDUs and add the headers of the merged
segments to the byte counts, for the station and the netdev. It also
fixes the internal forward of such a frame to another station, which
today sets ETH_P_802_3 and the network header on the MAC header, so
validate_xmit_skb() fails to segment it and drops it. 2/3 exports the
netdev a station's 802.3 frames reach (its AP_VLAN netdev if it has
one), so the driver can decide as GRO there would: no merge with GRO off
or an XDP program, a frame list with rx-gro-list unless a local socket
takes the stream, else a frame with fragments, up to the netdev's GRO
size.

Alternatives I see, and would follow if preferred:
- a batched receive call in mac80211 that takes a list of 802.3 frames
  of one station, does the per-station work once and merges in
  __ieee80211_rx_handle_8023(), so every driver with decap offload gets
  it (ieee80211_rx_list() today takes one frame per call);
- keeping GRO per MSDU and making each step cheaper (a hardware skb
  hash so GRO finds its flow without hashing, no second peer lookup,
  both in [1]), which keeps most of the 13 % above.
ath12k has the same per-MSDU path and would get the same change once
the layer is agreed; it also looks the peer up twice per MSDU (in
ath12k_wifi7_dp_rx_h_mpdu() and ath12k_dp_rx_deliver_msdu()).

The merge joins only frames whose TCP checksum the hardware verified,
which relies on the RX checksum fix of the RX correctness series [2].

1/3 and 2/3 are mac80211 changes, for wireless-next. The merge acts only
with Ethernet decap (frame_mode=2); with the native Wi-Fi default nothing
changes. The series applies on top of the RX cost
series [1], whose page_pool RX buffers the fragment form takes over and
whose single peer lookup gives the station of each frame; [1] applies
on the RX correctness series [2].

The same changes ran on the AX3600 with OpenWrt's 6.18 kernel and
wireless backports, together with further datapath changes of mine,
with frame_mode=2. Over a run of routed and bridged TCP up- and
download, IPv4 and IPv6, with one HE160 station, the driver merged
14,640,275 segments into 1,359,382 frames (10.8 per frame), and the
kernel log stayed clean. Station to station on one radio, the stream
that mac80211 forwards internally ran at 3.8 / 4.3 Mbit/s with the merge
before the forward fix in 1/3, and at 83.4 / 99.0 Mbit/s with it,
against 81.6 / 99.5 Mbit/s without the merge (one run each; the second
station's link is the limit).

[1] https://lore.kernel.org/all/20261123134137.718575-1-julius@bairaktaris.de/
[2] https://lore.kernel.org/all/20261122210525.2076058-1-julius@bairaktaris.de/

I used Claude (Anthropic) to help write these patches.
I have reviewed the commit messages and the cover letter myself and edited
them where needed.

Julius Bairaktaris (3):
  wifi: mac80211: count the segments of a received GSO frame
  wifi: mac80211: tell a driver the netdev a station's 802.3 frames
    reach
  wifi: ath11k: merge the TCP segments of a station in a REO reap

 drivers/net/wireless/ath/ath11k/core.h    |   3 +
 drivers/net/wireless/ath/ath11k/debugfs.c |   4 +
 drivers/net/wireless/ath/ath11k/dp_rx.c   | 444 +++++++++++++++++++++-
 include/net/mac80211.h                    |  17 +
 net/mac80211/rx.c                         |  70 +++-
 5 files changed, 530 insertions(+), 8 deletions(-)


base-commit: 1983b40acfcb3c3464b291c85977290a785bcfdc
prerequisite-patch-id: ed566369a9bbda0ac9a48357261e8cfe1cc0f1d1
prerequisite-patch-id: 726d7737c833da0842192eccececad4a0dedb1a6
prerequisite-patch-id: cf0b8ff1ac6cef681433247e4b937a3e23af78a3
prerequisite-patch-id: 03c89df01745ac9a80653431261f9a003dbca7db
prerequisite-patch-id: cb48c0eddbe0c2fe176e8edc94c6bc40be3c48a9
prerequisite-patch-id: 1956ec85ad80b68868538070fc0e89c29603467a
prerequisite-patch-id: a66e3c439fe1341f83075e5687361fdb197cfe5a
prerequisite-patch-id: 3e5becdd444369ceebf7128696f32b9c7575cdae
prerequisite-patch-id: 09d8e8e4d5db48209df13c50b0bceadc913f1b36
prerequisite-patch-id: a665dc2d623226337224372a5bc7e3e78be9c96e
prerequisite-patch-id: 7cbac21c92659e4da6c3e708271517b65d7a5272
prerequisite-patch-id: d615376a310af6a446929dd935dfa6d7576b7cb4
prerequisite-patch-id: 291642da9c3994bb7deacb428c37d0ec8eb121ae
prerequisite-patch-id: 09359a8fb405612c1ef37addfa8a8518bad32fcc
prerequisite-patch-id: 7ef0f31a73ea2a5c875e2c1a233a4db18c4ed8d1
prerequisite-patch-id: 5d75f6dfac0bc5ccb54a9e2fdcd0583381c158eb
-- 
2.53.0

