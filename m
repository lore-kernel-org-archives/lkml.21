Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795466582;
	b=jMQARuCl4Azcdsf0Sx28Lj1X2dz7k8nrEMB5eYYaxhb3vMhfo75AW0Hw/T+kLa02BJ3I
	 cfWrERC/5P/cxu3Fpa7OYZTHjIQasUCaEMB7Gu+2UbF2xtJyQ9QPBeL1k0HNHi17aYDnR
	 O6xIUCiyPyY4onE8hnrg+iyEOPMZ0nDe45jHphHwC+wN/nRcOCykOqA19geA9oo++Eqwh
	 sYoKZ76Nshbf3Q2i0VubMgG2uX+h4sVHuG7bblO/VDvYMMZRv++Xo8aBx7Co3Uj0piVO8
	 S6UeNfXHrmqOXJ8PJI34cdV37zUvHVBhsfdMg6FnkS64LmB+HJRMhtptkJX7bqKYaLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JKkJYPrCUqRXqqsiNkj7J/GhQQ+Z7+5b8+YcNnPW1YA=;
	b=4oKsBNDAR5wW3VMmLVENp33jYhKqkPbFxvGQyNtHghG/xEY+SrPrUurnf52XiKxF4xpJ
	 akEw+IB5vmRB3PPGrfShKohvhWYOhaXSo/78oy58XkH2wZp0Bk3u6sfAFZKp+DieArT6H
	 IVracsRo9FITI+GqIjAzv6SrjLuPXVP/8Jw+vQ/zjwYQDY0hdt7dBdWyG6lbp9LgnG/Bw
	 s94HP6cjAdFHX+yqnIts+5LalataPUIp2BeWEnXIH+wL/yosetBO13Z8fObmGyVL6e7Ss
	 c3lnuQwM+JpEMGKeuG77fieE6TTBuapHwW3gDEvr5e8d+TDM2tWrUOLOPtfIi4x6ExQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=is.s.u-tokyo.ac.jp;
	spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp;
	dkim=pass header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b="T/U5yFsY";
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DBE606A334
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:43:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00DBE606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=T/U5yFsY
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b3b4944a0eso2672315c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=is.s.u-tokyo.ac.jp; s=google; t=1795466581; x=1796071381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JKkJYPrCUqRXqqsiNkj7J/GhQQ+Z7+5b8+YcNnPW1YA=;
        b=T/U5yFsY9r3/TbgsattK0kfTXH8LtQYv8NGOLhmJbNFCgh+Z4z8syvOJmEHakNRjPS
         3t9IkXJF8soGHBehVA9tmJTRScypffYOrlT96vphsZbxdiC1yYg6yJJ/P36TOzRi1eAt
         SrIxcFd5yCV0WcBUrpb7asz3uJi/UT7LOOMWl4loV7YetBht0K54ZL/NYBvoJB1AOcpD
         aetZI1nzqFoMFPaEdh87GT5+vIj3Uz5G7lpYnvoGS3tasK4KlPPvFtbqTsMVId5LNhIy
         6l7bxtQkRkHAxzu4gSHky4KEpxRogxdZLFyhgZlBlWTfBB9iFefgV5k+R6tmLLKKaHUZ
         iZ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795466581; x=1796071381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JKkJYPrCUqRXqqsiNkj7J/GhQQ+Z7+5b8+YcNnPW1YA=;
        b=ixkbZcVRjs/Jp5omwdOC4sDmszlXg4WEF5jonAKpWbe1Y8PTKaQJsUj34W5qc5b82H
         poy+zvcunaJOZjTCjuZGU+MJJCfSlTRHM+Zk9JjO5H9kpVoxrPwL/WKWLqaBWvHBnBTY
         LGaH3ohh5rw1Su2Jz+rHDDp6OC1fTpc9GMSGhpo/7pgQWF9BNlwpuuQhTPXRJptgTppP
         spwFHKVW+oOGWuxEhGXVcYl9JP6LNF9CM2+cuwBOvbeCBkICm3+udMbqnnRCH88DAMTn
         tiWhfHKQ0KEf1M+EotZBvj8+8sPyyZmxdADGA/xoBJXL83Gbx83oFfuWdX4k/3xqsgh9
         d40A==
X-Forwarded-Encrypted: i=1; AL+hErE2zC/QXJA44hEwBfALmyyDDLzBl+G/JE50XJHThV8igdSBzoHtAsOBB2Xm4WisfuTS2lxpTiuqp1Ajo2U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2ABMLQzJ74Fhy52Twrw31FeBBQ7YdeRlnfdjAzv/FYiLCnv9p
	SnPXxOPUewjM+QZ/8zMQhN7WqW+8MmNnLQLvNFGWVFWTi1z8pTHbB7sL/V3rzXSqNw==
X-Gm-Gg: AZFdTZd31SfrC4DfkJbNMEDWVdmEJcOGtfws81r7YuriacYLEWueugEQwNrHoP2OKv9
	TfJHaKAvNM1l21QXGsDLd6FCkvlE7wtj+dzk4mGBBPAWJZqZPd+mkWgcRs4yfsulBDRd5lpIGD8
	Wre7npfrPmy5DiTVAAmlzfn7eWxQrZPCHsxcfQGUYXa8JB9cjG6HoQ4khak2Mct9vJREL8baAyc
	Jg2KUwIF7kNCKhgSZl9hLToFqUlxXsOLSU/CaHc0SRcHk5QX4yfjH9bS83N83wlW1rCm3MOGF0v
	bf3Tt1U3Pn0WPw/BQiviycmQFxznioZ+GMW/SSb9x6L3URxh7lAJiz+dhXq67JXDZTbHKBLlv0s
	3ALK5PUAQvV53+297drttVAwX00/CntSNy9lTkdI+0Y3XopN8oLQHlnNDAYZk9oWN/lOemr8T5o
	7YY1vCsOvDGeHcdf17cJ+n1/ceYoTPa5rmiy7waE53k21HXfYNU7JT3Gs//fJIsK0hK0O4heP9W
	cITVCDPykBe91ahbA6IH7LunVvGJnTX21yOUpDxIrNmgbsXtitP1NCYroqBVHnPBRIP8nPP2oNs
	AZvQ53HjVWdTMwA+kwMkFedrTaAkcTug/KFjTg==
X-Received: by 2002:a05:701b:230b:b0:1b2:4da6:bccd with SMTP id a92af1059eb24-1b5568feaadmr10679683c88.34.1795466580856;
        Mon, 23 Nov 2026 12:43:00 -0800 (PST)
Received: from wang0.localdomain ([133.11.33.33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm17407732c88.4.2026.11.23.12.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:43:00 -0800 (PST)
From: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
To: Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>
Cc: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Tomas Bortoli <tomasbortoli@gmail.com>,
	v9fs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Takahiro Shinagawa <shina@is.s.u-tokyo.ac.jp>
Subject: [PATCH v2 0/5] 9p: bound zero-copy error replies
Date: Tue, 24 Nov 2026 05:42:52 +0900
Message-ID: <20261123204257.3055515-1-lian@is.s.u-tokyo.ac.jp>
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

With the error reply to a zero-copy request, a virtio-9p device can make
the client read past the posted buffers (patch 1), also with an RLERROR
under 9P2000 and 9P2000.u (patch 2) and with a reply after a fatal
signal (patch 3). Patch 4 fixes a double put of a zero-copy request
interrupted by a fatal signal while waiting for the ring. Patch 5 fixes
an uninitialized value printed in a debug message.

The patches were tested with QEMU modified to send the malformed or slow
replies.

Patches 3 to 5 of v1 are left out in v2, since patch 3 of v1 fixes the
use-after-free on a request returned after the RFLUSH, but puts a freed
request returned after an umount [1], because an umount frees the client
and the requests while the device still holds them. Fixing this entirely
appears to require deferring the destruction of the client to a
workqueue until the device has returned every request, which is costly
and beyond the current scope. Patches 4 and 5 of v1 depend on patch 3,
so these patches may be sent again in a later series.

v2:
- Rebase onto v7.4-rc4.
- Add patch 2 for the RLERROR case raised in the review [2].
- In patch 3, accept a late reply within the part of rc.sdata posted for
  the header, as raised in the review [3].
- Add patch 4 for the double put that patch 3 of v1 also fixed.
- Add patch 5 for the uninitialized ecode raised in the review [4].
- Drop patches 3 to 5 of v1.

[1] https://lore.kernel.org/all/179446999129.2199510.15094266003962078465@kernel.org/
[2] https://lore.kernel.org/all/179446998758.2199510.14994914047354508278@kernel.org/
[3] https://lore.kernel.org/all/179446998948.2199510.3182298225630042557@kernel.org/
[4] https://lore.kernel.org/all/sashiko-outbox-206901@kernel.org/
v1: https://lore.kernel.org/all/20261109105251.2545764-1-lian@is.s.u-tokyo.ac.jp/

Lianjie Wang (5):
  9p/virtio: clamp the reply size of a zero-copy request
  9p/virtio: move the error string of an RLERROR into rc.sdata
  9p: bound the zero-copy reply after a fatal signal
  9p/virtio: set REQ_STATUS_SENT after adding a zero-copy request
  9p: initialize ecode in p9_check_errors()

 net/9p/client.c       | 16 ++++++++++++----
 net/9p/trans_virtio.c | 15 ++++++++++-----
 2 files changed, 22 insertions(+), 9 deletions(-)


base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.56.1

