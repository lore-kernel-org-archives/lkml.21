Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795059621;
	b=ipE2hprjcdSHCOxYKoLFmm7YcpKUGp7cZUJNBoUmj1tA/InQY7U2wcWGdt6o2oVW54Qu
	 UKfRQC562IH+m4OmlrhZxv7Bb8hAPKc3zsVCRiJUkIjbi8H4BfH1gyK+G6xn+sZVE7ov0
	 ozEsXv6if7yI/ZbF3d4SXvqF1rLFOrr1T1KcEEKctbIbPIWBNdsA4MzcF2C5AAjCkCDpQ
	 +ADYUgfpchgYKmQe0bh9n61nhv1VhvGCInXXlbRy3EStk2sfursTOd+3TsICmDZxbbf/J
	 TmxyT+FoLFay3+zAioyO5SKFT++Pf8TQmaYDEfjgzhqzMzz9MntK3zYCSTKyUgS2x2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795059621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iMwW2JLY+HI916hc5v6/gg4kWQ5njDV9vffDoqUd5vA=;
	b=gYFUb9cyt6lvn8HcH6OFEOIMvinVLCKIQ59BFFNW/z+YsiuzzhXYY1XO8zUIcbEF3QYQ
	 K5Gtmzdae/5DhQ6WzN9tEOcAlI4ihaJ8UVS59+9dmXRbXmxsm08E/Rlq0oT9up0uOrXiM
	 wbz8StktUTof6UZxzmXR0EQxLsn6iGwyCfPGampHhV/xyQwNXEJKEnNA4Hw3++GkWNkH1
	 c1UIL6rFySZwDEUIV2udirkroWC4dnePka+I0syZ6KcrTi79DCe9x4dwwBX5naR081Ocq
	 bOGKHdF1BlqSSBmp3V5J61hJsFuI1x4tfrcci8pfKo7jlaICfowrmj8g4dGzAUqVO9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SBZuqBmL;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AE160A3827
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:40:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69AE160A3827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SBZuqBmL
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-381d542bc29so3310394eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795059621; x=1795664421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iMwW2JLY+HI916hc5v6/gg4kWQ5njDV9vffDoqUd5vA=;
        b=SBZuqBmLU9LOEikNRobY2JYWdchj70yf431ZxesPsVXF/fwU1i1wibqDV/Yx96w9cy
         fjP38Z6KPC7DNZTo9LwfzSwSg8aZeRB7bSTgOVXMhoOw0OaMGpgz1P8zkk85gwyf+ZgL
         xuXD4+8+hMJH/xexA/bbS7Uu5BqY75rBLpkMzc2WCA36P6IRYYlb2cICMIh+nG9+BMeO
         zf8bV+a3GPv3nVjrur6JL6dXlJycPRXRPMQbcPxnnQTFA5AtQr6OIg38mSMSBTsKWn8F
         kqJQOv5uz08X5ZOKoTuDvvneiNQ6xxAx3eXjDmi0Nz1hKg82pW4figUWIKmHC24beRTj
         v9eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795059621; x=1795664421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iMwW2JLY+HI916hc5v6/gg4kWQ5njDV9vffDoqUd5vA=;
        b=CZPjJoOOw7oNDd9C+WpSf2PffSQv+RFpcwIapODoYHDicy3isvWZaJATliACtYkHxp
         EyjjsUuXpOPmznchG7NzeTd1UkCpXMeXioFJr+jim7D/UsO7uHTsFn4bHyqWwx1dhej7
         NwcurQosFdK6HqSJQb0/znY5b9uZ8E4f2Qk6TNO75F0Y3ov/A1UvufY/V+gzCzsnv8/J
         khRgg0Litq7KCMAZDpIFtyy0+qsSeYKcSc+VBjG/wkwC72lWkxb2rMd6AB1a7e/3EV6j
         sg3cJJgxHsFB/Vmg+NxZlgt6Oj1XqJ59fcodXGUTXS4QWrHK6JnPzcGh53vRjRuBHdTK
         A5nQ==
X-Forwarded-Encrypted: i=1; AL+hErEVS9sEiX4mrhbWHozRAY5YGVvfdO3p4JVp0ERBMErl6/obv0ov3fCUZaI15FbBSiwDM3ZABSJoOjpIdVg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vbSYYnoIFEhka3TIoRiHnbk8STCPgwmS9fbn5LBkqQ+wwgvrM
	Y8tMgc80iJwrljvig/RmZ6NKpX6ybAkmLkC6GMQQODiz/CSZIOtryAzQ
X-Gm-Gg: AZFdTZfccakEkMFCREUa49vwesy276JakQ9vvat/31/MfrZZbuZmzTBsTT1XP6B5qfx
	wAeTMtzMHEJZ2r6MVL61hdP0EZZr5ynhqEDnenLaWC/eLD3CIs2AD7oUDQ7SKaNsifLFZ/cMjyS
	ExPCTJoCtGDmSz/MBfRwRdQeyPSvbFBmDl8QlWFCRCFj0+xj2TTh60goMgAHIG/bIwRODVTxgZX
	cmQsP9PAB7VSNuFQAD7b38+5aEuRCJOjpBaVcX8OIUc1P3D5JpCJ7Tpwrhjh+Uo2oP2CCDgnHAI
	dh5452KBV6LL58UMElv3ogH0DhCpQpNLQkBq0CHmDT29eGQQjtmDPW7JV/mpH4/GJYHVf8Cgf7n
	w3dTS+aIsKSws1ACxfGzZpPIgNs94qdjL9gqdnfdO6aITxU3NKdgKccuT0xqwqcK3ONlHvEaM3W
	GRnDUVym/VljIm/+KaR54oVPFTxrnv6UNNLhGJpRRI9T7SNHALGUlSWcG4jFiij4Zx3RlGcYqoz
	+/TP+xV1ohloN/oqmnQL92j/Mt4oUnFitaWlLtJgnqh3v9zCYEbi/R8D4bZMHI56MptNGBcFZdC
	kBRiBq8ul/KzpoN27kh5xPKle1JBAV5OZg==
X-Received: by 2002:a05:7301:188a:b0:36f:4d62:2884 with SMTP id 5a478bee46e88-38281523fdfmr3808063eec.30.1795059620603;
        Wed, 18 Nov 2026 19:40:20 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a4522829sm12699465eec.1.2026.11.18.19.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 19:40:19 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	Marco Elver <elver@google.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCHv2 13/18] powerpc/pseries: Annotate the RTAS physical-attestation sequence lock context
Date: Thu, 19 Nov 2026 09:09:08 +0530
Message-Id: <edad5b893e5160a54bbe5c6b19c3aa31d2ac2793.1795058683.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1795058683.git.ritesh.list@gmail.com>
References: <cover.1795058683.git.ritesh.list@gmail.com>
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

Clang's context analysis reports:
  papr-phy-attest.c:154:1: error: mutex 'rtas_ibm_physical_attestation_lock' is still held at the end of function [-Werror,-Wthread-safety-analysis]
  papr-phy-attest.c:169:2: error: releasing mutex 'rtas_ibm_physical_attestation_lock' that was not held [-Werror,-Wthread-safety-analysis]

Add the necessary annotations to phy_attest_sequence_{begin|end}(),
to fix these errors for enabling Clang context analysis.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/platforms/pseries/papr-phy-attest.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/papr-phy-attest.c b/arch/powerpc/platforms/pseries/papr-phy-attest.c
index 350ba26e5962..d2bc5c0da422 100644
--- a/arch/powerpc/platforms/pseries/papr-phy-attest.c
+++ b/arch/powerpc/platforms/pseries/papr-phy-attest.c
@@ -133,8 +133,11 @@ static int rtas_physical_attestation(struct rtas_phy_attest_params *params)
  * @seq: user specified parameters for RTAS call from seq struct.
  *
  * Context: May sleep.
+ * Returns with rtas_ibm_physical_attestation_lock held.
+ * phy_attest_sequence_end() releases it.
  */
 static void phy_attest_sequence_begin(struct papr_rtas_sequence *seq)
+		__acquires(&rtas_ibm_physical_attestation_lock)
 {
 	struct rtas_phy_attest_params *param;
 
@@ -161,6 +164,7 @@ static void phy_attest_sequence_begin(struct papr_rtas_sequence *seq)
  * Releases resources obtained by phy_attest_sequence_begin().
  */
 static void phy_attest_sequence_end(struct papr_rtas_sequence *seq)
+		__releases(&rtas_ibm_physical_attestation_lock)
 {
 	struct rtas_phy_attest_params *param;
 
-- 
2.39.5

