Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.85
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795765472;
	b=wkxtoFAPwu4sqk5b9lMO4r6dlu2gfWhidF3KaAWssU7OE3xKWJEbkPCPMTG+xm6t+05c
	 Ol3Nn831kmd7tZND6EhkqZ8VlQT+UtfUEpffLt3JqKGndBogWW8Co3NCDoQAZJtdFVIHG
	 49PV7FL66mBr/USvFQF8fDt3eYMDamroPSYyv/687/yV9aSkI2R2PNbyHmBsdbNpAjdBc
	 WItzQTuRlAkACRACpLC7XMO2/HJw9jfN1cE/hoTZ92tWdwmdVNECe29/Ytbru1NNt67fV
	 OqhFRlCIk+gSWILtreIAeAGTUnYtwQh4rJsK4smhiP+3n741TXss2bpbaC9FOQy+U2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795765472;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=PfLWt/mhe3ijyWglwaB5IfQna8Vw7CnfYmlMan//v7I=;
	b=j3PZdQjCsuS7BIHFFERe/DXIiaTbccQAo6za83LbxML/7OR38Rl00Fyk6ybacGZnp23h
	 UUWEAeXtPFPBpM0CifGCulvNtwC4xspEBR20VQ1smqS0Q9k540G1Tz0igQjKFi2jfJx/y
	 TVxy87pqwAHaFscs4fzJuP3XiWWyzfmSzRVlHKHfOFED5mme8Fk0nC7K0N45WoIZvubjP
	 B5ejbgZZ9qTolmPu5MQnRCni0KPVmgZV4TSQF90EzDkCYd1xAn6gEfAdDwxT0STM21Sl3
	 qk3QNOHWJyMVpSQd8k765gtR9JufvZSMfDrRINfkH6/p7IvG2XeJ1kS5idQDIyCmN+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eyNj+ChP;
	arc=none smtp.remote-ip=95.215.58.85
Received: from mta1.migadu.com (out-85.mta1.migadu.com [95.215.58.85])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E467606A323
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:44:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E467606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eyNj+ChP
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=c3dqd6wqmYVEYEGzelsBMY/LDII+k4nQoLCuh/aV6oU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795765469; v=1; x=1796370269;
 b=eyNj+ChPVw3fY497U85aRDDOfPiXTDCeakn9BkTCplR9jAnum73wcZOGDODUFuGi/b4nDdxo
 mlmsFzVuC6cHENErWzxT4ZePkvSEO8iu3KTarLzNZTFaTU9D8RAn685Q0y8LyCGM1uc+bZunSjx
 Ebumy5dBIlhga1S6xZpjKoX8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ec8fbecf27420b5a;
	Fri, 27 Nov 2026 07:44:29 +0000
X-Mizu-Trace-ID: ec8fbecf27420b5a
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2 00/10] arm64: sysreg: More input checks in the sysreg generator
Date: Fri, 27 Nov 2026 07:44:16 +0000
Message-ID: <20261127074426.50739-1-fuad.tabba@linux.dev>
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

Changes since v1 [1]:
  - Split the TRFCR_ELx.TS change into its own patch. (Steffen)
  - Reworded the leading-zero error message. (Steffen)
  - Collected tags from Steffen and Mark Brown. (thanks!)

After finding yet another bug in the sysreg file, I think it's time to
stop filling potholes and have the generator reject them instead.

The bug is in MPAM1_EL12. Its Fields line refers to a SysregFields
block that doesn't exist, so its RES0, RES1 and UNKN masks expand to
undefined names. The masks aren't used yet. Patch 1 fixes it.

The rest of the series adds checks to gen-sysreg.awk for input it
accepts while the kernel still builds: a Sysreg and a SysregFields with
the same name (Mark Rutland's suggestion [2]), a Fields or Mapping
target that isn't defined, an enum value not written at its field's
width, a macro defined twice, an encoding that's out of range or has a
leading zero, and a bit position with a leading zero. Three patches
prepare for the checks. One removes a range check that can never fail,
one stops the end-of-file checks from running after an error, and one
drops the leading zeros from the TRFCR_ELx.TS values.

With gawk, mawk and busybox awk, the generated header is the same
before and after the series, apart from the MPAM1_EL12 lines and the
number of digits in the TRFCR_ELx.TS values.

Based on Linux 7.4-rc3 (aebb727447640).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20261123075219.369042-1-fuad.tabba@linux.dev/
[2] https://lore.kernel.org/all/aLF9mSCs1B2gk8BU@J2N7QTR9R3/

Fuad Tabba (10):
  arm64: sysreg: Map MPAM1_EL12 to MPAM1_EL1
  arm64: sysreg: Remove the dead range check from parse_bitdef()
  arm64: sysreg: Reject a Sysreg and a SysregFields with the same name
  arm64: sysreg: Don't run the end-of-file checks after an error
  arm64: sysreg: Reject a Fields or Mapping line with an undefined
    target
  arm64: sysreg: Drop the leading zeros from the TRFCR_ELx.TS values
  arm64: sysreg: Reject an enum value not written at its field's width
  arm64: sysreg: Reject a macro name defined twice
  arm64: sysreg: Reject an out-of-range register encoding
  arm64: sysreg: Reject a bit position written with a leading zero

 arch/arm64/tools/gen-sysreg.awk | 48 ++++++++++++++++++++++++++-------
 arch/arm64/tools/sysreg         | 16 +++++------
 2 files changed, 47 insertions(+), 17 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.47.3

