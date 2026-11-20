Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795177006;
	b=d3fZXxoSX1iOySQfXJwK25a3Wn5L6uUjQ605+jARDgllvDA4V2FLh5Y4nwkapmoUuZl4
	 K3uvH6VM7Tn8Y5SJo+LV10bmhrhfxWaGjnUo2vE+EQNa6EOnab2fFmtHKYjc0yBWEQJnU
	 jboaFJfDBkVG3O2Mccre7VZKb9nVUgCDBh6yd7FJWNZjGq36387nR6ilpNb7cE77i8UO3
	 KZZ2Cr8SygjVSAzSwihStQQSgeKl7QKDVy1Q4ze5ZFqHRPZZzC/8270mA8I4+mGzGEh0a
	 RvXpGLOco4b+I/V6Mj7ibFOIhWvL82IgJttfItYWha3/uXBMHBSCnjp008AHsY9sCvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795177006;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=aRYBZQ4Ht5kZX57P298GjLLCrbN6MxWAWiVcqBd8U/0=;
	b=hZ0+ZpCN0YdKWGpXMlRj5FCkm/mFowijW9ZT04a+ibI/jrPZlvIEGT/Jx3bYCQ/Miajg
	 z+ZKFStI2UyppkQmF4WeEbYnRC1dyE5SzHAhEb+ZkEDPUER1+8iaCl9X27PPxcmBVIrWB
	 tduixEvBP2kn3NQ13gxAgGVFXGUxU9HQ69pLpDuyxwOD3etAH+tUXPsGxfBTXzLav7igk
	 8JlZvqykzJmqDLCqU2dcMF07LLw2r8YjPJOfkQoL7xp3E7q9rdXs+egZOGNJjzbGLeK8O
	 EX1X63FKm7udOmjasgM/B9fSqNaUrGb+R4PV1BLFRUVGjQrpIVMVY0wvnPpJnX1KWQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=StLTEYCi;
	arc=none smtp.remote-ip=95.215.58.42
Received: from mta1.migadu.com (out-42.mta1.migadu.com [95.215.58.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70B1606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:16:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C70B1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=StLTEYCi
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=fhu727nN0pvqV5zVBMZ/RjFZQtOGS0SCxmE807hB38E=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795177004; v=1; x=1795781804;
 b=StLTEYCikYC4tzQTGF6Kx5hvfInTm97n5hv7+Yw5uOsmcs6JctolVb8jbSx9YI+d2DZo/Hb3
 xiqadbMcS4spQZHkwpGyulFiuGrytQn9wbIFWDLcHs8dWVNk8PdFYPDqhvyjRzYyzc+UJ2sbTn5
 LU7uiELmgDEzwVzdtkGhnDNA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 43ace5a5e7df4395;
	Fri, 20 Nov 2026 12:16:43 +0000
X-Mizu-Trace-ID: 43ace5a5e7df4395
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH 0/3] arm64: Missing barriers in kernel page-table updates
Date: Fri, 20 Nov 2026 12:16:35 +0000
Message-ID: <20261120121638.194154-1-fuad.tabba@linux.dev>
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

Hi folks,

Three fixes for kernel mappings that are made valid and then used on
the same CPU before an ISB, so the access can take a translation fault.

Tested on QEMU. The runtime changes to the linear map that patch 3
covers were not exercised, since they require a CPU with BBML3.

Based on Linux 7.4-rc1 (6628e7d4c6b25).

Cheers,
/fuad

Fuad Tabba (3):
  arm64: pi: Add an ISB after mapping the FDT in the initial ID map
  arm64: mm: Add an ISB after remapping the KPTI page-table slot
  arm64: mm: Don't defer the barriers when installing a fixmap entry

 arch/arm64/kernel/pi/map_kernel.c | 1 +
 arch/arm64/mm/fixmap.c            | 4 +++-
 arch/arm64/mm/proc.S              | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.3

