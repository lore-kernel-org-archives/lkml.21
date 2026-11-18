Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795034188;
	b=cbzG4IyFT9bAS5iuSEfHC1xTnjL0TgADZbXso0jvt9zX3N+/JkThUQuHqiS6OQ522f9J
	 XPZ4mojOPaSXh7KNvJlxkLvcPVwK8SuX3JVW9gH8pBWsVwAQLjhvEO3A4pkOKFBui6wdN
	 aXSRAXUoNeZAzfey3+nZFdoxEldxDifuJI4ETZL5+fxAGRYjeJi3gphGGi4pLAoU5lmSw
	 2lI3+F/r2Y/UKWoCid6duosn8hLgctJw+AGLGWzQwVsBfXVExrRt1OIa3fy34Ki/w7IDW
	 6aXwfTE5z59s5jOS44GIf7A/9De1sBqwxEyL/p73bmx0ErGFkonmdyA38M2FWmi4T+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Qy1Eigf44guJ94H2Vo/9twz2OBsSX8Dgz4PNAs3gw1s=;
	b=VWrIgjoWvDYFw+3pp1xG03SgAeXmj2CKhwvoJ8jcmvcm3oXHCaHK40DUr/IqtEbmFpQp
	 ETO0qmlKHF/mghOAN7EmDalXgnnni3UV3r/Ooq6WJIvi2PHHgNEgd5cCnmJ+6Y58lSi8s
	 4+h8m0Jh1jO+Wzi47GO5FF81fUQVV8K1hv8I1pMh6oIBsoHWTbdzF/4WOPvlfVtWudRV6
	 CS73CEtlJ6/DnYTic8UDinGTLF89Ta9hV8MffYpMDLfj1ivypsug/frLGUZo5axq8osN6
	 F7EY67BbVu8TB+k7ywf1P5EKr/4PNPEWKAksiirhtjDipGJyt1EYkRR8F8HKm+Cf2cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PckooKN2;
	arc=none smtp.remote-ip=209.85.210.71
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0619460A2617
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:36:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0619460A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PckooKN2
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-86285932977so1662946a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795034187; x=1795638987; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qy1Eigf44guJ94H2Vo/9twz2OBsSX8Dgz4PNAs3gw1s=;
        b=PckooKN2eykq7JOfxq7iLxPJBY4cf3e6QOkzdBkVeWcEJibuMEQxzSMeK2Rd3s3kIM
         +GGobOcTZ0866B2sX63fhOtEAYO8KOxZd1QsgZ6Bl/lo3b/nZQV1h7SKgqogT3TGvnGm
         ZB8I8lTxGs8fSRO/yGAyjRrTCht571NQuLQVmaIY4/SH1kLbN/OvCPDqAoLBMiPX63Ca
         PLCC51X5LiLKOMhWg97hXFA54UBawOWO3ztFYjPnJZd4pMHJn0s3viL3nEpDt1COewDc
         MsxSdcqI2kuzgz3pdP8LCM+c5vjO/yEyEBSoyoIViShqNRD57WWEJwsr7IcA+pUN572Z
         nYaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034187; x=1795638987;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qy1Eigf44guJ94H2Vo/9twz2OBsSX8Dgz4PNAs3gw1s=;
        b=mFoFqrb+4uEiQMvThYm7ZPkq6G/WYS3Z9VBcUmVV1a/OfVHA4Ys0j4I1e4FaJj7MNf
         dawyXbeDc1md9KlWoJMBXM2bpSOPH1V55Ozcl4s6cHsAm5JzGEu15l51pnXxbsIHTg0f
         k4xhq3kdecAFiM93V9UzvIy0yIBrto0QYzM3nIG4JiLSZouz6mNkyIacw9+NXbWqwPAk
         /vHteM99eP1gIuAGf4m3P8Md+TC6yEj7hEQMyZJgzAbT+nD+UhgFN8VbYLiZ5zpxMseI
         rGbfCz72VUODk38GNYad6KycBm9wPxyeGLGWsSt8XiIKbY5++aH0iXJ5wWx5mlOYjU3j
         GzNA==
X-Forwarded-Encrypted: i=1; AL+hErGEVozJq+eP9oAe3m4TwwAeRUyPn+0X1KwSuD2MedLlClUzBigRrFbW9psk4W3otKWdVrlyNZO3ae1K9d4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+P8UgjKNggdN+ZIW9jjgIRT/wZN1PvcLDFNbFEcSCji4Ik1yHQ
	qgv6due3mT/m1kx0fJ48W29bqWkQQNZ1PNV7jwPJqgBWklJYSFcFEFxyWgBdXTx00GALIyj73nm
	0l5qvJOlhMogksfEGDcnTjjImTw==
X-Received: from iobmr18-n1.prod.google.com ([2002:a05:6602:a552:10b0:9d0:5c4f:1583])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1925:b0:574:c5e0:3d1c with SMTP id 5614622812f47-5773f0526e9mr5231001b6e.25.1795034186651;
 Wed, 18 Nov 2026 12:36:26 -0800 (PST)
Date: Wed, 18 Nov 2026 20:36:23 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118203625.743428-1-coltonlewis@google.com>
Subject: [PATCH v3 0/2] KVM: arm64: Force HCR_EL2.NV1 to RES0 unconditionally
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"

When commit b2a324ff01fe ("KVM: arm64: Use HCR_EL2 feature map to drive
fixed-value bits") migrated HCR_EL2 fixed-bit masking to hcr_feat_map[],
feat_nv2_e2h0_ni() was written as !kvm_has_feat(kvm, FEAT_E2H0). Because
ID_AA64MMFR4_EL1.E2H0 is a signed 4-bit field where IMP is 0, NI is -1,
and NI_NV1 is -2, !kvm_has_feat(kvm, FEAT_E2H0) evaluates to true when
E2H0 < 0 (including NI_NV1), leaving HCR_EL2.NV1 writable instead of
RES0 for VHE-only nested guests where KVM advertises E2H0 = NI_NV1.

KVM never supports a configuration where HCR_EL2.NV1 is non-RES0
(limit_nv_id_reg() exposes either VHE-only EL2 with E2H0 = NI_NV1 where
E2H0 is not userspace-writable, or FEAT_E2H0 without FEAT_VHE or
FEAT_NV).

Patch 1 drops feat_nv2_e2h0_ni() and marks HCR_EL2.NV1 unconditionally
RES0 using NEEDS_FEAT_FLAG(HCR_EL2_NV1, FORCE_RESx).
Patch 2 extends the arm64 hello_el2 selftest to verify via
KVM_SET_ONE_REG and KVM_GET_ONE_REG that HCR_EL2.E2H remains RES1 and
HCR_EL2.NV1 remains RES0 when E2H0 is NI_NV1.

Changes in v3:
- Drop feat_nv2_nv1_not_res0() and force HCR_EL2.NV1 to RES0
  unconditionally via NEEDS_FEAT_FLAG(HCR_EL2_NV1, FORCE_RESx) (Marc).
- Add Suggested-by: Marc Zyngier <maz@kernel.org> on patch 1.
- Add a comment in hello_el2.c explaining why RESx enforcement is
  checked from userspace rather than inside the guest (Oliver).
- Link to v2: https://lore.kernel.org/r/20261117204535.4036191-1-coltonlewis@google.com

Tested under QEMU 11.1.2 TCG (arm64, kvm-arm.mode=nested): hello_el2
fails with "HCR_EL2.NV1 should be RES0" on unpatched v7.4-rc3 and passes
with this series applied, with no check_feature_map() warnings at boot.

Changes in v2:
- Rename feat_nv2_e2h0_ni() to feat_nv2_nv1_not_res0() (Leonardo).
- Drop the guest EL2 MSR/MRS HCR_EL2 check in hello_el2 (Marc).
- Link to v1: https://lore.kernel.org/r/20261116200418.3535619-1-coltonlewis@google.com

Colton Lewis (2):
  KVM: arm64: Force HCR_EL2.NV1 to RES0 unconditionally
  KVM: arm64: selftests: Verify HCR_EL2.NV1 is RES0 when E2H0 is NI_NV1

 arch/arm64/kvm/config.c                       |  7 +------
 tools/testing/selftests/kvm/arm64/hello_el2.c | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 6 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.56.1.750.gf70dc682cf-goog
