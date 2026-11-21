Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795285625;
	b=u/s8xFWW13WRuQqX920wZQ5QCEFPLm+n1O+jrxo0gbIUkAjRipAprNgQ197HP0oh0H9G
	 XeAk8CoUeZUDjlp/HiEhZCrlMWv636eas8O6WG4oh1dCBsWm1SULbkLb7ku0NAiW1SSsG
	 DT+HeML1prR65OeM69jltLZP+qjNhfX/8VPnoVyPXbwsBEm88UWI31K2PSljnbDfV1Bjg
	 Wrs0s3Ot2p1CsvBHL0JYIqzsqssN8YGnJ926ZVqOEIHJre/SPZr4xZyKWRJs/wfNrPhzv
	 kLRSfKXe1vA0MCcPqhaXMFW6MUDQtTYgz6qdyLH9h93kUiBLUagPlwMqJ+OqtO1m6qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795285625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qEswlKRu/m9QVt4dqb19fLYqCHJHVZ8xOxsIyuj9bq0=;
	b=uoVtFsOQLzQZv6ffi56p4GRvH/0pGWU/V41epVAOVfqkUcGoDQu15lb8uTl1ZTVN13G+
	 rLiQ2lerKwuHbxuSDlZ8kh/M5sL1p2tEudaSczMdIbubsDArUgJpvx7l3ieYZwLynuXu3
	 4Uhljkv6bNAjHEFA0iTw3kA0+UFF5J4WqD2xbxi+M4Sp5aHrvwSon1JUQGg2mwUgj8NIT
	 GKwbJcmWPF4RceS3xxqxrB9rBdHi4oJK9qfJcMEJh4stE5UVPtAX2l+MbRCRHv9BCf8nm
	 dMnw97W6FvP6XaJEh6zsuK8a/BBjaJ46XWbR15Vn9GCUhyZscse+uuht0086MgIiMHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=v0fW51fZ;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9777C606A332
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 18:27:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9777C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=v0fW51fZ
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c5127c7abd5so330332166b.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 10:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795285623; x=1795890423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qEswlKRu/m9QVt4dqb19fLYqCHJHVZ8xOxsIyuj9bq0=;
        b=v0fW51fZZ/SGc8wHJ1cKhm3+RD6J9PkbqhNgq6XuNECUhMVQaUDAEVRtVAM3hnqkYJ
         dwkeN1rv9+eSxpwci0y9LeeLRNjt4h9W3Ing/DJR/ZARxdkuXDEpWNq/tIU86Q/7qmDS
         v5M1lWbsKBWBrvy9d9K7BZ1LYFAfQHp3NITaJXhNbbBSP59o22P8JeDvlrxH4T3D4NhD
         X47bQEoKh0aBvOqxWi61Y8SGR7mWHACC+tWZx8/zzmOLp3/rog4+vQGEbXlPRbd5YOwc
         bGPB0gWn3axLCM7ZK5M1W2YgU3P22g2tJ38ZjOeBKoefUg0zuQQ5L3hmp+JUqx5q/A0o
         ycXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795285623; x=1795890423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qEswlKRu/m9QVt4dqb19fLYqCHJHVZ8xOxsIyuj9bq0=;
        b=YoR2W+TWVapG3ZX2cXjF+Q1smmj72bPvzM+ZHOInmvvhMrjt4H3BzpTPFjM1oHnJLO
         lezRqICu1CQ4FGaov3OO9OfapGu/YCDVY68V8hcyfKIT8k/XsrBGW3/PP2HscenQNxlV
         YV5J4lThiSENQxhj5xd29szRTuK5P73HI26OQC5QSqpmi60nn90AOSm4Jnsvn2YHf0i6
         54lR112Hn8JX95zwyd42qPN+8qkGKc4tnUKdMdzKb4PE3ia/Dezj2nTmdDn5mPFwiuPK
         bLQrOsCiHY/cu+np8o5X6f9+poMBp/OiFuR1yc6yrsDDft1i42i2iQR9OBxloJuadY3V
         95TA==
X-Forwarded-Encrypted: i=1; AL+hErEK7AEPdfENGb3GPbBsogG0IzSc1jL/zvjicwHk8cNLxbCTilmewsKKb5NH9rVC0Gw3PrR2wxqkHmWoOJc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8169SSs8BNMhrusOUsfa22yKtnhbkmmhXH9Mg+mPZVwWlpj/pe
	t2i5rwaVrUw2hLh3wo8rdqMyTI158GuFngRjt2wRDHPsEdcZDHzsrJIlJRO9eNLLzw==
X-Gm-Gg: AZFdTZcyGwVDGQeuClDljo/J4gAljclfrXUlrpMMy6IrdCntyzTUKkxV8Wn9Tyoo+nn
	D3qvn6C4EYNkwD2ez+6d9EBTzphxKEnhCvyVD89NiqX0Y3uuw5k3LYSzrj3/q6BCBVoSYk59hLt
	R5tNI9b5obmMQnA2ctkkjwWnqhlV8RhWmkpoxqrNAdbbXFSjs8Yx5FsGcok0Y6ZKdB0V2MbwfQH
	f2/w1s0pZahg/mslNlX5TEfxgm6rgC43GVxEozxIbBO0VdqBPo79JrpFk0NMdiDXlE9ATqPDmxv
	EWru4xQguwjg7RbeCNfE9PuJruj105FSK1ChpSaX6Gzoz8IwNd+nGWDyJIjezQcS76ta9I2ry5R
	g5RLqYw4BiAbHOXLeyQg0ftVaWE4RE4IwBxiAQvhQGtkTxZWoC+Ih+y8yZh+Xsz++WfKWIwujh1
	aIln6hWmvLgevJu/lPbD6BgNKXBhZ0rx6KKpZkQ8M7FIWqVVgsexQ1yvRT5hiQqmed/KxyxThye
	4SpN8b/byvk4lc24Dm1M7E8qA0lZ2qhYQQDYlprCeQMXcd9V+QKkojZZl8uRoaqTOx0E5n2E/ki
	URm01f+Lh+rGPjefBw7pgbeY0uJPYzQygZc581grar4aIfky4zaRWlUTpDpHhaJI2G3bacpZKo1
	Xu2juoAOKhRwU4/HbBZzMevoS43CbtbmodJp+kT7h5gt9cgVHA/nUf07dTdXjpJKa7bPkxxF7T3
	Beh+KHRabJ1kuMqk2uODJyYfF9mn3k/h6CQrrpNEwqCFUAf7pKx0fPRwMHCVHQByfAd4BIqOqDx
	96Jw0hhXwHXkG1H4ZEto/9MCffvzUf411crEQ/X1hs8qqRc1JVeFUkq4zy7VlLf/gvtnD6ZtCW4
	648zrghULBWax0oBE2jJ3QcYGFCMGVd+BpYmBqI77MJWbOm1dBxvd+Q=
X-Received: by 2002:a17:906:da0e:b0:c41:731c:534 with SMTP id a640c23a62f3a-c513a8590b8mr434863966b.24.1795285622600;
        Sat, 21 Nov 2026 10:27:02 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470dfa000000000000000a27.dip0.t-ipconnect.de. [2003:f2:470d:fa00::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b001172sm224519166b.79.2026.11.21.10.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 10:27:01 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	willemb@google.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	dsahern@kernel.org,
	idosch@nvidia.com,
	ncardwell@google.com,
	kuniyu@google.com,
	steffen.klassert@secunet.com,
	herbert@gondor.apana.org.au,
	richardbgobert@gmail.com,
	ecree.xilinx@gmail.com,
	andy.moreton@amd.com,
	alex.austin@amd.com,
	linux-net-drivers@amd.com,
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	leon@kernel.org,
	linux-rdma@vger.kernel.org,
	alexei.starovoitov@gmail.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	izaiahsun@gmail.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	shuah@kernel.org,
	bpf@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 0/2] net: keep the TCP fixed-ID flags on the header they describe
Date: Sat, 21 Nov 2026 19:26:58 +0100
Message-ID: <cover.1795284858.git.julius@bairaktaris.de>
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

GRO sets SKB_GSO_TCP_FIXEDID for a TCP packet whose IPv4 IDs do not
change. Since commit 3271f19bf7b9 ("net: gso: restore ids of outer ip
headers correctly") the flag describes the outermost header and
SKB_GSO_TCP_FIXEDID_INNER the inner one, so every path that adds or
removes a header would have to move the flags. None does, and a TCP
stream that GRO merged and that crosses a tunnel boundary is segmented
with the fixed-ID state of the wrong header.

Patch 1 lets SKB_GSO_TCP_FIXEDID describe the innermost header again and
replaces the inner flag with SKB_GSO_TCP_FIXEDID_OUTER, as Alexei
suggested in review of v1. A header added in front of a packet that is
already encapsulated clears the outer flag, and ESP transport and BEET
mode with crypto offload, which keep the IPv4 header, copy the inner flag
to the outer one. Two flags cannot describe the middle header of a packet
with three IPv4 headers: software segmentation uses SKB_GSO_TCP_FIXEDID
for it, as it used SKB_GSO_TCP_FIXEDID_INNER before. Patch 2 adds a
selftest.

The hosted Sashiko AI review of v2 2/3 of my "ipmr: forward GSO multicast
packets" series reported the issue [1], and the selftest in patch 2
reproduces it.

Tested in QEMU (KVM) with the selftest, 19 cases, 400 segments each:
- net (d5b89d55a322), 1 run: 6 cases fail. Fixed inner IDs increment
  after IPIP over IPv4 and IPv6 and after the ESP tunnel (390 of 400
  segments carry an inner ID the sender did not use), the outer IDs
  repeat after GRE and VXLAN over IPv4 (10 distinct outer IDs for 400
  segments), and a VXLAN stream with fixed outer IDs keeps that state
  after decapsulation into IPIP (10 distinct outer IDs).
- v2 of this series, 1 run: the ESP transport mode case fails (390 of 400
  segments carry an ID the sender did not use).
- this series, 3 of 3 runs: 19 of 19 pass.

Changes in v3:
- Patch 1: clear SKB_GSO_TCP_FIXEDID_OUTER in iptunnel_handle_offloads()
  and in the BPF LWT encapsulation, where a header goes in front of an
  encapsulated packet; the new outermost header kept the flag of the
  header below it (Sashiko).
- Patch 1: copy the inner flag to the outer one in xfrm_output() for ESP
  transport and BEET mode with crypto offload, which set
  skb->encapsulation without adding an IPv4 header; v2 gave that header
  incrementing IDs (Sashiko).
- Patch 1: name the paths that change the outer flag and the middle
  header that the flags cannot describe in skbuff.h,
  segmentation-offloads.rst and the commit message, and list
  SKB_GSO_TCP_FIXEDID_OUTER in the bpf_skb_adjust_room() decap flags of
  the uAPI header (Sashiko).
- Patch 1: wrap lines at 80 columns (NIPA).
- Patch 2: add an ESP transport mode case.
- Patch 2: skip a run in which GRO merged nothing before the outer IDs
  are checked, and check that ESP tunnel mode outer IDs increment within
  each packet (Sashiko).
- Patch 2: delete only the netdevsim devices the test created, also from
  the EXIT trap, and before the namespaces (Sashiko).
- Patch 2: make the receiver's -c optional, as documented (Sashiko).
- Patch 2: use slowwait and check_gen_prog from lib.sh, and create the
  netdevsim devices inside their namespace, as lib.sh does, with the
  new_device write checked (Sashiko).
- Patch 2: report a receiver that is not bound within 10 s as such.
- Patch 2: fix shellcheck SC2016 and wrap lines at 80 columns (NIPA).
- Rebased onto net d5b89d55a322.
- v2: https://lore.kernel.org/netdev/cover.1794139176.git.julius@bairaktaris.de/
- v1: https://lore.kernel.org/netdev/cover.1792857378.git.julius@bairaktaris.de/

[1] https://lore.kernel.org/netdev/179182559332.434549.18294510093742639467@kernel.org/

I used Claude (Anthropic) to help write these patches.

Julius Bairaktaris (2):
  net: keep the TCP fixed-ID flags on the header they describe
  selftests: net: check TCP IP IDs across tunnels after GRO and GSO

 .../networking/segmentation-offloads.rst      |   8 +-
 .../net/ethernet/mellanox/mlx5/core/en_rx.c   |   8 +-
 drivers/net/ethernet/sfc/ef100_tx.c           |  12 +-
 include/linux/netdevice.h                     |   2 +-
 include/linux/skbuff.h                        |  12 +-
 include/net/ip_tunnels.h                      |   1 +
 include/uapi/linux/bpf.h                      |  16 +-
 net/core/filter.c                             |   1 +
 net/core/lwt_bpf.c                            |   2 +
 net/ipv4/af_inet.c                            |   9 +-
 net/ipv4/ip_tunnel_core.c                     |   2 +
 net/ipv4/tcp_offload.c                        |   7 +-
 net/xfrm/xfrm_output.c                        |  10 +
 tools/include/uapi/linux/bpf.h                |  16 +-
 tools/testing/selftests/net/.gitignore        |   1 +
 tools/testing/selftests/net/Makefile          |   2 +
 tools/testing/selftests/net/tcp_fixedid.c     | 432 ++++++++++++++++++
 tools/testing/selftests/net/tcp_fixedid.sh    | 427 +++++++++++++++++
 18 files changed, 929 insertions(+), 39 deletions(-)
 create mode 100644 tools/testing/selftests/net/tcp_fixedid.c
 create mode 100755 tools/testing/selftests/net/tcp_fixedid.sh


base-commit: d5b89d55a322b632e2b465b392a4c1d9d338db9c
-- 
2.53.0

