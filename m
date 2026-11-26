Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692279;
	b=GV3M+2cswtCyhVOa27wTuSfnx46gGh63GOIVbI1ZBrdulmZm+0QY+2N47ergPhLek6oG
	 UaSbCsIENzsG5pGqXGPFPSoqbja23oologheo9RDCzUgHdKW2cIwN/LceE1qEArxnPFUN
	 C4POovAJdFIp2XB351rvOP8Btr9CwOi8d/dk4lV7RTQpcAj8aF4esjQ4WDWndxEqvpYVC
	 k0+4xUX6fclZm0OLNovi6QM6bbdwM2PgImeXxj+5iKZV8FvHqhv08qV6w0BwB7XDhWLlU
	 3xlr+JulU8vd8N9WCw5rlGjzW3j/C00tvRhA3Of0LTM1qPMNBxA7jqMld7uzH/P8F6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692279;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=RtGBYdm/FUjYm4MBKMDUIIQ/5FtiMze/DG46bNNvRwA=;
	b=y6cdiGkP+RrpLMxWWMRQOQXUyDtS1ipLOQOChq4ygCUXvA7WFejXf0Br3pmdRVvqDg+s
	 CCZ1kP4ZiHJ4WG10z5eFITch/6k8L/qbJ+jt6nr62wWb0sgTVT5deComk0Z/2OKNg3+0u
	 2frK6HFYn2T9qKFX5F37f91oUDATVFkmpBJ3aXEwgPsYsW2OTLfzUaIKxWwpW5zUEkV4W
	 GfXNrzg2+NY9TtiARc5GQRZJsUH+8EmdoaohcpnHuPh01g8AZVatumaw3VC6q9fUAVEI6
	 Dtr+Epyp59AeMPcuJnwsKalszArzujvK7JyQfcFsjsCy/8KsFs9gwbC7ms1NJRIrvDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="KLZT/4/H";
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64785606A6A2
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:24:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64785606A6A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=KLZT/4/H
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 58C8CC2B9C7;
	Thu, 26 Nov 2026 11:24:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 14DF560237;
	Thu, 26 Nov 2026 11:24:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8333711E6B371;
	Thu, 26 Nov 2026 12:24:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692276; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=RtGBYdm/FUjYm4MBKMDUIIQ/5FtiMze/DG46bNNvRwA=;
	b=KLZT/4/HFIBLzrjv6M1Zx3INZt6xexXndLt3GviwSuRe2EijQLbuZPhVgGN3gHxL43Qd0o
	ObTCQfa30a1r0Il6c8aOWvdWIcSp9EFkNaSIH+A7pusxTpFqiexMClS6gEInlaGpFfCMK8
	7ms4UYMk1gYRRc7fJLx84OBqQ8KYJdp70MZKed+w5dDbVXN8OViJYVFQcD9MsyphKN5n3s
	O3fdOopNJfE5QXAZcKk0UpWsAODgLIzl38aGLPFXlP9nnL60uSFq9QpOPOUmPzbJS8IlfL
	Zj9B4IjMNrAO2xOLqc1FNsAcL6AOU3s2eeIN1T2b8z7EKiaRoeHYS1WGn0ndvA==
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>,
	David Lechner <dlechner@baylibre.com>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v4 18/22] libfdt: Introduce fdt_ptr_offset_()
Date: Thu, 26 Nov 2026 12:22:35 +0100
Message-ID: <20261126112239.636284-19-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126112239.636284-1-herve.codina@bootlin.com>
References: <20261126112239.636284-1-herve.codina@bootlin.com>
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
X-Last-TLS-Session-Version: TLSv1.3

libfdt provides internal helpers to convert an offset to a pointer but
nothing to perform the reverse operation.

Introduce the fdt_ptr_offset_() internal helper to convert a pointer to
an offset.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 libfdt/libfdt_internal.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
index 8df9ffba..83e296b1 100644
--- a/libfdt/libfdt_internal.h
+++ b/libfdt/libfdt_internal.h
@@ -43,6 +43,11 @@ static inline void *fdt_offset_ptr_w_(void *fdt, int offset)
 	return (void *)(uintptr_t)fdt_offset_ptr_(fdt, offset);
 }
 
+static inline int fdt_ptr_offset_(const void *fdt, const void *ptr)
+{
+	return (const char *)ptr - (const char *)fdt_offset_ptr_(fdt, 0);
+}
+
 static inline const struct fdt_reserve_entry *fdt_mem_rsv_(const void *fdt, int n)
 {
 	const struct fdt_reserve_entry *rsv_table =
-- 
2.56.1

