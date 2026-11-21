Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795283645;
	b=wc7nXKfvRl2OiKdNx6ugMl6MsYKVaCeIjv02qVWGJDjXAVEs7X9X2LEWx/LC2p1Cd01c
	 ofagDS/7oeQtehB5Ky243vSh3cBpP3QLYGkYxC7juig1lTYHRqzN7afQvxlY/2mxfCgBj
	 HPlmUvJTtTJMDH1iTM+QGYc+EDKpcPKH+LCkZMDYUEoyTYsyAZMrhAGmd1B60CUbXykVK
	 bXlPsRddbv8YzYFqHKOrR6y8NYI/Ue7zDWchnfFqmhHdEDu4aFAAJbQsohym+sCC+CCVP
	 Hclr7b0Uod43Wo3CBJdABcLFyRI5wDymU5JTCkaPMudPpQ8QbJKVd4ZTzad4bV79IYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795283645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wjDHCOnpzBN9eKZwwUbpNTzSGVofhKbk9Tp6cgxSwKk=;
	b=DrS4jQAG4YZuYDRgTIRcP2LpLM1bTosVCvmpOR7FMvpmIYAFV2stG302U8MAlYaK7PHf
	 htdv1mrFYjppTYHnMGAgDdpYqX4N8YZ6Svy6tV4yHXEncKFXvRd7AEMal38rrPXIBb9RM
	 npadDJmTG4MvFRxf51P/5NnjUGsJL7ZA8uIbHNu9Wfv91B0FnWOsik/ZPBVBhlpMVxn/X
	 jLYcuQ8Zdb5adPm40DyA5y+RBIyqNdrGxfn8QNj1bcYSEmz1SCQ5HbrH08HZ/koPY/rHK
	 Tfb9M2HmOa0r43tqTTOAnb87eCqXJ8FTo07Dipweqfx1p1xb1MUoxC0UwIcn8dTrmLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=difM9R6W;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D1F606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 17:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64D1F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=difM9R6W
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c50e26763a4so363308466b.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 09:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795283643; x=1795888443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wjDHCOnpzBN9eKZwwUbpNTzSGVofhKbk9Tp6cgxSwKk=;
        b=difM9R6WtjkaXqPokPHEiFfoqPVwzPzDzeUcXK4igqkM/VPZGlVVGUyYPF5HbbLhEk
         fj+R+Lj32nRSFmX83jEuGltmTBy1sCZ9moNDAjAsvjyjd3Zbn7W0eltOrQ82hH11cfeg
         KdC1YrTJEjoKPj+hiQ5YNSnIAMETpGRvFu0hsjRsI+89KAwgRB38zwlj8PaPPxQcdn1n
         ACu2ATkDwXWuidsLv/jGSVaYWBP7zLshD/Qsdjxyh554h3k3CUIDj+UWvv+8MKnOY92d
         kQjCv/Tp+6ANuquz09OG7ocT7eSyNda6kLuhprwWm5KOx4w1Uw9zc7qnhH/9eXEMFLPM
         9CEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795283643; x=1795888443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wjDHCOnpzBN9eKZwwUbpNTzSGVofhKbk9Tp6cgxSwKk=;
        b=bWvqtrfjblDf1sOS7xEoxQsTbvYUybI5MmVSWvm1oavV4YjKAkFptR48G+v11DSo/7
         sDsFvK61VCPtI/KsjgYkO4rpyfR2NimtL9EicUPGTERKbLAwNivmeTFXkbqogAEL8C+N
         rEg+oiMnQIEwdbMICBbJvYMtmIBG5Jt6GCTbwC1WpplInaAB5SptXM+5uXDerJ4gPilM
         pItRgS4J/TnaUwunTyL0+grHa6JGn8r9tkrpQZ9SJvPYKENxqehK0v4aGjgX5geqiI4t
         0+7kpyaGORdRt/Rq0zyPDNXXe9X+W21vI9B3u2ITHUsEb8FKfw1ezj+NA0knzw2CPQMr
         VTFA==
X-Forwarded-Encrypted: i=1; AL+hErFiooIk1m1X6tcE7yi8AH0C9Ptw0R5rT87NHvBDIYC6pgOUPE7NnQ5+RhoAnP+5UGuessBq0IFgrd6RDHw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ybUzx3Z8VWXxEOcFX8HnnOY5NFmLHoqy33ZYFHrzwi6waJ1BB
	g3sxUYCbmipBQcINnI3i72aXuZ+PrJ6xDqZO23/W4tLun3jL2olo+dK3pI/eGOchoGdJpckH55g
	T206Lp7su
X-Gm-Gg: AZFdTZeF2Kh/0+g55lYK5p1zUBKW1tgQgd3pFOYPl34wBko6w329zRZLTCI7i3KeQl5
	GQ5FFwD51hhpjJpQk12hNn+/a7JDrGGMJ1E18qcYhlj/+NX3kC/2eoODTKtwZozyiZe/yQhgkUT
	6sqXiaiFAqGpUIhHqTAulYkEEHAuBCPPIH+7XRh8ByIaGnyKjshBMm9d2FTHSep9qA6Se3xqRyW
	IGZwjeGHujdp1/zlVI2hNCte0dmT589xZLMymz5xkq5OcnzcN6utdQcvZVt4bnvDMUwUWn10TH0
	92xdTYH4qYGVq2wAtM5Oi/7MZzA7srXLqBJ66GJtyBT9L7yofcpIZIn1nhODPXqSguoZFET5mwG
	K1o+vlD3gjnuHWUU0lpkGSUXULN8RW74Tqd7vcEe9G/NWvR3iB1qHromSRlXDY1sNy4blxg7MwM
	CbRqhRzd6Ox4v4hlEO/i2m34ZRk48HA3zx8aFAJVQBRHNQ1LaWd37oIsn7NPLRKH4TIuXKTtmeE
	wApeDeFwLbGdQ65lllNFAOBe+lJtRyfUiFp4OrCKk0TcxL2/VsrmsP6yCYDuMhbFlQHkWuAvgRm
	ZM4FACCax3bOOurQDAJghdty13BSP0vbpGQVYnchJvON6Rjb7L6a43JKZJPdqSUM6bjyXt8+U9b
	MampCkyXT4W1m1LBVF0EyLS2lduQHMpaTYxUf1NWIZXRbanfY/cARGW0Vhsah1+wNd9wXMUIaYA
	FU55JnmQxfyW2YOtitBQwX6Wk1xT9Og0cl8t2uM0CDC+QPY5RU2XHWxRAxMddfv+A7ujS6pxBuG
	fcOGrkAx4CnqaM1mDzAcjtpTN1gjlKv0fzD+VnOiMsfh24c99mkL9HJWtQnMbgCWEVuCs5Cw33A
	UomH0HBUouKnwpHdUgd2LPzInlHBcgC9mbnPJnacfyDR9gnC2hiJPowEz8Vzlr0vbz6sMYOLMil
	O
X-Received: by 2002:a17:907:1b1a:b0:c50:52b4:eb04 with SMTP id a640c23a62f3a-c513a99a675mr589342866b.16.1795283642275;
        Sat, 21 Nov 2026 09:54:02 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470dfa000000000000000a27.dip0.t-ipconnect.de. [2003:f2:470d:fa00::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea8063sm220167466b.45.2026.11.21.09.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:54:01 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalle Valo <kvalo@kernel.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: [PATCH ath-next v2 0/2] wifi: ath10k: spread the PCI copy engine interrupts over the CPUs
Date: Sat, 21 Nov 2026 18:54:00 +0100
Message-ID: <20261121175402.644803-1-julius@bairaktaris.de>
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

The PCI ath10k devices are capable of multiple MSI, and with all
their vectors the firmware interrupt and each copy engine have one of
their own. ath10k has asked for a single vector since commit
cfe9011a05a8 ("ath10k: remove MSI range support"), so all the copy
engine interrupts and the NAPI they schedule run on one CPU.

That commit dropped per copy engine handlers and tasklets along with
the vector block. 2/2 brings back only the block: every vector keeps
the one handler that schedules the NAPI for all copy engines, so the
copy engine locking and NAPI stay as they are and only the CPU the
interrupts land on changes.

Only the chips used in access points take the block (QCA988X, QCA9887,
QCA99X0, QCA9984, QCA9888). QCA6174, QCA6164 and QCA9377, the Wi-Fi and
Bluetooth combination chips, keep one vector and no affinity hint, as
now.

1/2 fixes the probe error path, which leaves MSI enabled on the device
after a failed probe. 2/2 requests the vector block the copy engine
layout needs, or one vector, and spreads the vectors over the CPUs.

On the AX3600, uploading 83-84 Mbit/s over the QCA9889, the HTT copy
engine's 37326-37927 interrupts in 14 s moved from CPU0 (21-22% busy,
37957-38630 interrupts without the patch) to its vector on CPU2 (21-23%
busy), and downloading 87-88 Mbit/s CPU2 was 8-13% busy against 15-17%
for CPU0 without the patch; the system total stays within the spread of
idle priority spinners, 16-33% of one CPU with and 16-34% without (3
runs each). With the block not granted one vector is used and carries
38285 interrupts in 14 s at 84 Mbit/s, and a firmware crash forced
through debugfs recovers with the vectors on the same CPUs (1 run each).
Without 1/2 an injected probe failure gave a WARNING in
msi_device_data_release() (kernel/irq/msi.c:294), and the router then
stopped answering; with 1/2 there was no WARNING and the rebind used 8
MSI vectors (1 run each).

Changes in v2:
- 1/2 is new: the err_deinit_irq label of ath10k_pci_probe() did not
  release the interrupt mode, so a failed probe left MSI enabled on the
  device.
- 2/2: Jeff Johnson pointed out that mobile clients want their
  interrupts on as few CPUs as possible. Only QCA988X, QCA9887,
  QCA99X0, QCA9984 and QCA9888 take the vector block now; QCA6174,
  QCA6164 and QCA9377 keep one vector and no affinity hint.
- 2/2: Loic Poulain asked to say why cfe9011a05a8 removed the vector
  block and how this differs; the commit message does, and the comment
  above ath10k_pci_interrupt_handler() that still described per copy
  engine handlers is updated.
- 2/2: Sashiko pointed out that the maximum of CE_COUNT_MAX + 1 vectors
  is not a power of two, which multi-MSI cannot encode and some MSI
  controllers do not accept. v2 requests exactly
  roundup_pow_of_two(MSI_ASSIGN_CE_MAX + 1) vectors, and one vector if
  the block is not granted.
- 2/2: Loic Poulain asked why pci_alloc_irq_vectors_affinity() is not
  used. The answer is at
  https://lore.kernel.org/all/20261114210506.787342-1-julius@bairaktaris.de/
  and the commit message now says why PCI_IRQ_AFFINITY is not used.
- Rebased onto ath-next-20261118.

v1:
https://lore.kernel.org/all/20261101164247.258200-1-julius@bairaktaris.de/

I used Claude (Anthropic) to help write these patches.

Julius Bairaktaris (2):
  wifi: ath10k: release the PCI interrupt mode when probe fails
  wifi: ath10k: spread the PCI copy engine interrupts over the CPUs

 drivers/net/wireless/ath/ath10k/hw.c  |  3 +
 drivers/net/wireless/ath/ath10k/hw.h  |  2 +
 drivers/net/wireless/ath/ath10k/pci.c | 87 ++++++++++++++++++++++-----
 drivers/net/wireless/ath/ath10k/pci.h |  3 +
 4 files changed, 79 insertions(+), 16 deletions(-)


base-commit: 1983b40acfcb3c3464b291c85977290a785bcfdc
-- 
2.53.0

