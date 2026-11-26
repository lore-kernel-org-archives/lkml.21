Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687227;
	b=3d9Ynq0qLFnePEEB0VwhO8TJq//dk/AhScetW5sps5AC5HpnhGMtyPCAe/SOqxavBQT2
	 aYB6npYqPLDkK9AKoLq1Yri+JiG1Ppju3r+Y2dxECUFg1sueQR5RoH3L26kBGlDwJ+vbM
	 gyB4BRHSw6/N0Xv+z1lJM9njSudTD/6yYDQ4vDcPk0sYS+EVw/QqyyESqNa1i6+k2lB8T
	 8MwrjBpHWOROGK8Sia1jSGoVgyA0K8Uyz5HDHx0rL0Eli03WL4PEF2Oxgj4EYgLSxc3gR
	 eAheN0GgjkAIqnh4f3f5ZOgvCeyYsgzWazJtyINfYrgajXuF1VHKOfd229MTUUdIFxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687227;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=+oW+HLYblbjUyMWtUikyEnlaw7hVq5s4tKw9eK5zNt8=;
	b=KlRbSVrrINKTZ41rLb9fShRC9G0+IRdrTP+pqSNC0X4jFCkmhYX1xpUhPiPIFtL6guOn
	 +yMu7W1BW8KHJ1GCDspeJ5x/4F0vnGFbcV4K49kd2XMX/CC+sKg0bHpbdk0iEu7DE4lBj
	 sC5euWk9zFh1/oHKriwnziBoXbtSGydARVGNIYOXVrHJDbrDAClfxbEQpY+HOy/lYXt57
	 Vw1wEsO+IvBez07SPI14IoO5k+DOslyahkVL3X0dmUhpA6Y8OWRmbr+e2ZJKbvvd1QfWC
	 UMXiSd4+FGNAx+xDATeXVE+0VhjNyxRb+phVxgJ3RFyUMkegdJOKxWRKAnUJB5Z9m7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="Uhs/uJs3";
	arc=none smtp.remote-ip=91.218.175.122
Received: from mta0.migadu.com (out-122.mta0.migadu.com [91.218.175.122])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91508606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:00:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91508606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Uhs/uJs3
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=g28CqIM9YUuvU1OT9rEa9+BMl1iyiZT0LWgm0NR8SX0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795687224; v=1; x=1796292024;
 b=Uhs/uJs3+IC6fxOjiBbOqa7ZJuZM954EKtDDYqdsGbMl1udKpzDasnc3F8iE/BXdETFrtOe8
 jmCKgcLspzzKXPdyxHJsVKqo4l85hRUGexJ4PPR6X2jCeGdeeu3YYiN5ZN56UpErq0t8fovLfno
 Afow2gK0nDhCivX36qjkD+S0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 572ca904ff9ffd69;
	Thu, 26 Nov 2026 10:00:24 +0000
X-Mizu-Trace-ID: 572ca904ff9ffd69
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH] KVM: arm64: gic-v5: Reject an ID_BITS too large for a linear IST
Date: Thu, 26 Nov 2026 10:00:23 +0000
Message-ID: <20261126100023.1286902-1-fuad.tabba@linux.dev>
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

Without two-level IST support in the host IRS, KVM allocates a guest's
LPI IST with a single kzalloc(). The guest picks the IST's size, up to
the virtual IRS_IDR2.ID_BITS, which userspace can set as high as the
host's. With 24 ID bits the IST is at least 64MB, more than
KMALLOC_MAX_SIZE with 4K or 16K pages, and kzalloc() warns when the
guest enables the IST.

Reject an ID_BITS for which a linear IST would be larger than
KMALLOC_MAX_SIZE. This applies even for a Linux guest, which
configures a much smaller IST. Userspace writes to IRS_IDR2 are new
in this cycle, so no release has them.

Fixes: 71091136d1452 ("KVM: arm64: gic-v5: Handle userspace accesses to IRS MMIO region")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---

Notes:
    Tested on FVP, on VHE and nVHE hosts, with and without two-level IST
    support in the IRS. The vgic_v5 selftest passes. A reproducer that
    sets ID_BITS to 24 and restores an IST that wide hits the kzalloc()
    warning without this patch. With it, the IRS_IDR2 write is rejected.
    
    Based on Linux 7.4-rc3 (aebb727447640).

 arch/arm64/kvm/vgic/vgic-irs-v5.c    | 4 ++++
 arch/arm64/kvm/vgic/vgic-v5-tables.c | 8 ++++++++
 arch/arm64/kvm/vgic/vgic-v5-tables.h | 1 +
 3 files changed, 13 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic-irs-v5.c b/arch/arm64/kvm/vgic/vgic-irs-v5.c
index f73349c02656c..97362caef4433 100644
--- a/arch/arm64/kvm/vgic/vgic-irs-v5.c
+++ b/arch/arm64/kvm/vgic/vgic-irs-v5.c
@@ -648,6 +648,10 @@ static int vgic_v5_mmio_uaccess_write_irs(struct kvm_vcpu *vcpu, gpa_t addr,
 		    vgic_v5_irs_ist_id_bits(&irs_caps))
 			return -EINVAL;
 
+		/* A linear host IST is a single allocation, limited to KMALLOC_MAX_SIZE */
+		if (!vgic_v5_lpi_ist_id_bits_valid(FIELD_GET(GICV5_IRS_IDR2_ID_BITS, val)))
+			return -EINVAL;
+
 		/* Min LPI ID bits must be greater than or equal to the HW */
 		if (FIELD_GET(GICV5_IRS_IDR2_MIN_LPI_ID_BITS, val) <
 		    vgic_v5_irs_min_lpi_id_bits(&irs_caps))
diff --git a/arch/arm64/kvm/vgic/vgic-v5-tables.c b/arch/arm64/kvm/vgic/vgic-v5-tables.c
index 8f72704209b0e..ae5f380fa783c 100644
--- a/arch/arm64/kvm/vgic/vgic-v5-tables.c
+++ b/arch/arm64/kvm/vgic/vgic-v5-tables.c
@@ -1207,6 +1207,14 @@ static unsigned int vgic_v5_ist_istsz(unsigned int id_bits)
 	return GICV5_IRS_IST_CFGR_ISTSZ_8;
 }
 
+bool vgic_v5_lpi_ist_id_bits_valid(unsigned int id_bits)
+{
+	if (vgic_v5_irs_ist_levels(&irs_caps))
+		return true;
+
+	return GICV5_LINEAR_IST_SIZE(id_bits, vgic_v5_ist_istsz(id_bits)) <= KMALLOC_MAX_SIZE;
+}
+
 /*
  * Allocate an IST for SPIs.
  *
diff --git a/arch/arm64/kvm/vgic/vgic-v5-tables.h b/arch/arm64/kvm/vgic/vgic-v5-tables.h
index 89096926563f7..ba049978157b1 100644
--- a/arch/arm64/kvm/vgic/vgic-v5-tables.h
+++ b/arch/arm64/kvm/vgic/vgic-v5-tables.h
@@ -123,6 +123,7 @@ int vgic_v5_vmte_free_vpe(struct kvm_vcpu *vcpu);
 
 int vgic_v5_spi_ist_alloc(struct kvm *kvm, unsigned int id_bits);
 int vgic_v5_lpi_ist_exists(struct kvm *kvm);
+bool vgic_v5_lpi_ist_id_bits_valid(unsigned int id_bits);
 int vgic_v5_lpi_ist_alloc(struct kvm *kvm, unsigned int id_bits);
 int vgic_v5_lpi_ist_free(struct kvm *kvm);
 

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.47.3

