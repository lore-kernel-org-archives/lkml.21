Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795556441;
	b=aNntckPgrhTGtxGO2CM5wK0oeNZIuSj5oARoW4ZPSlxkrP+6i0gSWDFPpSFSpp7/PuoG
	 y+OWAehokhs50Q/Xi8A4SthRnqirCWBheqYPG57f9qQswqfH7my6WG0Y7AFLR4dBWgOMZ
	 eQO5ziArACKA33D3kVjEeMkBSI3yb5t17Rg0yjfpBxZKmoDfpvyQOZetS0RtKXjEvxzCf
	 yXV5YoSkxdVQwxTbdeOaJDzZuBvBa8cI3ed4NY1kHBhH7u4Jy8yEheJbYMfFdQD8E45SY
	 UO9HpX8gU6u/4/SxQqc94P6Vr9WFfIA/cdhNzKvmJgTW4FGseSBUZoYwiTzCVYVl/Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8vTHmqosNip4PzWeUJYtggJ3iETjixMqdrHE7e2DIQU=;
	b=gmB/dDI9Ze4KgNKwxZlCouaIdHzMsl0kfP3YObkFdP1qMRAg3YFmrhdBG2xgTxEHnJ8Q
	 OAw4lMPTLKkeY/iqoVagIIVoFLMG4eBD3M9nCBQkYaYsPDh2OwOCDS/nYGF0P4jn8nci9
	 ZyFCHTc64i5nOEm4v8N4Uq5ejPuB06e3/gZ60AHFa1YZgrKfwzRv9Nz+H7cSXdaM0+DL7
	 SRIi4/lE7zz7h1/GBVyc9Vn9hSbRvws6HZEAe/WW5nWKbFqZ02wVkDuYzm3I5528TSiGW
	 tNMEFbzFxF1Mnx8Xg+MOynD/xm+Bar738JZXh3pTKxtF6+FZ5Qa9PN90pVnOkmgTRAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0dm8TZPn;
	arc=none smtp.remote-ip=209.85.222.54
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2E6606A336
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:40:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB2E6606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0dm8TZPn
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-9828fee1b4bso1583525241.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795556440; x=1796161240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8vTHmqosNip4PzWeUJYtggJ3iETjixMqdrHE7e2DIQU=;
        b=0dm8TZPnqEQFkRwrXxHnx5HZPGepIu1i6nigAX8fz59SVnfIllA8zMxlg3Qi9rP5Cg
         7ClvnriYq4VPEpzMNIS3/f8hggdOpXqQdl3PPfA2Oj8Hjl2Sa5Hbfhfp334XFOefTygp
         sObv+L1JJcptSBZf0n86Jfe7pgshaMgdFHPa9w3f6WSQSS2lDo1kvreb5PZYZGOfASXS
         2Uvxd/y/Aar6NS3QS/KoCASWJJLTnEj63HO7XKyBhwG8JvCGCZeyNduZeNG7776oJVTb
         5sqlxeuIzjpa5Jj0XO9Mrd4a0Wm2x+0wKX43lKE5COetTQqfkPwO//WKpKovDnUblHZo
         uWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556440; x=1796161240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8vTHmqosNip4PzWeUJYtggJ3iETjixMqdrHE7e2DIQU=;
        b=Zi3fIba1chaHdfKKwS+bc2DlEG0boFXv79Kwe8kuyR6z0WzJM/M8MVN/VHvXSCEi1L
         VQR3dIXQkDIzc9A4rSIiXBi9MfYi6kNjEaUjAgXTc5f3JQFwJE53ztWOuBEewQkz3GW8
         zykQ20k8CR/u/xlfbJZFTW+nQnuIx2dNixH/mKqEgyFl0TXAT+Myl+UnZldIfr1Ub+Jl
         ql98d2ODgunxmXT0QMQ3cAvG1cp6XgpL9p656M3PwNFcawbrTwtzYBkv/G4L0/PbMJrR
         LL2BIe2qHzGddZFfb7AfDtxC93HmSX99HArStG3Qo6tkYpS/EXIAmDwt31WOfJS5FnkE
         p3lw==
X-Forwarded-Encrypted: i=1; AL+hErHkZsSGEkSF+0NSLfN5EeJTQL5hmeJceQA6V/0gX/i7dUFtQk7USCJivBxpdmrHRO45CTPHuhqwmWFfcIg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nu78EYI9U8KUE2oU2pnvt0G3tUVrHgQO/oW7WtEfTqr5d/b7M
	npUGRybMFrquAwTW562EEhaOm6GYMEQ51t3IP35GtKfBGs8Uh9UAOdEf
X-Gm-Gg: AZFdTZfNXUb5lEuZ1DorC6rhZQyzj0RxDW0brGsyB/fIxQaINElrBPT4+bpD1Z90/Qj
	hqxvAh58SFMfQ/6Fbv12nThMD5LKPYBOaXs5J/i98taIRr8O6xnPNRerJm2gmD3BEQEiJzkc/rX
	rXylewlOVBu84qW08OUMT3bbh0EkNTX/SX90BSh5VrSguL7OcjWzUpsRH3UuTttWvNnD2oX3mHa
	H5OFkVsb9AwSrUYUXmmuyGHXi8hXWXg2aOTkWJ/28f8dL+jPzvj0B6C3rGFb/1TnO+D0ybDKVI6
	bsKR/bCJPJKDC9bz3wOgZEcABqeFgssO4o1Hc7eNlOcbDhSvuKc3lLmWoPXBIXIH0qhJ9X37OIV
	OWGGSYWuTm+NNTiUA5Y8uAZSlKIGzGHwskuzfRDGSisdbk7u6I0hyxF247VQmskBv7OVJKbXkVD
	EEtf6FjTtNFvXpYuFtz1bcirRC2fn+cSQ3dlPbHUxW6mL4a9/VUucirN6azbEdYtNNITPA3zSnF
	gUu87/v3uxfFCI6qgcmpWG89PbkCZA0s+YQ2d+ZZ2ufTCzxDfyDmUvaRV48pyJrqVFJbZao5PoR
	N1Phrc4rwhRLq5iaMeB3yfTnQyWuYjA6CouC8qadzvonpg8jCW7h
X-Received: by 2002:a05:6102:292a:b0:7a6:d11b:16ea with SMTP id ada2fe7eead31-7d73935fb84mr8027697137.6.1795556439674;
        Tue, 24 Nov 2026 13:40:39 -0800 (PST)
Received: from emedev.tailf75c28.ts.net ([179.238.117.100])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6dec57ddsm15952879241.1.2026.11.24.13.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:40:39 -0800 (PST)
From: Emerson Busson <emersonbusson@gmail.com>
To: Wei Liu <wei.liu@kernel.org>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Dexuan Cui <decui@microsoft.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Kelley <mhklinux@outlook.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	Kameron Carr <kameroncarr@microsoft.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-hyperv@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] hv: vmbus: make rings and host-visible buffers survive buddy fragmentation
Date: Tue, 24 Nov 2026 18:40:26 -0300
Message-ID: <20261124214030.174246-1-emersonbusson@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Opening new VMBus channels or subchannels can fail with -ENOMEM under
memory fragmentation even when plenty of order-0 pages are free, because
vmbus_alloc_ring() asks for a single high-order contiguous block (order-7
for a 512 KiB ring) and vmbus_alloc_requestor() uses contiguous
allocations for its request array and bitmap.

Based on Michael Kelley's review of v1 and the v2 feedback from Wei Liu
and Michael Kelley, v3 goes back to the core VMBus allocation path. It
groups buffer and GPADL state into struct vmbus_buffer, allocates ring
buffers through vmbus_alloc_buffer(), drops struct vmbus_gpadl along
with the duplicate decrypt/re-encrypt paths, and switches requestor
metadata to kvcalloc().

Changes since v2:
- Dropped the reclaim workqueue, UIO page-pinning layer, and KUnit tests
  to keep this series focused on VMBus buffer and ring allocation.
- Split the hv_netvsc fixes and allocations out for separate net /
  net-next submissions.
- Preserved hv_netvsc's revoke-failure leak guard before GPADL teardown.
- Rebased onto hyperv-next.

v1: https://lore.kernel.org/linux-hyperv/20260918014017.2536753-1-emersonbusson@gmail.com/
v2: https://lore.kernel.org/linux-hyperv/20261007190752.336426-1-emersonbusson@gmail.com/

Tested with x86_64 (W=1 C=2) and i386 builds, a local QEMU/KVM boot with
lockdep enabled, and a backport onto 6.18.64.1 running live on Hyper-V
x86_64 (85 VMBus channels, 12 netvsc queues, uio_hv_generic loaded).
Confidential VM paths (SEV-SNP, TDX, Arm64 CCA) were compile-tested and
reviewed by inspection only.

Emerson Busson (3):
  hv: vmbus: encapsulate buffer and GPADL state in struct vmbus_buffer
  hv: vmbus: allocate ring buffers via vmbus_alloc_buffer()
  hv: vmbus: allocate requestor metadata with kvcalloc()

 drivers/hv/channel.c            | 363 +++++++++++++++-----------------
 drivers/hv/hyperv_vmbus.h       |   4 +-
 drivers/hv/ring_buffer.c        |  17 +-
 drivers/net/hyperv/hyperv_net.h |  10 +-
 drivers/net/hyperv/netvsc.c     |  64 +++---
 drivers/uio/uio_hv_generic.c    |  97 ++++-----
 include/linux/hyperv.h          |  43 ++--
 7 files changed, 271 insertions(+), 327 deletions(-)


base-commit: eab80895d447ec164a1d91a1ab377bd3a9dc9044
-- 
2.43.0

