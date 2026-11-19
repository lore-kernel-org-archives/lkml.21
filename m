Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795091989;
	b=gtq8iLQttIIEI7fq2rzFI9GcFiElkYduBBSyRXJdH5/D8bAI95A88GHqJ9AOVcSMwbyo
	 78rK+W4VUjywrG/lssxlltD4g9D73hUqVBE4OXqzXkeAHpB5stfVw9DhY2aasyxfRuuoy
	 zzkYAwAI9B1G7Aut6ZbqExfnU+0lfNV1a9eAEHry9lBPJSRHyimP+v98ANJWBCBZlJkgo
	 g/54FptQrFmwySi3q7/KNiWbvRwDv98cR892biRF1mlQ9pBwGQR5cTXe7+eYBzWiFWzMf
	 YHt6zZhXqym9js07d7XbKyih9tb0zlEA+DJvGIVjJsI6Q8cyM9En+998iLcXEWPK1Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4j66UUUyFDica/rtzcFfGexPD2kyfgX64rNkVvuVvdM=;
	b=vVAjmdLPlY8rL6T1THiZzECqGJM6cqd3qFkENIRmukKKxaZKDckCUD6uZoIUaSZhY5jg
	 6zMUdjja8vZeh4wC0h5jtQSNvyBOdRsgK1zdsuwVIlqhvgGVyOQ0HbDGto3Zq1crnmbwP
	 a+/fX1h56bGSpr1h/xYIadnzXUx8hZJ2EoC8Jxwqb+8KkeMADv7GkF+G2rkf6iJ0F5IdO
	 V1nHVBuf+Xz30MmKCFoyNCj1NcQ0G/J7YA8sq3y0WOh+oRnCErC95GeMWrJzVo+CU9PVy
	 c45cBmjwzaxzgL8TQ8VkygCQDO9FPAcfxzM84zRajP+FiMF7anmn3oWTIHPHfTc4cHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=0x0f.com;
	spf=pass smtp.mailfrom=0x0f.com;
	dkim=pass header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=K3cHhInK;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9363A60A3813
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:39:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9363A60A3813
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=K3cHhInK
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso1360297a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1795091989; x=1795696789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4j66UUUyFDica/rtzcFfGexPD2kyfgX64rNkVvuVvdM=;
        b=K3cHhInKoCPbOcYeGiOICqq6UItrLOWhZSW0BcfkCKUm2LTBzEZHzyt0UfmV34xUvW
         OBtjDj/cIAWp7hLAI9JS3E1uwBI21Ex8KPve4XTukDsKkAgr7SFzunNA0LocMnjfgG73
         goO5Y7meTopg/IdgDs7HFwgw3bRngRBMmbImE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795091989; x=1795696789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4j66UUUyFDica/rtzcFfGexPD2kyfgX64rNkVvuVvdM=;
        b=DJp98eGzd/D2LshkwD83BOj2XerBQNBTxDZG6zkV39QfcDKXeMg2DdD5R2xfmxu+Ya
         r7bf4Zpc4TSEfvK3BkQMy/bT3BOCtNkF9NFZrWeEpXVldFx109QPxPbCOYGVsssCLHzb
         +Uma5ROEMz4IcFD5wUFqv7WrtcwDTf/GjEsboCXKL4YxvXv9R/IqvyWAw9seqKYX8mYe
         t8QFRj41rPUcxVoRBd1FsRiDmJblYB+DFPOc7WUj80ubWl/7EwiQ6LCvr2ttqvl8DpVx
         gGkzo6y4tOYJP4uxcFT7Y5J3W8gXbR6lJ8PiCdwl76MY3j2WNxyGQ93tEOt7DtTYDaGF
         cpvw==
X-Gm-Message-State: APuU4Z8G22BGpdyybx6S9xXHiTgJFiW6wAx4+CKEbk1tOJfxyvMuuX/2
	3gNGIlJ7V/Wo4Uku1u2bFPTeZExpBd5QJcGnHBbaMCSBzfPiKi0aeqCAcR0dwywgXfk=
X-Gm-Gg: AZFdTZf4utxX78uGvWUAaimsLgiRSPIZoBJVTLxNN2qbto2gOryGwuyH/VYlVIpURXF
	7oW2li46veGv8KZpqxg3+KgCUDcdwYa/mZwYt7XSYi/8Rb7AhRH23OjUW6yHVvvvLedcgGGV6zR
	QuWSVtzsLY9J45iQ5FXNtRDkgRa9+qkCsOaquMH2b1Z9onT15C1n71k+MtXVKJWei+pcXAwdsXV
	cvO0PWuKezf0VR2puwhyDlGu8fSXHdd04DznpQwOj2i/RHpQe2MuAsPAneoq8UT7LWVUUGaZ8j8
	t/7k6b3oAFgZp4E8+D/GlYvdqlmK2mG7TRUxzS8JhnH1cLiHKdlNc6dsq4qk3J0A19GElYt2hG6
	QgOo4bdpzgrLwoz7pCYQt9CXMUZxrDNZbiFSCTOIQBNKnMr7gzqfYTMXDXSlgUIYPzpNZCnlEVu
	0FaPvP9XOka652rc4JO1LpmuED4HlhFmAVZ/82XTuvhM0DPaLP3r7vonNjxZ8sLffE8C7/nhBXP
	nxJ97T9puXSp+MWsuIKypWFpfi0qk7s4rkVYCJj+AVgG0/CuroPxhAE/riYSgnqBNuu93HHtJ3l
	RQALLBO0j782e9V3LHZSZEvclnsT1IebPvDSbEMxrd/h5PNBAe1ymBjFTbXk+vE9WteVZg==
X-Received: by 2002:a17:90b:1d04:b0:3b1:6cab:f68b with SMTP id 98e67ed59e1d1-3b3d075985cmr5661944a91.11.1795091988924;
        Thu, 19 Nov 2026 04:39:48 -0800 (PST)
Received: from shiro (p1799054-ipxg00e01sizuokaden.shizuoka.ocn.ne.jp. [153.207.155.54])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b405d11753sm2696299a91.5.2026.11.19.04.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:39:48 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
To: geert@linux-m68k.org,
	gerg@linux-m68k.org,
	linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 4/4] m68k: show the 68060's PCR in /proc/cpuinfo
Date: Thu, 19 Nov 2026 21:35:58 +0900
Message-ID: <20261119123558.2108296-5-daniel@0x0f.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261119123558.2108296-1-daniel@0x0f.com>
References: <20261119123558.2108296-1-daniel@0x0f.com>
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

Add the revision information etc from the PCR to /proc/cpuinfo.
This is useful to confirm the 68060 you have is actually the
revision written on the chip.

My Amiga A4000 with a full 68060, revision 6 looks like this:

  CPU:		68060
  MMU:		68060
  FPU:		68060
  Clocking:	49.3MHz
  BogoMips:	98.71
  Calibration:	493568 loops
  PCR:		0x04300601 (ID 0x0430, revision 6, superscalar)

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/m68k/kernel/setup_mm.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
index 41b595256ad1..c61c00959c54 100644
--- a/arch/m68k/kernel/setup_mm.c
+++ b/arch/m68k/kernel/setup_mm.c
@@ -451,6 +451,16 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 		   clockfreq/1000000,(clockfreq/100000)%10,
 		   loops_per_jiffy/(500000/HZ),(loops_per_jiffy/(5000/HZ))%100,
 		   loops_per_jiffy);
+	if (CPU_IS_060) {
+		u32 pcr = m68060_get_pcr();
+		u32 id = FIELD_GET(M68060_PCR_ID, pcr);
+
+		seq_printf(m, "PCR:\t\t0x%08x (ID 0x%04x%s, revision %u%s%s)\n",
+			   pcr, id, id == M68060_PCR_ID_68LC060 ? " LC/EC" : "",
+			   (unsigned int)FIELD_GET(M68060_PCR_REVISION, pcr),
+			   pcr & M68060_PCR_ESS ? ", superscalar" : "",
+			   pcr & M68060_PCR_I14 ? ", I14 workaround" : "");
+	}
 	return 0;
 }
 
-- 
2.55.0

