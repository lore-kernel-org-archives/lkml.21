Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794975257;
	b=bSfNjMDRhKTGf/quD2DPH56T+AASFcJfD1xSsD/0IxCfc9F7zxnd7aRjSkfjJWko6nOM
	 TWmwaonsIj7/ODfI++ngE+FRETkJGfUTPdPGDOVxlGs0xAFvgpPkhZbJcefW24DDM3yI3
	 MCimODiBpbyT2EmJltHEwkoUuiCa4f1VcFkxRJXjpJZyHWimb9TBNBFpEr9C4TEr4KGte
	 9DH0wNqTwl9X5i7E/k7M8KYWjCZgtTdH5q5ag2wN3d66pVKAkwyJm4EeuBnVmNZbwIvgP
	 kbIkfNBZFAQHn4/X9HI+d09LvpKpS3z5tuA52//ScDKveXb78CylzlG+MymFT0yBppA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794975257;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iArswCvl2LjsC7ZL9+rF2SjrTBAncR4rm+LB5wFBbbM=;
	b=Mqo5txurBCP528T8AQU+/z1acRoMRDQSkiTcs3CsdG6eAtkdHaXhHxJi1LVWBETD5aAd
	 iQcdjuXlmLQvgYQr+Yk2P4yF3yf7pMxi4qB6uv2D3qg4hdBatmsXEnjhtY2L2oSh+RZCz
	 SAMnMjh3PvwCVjzzImBphqgkCWUs4cHrObB/W++xJvSbrMVFzobEGcWq9LlsedAik/QYV
	 DVOnl7LgsvAfNBJhf9gZarbkGCM2LG3kU5O2Kms+yBwU49/s+LlLn+kipeuotJJqcBZ/X
	 IAOU89a/fCn2xp8dRDMJYe9Y1yK1CmSGQF+pgbBjaMmKVIPPm81deGmDZ0y2gDUzmIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IDRbmZmF;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC551606A339
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:14:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC551606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IDRbmZmF
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e987a2ba0cso3550105ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794975256; x=1795580056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iArswCvl2LjsC7ZL9+rF2SjrTBAncR4rm+LB5wFBbbM=;
        b=IDRbmZmFpODZX2t0AiqXHjmXH+UuD44aleFs8mw8Rgrspkue5Xq6jAAQhVPB6TJRvM
         BJ9/4TU7RckWxXeLIbETYdFw2NsOGoxJSxlaydVDd3tcrRMIoEOrbZ/bOYE5eyc+4fhK
         g91sSiBZ48odmrz55yPQovvLiGKkw3LrjX4nh1W/X11lI5htjPuvFqk3ZBD8ln7Qrwwg
         qzfHm+TjG2oXfiXDciZkFxK5exEUrRqRgGO+8zeaTdTOyQhOpjeqW5n0KtDLFI5G/Nfu
         sKQk+c/KpQVjPL0rRM/WwRRteGa4RAiPREgDUdMmww2OraRlCutzjS1DvQweLo7K4CzW
         XIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975256; x=1795580056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iArswCvl2LjsC7ZL9+rF2SjrTBAncR4rm+LB5wFBbbM=;
        b=JH7R3HprQfGRwjxVbKsw0bAS7+cJbG9lHQe4VKIRCGJ/gnfa+i8+AtPMnyMRsRJScf
         noF3JP+OsJIFvxvXHx1XvPJPO12d/RPmViSVbs0v9MVgyiwoaD+u09e4GrQQZMmYmh6n
         ATxkRNomC5HZ2SpwiCor5OTGP1I4aEFniyaaUQMX5bZwrorsxHNeb1+hmji9s7dWssrw
         BVURIQJE+ilXeQfjUVavTOoLDFo/datHVRCIklnfGhn5uDWjH+IjY1qOQOoPv26ODC9Q
         3LTfvRHnqfpVBy/qDEu9rHt+T0pFf7AaOz1YrKr3aZ0AK0uYnWxRsoA2XzyzbtU6fenw
         5weQ==
X-Forwarded-Encrypted: i=1; AL+hErHF2sBSo9AdRfvoirHIU5iU/ubrwnRvYaKO7TUUk0ufAQgjHW9RUUitba0vscm8RaJkC+zxF7egDGuu3KE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9B6Piw7/Sp8yazypZJCU29ZjTJSjIjfZO888uKkR9KSZlmZIC5
	ClX8kgqiNaZ+4cuTd2LYb2PVoajUELG0Jx+mx5dgpR+Jp6C31UvSiPUm
X-Gm-Gg: AZFdTZfrZstW1GmtoZMjCQHsD8IGyCMRsB9yP5zG/QGnHEOBKnhBBsnmGon2wRl3HWN
	yiH1te8zzNH8OMFL6nN1ukp6TLGlerjcbM4AOlQgK/u+8ZuGx4iagbetcZwbWBDXXcVVjjbPcTv
	L9ok0avQHiF7PDnoPgfN6dy1Cv4g0JbM6SURi6yW+foszitGSUIZLbemymOK/il9s7mIXUeJEU5
	QVJY272UCUefzahjO1o45L1PcIM4wbQuO5lun7cjHzx6hMclJgAV6aMz6k/gGyLaz2TJrctytF5
	Uk/ebqZmZFraBlQH5IxjVcc7nbIjovrzKsQ3weNxzk/xfhPLDNwNveTWLunIQfr6hgC/n6rqJTD
	w8J2sLDG00DjHLPCqTi/fmdv9nMfF7iafq25Z7JKag1+sok+ka23pUsZPlZyHJnsjOpyjz6pM12
	5iNkcdBJ+5pxpM8ZpubpJ6m99wjejL25R67hnyxLJBVCo728Gukwr3JWbf6khjaQy95jb2a4JIn
	NmskNcIPil/6x+tr5QMtO10LW0MUAYsKoGqoUnVex+4/iBZc24mcKa2gIAAZFpQJH44jrl2KIEJ
	5W0fCWdIdwPRC3vljgQQbw==
X-Received: by 2002:a17:902:e54b:b0:2dd:ad74:ac28 with SMTP id d9443c01a7336-2eff73f8febmr13805005ad.26.1794975256187;
        Tue, 17 Nov 2026 20:14:16 -0800 (PST)
Received: from gmail.com ([2407:cdc0:d002:0:188:253:12:32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6214f4dsm5728685ad.43.2026.11.17.20.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:14:15 -0800 (PST)
From: Jia Jia <physicalmtea@gmail.com>
To: "Martin K . Petersen" <mkp@kernel.org>,
	Jan Engelhardt <jengelh@inai.de>,
	Hannes Reinecke <hare@suse.de>,
	James Bottomley <James.Bottomley@suse.de>,
	Akinobu Mita <akinobu.mita@gmail.com>
Cc: linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jia Jia <physicalmtea@gmail.com>
Subject: [PATCH v2 5/8] scsi: target: copy a DIF verify tuple across prot sgs
Date: Wed, 18 Nov 2026 12:13:08 +0800
Message-Id: <20261118041311.19011-6-physicalmtea@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118041311.19011-1-physicalmtea@gmail.com>
References: <20261118041311.19011-1-physicalmtea@gmail.com>
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

sbc_dif_verify() enters its loop when any byte remains in a protection
sg, then accesses a complete eight-byte t10_pi_tuple. A tuple split
across entries can therefore be read past the end of the current sg.

Use the tuple-copy helper to assemble a complete tuple before checking
it. If the protection list ends partway through a tuple, return a
guard-check failure. Keep the data-cursor adjustment ahead of the
escape check so consecutive escaped blocks still advance the cursor.

KASAN reports:

  BUG: KASAN: use-after-free in sbc_dif_verify+0x5ab/0x790 [target_core_mod]
  Read of size 4

  sbc_dif_verify
  target_execute_cmd
  vhost_scsi_write_pending
  transport_generic_new_cmd

Fixes: 41861fa831af ("target/sbc: Add DIF TYPE1+TYPE3 read/write verify emulation")
Signed-off-by: Jia Jia <physicalmtea@gmail.com>
---
 drivers/target/target_core_sbc.c | 112 ++++++++++++++++---------------
 1 file changed, 58 insertions(+), 54 deletions(-)

diff --git a/drivers/target/target_core_sbc.c b/drivers/target/target_core_sbc.c
index 780f526c4d931..360a9af0cf66f 100644
--- a/drivers/target/target_core_sbc.c
+++ b/drivers/target/target_core_sbc.c
@@ -1491,81 +1491,85 @@ sbc_dif_verify(struct se_cmd *cmd, sector_t start, unsigned int sectors,
 	       unsigned int ei_lba, struct scatterlist *psg, int psg_off)
 {
 	struct se_device *dev = cmd->se_dev;
-	struct t10_pi_tuple *sdt;
 	struct scatterlist *dsg = cmd->t_data_sg;
 	sector_t sector = start;
 	void *daddr, *paddr;
-	int i;
 	sense_reason_t rc;
+	unsigned int poff = psg_off;
 	int dsg_off = 0;
 	unsigned int block_size = dev->dev_attrib.block_size;
 
-	for (; psg && sector < start + sectors; psg = sg_next(psg)) {
-		paddr = kmap_atomic(sg_page(psg)) + psg->offset;
-		daddr = kmap_atomic(sg_page(dsg)) + dsg->offset;
+	if (!psg || !dsg)
+		return 0;
 
-		for (i = psg_off; i < psg->length &&
-				sector < start + sectors;
-				i += sizeof(*sdt)) {
-			__u16 crc;
-			unsigned int avail;
+	paddr = kmap_atomic(sg_page(psg)) + psg->offset;
+	daddr = kmap_atomic(sg_page(dsg)) + dsg->offset;
 
-			if (dsg_off >= dsg->length) {
-				dsg_off -= dsg->length;
-				kunmap_atomic(daddr - dsg->offset);
-				dsg = sg_next(dsg);
-				if (!dsg) {
-					kunmap_atomic(paddr - psg->offset);
-					return 0;
-				}
-				daddr = kmap_atomic(sg_page(dsg)) + dsg->offset;
-			}
+	while (sector < start + sectors) {
+		struct t10_pi_tuple sdt;
+		__u16 crc;
+		unsigned int avail;
 
-			sdt = paddr + i;
+		if (poff >= psg->length && !sg_next(psg))
+			break;
 
-			pr_debug("DIF READ sector: %llu guard_tag: 0x%04x"
-				 " app_tag: 0x%04x ref_tag: %u\n",
-				 (unsigned long long)sector, sdt->guard_tag,
-				 sdt->app_tag, be32_to_cpu(sdt->ref_tag));
+		if (!sbc_dif_prot_copy(&psg, &paddr, &poff, dsg, &daddr,
+				       &sdt, false)) {
+			cmd->sense_info = sector;
+			return TCM_LOGICAL_BLOCK_GUARD_CHECK_FAILED;
+		}
 
-			if (sdt->app_tag == T10_PI_APP_ESCAPE) {
-				dsg_off += block_size;
-				goto next;
+		if (dsg_off >= dsg->length) {
+			dsg_off -= dsg->length;
+			kunmap_atomic(daddr - dsg->offset);
+			dsg = sg_next(dsg);
+			if (!dsg) {
+				kunmap_atomic(paddr - psg->offset);
+				return 0;
 			}
+			daddr = kmap_atomic(sg_page(dsg)) + dsg->offset;
+		}
 
-			avail = min(block_size, dsg->length - dsg_off);
-			crc = crc_t10dif(daddr + dsg_off, avail);
-			if (avail < block_size) {
-				kunmap_atomic(daddr - dsg->offset);
-				dsg = sg_next(dsg);
-				if (!dsg) {
-					kunmap_atomic(paddr - psg->offset);
-					return 0;
-				}
-				daddr = kmap_atomic(sg_page(dsg)) + dsg->offset;
-				dsg_off = block_size - avail;
-				crc = crc_t10dif_update(crc, daddr, dsg_off);
-			} else {
-				dsg_off += block_size;
-			}
+		pr_debug("DIF READ sector: %llu guard_tag: 0x%04x"
+			 " app_tag: 0x%04x ref_tag: %u\n",
+			 (unsigned long long)sector, sdt.guard_tag,
+			 sdt.app_tag, be32_to_cpu(sdt.ref_tag));
 
-			rc = sbc_dif_v1_verify(cmd, sdt, crc, sector, ei_lba);
-			if (rc) {
-				kunmap_atomic(daddr - dsg->offset);
+		if (sdt.app_tag == T10_PI_APP_ESCAPE) {
+			dsg_off += block_size;
+			goto next;
+		}
+
+		avail = min(block_size, dsg->length - dsg_off);
+		crc = crc_t10dif(daddr + dsg_off, avail);
+		if (avail < block_size) {
+			kunmap_atomic(daddr - dsg->offset);
+			dsg = sg_next(dsg);
+			if (!dsg) {
 				kunmap_atomic(paddr - psg->offset);
-				cmd->sense_info = sector;
-				return rc;
+				return 0;
 			}
-next:
-			sector++;
-			ei_lba++;
+			daddr = kmap_atomic(sg_page(dsg)) + dsg->offset;
+			dsg_off = block_size - avail;
+			crc = crc_t10dif_update(crc, daddr, dsg_off);
+		} else {
+			dsg_off += block_size;
 		}
 
-		psg_off = 0;
-		kunmap_atomic(daddr - dsg->offset);
-		kunmap_atomic(paddr - psg->offset);
+		rc = sbc_dif_v1_verify(cmd, &sdt, crc, sector, ei_lba);
+		if (rc) {
+			kunmap_atomic(daddr - dsg->offset);
+			kunmap_atomic(paddr - psg->offset);
+			cmd->sense_info = sector;
+			return rc;
+		}
+next:
+		sector++;
+		ei_lba++;
 	}
 
+	kunmap_atomic(daddr - dsg->offset);
+	kunmap_atomic(paddr - psg->offset);
 	return 0;
 }
 EXPORT_SYMBOL(sbc_dif_verify);
