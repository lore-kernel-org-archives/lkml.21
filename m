Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107905;
	b=WUERYq98vDyoXwdYTXtTLiVDqYd41UPY8K411hrHmALIQsdEkALbqMIu7L7tr6cg4q+d
	 IOYGqYGGy+FaCJwAzob+OSUS5nPyStxxSATCwybvq0kKlUHjOLN0I+4CK6PK8jeUfkbmf
	 XsrxFIykNcnki/H0g5ZVEgQqGe1po/x/d+Z6jnjXPMpD0c7D2B97bBRxhtkzZDy4e0TEG
	 WRyd0qzf7p/eziynpXlUROfJQA9ZZCrxjLQ0tGjfSLraSYcPgPFtpLr6XAxJdDZP3tOeo
	 mdByb3PhnEV5Pf8nq/6Ko/kKqC6TqIAPDBuAPhZOBSe2q8svkM32jD7XtV5nM8HQt9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107905;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=tEWTKd67+sE6hXsJjat4+R5/kfA+hMcRoqTzGHNveW8=;
	b=p7fk09FXNcBviC8Stv/oDoaavSV3NlOjM6kgr98Ult5xs4e49eCsL9kUX7ZlcYj15XHd
	 e25Tcnr2KY/lz2mmXvzwJzmob+Ym+qrTD2oVDigwZwyf0IcruegMiyAOpwdZhQaAHWLPo
	 J5bgsERwUKhRkV9MhzYuERYtvZiklzN5AXtHiGmX4sZPc1S1jeiqqfxadh8cOIpo67bQ4
	 jfL5EGxF2Cs2gy5fzlANntFRN4PppBbXxBvGbdlywxsgKhsZE3pvA7w/TzynISoDXrfi6
	 4ArnOIB79m53TInyWULTyHpX7NYXczrqBru7J0VRkO0tYA2gTvBhJaZOKKtavizBClA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YLWZOcx6;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467A2606A338
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:05:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 467A2606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YLWZOcx6
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-154e9d2d94fso5076169c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107903; x=1795712703; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tEWTKd67+sE6hXsJjat4+R5/kfA+hMcRoqTzGHNveW8=;
        b=YLWZOcx6/QoLsL/1TXsxTFGuZq33rQl5jXZYghA+UiYhS9k65Nw7Kr83z1yQ6oFixG
         x385VKJocvNTv6lvfu2rze7It6RimPkSvBmF6WyNsQCYWBmLkA2HVuZ21VfvAn5KM21/
         nM9Qy4lWYIJO2QRegdM+H1S90Sysd1A2trPm3bAQWhG0IEgIvsgNfg7I/xEz3v/wmFAB
         lQhSeKaYlxpVyNDu3wrhv2uyAnibocdC/BwWMB/shvpUNQ59JtrmbzBpvQoH5vEgi4zK
         JrXFreBo60+bLoSMLYQsHXFXQNcBgzmO/TjOLsAgGQYLGnX9SA2ZQ2QSIhTOzHk0IFIC
         6gBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107903; x=1795712703;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tEWTKd67+sE6hXsJjat4+R5/kfA+hMcRoqTzGHNveW8=;
        b=KVTrTIE5hE0OwZ4hieqhruzSgmvULF/ZjTwj3Y8W7YwSrx5mxVeKrqCYguzbkvgFPy
         Hu6D9v1LEZibJ/Vn2gV/f+Zcp+9hVCpAdbHe0ar+FzEdqBBJIkuX330Wl2SWRzw5/kFC
         fv2ti0uaPn4sh1nOiWzSnbKNDWJ8mA+Rp9h8R9cea5C+YnxHoo0veIIlEdspyTMc6kST
         8Qr4SPNwzKmEf/NrRnYZl6p98D7fWyxbR1rACOBDXRsMTxi5TxEbD/e3cKDixqFRkDxy
         oHELL316VL3A8nufVpySNYyMUCJWrxYu60zmXcGrlLfwPKTNaHHXz3NJhHoqffNi4Id+
         VBAw==
X-Forwarded-Encrypted: i=1; AL+hErGdiAhGLLHPbtOf++q299s/VrBeBJW5xVHYnUQU/J0R3EebSzDLcZXHX0+3KoSAuA9crnurxa2mGyoPTzQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bBwp4D/2K4aYhmcqXY8zpdQn+bYhfS0w1gvUqn3itgsT85QH2
	K8RkS6qs2WDXebxvic0EhE+fYC4reu9uy8b1sQJHODDmFh6bxR4rqxpxmuB2+Rto1W9J1rOd+ao
	jwp1Zn246EA==
X-Received: from dlbsw11.prod.google.com ([2002:a05:7022:3a8b:b0:19a:1425:bb9c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4204:10b0:1b5:4cbd:ac02
 with SMTP id a92af1059eb24-1b556895b10mr269905c88.15.1795107903109; Thu, 19
 Nov 2026 09:05:03 -0800 (PST)
Date: Thu, 19 Nov 2026 09:05:00 -0800
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
Message-ID: <20261119170500.1514537-1-irogers@google.com>
Subject: [PATCH] scsi: lpfc: Fix format string and OOB copy in lpfc_read_object()
From: Ian Rogers <irogers@google.com>
To: Justin Tee <justin.tee@broadcom.com>, Paul Ely <paul.ely@broadcom.com>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In lpfc_read_object(), rd_object_name is a 26-element u32 array (104
bytes, LPFC_OBJ_NAME_SZ) populated from rdobject via scnprintf() without a
"%s" format string, and then copied to the SLI-4 mailbox request with:

	for (j = 0; j < strlen(rdobject); j++)
		read_object->u.request.rd_object_name[j] =
			cpu_to_le32(rd_object_name[j]);

Because the loop bound uses strlen(rdobject) (byte count, unbounded) to
index 32-bit dword arrays of length 26, any object path of 27 bytes or
longer reads past the end of rd_object_name on the stack and overwrites
rd_object_cnt, rd_object_hbuf[], and adjacent mailbox memory. Passing
rdobject directly as the format string also evaluates any '%' characters
as printf specifiers.

Format rdobject with "%s", capture the bounded byte length returned by
scnprintf(), and iterate over DIV_ROUND_UP(len, sizeof(u32)) dwords.

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wformat-security enabled; fix and changelog drafted with an AI coding
assistant. Verified with an ASan/UBSan C reproducer for short, '%'-bearing,
and >104-byte object names, and build-tested with LLVM=1 W=1 and
-Wformat-security; not tested on Emulex Fibre Channel hardware.

Fixes: 72df8a452883 ("scsi: lpfc: Add support for cm enablement buffer")
Fixes: 59936430e6a6 ("scsi: lpfc: Fix CPU to/from endian warnings introduced by ELS processing")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/scsi/lpfc/lpfc_sli.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/scsi/lpfc/lpfc_sli.c b/drivers/scsi/lpfc/lpfc_sli.c
index 9173263c87f9..26c9f5721340 100644
--- a/drivers/scsi/lpfc/lpfc_sli.c
+++ b/drivers/scsi/lpfc/lpfc_sli.c
@@ -22259,11 +22259,12 @@ lpfc_read_object(struct lpfc_hba *phba, char *rdobject, uint32_t *datap,
 {
 	struct lpfc_mbx_read_object *read_object;
 	LPFC_MBOXQ_t *mbox;
-	int rc, length, eof, j, byte_cnt = 0;
+	int rc, length, eof, byte_cnt = 0;
 	uint32_t shdr_status, shdr_add_status;
 	union lpfc_sli4_cfg_shdr *shdr;
 	struct lpfc_dmabuf *pcmd;
 	u32 rd_object_name[LPFC_MBX_OBJECT_NAME_LEN_DW] = {0};
+	size_t len, j;
 
 	mbox = mempool_alloc(phba->mbox_mem_pool, GFP_KERNEL);
 	if (!mbox)
@@ -22283,8 +22284,9 @@ lpfc_read_object(struct lpfc_hba *phba, char *rdobject, uint32_t *datap,
 
 	memset((void *)read_object->u.request.rd_object_name, 0,
 	       LPFC_OBJ_NAME_SZ);
-	scnprintf((char *)rd_object_name, sizeof(rd_object_name), rdobject);
-	for (j = 0; j < strlen(rdobject); j++)
+	len = scnprintf((char *)rd_object_name, sizeof(rd_object_name), "%s",
+			rdobject);
+	for (j = 0; j < DIV_ROUND_UP(len, sizeof(u32)); j++)
 		read_object->u.request.rd_object_name[j] =
 			cpu_to_le32(rd_object_name[j]);
 
-- 
2.56.1.708.g77570a6a1d-goog

