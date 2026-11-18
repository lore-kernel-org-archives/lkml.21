Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794975253;
	b=k2RoK+03G+QcxNY8jt2X1BQE9BvRFWwNbhCBe156W+8faP4GR59ALej6Bu4dursDAOmp
	 7GNw7u80jHBqCOcw3lvyMxXAasVVSiaSMQR6yBkVHZdPabcLNynA8eDZE1dH54hRjNJBb
	 H8JJUC8Fvn45DADFU3i3VGbCuURFAQ8uCkilZ1y2huBr3jq1ZswHub0P+Xk4jtVrh4p39
	 p5ZSzSpYyNroFknAwWYoDKgnBEqoc656+bxhLwDKWUO1j6fy6NEXG9zq6OgUjP3/Pxjz1
	 3VFzWgHFcC9xfhdj7jWVY/bbze/pL8YlDGSWmEsVoRbjQCKrlWEtrINXar05Fx61/xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794975253;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eH3ClhP3K/6K4ti1IS/bnRGkykU5Vjlc6CVNj4XDITs=;
	b=zdtkXAmJWBNUZN9GY7zm0dO/O0NrZ9Ubz69m1dDgdxlrkB44tsCuosX4pVP3mDU0LO5B
	 bpZVYI5hWj7CXCt5CovE78nmwautPT36pbZrc7GMjUhaf1+oOVEeZvurhWCuOi3CQklh/
	 TBrFxB4wJVcZOQvcWuIHiHuu5+m3X1cm/r53tO6PPDb2xRk2sCd6AKj4FU/DIQIE4D9Ui
	 NXNwWMxRiLmTiAM3wALUo9dX09DlUToO6qD7qjSCRe8R1sJgLLF8nihrfmlPydhrwhpMt
	 HRM8UpgOwZUq5nu+/W2Lfa4zK2kV8/MDgYoVerxc669Cop//02GuyyOZudfkHEyD3Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=btBomLH7;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342A6606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:14:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 342A6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=btBomLH7
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e9995ce866so4133025ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794975252; x=1795580052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eH3ClhP3K/6K4ti1IS/bnRGkykU5Vjlc6CVNj4XDITs=;
        b=btBomLH7/q5gdlk3VKgt4rjNfgc/iVqTspfJjdXjGJqKUMuDZ7snDYlVZ6ciVtTsR6
         U3Bf1z4DVXGqkKcHS9u3k3kqEWToe5gNSnJKF7NKIoEgxIG4NUE9f4vZIi2t//lo+euy
         D2HXiP8Z5Qk1WxsO0nSUl8TIUOrh+59FkRMhj2PB3ooNraE8z6Rq4wGEu6MUDgA+1Jxc
         Kat4BFMjkcLmvYyJbuOz6pVd5smw7fzOWOaY/b143FPJzJmtEqNSH8JaCkxQUq3SYm3W
         co9e1lg6wOviCfkr/SvJUKkMSJWiz68JITAFzsIOkzE+X7FA4c6xNjsbWGGvoso5G8VP
         8EMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975253; x=1795580053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eH3ClhP3K/6K4ti1IS/bnRGkykU5Vjlc6CVNj4XDITs=;
        b=pZ61E+kuztHgWcM17/qeMWWenpiVFSn+C2/tV5etIqY62tId5bezFuPNw8/8EYHJCS
         Wk4Cmp5G1xJ7JGLhSmQf++X3gCw1x2RKDS8P/LdiktQmHg98u1+sQjAkf/o3lOi6cmBx
         MkJBCcJuV/JdIcXJ2aHI68Z5GjPGtyqeNbYURRfYPHVEpLnwZ9TPcmn2FS/h2IGhAF0F
         WRwenmbll5IdsMEtVu39MCpsLGbL+w01bZN//tyhk7tOg4drQaOj4hJOghYhE9S4OML4
         8m4HMW0kmcT3GakkoZf8nnlIOF9hqXottXxVcpLokbknzFA4IX+RuceGXZZbl8YIhS5k
         vypg==
X-Forwarded-Encrypted: i=1; AL+hErEd3x/4Km9G8iIQ+bH8c7/BDqknrThf4KJGlmKGuXdwreT25HYv7/Rdh3UjRwkkqddWf8m5Q/3NSjQWyDE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zJeCrPT4ZEWDBOLn6BEdXEbo6C1b3g5NHSjGY58xz/eVyDL/l
	77PR5UrOIKCcONMdRUSB0lcL0H1eEeGyBxxh0L/NU5+hlhEkTXiOcKbM
X-Gm-Gg: AZFdTZeB/Oz9lhEmggP05cQOqt88Y8OOhR9pBD/1vyGG1qVuveN9O0uwCd0fVqJGkgC
	o/Eo/bfqS8QLF3JoJDhom4Q5Tsny91gW/C0NoI5vCso17MJkPl/QBXIXsPUzd5wnmTxzk437wLq
	hefSOGlEubFs1hyyl+WVEy64THq28J1q/BniOUwJ6kBQmayEsvCqm2Ltd0qzHAsWI+osuUAZ4Vt
	zd7pHIMlyNmSWk2rABFSHujK3+DeK+K74bcETFc4qdMpUbDTiVCe1FVR4JLDV0Ygb775CZzFm0s
	ZGAAogXX9IksXS2cBJpZqd2UUhsuebKc3Tp/09oPxDTwRGFpwnClJTGlVYVcs+c7QF7o4dBpXzL
	e6pwlV/xlaV8L3ThVADkTfPTLrcSVyVMduxYfUxjufLNyd0Gyi8C6EmDyGIHkNdIpueaA8IXaVU
	azK666b5R+2PeqhH6eP7uytvMsV/CazyOXTAw89ZLhUVDlsQXa0GUkEUGPnaRyUzz3I+7qWlUd0
	LIB3kqiyT13cebu+LjERP1IhU2cnCuVlDUeoKONkOTDTKy3IZK+Ii/F1sEr3MHJv6UWFJF/SinS
	skiy7oX8/Ym4Yas8b9nq7g==
X-Received: by 2002:a17:902:f687:b0:2ef:d032:66fa with SMTP id d9443c01a7336-2eff73f1f15mr13070605ad.10.1794975252511;
        Tue, 17 Nov 2026 20:14:12 -0800 (PST)
Received: from gmail.com ([2407:cdc0:d002:0:188:253:12:32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6214f4dsm5728685ad.43.2026.11.17.20.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:14:12 -0800 (PST)
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
Subject: [PATCH v2 4/8] scsi: target: copy a DIF insert tuple across prot sgs
Date: Wed, 18 Nov 2026 12:13:07 +0800
Message-Id: <20261118041311.19011-5-physicalmtea@gmail.com>
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

sbc_dif_generate() writes a complete eight-byte t10_pi_tuple whenever
any bytes remain in a protection sg. A tuple split across entries can
therefore be written past the end of the first entry.

Copy each tuple through a stack object, walking the protection sgs as
needed. Read the existing tuple before updating it to preserve ref_tag
for protection types other than Type 1. This also checks that the full
tuple is available before writing any of it.

Stop generation on a truncated final tuple without changing the
caller's completion status.

KASAN reports:

  BUG: KASAN: use-after-free in sbc_dif_generate+0x20c/0x640 [target_core_mod]
  Write of size 4

  sbc_dif_generate
  target_complete_ok_work

Fixes: 66a3d5bc47d2 ("target/sbc: Add sbc_dif_generate software emulation")
Signed-off-by: Jia Jia <physicalmtea@gmail.com>
---
 drivers/target/target_core_sbc.c | 180 ++++++++++++++++++++++---------
 1 file changed, 131 insertions(+), 49 deletions(-)

diff --git a/drivers/target/target_core_sbc.c b/drivers/target/target_core_sbc.c
index adef903652ac2..780f526c4d931 100644
--- a/drivers/target/target_core_sbc.c
+++ b/drivers/target/target_core_sbc.c
@@ -1250,72 +1250,154 @@ err:
 	return ret;
 }
 
+/*
+ * Copy one 8 byte PI tuple to or from the prot sg.  The data page sits
+ * above the prot map, so a prot sg change drops and restores it.  A
+ * short tail releases both maps and returns false.
+ */
+static bool
+sbc_dif_prot_copy(struct scatterlist **psgp, void **paddrp,
+		  unsigned int *poffp, struct scatterlist *dsg,
+		  void **daddrp, void *buf, bool to_prot)
+{
+	struct scatterlist *psg = *psgp;
+	void *paddr = *paddrp;
+	void *daddr = *daddrp;
+	unsigned int poff = *poffp;
+	unsigned int len = sizeof(struct t10_pi_tuple);
+	u8 *p = buf;
+
+	while (len) {
+		unsigned int take;
+
+		if (!psg || poff >= psg->length) {
+			if (daddr)
+				kunmap_atomic(daddr - dsg->offset);
+			if (paddr)
+				kunmap_atomic(paddr - psg->offset);
+			daddr = NULL;
+			paddr = NULL;
+			psg = psg ? sg_next(psg) : NULL;
+			if (!psg) {
+				*psgp = NULL;
+				*paddrp = NULL;
+				*daddrp = NULL;
+				return false;
+			}
+			poff = 0;
+			if (!psg->length)
+				continue;
+			paddr = kmap_atomic(sg_page(psg)) + psg->offset;
+			daddr = kmap_atomic(sg_page(dsg)) + dsg->offset;
+		}
+
+		take = min_t(unsigned int, len, psg->length - poff);
+		if (to_prot)
+			memcpy(paddr + poff, p, take);
+		else
+			memcpy(p, paddr + poff, take);
+		p += take;
+		poff += take;
+		len -= take;
+	}
+
+	*psgp = psg;
+	*paddrp = paddr;
+	*poffp = poff;
+	*daddrp = daddr;
+	return true;
+}
+
 void
 sbc_dif_generate(struct se_cmd *cmd)
 {
 	struct se_device *dev = cmd->se_dev;
-	struct t10_pi_tuple *sdt;
-	struct scatterlist *dsg = cmd->t_data_sg, *psg;
+	struct scatterlist *dsg = cmd->t_data_sg;
+	struct scatterlist *psg = cmd->t_prot_sg;
 	sector_t sector = cmd->t_task_lba;
 	void *daddr, *paddr;
-	int i, j, offset = 0;
+	unsigned int poff = 0;
+	int offset = 0;
 	unsigned int block_size = dev->dev_attrib.block_size;
 
-	for_each_sg(cmd->t_prot_sg, psg, cmd->t_prot_nents, i) {
-		paddr = kmap_atomic(sg_page(psg)) + psg->offset;
-		daddr = kmap_atomic(sg_page(dsg)) + dsg->offset;
+	if (!psg || !dsg)
+		return;
 
-		for (j = 0; j < psg->length;
-				j += sizeof(*sdt)) {
-			__u16 crc;
-			unsigned int avail;
+	paddr = kmap_atomic(sg_page(psg)) + psg->offset;
+	daddr = kmap_atomic(sg_page(dsg)) + dsg->offset;
 
-			if (offset >= dsg->length) {
-				offset -= dsg->length;
-				kunmap_atomic(daddr - dsg->offset);
-				dsg = sg_next(dsg);
-				if (!dsg) {
-					kunmap_atomic(paddr - psg->offset);
-					return;
-				}
-				daddr = kmap_atomic(sg_page(dsg)) + dsg->offset;
-			}
+	for (;;) {
+		struct t10_pi_tuple sdt;
+		struct scatterlist *mark_psg;
+		unsigned int mark_off;
+		__u16 crc;
+		unsigned int avail;
 
-			sdt = paddr + j;
-			avail = min(block_size, dsg->length - offset);
-			crc = crc_t10dif(daddr + offset, avail);
-			if (avail < block_size) {
-				kunmap_atomic(daddr - dsg->offset);
-				dsg = sg_next(dsg);
-				if (!dsg) {
-					kunmap_atomic(paddr - psg->offset);
-					return;
-				}
-				daddr = kmap_atomic(sg_page(dsg)) + dsg->offset;
-				offset = block_size - avail;
-				crc = crc_t10dif_update(crc, daddr, offset);
-			} else {
-				offset += block_size;
-			}
+		if (poff >= psg->length && !sg_next(psg))
+			break;
 
-			sdt->guard_tag = cpu_to_be16(crc);
-			if (cmd->prot_type == TARGET_DIF_TYPE1_PROT)
-				sdt->ref_tag = cpu_to_be32(sector & 0xffffffff);
-			sdt->app_tag = 0;
+		mark_psg = psg;
+		mark_off = poff;
+		if (!sbc_dif_prot_copy(&psg, &paddr, &poff, dsg, &daddr,
+				       &sdt, false))
+			return;
+
+		if (offset >= dsg->length) {
+			offset -= dsg->length;
+			kunmap_atomic(daddr - dsg->offset);
+			dsg = sg_next(dsg);
+			if (!dsg) {
+				kunmap_atomic(paddr - psg->offset);
+				return;
+			}
+			daddr = kmap_atomic(sg_page(dsg)) + dsg->offset;
+		}
 
-			pr_debug("DIF %s INSERT sector: %llu guard_tag: 0x%04x"
-				 " app_tag: 0x%04x ref_tag: %u\n",
-				 (cmd->data_direction == DMA_TO_DEVICE) ?
-				 "WRITE" : "READ", (unsigned long long)sector,
-				 sdt->guard_tag, sdt->app_tag,
-				 be32_to_cpu(sdt->ref_tag));
+		avail = min(block_size, dsg->length - offset);
+		crc = crc_t10dif(daddr + offset, avail);
+		if (avail < block_size) {
+			kunmap_atomic(daddr - dsg->offset);
+			dsg = sg_next(dsg);
+			if (!dsg) {
+				kunmap_atomic(paddr - psg->offset);
+				return;
+			}
+			daddr = kmap_atomic(sg_page(dsg)) + dsg->offset;
+			offset = block_size - avail;
+			crc = crc_t10dif_update(crc, daddr, offset);
+		} else {
+			offset += block_size;
+		}
 
-			sector++;
+		sdt.guard_tag = cpu_to_be16(crc);
+		if (cmd->prot_type == TARGET_DIF_TYPE1_PROT)
+			sdt.ref_tag = cpu_to_be32(sector & 0xffffffff);
+		sdt.app_tag = 0;
+
+		pr_debug("DIF %s INSERT sector: %llu guard_tag: 0x%04x"
+			 " app_tag: 0x%04x ref_tag: %u\n",
+			 (cmd->data_direction == DMA_TO_DEVICE) ?
+			 "WRITE" : "READ", (unsigned long long)sector,
+			 sdt.guard_tag, sdt.app_tag,
+			 be32_to_cpu(sdt.ref_tag));
+
+		if (psg != mark_psg) {
+			kunmap_atomic(daddr - dsg->offset);
+			kunmap_atomic(paddr - psg->offset);
+			psg = mark_psg;
+			paddr = kmap_atomic(sg_page(psg)) + psg->offset;
+			daddr = kmap_atomic(sg_page(dsg)) + dsg->offset;
 		}
+		poff = mark_off;
+		if (!sbc_dif_prot_copy(&psg, &paddr, &poff, dsg, &daddr,
+				       &sdt, true))
+			return;
 
-		kunmap_atomic(daddr - dsg->offset);
-		kunmap_atomic(paddr - psg->offset);
+		sector++;
 	}
+
+	kunmap_atomic(daddr - dsg->offset);
+	kunmap_atomic(paddr - psg->offset);
 }
 
 static sense_reason_t
