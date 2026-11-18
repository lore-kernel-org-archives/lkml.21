Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795005620;
	b=EJ5ZqjgEZAe33EDcVzIrWMHIfL5YnrYYoVXgfSuVZMAbS/kVfpTIn+auJGT8u7eXmYhd
	 YNcO6T0pghRLwFolKgDk4tNpXLRUt6adpWvFjGaEOpyS+JUFKSq2UtxRYlmJBdtw2C88l
	 AQnmFbce3YobAoGF1FagNBElBUv6cdkRaAVpjOZ/CqP3tljgTXvGxvhBvSv9Z/JrE6d/9
	 YR2yX2YaEkKPCHoGR/C4RxI/zyenNpJb5Q88Mi6XD3imIvOSlH/eTk4TKZ91xlvz70GIj
	 /LMxl2friJAreT6XO7D8sRnMXjC0edrx7UE79D7sdhEH1tcs8/+uPV2jgi0tpm4ud3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5u9A3PL16118dnwDzUsQLtTXzEbAMsk2owyLQhcCKJA=;
	b=hJkPW76R2r9lhyTzgHTwJyPQP5bS+wVO4b79wBKKsdhjJrJ9I1svwQzgrx5LGKyddIi4
	 L9ohu1a5CaoI7KAuMMTYU3lpzJJz9w+o0erhTI77ixFt2N8oUMPPJ6Hqbi1JmXzgWJjEe
	 DVRV/jU6SfBbWcbv53NeevrtwpdW4En5W6irDl1oiFlnQG7uJED/0YlJJkBZy5+hqT1AG
	 RS/sq0YnkTJAA3mj6NRTZbx0fxBvGK8sDc/4+VE8z4RmvZTnXCRM3AoMFjs3m9q8MqN7Q
	 +rhBbTws9GElqUKfuAmDdP5EtO13qDyl+f15qJoaJqW9kgunYqEsbEOBSLnZD4ZlTOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fjXVeMEP;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43263606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43263606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fjXVeMEP
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso515003a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795005618; x=1795610418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5u9A3PL16118dnwDzUsQLtTXzEbAMsk2owyLQhcCKJA=;
        b=fjXVeMEPXANBKTkfuitkhxYl4brjaF4kq+WAE1yMT4ZeBGhEKJ9Rag192Ozcpj3g9s
         ZyG2it/ZAVFK+Gdag4q3vNXEFSQZ7TErvrgKKVa0zN3tsRoSAjd477wvZz00KsLYB/fK
         q/GYPIjen06QV0sT8lPYehmyRMiwJTavo7fPnS2ffcB2D+8ezhYJRpgGb15D8gcjxDBX
         vGsYEjKxFYVk8aviP2acTMSq75ELzaRz+jRDFRNulWvTza3el9/K7Br0B2PG5mTEVvbE
         0/SRCQdFrmonZJstIJ3DHKo7Doo2wPLavTa8cfbT1EhTB4TvneOG1SPzgNGR/jwlL0sA
         AVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795005618; x=1795610418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5u9A3PL16118dnwDzUsQLtTXzEbAMsk2owyLQhcCKJA=;
        b=p3L6mR4S83YVKZ+m4lxn6J8ley9q8tdBLPJXIx4D8cvj/yKOz5cKoQgjv1m3iBqBzn
         /w7Igpm+NICicEjc40EuVhZMcx8wwN4yzO6IM7HBwaZ6DFjVo3prbV5BNc+GKvZgx8+d
         n/McZkAQvJdx2Ko+ajferGI7r/WIUtMjdrVXNdJ3ZD7SMJdcv/NtRoIjrvDFEiknFgyK
         jykj80LAgRNEXz8PnMQ6qNTYShfQwtehqjLe242SeIa4tnVs2mzqk0ODp/3NCq3D8ktk
         i5RYd+akK1vsJQl6Ttj4zYWgUazO/OvimRi/izNxKGt3k01adexDTe9Pqq+9Uew2jgTY
         ANaA==
X-Forwarded-Encrypted: i=1; AL+hErEetZPFgwve9MLeMF3nQWpX8QeWwsh9PlCXMk1Ql2PtxtLYMMYOPxFZug52X57hRQqppiExd+pLTWAlb/0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ErBSiCJGOZt7a3Lat+KVWbi/01U1zQooFIT5VFHYR7HsKk6Zo
	JgnacAxLEIG7NSFKk03rjdKaU/4Qz6gfaw8UyO83yibBEn0sIMZpiuAyPlwY5cL0WqE=
X-Gm-Gg: AZFdTZeZy2sQjJxvux19bfDnlZTzsJO7vZXRPuWdVBZmrZ6tFUa8nUUafddhHz8Qbsd
	es3m7HmRP1xDFFFskYDQ+RiRgCe9/+XdHC2MK1iopfgr3isxNrEFh7crVQsFZ2fkOD+yK1qPREq
	b7PvZjWEoh2Y0mxolPLt0vTpWJgATrLLevIFl/Q2dENf+b849gxtNxa9yEedKABzFBiBjsZrcR/
	Ytw/lC/3+HT1XkuSPDuNIvnQ+aOyiEAyEAL0txniY7dbJ5svgaxGfjnpQVl8AeXaH52/ix4vA4c
	bJaUwoHHt0fAN9W3xkGauDB64SnKDxT9NEl0vRypOdxmzAqwjrypN2/xBOJuS8FaLDIiuLBMMTR
	mewaXblUjX6yF8zZgcc6ptBvQ0LOx25l+Sv+Xu89cy0ZvnoNB38MFjRGj5dG6SG+Cp0icJEj0OT
	pZPdL8bg+v6PGEbtIY1T+GkLA+VvvxbMAi7uksEg+RD1YRLXJd0C9tu229UCCSXtR0/JtSHql3r
	Byab0Bn0BVlts6MZyY5TkbURVkz/WIfs1ghT6n+boYbV4C7SuLFGg4L2f88y+zbb3OrQ81GOsp6
	y8VqFQ9cuXIGrUAyxZdNTlWcuYx/cvFunPJC6KvRp1WbtWptLOES7vqPo8+qnkpMvlFTJ6m3KgD
	ugqLq7PwY3W+Jl2/5NbBuEfpI4nhBjArregB7leDkeRS7PEM/WD4GpRUTNOE=
X-Received: by 2002:a17:90b:2642:b0:3b0:9a1b:b708 with SMTP id 98e67ed59e1d1-3b3d07da3cbmr2529004a91.62.1795005618178;
        Wed, 18 Nov 2026 04:40:18 -0800 (PST)
Received: from localhost.localdomain ([2406:5900:1044:110c:e78e:f7f0:2120:34e7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b6e18sm4257980a91.10.2026.11.18.04.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:40:17 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	nkapron@google.com,
	linux-usb@vger.kernel.org
Cc: Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benquike@gmail.com
Subject: [PATCH v8 0/4] usb: gadget: f_tcm: fix infoleaks, sleep, and UAF in the BOT path
Date: Wed, 18 Nov 2026 21:40:01 +0900
Message-ID: <20261118124005.2428068-1-yhlee@isslab.korea.ac.kr>
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

v7 was three patches, posted 2026-10-13 and not applied:
https://lore.kernel.org/all/20261013073328.2936318-1-yhlee@isslab.korea.ac.kr/

Changes since v7: a new 2/4 for a second infoleak in the same BOT status
path, a measurement added to 3/4, and the recipient list corrected - v7
left out the gadget maintainer.  The other three are unchanged, on
7.4-rc3, where the file is byte for byte what v7 was written against.

1/4 queues the two BOT status requests that run from endpoint completion
callbacks with GFP_ATOMIC instead of GFP_KERNEL.

2/4 allocates the CBW buffer with kzalloc().  Only the 31-byte CBW is
ever written into it, and when a command is rejected before its data
stage the status path sends that buffer to the host for as long a
transfer as the host asked for.

3/4 fails a write whose data stage delivered less than the CBW declared,
instead of committing the untouched tail of the bounce buffer.  4/4
clears req->sg and req->num_sgs when the BOT status request is reused, so
an sg-capable controller is not handed a freed scatter list.

Measured on a dummy_hcd gadget with KASAN, one fresh boot per cell, two
cells per arm, speaking BOT over usbfs so a CBW can declare one length
and the data stage deliver another.

  WRITE(10) declaring 8192, 4000 delivered on a short packet
    7.4-rc3   CSW status 0, and 4192 bytes the host never sent are
              committed and read back
    this set  CSW status 1, nothing committed
  a rejected IN command declaring 4096 bytes
    both      4096 bytes returned, 72 of them non-zero and the rest
              zero, starting with the previous CBW.  What 2/4 removes
              is the part of the buffer no CBW ever writes, and that
              part read back zero on this allocator too, so the patch
              does not change what this test sees.
  login, read, write, readback controls   pass on both, KASAN 0

1/4 and 4/4 are not exercised there: dummy_hcd ignores the gfp flags in
its queue callback and never sets sg_supported.  4/4's evidence is a test
module standing in for an sg-capable controller; 1/4's is the code.

Yehyeong Lee (4):
  usb: gadget: f_tcm: queue the BOT status requests with GFP_ATOMIC
  usb: gadget: f_tcm: zero the CBW buffer the status path sends
  usb: gadget: f_tcm: reject a short write data-out transfer
  usb: gadget: f_tcm: clear the scatter list when reusing the BOT status
    request

 drivers/usb/gadget/function/f_tcm.c | 23 +++++++++++++++++------
 drivers/usb/gadget/function/tcm.h   |  1 +
 2 files changed, 18 insertions(+), 6 deletions(-)

-- 
2.43.0

