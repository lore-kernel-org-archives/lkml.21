Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795289639;
	b=euLjNPke3oyui7VdTGmICLB2TSsxOAoGBOu/L9j3LzhVkqZTCeEVgXhv/CUUKzqaAoXN
	 MleR8I2qzjnSfQgE1IkTsGnCpCP4PWRAjCQYItjLNmWjjFu3L8hfLjNJRQIHevGAukL/1
	 fJ0FLbjTmNpjC4Th/QFl2U5mkp6hOWOdZzi0BSGD106VH8FuSUw4ZbRVuS67dgHfXsUGs
	 djyKGicM3tvJy7B5331rdQMpTmJ3JscFXtFvMKqOyMzm135L0Y4JfeR6q7Wg+Eu+IEpWH
	 Z46tOqe9eG1TdPUmAP9RejEXYGjSXWpqxWxq0o8vZdZad8Y+cvJMewsahB87SkyJwhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795289639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qkofz/lYLKL2hpqydjvK6PT32xSgmVVrNto+vh8mHvc=;
	b=K7cBi/GrHvDzk7hDy7mlFGS6eRI5mSTEVDngyP4O4mnOBCwHUT/VX5Z6E3nDO4uItN0A
	 Ztpzubckwj4m+I+f99Uk8KWag0OBzC1zPrHf/9RAQApcmpkJzbnvxvtio1bqiuodTglFK
	 CFSkRe/5qMIU+q7S2LzuHn4LBNvX5M9Xiv+kBsxy4y1aGUuoQ1IH56bSyRFQjGRkOXxoH
	 YE8I6mwsei1hUFo+GlWuQSYz7/F3y2HP8gA+Yc5bAexEwy+jWVuMhj/J5C1mrcSLpulCW
	 nyUVvYlC6tRv+zjM3VUzAkUogN7G5eOJZNZfugWplgE9heqQhUKDPWFm0b0URU9rq3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=B3NvasS5;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36553606A333
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 19:33:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36553606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=B3NvasS5
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b3e85baf7cso1189124a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 11:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795289638; x=1795894438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qkofz/lYLKL2hpqydjvK6PT32xSgmVVrNto+vh8mHvc=;
        b=B3NvasS5R/IpAlX35qIRffdT3cwwxA+C5KhRyjduvO6OfBM5PoxUFJ34UkMCznsPKs
         +vrKPx8Z0obOdAXYWT4SbfTLGJe+7NSqTR/hbiBns8Q0974IPiWn1HvCs47vQmeAw7BM
         ZQsCXjcTImbsXzOZ+Fx+dPYlnkaFqH7reEVr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795289638; x=1795894438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qkofz/lYLKL2hpqydjvK6PT32xSgmVVrNto+vh8mHvc=;
        b=ZByXY6SKPEOMd1172Vr19LugSbZAEieIsVXtVx7o3uko++Kp3HnR59JCkLofZdy7LX
         tIObF87YeUXi61ziRWEOPABHcTHAV9CH+h3kvcSONgsYeaEjvJXI1WnHA6+UMzqlPnRD
         blRfFAJrMTZ0kZl7I2+/uL2WNrqo6Ho0ojd/9h4yL2d2my0UN5t8kOiEgNWZ8dpBZ0Y7
         dqXr2bXiotQntK+gOxDD/V9Dq/7EYubcqYZYF/ywThoNvsJrm7CnaIE1t182rUZfYb68
         EkGo9iuv9oa1qRE7hpedjkmcbUmiMA2u+zCln81BoEftqXvqsIzKhya19wUDDRsuQ9MZ
         TFxg==
X-Forwarded-Encrypted: i=1; AL+hErF1dtJ0FQ7fblTbuO67GHiOzXPBHcvBbwJKgMpv66et1Ia/Bo51KXSNp6XIst/A+bo0e1DGXQ9sxHFPICY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mJxWUwQTmmAHRnpX29M4whpkKTDjZdH+kGfBDY52p7aSxAI/P
	MbUmffVJDnF5i1eIkjEIFTd/9YF4pCE+kBVcHbwdIbiUlxGt8RvNWx843Pq7uhV6MD0=
X-Gm-Gg: AZFdTZfJbDNtCvhtzRybIXA4dX4uJpUa7CVid8Ce9JVe7MnRV7jUNTWTHULhwp/X8Mv
	67D10c9isnE8D6JZs7o0YOSJ3GxVbR4uzwLEu2n2GtNEcp6c+MiZ3+ezXQ9cEsHsOmZneNz7vZ9
	iV1kEfhcwrmbMvrf6TxFpJXblnswdg9sax4FZWeQvT6fN0X/DXcD5fHZ1uEShqpSW9IILmsV7Iy
	EEJ6cchPQ84KglpPhf/lnF9Yykwuvbiq2LFkD1yg5Ycl/DdWrpT+hvseJtkvSzsfBI4a2ZKAUir
	3S9z9NqBByL7yjM6xVl/S0Bq3zp2D31L0Bsxc4LfwQxpkPqajP5TO2adYxktG9nNeS4wwO+7g8H
	K1ukg3jv46Y8Z8N+JcNiVynqY025HB2dL1gK7fkMVzzgB6bzqCgO2JrI7UPMWi820s+41tStTnI
	/fEembK4La7sNEy4/QIJGxUCgVDfESA1gUEO6IEHAsnex/3AYW56JgYYa2aMlLyHlm5b8DJjRPf
	KwnhtfjWNSEnytkZwoLeb59ar8QIPLMAErQBpKfpFJDsboavve/QiW/GJA7PCnS6k5Nry4vyUvr
	HlXyL2rxLRR7Q/5xvesA2BtTuB+VTdVS6dRt0CdrIKFnh7MZKeqghL9jtYIiRxhpjFL2nWt22Wp
	hKgf5M4NtrLOKWz3Mki2Ko7xdH5f3StcJIZa+7S1i5Kr4kmXIcHPvXFviuOyd7X+k
X-Received: by 2002:a17:90a:d2c7:b0:3b3:fe22:273d with SMTP id 98e67ed59e1d1-3b41c95b0cdmr6070089a91.41.1795289638560;
        Sat, 21 Nov 2026 11:33:58 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b217a5bsm2686818a91.0.2026.11.21.11.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:33:58 -0800 (PST)
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
Subject: [PATCH net] net/smc: validate the peer's CDC cursors against our own buffers
Date: Sun, 22 Nov 2026 01:03:45 +0530
Message-Id: <20261121193345.2148966-2-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261121193345.2148966-1-piyus@iiitd.ac.in>
References: <20261121193345.2148966-1-piyus@iiitd.ac.in>
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
it has taken from the RMB it published to us.  Neither is checked anywhere.

smcr_cdc_msg_to_host() copies both into the connection as they arrive, and
every later user treats them as trustworthy:

 - smc_cdc_msg_recv_action() adds the producer difference to
   conn->bytes_to_rcv under a comment asserting
   "guarantee 0 <= bytes_to_rcv <= rmb_desc->len", which nothing enforces;
 - smc_cdc_handle_urg_data_arrival() reads
   *(base + conn->urg_curs.count - 1), an unbounded index into the RMB;
 - smc_rx_recvmsg() clamps only the first of its two ring chunks
   (rmb_desc->len - cons.count) and uses the remainder unclamped for the
   second, so bytes_to_rcv becomes a copy length.

A peer that reports a cursor larger than the buffer therefore makes the
kernel read past it.  With a 64 KiB RMB and a forged cursor, KASAN on
7.4.0-rc3 reports a 1-byte read in the urgent-data path and a 131072-byte
read in the receive path, the latter via _copy_to_iter() - i.e. the
out-of-bounds bytes are delivered to userspace by recvmsg().

Validate both cursors where the message is accepted, next to the existing
length and sequence-number checks, so that one test covers every consumer.
Each cursor is bounded by the buffer its own arithmetic uses: the producer
cursor by conn->rmb_desc->len as in smc_cdc_msg_recv_action(), the consumer
cursor by conn->peer_rmbe_size as in the diff_cons calculation beside it.
A cursor equal to the buffer length is legitimate (a full ring), so only a
larger one is rejected.  An out-of-range cursor cannot occur in a correct
peer, and the malformed message is dropped like any other.

Signed-off-by: Kapil Vaswani <kapil@presceralabs.ai>
Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
---
 net/smc/smc_cdc.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/net/smc/smc_cdc.c b/net/smc/smc_cdc.c
index 32d6d03df..03ff10fef 100644
--- a/net/smc/smc_cdc.c
+++ b/net/smc/smc_cdc.c
@@ -466,6 +466,26 @@ void smcd_cdc_rx_init(struct smc_connection *conn)
 
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
@@ -499,6 +519,9 @@ static void smc_cdc_rx_handler(struct ib_wc *wc, void *buf)
 			   conn->local_rx_ctrl.seqno))
 		/* received seqno is old */
 		goto out;
+	if (smcr_cdc_cursors_invalid(conn, cdc))
+		/* peer cursor outside the buffer it describes */
+		goto out;
 
 	smc_cdc_msg_recv(smc, cdc);
 out:
