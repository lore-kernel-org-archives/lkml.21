Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795420346;
	b=GodhJuXzHZuZJ9mtSntiw/XC9KT+fZv2O+4tCQWax4CMhzuCBYGSzkY6rs15cpYVqZkn
	 QGYBbmSJUlgtqL7qofeHoW4PntaCXK0njd2PD5KdVFqlzN+fgqb5mNnSRFaXFV5AemBdm
	 3TU4q/HkPBBmf6VPt38TsdziO/GrmfRbK5i3taalA0idUdIhjUYJ6/whO3tzr2Lj33MQ2
	 qBrPIjnGR4DFjIhskTpEoxv7+Me9YExvvY1vDL60WdV8f7ilILz8pIP3CAAKL65O30nYE
	 /Wk5QNs0D8LUfJyxI32Jkg9D8v1edArCcwv4U3Mw9Lwy9Kzw3b5kCfTLuhDZm204S5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795420346;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=vAXJFlo+YYwGzNbnzUk9I8X1XTMxTImLMqWG90QFCAQ=;
	b=5Yio7UNe/D2Lo2l6FK9W0ThnVp1rqfHDT2nm7Ks9U8+oVagRF2A4w6Pj7VOGRfZkf8XH
	 97CqTrlo1Y+WMvaTXrKCQyF8eZkK15GQ8/zZfGYqfhv9KaUJMfM0zFnULVDngRBGreNs2
	 UnvDz9mTUWDOwhuQP9XmSL2T4Bqs//3wDT1q7b2Hp4blbnqAanNoFrET2zXjvEYqF47BG
	 I4dcdJtet++znm2Oa+9kgJiQ2uIhbU7ZxulV1xHmX6tcdSD6Hdgg0RNovJvATAInQ6VAQ
	 7BaCNmM+OAqRm6dR59xq4nO01wlz7ZV8ma0aPi2b7H5ucRUbtWRNX6LoJteff3HQFsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cBPZwIo8;
	arc=none smtp.remote-ip=95.215.58.131
Received: from mta1.migadu.com (out-131.mta1.migadu.com [95.215.58.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE45606A685
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:52:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BE45606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cBPZwIo8
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=JBWy6UtAH7XEsQk9PT5UbS91XMRAaxx+pdJcqZHmb3Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795420344; v=1; x=1796025144;
 b=cBPZwIo8ozSLewwyQleEX0006BiDI+kpFJ2r9MBZJx+kjXoOVw2RpJ2hNuUG28jdnyW+pOe+
 vxRGEg4j7VlTXVmtlfMzkCbc63QpAZyYI/1PgfruLZ3ob4b5fWG+Y9cwu6FJa83DKyU4+0t5fyL
 +CgmhIedo5iS9yMlRimoPXBY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4922f193c2d48cd4;
	Mon, 23 Nov 2026 07:52:23 +0000
X-Mizu-Trace-ID: 4922f193c2d48cd4
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
Subject: [PATCH 0/9] arm64: sysreg: More input checks in the sysreg generator
Date: Mon, 23 Nov 2026 07:52:10 +0000
Message-ID: <20261123075219.369042-1-fuad.tabba@linux.dev>
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

After finding yet another bug in the sysreg file, I think it's time to
stop filling potholes and have the generator reject them instead.

The bug is in MPAM1_EL12. Its Fields line refers to a SysregFields
block that doesn't exist, so its RES0, RES1 and UNKN masks expand to
undefined names. The masks aren't used yet. Patch 1 fixes it.

The rest of the series adds checks to gen-sysreg.awk for input it
accepts while the kernel still builds: a Sysreg and a SysregFields with
the same name (Mark's suggestion [1]), a Fields or Mapping target that
isn't defined, an enum value not written at its field's width, a macro
defined twice, and an encoding or a bit position that's out of range or
has a leading zero. Two patches prepare for them. One removes a range
check that can never fail, and the other stops the end-of-file checks
from running after an error.

With gawk, mawk and busybox awk, the generated header is the same
before and after the series, apart from the MPAM1_EL12 lines and the
number of digits in the TRFCR_ELx.TS values.

Based on Linux 7.4-rc3 (aebb727447640).

Cheers,
/fuad

[1] https://lore.kernel.org/all/aLF9mSCs1B2gk8BU@J2N7QTR9R3/

Fuad Tabba (9):
  arm64: sysreg: Map MPAM1_EL12 to MPAM1_EL1
  arm64: sysreg: Remove the dead range check from parse_bitdef()
  arm64: sysreg: Reject a Sysreg and a SysregFields with the same name
  arm64: sysreg: Don't run the end-of-file checks after an error
  arm64: sysreg: Reject a Fields or Mapping line with an undefined
    target
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

