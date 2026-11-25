Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630865;
	b=XYSiQyJT1rXUhoqTCsKyGiPbrrwbMrBPK7F4wZrJ0PiCQreszUkTtFJL4R4VEs1RORs0
	 Btl+9xFLAP41apvQmxiTQ6LJZOgqZ6jTrVEC9GMz4n4ZkpYcombENrJ7W3LcBYTDBN/GM
	 qD6fbLf7iE5dJOKyM5BWJVcDMTE8vwmJfhl2XNnHmXRXdLqXntJOueQrkRHXpoeN+MvoU
	 WWR9AoUy5E0+ZClmkMkWs/F6eL2yCZA9tXAQLtQBjqFjQ8h0J4FPZJZZpQKaXClffRHjz
	 G66HpXJeY3sJlG8FFGiX5ZrXCfiH4Ry+y/HRs5YVzBg3/vZDSVDRSg9NCE6bJD7NFRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630865;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=6b8iqkpAnic8aYFUTWit4E+L+/N2cQqDU3rU0AhCuwM=;
	b=EAoOKvINheJZmklOFHMeEdTJEmQ9nUcJdoJtgSteIKrwM/0DteoMBmQp011I17hThXPM
	 rnYEVG/6x84qAaDll4gNK+inSPRp0C7MVuAvNVOOFv0TRhFLEuK2SUJ6ojwPKOReIQ3HZ
	 DlLiPs7l46zkXSFXmX9vMJhr7fSjoD94ZcG3k2niqLYGY31N3ZfPgPSMqHXuT4sxR0jS3
	 O8h9/69/PoWPvtoC2Ai4tDYB3lkisyHSoA2kC1ofeXt9A8bYMV/hL2LUBMRukts2t/nHC
	 pQSL6xsn7VUzK5zjKE6QOjHVooDJ5XIF0Wz62yihYriuI0d8OIFpgZE5fhvJP07Vt9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="gOl/P67g";
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2902606A686
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2902606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gOl/P67g
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso3296020a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:21:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795630864; x=1796235664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6b8iqkpAnic8aYFUTWit4E+L+/N2cQqDU3rU0AhCuwM=;
        b=SNSDSyZZLqvEppW9lKzRR2ik3mjo+NAO/aHIa/ZCvqyW6ys7qeaKj3hmv+TPBCtNbz
         qT09ZN/U704nKmPxy3Vf92GH1H4wUg3oafBtYdO9xAOpcIdl8dl/S7kty6SzV5CCvAzP
         wmz5WNSRpIzNkR88E1huIareK3pexiOmUuogAhQfkCYT6J+AzRoqUCqNNutyUeRA5Caf
         FA5ZIdIhb/tai/8Z89LcmVZcbOdqDMfJ8I0P27NjQ9Ah8j3lumN+u/EvM6ph7Ft7VzyO
         E+LB7f87xYW5X0CtD9poWOOwQDm6HfwIU7A6y1S0dFvq9+3K4Dc9l8LPwzIhYIkq7afV
         e2Bw==
X-Forwarded-Encrypted: i=1; AL+hErF/NnUmf6h86F1oavbEMIzF3PP0VrUirun1h8dN0hdZpOOhOXZjK9FwDk+yQ4yoS0eD9iCi8yXb1x02FjY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+baMHUQkdZU57kMBVHZvh1UV3Nd3p9VBDFSu31i4MhxwVb2j1T
	oPDsdIx5K5V3IQPLQ6nGcIe+asaUHm4rSHoBjMdbgIcA3KPMdH9X7q9lonH1HbMF0Tsta187izD
	sUjfjEBYuooChh6fb5NdWsAAzIgfh1blfKKL+htc+q39fTUN1QmSR3uTjf8Die+03wfVjP8A2wv
	Ib+7CPyknIeohwCKVsmglVnKZRf0IUwduKjM42PnYMpRCNC1kK7g5up/+iLgm6AVRMGJANS7qic
	goj1NgNrTrTAsN4
X-Gm-Gg: AZFdTZfVrUm/ZIbM2noYmAfdwnJgf4zXr6oDBfWQPm9eTd5lIl+iY8k21eO4mgKdD2z
	RnlGAYMF0avh/S0Ufeutmo0Nc+fbLYaLlgPbA3CYkH61MN3U71WSvPD0449IuIQ6OtO2DgKUXhk
	okp26tggqFptyCePjYHyRMmOZVFIZQfu7c8wHfCkWdnGaf8yIaSogEd8a/Y8qZdysbeaknPwuMc
	DqDl7XJWlN4YK957GGIGg94gu+soXVhQux3hAKah+5v5l3CAof/0pEcecIuWfJBHoQp9jVtXcuH
	6gsxVyCMvLD2lSiT9LdMnnyCUHvpiZTJwwXh4SyS81lTStKfjZgMT9yQ6KXXhPfEXdKO88fi2qS
	50dakDAi0kSks4t85VicfYh+cyp2bubRxVE06tc3MFwSGB/s2YBIVb9kEwiC9MV8GlPa1imEfdJ
	hyF8K8IIFRkGIkKKH1jaHylqkZZUv4NtPG
X-Received: by 2002:a17:90a:e705:b0:3ab:1b1c:8a70 with SMTP id 98e67ed59e1d1-3b41c938d83mr16038232a91.38.1795630864181;
        Wed, 25 Nov 2026 10:21:04 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41ffed164sm6076127a91.4.2026.11.25.10.21.03
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Nov 2026 10:21:04 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-946038e22f5so234324185a.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795630863; x=1796235663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6b8iqkpAnic8aYFUTWit4E+L+/N2cQqDU3rU0AhCuwM=;
        b=gOl/P67gjjkFZEW5ieHCBToIlAmjGW+aA3n3HQFvqIFwyPK3VS16HKDtGmovsfWXku
         wSLoKmdoi/cLGQms69DUl1b1SasZr9YOdNTA4brqgF8+aGgDogrpp4yIj7N7SC5WtqIA
         SfMCpOoMOIY3IUSFjHxh+1VPUw2Xb+Tye2TK0=
X-Forwarded-Encrypted: i=1; AL+hErEJv68QiNX6RzMIkr82W/viGjnGRdiyBfDet7KwhQyNmiFv3HWim2J5BWOoLi+hiQuc69ZwD4ik0gC3/S0=@vger.kernel.org
X-Received: by 2002:a05:620a:1a0e:b0:93c:a40d:e3cf with SMTP id af79cd13be357-949ba828099mr3342613785a.1.1795630862678;
        Wed, 25 Nov 2026 10:21:02 -0800 (PST)
X-Received: by 2002:a05:620a:1a0e:b0:93c:a40d:e3cf with SMTP id af79cd13be357-949ba828099mr3342607685a.1.1795630861913;
        Wed, 25 Nov 2026 10:21:01 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb38322csm1375419285a.17.2026.11.25.10.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:21:01 -0800 (PST)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: linux-mmc@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>
Cc: Kamal Dasu <kamal.dasu@broadcom.com>,
	Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Shawn Lin <shawn.lin@linux.dev>
Subject: [PATCH v14 2/6] dt-bindings: mmc: Add reset-card-at-resume property
Date: Wed, 25 Nov 2026 13:20:49 -0500
Message-Id: <20261125182053.3915833-3-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125182053.3915833-1-kamal.dasu@broadcom.com>
References: <20261125182053.3915833-1-kamal.dasu@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On some platforms, firmware or other hardware accesses the card
during suspend/resume, before the kernel's own resume path has run,
leaving the card in a state the kernel can no longer assume it knows.
Add a flag property so such boards can tell the mmc core the card
needs to be reset before it can be used again.

This is expected to be paired with keep-power-in-suspend on boards
whose firmware needs the card to stay powered and live throughout
suspend: since the card is never power-cycled, nothing else would
force it back to a known state on resume.

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/mmc/mmc-controller-common.yaml    | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
index 2fc8e06d5ec9..c824b95f2ae2 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
@@ -303,6 +303,13 @@ properties:
     description:
       Preserves card power during a suspend/resume cycle.
 
+  reset-card-at-resume:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      The HW/FW may have accessed the card during suspend/resume,
+      leaving it in an unknown state. Hence, before the card can be
+      used, it must be reset.
+
   wakeup-source:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
@@ -371,5 +378,6 @@ patternProperties:
 dependencies:
   cd-debounce-delay-ms: [ cd-gpios ]
   fixed-emmc-driver-type: [ non-removable ]
+  reset-card-at-resume: [ keep-power-in-suspend ]
 
 additionalProperties: true
