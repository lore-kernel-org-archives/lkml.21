Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794975246;
	b=3CbwSIQ+HE5f9eIOIGkbRbkHgHiTNz/GeMRcd73BRK7a8hGTpG/+Ni3KxrBBK7RygIJv
	 BYbmHE6iws8AnCcleKcK4GVgqRebHxe9f3ByfBQPxPqBxVDyMkKeXCy7UzIh1+MwuEqfp
	 VuLVSxZO8N/zwUrbFyysEd9omhWl0sDYM2qg+QbU85Jpo/CwC8pvAn+I1q8RPmIB4zioL
	 oemTFdR9inImTVqxnKiqxdHtvAgcBAuFxK7Rsd9eDBYbHzoAPg2o+WkufcXZKdDMj4vjs
	 y27tRp8Eb1SNIjKo6n1wAFfgzTXyBwqDie9nw12muo/VEb8FyiixzHoNA4wBdo+P+9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794975246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GPG8lOcLulms/jJaS3g/L2BNHyItP4cf5yOKPILINFI=;
	b=PaRbkNjrAHwpRHJEVkCmUwH07PTB7Kf4Q5H3082AXvrysERh7cLNkaf84R7vzrQa+Uqs
	 vxSsPuzCQ/cpp9lRaffuPnOwI39MyirVTfHVAx8bcth8++yT7NytgTdmqNgyrZFFgHWOX
	 T2CoGJJmv5hCK1U0B6AOpQUHo7chEy9sSSydqJqpfA1xAcD7Xq5O/LP627yq3ylkRaXwj
	 wRCVJBhbr8IgxvjTY0AJXYXjQIzpEqhepDV2d32XlZjgHqCtKpotnvQlT0FpA+BXrow9g
	 6MslzIMIoXsvK1jhEPais3jDJ7B610xmVPsTSz+b1N5XsJbcwDzGylHQI1gC4ek+8WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cvqhJdEY;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081BD606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:14:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 081BD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cvqhJdEY
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2efd432714aso2226205ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794975245; x=1795580045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GPG8lOcLulms/jJaS3g/L2BNHyItP4cf5yOKPILINFI=;
        b=cvqhJdEYHrsoqlj7D/dBktgjPA41xa98nkLWQlnCpYhimNzYZmBJFMqmQKSEphE5Ge
         OajrsBz2EHcvI0aTqJYEeugWVzfsHPKjzP6ERS2dpiO6MI4L1kmkUe5iL0iPFCzkAtkm
         yEcHdHG9OSja21Jd4DCZmWBOdCjXoQ7QtZBpKIKa4yZcG7K81RSmiBU81V4nWDvWW/bK
         U29KZGDF2Tr0j/F6/kGiNs5MFpHSRd3ESFeqi+noKlJK+UzYt4T7DTo8Eg1jiVVhDIKw
         GkGnnpTMtEa95ey7mU9fq6kqBtVgD/IuA8MdGvbRJyGktekFLaWBRUxotFB/1xcYZzjt
         PTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975245; x=1795580045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GPG8lOcLulms/jJaS3g/L2BNHyItP4cf5yOKPILINFI=;
        b=Ss+rkncRZUx9oqzl8E+BgWlHlGikuAwbSXVXup54Lq9ZYZpRIpR+rZjh5rSM06Wk88
         zuE1bOW6Zx5cmSktCd3EJoLmA+mdCR2K2jSKgjisQ/dqa2kEFipeRwQK7e2GH28DGjtz
         +p17JP4sbAlYJ58mJOAJgg54IuYecZjS5QMTsAIyeI3zyAJqhXJkx8wRbTBQOgRfMQJ4
         8XCShGyrVwUFfUcg3luO/22JztYcPotu+SXQl1lR1j10feKr0VTxPl3PXJ2kNCc3wKLd
         t8hEU5Qo7NSg5gqrTnc3fsd2V3GKNqurNyUjYgYvx7w+/qAbFLC4wVp19xtgiTHVKMZf
         rYkQ==
X-Forwarded-Encrypted: i=1; AL+hErExURpEgEdA8P8znwX+NovljedRjlHwY43cyEAuMssQcJkKnr82PluxVgxutlyCXi67w0Anr6yfXh05SCg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6Sfq4/XOomZiMktetMmgfPXa4ZY523CN9y4eTDZwJ4OodoeWl
	b3kyB8yVOE43bn51/uGnyMJCUB+Q5ITXcEZvB2oPr+xFiDRR28NLwLU/
X-Gm-Gg: AZFdTZc+UexM+Ihp8Zpv0A/PFRgVPe2aeRGQdKnGeWqoPDXkkPAlFsBQako4e2mLyRJ
	K8eaidmNvq24m/rkyPzzEaY0J87YkTLNiWvucAEmv58GqiClBVokktvxp1U8P3S3BdGlGAO8ZLk
	5A5T+4HMIv13AxWDmMhO+gViJibge9nvLCFuSDJUzlMordIozYCmBhQgJ40KduteG7Kr8RfvNNH
	6sbcanE9cQuSk/MZ8iZQLOvfqDpQ3MUgJRRgoLdMN27FTXrtW654cBsxifJR3c6xT90seSbwYm9
	U3JPr//vt3OwZH2h7M7M4rjV6FSeVh+g0wyyXnWnOCnsAgmqbdkCzD7NBH1KcA04MZz2z76G3PZ
	v9wPqEICPEZZ5y6adPH+dgmkEcPivrkFHX6eZx8zTPlYDZn2jKpBEP4BOE5su1VrL4RS9Ow1gAc
	wepnx+ks9NuOCPP4bKn5T9RzGApcDnRa8cNZovwg4vVfIG4E6SIkqpko/KwckwCyzkJXf4pC0SX
	8C9JXoP3MY2166DjbhK5vPzReFvioR+Nq1VNzYQSTk45+qIBlr6pVXrUAK0K4BJYqkuBoloj2zu
	GBIOMU3591LNGGy5maQA/HI/r9Z9DpAsvSQ3alJ7QIg=
X-Received: by 2002:a17:902:f70c:b0:2ef:e130:1505 with SMTP id d9443c01a7336-2eff72ea971mr12502285ad.10.1794975245258;
        Tue, 17 Nov 2026 20:14:05 -0800 (PST)
Received: from gmail.com ([2407:cdc0:d002:0:188:253:12:32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6214f4dsm5728685ad.43.2026.11.17.20.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:14:05 -0800 (PST)
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
Subject: [PATCH v2 2/8] scsi: target: keep REPORT REFERRALS stores inside the buffer
Date: Wed, 18 Nov 2026 12:13:05 +0800
Message-Id: <20261118041311.19011-3-physicalmtea@gmail.com>
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

target_emulate_report_referrals() checks only that the start of an LBA
field is inside cmd->data_length before storing all eight bytes. A
short response buffer can therefore make the store run past its end.
For example, a nine-byte allocation reaches the LBA at buf[8].

The response builder must still visit the remaining LBA maps to compute
the reported length. Encode each LBA in a local array and copy only
the part that fits in the command buffer.

KASAN reports:

  BUG: KASAN: use-after-free in target_emulate_report_referrals+0x100/0x380 [target_core_mod]
  Write of size 8

  target_emulate_report_referrals
  __target_execute_cmd
  target_execute_cmd
  transport_generic_new_cmd

Fixes: 38edd7245771 ("target_core_alua: check for buffer overflow")
Signed-off-by: Jia Jia <physicalmtea@gmail.com>
---
 drivers/target/target_core_alua.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/target/target_core_alua.c b/drivers/target/target_core_alua.c
index 140154d93c430..c110914b7b78b 100644
--- a/drivers/target/target_core_alua.c
+++ b/drivers/target/target_core_alua.c
@@ -49,6 +49,19 @@ static LIST_HEAD(lu_gps_list);
 
 struct t10_alua_lu_gp *default_lu_gp;
 
+static void
+target_emulate_report_referrals_copy_lba(unsigned char *buf, u32 off,
+					 u32 data_length, u64 lba)
+{
+	unsigned char lba_buf[sizeof(lba)];
+
+	if (off >= data_length)
+		return;
+	put_unaligned_be64(lba, lba_buf);
+	memcpy(&buf[off], lba_buf,
+	       min_t(u32, sizeof(lba_buf), data_length - off));
+}
+
 /*
  * REPORT REFERRALS
  *
@@ -88,11 +101,13 @@ target_emulate_report_referrals(struct se_cmd *cmd)
 		int pg_num;
 
 		off += 4;
-		if (cmd->data_length > off)
-			put_unaligned_be64(map->lba_map_first_lba, &buf[off]);
+		target_emulate_report_referrals_copy_lba(buf, off,
+							 cmd->data_length,
+							 map->lba_map_first_lba);
 		off += 8;
-		if (cmd->data_length > off)
-			put_unaligned_be64(map->lba_map_last_lba, &buf[off]);
+		target_emulate_report_referrals_copy_lba(buf, off,
+							 cmd->data_length,
+							 map->lba_map_last_lba);
 		off += 8;
 		rd_len += 20;
 		pg_num = 0;
