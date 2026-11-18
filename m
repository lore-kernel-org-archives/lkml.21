Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794975261;
	b=2fTgzS1/XCCCHyuYTrzaSiVLgJNuXgFAi1sTA/5fo4SJ8TJqMJ+ahH7LApyF6RNODDyo
	 gTu+EG+ra5nERlrnlZkHJ60kPkzHZt7mBG6rC2yf9DcS9Vr9vriCLG6L/TyH5Mjt4CAn7
	 6wOERaEVz4G6yMwkEMnXztjeH+++uabvUe3S8SlnqgVlGqQ5AJCpc0/J8PAJKtFtqhMTB
	 Bey9oFvqsAWBQTPkhF1tRP33bcTxnpp7hZho2noljR9xX4n1GwkzEx4HFie3jiKyQiWve
	 KgJXi/oV6hlKtPEUYTKqw0/DlyoKnXcS+BLQ3MRif+21dVyRd7iWHnnqqZf+cjwDscg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794975261;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4EPtXfXi+2EbPL16b2IolFOUUw0gw3opbpAteqokiIQ=;
	b=1n3rM9aL1sy+74HvrZIPbjl2gzPc82b1VKOdlFWDBJ3oIbh7oRXe4rG+PdZj6nz96wUw
	 tA85kYp/ABiL6FZv+sx04yCXoSR3+WahvVkh8yl7X1ldTmfpWDi0Mp9/fqJcJJo76KL5f
	 3X+NaYYfNMrfO7y81f8TNEueIci+HX0Gfp4gdRDpTIU1R8fXXTcKt47RZmUv+0gaImbQf
	 BVzePVvmhftxbouyL6RIoRDZ6MqQcywIzHlEZ5WWoHR9Ktm3ksYhtYaQi3Jdv5VMDQIdl
	 wsJXez+8dxBBNYJKLNqUgIByvMhRtP9MsqhvIoDmB9FQG2t5ym9O1klSArchkQFBDkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="e68VGI/l";
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2864606A333
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:14:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2864606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e68VGI/l
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e9995ce866so4133675ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794975260; x=1795580060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4EPtXfXi+2EbPL16b2IolFOUUw0gw3opbpAteqokiIQ=;
        b=e68VGI/lF+mX+6ewyRYZZQF70PyW4ZTGPd6XyBNHGF5UfNFCGzWvxhf7T0AlarGiwa
         KmACcHZ2Uv5E5Ss0LZ9uF4/ZeW5aH2EAt48TxDICUuWf9S2/6jud248EXY3ISnoa9Bs8
         LJzaC/64g5E1yEq421kRJ0gbG2rt5qizNgLo3ZSxRDuxFYUiyJcUQOeMWBeMGDg8ytZf
         yr3fb0JN6FmC6nq8SohupXIwPoTDbvkELqr5saOl63KKsPNHvO7XE6uaAwlDp+sLtnzJ
         DGcBCRpq7hawIBThhAKqpxoa2E8tU+XxFG1Xx0w09pjR7RRv7jwCY89/jQ1idijPWmRh
         Nl/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975260; x=1795580060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4EPtXfXi+2EbPL16b2IolFOUUw0gw3opbpAteqokiIQ=;
        b=pNcrrNAJTKp+GUMl7qNSDQOhK9wNRRQFigls5IHHImTWl6o2HPCrO0eM//g/iqxkP4
         AADi0Dc3P52/AJBTnbViSs0+HKXvlt3vvRpLygjOGYwbPXCQ2Yuz9wfx8M4h0xQZLhEp
         gZKOeOMYzlPg4aJFIs25RxbPXSNsIQJbwWxfeb1h0Z6SRr/o4AhKFz3ngbKdJYt0l1cc
         ReBUzEDOIvS8ZCwty4mq4JN69gQTrEM0DmTwHZcLmuhqpWU7voiPfuvijNBxhVxIyJQ5
         dRbrFfUyKY/kJudTkzJa2bJN3bToxweYYgipv12qM/cHd3LGBptGa+0RtP5z6d+PCd7m
         LDwA==
X-Forwarded-Encrypted: i=1; AL+hErHFDlQ0Y/Cf2zF/CZ3AfTAQqnxI5NTkeyarJOOHYrDrOYUFYbDEcZVnT9O6qNr3VaM6Bz9qsss435jqTz8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iGgUSqJf3JFDnEuqVOXfw6u3cqCAitkqbn11DwWp9qNoyhB8S
	Bec5K8QEACZRk73b2aBEB+EnwEZ3b3GwCjcPCNuB+yfyXO9zZ3NJ9SWe
X-Gm-Gg: AZFdTZduJgs4IUqKBHCPCV16Z9bdzjs5VmMONbBs2sjU2oRzS6P1zeGUXjcawFe8Yys
	qzkdoVl0GHxvCyVksPMEAq4QRGJIy8EQFqWNWF9nuiMui9H0lwOZ9VOecuPA89iwziCDPxvfUlb
	sJc1GA1Bxg6vGQWamLEUqr4vHy8LFPPOu7jZnQ4Ua4FQVzdMoYSWXgod46VD32a9SUEQtcGKOoX
	IvzZKiSdvVH6q7eqEHlpXrtGcbn4DykQ3hnW3zgOULCLo9vPn7QkBGH44fiXJS+YrZ3ey7acyVE
	/X0nI66PJUle02GRreGTS8ZT6raY4R+lgQYR0y7pv14xikCeqflLUorlcKlHDSSb3mO39GYzuKa
	lB0ML5ty4UQAj6ODXoVetujOfVP7N+yw5le7yK1CdEjgN2e9Qrrxx+jUDS7zGA57JrqxjHTPIKB
	shLBg9jK+k6DxSO9akHoPO0GYw+RXebBkGWaVCGrAy9j2et0xeh8/1aekrljiXCEz02PBuY5pFu
	l6f44q7lGonUe5YMV6v/r0uJCyhqTuYdvarARqK0eN36i6fFTUB8uKZUd73azWEZw+9ZaHfFQJe
	Ng9gyhyYBwlQkN6oa3HgHA==
X-Received: by 2002:a17:903:b90:b0:2e6:1c21:158d with SMTP id d9443c01a7336-2eff756cb48mr15064795ad.50.1794975259936;
        Tue, 17 Nov 2026 20:14:19 -0800 (PST)
Received: from gmail.com ([2407:cdc0:d002:0:188:253:12:32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6214f4dsm5728685ad.43.2026.11.17.20.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:14:19 -0800 (PST)
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
Subject: [PATCH v2 6/8] scsi: target: limit DIF block CRC to each data sg
Date: Wed, 18 Nov 2026 12:13:09 +0800
Message-Id: <20261118041311.19011-7-physicalmtea@gmail.com>
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

sbc_dif_generate() and sbc_dif_verify() start a CRC from the current
data sg and handle one transition to the following entry. They pass
all remaining block bytes to crc_t10dif_update(), even if the next sg
is shorter than that remainder.

A 512-byte block split into 256, 100 and 156 bytes makes the CRC read
256 bytes from the 100-byte entry. Walk the remaining entries and
limit each CRC update to the bytes that entry holds. Share the walk
between the generation and verification paths.

KASAN reports:

  BUG: KASAN: use-after-free in crc_t10dif_update+0x91/0xf0
  Read of size 1

  crc_t10dif_update
  sbc_dif_verify
  target_execute_cmd
  vhost_scsi_write_pending
  transport_generic_new_cmd

Fixes: 18213afbd8ce ("target: handle odd SG mapping for data transfer memory")
Signed-off-by: Jia Jia <physicalmtea@gmail.com>
---
 drivers/target/target_core_sbc.c | 54 +++++++++++++++++++++++++-------
 1 file changed, 42 insertions(+), 12 deletions(-)

diff --git a/drivers/target/target_core_sbc.c b/drivers/target/target_core_sbc.c
index 360a9af0cf66f..e752b23b1bef7 100644
--- a/drivers/target/target_core_sbc.c
+++ b/drivers/target/target_core_sbc.c
@@ -1308,6 +1308,44 @@ sbc_dif_prot_copy(struct scatterlist **psgp, void **paddrp,
 	return true;
 }
 
+/*
+ * CRC the rest of one logical block.  @need is the byte count still
+ * unread.  Take only what each following data sg holds.
+ */
+static bool
+sbc_dif_crc_rest(struct scatterlist **dsgp, void **daddrp, int *offp,
+		 unsigned int need, __u16 *crc)
+{
+	struct scatterlist *dsg = *dsgp;
+	void *daddr = *daddrp;
+
+	kunmap_atomic(daddr - dsg->offset);
+	while (need) {
+		unsigned int take;
+
+		dsg = sg_next(dsg);
+		if (!dsg)
+			return false;
+
+		daddr = kmap_atomic(sg_page(dsg)) + dsg->offset;
+		if (!dsg->length) {
+			kunmap_atomic(daddr - dsg->offset);
+			return false;
+		}
+
+		take = min_t(unsigned int, need, dsg->length);
+		*crc = crc_t10dif_update(*crc, daddr, take);
+		need -= take;
+		*offp = take;
+		if (need)
+			kunmap_atomic(daddr - dsg->offset);
+	}
+
+	*dsgp = dsg;
+	*daddrp = daddr;
+	return true;
+}
+
 void
 sbc_dif_generate(struct se_cmd *cmd)
 {
@@ -1356,15 +1394,11 @@ sbc_dif_generate(struct se_cmd *cmd)
 		avail = min(block_size, dsg->length - offset);
 		crc = crc_t10dif(daddr + offset, avail);
 		if (avail < block_size) {
-			kunmap_atomic(daddr - dsg->offset);
-			dsg = sg_next(dsg);
-			if (!dsg) {
+			if (!sbc_dif_crc_rest(&dsg, &daddr, &offset,
+					      block_size - avail, &crc)) {
 				kunmap_atomic(paddr - psg->offset);
 				return;
 			}
-			daddr = kmap_atomic(sg_page(dsg)) + dsg->offset;
-			offset = block_size - avail;
-			crc = crc_t10dif_update(crc, daddr, offset);
 		} else {
 			offset += block_size;
 		}
@@ -1543,15 +1577,11 @@ sbc_dif_verify(struct se_cmd *cmd, sector_t start, unsigned int sectors,
 		avail = min(block_size, dsg->length - dsg_off);
 		crc = crc_t10dif(daddr + dsg_off, avail);
 		if (avail < block_size) {
-			kunmap_atomic(daddr - dsg->offset);
-			dsg = sg_next(dsg);
-			if (!dsg) {
+			if (!sbc_dif_crc_rest(&dsg, &daddr, &dsg_off,
+					      block_size - avail, &crc)) {
 				kunmap_atomic(paddr - psg->offset);
 				return 0;
 			}
-			daddr = kmap_atomic(sg_page(dsg)) + dsg->offset;
-			dsg_off = block_size - avail;
-			crc = crc_t10dif_update(crc, daddr, dsg_off);
 		} else {
 			dsg_off += block_size;
 		}
