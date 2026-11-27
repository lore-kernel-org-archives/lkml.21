Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795798633;
	b=PpQ7g4edQ3jH2Ldeu5P6pw0gtVb2bR3MSDbzfiZPWLh8i6c/fb5nGNFrHHh13j/FVNfk
	 9l86lBkNfo2w+bhIWycEWNnztz9RkZIEUnN2DG3mkZm7zcxPEFwu3/sf4zgw6q1ZthiYj
	 GWeTPcfOS+hwCQXXwJrXuvbyE3U7wUEcwJCQu+1hllYjdQRlAph1MRrqVCyMhBSKcb6Mt
	 ul48r8wXNAuumSk1nqdZ9mD6TkcN2waKoD+4/6TU+IrzZVKTLiCm+3qQ+TOgSJdaD8MKK
	 q3oIHDDcluq0cEJ13DIuTGfeDh+KsfwJYjz5vrJl38fBUfzYQMi6+A53zWeYz1tmL8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QWqsYXBpyz119NEUDtLLwZ6AbhGxnRQniGPx+qgcEmI=;
	b=IhoJCeYxW+whgb+A1dvz1Eu1pwRBn5PnsJOVmmdhaLbJmeg8yLjtln+P2lAxtfgFXdkx
	 RNfdjG5oW5LYsNDmNNQ2iHVOffvdQjg1hwHoBsgSTubskzJitIG0sZnOwqXfM/P4rvn8l
	 7vTlCqsjthwnQ4JNZd3xdf/dng3picvpyN7H/WJOAL9x2kYqtUWaA5YPY/XgTvsk1ciaO
	 1M3v12JDQCmdef+DcoiMH6zrFLKuCBnjb4Fk8ti2ZKXVa9lteRpIAxNo95WPeddXe5coU
	 Kcn/SqwZUrCAQfMiPNMDI6TQZ9OzfIvBUOYbXV2XXQN3qSgSjsx8Yd3JlF5ZKFIK2aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="QI/W9g6P";
	arc=none smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCDE606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:57:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BCDE606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QI/W9g6P
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3afa1c39d76so28102791fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795798631; x=1796403431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QWqsYXBpyz119NEUDtLLwZ6AbhGxnRQniGPx+qgcEmI=;
        b=QI/W9g6PjguWumNsp9s0QYCFEI23Sog6oyqQgBpp69luFOXlyrR1dbrXKT4OMtXmkg
         960LJZH8wn/+6080Dhar9oYc9AJQw15bHHtBrlu2zPV34np4CI1QvLb2JrssV5i5/WoM
         NqZwGUjgm1mwj+W3ACM6l7ft8tePKzz1K+El/g7rpVnE3a3oAvyJpLFm42VAbUxbbmsu
         K8j6Kfb5alXIO+IuxdwkPw0Y7I1XL1V5N/RXmG6CD/zjr7QCCJEeguOoloOSctsq5wug
         JEsQyYjCFOrELybveazwHiGm2rsEuECvQa5iJuBda8aKPQ7O+JmLNwCvHPfL0csBRyKZ
         qG7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795798631; x=1796403431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QWqsYXBpyz119NEUDtLLwZ6AbhGxnRQniGPx+qgcEmI=;
        b=dFFHWkUlDugw2ztLD4QzT+bUXHcym7q+EclFVLCJvi/N0/liBy6WyoRP4PdxRCxLAT
         HClnTwLYzC0jcQ/iAyNRlDjYJIrjso4gS1HK0WWhQqQidMecPHwcqjGKrPEEcaLLlzAl
         +QjCGnM7TuPigkgw0pUF+YI2eH0abafL9QMRRWpHRTYxcDjVyTrNBWYgSTbxfIoPQWW2
         JFCTeTeH6+ADCoRp8BG6VLS4dMmIashig1sSoRiHL/W9MpoUYV1uF6tMBjmyYklP+8qD
         9BFRlKZOp8W1+CWqP6qi42eBTRkQUI3aKlKqDKw7B2OV8fH9axSnZyqykIOLQ2Xww6BD
         ZZNQ==
X-Forwarded-Encrypted: i=1; AL+hErHDFVFtpI8d+tPWhZ3ezPF6IVDuxUu5cYp6eMd+POmbyWVoTDuoscmOL5gYcuvOFdzrb45tzBwA6Uf++bU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MD6hesErDedvCo+GPV+wRWVEbg18hXo9Pc3vJJQbpfPhcnJWP
	aXMiUGSK8jwLpBsStlAbpe+UzMp6vQ231tSkl9W+73TPzFeZmrvXlUqTFI4ge2Ei
X-Gm-Gg: AZFdTZfIivO3Zo/LwiObERsboQECoaXdbHrLRaYlnOO+uppIIxnxFyTpAl+ZbsB6hwz
	i65qAHZDmOJYhhcN6ZydSlOxNJNL2Xk88qx1uYcdEj7v8R5Aafl1dSv9zQ0kj5zf/uHTfA52OJO
	28VreczQsxQczeTlCv9DmXk9zcnH+lsASD1ANqXBQY9IxcMVhXsolyLxJ9LGJNe/+ZAa2d8WYUW
	O05Kzdtf0fx+7brD/luhJcrFH/SzRvwd83ayBCumcP3J4eUesnqiOnJujrEV8Xku+f8zxFXvubp
	BpfExaQlxqYBs9iRvUiopKmZpx1xgOhxt/gW/LIGx92VHtuhO0B2W2+S8C6+nWxc3/ht9nqgr+O
	ebR0Q+k1cgijqYtjOjNazoVPePbKsyvhJ3ePCNGyi0rOGvMeOnLQrB2fFllVW4ngy4qXZOtCjph
	qjIe3Vs43Aqa11A0J4cNG/Fx8YecKRu6PV9wcPgRFghnDlLUj+wZy8v1iPNx0CtDZR0U/qFjgyQ
	rZ3ZPhbX2PNmVJlfuWY0Ll7EvXt1XdRRjReBnuXxyhcNbVxsKuADA+UAM5Tzt4+XvUWn7QC2zWH
	q3y5NW1NOS5sdO4sIpss0Lu4TYRe/0AMFVRROf7ShJJldayHzKMML0wNLiLeo94DAxDnoUY=
X-Received: by 2002:a05:6512:6891:10b0:5bf:d959:6ee9 with SMTP id 2adb3069b0e04-5c1bc874b47mr4871867e87.35.1795798630965;
        Fri, 27 Nov 2026 08:57:10 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd04096asm6045081e87.47.2026.11.27.08.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:57:10 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com,
	m.szyprowski@samsung.com,
	kuba@kernel.org,
	u.kleine-koenig@baylibre.com
Subject: [PATCH v4 0/2] alpha: enable DMA CMA support
Date: Fri, 27 Nov 2026 17:55:48 +0100
Message-ID: <20261127165626.1352471-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.56.0
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

This series enables CMA for Alpha coherent DMA allocations and parses
early parameters before reserving the CMA area.

Changes in v4:
- Rebase onto Marek's stable dma_alloc_coherent_node_api tag.
- Pass dev_to_node(dev) as the fourth argument to dma_alloc_contiguous(),
  preserving the previous device-node selection.

Patch 1 is unchanged. Matt Turner's Reviewed-by tags are retained on
both patches.

Built with GCC 14.2.1 and boot-tested on a three-CPU AlphaServer ES40
(DP264 SMP), with CMA, compaction and jump labels enabled. Booting with
cma=64M reserved 64 MiB as requested.

A private coherent-DMA probe passed 39 allocation/free cases across
all three CPUs. Requests included 1 byte, 8 KiB - 1, 8 KiB, 8 KiB + 1,
12 KiB, 16 KiB - 1, 16 KiB, 16 KiB + 1, 20 KiB, 24 KiB and 32 MiB.
Checks covered zeroing, data integrity, page-rounded CMA usage and
restoration of the CMA bitmap after free. GFP_ATOMIC requests of
12 KiB and 20 KiB correctly bypassed CMA on every CPU. No new kernel
errors appeared during the tests; loading the private probe produced
only the expected out-of-tree-module taint. No hardware DMA transfers
were submitted by the probe.

These two commits were tested in the complete Alpha queue at
b4a6d2833fb56d3cf04c4d243f00b7a3f92bd43a. The exported patches also
apply directly to the API tag below. Both pass checkpatch.
Other reservation-size boots and no-IOMMU testing remain outstanding.

Base repository:
https://git.kernel.org/pub/scm/linux/kernel/git/mszyprowski/linux.git
Tag: dma_alloc_coherent_node_api

Previous version:
https://lore.kernel.org/r/20261115103809.1288167-1-linmag7@gmail.com

Magnus Lindholm (2):
  alpha: parse early parameters before reserving contiguous memory
  alpha: enable contiguous memory allocation for coherent DMA

 .../io/dma-contiguous/arch-support.txt        |  2 +-
 arch/alpha/Kconfig                            |  1 +
 arch/alpha/kernel/pci_iommu.c                 | 20 +++++++++++++------
 arch/alpha/kernel/setup.c                     | 20 +++++++++++++++++++
 4 files changed, 36 insertions(+), 7 deletions(-)

base-commit: 31f7e12d621bc5b1dcda0b5e6855e39adc8aaebd
-- 
2.43.0

