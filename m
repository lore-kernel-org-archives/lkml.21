Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514458;
	b=iZCKt/OuJTrpdIl5ob/rC/AKRMhx0eO4r9FuvVE+Fz1Xh61zKIm0a8tINx17L1OnxsSg
	 05k+y4c4s4iGFFG9WYcyzgjsm+ocdusgbPToch1o+zzLyM0+iI5RL35hDih9QWBrFKJMG
	 knVzCByuJkEJg8QTeRMts4VuVZ9lslRQzfv58jpLF24RisqC3+IvB1rvf/cjcS0O+T4BR
	 RtXp5Aswvt2FyN9+dpmZbaD+VHLL3QCM4QMfTtSpyVfANNHS7vUUikMGCHMVFfUXGlDoa
	 hMj8lcK26RKALQcoxk3x7JrPJIW8GqwmSDCkuopQjzU0vkqT5T8bJngSaMVYzq7SlUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514458;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=yIIBQoRR89NTHy9ZCDwkHf8kWCbxt7j/00D8+1ttnwc=;
	b=fC8iLAqrLwtETCrF5PH/iycygloBxDal1iepgUiXpFH3BEoPlRuX2/qusGfK16xsdive
	 60YdYK8Dh+Iq7toc7nRCwyLw2W91IbuT20ApgG6VXGi3107X07jCAnJk3kHQyEuzY/7ob
	 84tIsnUhBcEoBdSVCPpqOjHT9xcBBUN0VLq8jUQOHpw//Z8i7MeYrfM1hpGpfY9B5f7Hh
	 v0ngbfPvJL7v3+pRYO+VlPyRZz5ZXXyizlbCdBwaA5qlcwagmdOSuyNXUmBOlSyQM6G0o
	 BvQpQL5ZVckw6fEHyUXMVL4igRoYKN0ODVuZyNOquKLGazzIeBQZ6bj+GQAd42NE3uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=HKwOpv2c;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB20606A332
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEB20606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=HKwOpv2c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=yI
	IBQoRR89NTHy9ZCDwkHf8kWCbxt7j/00D8+1ttnwc=; b=HKwOpv2cS5rXfPE1/+
	tk3bNdlj0USE1sZjhsMmEfn4wtQaRIX+4SQaLTGshDgrPpuOrupAjod2D+3kA7Bp
	2ionbwMtLRMZpGJgb+2AZLe5VlKCsma50mUT3zZgaeZLzkggPcM+q4tq33virAwo
	P34qgP3fm0q3bWsu2b2DosITU=
Received: from user-VMware-Virtual-Platform.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgD3jiUtYAVro_nRHw--.24605S2;
	Tue, 24 Nov 2026 18:00:13 +0800 (CST)
From: Ziheng Wei <zihengw03@163.com>
To: gregkh@linuxfoundation.org
Cc: fan.jiaming@hotmail.com,
	amit@kernel.org,
	arnd@arndb.de,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] virtio_console: drop device reference when DMA allocation fails
Date: Tue, 24 Nov 2026 18:00:11 +0800
Message-ID: <20261124100011.5043-1-zihengw03@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026112438-juggle-squeamish-22ea@gregkh>
References: <2026112438-juggle-squeamish-22ea@gregkh>
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
X-CM-TRANSID:PigvCgD3jiUtYAVro_nRHw--.24605S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVQJ5UUUUU
X-CM-SenderInfo: p2lkv0ljzqjqqrwthudrp/xtbC7g4-j2sFYC50pQAA3h

Sorry for the missing context. The question I was answering was:

  Is this a duplicate of
  https://lore.kernel.org/all/aoWK_qpSBeO6Bw0M@michalis-linux/?

Yes, it is. Both patches fix the same alloc_buf() device-reference leak
when dma_alloc_coherent() fails. I missed Michail Tatas's earlier patch
during my duplicate search, so please ignore mine.

Sorry again for the noise.

Ziheng Wei

