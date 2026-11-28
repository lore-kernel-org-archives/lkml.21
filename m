Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795837064;
	b=iSzkc2dajF4abqdlh2Y6ZstKA0AHbQv9+PjpbS3aDYBf4Lz/Egiwhw8H/uYMDbw5uDFV
	 8b6sRq4Ro1HuFgk/UlI+o8IOfN3271DwbRhiLn924b9C+YbzBSy04wbd5rM/TL+9Gf/3i
	 O1TR6ot1JeSwI+UkNQe7g2DIWrmrMlfnsZAUEFi2Wk1qMJPOt9JEF5f4sCgsKI5EWv4PX
	 Kfzn6jAt2rb3u5xnAB0JTRp/S7CiSccwFVu1WOub0Dg0bGI2GQArH47L6zRROI31uf7dT
	 zEbO88fboRl3arQKTKjEArccPKQks4HPr6SD17bvngll8w+taKLOtdc36W3IAoHAy2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795837064;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CoOSrxK+y3duBfRBPRX/cABY+OCMf/PDrt2oQl6NHUg=;
	b=Qjefx1+zIaWPbPb1iDfv3PHu3huZnxN+aysqxiRjVQP+C44z4ys4Xv0nzJXQkH8jMc/N
	 sV+4+9kW7SRQB8LakkPB5cN9widHAbVr6GPY81nllYarEkkNT4HbyTIH41x2JT9x5n3Lg
	 SrHdTNiSAOkFFqLiAjMmwApVIOFyJ7+5Scr9rcbvcJNLqqp5AnmJ/1DPvVt1Twz0uHf1+
	 gUFimwyaVV+Hj7Z0Yq7KlAjErBQ6Ctw6tde/5p0hPvw6d44hIG3WTPN18DsGIqJqEbAmv
	 srIGNobjM+GPH77iq5nxwUUsN45abhUucTCSW/m1RzYE8DVSy6/u8NF6MuL3CMXfROA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=ZVqfHwS0;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E055C606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 03:37:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E055C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=ZVqfHwS0
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8b271e573adso3728203b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795837063; x=1796441863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CoOSrxK+y3duBfRBPRX/cABY+OCMf/PDrt2oQl6NHUg=;
        b=ZVqfHwS0yY6hgOTchfvwgYvA39Vbn9CgOLbgnbOhlMuIrvLQo1S95FPGUYgXzRDkwi
         R4jeXPmLTI8dz76eAd5GrGUHAOINYeuavetVDJRVWkUyqg1D4UzwTim1ZyS3k0N9nFAY
         rbgGTTTZoVtxZDdwOXuDAMWkQ6EimirerceNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795837063; x=1796441863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CoOSrxK+y3duBfRBPRX/cABY+OCMf/PDrt2oQl6NHUg=;
        b=dcXA1qSfM9tlJUI5e77N/Kg4Qzyf4I+DD2KZqLlPKrV97xvw+wTRXjQbxJy2C1lAXj
         odNAQ+95qfHW7IK7vjdLVQrSFWoTfc2F46hj/N1yBPtdmm1DItw9DMqgHcvJRsq7igfu
         lNbpeBYM49DvJ6kpE+TZczwwHRwx4N8HiTRBnjJn/Sugm6JZpBOcz062UrA/haECMwWg
         yC6yr5OtnFjcJfNYQclJb7L/Z9Kq6Hyh2b03y/lDY8M8kJRiiINwFL+6iVnk6lK3NIrI
         TDCmt1RObTZImZ5Izo6lFb+yqoZfcwN6Lc9iNBQ0/CNLUHJV3XKUcggvGkFcBRfNyWu4
         1RLg==
X-Forwarded-Encrypted: i=1; AL+hErHg0eZSew1viKfGvOvI9J/43JT4tGLOwbCh7JE2Ic7eyhs26q63svu+XuvuClWuUv21vCxdhBKK5nASIuA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QQGCDWcXSWedC6EauGtMrkIVB0TOpBCIpozn4GoYHZqJM+XZL
	zP6OrYdnFOSVGnuNR0TwFTzXld4QwR68Pqj46kQbucn79VIYvoTl18O15h5qWpu0eyc=
X-Gm-Gg: AZFdTZeSeHbJ97XjQcmRc0JUO+ZGW3ydvHe5XLoXPNkSAhJYr3cL86/6K6TYuXkW5Wx
	r89ySAWI9QK5IvoWRWjrX0CDTcmEiqf7ZcfLAdGShcEsgQ2hX9+/uVadlS6tRqNGwyG/jJxxlOM
	k6c2xwSFaWzEFN556Z//qH1sdOTklQqLawCG8ecAs3FitYEdJRIrv3frv49SmDk1BCbOOuJFM4e
	8xZvewm5Nw5/PsrSdG8+Ghty9a5tDbtzzQpFPcOc+7Z3dpLTc9OAsTbZOTWvKEUz9xJ2uu99Uxq
	XQ1uWlFPnyfauxlJg6FNToOZv5sPSppoCB9V5BS9RZObDEzOiftZwcJh+cbsSKa4V+71yQJ7ax/
	Dss3vN/vo3P8wMheWwFMo7e85F+qKxXnJIt/F6NCl1jY44nq0p03tx1SZNommo8fKIYcWEfBTcq
	mqXAdtMMSUEU5estuiKtW8ntGsKjzPT4Yrhf0twH3FXn7DawtY/3VilTPu8ilAnGDhQtjBeT+ic
	eR+DYYAFT1McdyNlvBGS964M0ldWjQpDMN5HuQwXnCMxZAZVii+jpN4peWDQTzFWbBJ0NEfT2Bq
	TZSESDgiWN5qCRx47LyfA6L7ZKcSPIjlk1DUgUMjZqaaWOmVho+xEsx3D0lOpE3DEGv9C00JfFL
	fGslFXoHHsnvT8JYBX7kcuMURI6jAjtaW0YuML9AVw3b3pDcz+QOgCbbCxM7uPemz1w==
X-Received: by 2002:aa7:88d4:0:b0:880:7dad:3e5 with SMTP id d2e1a72fcca58-8c87d12283bmr26030379b3a.51.1795837063176;
        Fri, 27 Nov 2026 19:37:43 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4aca2sm13517969b3a.32.2026.11.27.19.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 19:37:42 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: Allison Henderson <achender@kernel.org>,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>
Subject: [PATCH net] net/rds: do not leave ic->i_cm_id pointing at a freed cm_id
Date: Sat, 28 Nov 2026 09:07:37 +0530
Message-Id: <20261128033737.467966-1-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
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

rds_ib_conn_path_shutdown() frees the connection's rdma_cm_id and only
clears ic->i_cm_id afterwards:

	rdma_destroy_id(ic->i_cm_id);
	if (ic->rds_ibdev)
		rds_ib_remove_conn(ic->rds_ibdev, conn);
	ic->i_cm_id = NULL;

rds_ib_remove_conn() takes locks and can sleep, so the pointer is left
pointing at freed memory for a while.  Both FRMR paths read it with
nothing that excludes this teardown - rds_ib_get_mr() from sendmsg()'s
RDS_CMSG_RDMA_MAP handling, and rds_ib_unreg_frmr() from the MR pool
flush - and the NULL test in rds_ib_unreg_frmr() does not help, because
the pointer is not NULL, it is dangling:

  BUG: KASAN: slab-use-after-free in rds_ib_unreg_frmr+0x119/0x860
  Read of size 8 at addr ffff888022d67010
   rds_ib_unreg_frmr+0x119/0x860
   rds_ib_flush_mr_pool+0x685/0x9f0
   rds_ib_flush_mrs+0x57/0xc0
   rds_release+0xc9/0x220
   __sock_release+0x65/0x160

  Allocated by task 37:
   __rdma_create_id+0x48/0x4f0
   __rdma_create_kernel_id+0x3c/0x80
   rds_ib_conn_path_connect+0xfa/0x320

  Freed by task 9508:
   kfree+0x1c7/0x660
   rds_ib_conn_path_shutdown+0xc2b/0xd30
   rds_conn_shutdown+0x3ca/0x940

The same dangling pointer reaches the registration side, where a fuzzer
found it posting a work request to the QP of a cm_id already destroyed -
rxe reports that as "qp has been destroyed" from its own
WARN_ON_ONCE(!qp->valid) and then faults on qp->state_lock.

Clear ic->i_cm_id before destroying it, so a racing reader sees NULL
rather than freed memory, and check the pointer in rds_ib_post_reg_frmr()
the way rds_ib_unreg_frmr() already does - it is the one FRMR site that
dereferenced it without a test.

This does not serialise the two sides: a reader that has already loaded a
non-NULL pointer can still be preempted before using it.  Closing that
would mean giving the registration path the exclusion the other users of
ic->i_cm_id have, which is a larger change than this one.

We found this with a syzkaller-based fuzzing harness driven by an AI tool.

Fixes: 1659185fb4d0 ("RDS: IB: Support Fastreg MR (FRMR) memory registration mode")
Cc: stable@vger.kernel.org
Signed-off-by: Kapil Vaswani <kapil@presceralabs.ai>
Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
---
 net/rds/ib_cm.c   | 12 ++++++++++--
 net/rds/ib_frmr.c | 12 +++++++++++-
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/net/rds/ib_cm.c b/net/rds/ib_cm.c
index 16bfeaaf3b97..17d748f08607 100644
--- a/net/rds/ib_cm.c
+++ b/net/rds/ib_cm.c
@@ -1077,6 +1077,7 @@ void rds_ib_conn_path_shutdown(struct rds_conn_path *cp)
 {
 	struct rds_connection *conn = cp->cp_conn;
 	struct rds_ib_connection *ic = conn->c_transport_data;
+	struct rdma_cm_id *cm_id;
 	int err = 0;
 
 	rdsdebug("cm %p pd %p cq %p %p qp %p\n", ic->i_cm_id,
@@ -1178,7 +1179,15 @@ void rds_ib_conn_path_shutdown(struct rds_conn_path *cp)
 		if (ic->i_recvs)
 			rds_ib_recv_clear_ring(ic);
 
-		rdma_destroy_id(ic->i_cm_id);
+		/* Clear the pointer before freeing what it points at.
+		 * rds_ib_unreg_frmr() and rds_ib_get_mr() read ic->i_cm_id
+		 * without holding anything that excludes this teardown, and
+		 * rds_ib_remove_conn() below can sleep, so a pointer left
+		 * behind here is one they dereference after the free.
+		 */
+		cm_id = ic->i_cm_id;
+		ic->i_cm_id = NULL;
+		rdma_destroy_id(cm_id);
 
 		/*
 		 * Move connection back to the nodev list.
@@ -1186,7 +1195,6 @@ void rds_ib_conn_path_shutdown(struct rds_conn_path *cp)
 		if (ic->rds_ibdev)
 			rds_ib_remove_conn(ic->rds_ibdev, conn);
 
-		ic->i_cm_id = NULL;
 		ic->i_pd = NULL;
 		ic->i_send_cq = NULL;
 		ic->i_recv_cq = NULL;
diff --git a/net/rds/ib_frmr.c b/net/rds/ib_frmr.c
index 8397aa4a17ac..09e732ac2324 100644
--- a/net/rds/ib_frmr.c
+++ b/net/rds/ib_frmr.c
@@ -124,6 +124,7 @@ static int rds_ib_post_reg_frmr(struct rds_ib_mr *ibmr)
 {
 	struct rds_ib_frmr *frmr = &ibmr->u.frmr;
 	struct ib_reg_wr reg_wr;
+	struct rdma_cm_id *i_cm_id;
 	int ret, off = 0;
 
 	while (atomic_dec_return(&ibmr->ic->i_fastreg_wrs) <= 0) {
@@ -164,7 +165,16 @@ static int rds_ib_post_reg_frmr(struct rds_ib_mr *ibmr)
 			IB_ACCESS_REMOTE_WRITE;
 	reg_wr.wr.send_flags = IB_SEND_SIGNALED;
 
-	ret = ib_post_send(ibmr->ic->i_cm_id->qp, &reg_wr.wr, NULL);
+	/* Check it the way rds_ib_unreg_frmr() does: the teardown clears
+	 * ic->i_cm_id, and nothing here excludes it.
+	 */
+	i_cm_id = ibmr->ic->i_cm_id;
+	if (!i_cm_id || !i_cm_id->qp) {
+		rds_transition_frwr_state(ibmr, FRMR_IS_INUSE, FRMR_IS_STALE);
+		ret = -ECONNABORTED;
+		goto out_inc;
+	}
+	ret = ib_post_send(i_cm_id->qp, &reg_wr.wr, NULL);
 	if (unlikely(ret)) {
 		/* Failure here can be because of -ENOMEM as well */
 		rds_transition_frwr_state(ibmr, FRMR_IS_INUSE, FRMR_IS_STALE);
-- 
2.34.1

