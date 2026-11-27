Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781187;
	b=TfQWArymPggiG8NlGvNsj5on44dyyOzsYBIqPAwB/uBTcB62PrsJFvfmXP9UdxHDARug
	 9orKuMIX/x6lRTrjgwWhyzP0qSoy+u6F9zdt2hSaNVwRWF218u2zqQNoQ0vrHDbT2fqoy
	 yyrQ+XBEaOZUiGJNI0VCvi28+ahNEAQrN6EzErO0F/AgkRUkIjiOBaqd3tulIHR2vsu3M
	 GNYnEPrNvUUQELUkMw6H0lXzmg0zvNHSk1pG857LwkJWRil9raAfe89noc6yVr6iPC61b
	 ZLV5LxTM1Fp4aXYLS4b6r8KxV0WNb9DvIsdiHa8QklTnJyTZIt0tbbYEaDoYG2B7/MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781187;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=zfR7wZtV/GSiaDeDmBX0Viv+WnEUlG7jbqXkfvtxbEM=;
	b=20w9Ji38P7cV+m0vM8DFbCzZzkgHPNQ/s5tgOHKH7yCm7u/KwZ9ZVCjp9eZTPHXTP0Er
	 KpEMNwuHYCHQ/ibmfnIb6kV7ywBNCgkIs9i/MqZUZyuWoKKvXBri0kAfJqLepKpWWlZ26
	 r5V11zgZfLIKzS4X4J9nK2VCyFUK14YF0/x3d6O81phjIAFibqoj+Ev7ozfiXvKOjkeqK
	 PybDtwtTlZbFycH0sRFdthjMpfA3P62ZqwNiYrbQtQwz3oUHLFQcaxq4G7gmjn4UlMiA9
	 QUaW4wXXqLRYDVkcoxeT9/j0LqYAsFde5T+jLOvoZFALnuSv6M4Mp7IZMrycXGDN+dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZbeBI8bF;
	arc=none smtp.remote-ip=95.215.58.218
Received: from mta1.migadu.com (out-218.mta1.migadu.com [95.215.58.218])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DD9606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94DD9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZbeBI8bF
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=cRqx2qc2ejukY6HlgnbthsWDXqld+RKdOah8C+pO2OY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795781184; v=1; x=1796385984;
 b=ZbeBI8bFXGla/TMlIQVs5msEToHhNMZjj7f7BMxFgNcNU1AcguWG7lyBDbJgwbcPqg/QGy92
 X2VWUEjLtVo8JwG7AmrGuhxrjQjtfp7IbqM5ipDjXErQ3LhgaZQHlMYWIAoWtY7WuYLRA8i5aZz
 XvKn1SRb6lVnF9eeJJUELmy4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 239e014d3af63bbf;
	Fri, 27 Nov 2026 12:06:24 +0000
X-Mizu-Trace-ID: 239e014d3af63bbf
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] irqchip/gic-v3-its: Fixes to table allocation and the ITT pool
Date: Fri, 27 Nov 2026 12:06:18 +0000
Message-ID: <20261127120623.891129-1-fuad.tabba@linux.dev>
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

Changes since v2 [1]:
  - Dropped __GFP_ZERO from the pages added to the ITT pool. (Marc)
  - Added Cc: stable to patch 3. (Marc)
  - Changed patch 2's prefix to irqchip/gic-v4.1. (Zenghui)
  - Collected Reviewed-by from Zenghui. (thanks!)

Five fixes to how the ITS driver sets up the memory the GIC reads.

The first adds the barrier that was missing between zeroing a table
page and the write that makes the page visible to the GIC. The second
cleans the GICv4.1 vPE table to PoC, as the driver already does for the
pending table. Without the clean, only a redistributor that accesses
the table as non-shareable can read stale contents from it.

The other three fix the ITT pool. Its 1-byte granule keeps ITTs aligned
only while every ITT's size is a multiple of 256, which holds for
power-of-two ITE sizes but not for QEMU's 12-byte ones. The third gives
the pool a 256-byte granule. The fourth zeroes an ITT reused from the
pool, as MAPD requires. The fifth frees the page when gen_pool_add()
fails.

With patch 4, a pKVM guest shares each new pool page with the host
before anything zeroes it. The pkvm-guest patch [2] makes
pkvm_set_memory_decrypted() zero what it shares, which closes that.

Based on Linux 7.4-rc3 (aebb727447640).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20261116192933.3266502-1-fuad.tabba@linux.dev/
[2] https://lore.kernel.org/all/20261116110549.1863653-1-fuad.tabba@linux.dev/

Fuad Tabba (5):
  irqchip/gic-v3-its: Order table zeroing before the GIC can see it
  irqchip/gic-v4.1: Clean the vPE table to PoC
  irqchip/gic-v3-its: Align sub-page ITTs to 256 bytes
  irqchip/gic-v3-its: Zero ITTs reused from the ITT pool
  irqchip/gic-v3-its: Free the page when gen_pool_add() fails

 drivers/irqchip/irq-gic-v3-its.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.47.3

