Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794975265;
	b=uUkzhRO+ggSNUnu7/CnRwZDexEbrl5mcuYWFiWjjrQOPAXtxP+Q2HmxZNLtannvTzfeE
	 j8NC1+wE4wzyBRerZhjWeSYL+ZAOoU7w2KIuv5UFezkhCEf+3L5IZg6m/Ip9s4bdEm4zs
	 F5+xOIlj95wcdJux297s/qf/hVrl4+hD3HrZEvI2n9Flw2MwwzV41TFaVYVfGFTcp3HtC
	 UCYn+pbZgh1ZQpjETo6fjufvdZVSlKtkfy1FUKp9zAR5XF81s8ZuxQk32N0jmpOxubG78
	 J02/40iIlSxUO1BUPxUrHcbr6t9zRhKmxYlpaYnw5VO9Ag2YjorEfoP9KOsY615+nDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794975265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zlP9NFMxivD/7WnoRl1Q8FAK7P9MLDGYvNDfsD3fEW4=;
	b=poRKiea5QSC/oKVjRYaVLkIdaHqV0TfeXfoT4igTDv23oNPNJRro2Od1KCUedCyB9BCF
	 z53WrSNDEW2P45JJyvlYkynDxXgh7D4lN7caEPwCADXaVxQ2cxF9dsI9Nl2D4yijYvVQr
	 BNF47pmWzs8wdpG+aJZWY4NJgcDUr5STQMDnYM22WzgQWSZtfSAJsyUAjN03Ps9YfEY5B
	 n1PkImihY/t/NKRKQ80owk3ccPE5cTwlOiWxofLCBnLLfBREber+ul2HpRSbSoM2g330U
	 Xi3wfoYlrRbE6f1TDXZhGVNJlSuNxMJ3bGL3/nMxsvqYMWzvqTkIhNPjgVikxWIm1rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qBlEGefP;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB1D606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:14:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CB1D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qBlEGefP
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e987a2ba0cso3550475ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794975264; x=1795580064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zlP9NFMxivD/7WnoRl1Q8FAK7P9MLDGYvNDfsD3fEW4=;
        b=qBlEGefPmzChhdk0wNPA0p/UMgkFWQY21sNi/8IIGLyKp08m7l7KyB/r1ZoAMbwJ4h
         OVaEPgUZPnbF5xccC6AtlcqDtNel9exmin8wCetQDe5cfvhQA2TgwvA6HgREL2iUVA44
         YbdPrhppCtu0FldSSeDZqfe3ArqeoPadec5UaOkkzA64/uEfgaR2/9Xq4atKkX79C9T6
         1CygKU93tyPuzT1CgJQcuCUOZd6QQ7UfTd8rBG6CwG7kGJhvzZXikXc3O6lPShULdirE
         JO7/HaBhRt4xfx47cPymltMF0hxGIstjslClU+fZ3JDAegB4rhSOSPqgEdGey7O2Y9lC
         At0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975264; x=1795580064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zlP9NFMxivD/7WnoRl1Q8FAK7P9MLDGYvNDfsD3fEW4=;
        b=Bnmtq80qBdwy2CWbBDCKDb3wmdiEsIddjUzQng8e2ocrKTjX8n+0/jPUAAC7f9lzyM
         DNdoSjcUb0o68D4e5ILF3i2OL+M4BI01XCRoO+tpiVpNZMGGnsi4ZDk/4Mn+Cwdnu5Jb
         BmWs9f/Jel7vv+sMrNRhD3rLhytCoRMbdziNugtOwkU7Ha66CWiCWwW5xeJy9Du4ht4Z
         x2PmTeZ/TPLz58C2HrFOzbXHiLttZgU+zip8S8qaae7o6/1Xq4EzkHk2Zz3BBH1sHXQ5
         wzrV0k/KxY3T2J08XfShYTa/AU9IcAn6vTBcUeVCfS1IVqxkKINnN0htFUzLM/ows4Jp
         M6MA==
X-Forwarded-Encrypted: i=1; AL+hErHbEpkI2fuCULZqka4Ey2tEin2+N/4GL91iHW2PunrEQIs15lCGrF2JHlNyIITQGK9scbg+ZyYAB1pi3fs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VsK2D//KKKQnQAFRVb35QZwvOHREko7hpI2Gqh8JxxRIBCZ7F
	2LoaVchr/dxSDvXJNAXwekybbfI8UF/NLdZoAk8q6Nm7oZW7TxqGLUi8
X-Gm-Gg: AZFdTZeMLbF2wB8U9XbqbWOT6sIbVvxfKu470RGrc0xFOByJCt3Qj0t5zFrs8g52Or3
	8GXnbo/dgSuu99dPplwYyDayxo0fN4L5Up6EySBWgldsl1Y/9v573XLBKSUzyssuyZrnvJFcL+R
	DBEp3MKL3sKnflQoFh8ppJtDs2QBvQgSkgKZV9PH5uyeZd40tyS9xkupqi3ddiNKrnCQR9npn2I
	r+0kLQnelmsOsm2Q7tiZo8mqT+h7DuPO47CGspcfMsIxLdtFCZQSfaWW8l62SkFi/0p9mnjsE3v
	5Kj8JfzqDYHyVEbAZamkfo123fYbLYG92hbdJp9/fm5RsnvDzBsu+NTR4nHXx3JHzkFHcEJbS+0
	AE80oj9SUEL/X+RzRlsYMpUOQaimhqLk8JoVJHGToko5/Dgr8c4PdStXq5vJj1qd80xBQ/HrmVv
	DN9AT+NuNKXudWB4f1AdUl2HmPC1xrjp9Bb9cJNEgI4coMq8bk2jSQYYw8LpSDSlbVjFQ52QpPo
	+r7MwVfEL54Zp/b1NURMfYHVOqk9/KaJYTFuNZR4wnQvkv4gRhgXtmIWBKNJ5ZzZwNrXWdmqJRf
	7MAP2m9j/wm8wp11Xq6RIw==
X-Received: by 2002:a17:903:186:b0:2ef:e547:e0cd with SMTP id d9443c01a7336-2eff740bb69mr14953535ad.31.1794975263568;
        Tue, 17 Nov 2026 20:14:23 -0800 (PST)
Received: from gmail.com ([2407:cdc0:d002:0:188:253:12:32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6214f4dsm5728685ad.43.2026.11.17.20.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:14:23 -0800 (PST)
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
Subject: [PATCH v2 7/8] scsi: target: keep pscsi mode bytes inside the data sgs
Date: Wed, 18 Nov 2026 12:13:10 +0800
Message-Id: <20261118041311.19011-8-physicalmtea@gmail.com>
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

pscsi_complete_cmd() updates the write-protect byte without checking
that the response is long enough to contain it. MODE SENSE (6) needs
byte 2 and MODE SENSE (10) needs byte 3. A shorter allocation can make
the access run past the command buffer.

On tape devices, MODE SELECT reads the block descriptor through
sg_virt() of the first sg. The block length ends at byte 11 for
MODE SELECT (6) and byte 15 for MODE SELECT (10), but neither the
command length nor the first sg's length is checked.

Use the sg copy helpers to access the write-protect byte and copy the
required MODE SELECT prefix into a local buffer. Check both the command
length and the number of bytes copied before using the fields. This
also handles headers and descriptors split across sg entries.

Fixes: c66ac9db8d4a ("[SCSI] target: Add LIO target core v4.0.0-rc6")
Signed-off-by: Jia Jia <physicalmtea@gmail.com>
---
 drivers/target/target_core_pscsi.c | 37 ++++++++++++++----------------
 1 file changed, 17 insertions(+), 20 deletions(-)

diff --git a/drivers/target/target_core_pscsi.c b/drivers/target/target_core_pscsi.c
index fd1b82fc72902..ccf5933da7f0d 100644
--- a/drivers/target/target_core_pscsi.c
+++ b/drivers/target/target_core_pscsi.c
@@ -21,6 +21,7 @@
 #include <linux/ratelimit.h>
 #include <linux/module.h>
 #include <linux/unaligned.h>
+#include <linux/scatterlist.h>
 
 #include <scsi/scsi_device.h>
 #include <scsi/scsi_host.h>
@@ -610,21 +611,17 @@ static void pscsi_complete_cmd(struct se_cmd *cmd, u8 scsi_status,
 		bool read_only = target_lun_is_rdonly(cmd);
 
 		if (read_only) {
-			unsigned char *buf;
-
-			buf = transport_kmap_data_sg(cmd);
-			if (!buf) {
-				; /* XXX: TCM_LOGICAL_UNIT_COMMUNICATION_FAILURE */
-			} else {
-				if (cdb[0] == MODE_SENSE_10) {
-					if (!(buf[3] & 0x80))
-						buf[3] |= 0x80;
-				} else {
-					if (!(buf[2] & 0x80))
-						buf[2] |= 0x80;
-				}
-
-				transport_kunmap_data_sg(cmd);
+			unsigned char wp;
+			unsigned int wp_off = (cdb[0] == MODE_SENSE_10) ? 3 : 2;
+
+			if (cmd->data_length > wp_off && cmd->t_data_sg &&
+			    sg_pcopy_to_buffer(cmd->t_data_sg, cmd->t_data_nents,
+					       &wp, 1, wp_off) == 1 &&
+			    !(wp & 0x80)) {
+				wp |= 0x80;
+				sg_pcopy_from_buffer(cmd->t_data_sg,
+						     cmd->t_data_nents, &wp, 1,
+						     wp_off);
 			}
 		}
 	}
@@ -643,15 +640,15 @@ after_mode_sense:
 	 */
 	if (((cdb[0] == MODE_SELECT) || (cdb[0] == MODE_SELECT_10)) &&
 	     scsi_status == SAM_STAT_GOOD) {
-		unsigned char *buf;
+		unsigned char buf[16];
+		unsigned int len = cdb[0] == MODE_SELECT ? 12 : 16;
 		u16 bdl;
 		u32 blocksize;
 
-		buf = sg_virt(&cmd->t_data_sg[0]);
-		if (!buf) {
-			pr_err("Unable to get buf for scatterlist\n");
+		if (cmd->data_length < len || !cmd->t_data_sg ||
+		    sg_copy_to_buffer(cmd->t_data_sg, cmd->t_data_nents,
+				      buf, len) != len)
 			goto after_mode_select;
-		}
 
 		if (cdb[0] == MODE_SELECT)
 			bdl = buf[3];
