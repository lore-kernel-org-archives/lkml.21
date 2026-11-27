Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795738608;
	b=zGgg0rZrYiLB5ymVn+krsu8vzDSG9mEJ+E3JWLLTSBVwXPK1c+iQ7hbMmAeyyvCAzcoS
	 QHgfgQtMxYNNzZoux3X+NxVSOn96+bzdwOf3RHTTZNtKSvyGG29IECJsVOjC78N9ngs0s
	 Wab6zSKfTDErjLz2dr61lgW56sytjqbpK3yxgYYQxVKfW4bZKD7UI5kN/xNjnTGdE2j/t
	 W4nSMb2f3r2E+EVvENyrb1+C9pl6op8VDKy695iUS6EWsUpLlhHKrfl21AaZoDG1u+XB1
	 niVV83HAX6rhyn4P+rAv7pjsSCihQ+ILsUgpQSsze+yWAn2XnM93LJQ8X+GapApe+Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795738608;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DaucjX7EGKxhjPytfA6PE6Q1xmcvizrq4bihC56pvSM=;
	b=qs+Rw2XvzqWF/Oa4cmIfq7bFeEZGpUPM/GZBIu0p917pK4mll6Irry3Lp6qJ7IMcLxtN
	 GXUaSo5guFhhHkfTLCgD72U8PgRfzoGFb4LZ7f5M0pYKiVW0Qb8hcknhcL/54AcLa04kp
	 HNYITLbauj2UKMbq+qel340te3YDTdaBa4alD3NwpqSc+NKLreDLsFxZGru2ozvfYeWEx
	 LwNNi51jHcWdqpKuvzbWwk6wbEz13CimhXA2GxQtBXl2Ve/RdcgiUHmixiFqlECGyUNma
	 xwWXaBYjfRbEWAEe1m4/CgY6bESrdue4FG290V++Enb0uX0P18L3dg3d6xL7nrA7nwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lwLIWbsQ;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803C5606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:16:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 803C5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lwLIWbsQ
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso40557795e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795738607; x=1796343407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DaucjX7EGKxhjPytfA6PE6Q1xmcvizrq4bihC56pvSM=;
        b=lwLIWbsQhHcHN3CDna52sVsq9gSO9DJklq6bzGLe3Els2E42gC4pjSTwi8CBXWLj69
         Y6xmDtc6vsito++1VpPJRTsurb0wgyvDhyMIg+LD/l26p52SEGOkBsnM4H/sadwjMOqP
         yqZVtUrGQauUYqpHZDGlRuUHH2sCLzuOyxWAaDjFw2nfdIdTw3taHA64sqf7Z8bP4d13
         8Z/U3f1HmgsK3yj/WRRhDbndUus2MBgUPvB2KPMI6ZVKHsF+COYApylXIc+drZgLM/Bk
         Ed4rW/K8emw3n7dCq2ap1AUGQmklHOyJbD33q+73qeC/NDNq5fnm2CwdYHjz+hEdCPim
         22Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795738607; x=1796343407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DaucjX7EGKxhjPytfA6PE6Q1xmcvizrq4bihC56pvSM=;
        b=EY9YskugBeDkgHc25wlUjZSvcQBCdIns4veFDr2hcDzuZvMh5bbskjex92NXFU9Vcn
         fhVTI6glwWq6uAvPuGWm+9zS4Anm/ivScrmeoihgqTdhFIq41NR8yrLM4Gxp7MbV0lar
         /q17G2bKrtlOCqg2UxUYXeA4vbadXo/b3hD2S/Syv6epD7hyxBR7e81YxOD3c31dUssS
         ad+aM9hQXG+O5xl3KBNPQ4cWQ+7++Jtdh8J/Gcwf94lvfuQbGTUKWSDwulUtbzzayLqz
         0EaNNBwgER3/cxNNxWicHkL2O01y7eLWDJWY2Nmfr/MXRoSIZs6IJGvWRnZx13I0C8YI
         XyBw==
X-Forwarded-Encrypted: i=1; AL+hErEh3v+0FvkIC4cngLz64Z1XRjDxrJ4GsNAdV8G/ps5sngjO1hE1+dUjT+PiZwrSEec3TVyZosPRxj3htnI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jRtpNmfEbR2aq4b2HBG5NWjPhPdzBtYN7lUIj48eXlu62Qj/a
	sfW16TGpKCe+CJaImk/Oxvu+lRuIvKHX0yK4RuNVWPVRl9YZR28cNs0=
X-Gm-Gg: AZFdTZdCkdHBrxBypHeAUM1wI8QdN8OgX7vEShqQqru3t/ZUXV3I/QUDlU2r0P/ZYmm
	mKNhob/gBqgsfUh85U4w0yGBtNNiDPaI8HRB1nTt5i8ZI3cM30ctKSXxJ8yQY/bO1K4qbFT2Ixf
	FPZl3ywddBh+ocd21R+IxwkTV1Z9bTP/gD6dmZa3/FmvCX4lpvgBI/VFolqAyGtK3+UJPhP3Rkx
	ZK+rcBcMgiJSMjpu9D3qA0HQu8qQv4Y/l5mIUX6NePLBmsSoIpCSNX9nZAfpZFnLd9ws5Zho250
	/mdBcq7QwFTTXpV2GpkFtUG3mD+Rbnhdvy6gEEfgCjkBNGmiy6aHrKwIT8l7cJo84lwWyo4nzr8
	CgDI73GPWtZVvmtuMHZNWdjCxu7OGkyF8hjl/0MxUSw3koYERso/9/OM6PrVxxhwFuUjy10VUTT
	Orffjqur7onHbjJp3BWuI0j8ElX7oOvoVKonQluEGzRpWdMlezEkT4PBtl3gFx3Vw6tLpq6KfyP
	kOsKtHGAf678XyHTssC6XtrbIa8rWa57Js6NP6QqrVX8rsrB+kv15M6SH6OZUMtvnVuvCdgcl09
	3RCOo3NRUJff58Y=
X-Received: by 2002:a05:600c:3f0a:b0:4a5:75d2:c104 with SMTP id 5b1f17b1804b1-4bb8880cde7mr439388735e9.22.1795738606729;
        Thu, 26 Nov 2026 16:16:46 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906d6a13sm356650865e9.3.2026.11.26.16.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:16:46 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>
Cc: Phil Sutter <phil@nwl.cc>,
	Christian Brauner <brauner@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	coreteam@netfilter.org,
	netfilter-devel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v2 nf 0/5] netfilter: pin file with get_file_active before reading f_cred
Date: Fri, 27 Nov 2026 00:16:32 +0000
Message-ID: <20261127001637.1026589-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

From: Tristan Madani <tristan@talencesecurity.com>

Five netfilter callsites read file->f_cred through the
sk->sk_socket->file chain under RCU without pinning the file reference.
Since commit 0ede61d8589c ("file: convert to SLAB_TYPESAFE_BY_RCU"),
the file slab slot can be freed and reallocated within an RCU grace
period, so these readers may observe stale credential data from a
recycled file object.

This series pins the file with get_file_active() before reading f_cred
and releases it with fput() afterwards, matching the pattern used by
the recently merged cls_flow fix (commit 59cf9e6f48e5a).

Changes in v2:
 - Switch from get_file_rcu() to get_file_active() per API change
   (get_file_rcu was removed; get_file_active is the current API)
 - Reference merged cls_flow fix (59cf9e6f48e5a) which uses the
   same pattern for the same bug class

Tristan Madani (5):
  netfilter: xt_owner: pin file with get_file_active before reading
    f_cred
  netfilter: nft_meta: pin file with get_file_active before reading
    f_cred
  netfilter: nfnetlink_log: pin file with get_file_active before reading
    f_cred
  netfilter: nfnetlink_queue: pin file with get_file_active before
    reading f_cred
  netfilter: nf_log_syslog: pin file with get_file_active before reading
    f_cred

 net/netfilter/nf_log_syslog.c   | 28 +++++++++++++-------------
 net/netfilter/nfnetlink_log.c   | 35 ++++++++++++++++-----------------
 net/netfilter/nfnetlink_queue.c | 35 ++++++++++++++++-----------------
 net/netfilter/nft_meta.c        | 16 +++++++--------
 net/netfilter/xt_owner.c        | 27 ++++++++++++++-----------
 5 files changed, 72 insertions(+), 69 deletions(-)

-- 
2.47.3

