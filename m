Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795321290;
	b=uDMUmwc+pQAocbXZKPfdmvuC2hVj7yh4qip3+tDWj1JF/oqTmBCbTPDdR1fsb1m+XL/p
	 3iR3Gw9Sr39+oz1tn41DLDPBbeJHqnWCA08MeQNPOrsHE54Fu52YWYt+sr4fXNhR/iuK8
	 Gb6EAeBB/4OfVa1b+4O4u3/Ln3hUkbBxvvCq4WSjLhf4dHAp1oDUiuftD6Cl78IbSw/Dp
	 zSebueuqw3CuuJ2ey90KRJbpIiR0yyhasCx9blgSssBIMzIs0ZM/87HxNd+u7Vzzu0PY+
	 haMcwqsc14fjFeYJPQp2jU9PuP8XReg1kuWTOnn537TTRLc18xYr0x3ULgorlnoXvPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795321290;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HJWH9hxOjGLkWCyzc+2OYWRLFu1BzAPngPtrjIxuofY=;
	b=pPILM14Nawp6BfGDjOplZsxBYDtCkZi8iF/cYG5abTxn0lj3VnB545DglLOkuRu1bLHj
	 7U+jy/iZvn92Kluc0XJB5q8n/WQQ+hdOOw3h4tM6MDT1cF/Aiooh6buvFnxoDnunNnFwb
	 5h7wNBQb0itNym/CXacT43+jc116SwfpXYAhfDGkOuj2tSXVLhw+kCbn+82DDYFsXK+Uw
	 gUQ3wiL32AjW87gXtU5oOl2NW4udRHpF8t8qRgaLxJ7gabl8v7svtcU6vxtnfPkmqqatu
	 i12tzozk910Ezd3fjGHencMTnB8eJV7sntFjFGqmQP6rsNNmJ5qXQxiTJQ08U3tV5Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=WDnYFfJo;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1F4606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 04:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D1F4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=WDnYFfJo
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b40470fdd8so1010038a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 20:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795321290; x=1795926090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HJWH9hxOjGLkWCyzc+2OYWRLFu1BzAPngPtrjIxuofY=;
        b=WDnYFfJomB/kWbXSv6O7VFw9HUzZQwf4GYzRkJ8Q9YIbj0PuamJ7grUC1Hoa81wWPM
         XIq0wXvdKZM2q7s+Ld04jnBAz/Tc1+q47kS5jKgUepxD+auwbwcBXtMLwJLWz4QsZGlg
         ZIUEIYGC1xdoaf+OFn1M/jfl/fNd2hc2tEayM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795321290; x=1795926090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HJWH9hxOjGLkWCyzc+2OYWRLFu1BzAPngPtrjIxuofY=;
        b=pTFdPwEXXZQQ/ZX2+dj8UonEgn9R7nYBzBVjw/ug/njpoXD2sYfxrClHd+l9NVSiEb
         AjADtVVQ2gq4urmKRfuInPGOqTDiOVwLmgU18U6tyqJnz3AT2uuy7TPAJB/gnzpSREjW
         r4EOsvtJPsFnQ36EWy0vQyyS3A59sPpgPu/vz1vnaYtHYg2+7qjf3CAMY8RfNZ9wvyHJ
         NbIiCDL5BwBq2kb+YsSPiHmdsEJ/X9qMqGL9/XqF95saw8vJKW8qDh0/kdWJ+G3qTTol
         74/Aqw8hEImI1zXvD0rgJ1fZRDa9BNZdvTaPwLrcma1sv1bwikLbDy/DmIX/G66AJ8Zk
         Wm4g==
X-Forwarded-Encrypted: i=1; AL+hErFmHoimhKKDFD4emh7C4GtWw0Vcu5F75bdTZOA/fngygZpb3TUjtThsbHwNfkpTnQQVQeznh89GJq6OLIQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rn+NVw6PIManq0/pWOoDkWEZoMmWMUs5y6F92jbdADWd8UgvJ
	BmOVeFiw++tb8x8QLYpfcj3SNr7Bybeb+pYdiMqqtlSUyADk0IgfoTMnimPV9BxmWew=
X-Gm-Gg: AZFdTZfPXRUCxiHkwJN+ALnp4oTkAn6vWUKQg7VdOosBpbrzrF9wLzqfaCSrnfuKqmK
	+OoI18GDUAebmFlFAHneNRWu183+89/70LEuuA/DNHewc2cMDOf9ldD3fcgsYEEFehOf+OjpAFD
	Z1HYw5vxEluPvytkSrNnPuUMX1e2W5xDt7OfvqMHSQm+KVHcOh3kYB6BjW4ulMRIbStp/hLaWFl
	bv3mMKuJ/PWRW82XITlOXUt787GzMWzSPDNTqLNI+4ArdP4bPFdZnTS74nfHIB+oXCIV1NKywPh
	R4awntAnnFB65jq3N5ykXehYDOL9Hm88J8KJik3EHDMuPwT2S4cBCwqQH3cTPFaU9WexGVO2y5I
	POWgX/lGfNLjryTEc885TtJI3kX2B/63M2SHahK+R4ken7WcBC15XKxDuZOy3b6jeAXJAQ1UnNS
	NxtrzzDeeA4OvHX7jJ8R9qVm3xaY/3WuYt0eV3d3rrYuxvTVM/yLkFuCXI/E2aPvlBCqC+8Vs9d
	+7Kd5xq3JSoMsymd60u7YDNgzB7vvtRMYL0aKhGs2cMO7cMZytT7wdrUPnqnFxpijPhU046DN6o
	BT7ehjsY9ZMfMkL0OW6BxKl1g+8bcSdrlpx4dgLJbE1jX65BHlf6AxMGzv02PwQfYa56dDTH0a5
	OzFzMWnIUWz0GH4bhdWLYJyfJ6SK/DPdoLmON2aaAAe5SV5rsrumEc0q7U5e78riH
X-Received: by 2002:a17:90a:e705:b0:3ad:3e8:12 with SMTP id 98e67ed59e1d1-3b41cb056e2mr5675261a91.48.1795321289774;
        Sat, 21 Nov 2026 20:21:29 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecb486sm13775407a91.16.2026.11.21.20.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 20:21:29 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: alibuda@linux.alibaba.com,
	Dust Li <dust.li@linux.alibaba.com>,
	Sidraya Jayagond <sidraya@linux.ibm.com>,
	Mahanta Jambigi <mjambigi@linux.ibm.com>,
	netdev@vger.kernel.org
Cc: Tony Lu <tonylu@linux.alibaba.com>,
	Wen Gu <guwen@linux.alibaba.com>,
	linux-rdma@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>,
	Piyus Kedia <piyus@iiitd.ac.in>
Subject: [PATCH net v2] net/smc: validate the peer's CDC cursors against our own buffers
Date: Sun, 22 Nov 2026 09:51:20 +0530
Message-Id: <20261122042120.2430434-1-piyus@iiitd.ac.in>
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

A peer's CDC message carries two cursors that are offsets into buffers
described on this side: the producer cursor counts the bytes the peer has
written into the RMB we published to it, and the consumer cursor the bytes
it has taken from the RMB it published to us.  Neither is checked, on either
transport.

smcr_cdc_msg_to_host() and smcd_cdc_msg_to_host() copy both into the
connection as they arrive, and every later user treats them as trustworthy:

 - smc_cdc_msg_recv_action() adds the producer difference to
   conn->bytes_to_rcv under a comment asserting
   "guarantee 0 <= bytes_to_rcv <= rmb_desc->len", which nothing enforces;
 - smc_cdc_handle_urg_data_arrival() reads
   *(base + conn->urg_curs.count - 1), an unbounded index into the RMB;
 - smc_rx_recvmsg() clamps only the first of its two ring chunks
   (rmb_desc->len - cons.count) and uses the remainder unclamped for the
   second, so bytes_to_rcv becomes a copy length;
 - smc_rx_splice() walks PAGE_ALIGN(len + offset) / PAGE_SIZE pages calling
   vmalloc_to_page() without checking the result, and get_page() then
   dereferences NULL once the walk passes the end of the RMB.

A peer that reports a cursor larger than the buffer therefore makes the
kernel read past it.  With a 64 KiB RMB and a forged cursor, KASAN on
7.4.0-rc3 reports a 1-byte read in the urgent-data path and a 131072-byte
read in the receive path, the latter via _copy_to_iter() - i.e. the
out-of-bounds bytes are delivered to userspace by recvmsg() - and splice()
oopses on the NULL page.

Validate both cursors where each transport accepts the message, so that one
test per transport covers every consumer.  Each cursor is bounded by the
buffer its own arithmetic uses: the producer cursor by conn->rmb_desc->len
as in smc_cdc_msg_recv_action(), the consumer cursor by
conn->peer_rmbe_size as in the diff_cons calculation beside it.  A cursor
equal to the buffer length is legitimate (a full ring), so only a larger one
is rejected.  An out-of-range cursor cannot occur in a correct peer, and the
malformed message is dropped like any other.

The SMC-R check sits next to the existing length and sequence-number tests
in smc_cdc_rx_handler().  SMC-D needs its own, because smcd_cdc_rx_tsklet()
reads the cursors straight out of the DMB the peer writes into, in host
byte order and with no validation of any kind on that path today.

How this was found: by AI-driven fuzzing built on top of syzkaller.  Its
analysis was then checked by hand against the code, and all three faults
were reproduced on net.git main under KASAN, with the patched kernel clean
on the same three reproducers and ordinary SMC-R and SMC-D traffic
unaffected.

Signed-off-by: Kapil Vaswani <kapil@presceralabs.ai>
Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
---
 net/smc/smc_cdc.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/net/smc/smc_cdc.c b/net/smc/smc_cdc.c
index 32d6d03df..8d24e0c83 100644
--- a/net/smc/smc_cdc.c
+++ b/net/smc/smc_cdc.c
@@ -433,6 +433,18 @@ static void smc_cdc_msg_recv(struct smc_sock *smc, struct smc_cdc_msg *cdc)
 	sock_put(&smc->sk); /* no free sk in softirq-context */
 }
 
+static bool smcd_cdc_cursors_invalid(struct smc_connection *conn,
+				     struct smcd_cdc_msg *cdc)
+{
+	if (!conn->rmb_desc)
+		return true;
+	if (cdc->prod.count > (u32)conn->rmb_desc->len)
+		return true;
+	if (cdc->cons.count > (u32)conn->peer_rmbe_size)
+		return true;
+	return false;
+}
+
 /* Schedule a tasklet for this connection. Triggered from the ISM device IRQ
  * handler to indicate update in the DMBE.
  *
@@ -452,6 +464,15 @@ static void smcd_cdc_rx_tsklet(struct tasklet_struct *t)
 	data_cdc = (struct smcd_cdc_msg *)conn->rmb_desc->cpu_addr;
 	smcd_curs_copy(&cdc.prod, &data_cdc->prod, conn);
 	smcd_curs_copy(&cdc.cons, &data_cdc->cons, conn);
+	/* This CDC was written by the peer into the DMB we published to it, so
+	 * both cursors are peer-supplied and index buffers described on this
+	 * side.  Nothing else checks them, and smc_cdc_msg_recv_action() uses
+	 * the producer cursor as a receive length and the consumer cursor to
+	 * credit sndbuf_space - which under DMB-nocopy is the memory the peer
+	 * itself owns.  Unlike the SMC-R path these values are host order.
+	 */
+	if (smcd_cdc_cursors_invalid(conn, &cdc))
+		return;
 	smc = container_of(conn, struct smc_sock, conn);
 	smc_cdc_msg_recv(smc, (struct smc_cdc_msg *)&cdc);
 }
@@ -466,6 +487,26 @@ void smcd_cdc_rx_init(struct smc_connection *conn)
 
 /***************************** init, exit, misc ******************************/
 
+/* A peer's cursors are offsets into OUR buffers: the producer cursor counts the
+ * bytes it has written into the RMB we gave it, the consumer cursor the bytes it
+ * has taken from the RMB it published to us.  Nothing else checks them.  smcr_cdc_msg_to_host()
+ * copies both into the connection, and from there smc_cdc_msg_recv_action() adds the
+ * producer difference to conn->bytes_to_rcv and the receive path uses that as a
+ * length - so a peer that reports more than the buffer holds makes the kernel read
+ * past it.
+ */
+static bool smcr_cdc_cursors_invalid(struct smc_connection *conn,
+				     struct smc_cdc_msg *cdc)
+{
+	if (!conn->rmb_desc)
+		return true;
+	if (ntohl(cdc->prod.count) > (u32)conn->rmb_desc->len)
+		return true;
+	if (ntohl(cdc->cons.count) > conn->peer_rmbe_size)
+		return true;
+	return false;
+}
+
 static void smc_cdc_rx_handler(struct ib_wc *wc, void *buf)
 {
 	struct smc_link *link = (struct smc_link *)wc->qp->qp_context;
@@ -499,6 +540,9 @@ static void smc_cdc_rx_handler(struct ib_wc *wc, void *buf)
 			   conn->local_rx_ctrl.seqno))
 		/* received seqno is old */
 		goto out;
+	if (smcr_cdc_cursors_invalid(conn, cdc))
+		/* peer cursor outside the buffer it describes */
+		goto out;
 
 	smc_cdc_msg_recv(smc, cdc);
 out:
