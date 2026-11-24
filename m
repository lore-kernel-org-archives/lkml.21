Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795532474;
	b=MiNddhbcyvSbhFBQ6iXQ96hRPB8vNp04CG9+whCs6Kuu1Ln0TNBMv0bSDEq5SZxNqqb8
	 kf7Kxi/TTNmpaxLZ8I1miez2krIu/x3HKabk0hn6w4kepaSdHHuo6f2j2MD1mtVCc2opd
	 Zj/Ev9qjNI+FXbNqYzS74Xn6QED/ESFVCwWs4bRn/mbsE4/7pOY8hck0RgWjKLksV1MN0
	 ZM3lar8VsksQel1j9+6G9b6jquKhnnY1kelOdsG8grcYeNJEIgtSybxfUbfXK6GQMfi7n
	 DYj5xmNn1qw20BLjwGSabsJv5/zqA8bGKQH4SKVQe3liJA8leMvwijbiT3/3lPahW/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532474;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=OCP8g2l59WgeSn2ZtdFHcJloG9W93voXqi/JA7Q4iag=;
	b=1764bffoL6BVyHHLsEt+0mZIItOJBhh7F5fM6D0q3fzkv+oOYXluPvNnvcGM68cMpTW4
	 cS/mD6C2cIcWEibxQN07aPIjAPd93kPzYWxG8QYG46wK+QQNJX7a9gwgFyx39M1FYFXJD
	 3pezu5kVqBiaIqZKV7ZB1Pn+hM6Q7fFL8rb92URkRIDxGC228+elBJWiz8D2PfA2hzpMl
	 Gbv61W8RAPRBIl4LI26DUJdda9wHVlvUDs1eOfgptsqByIYYvjxljJjKJBHuPWjpoQA6T
	 eKaMuAOwcfOpB0orB63lt9g7mlsy2JdfWgPMeeTlXIT80ILAZ/fw/WxxP5NCniW9L6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EPz8jS5u;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE31D606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE31D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EPz8jS5u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795532472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OCP8g2l59WgeSn2ZtdFHcJloG9W93voXqi/JA7Q4iag=;
	b=EPz8jS5up+a/R6YE79R9ym9/kFkS28hL1jgCtSsI/q7i1aN57aqdpYfTPRaaocLkZe+TL2
	ieMvmdm0tG57MP+dAi5xqB2qccdy3yK3GCXL87DdW1F34K3t3eHxTaYIa4PDVwovgA8Qe/
	UvhFrINlpt2oEbAh4tp76v4gf7qNXS4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-636-C8DzT9FgNlu_lLaNle3r6Q-1; Tue,
 24 Nov 2026 15:01:09 +0000
X-MC-Unique: C8DzT9FgNlu_lLaNle3r6Q-1
X-Mimecast-MFC-AGG-ID: C8DzT9FgNlu_lLaNle3r6Q_1795532468
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E10B218028B7;
	Tue, 24 Nov 2026 15:01:07 +0000 (UTC)
Received: from jtaubepe-thinkpadx1carbongen12.ibmlowe.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CD8A1195B3C2;
	Tue, 24 Nov 2026 15:01:05 +0000 (UTC)
From: Jesse Taube <jtaubepe@redhat.com>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Nimal Prabudoss I <nprabudo@redhat.com>,
	jmeneghi@redhat.com,
	Nilesh Javali <njavali@marvell.com>,
	Manish Rangankar <mrangankar@marvell.com>,
	GR-ETH-Storage-Upstream@marvell.com,
	Jesse Taube <jtaubepe@redhat.com>
Subject: [PATCH] qedf: Fix use-after-free in qedf_xmit error path
Date: Tue, 24 Nov 2026 10:01:03 -0500
Message-ID: <20261124150103.166306-1-jtaubepe@redhat.com>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

In one of the error paths in qedf_xmit, we were freeing the skb and then
accessing the Fibre Channel frame header destination ID field stored
in the skb. Save d_id from the skb before freeing it to avoid a
use-after-free.

Signed-off-by: Jesse Taube <jtaubepe@redhat.com>
---
 drivers/scsi/qedf/qedf_main.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/qedf/qedf_main.c b/drivers/scsi/qedf/qedf_main.c
index da429b3a4283..ff7d93fbc079 100644
--- a/drivers/scsi/qedf/qedf_main.c
+++ b/drivers/scsi/qedf/qedf_main.c
@@ -1113,11 +1113,12 @@ static int qedf_xmit(struct fc_lport *lport, struct fc_frame *fp)
 	}
 	if (vn_port && ntoh24(fh->fh_d_id) != FC_FID_FLOGI) {
 		struct fc_rport_priv *rdata = NULL;
+		u32 d_id = ntoh24(fh->fh_d_id);
 
 		QEDF_INFO(&(qedf->dbg_ctx), QEDF_LOG_LL2,
-		    "Dropping FCoE frame to %06x.\n", ntoh24(fh->fh_d_id));
+			  "Dropping FCoE frame to %06x.\n", d_id);
 		kfree_skb(skb);
-		rdata = fc_rport_lookup(lport, ntoh24(fh->fh_d_id));
+		rdata = fc_rport_lookup(lport, d_id);
 		if (rdata) {
 			rdata->retries = lport->max_rport_retry_count;
 			kref_put(&rdata->kref, fc_rport_destroy);
-- 
2.56.0

