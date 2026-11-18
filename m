Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795036524;
	b=XbQKQ0btaQahrRoDSWkgtgtb8rJEEcc1G90MwqSFqudqYaN4ujPS20smPa/UjW0x8tUp
	 ktbG9T9ZP6t3ECCNSpMVVJLx6Rrokufk/H1T+WbDn7RJ7ajgURyI4CZsEHv5GK4kMoBXI
	 mtVrC5ApM/6e4WBIZV9sM7CwW2h4H2Y7MQcryolzoKHRJeg+Mg58ycG/DqiRoV2wYAoSC
	 ZmzRrHL1Kg/q/6B0Xl1FQRkipzG/j8YnhOaiaLcbHWRhJDyydeMT+hC+XjRlJP67jjjiD
	 +eJIUyl9U7vH7j8qmnvy8odZU5LS61kJ6L/kA9smAFV3ifZ/OOyhgr474ggBRYS/umg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795036524;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1F5PhsVSMvlAKbqeP5i5JDJo+bg6gq7qbiCDaCKQio0=;
	b=SKqBnTALQ30zrkHyK/HMO3/QqaNMallivAB1E4pbNBeboIYw37ACsjdUjedq4RLRNo+M
	 8VTw+g/uRg6JcNvywyAAvECRBC0hw+cm7J9F+vIKEEl94MpyfZIRdIf0WhXh9NASeuwis
	 hPYBdZPYHYIDF4ubuloQFVx1Uqky6NpL7B2zPPupfMLKldgaMOp48eAW/mmKUZECx/rAJ
	 7+bk1QR2eMv01k9XM5YdaXH3CtPc8EtirLrO7lp4dTtS+p2KQkNFcPMM39R1PcFWtq3Js
	 Wcot/IyfC96hcc2UjDMyKBNi9dqbRfJ1el3zrJvadminGLCVITs8QSgXVcL8eSYebIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=GuGWlwhG;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1800A606A339
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:15:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1800A606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=GuGWlwhG
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdb45e96d2bso983923a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795036523; x=1795641323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1F5PhsVSMvlAKbqeP5i5JDJo+bg6gq7qbiCDaCKQio0=;
        b=GuGWlwhGz9SBzk1Mj+QMBzfNga5lBR9TA/XAmEkifgkSxr1yhb0Ef+xRkWvbej++aa
         P3FmveqIJSa8QHbXD5bg4orDk5EodifsPEN5qzLf9AvmsvnOYcpBeJwTOyYCHAAbA+6c
         U/SORLAaXeFJEym+tx+fqicc2Y7/UXXMACj5w2GV3TKnvbI/KViG0DzcyYov4FmSpDVt
         bTOf2CYekWLVsl57SS2vj0QEFAvdkjSsj3jgo7I0xaNdwhFiW0c966dyMZBHc/qhxpdl
         PFbNevaH/iNF6+Fqkvi/YxJOAUuIZ5M1125o+LGmK2Co2/JwnIWbphDMlMWHN1z+6orB
         xgeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795036523; x=1795641323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1F5PhsVSMvlAKbqeP5i5JDJo+bg6gq7qbiCDaCKQio0=;
        b=SyA46t+DXgKi4UdWOMV3mjo4iqjAMLAZrnXQLybWn2VbNFT8yWCoEtyb8jYpK3a3Rh
         smhn+lTrZSbUXzxWFfkOYOrcr5LtFOAfITzzugMswvhsFbd79m2yg9VEoOimnsQzPm68
         ZgKBkLt4GwmdNEbixrdkdA4KHvY5aLaTUECxrNKiLssz7+FN3E6FDr2LOSfJFkrn46T5
         GaLZcIrtQtimBoYbPkAH7ELikyGOUGHeGj3kGDFrlCEpNPUrIkphpasaCYm/tgwmAEp+
         l+RzIlQhbU98AXKys5j0WwZhDwQxIV1VjTWBG3CQE5sCXGCqq0Er/ta0axdIFDygJkKn
         A6gg==
X-Forwarded-Encrypted: i=1; AL+hErGfdzrdgoC1GW3sE943bt07jvq4Mhtssuvp6AfhyY2NlJWuLyv9SI4NK//8x9BYEvf2Y4sEzlYfH+f+dzU=@vger.kernel.org
X-Gm-Message-State: APuU4Z98Pqts4KLwn9+N6WdOJyW5LEPTN3RQbn+IMeLOaDjGgsjzI0G6
	1Mtu5hZ7mOcUtIYqxzXzdG5IeV3zlUnObOFCkE+6VleyMdZlxAuioparnwlMMUN6Bhk=
X-Gm-Gg: AZFdTZcGkZIsHY4g4FapNPSEP+SDgkydkedM2+km4GhSlEW9oR/5kQ155j3hIAynCnA
	6Wg0UVhhVgs4fA65gLeIhppTr1kjI4Yhl032hUT/uS+cyfxlV4LOFzUl3PHy7oRixQGybtblt9x
	3crwkpiDxaqRLZCgY3mJTCew5VT0FAXHKw29P8MQFePyNfD9PdxFaywICBmKB/ndx6D0apkJpUe
	1yzSwnPi31t22/vup9koxzzibT7zL3jI8h2Zw6P2m49QHNLdqDw4cikwzcSRbNBW9Nn6jBueYfc
	eE5MW/reQENeN4x4IJKR7NDIxCYzKO5vtRjo3HKTY5yC/GAGJX90c3I+eyVjTDagjO7hIUUm3F+
	ndezkuxA0FshrEJT8O7Ob4xy60EvhSMtzBNI8ggKVK2uTKMdn9+A0oKjFIKi3UXacdKCMo0wal/
	MJ2YNFUXdPzvgybvEPBzz9Q4UeqRJC+JtOPzy+WUevEaVW1LCZ6j/uHjxGIqQQEucL666CeH0EL
	IXIGUBGJmq9TUXkkqgoEr2jY20LBSXWiJ3L2WXPgmitJcWh8rMxh4YdMFpsYSbo3miWJRCmlMKW
	vDZ/DmesPwkmsl+GN9Kc4QXoNWdLucldauifZTiuu2Aot1AbjwzUQc2uDWI/DtQ48W90WlThJFX
	bncxiU1Shcg7QWplOX/FDCpEDjKFUW+HJ0WdWxA==
X-Received: by 2002:a17:90b:3891:b0:3ad:4bfc:1e77 with SMTP id 98e67ed59e1d1-3b3d082df08mr3830128a91.66.1795036523402;
        Wed, 18 Nov 2026 13:15:23 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:e78e:f7f0:2120:34e7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d5689adasm2611719a91.1.2026.11.18.13.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:15:23 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: sagi@grimberg.me,
	jgg@ziepe.ca,
	leon@kernel.org,
	mkp@kernel.org
Cc: linux-rdma@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] IB/isert: do not leak the receive descriptor of a dropped Data-Out
Date: Thu, 19 Nov 2026 06:15:03 +0900
Message-ID: <20261118211503.2526705-5-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118211503.2526705-1-yhlee@isslab.korea.ac.kr>
References: <20261118211503.2526705-1-yhlee@isslab.korea.ac.kr>
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

isert_handle_iscsi_dataout() works on the command it finds by ITT, which
holds the descriptor of the SCSI Command PDU and not of this Data-Out,
which is why the function posts its own descriptor explicitly when it
succeeds.  None of its other returns do, and isert_recv_done() ignores
what the handler returned, so each such Data-Out costs one of the
ISERT_QP_MAX_RECV_DTOS buffers.  That includes the returns where
iscsit_check_dataout_hdr() answers 0 without a command at all: 200
Data-Outs carrying an ITT that matches no command stop the connection
after exactly 128 of them, with no response to a NOP-Out sent afterwards
and nothing logged beyond the per-PDU "Unable to locate ITT" message;
with this patch all 200 are taken and the NOP-Out is answered, in 5 boots
out of 5.

So give isert_handle_iscsi_dataout()'s other returns the same post its
success path already does.

That one function only.  Everywhere else a handler returns non-zero, the
command isert allocated still holds that descriptor and the response
posts it from isert_post_response(), so re-posting from
isert_recv_done() would post the same descriptor twice; the second post
is skipped only while the descriptor has not been refilled, which is not
something the receive path can promise.  iscsit_handle_logout_cmd() even
returns 1 for an ordinary logout.

Fixes: 4366b19ca5eb ("iser-target: Change the recv buffers posting logic")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/infiniband/ulp/isert/ib_isert.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/infiniband/ulp/isert/ib_isert.c b/drivers/infiniband/ulp/isert/ib_isert.c
index b7dcfc5f88b916..804148ace398aa 100644
--- a/drivers/infiniband/ulp/isert/ib_isert.c
+++ b/drivers/infiniband/ulp/isert/ib_isert.c
@@ -1141,17 +1141,16 @@ isert_handle_iscsi_dataout(struct isert_conn *isert_conn,
 	int rc, sg_nents, sg_off, page_off;
 
 	rc = iscsit_check_dataout_hdr(conn, buf, &cmd);
-	if (rc < 0)
-		return rc;
-	else if (!cmd)
-		return 0;
+	if (rc < 0 || !cmd)
+		goto repost;
 	/*
 	 * FIXME: Unexpected unsolicited_data out
 	 */
 	if (!cmd->unsolicited_data) {
 		isert_err("Received unexpected solicited data payload\n");
 		dump_stack();
-		return -1;
+		rc = -1;
+		goto repost;
 	}
 
 	isert_dbg("Unsolicited DataOut unsol_data_len: %u, "
@@ -1169,7 +1168,8 @@ isert_handle_iscsi_dataout(struct isert_conn *isert_conn,
 	if (page_off) {
 		isert_err("unexpected non-page aligned data payload\n");
 		dump_stack();
-		return -1;
+		rc = -1;
+		goto repost;
 	}
 	isert_dbg("Copying DataOut: sg_start: %p, sg_off: %u "
 		  "sg_nents: %u from %p %u\n", sg_start, sg_off,
@@ -1180,13 +1180,18 @@ isert_handle_iscsi_dataout(struct isert_conn *isert_conn,
 
 	rc = iscsit_check_dataout_payload(cmd, hdr, false);
 	if (rc < 0)
-		return rc;
+		goto repost;
 
 	/*
 	 * multiple data-outs on the same command can arrive -
 	 * so post the buffer before hand
 	 */
 	return isert_post_recv(isert_conn, rx_desc);
+
+repost:
+	/* Nothing else owns this Data-Out's receive descriptor. */
+	isert_post_recv(isert_conn, rx_desc);
+	return rc;
 }
 
 static int
-- 
2.43.0

